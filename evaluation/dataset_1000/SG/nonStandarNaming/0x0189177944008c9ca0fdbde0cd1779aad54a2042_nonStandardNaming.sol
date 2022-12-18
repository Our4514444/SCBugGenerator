                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY199() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF161(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER874(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE934(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE881(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM549(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function DECIMALS656() external view returns (uint);	//inject NONSTANDARD NAMING
    event TRANSFER808(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL247(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD36(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB784(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB784(a, b, "SafeMath: subtraction overflow");
    }
    function SUB784(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL264(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV225(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV225(a, b, "SafeMath: division by zero");
    }
    function DIV225(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD762(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD762(a, b, "SafeMath: modulo by zero");
    }
    function MOD762(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT674(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE791(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE191(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER559(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN789(token, abi.encodeWithSelector(token.TRANSFER874.selector, to, value));
    }

    function SAFETRANSFERFROM464(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN789(token, abi.encodeWithSelector(token.TRANSFERFROM549.selector, from, to, value));
    }

    function SAFEAPPROVE547(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE934(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN789(token, abi.encodeWithSelector(token.APPROVE881.selector, spender, value));
    }
    function CALLOPTIONALRETURN789(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT674(), "SafeERC20: call to non-contract");

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
    function VAULTS872(address) external view returns (address);	//inject NONSTANDARD NAMING
}

interface Balancer {
    function JOINPOOL459(uint,uint[] calldata) external;	//inject NONSTANDARD NAMING
    function EXITPOOL895(uint,uint[] calldata) external;	//inject NONSTANDARD NAMING
}

interface MStable {
    function MINT356(address, uint) external;	//inject NONSTANDARD NAMING
    function REDEEM586(address, uint) external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

                                                                      

contract StrategyBalancerMTA {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want337 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);	//inject NONSTANDARD NAMING
    address constant public musd501 = address(0xe2f2a5C287993345a840Db3B0845fbC70f5935a5);	//inject NONSTANDARD NAMING
    address constant public balancer662 = address(0x72Cd8f4504941Bf8c5a21d1Fd83A96499FD71d2C);	//inject NONSTANDARD NAMING
    
    
    address public governance;
    address public controller;
    bool public breaker = false;
    // Supply tracks the number of `want` that we have lent out of other distro's
    uint public supply = 0;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function SETBREAKER489(bool _breaker) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        breaker = _breaker;
    }
    
    function DEPOSIT37() external {	//inject NONSTANDARD NAMING
        require(breaker == false, "!breaker");
        uint _balance = IERC20(want337).BALANCEOF161(address(this));
        uint _usdc = _balance.DIV225(2);
        IERC20(want337).SAFEAPPROVE547(musd501, 0);
        IERC20(want337).SAFEAPPROVE547(musd501, _usdc);
        
        uint _before = _balance;
        MStable(musd501).MINT356(want337,_usdc);
        uint _after = IERC20(want337).BALANCEOF161(address(this));
        supply = supply.ADD36(_before.SUB784(_after));
        
        uint _musd = IERC20(musd501).BALANCEOF161(address(this));
        
        uint _total = IERC20(balancer662).TOTALSUPPLY199();
        uint _balancerMUSD = IERC20(musd501).BALANCEOF161(balancer662);
        uint _poolAmountMUSD = _musd.MUL264(_total).DIV225(_balancerMUSD);
        
        uint _balancerUSDC = IERC20(want337).BALANCEOF161(balancer662);
        uint _poolAmountUSDC = _usdc.MUL264(_total).DIV225(_balancerUSDC);
        
        uint _poolAmountOut = _poolAmountMUSD;
        if (_poolAmountUSDC < _poolAmountOut) {
            _poolAmountOut = _poolAmountUSDC;
        }
        
        IERC20(want337).SAFEAPPROVE547(balancer662, 0);
        IERC20(want337).SAFEAPPROVE547(balancer662, _usdc);
        IERC20(musd501).SAFEAPPROVE547(balancer662, 0);
        IERC20(musd501).SAFEAPPROVE547(balancer662, _musd);
        
        uint[] memory _maxAmountIn = new uint[](2);
        _maxAmountIn[0] = _musd;
        _maxAmountIn[1] = _usdc;
        _before = IERC20(want337).BALANCEOF161(address(this));
        Balancer(balancer662).JOINPOOL459(_poolAmountOut, _maxAmountIn);
        _after = IERC20(want337).BALANCEOF161(address(this));
        supply = supply.ADD36(_before.SUB784(_after));
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW559(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(address(_asset) != want337, "!c");
        require(address(_asset) != musd501, "!c");
        require(address(_asset) != balancer662, "!c");
        balance = _asset.BALANCEOF161(address(this));
        _asset.SAFETRANSFER559(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW559(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want337).BALANCEOF161(address(this));
        if (_balance < _amount) {
            uint _withdrew = _WITHDRAWSOME434(_amount.SUB784(_balance));
            _amount = _withdrew.ADD36(_balance);
        }
        
                                                                                                                                                                                                                                                                       
        
        IERC20(want337).SAFETRANSFER559(controller, _amount);
    }
    
    function REDEEM586() external {	//inject NONSTANDARD NAMING
        MStable(musd501).REDEEM586(want337, NORMALIZE32(IERC20(musd501).BALANCEOF161(address(this))));
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL177() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL598();
        balance = IERC20(want337).BALANCEOF161(address(this));
        
                                                                                                                                                                                                                                                              
        
        IERC20(want337).SAFETRANSFER559(controller, balance);
        
    }
    
    function _WITHDRAWALL598() internal {	//inject NONSTANDARD NAMING
        uint _bpt = IERC20(balancer662).BALANCEOF161(address(this));
        uint[] memory _minAmountOut = new uint[](2);
        _minAmountOut[0] = 0;
        _minAmountOut[1] = 0;
        uint _before = IERC20(want337).BALANCEOF161(address(this));
        Balancer(balancer662).EXITPOOL895(_bpt, _minAmountOut);
        uint _after = IERC20(want337).BALANCEOF161(address(this));
        supply = supply.SUB784(_after.SUB784(_before));
        uint _musd = IERC20(musd501).BALANCEOF161(address(this));
        
        // This one is the exception because it assumes we can redeem 1 USDC
        supply = supply.SUB784(NORMALIZE32(_musd));
        MStable(musd501).REDEEM586(want337, NORMALIZE32(_musd));
    }
    
    function _WITHDRAWSOME434(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _usdc = IERC20(want337).BALANCEOF161(balancer662);
        uint _bpt = IERC20(balancer662).BALANCEOF161(address(this));
        uint _totalSupply = IERC20(balancer662).TOTALSUPPLY199();
        uint _redeem = _totalSupply.MUL264(_amount.DIV225(2)).DIV225(_usdc);
        if (_redeem > _bpt) {
            _redeem = _bpt;
        }
        uint[] memory _minAmountOut = new uint[](2);
        _minAmountOut[0] = 0;
        _minAmountOut[1] = 0;
        uint _before = IERC20(want337).BALANCEOF161(address(this));
        uint _mBefore = IERC20(musd501).BALANCEOF161(address(this));
        Balancer(balancer662).EXITPOOL895(_redeem, _minAmountOut);
        uint _mAfter = IERC20(musd501).BALANCEOF161(address(this));
        uint _musd = _mAfter.SUB784(_mBefore);
        uint _after = IERC20(want337).BALANCEOF161(address(this));
        uint _withdrew = _after.SUB784(_before);
        supply = supply.SUB784(_withdrew);
        _before = IERC20(want337).BALANCEOF161(address(this));
        supply = supply.SUB784(NORMALIZE32(_musd));
        MStable(musd501).REDEEM586(want337, NORMALIZE32(_musd));
        _after = IERC20(want337).BALANCEOF161(address(this));
        return _withdrew.ADD36(_after.SUB784(_before));
    }
    
    function NORMALIZE32(uint _amount) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _amount.MUL264(10**IERC20(want337).DECIMALS656()).DIV225(10**IERC20(musd501).DECIMALS656());
    }
    
    function BALANCEOF161() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want337).BALANCEOF161(address(this))
                .ADD36(supply)
                .ADD36(NORMALIZE32(IERC20(musd501).BALANCEOF161(address(this))));
    }
    
    
    function SETGOVERNANCE837(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER104(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}