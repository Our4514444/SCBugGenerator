                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY170() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF197(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER994(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE136(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS995() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE493(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM238(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER242(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL741(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD606(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB24(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB24(a, b, "SafeMath: subtraction overflow");
    }
    function SUB24(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL799(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV792(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV792(a, b, "SafeMath: division by zero");
    }
    function DIV792(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD532(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD532(a, b, "SafeMath: modulo by zero");
    }
    function MOD532(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT488(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE102(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE514(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER621(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN430(token, abi.encodeWithSelector(token.TRANSFER994.selector, to, value));
    }

    function SAFETRANSFERFROM219(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN430(token, abi.encodeWithSelector(token.TRANSFERFROM238.selector, from, to, value));
    }

    function SAFEAPPROVE586(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE136(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN430(token, abi.encodeWithSelector(token.APPROVE493.selector, spender, value));
    }
    function CALLOPTIONALRETURN430(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT488(), "SafeERC20: call to non-contract");

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
    function VAULTS113(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS178() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface yERC20 {
  function DEPOSIT137(uint) external;	//inject NONSTANDARD NAMING
  function WITHDRAW898(uint) external;	//inject NONSTANDARD NAMING
  function GETPRICEPERFULLSHARE157() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface ICurveFi {

  function GET_VIRTUAL_PRICE675() external view returns (uint);	//inject NONSTANDARD NAMING
  function ADD_LIQUIDITY974(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function REMOVE_LIQUIDITY_IMBALANCE735(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 max_burn_amount
  ) external;
  function REMOVE_LIQUIDITY152(	//inject NONSTANDARD NAMING
    uint256 _amount,
    uint256[4] calldata amounts
  ) external;
  function EXCHANGE388(	//inject NONSTANDARD NAMING
    int128 from, int128 to, uint256 _from_amount, uint256 _min_to_amount
  ) external;
}

contract StrategyTUSDCurve {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want880 = address(0x0000000000085d4780B73119b644AE5ecd22b376);	//inject NONSTANDARD NAMING
    address constant public y996 = address(0x73a052500105205d34Daf004eAb301916DA8190f);	//inject NONSTANDARD NAMING
    address constant public ycrv949 = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);	//inject NONSTANDARD NAMING
    address constant public yycrv282 = address(0x5dbcF33D8c2E976c6b560249878e6F1491Bca25c);	//inject NONSTANDARD NAMING
    address constant public curve510 = address(0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51);	//inject NONSTANDARD NAMING
    
    address constant public dai473 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address constant public ydai114 = address(0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01);	//inject NONSTANDARD NAMING

    address constant public usdc787 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);	//inject NONSTANDARD NAMING
    address constant public yusdc500 = address(0xd6aD7a6750A7593E092a9B218d66C0A814a3436e);	//inject NONSTANDARD NAMING

    address constant public usdt83 = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);	//inject NONSTANDARD NAMING
    address constant public yusdt55 = address(0x83f798e925BcD4017Eb265844FDDAbb448f1707D);	//inject NONSTANDARD NAMING

    address constant public tusd665 = address(0x0000000000085d4780B73119b644AE5ecd22b376);	//inject NONSTANDARD NAMING
    address constant public ytusd112 = address(0x73a052500105205d34Daf004eAb301916DA8190f);	//inject NONSTANDARD NAMING

    
    address public governance;
    address public controller;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function GETNAME302() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyTUSDCurve";
    }
    
    function DEPOSIT137() public {	//inject NONSTANDARD NAMING
        uint _want = IERC20(want880).BALANCEOF197(address(this));
        if (_want > 0) {
            IERC20(want880).SAFEAPPROVE586(y996, 0);
            IERC20(want880).SAFEAPPROVE586(y996, _want);
            yERC20(y996).DEPOSIT137(_want);
        }
        uint _y = IERC20(y996).BALANCEOF197(address(this));
        if (_y > 0) {
            IERC20(y996).SAFEAPPROVE586(curve510, 0);
            IERC20(y996).SAFEAPPROVE586(curve510, _y);
            ICurveFi(curve510).ADD_LIQUIDITY974([0,0,0,_y],0);
        }
        uint _ycrv = IERC20(ycrv949).BALANCEOF197(address(this));
        if (_ycrv > 0) {
            IERC20(ycrv949).SAFEAPPROVE586(yycrv282, 0);
            IERC20(ycrv949).SAFEAPPROVE586(yycrv282, _ycrv);
            yERC20(yycrv282).DEPOSIT137(_ycrv);
        }
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW898(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want880 != address(_asset), "want");
        require(y996 != address(_asset), "y");
        require(ycrv949 != address(_asset), "ycrv");
        require(yycrv282 != address(_asset), "yycrv");
        balance = _asset.BALANCEOF197(address(this));
        _asset.SAFETRANSFER621(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW898(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want880).BALANCEOF197(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME126(_amount.SUB24(_balance));
            _amount = _amount.ADD606(_balance);
        }
        
        address _vault = Controller(controller).VAULTS113(address(want880));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want880).SAFETRANSFER621(_vault, _amount);
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL998() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL776();
        
        
        balance = IERC20(want880).BALANCEOF197(address(this));
        
        address _vault = Controller(controller).VAULTS113(address(want880));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want880).SAFETRANSFER621(_vault, balance);
    }
    
    function WITHDRAWTUSD776(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        IERC20(ycrv949).SAFEAPPROVE586(curve510, 0);
        IERC20(ycrv949).SAFEAPPROVE586(curve510, _amount);
        ICurveFi(curve510).REMOVE_LIQUIDITY152(_amount, [uint256(0),0,0,0]);
    
        uint256 _ydai = IERC20(ydai114).BALANCEOF197(address(this));
        uint256 _yusdc = IERC20(yusdc500).BALANCEOF197(address(this));
        uint256 _yusdt = IERC20(yusdt55).BALANCEOF197(address(this));
    
        if (_ydai > 0) {
            IERC20(ydai114).SAFEAPPROVE586(curve510, 0);
            IERC20(ydai114).SAFEAPPROVE586(curve510, _ydai);
            ICurveFi(curve510).EXCHANGE388(0, 3, _ydai, 0);
        }
        if (_yusdc > 0) {
            IERC20(yusdc500).SAFEAPPROVE586(curve510, 0);
            IERC20(yusdc500).SAFEAPPROVE586(curve510, _yusdc);
            ICurveFi(curve510).EXCHANGE388(1, 3, _yusdc, 0);
        }
        if (_yusdt > 0) {
            IERC20(yusdt55).SAFEAPPROVE586(curve510, 0);
            IERC20(yusdt55).SAFEAPPROVE586(curve510, _yusdt);
            ICurveFi(curve510).EXCHANGE388(2, 3, _yusdt, 0);
        }
        
        uint _before = IERC20(want880).BALANCEOF197(address(this));
        yERC20(ytusd112).WITHDRAW898(IERC20(ytusd112).BALANCEOF197(address(this)));
        uint _after = IERC20(want880).BALANCEOF197(address(this));
        
        return _after.SUB24(_before);
    }
    
    function _WITHDRAWALL776() internal {	//inject NONSTANDARD NAMING
        uint _yycrv = IERC20(yycrv282).BALANCEOF197(address(this));
        if (_yycrv > 0) {
            yERC20(yycrv282).WITHDRAW898(_yycrv);
            WITHDRAWTUSD776(IERC20(ycrv949).BALANCEOF197(address(this)));
        }
    }
    
    function _WITHDRAWSOME126(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        // calculate amount of ycrv to withdraw for amount of _want_
        uint _ycrv = _amount.MUL799(1e18).DIV792(ICurveFi(curve510).GET_VIRTUAL_PRICE675());
        // calculate amount of yycrv to withdraw for amount of _ycrv_
        uint _yycrv = _ycrv.MUL799(1e18).DIV792(yERC20(yycrv282).GETPRICEPERFULLSHARE157());
        uint _before = IERC20(ycrv949).BALANCEOF197(address(this));
        yERC20(yycrv282).WITHDRAW898(_yycrv);
        uint _after = IERC20(ycrv949).BALANCEOF197(address(this));
        return WITHDRAWTUSD776(_after.SUB24(_before));
    }
    
    function BALANCEOFWANT179() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want880).BALANCEOF197(address(this));
    }
    
    function BALANCEOFYYCRV718() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(yycrv282).BALANCEOF197(address(this));
    }
    
    function BALANCEOFYYCRVINYCRV371() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRV718().MUL799(yERC20(yycrv282).GETPRICEPERFULLSHARE157()).DIV792(1e18);
    }
    
    function BALANCEOFYYCRVINTUSD254() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRVINYCRV371().MUL799(ICurveFi(curve510).GET_VIRTUAL_PRICE675()).DIV792(1e18);
    }
    
    function BALANCEOFYCRV572() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(ycrv949).BALANCEOF197(address(this));
    }
    
    function BALANCEOFYCRVYTUSD6() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYCRV572().MUL799(ICurveFi(curve510).GET_VIRTUAL_PRICE675()).DIV792(1e18);
    }
    
    function BALANCEOFYCRVYTUSDTUSD45() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRVINTUSD254().MUL799(yERC20(ytusd112).GETPRICEPERFULLSHARE157()).DIV792(1e18);
    }
    
    function BALANCEOF197() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT179()
               .ADD606(BALANCEOFYCRVYTUSDTUSD45());
    }
    
    function SETGOVERNANCE436(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER662(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}