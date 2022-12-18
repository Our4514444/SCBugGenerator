                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY755() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF717(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER990(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE400(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS458() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE657(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM348(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER527(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL810(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD168(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB299(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB299(a, b, "SafeMath: subtraction overflow");
    }
    function SUB299(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL654(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV768(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV768(a, b, "SafeMath: division by zero");
    }
    function DIV768(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD332(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD332(a, b, "SafeMath: modulo by zero");
    }
    function MOD332(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT540(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE923(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE825(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER708(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN329(token, abi.encodeWithSelector(token.TRANSFER990.selector, to, value));
    }

    function SAFETRANSFERFROM465(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN329(token, abi.encodeWithSelector(token.TRANSFERFROM348.selector, from, to, value));
    }

    function SAFEAPPROVE961(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE400(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN329(token, abi.encodeWithSelector(token.APPROVE657.selector, spender, value));
    }
    function CALLOPTIONALRETURN329(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT540(), "SafeERC20: call to non-contract");

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
    function VAULTS875(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS900() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface dRewards {
    function WITHDRAW443(uint) external;	//inject NONSTANDARD NAMING
    function GETREWARD356() external;	//inject NONSTANDARD NAMING
    function STAKE715(uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF717(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EXIT321() external;	//inject NONSTANDARD NAMING
}

interface dERC20 {
  function MINT865(address, uint256) external;	//inject NONSTANDARD NAMING
  function REDEEM93(address, uint) external;	//inject NONSTANDARD NAMING
  function GETTOKENBALANCE359(address) external view returns (uint);	//inject NONSTANDARD NAMING
  function GETEXCHANGERATE861() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface Uni {
    function SWAPEXACTTOKENSFORTOKENS953(uint, uint, address[] calldata, address, uint) external;	//inject NONSTANDARD NAMING
}

contract StrategyDForceUSDC {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want664 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48); // USDC	//inject NONSTANDARD NAMING
    address constant public dusdc871 = address(0x16c9cF62d8daC4a38FB50Ae5fa5d51E9170F3179);	//inject NONSTANDARD NAMING
    address constant public pool243 = address(0xB71dEFDd6240c45746EC58314a01dd6D833fD3b5);	//inject NONSTANDARD NAMING
    address constant public df391 = address(0x431ad2ff6a9C365805eBaD47Ee021148d6f7DBe0);	//inject NONSTANDARD NAMING
    address constant public uni618 = address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING
    address constant public weth52 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); // used for df <> weth <> usdc route	//inject NONSTANDARD NAMING
    
    uint public performanceFee = 5000;
    uint constant public performancemax867 = 10000;	//inject NONSTANDARD NAMING
    
    uint public withdrawalFee = 500;
    uint constant public withdrawalmax148 = 10000;	//inject NONSTANDARD NAMING
    
    address public governance;
    address public controller;
    address public strategist;
    
    constructor(address _controller) public {
        governance = msg.sender;
        strategist = msg.sender;
        controller = _controller;
    }
    
    function SETSTRATEGIST554(address _strategist) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        strategist = _strategist;
    }
    
    function SETWITHDRAWALFEE147(uint _withdrawalFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        withdrawalFee = _withdrawalFee;
    }
    
    function SETPERFORMANCEFEE180(uint _performanceFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        performanceFee = _performanceFee;
    }
    
    function DEPOSIT410() public {	//inject NONSTANDARD NAMING
        uint _want = IERC20(want664).BALANCEOF717(address(this));
        if (_want > 0) {
            IERC20(want664).SAFEAPPROVE961(dusdc871, 0);
            IERC20(want664).SAFEAPPROVE961(dusdc871, _want);
            dERC20(dusdc871).MINT865(address(this), _want);
        }
        
        uint _dusdc = IERC20(dusdc871).BALANCEOF717(address(this));
        if (_dusdc > 0) {
            IERC20(dusdc871).SAFEAPPROVE961(pool243, 0);
            IERC20(dusdc871).SAFEAPPROVE961(pool243, _dusdc);
            dRewards(pool243).STAKE715(_dusdc);
        }
        
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW443(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want664 != address(_asset), "want");
        require(dusdc871 != address(_asset), "dusdc");
        balance = _asset.BALANCEOF717(address(this));
        _asset.SAFETRANSFER708(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW443(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want664).BALANCEOF717(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME184(_amount.SUB299(_balance));
            _amount = _amount.ADD168(_balance);
        }
        
        uint _fee = _amount.MUL654(withdrawalFee).DIV768(withdrawalmax148);
        
        
        IERC20(want664).SAFETRANSFER708(Controller(controller).REWARDS900(), _fee);
        address _vault = Controller(controller).VAULTS875(address(want664));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        
        IERC20(want664).SAFETRANSFER708(_vault, _amount.SUB299(_fee));
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL840() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL43();
        
        
        balance = IERC20(want664).BALANCEOF717(address(this));
        
        address _vault = Controller(controller).VAULTS875(address(want664));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want664).SAFETRANSFER708(_vault, balance);
    }
    
    function _WITHDRAWALL43() internal {	//inject NONSTANDARD NAMING
        dRewards(pool243).EXIT321();
        uint _dusdc = IERC20(dusdc871).BALANCEOF717(address(this));
        if (_dusdc > 0) {
            dERC20(dusdc871).REDEEM93(address(this),_dusdc);
        }
    }
    
    function HARVEST247() public {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == governance, "!authorized");
        dRewards(pool243).GETREWARD356();
        uint _df = IERC20(df391).BALANCEOF717(address(this));
        if (_df > 0) {
            IERC20(df391).SAFEAPPROVE961(uni618, 0);
            IERC20(df391).SAFEAPPROVE961(uni618, _df);
            
            address[] memory path = new address[](3);
            path[0] = df391;
            path[1] = weth52;
            path[2] = want664;
            
            Uni(uni618).SWAPEXACTTOKENSFORTOKENS953(_df, uint(0), path, address(this), now.ADD168(1800));
        }
        uint _want = IERC20(want664).BALANCEOF717(address(this));
        if (_want > 0) {
            uint _fee = _want.MUL654(performanceFee).DIV768(performancemax867);
            IERC20(want664).SAFETRANSFER708(Controller(controller).REWARDS900(), _fee);
            DEPOSIT410();
        }
    }
    
    function _WITHDRAWSOME184(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _dusdc = _amount.MUL654(1e18).DIV768(dERC20(dusdc871).GETEXCHANGERATE861());
        uint _before = IERC20(dusdc871).BALANCEOF717(address(this));
        dRewards(pool243).WITHDRAW443(_dusdc);
        uint _after = IERC20(dusdc871).BALANCEOF717(address(this));
        uint _withdrew = _after.SUB299(_before);
        _before = IERC20(want664).BALANCEOF717(address(this));
        dERC20(dusdc871).REDEEM93(address(this), _withdrew);
        _after = IERC20(want664).BALANCEOF717(address(this));
        _withdrew = _after.SUB299(_before);
        return _withdrew;
    }
    
    function BALANCEOFWANT738() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want664).BALANCEOF717(address(this));
    }
    
    function BALANCEOFPOOL917() public view returns (uint) {	//inject NONSTANDARD NAMING
        return (dRewards(pool243).BALANCEOF717(address(this))).MUL654(dERC20(dusdc871).GETEXCHANGERATE861()).DIV768(1e18);
    }
    
    function GETEXCHANGERATE861() public view returns (uint) {	//inject NONSTANDARD NAMING
        return dERC20(dusdc871).GETEXCHANGERATE861();
    }
    
    function BALANCEOFDUSDC984() public view returns (uint) {	//inject NONSTANDARD NAMING
        return dERC20(dusdc871).GETTOKENBALANCE359(address(this));
    }
    
    function BALANCEOF717() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT738()
               .ADD168(BALANCEOFDUSDC984())
               .ADD168(BALANCEOFPOOL917());
    }
    
    function SETGOVERNANCE995(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER289(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}