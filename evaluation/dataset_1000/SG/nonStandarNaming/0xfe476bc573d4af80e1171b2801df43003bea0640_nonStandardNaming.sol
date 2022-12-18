                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY653() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF461(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER914(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE455(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE989(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM193(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function DECIMALS790() external view returns (uint);	//inject NONSTANDARD NAMING
    event TRANSFER15(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL535(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD986(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB230(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB230(a, b, "SafeMath: subtraction overflow");
    }
    function SUB230(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL314(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV740(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV740(a, b, "SafeMath: division by zero");
    }
    function DIV740(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD72(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD72(a, b, "SafeMath: modulo by zero");
    }
    function MOD72(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT964(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE667(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE456(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER72(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN174(token, abi.encodeWithSelector(token.TRANSFER914.selector, to, value));
    }

    function SAFETRANSFERFROM773(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN174(token, abi.encodeWithSelector(token.TRANSFERFROM193.selector, from, to, value));
    }

    function SAFEAPPROVE105(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE455(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN174(token, abi.encodeWithSelector(token.APPROVE989.selector, spender, value));
    }
    function CALLOPTIONALRETURN174(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT964(), "SafeERC20: call to non-contract");

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
    function VAULTS637(address) external view returns (address);	//inject NONSTANDARD NAMING
}

interface Balancer {
    function JOINPOOL917(uint,uint[] calldata) external;	//inject NONSTANDARD NAMING
    function EXITPOOL217(uint,uint[] calldata) external;	//inject NONSTANDARD NAMING
}

interface MStable {
    function MINT158(address, uint) external;	//inject NONSTANDARD NAMING
    function REDEEM232(address, uint) external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

                                                                      

contract StrategyBalancerMTA {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want927 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);	//inject NONSTANDARD NAMING
    address constant public musd43 = address(0xe2f2a5C287993345a840Db3B0845fbC70f5935a5);	//inject NONSTANDARD NAMING
    address constant public balancer523 = address(0x72Cd8f4504941Bf8c5a21d1Fd83A96499FD71d2C);	//inject NONSTANDARD NAMING
    
    
    address public governance;
    address public controller;
    bool public breaker = false;
    // Supply tracks the number of `want` that we have lent out of other distro's
    uint public supply = 0;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function SETBREAKER805(bool _breaker) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        breaker = _breaker;
    }
    
    function DEPOSIT849() external {	//inject NONSTANDARD NAMING
        require(breaker == false, "!breaker");
        uint _balance = IERC20(want927).BALANCEOF461(address(this));
        uint _usdc = _balance.DIV740(2);
        IERC20(want927).SAFEAPPROVE105(musd43, 0);
        IERC20(want927).SAFEAPPROVE105(musd43, _usdc);
        
        uint _before = _balance;
        MStable(musd43).MINT158(want927,_usdc);
        uint _after = IERC20(want927).BALANCEOF461(address(this));
        supply = supply.ADD986(_before.SUB230(_after));
        
        uint _musd = IERC20(musd43).BALANCEOF461(address(this));
        
        uint _total = IERC20(balancer523).TOTALSUPPLY653();
        uint _balancerMUSD = IERC20(musd43).BALANCEOF461(balancer523);
        uint _poolAmountMUSD = _musd.MUL314(_total).DIV740(_balancerMUSD);
        
        uint _balancerUSDC = IERC20(want927).BALANCEOF461(balancer523);
        uint _poolAmountUSDC = _usdc.MUL314(_total).DIV740(_balancerUSDC);
        
        uint _poolAmountOut = _poolAmountMUSD;
        if (_poolAmountUSDC < _poolAmountOut) {
            _poolAmountOut = _poolAmountUSDC;
        }
        
        IERC20(want927).SAFEAPPROVE105(balancer523, 0);
        IERC20(want927).SAFEAPPROVE105(balancer523, _usdc);
        IERC20(musd43).SAFEAPPROVE105(balancer523, 0);
        IERC20(musd43).SAFEAPPROVE105(balancer523, _musd);
        
        uint[] memory _maxAmountIn = new uint[](2);
        _maxAmountIn[0] = _musd;
        _maxAmountIn[1] = _usdc;
        _before = IERC20(want927).BALANCEOF461(address(this));
        Balancer(balancer523).JOINPOOL917(_poolAmountOut, _maxAmountIn);
        _after = IERC20(want927).BALANCEOF461(address(this));
        supply = supply.ADD986(_before.SUB230(_after));
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW916(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(address(_asset) != want927, "!c");
        require(address(_asset) != musd43, "!c");
        require(address(_asset) != balancer523, "!c");
        balance = _asset.BALANCEOF461(address(this));
        _asset.SAFETRANSFER72(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW916(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want927).BALANCEOF461(address(this));
        if (_balance < _amount) {
            uint _withdrew = _WITHDRAWSOME401(_amount.SUB230(_balance));
            _amount = _withdrew.ADD986(_balance);
        }
        
                                                                                                                                                                                                                                                                       
        
        IERC20(want927).SAFETRANSFER72(controller, _amount);
    }
    
    function REDEEM232() external {	//inject NONSTANDARD NAMING
        MStable(musd43).REDEEM232(want927, NORMALIZE65(IERC20(musd43).BALANCEOF461(address(this))));
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL299() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL998();
        balance = IERC20(want927).BALANCEOF461(address(this));
        
                                                                                                                                                                                                                                                              
        
        IERC20(want927).SAFETRANSFER72(controller, balance);
        
    }
    
    function _WITHDRAWALL998() internal {	//inject NONSTANDARD NAMING
        uint _bpt = IERC20(balancer523).BALANCEOF461(address(this));
        uint[] memory _minAmountOut = new uint[](2);
        _minAmountOut[0] = 0;
        _minAmountOut[1] = 0;
        uint _before = IERC20(want927).BALANCEOF461(address(this));
        Balancer(balancer523).EXITPOOL217(_bpt, _minAmountOut);
        uint _after = IERC20(want927).BALANCEOF461(address(this));
        supply = supply.SUB230(_after.SUB230(_before));
        uint _musd = IERC20(musd43).BALANCEOF461(address(this));
        
        // This one is the exception because it assumes we can redeem 1 USDC
        supply = supply.SUB230(NORMALIZE65(_musd));
        MStable(musd43).REDEEM232(want927, NORMALIZE65(_musd));
    }
    
    function _WITHDRAWSOME401(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _usdc = IERC20(want927).BALANCEOF461(balancer523);
        uint _bpt = IERC20(balancer523).BALANCEOF461(address(this));
        uint _totalSupply = IERC20(balancer523).TOTALSUPPLY653();
        uint _redeem = _totalSupply.MUL314(_amount.DIV740(2)).DIV740(_usdc);
        if (_redeem > _bpt) {
            _redeem = _bpt;
        }
        uint[] memory _minAmountOut = new uint[](2);
        _minAmountOut[0] = 0;
        _minAmountOut[1] = 0;
        uint _before = IERC20(want927).BALANCEOF461(address(this));
        uint _mBefore = IERC20(musd43).BALANCEOF461(address(this));
        Balancer(balancer523).EXITPOOL217(_redeem, _minAmountOut);
        uint _mAfter = IERC20(musd43).BALANCEOF461(address(this));
        uint _musd = _mAfter.SUB230(_mBefore);
        uint _after = IERC20(want927).BALANCEOF461(address(this));
        uint _withdrew = _after.SUB230(_before);
        supply = supply.SUB230(_withdrew);
        _before = IERC20(want927).BALANCEOF461(address(this));
        supply = supply.SUB230(NORMALIZE65(_musd));
        MStable(musd43).REDEEM232(want927, NORMALIZE65(_musd));
        _after = IERC20(want927).BALANCEOF461(address(this));
        return _withdrew.ADD986(_after.SUB230(_before));
    }
    
    function NORMALIZE65(uint _amount) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _amount.MUL314(10**IERC20(want927).DECIMALS790()).DIV740(10**IERC20(musd43).DECIMALS790());
    }
    
    function BALANCEOF461() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want927).BALANCEOF461(address(this))
                .ADD986(supply);
    }
    
    
    function SETGOVERNANCE981(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER870(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}