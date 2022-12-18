                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY522() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF71(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER408(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE173(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS94() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE837(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM235(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER8(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL866(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD732(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB616(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB616(a, b, "SafeMath: subtraction overflow");
    }
    function SUB616(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL46(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV112(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV112(a, b, "SafeMath: division by zero");
    }
    function DIV112(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD665(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD665(a, b, "SafeMath: modulo by zero");
    }
    function MOD665(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT723(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE381(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE328(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER480(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN27(token, abi.encodeWithSelector(token.TRANSFER408.selector, to, value));
    }

    function SAFETRANSFERFROM74(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN27(token, abi.encodeWithSelector(token.TRANSFERFROM235.selector, from, to, value));
    }

    function SAFEAPPROVE191(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE173(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN27(token, abi.encodeWithSelector(token.APPROVE837.selector, spender, value));
    }
    function CALLOPTIONALRETURN27(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT723(), "SafeERC20: call to non-contract");

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
    function VAULTS897(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS42() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface dRewards {
    function WITHDRAW737(uint) external;	//inject NONSTANDARD NAMING
    function GETREWARD600() external;	//inject NONSTANDARD NAMING
    function STAKE67(uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF71(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EXIT103() external;	//inject NONSTANDARD NAMING
}

interface dERC20 {
  function MINT97(address, uint256) external;	//inject NONSTANDARD NAMING
  function REDEEM109(address, uint) external;	//inject NONSTANDARD NAMING
  function GETTOKENBALANCE677(address) external view returns (uint);	//inject NONSTANDARD NAMING
  function GETEXCHANGERATE117() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface Uni {
    function SWAPEXACTTOKENSFORTOKENS986(uint, uint, address[] calldata, address, uint) external;	//inject NONSTANDARD NAMING
}

contract StrategyDForceDAI {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want898 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address constant public ddai359 = address(0x02285AcaafEB533e03A7306C55EC031297df9224);	//inject NONSTANDARD NAMING
    address constant public pool159 = address(0xD2fA07cD6Cd4A5A96aa86BacfA6E50bB3aaDBA8B);	//inject NONSTANDARD NAMING
    address constant public df585 = address(0x431ad2ff6a9C365805eBaD47Ee021148d6f7DBe0);	//inject NONSTANDARD NAMING
    address constant public uni237 = address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING
    address constant public weth136 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); // used for df <> weth <> usdc route	//inject NONSTANDARD NAMING
    
    uint public performanceFee = 5000;
    uint constant public performancemax10 = 10000;	//inject NONSTANDARD NAMING
    
    uint public withdrawalFee = 50;
    uint constant public withdrawalmax501 = 10000;	//inject NONSTANDARD NAMING
    
    address public governance;
    address public controller;
    address public strategist;
    
    constructor(address _controller) public {
        governance = msg.sender;
        strategist = msg.sender;
        controller = _controller;
    }
    
    function GETNAME800() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyDForceDAI";
    }
    
    function SETSTRATEGIST617(address _strategist) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        strategist = _strategist;
    }
    
    function SETWITHDRAWALFEE530(uint _withdrawalFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        withdrawalFee = _withdrawalFee;
    }
    
    function SETPERFORMANCEFEE92(uint _performanceFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        performanceFee = _performanceFee;
    }
    
    function DEPOSIT766() public {	//inject NONSTANDARD NAMING
        uint _want = IERC20(want898).BALANCEOF71(address(this));
        if (_want > 0) {
            IERC20(want898).SAFEAPPROVE191(ddai359, 0);
            IERC20(want898).SAFEAPPROVE191(ddai359, _want);
            dERC20(ddai359).MINT97(address(this), _want);
        }
        
        uint _d = IERC20(ddai359).BALANCEOF71(address(this));
        if (_d > 0) {
            IERC20(ddai359).SAFEAPPROVE191(pool159, 0);
            IERC20(ddai359).SAFEAPPROVE191(pool159, _d);
            dRewards(pool159).STAKE67(_d);
        }
        
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW737(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want898 != address(_asset), "want");
        require(ddai359 != address(_asset), "ddai");
        balance = _asset.BALANCEOF71(address(this));
        _asset.SAFETRANSFER480(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW737(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want898).BALANCEOF71(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME443(_amount.SUB616(_balance));
            _amount = _amount.ADD732(_balance);
        }
        
        uint _fee = _amount.MUL46(withdrawalFee).DIV112(withdrawalmax501);
        
        
        IERC20(want898).SAFETRANSFER480(Controller(controller).REWARDS42(), _fee);
        address _vault = Controller(controller).VAULTS897(address(want898));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        
        IERC20(want898).SAFETRANSFER480(_vault, _amount.SUB616(_fee));
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL243() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL832();
        
        
        balance = IERC20(want898).BALANCEOF71(address(this));
        
        address _vault = Controller(controller).VAULTS897(address(want898));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want898).SAFETRANSFER480(_vault, balance);
    }
    
    function _WITHDRAWALL832() internal {	//inject NONSTANDARD NAMING
        dRewards(pool159).EXIT103();
        uint _d = IERC20(ddai359).BALANCEOF71(address(this));
        if (_d > 0) {
            dERC20(ddai359).REDEEM109(address(this),_d);
        }
    }
    
    function HARVEST54() public {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == governance, "!authorized");
        dRewards(pool159).GETREWARD600();
        uint _df = IERC20(df585).BALANCEOF71(address(this));
        if (_df > 0) {
            IERC20(df585).SAFEAPPROVE191(uni237, 0);
            IERC20(df585).SAFEAPPROVE191(uni237, _df);
            
            address[] memory path = new address[](3);
            path[0] = df585;
            path[1] = weth136;
            path[2] = want898;
            
            Uni(uni237).SWAPEXACTTOKENSFORTOKENS986(_df, uint(0), path, address(this), now.ADD732(1800));
        }
        uint _want = IERC20(want898).BALANCEOF71(address(this));
        if (_want > 0) {
            uint _fee = _want.MUL46(performanceFee).DIV112(performancemax10);
            IERC20(want898).SAFETRANSFER480(Controller(controller).REWARDS42(), _fee);
            DEPOSIT766();
        }
    }
    
    function _WITHDRAWSOME443(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _d = _amount.MUL46(1e18).DIV112(dERC20(ddai359).GETEXCHANGERATE117());
        uint _before = IERC20(ddai359).BALANCEOF71(address(this));
        dRewards(pool159).WITHDRAW737(_d);
        uint _after = IERC20(ddai359).BALANCEOF71(address(this));
        uint _withdrew = _after.SUB616(_before);
        _before = IERC20(want898).BALANCEOF71(address(this));
        dERC20(ddai359).REDEEM109(address(this), _withdrew);
        _after = IERC20(want898).BALANCEOF71(address(this));
        _withdrew = _after.SUB616(_before);
        return _withdrew;
    }
    
    function BALANCEOFWANT769() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want898).BALANCEOF71(address(this));
    }
    
    function BALANCEOFPOOL574() public view returns (uint) {	//inject NONSTANDARD NAMING
        return (dRewards(pool159).BALANCEOF71(address(this))).MUL46(dERC20(ddai359).GETEXCHANGERATE117()).DIV112(1e18);
    }
    
    function GETEXCHANGERATE117() public view returns (uint) {	//inject NONSTANDARD NAMING
        return dERC20(ddai359).GETEXCHANGERATE117();
    }
    
    function BALANCEOFD765() public view returns (uint) {	//inject NONSTANDARD NAMING
        return dERC20(ddai359).GETTOKENBALANCE677(address(this));
    }
    
    function BALANCEOF71() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT769()
               .ADD732(BALANCEOFD765())
               .ADD732(BALANCEOFPOOL574());
    }
    
    function SETGOVERNANCE725(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER546(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}