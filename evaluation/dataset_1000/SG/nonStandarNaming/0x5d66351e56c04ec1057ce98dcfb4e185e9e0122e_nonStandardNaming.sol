                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY633() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF838(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER693(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE518(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS764() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE547(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM527(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER665(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL751(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD774(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB988(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB988(a, b, "SafeMath: subtraction overflow");
    }
    function SUB988(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL237(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV663(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV663(a, b, "SafeMath: division by zero");
    }
    function DIV663(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD632(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD632(a, b, "SafeMath: modulo by zero");
    }
    function MOD632(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT373(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE950(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE898(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER271(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN499(token, abi.encodeWithSelector(token.TRANSFER693.selector, to, value));
    }

    function SAFETRANSFERFROM754(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN499(token, abi.encodeWithSelector(token.TRANSFERFROM527.selector, from, to, value));
    }

    function SAFEAPPROVE795(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE518(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN499(token, abi.encodeWithSelector(token.APPROVE547.selector, spender, value));
    }
    function CALLOPTIONALRETURN499(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT373(), "SafeERC20: call to non-contract");

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
    function VAULTS625(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS200() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface Gauge {
    function DEPOSIT629(uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF838(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function WITHDRAW254(uint) external;	//inject NONSTANDARD NAMING
}

interface Mintr {
    function MINT178(address) external;	//inject NONSTANDARD NAMING
}

interface Uni {
    function SWAPEXACTTOKENSFORTOKENS191(uint, uint, address[] calldata, address, uint) external;	//inject NONSTANDARD NAMING
}

interface yERC20 {
  function DEPOSIT629(uint256 _amount) external;	//inject NONSTANDARD NAMING
  function WITHDRAW254(uint256 _amount) external;	//inject NONSTANDARD NAMING
}

interface ICurveFi {

  function GET_VIRTUAL_PRICE280() external view returns (uint);	//inject NONSTANDARD NAMING
  function ADD_LIQUIDITY178(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function REMOVE_LIQUIDITY_IMBALANCE756(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 max_burn_amount
  ) external;
  function REMOVE_LIQUIDITY561(	//inject NONSTANDARD NAMING
    uint256 _amount,
    uint256[4] calldata amounts
  ) external;
  function EXCHANGE531(	//inject NONSTANDARD NAMING
    int128 from, int128 to, uint256 _from_amount, uint256 _min_to_amount
  ) external;
}

interface VoteEscrow {
    function CREATE_LOCK771(uint, uint) external;	//inject NONSTANDARD NAMING
    function INCREASE_AMOUNT430(uint) external;	//inject NONSTANDARD NAMING
    function WITHDRAW254() external;	//inject NONSTANDARD NAMING
}

contract CurveYCRVVoter {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want590 = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);	//inject NONSTANDARD NAMING
    address constant public pool105 = address(0xFA712EE4788C042e2B7BB55E6cb8ec569C4530c1);	//inject NONSTANDARD NAMING
    address constant public mintr828 = address(0xd061D61a4d941c39E5453435B6345Dc261C2fcE0);	//inject NONSTANDARD NAMING
    
    address constant public escrow817 = address(0x5f3b5DfEb7B28CDbD7FAba78963EE202a494e2A2);	//inject NONSTANDARD NAMING
    
    address public governance;
    address public strategy;
    
    constructor() public {
        governance = msg.sender;
    }
    
    function GETNAME242() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "CurveYCRVVoter";
    }
    
    function SETSTRATEGY379(address _strategy) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        strategy = _strategy;
    }
    
    function DEPOSIT629() public {	//inject NONSTANDARD NAMING
        uint _want = IERC20(want590).BALANCEOF838(address(this));
        if (_want > 0) {
            IERC20(want590).SAFEAPPROVE795(pool105, 0);
            IERC20(want590).SAFEAPPROVE795(pool105, _want);
            Gauge(pool105).DEPOSIT629(_want);
        }
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW254(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == strategy, "!controller");
        balance = _asset.BALANCEOF838(address(this));
        _asset.SAFETRANSFER271(strategy, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW254(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == strategy, "!controller");
        uint _balance = IERC20(want590).BALANCEOF838(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME208(_amount.SUB988(_balance));
            _amount = _amount.ADD774(_balance);
        }
        IERC20(want590).SAFETRANSFER271(strategy, _amount);
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL746() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == strategy, "!controller");
        _WITHDRAWALL395();
        
        
        balance = IERC20(want590).BALANCEOF838(address(this));
        IERC20(want590).SAFETRANSFER271(strategy, balance);
    }
    
    function _WITHDRAWALL395() internal {	//inject NONSTANDARD NAMING
        Gauge(pool105).WITHDRAW254(Gauge(pool105).BALANCEOF838(address(this)));
    }
    
    function CREATELOCK159(uint _value, uint _unlockTime) external {	//inject NONSTANDARD NAMING
        require(msg.sender == strategy || msg.sender == governance, "!authorized");
        VoteEscrow(escrow817).CREATE_LOCK771(_value, _unlockTime);
    }
    
    function INCREASEAMOUNT594(uint _value) external {	//inject NONSTANDARD NAMING
        require(msg.sender == strategy || msg.sender == governance, "!authorized");
        VoteEscrow(escrow817).INCREASE_AMOUNT430(_value);
    }
    
    function RELEASE646() external {	//inject NONSTANDARD NAMING
        require(msg.sender == strategy || msg.sender == governance, "!authorized");
        VoteEscrow(escrow817).WITHDRAW254();
    }
    
    function _WITHDRAWSOME208(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        Gauge(pool105).WITHDRAW254(_amount);
        return _amount;
    }
    
    function BALANCEOFWANT41() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want590).BALANCEOF838(address(this));
    }
    
    function BALANCEOFPOOL443() public view returns (uint) {	//inject NONSTANDARD NAMING
        return Gauge(pool105).BALANCEOF838(address(this));
    }
    
    function BALANCEOF838() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT41()
               .ADD774(BALANCEOFPOOL443());
    }
    
    function SETGOVERNANCE524(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function EXECUTE25(address to, uint value, bytes calldata data) external returns (bool, bytes memory) {	//inject NONSTANDARD NAMING
        require(msg.sender == strategy || msg.sender == governance, "!governance");
        (bool success, bytes memory result) = to.call.value(value)(data);
        
        return (success, result);
    }
}