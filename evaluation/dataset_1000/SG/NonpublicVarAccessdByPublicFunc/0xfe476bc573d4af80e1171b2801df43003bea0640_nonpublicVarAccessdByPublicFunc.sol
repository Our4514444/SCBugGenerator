/**
 *Submitted for verification at Etherscan.io on 2020-07-26
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function decimals() external view returns (uint);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function isContract(address account) internal view returns (bool) {
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


interface Controller {
    function vaults(address) external view returns (address);
}

interface Balancer {
    function joinPool(uint,uint[] calldata) external;
    function exitPool(uint,uint[] calldata) external;
}

interface MStable {
    function mint(address, uint) external;
    function redeem(address, uint) external;
}

/*

 A strategy must implement the following calls;
 
 - deposit()
 - withdraw(address) must exclude any tokens used in the yield - Controller role - withdraw should return to Controller
 - withdraw(uint) - Controller | Vault role - withdraw should always return to vault
 - withdrawAll() - Controller | Vault role - withdraw should always return to vault
 - balanceOf()
 
 Where possible, strategies must remain as immutable as possible, instead of updating variables, we update the contract by linking it in the controller
 
*/

/*

 Strategy ~ 50% USDC to mUSD
 mUSD+USDC into balancer
 BAL+MTA

*/

contract StrategyBalancerMTA {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant internal want = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    address constant internal mUSD = address(0xe2f2a5C287993345a840Db3B0845fbC70f5935a5);
    address constant internal balancer = address(0x72Cd8f4504941Bf8c5a21d1Fd83A96499FD71d2C);
    
    
    address internal governance;
    address internal controller;
    bool internal breaker = false;
    // Supply tracks the number of `want` that we have lent out of other distro's
    uint internal supply = 0;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function setBreaker(bool _breaker) public {
        require(msg.sender == governance, "!governance");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        breaker = _breaker;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function deposit() external {
        require(breaker == false, "!breaker");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint _balance = IERC20(want).balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint _usdc = _balance.div(2);
        IERC20(want).safeApprove(mUSD, 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        IERC20(want).safeApprove(mUSD, _usdc);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint _before = _balance;
        MStable(mUSD).mint(want,_usdc);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint _after = IERC20(want).balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        supply = supply.add(_before.sub(_after));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint _musd = IERC20(mUSD).balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint _total = IERC20(balancer).totalSupply();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint _balancerMUSD = IERC20(mUSD).balanceOf(balancer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint _poolAmountMUSD = _musd.mul(_total).div(_balancerMUSD);
        
        uint _balancerUSDC = IERC20(want).balanceOf(balancer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint _poolAmountUSDC = _usdc.mul(_total).div(_balancerUSDC);
        
        uint _poolAmountOut = _poolAmountMUSD;
        if (_poolAmountUSDC < _poolAmountOut) {
            _poolAmountOut = _poolAmountUSDC;
        }
        
        IERC20(want).safeApprove(balancer, 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        IERC20(want).safeApprove(balancer, _usdc);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        IERC20(mUSD).safeApprove(balancer, 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        IERC20(mUSD).safeApprove(balancer, _musd);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint[] memory _maxAmountIn = new uint[](2);
        _maxAmountIn[0] = _musd;
        _maxAmountIn[1] = _usdc;
        _before = IERC20(want).balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        Balancer(balancer).joinPool(_poolAmountOut, _maxAmountIn);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _after = IERC20(want).balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        supply = supply.add(_before.sub(_after));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    // Controller only function for creating additional rewards from dust
    function withdraw(IERC20 _asset) external returns (uint balance) {
        require(msg.sender == controller, "!controller");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(address(_asset) != want, "!c");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(address(_asset) != mUSD, "!c");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(address(_asset) != balancer, "!c");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balance = _asset.balanceOf(address(this));
        _asset.safeTransfer(controller, balance);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function withdraw(uint _amount) external {
        require(msg.sender == controller, "!controller");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint _balance = IERC20(want).balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (_balance < _amount) {
            uint _withdrew = _withdrawSome(_amount.sub(_balance));
            _amount = _withdrew.add(_balance);
        }
        
        /*
        
        
        address _vault = Controller(controller).vaults(want);
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want).safeTransfer(_vault, _amount);
        
        */
        
        IERC20(want).safeTransfer(controller, _amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function redeem() external {
        MStable(mUSD).redeem(want, normalize(IERC20(mUSD).balanceOf(address(this))));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function withdrawAll() external returns (uint balance) {
        require(msg.sender == controller, "!controller");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _withdrawAll();
        balance = IERC20(want).balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        /*
        
        address _vault = Controller(controller).vaults(want);
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want).safeTransfer(_vault, balance);
        
        */
        
        IERC20(want).safeTransfer(controller, balance);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
    }
    
    function _withdrawAll() internal {
        uint _bpt = IERC20(balancer).balanceOf(address(this));
        uint[] memory _minAmountOut = new uint[](2);
        _minAmountOut[0] = 0;
        _minAmountOut[1] = 0;
        uint _before = IERC20(want).balanceOf(address(this));
        Balancer(balancer).exitPool(_bpt, _minAmountOut);
        uint _after = IERC20(want).balanceOf(address(this));
        supply = supply.sub(_after.sub(_before));
        uint _musd = IERC20(mUSD).balanceOf(address(this));
        
        // This one is the exception because it assumes we can redeem 1 USDC
        supply = supply.sub(normalize(_musd));
        MStable(mUSD).redeem(want, normalize(_musd));
    }
    
    function _withdrawSome(uint256 _amount) internal returns (uint) {
        uint _usdc = IERC20(want).balanceOf(balancer);
        uint _bpt = IERC20(balancer).balanceOf(address(this));
        uint _totalSupply = IERC20(balancer).totalSupply();
        uint _redeem = _totalSupply.mul(_amount.div(2)).div(_usdc);
        if (_redeem > _bpt) {
            _redeem = _bpt;
        }
        uint[] memory _minAmountOut = new uint[](2);
        _minAmountOut[0] = 0;
        _minAmountOut[1] = 0;
        uint _before = IERC20(want).balanceOf(address(this));
        uint _mBefore = IERC20(mUSD).balanceOf(address(this));
        Balancer(balancer).exitPool(_redeem, _minAmountOut);
        uint _mAfter = IERC20(mUSD).balanceOf(address(this));
        uint _musd = _mAfter.sub(_mBefore);
        uint _after = IERC20(want).balanceOf(address(this));
        uint _withdrew = _after.sub(_before);
        supply = supply.sub(_withdrew);
        _before = IERC20(want).balanceOf(address(this));
        supply = supply.sub(normalize(_musd));
        MStable(mUSD).redeem(want, normalize(_musd));
        _after = IERC20(want).balanceOf(address(this));
        return _withdrew.add(_after.sub(_before));
    }
    
    function normalize(uint _amount) public view returns (uint) {
        return _amount.mul(10**IERC20(want).decimals()).div(10**IERC20(mUSD).decimals());	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function balanceOf() public view returns (uint) {
        return IERC20(want).balanceOf(address(this))	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                .add(supply);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    
    function setGovernance(address _governance) external {
        require(msg.sender == governance, "!governance");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        governance = _governance;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function setController(address _controller) external {
        require(msg.sender == governance, "!governance");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        controller = _controller;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}