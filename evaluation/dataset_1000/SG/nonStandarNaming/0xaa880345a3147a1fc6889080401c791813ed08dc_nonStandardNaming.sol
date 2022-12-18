                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY638() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF170(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER598(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE829(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS294() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE705(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM226(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER594(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL913(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD907(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB852(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB852(a, b, "SafeMath: subtraction overflow");
    }
    function SUB852(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL336(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV411(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV411(a, b, "SafeMath: division by zero");
    }
    function DIV411(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD218(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD218(a, b, "SafeMath: modulo by zero");
    }
    function MOD218(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT721(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE184(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE38(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER114(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN663(token, abi.encodeWithSelector(token.TRANSFER598.selector, to, value));
    }

    function SAFETRANSFERFROM50(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN663(token, abi.encodeWithSelector(token.TRANSFERFROM226.selector, from, to, value));
    }

    function SAFEAPPROVE24(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE829(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN663(token, abi.encodeWithSelector(token.APPROVE705.selector, spender, value));
    }
    function CALLOPTIONALRETURN663(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT721(), "SafeERC20: call to non-contract");

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
    function VAULTS574(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS266() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface yERC20 {
  function DEPOSIT36(uint) external;	//inject NONSTANDARD NAMING
  function WITHDRAW893(uint) external;	//inject NONSTANDARD NAMING
  function GETPRICEPERFULLSHARE797() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface ICurveFi {

  function GET_VIRTUAL_PRICE745() external view returns (uint);	//inject NONSTANDARD NAMING
  function ADD_LIQUIDITY455(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function REMOVE_LIQUIDITY_IMBALANCE401(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 max_burn_amount
  ) external;
  function REMOVE_LIQUIDITY558(	//inject NONSTANDARD NAMING
    uint256 _amount,
    uint256[4] calldata amounts
  ) external;
  function EXCHANGE916(	//inject NONSTANDARD NAMING
    int128 from, int128 to, uint256 _from_amount, uint256 _min_to_amount
  ) external;
}

contract StrategyDAICurve {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want371 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address constant public y454 = address(0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01);	//inject NONSTANDARD NAMING
    address constant public ycrv21 = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);	//inject NONSTANDARD NAMING
    address constant public yycrv162 = address(0x5dbcF33D8c2E976c6b560249878e6F1491Bca25c);	//inject NONSTANDARD NAMING
    address constant public curve64 = address(0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51);	//inject NONSTANDARD NAMING
    
    address constant public dai11 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address constant public ydai803 = address(0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01);	//inject NONSTANDARD NAMING

    address constant public usdc671 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);	//inject NONSTANDARD NAMING
    address constant public yusdc421 = address(0xd6aD7a6750A7593E092a9B218d66C0A814a3436e);	//inject NONSTANDARD NAMING

    address constant public usdt156 = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);	//inject NONSTANDARD NAMING
    address constant public yusdt357 = address(0x83f798e925BcD4017Eb265844FDDAbb448f1707D);	//inject NONSTANDARD NAMING

    address constant public tusd293 = address(0x0000000000085d4780B73119b644AE5ecd22b376);	//inject NONSTANDARD NAMING
    address constant public ytusd648 = address(0x73a052500105205d34Daf004eAb301916DA8190f);	//inject NONSTANDARD NAMING

    
    address public governance;
    address public controller;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function GETNAME428() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyDAICurve";
    }
    
    function DEPOSIT36() public {	//inject NONSTANDARD NAMING
        uint _want = IERC20(want371).BALANCEOF170(address(this));
        if (_want > 0) {
            IERC20(want371).SAFEAPPROVE24(y454, 0);
            IERC20(want371).SAFEAPPROVE24(y454, _want);
            yERC20(y454).DEPOSIT36(_want);
        }
        uint _y = IERC20(y454).BALANCEOF170(address(this));
        if (_y > 0) {
            IERC20(y454).SAFEAPPROVE24(curve64, 0);
            IERC20(y454).SAFEAPPROVE24(curve64, _y);
            ICurveFi(curve64).ADD_LIQUIDITY455([_y,0,0,0],0);
        }
        uint _ycrv = IERC20(ycrv21).BALANCEOF170(address(this));
        if (_ycrv > 0) {
            IERC20(ycrv21).SAFEAPPROVE24(yycrv162, 0);
            IERC20(ycrv21).SAFEAPPROVE24(yycrv162, _ycrv);
            yERC20(yycrv162).DEPOSIT36(_ycrv);
        }
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW893(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want371 != address(_asset), "want");
        require(y454 != address(_asset), "y");
        require(ycrv21 != address(_asset), "ycrv");
        require(yycrv162 != address(_asset), "yycrv");
        balance = _asset.BALANCEOF170(address(this));
        _asset.SAFETRANSFER114(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW893(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want371).BALANCEOF170(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME756(_amount.SUB852(_balance));
            _amount = _amount.ADD907(_balance);
        }
        
        address _vault = Controller(controller).VAULTS574(address(want371));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want371).SAFETRANSFER114(_vault, _amount);
        
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL219() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL585();
        
        
        balance = IERC20(want371).BALANCEOF170(address(this));
        
        address _vault = Controller(controller).VAULTS574(address(want371));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want371).SAFETRANSFER114(_vault, balance);
    }
    
    function WITHDRAWUNDERLYING775(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        IERC20(ycrv21).SAFEAPPROVE24(curve64, 0);
        IERC20(ycrv21).SAFEAPPROVE24(curve64, _amount);
        ICurveFi(curve64).REMOVE_LIQUIDITY558(_amount, [uint256(0),0,0,0]);
    
        uint256 _yusdc = IERC20(yusdc421).BALANCEOF170(address(this));
        uint256 _yusdt = IERC20(yusdt357).BALANCEOF170(address(this));
        uint256 _ytusd = IERC20(ytusd648).BALANCEOF170(address(this));
        
        if (_yusdc > 0) {
            IERC20(yusdc421).SAFEAPPROVE24(curve64, 0);
            IERC20(yusdc421).SAFEAPPROVE24(curve64, _yusdc);
            ICurveFi(curve64).EXCHANGE916(1, 0, _yusdc, 0);
        }
        if (_yusdt > 0) {
            IERC20(yusdt357).SAFEAPPROVE24(curve64, 0);
            IERC20(yusdt357).SAFEAPPROVE24(curve64, _yusdt);
            ICurveFi(curve64).EXCHANGE916(2, 0, _yusdt, 0);
        }
        if (_ytusd > 0) {
            IERC20(ytusd648).SAFEAPPROVE24(curve64, 0);
            IERC20(ytusd648).SAFEAPPROVE24(curve64, _ytusd);
            ICurveFi(curve64).EXCHANGE916(3, 0, _ytusd, 0);
        }
        
        uint _before = IERC20(want371).BALANCEOF170(address(this));
        yERC20(ydai803).WITHDRAW893(IERC20(ydai803).BALANCEOF170(address(this)));
        uint _after = IERC20(want371).BALANCEOF170(address(this));
        
        return _after.SUB852(_before);
    }
    
    function _WITHDRAWALL585() internal {	//inject NONSTANDARD NAMING
        uint _yycrv = IERC20(yycrv162).BALANCEOF170(address(this));
        if (_yycrv > 0) {
            yERC20(yycrv162).WITHDRAW893(_yycrv);
            WITHDRAWUNDERLYING775(IERC20(ycrv21).BALANCEOF170(address(this)));
        }
    }
    
    function _WITHDRAWSOME756(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        // calculate amount of ycrv to withdraw for amount of _want_
        uint _ycrv = _amount.MUL336(1e18).DIV411(ICurveFi(curve64).GET_VIRTUAL_PRICE745());
        // calculate amount of yycrv to withdraw for amount of _ycrv_
        uint _yycrv = _ycrv.MUL336(1e18).DIV411(yERC20(yycrv162).GETPRICEPERFULLSHARE797());
        uint _before = IERC20(ycrv21).BALANCEOF170(address(this));
        yERC20(yycrv162).WITHDRAW893(_yycrv);
        uint _after = IERC20(ycrv21).BALANCEOF170(address(this));
        return WITHDRAWUNDERLYING775(_after.SUB852(_before));
    }
    
    function BALANCEOFWANT85() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want371).BALANCEOF170(address(this));
    }
    
    function BALANCEOFYYCRV962() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(yycrv162).BALANCEOF170(address(this));
    }
    
    function BALANCEOFYYCRVINYCRV827() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRV962().MUL336(yERC20(yycrv162).GETPRICEPERFULLSHARE797()).DIV411(1e18);
    }
    
    function BALANCEOFYYCRVINYTUSD529() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRVINYCRV827().MUL336(ICurveFi(curve64).GET_VIRTUAL_PRICE745()).DIV411(1e18);
    }
    
    function BALANCEOFYCRV175() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(ycrv21).BALANCEOF170(address(this));
    }
    
    function BALANCEOFYCRVYTUSD517() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYCRV175().MUL336(ICurveFi(curve64).GET_VIRTUAL_PRICE745()).DIV411(1e18);
    }
    
    function BALANCEOF170() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT85()
               .ADD907(BALANCEOFYYCRVINYTUSD529());
    }
    
    function SETGOVERNANCE332(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER206(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}