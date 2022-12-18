                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY459() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF707(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER39(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE109(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS144() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE606(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM785(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER362(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL685(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD84(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB947(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB947(a, b, "SafeMath: subtraction overflow");
    }
    function SUB947(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL490(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV922(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV922(a, b, "SafeMath: division by zero");
    }
    function DIV922(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD882(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD882(a, b, "SafeMath: modulo by zero");
    }
    function MOD882(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT463(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE489(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE669(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER882(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN208(token, abi.encodeWithSelector(token.TRANSFER39.selector, to, value));
    }

    function SAFETRANSFERFROM869(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN208(token, abi.encodeWithSelector(token.TRANSFERFROM785.selector, from, to, value));
    }

    function SAFEAPPROVE694(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE109(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN208(token, abi.encodeWithSelector(token.APPROVE606.selector, spender, value));
    }
    function CALLOPTIONALRETURN208(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT463(), "SafeERC20: call to non-contract");

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
    function VAULTS404(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS133() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface yERC20 {
  function DEPOSIT864(uint) external;	//inject NONSTANDARD NAMING
  function WITHDRAW890(uint) external;	//inject NONSTANDARD NAMING
  function GETPRICEPERFULLSHARE800() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface ICurveFi {

  function GET_VIRTUAL_PRICE484() external view returns (uint);	//inject NONSTANDARD NAMING
  function ADD_LIQUIDITY861(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function REMOVE_LIQUIDITY_IMBALANCE220(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 max_burn_amount
  ) external;
  function REMOVE_LIQUIDITY21(	//inject NONSTANDARD NAMING
    uint256 _amount,
    uint256[4] calldata amounts
  ) external;
  function EXCHANGE900(	//inject NONSTANDARD NAMING
    int128 from, int128 to, uint256 _from_amount, uint256 _min_to_amount
  ) external;
}

contract StrategyTUSDCurve {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want166 = address(0x0000000000085d4780B73119b644AE5ecd22b376);	//inject NONSTANDARD NAMING
    address constant public y623 = address(0x73a052500105205d34Daf004eAb301916DA8190f);	//inject NONSTANDARD NAMING
    address constant public ycrv689 = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);	//inject NONSTANDARD NAMING
    address constant public yycrv104 = address(0x5dbcF33D8c2E976c6b560249878e6F1491Bca25c);	//inject NONSTANDARD NAMING
    address constant public curve970 = address(0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51);	//inject NONSTANDARD NAMING
    
    address constant public dai522 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address constant public ydai137 = address(0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01);	//inject NONSTANDARD NAMING

    address constant public usdc721 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);	//inject NONSTANDARD NAMING
    address constant public yusdc253 = address(0xd6aD7a6750A7593E092a9B218d66C0A814a3436e);	//inject NONSTANDARD NAMING

    address constant public usdt693 = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);	//inject NONSTANDARD NAMING
    address constant public yusdt616 = address(0x83f798e925BcD4017Eb265844FDDAbb448f1707D);	//inject NONSTANDARD NAMING

    address constant public tusd958 = address(0x0000000000085d4780B73119b644AE5ecd22b376);	//inject NONSTANDARD NAMING
    address constant public ytusd797 = address(0x73a052500105205d34Daf004eAb301916DA8190f);	//inject NONSTANDARD NAMING

    
    address public governance;
    address public controller;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function GETNAME823() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyTUSDCurve";
    }
    
    function DEPOSIT864() public {	//inject NONSTANDARD NAMING
        uint _want = IERC20(want166).BALANCEOF707(address(this));
        if (_want > 0) {
            IERC20(want166).SAFEAPPROVE694(y623, 0);
            IERC20(want166).SAFEAPPROVE694(y623, _want);
            yERC20(y623).DEPOSIT864(_want);
        }
        uint _y = IERC20(y623).BALANCEOF707(address(this));
        if (_y > 0) {
            IERC20(y623).SAFEAPPROVE694(curve970, 0);
            IERC20(y623).SAFEAPPROVE694(curve970, _y);
            ICurveFi(curve970).ADD_LIQUIDITY861([0,0,0,_y],0);
        }
        uint _ycrv = IERC20(ycrv689).BALANCEOF707(address(this));
        if (_ycrv > 0) {
            IERC20(ycrv689).SAFEAPPROVE694(yycrv104, 0);
            IERC20(ycrv689).SAFEAPPROVE694(yycrv104, _ycrv);
            yERC20(yycrv104).DEPOSIT864(_ycrv);
        }
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW890(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want166 != address(_asset), "want");
        require(y623 != address(_asset), "y");
        require(ycrv689 != address(_asset), "ycrv");
        require(yycrv104 != address(_asset), "yycrv");
        balance = _asset.BALANCEOF707(address(this));
        _asset.SAFETRANSFER882(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW890(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want166).BALANCEOF707(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME883(_amount.SUB947(_balance));
            _amount = _amount.ADD84(_balance);
        }
        
        address _vault = Controller(controller).VAULTS404(address(want166));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want166).SAFETRANSFER882(_vault, _amount);
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL253() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL387();
        
        
        balance = IERC20(want166).BALANCEOF707(address(this));
        
        address _vault = Controller(controller).VAULTS404(address(want166));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want166).SAFETRANSFER882(_vault, balance);
    }
    
    function WITHDRAWTUSD90(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        IERC20(ycrv689).SAFEAPPROVE694(curve970, 0);
        IERC20(ycrv689).SAFEAPPROVE694(curve970, _amount);
        ICurveFi(curve970).REMOVE_LIQUIDITY21(_amount, [uint256(0),0,0,0]);
    
        uint256 _ydai = IERC20(ydai137).BALANCEOF707(address(this));
        uint256 _yusdc = IERC20(yusdc253).BALANCEOF707(address(this));
        uint256 _yusdt = IERC20(yusdt616).BALANCEOF707(address(this));
    
        if (_ydai > 0) {
            IERC20(ydai137).SAFEAPPROVE694(curve970, 0);
            IERC20(ydai137).SAFEAPPROVE694(curve970, _ydai);
            ICurveFi(curve970).EXCHANGE900(0, 3, _ydai, 0);
        }
        if (_yusdc > 0) {
            IERC20(yusdc253).SAFEAPPROVE694(curve970, 0);
            IERC20(yusdc253).SAFEAPPROVE694(curve970, _yusdc);
            ICurveFi(curve970).EXCHANGE900(1, 3, _yusdc, 0);
        }
        if (_yusdt > 0) {
            IERC20(yusdt616).SAFEAPPROVE694(curve970, 0);
            IERC20(yusdt616).SAFEAPPROVE694(curve970, _yusdt);
            ICurveFi(curve970).EXCHANGE900(2, 3, _yusdt, 0);
        }
        
        uint _before = IERC20(want166).BALANCEOF707(address(this));
        yERC20(ytusd797).WITHDRAW890(IERC20(ytusd797).BALANCEOF707(address(this)));
        uint _after = IERC20(want166).BALANCEOF707(address(this));
        
        return _after.SUB947(_before);
    }
    
    function _WITHDRAWALL387() internal {	//inject NONSTANDARD NAMING
        uint _yycrv = IERC20(yycrv104).BALANCEOF707(address(this));
        if (_yycrv > 0) {
            yERC20(yycrv104).WITHDRAW890(_yycrv);
            WITHDRAWTUSD90(IERC20(ycrv689).BALANCEOF707(address(this)));
        }
    }
    
    function _WITHDRAWSOME883(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        // calculate amount of ycrv to withdraw for amount of _want_
        uint _ycrv = _amount.MUL490(1e18).DIV922(ICurveFi(curve970).GET_VIRTUAL_PRICE484());
        // calculate amount of yycrv to withdraw for amount of _ycrv_
        uint _yycrv = _ycrv.MUL490(1e18).DIV922(yERC20(yycrv104).GETPRICEPERFULLSHARE800());
        uint _before = IERC20(ycrv689).BALANCEOF707(address(this));
        yERC20(yycrv104).WITHDRAW890(_yycrv);
        uint _after = IERC20(ycrv689).BALANCEOF707(address(this));
        return WITHDRAWTUSD90(_after.SUB947(_before));
    }
    
    function BALANCEOFWANT521() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want166).BALANCEOF707(address(this));
    }
    
    function BALANCEOFYYCRV588() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(yycrv104).BALANCEOF707(address(this));
    }
    
    function BALANCEOFYYCRVINYCRV174() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRV588().MUL490(yERC20(yycrv104).GETPRICEPERFULLSHARE800()).DIV922(1e18);
    }
    
    function BALANCEOFYYCRVINTUSD271() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRVINYCRV174().MUL490(ICurveFi(curve970).GET_VIRTUAL_PRICE484()).DIV922(1e18);
    }
    
    function BALANCEOFYCRV829() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(ycrv689).BALANCEOF707(address(this));
    }
    
    function BALANCEOFYCRVYTUSD977() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYCRV829().MUL490(ICurveFi(curve970).GET_VIRTUAL_PRICE484()).DIV922(1e18);
    }
    
    function BALANCEOFYCRVYTUSDTUSD803() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYCRVYTUSD977().MUL490(yERC20(ytusd797).GETPRICEPERFULLSHARE800()).DIV922(1e18);
    }
    
    function BALANCEOF707() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT521()
               .ADD84(BALANCEOFYCRVYTUSDTUSD803());
    }
    
    function SETGOVERNANCE950(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER76(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}