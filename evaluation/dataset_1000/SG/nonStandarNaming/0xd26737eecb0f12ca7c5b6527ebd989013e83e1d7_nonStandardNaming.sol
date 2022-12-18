                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY590() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF527(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER25(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE452(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS24() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE717(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM639(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER510(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL157(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD871(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB548(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB548(a, b, "SafeMath: subtraction overflow");
    }
    function SUB548(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL900(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV213(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV213(a, b, "SafeMath: division by zero");
    }
    function DIV213(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD443(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD443(a, b, "SafeMath: modulo by zero");
    }
    function MOD443(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT69(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE135(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE851(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER172(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN955(token, abi.encodeWithSelector(token.TRANSFER25.selector, to, value));
    }

    function SAFETRANSFERFROM212(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN955(token, abi.encodeWithSelector(token.TRANSFERFROM639.selector, from, to, value));
    }

    function SAFEAPPROVE699(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE452(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN955(token, abi.encodeWithSelector(token.APPROVE717.selector, spender, value));
    }
    function CALLOPTIONALRETURN955(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT69(), "SafeERC20: call to non-contract");

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
    function VAULTS218(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS254() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface dRewards {
    function WITHDRAW375(uint) external;	//inject NONSTANDARD NAMING
    function GETREWARD261() external;	//inject NONSTANDARD NAMING
    function STAKE454(uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF527(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EXIT374() external;	//inject NONSTANDARD NAMING
}

interface dERC20 {
  function MINT800(address, uint256) external;	//inject NONSTANDARD NAMING
  function REDEEM577(address, uint) external;	//inject NONSTANDARD NAMING
  function GETTOKENBALANCE142(address) external view returns (uint);	//inject NONSTANDARD NAMING
  function GETEXCHANGERATE414() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface Uni {
    function SWAPEXACTTOKENSFORTOKENS906(uint, uint, address[] calldata, address, uint) external;	//inject NONSTANDARD NAMING
}

contract StrategyDForceUSDT {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want171 = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);	//inject NONSTANDARD NAMING
    address constant public d719 = address(0x868277d475E0e475E38EC5CdA2d9C83B5E1D9fc8);	//inject NONSTANDARD NAMING
    address constant public pool828 = address(0x324EebDAa45829c6A8eE903aFBc7B61AF48538df);	//inject NONSTANDARD NAMING
    address constant public df882 = address(0x431ad2ff6a9C365805eBaD47Ee021148d6f7DBe0);	//inject NONSTANDARD NAMING
    address constant public uni639 = address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING
    address constant public weth900 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); // used for df <> weth <> usdc route	//inject NONSTANDARD NAMING
    
    uint public performanceFee = 5000;
    uint constant public performancemax298 = 10000;	//inject NONSTANDARD NAMING
    
    uint public withdrawalFee = 50;
    uint constant public withdrawalmax620 = 10000;	//inject NONSTANDARD NAMING
    
    address public governance;
    address public controller;
    address public strategist;
    
    constructor(address _controller) public {
        governance = msg.sender;
        strategist = msg.sender;
        controller = _controller;
    }
    
    function GETNAME329() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyDForceUSDT";
    }
    
    function SETSTRATEGIST666(address _strategist) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        strategist = _strategist;
    }
    
    function SETWITHDRAWALFEE54(uint _withdrawalFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        withdrawalFee = _withdrawalFee;
    }
    
    function SETPERFORMANCEFEE146(uint _performanceFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        performanceFee = _performanceFee;
    }
    
    function DEPOSIT161() public {	//inject NONSTANDARD NAMING
        uint _want = IERC20(want171).BALANCEOF527(address(this));
        if (_want > 0) {
            IERC20(want171).SAFEAPPROVE699(d719, 0);
            IERC20(want171).SAFEAPPROVE699(d719, _want);
            dERC20(d719).MINT800(address(this), _want);
        }
        
        uint _d = IERC20(d719).BALANCEOF527(address(this));
        if (_d > 0) {
            IERC20(d719).SAFEAPPROVE699(pool828, 0);
            IERC20(d719).SAFEAPPROVE699(pool828, _d);
            dRewards(pool828).STAKE454(_d);
        }
        
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW375(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want171 != address(_asset), "want");
        require(d719 != address(_asset), "d");
        balance = _asset.BALANCEOF527(address(this));
        _asset.SAFETRANSFER172(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW375(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want171).BALANCEOF527(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME383(_amount.SUB548(_balance));
            _amount = _amount.ADD871(_balance);
        }
        
        uint _fee = _amount.MUL900(withdrawalFee).DIV213(withdrawalmax620);
        
        
        IERC20(want171).SAFETRANSFER172(Controller(controller).REWARDS254(), _fee);
        address _vault = Controller(controller).VAULTS218(address(want171));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        
        IERC20(want171).SAFETRANSFER172(_vault, _amount.SUB548(_fee));
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL405() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL238();
        
        
        balance = IERC20(want171).BALANCEOF527(address(this));
        
        address _vault = Controller(controller).VAULTS218(address(want171));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want171).SAFETRANSFER172(_vault, balance);
    }
    
    function _WITHDRAWALL238() internal {	//inject NONSTANDARD NAMING
        dRewards(pool828).EXIT374();
        uint _d = IERC20(d719).BALANCEOF527(address(this));
        if (_d > 0) {
            dERC20(d719).REDEEM577(address(this),_d);
        }
    }
    
    function HARVEST185() public {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == governance, "!authorized");
        dRewards(pool828).GETREWARD261();
        uint _df = IERC20(df882).BALANCEOF527(address(this));
        if (_df > 0) {
            IERC20(df882).SAFEAPPROVE699(uni639, 0);
            IERC20(df882).SAFEAPPROVE699(uni639, _df);
            
            address[] memory path = new address[](3);
            path[0] = df882;
            path[1] = weth900;
            path[2] = want171;
            
            Uni(uni639).SWAPEXACTTOKENSFORTOKENS906(_df, uint(0), path, address(this), now.ADD871(1800));
        }
        uint _want = IERC20(want171).BALANCEOF527(address(this));
        if (_want > 0) {
            uint _fee = _want.MUL900(performanceFee).DIV213(performancemax298);
            IERC20(want171).SAFETRANSFER172(Controller(controller).REWARDS254(), _fee);
            DEPOSIT161();
        }
    }
    
    function _WITHDRAWSOME383(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _d = _amount.MUL900(1e18).DIV213(dERC20(d719).GETEXCHANGERATE414());
        uint _before = IERC20(d719).BALANCEOF527(address(this));
        dRewards(pool828).WITHDRAW375(_d);
        uint _after = IERC20(d719).BALANCEOF527(address(this));
        uint _withdrew = _after.SUB548(_before);
        _before = IERC20(want171).BALANCEOF527(address(this));
        dERC20(d719).REDEEM577(address(this), _withdrew);
        _after = IERC20(want171).BALANCEOF527(address(this));
        _withdrew = _after.SUB548(_before);
        return _withdrew;
    }
    
    function BALANCEOFWANT865() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want171).BALANCEOF527(address(this));
    }
    
    function BALANCEOFPOOL133() public view returns (uint) {	//inject NONSTANDARD NAMING
        return (dRewards(pool828).BALANCEOF527(address(this))).MUL900(dERC20(d719).GETEXCHANGERATE414()).DIV213(1e18);
    }
    
    function GETEXCHANGERATE414() public view returns (uint) {	//inject NONSTANDARD NAMING
        return dERC20(d719).GETEXCHANGERATE414();
    }
    
    function BALANCEOFD13() public view returns (uint) {	//inject NONSTANDARD NAMING
        return dERC20(d719).GETTOKENBALANCE142(address(this));
    }
    
    function BALANCEOF527() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT865()
               .ADD871(BALANCEOFD13())
               .ADD871(BALANCEOFPOOL133());
    }
    
    function SETGOVERNANCE44(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER448(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}