                                                                 

                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY694() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF984(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER913(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE783(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS358() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE983(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM44(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER884(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL458(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD886(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB344(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB344(a, b, "SafeMath: subtraction overflow");
    }
    function SUB344(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL272(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV396(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV396(a, b, "SafeMath: division by zero");
    }
    function DIV396(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD258(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD258(a, b, "SafeMath: modulo by zero");
    }
    function MOD258(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT705(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE962(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE163(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER400(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN436(token, abi.encodeWithSelector(token.TRANSFER913.selector, to, value));
    }

    function SAFETRANSFERFROM974(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN436(token, abi.encodeWithSelector(token.TRANSFERFROM44.selector, from, to, value));
    }

    function SAFEAPPROVE381(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE783(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN436(token, abi.encodeWithSelector(token.APPROVE983.selector, spender, value));
    }
    function CALLOPTIONALRETURN436(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT705(), "SafeERC20: call to non-contract");

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
    function VAULTS166(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS255() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface yERC20 {
  function DEPOSIT410(uint) external;	//inject NONSTANDARD NAMING
  function WITHDRAW790(uint) external;	//inject NONSTANDARD NAMING
  function GETPRICEPERFULLSHARE426() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface ICurveFi {

  function GET_VIRTUAL_PRICE824() external view returns (uint);	//inject NONSTANDARD NAMING
  function ADD_LIQUIDITY374(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function REMOVE_LIQUIDITY_IMBALANCE956(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 max_burn_amount
  ) external;
  function REMOVE_LIQUIDITY514(	//inject NONSTANDARD NAMING
    uint256 _amount,
    uint256[4] calldata amounts
  ) external;
  function EXCHANGE979(	//inject NONSTANDARD NAMING
    int128 from, int128 to, uint256 _from_amount, uint256 _min_to_amount
  ) external;
}

contract StrategyDAICurve {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want139 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address constant public y505 = address(0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01);	//inject NONSTANDARD NAMING
    address constant public ycrv749 = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);	//inject NONSTANDARD NAMING
    address constant public yycrv183 = address(0x5dbcF33D8c2E976c6b560249878e6F1491Bca25c);	//inject NONSTANDARD NAMING
    address constant public curve542 = address(0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51);	//inject NONSTANDARD NAMING
    
    address constant public dai446 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address constant public ydai674 = address(0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01);	//inject NONSTANDARD NAMING

    address constant public usdc364 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);	//inject NONSTANDARD NAMING
    address constant public yusdc200 = address(0xd6aD7a6750A7593E092a9B218d66C0A814a3436e);	//inject NONSTANDARD NAMING

    address constant public usdt63 = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);	//inject NONSTANDARD NAMING
    address constant public yusdt928 = address(0x83f798e925BcD4017Eb265844FDDAbb448f1707D);	//inject NONSTANDARD NAMING

    address constant public tusd456 = address(0x0000000000085d4780B73119b644AE5ecd22b376);	//inject NONSTANDARD NAMING
    address constant public ytusd510 = address(0x73a052500105205d34Daf004eAb301916DA8190f);	//inject NONSTANDARD NAMING

    
    address public governance;
    address public controller;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function GETNAME407() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyDAICurve";
    }
    
    function DEPOSIT410() public {	//inject NONSTANDARD NAMING
        uint _want = IERC20(want139).BALANCEOF984(address(this));
        if (_want > 0) {
            IERC20(want139).SAFEAPPROVE381(y505, 0);
            IERC20(want139).SAFEAPPROVE381(y505, _want);
            yERC20(y505).DEPOSIT410(_want);
        }
        uint _y = IERC20(y505).BALANCEOF984(address(this));
        if (_y > 0) {
            IERC20(y505).SAFEAPPROVE381(curve542, 0);
            IERC20(y505).SAFEAPPROVE381(curve542, _y);
            ICurveFi(curve542).ADD_LIQUIDITY374([_y,0,0,0],0);
        }
        uint _ycrv = IERC20(ycrv749).BALANCEOF984(address(this));
        if (_ycrv > 0) {
            IERC20(ycrv749).SAFEAPPROVE381(yycrv183, 0);
            IERC20(ycrv749).SAFEAPPROVE381(yycrv183, _ycrv);
            yERC20(yycrv183).DEPOSIT410(_ycrv);
        }
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW790(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want139 != address(_asset), "want");
        require(y505 != address(_asset), "y");
        require(ycrv749 != address(_asset), "ycrv");
        require(yycrv183 != address(_asset), "yycrv");
        balance = _asset.BALANCEOF984(address(this));
        _asset.SAFETRANSFER400(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW790(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want139).BALANCEOF984(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME197(_amount.SUB344(_balance));
            _amount = _amount.ADD886(_balance);
        }
        
        address _vault = Controller(controller).VAULTS166(address(want139));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want139).SAFETRANSFER400(_vault, _amount);
        
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL303() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL752();
        
        
        balance = IERC20(want139).BALANCEOF984(address(this));
        
        address _vault = Controller(controller).VAULTS166(address(want139));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want139).SAFETRANSFER400(_vault, balance);
    }
    
    function WITHDRAWUNDERLYING187(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        IERC20(ycrv749).SAFEAPPROVE381(curve542, 0);
        IERC20(ycrv749).SAFEAPPROVE381(curve542, _amount);
        ICurveFi(curve542).REMOVE_LIQUIDITY514(_amount, [uint256(0),0,0,0]);
    
        uint256 _yusdc = IERC20(yusdc200).BALANCEOF984(address(this));
        uint256 _yusdt = IERC20(yusdt928).BALANCEOF984(address(this));
        uint256 _ytusd = IERC20(ytusd510).BALANCEOF984(address(this));
        
        if (_yusdc > 0) {
            IERC20(yusdc200).SAFEAPPROVE381(curve542, 0);
            IERC20(yusdc200).SAFEAPPROVE381(curve542, _yusdc);
            ICurveFi(curve542).EXCHANGE979(1, 0, _yusdc, 0);
        }
        if (_yusdt > 0) {
            IERC20(yusdt928).SAFEAPPROVE381(curve542, 0);
            IERC20(yusdt928).SAFEAPPROVE381(curve542, _yusdt);
            ICurveFi(curve542).EXCHANGE979(2, 0, _yusdt, 0);
        }
        if (_ytusd > 0) {
            IERC20(ytusd510).SAFEAPPROVE381(curve542, 0);
            IERC20(ytusd510).SAFEAPPROVE381(curve542, _ytusd);
            ICurveFi(curve542).EXCHANGE979(3, 0, _ytusd, 0);
        }
        
        uint _before = IERC20(want139).BALANCEOF984(address(this));
        yERC20(ydai674).WITHDRAW790(IERC20(ydai674).BALANCEOF984(address(this)));
        uint _after = IERC20(want139).BALANCEOF984(address(this));
        
        return _after.SUB344(_before);
    }
    
    function _WITHDRAWALL752() internal {	//inject NONSTANDARD NAMING
        uint _yycrv = IERC20(yycrv183).BALANCEOF984(address(this));
        if (_yycrv > 0) {
            yERC20(yycrv183).WITHDRAW790(_yycrv);
            WITHDRAWUNDERLYING187(IERC20(ycrv749).BALANCEOF984(address(this)));
        }
    }
    
    function _WITHDRAWSOME197(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        // calculate amount of ycrv to withdraw for amount of _want_
        uint _ycrv = _amount.MUL272(1e18).DIV396(ICurveFi(curve542).GET_VIRTUAL_PRICE824());
        // calculate amount of yycrv to withdraw for amount of _ycrv_
        uint _yycrv = _ycrv.MUL272(1e18).DIV396(yERC20(yycrv183).GETPRICEPERFULLSHARE426());
        uint _before = IERC20(ycrv749).BALANCEOF984(address(this));
        yERC20(yycrv183).WITHDRAW790(_yycrv);
        uint _after = IERC20(ycrv749).BALANCEOF984(address(this));
        return WITHDRAWUNDERLYING187(_after.SUB344(_before));
    }
    
    function BALANCEOFWANT245() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want139).BALANCEOF984(address(this));
    }
    
    function BALANCEOFYYCRV544() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(yycrv183).BALANCEOF984(address(this));
    }
    
    function BALANCEOFYYCRVINYCRV749() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRV544().MUL272(yERC20(yycrv183).GETPRICEPERFULLSHARE426()).DIV396(1e18);
    }
    
    function BALANCEOFYYCRVINYTUSD982() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYYCRVINYCRV749().MUL272(ICurveFi(curve542).GET_VIRTUAL_PRICE824()).DIV396(1e18);
    }
    
    function BALANCEOFYCRV18() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(ycrv749).BALANCEOF984(address(this));
    }
    
    function BALANCEOFYCRVYTUSD570() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFYCRV18().MUL272(ICurveFi(curve542).GET_VIRTUAL_PRICE824()).DIV396(1e18);
    }
    
    function BALANCEOF984() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT245()
               .ADD886(BALANCEOFYYCRVINYTUSD982());
    }
    
    function SETGOVERNANCE568(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER12(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}