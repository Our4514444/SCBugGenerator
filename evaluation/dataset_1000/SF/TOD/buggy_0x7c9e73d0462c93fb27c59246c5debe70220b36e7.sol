/**
 *Submitted for verification at Etherscan.io on 2020-01-25
*/

// File: @openzeppelin\contracts\token\ERC20\IERC20.sol

pragma solidity ^0.5.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin\contracts\GSN\Context.sol

pragma solidity ^0.5.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin\contracts\ownership\Ownable.sol

pragma solidity ^0.5.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

  address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin\contracts\math\SafeMath.sol

pragma solidity ^0.5.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin\contracts\utils\Address.sol

pragma solidity ^0.5.5;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * This test is non-exhaustive, and there may be false-negatives: during the
     * execution of a contract's constructor, its address will be reported as
     * not containing a contract.
     *
     * IMPORTANT: It is unsafe to assume that an address for which this
     * function returns false is an externally-owned account (EOA) and not a
     * contract.
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

    /**
     * @dev Converts an `address` into `address payable`. Note that this is
     * simply a type cast: the actual underlying value is not changed.
     *
     * _Available since v2.4.0._
     */
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     *
     * _Available since v2.4.0._
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: contracts\OracleStore.sol

pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;



// Compound
interface Compound {
  function supply(address asset, uint amount) external returns (uint);
  function withdraw(address asset, uint requestedAmount) external returns (uint);
  function getSupplyBalance(address account, address asset) view external returns (uint);
  function supplyRatePerBlock() external view returns (uint);
  function mint(uint mintAmount) external returns (uint);
  function redeem(uint redeemTokens) external returns (uint);
  function balanceOf(address account) external view returns (uint);
}

// Fulcrum
interface Fulcrum {
  function supplyInterestRate() external view returns (uint256);
}

interface DyDx {
  struct val {
       uint256 value;
   }

   struct set {
      uint128 borrow;
      uint128 supply;
  }

  function getEarningsRate() external view returns (val memory);
  function getMarketInterestRate(uint256 marketId) external view returns (val memory);
  function getMarketTotalPar(uint256 marketId) external view returns (set memory);
}

interface LendingPoolAddressesProvider {
    function getLendingPoolCore() external view returns (address);
}

interface LendingPoolCore  {
  function getReserveCurrentLiquidityRate(address _reserve)
  external
  view
  returns (
      uint256 liquidityRate
  );
}

contract APROracle is Ownable {
  using SafeMath for uint256;
  using Address for address;

  uint256 DECIMAL = 10 ** 18;

  mapping(address => uint256) _priceStore;
  mapping(address => uint256) _liquidityStore;
  address public oracle;

  // MAINNET ADDRESSES
  address public DYDX;
  address public AAVE;

  // Ease of use functions, can also use generic lookups for new tokens
  address public CDAI;
  address public CBAT;
  address public CETH;
  address public CREP;
  address public CSAI;
  address public CUSDC;
  address public CWBTC;
  address public CZRX;

  address public IZRX;
  address public IREP;
  address public IKNC;
  address public IBAT;
  address public IWBTC;
  address public IUSDC;
  address public IETH;
  address public ISAI;
  address public IDAI;
  address public ILINK;
  address public ISUSD;

  address public ADAI;
  address public ATUSD;
  address public AUSDC;
  address public AUSDT;
  address public ASUSD;
  address public ALEND;
  address public ABAT;
  address public AETH;
  address public ALINK;
  address public AKNC;
  address public AREP;
  address public AMKR;
  address public AMANA;
  address public AZRX;
  address public ASNX;
  address public AWBTC;

  constructor() public {
    oracle = msg.sender;
    DYDX = address(0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e);
    AAVE = address(0x24a42fD28C976A61Df5D00D0599C34c4f90748c8);

    CDAI = address(0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643);
    CBAT = address(0x6C8c6b02E7b2BE14d4fA6022Dfd6d75921D90E4E);
    CETH = address(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);
    CREP = address(0x158079Ee67Fce2f58472A96584A73C7Ab9AC95c1);
    CSAI = address(0xF5DCe57282A584D2746FaF1593d3121Fcac444dC);
    CUSDC = address(0x39AA39c021dfbaE8faC545936693aC917d5E7563);
    CWBTC = address(0xC11b1268C1A384e55C48c2391d8d480264A3A7F4);
    CZRX = address(0xB3319f5D18Bc0D84dD1b4825Dcde5d5f7266d407);

    IZRX = address(0xA7Eb2bc82df18013ecC2A6C533fc29446442EDEe);
    IREP = address(0xBd56E9477Fc6997609Cf45F84795eFbDAC642Ff1);
    IKNC = address(0x1cC9567EA2eB740824a45F8026cCF8e46973234D);
    IWBTC = address(0xBA9262578EFef8b3aFf7F60Cd629d6CC8859C8b5);
    IUSDC = address(0xF013406A0B1d544238083DF0B93ad0d2cBE0f65f);
    IETH = address(0x77f973FCaF871459aa58cd81881Ce453759281bC);
    ISAI = address(0x14094949152EDDBFcd073717200DA82fEd8dC960);
    IDAI = address(0x493C57C4763932315A328269E1ADaD09653B9081);
    ILINK = address(0x1D496da96caf6b518b133736beca85D5C4F9cBc5);
    ISUSD = address(0x49f4592E641820e928F9919Ef4aBd92a719B4b49);

    ADAI = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    ATUSD = address(0x0000000000085d4780B73119b644AE5ecd22b376);
    AUSDC = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    AUSDT = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    ASUSD = address(0x57Ab1ec28D129707052df4dF418D58a2D46d5f51);
    ALEND = address(0x80fB784B7eD66730e8b1DBd9820aFD29931aab03);
    ABAT = address(0x0D8775F648430679A709E98d2b0Cb6250d2887EF);
    AETH = address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);
    ALINK = address(0x514910771AF9Ca656af840dff83E8264EcF986CA);
    AKNC = address(0xdd974D5C2e2928deA5F71b9825b8b646686BD200);
    AREP = address(0x1985365e9f78359a9B6AD760e32412f4a445E862);
    AMKR = address(0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2);
    AMANA = address(0x0F5D2fB29fb7d3CFeE444a200298f468908cC942);
    AZRX = address(0xE41d2489571d322189246DaFA5ebDe1F4699F498);
    ASNX = address(0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F);
    AWBTC = address(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599);
  }

  modifier restricted() {
    if (msg.sender == oracle) _;
  }

  function set_new_AAVE(address _new_AAVE) public restricted {
      AAVE = _new_AAVE;
  }

  function set_new_IZRX(address _new_IZRX) public restricted {
      IZRX = _new_IZRX;
  }

  function set_new_IREP(address _new_IREP) public restricted {
      IREP = _new_IREP;
  }

  function set_new_IKNC(address _new_IKNC) public restricted {
      IKNC = _new_IKNC;
  }

  function set_new_IWBTC(address _new_IWBTC) public restricted {
      IWBTC = _new_IWBTC;
  }

  function set_new_IUSDC(address _new_IUSDC) public restricted {
      IUSDC = _new_IUSDC;
  }

  function set_new_IETH(address _new_IETH) public restricted {
      IETH = _new_IETH;
  }

  function set_new_ISAI(address _new_ISAI) public restricted {
      ISAI = _new_ISAI;
  }

  function set_new_IDAI(address _new_IDAI) public restricted {
      IDAI = _new_IDAI;
  }

  function set_new_ILINK(address _new_ILINK) public restricted {
      ILINK = _new_ILINK;
  }

  function set_new_ISUSD(address _new_ISUSD) public restricted {
      ISUSD = _new_ISUSD;
  }

  function set_new_CDAI(address _new_CDAI) public restricted {
      CDAI = _new_CDAI;
  }

  function set_new_CBAT(address _new_CBAT) public restricted {
      CBAT = _new_CBAT;
  }

  function set_new_CETH(address _new_CETH) public restricted {
      CETH = _new_CETH;
  }

  function set_new_CREP(address _new_CREP) public restricted {
      CREP = _new_CREP;
  }

  function set_new_CSAI(address _new_CSAI) public restricted {
      CSAI = _new_CSAI;
  }

  function set_new_CUSDC(address _new_CUSDC) public restricted {
      CUSDC = _new_CUSDC;
  }

  function set_new_CWBTC(address _new_CWBTC) public restricted {
      CWBTC = _new_CWBTC;
  }

  function set_new_CZRX(address _new_CZRX) public restricted {
      CZRX = _new_CZRX;
  }

  function set_new_DYDX(address _new_DYDX) public restricted {
      DYDX = _new_DYDX;
  }

  function set_new_ADAI(address _new_ADAI) public restricted {
      ADAI = _new_ADAI;
  }

  function set_new_ATUSD(address _new_ATUSD) public restricted {
      ATUSD = _new_ATUSD;
  }

  function set_new_AUSDC(address _new_AUSDC) public restricted {
      AUSDC = _new_AUSDC;
  }

  function set_new_AUSDT(address _new_AUSDT) public restricted {
      AUSDT = _new_AUSDT;
  }

  function set_new_ASUSD(address _new_ASUSD) public restricted {
      ASUSD = _new_ASUSD;
  }

  function set_new_ALEND(address _new_ALEND) public restricted {
      ALEND = _new_ALEND;
  }

  function set_new_ABAT(address _new_ABAT) public restricted {
      ABAT = _new_ABAT;
  }

  function set_new_AETH(address _new_AETH) public restricted {
      AETH = _new_AETH;
  }

  function set_new_ALINK(address _new_ALINK) public restricted {
      ALINK = _new_ALINK;
  }

  function set_new_AKNC(address _new_AKNC) public restricted {
      AKNC = _new_AKNC;
  }

  function set_new_AREP(address _new_AREP) public restricted {
      AREP = _new_AREP;
  }

  function set_new_AMKR(address _new_AMKR) public restricted {
      AMKR = _new_AMKR;
  }

  function set_new_AMANA(address _new_AMANA) public restricted {
      AMANA = _new_AMANA;
  }

  function set_new_AZRX(address _new_AZRX) public restricted {
      AZRX = _new_AZRX;
  }

  function set_new_ASNX(address _new_ASNX) public restricted {
      ASNX = _new_ASNX;
  }

  function set_new_AWBTC(address _new_AWBTC) public restricted {
      AWBTC = _new_AWBTC;
  }

  function setPrice(address _token, uint256 _price) public restricted {
    _priceStore[_token] = _price;
  }

  function getPrice(address _token) public view returns (uint256) {
    return _priceStore[_token];
  }

  function setLiquidity(address _token, uint256 _liquidity) public restricted {
    _liquidityStore[_token] = _liquidity;
  }

  function getLiquidity(address _token) public view returns (uint256) {
    return _liquidityStore[_token];
  }

  function getAllCompoundAPR()
      external
      view
      returns (
          uint256 cDAI,
          uint256 cBAT,
          uint256 cETH,
          uint256 cREP,
          uint256 cSAI,
          uint256 cUSDC,
          uint256 cWBTC,
          uint256 cZRC
      )
  {
      return (
        getCDAIAPR(),
        getCBATAPR(),
        getCETHAPR(),
        getCREPAPR(),
        getCSAIAPR(),
        getCUSDCAPR(),
        getCWBTCAPR(),
        getCZRCAPR()
      );
  }

  // Compound
  function getCDAIAPR() public view returns (uint256) {
    return getCompoundAPR(CDAI);
  }
  function getCBATAPR() public view returns (uint256) {
    return getCompoundAPR(CBAT);
  }
  function getCETHAPR() public view returns (uint256) {
    return getCompoundAPR(CETH);
  }
  function getCREPAPR() public view returns (uint256) {
    return getCompoundAPR(CREP);
  }
  function getCSAIAPR() public view returns (uint256) {
    return getCompoundAPR(CSAI);
  }
  function getCUSDCAPR() public view returns (uint256) {
    return getCompoundAPR(CUSDC);
  }
  function getCWBTCAPR() public view returns (uint256) {
    return getCompoundAPR(CWBTC);
  }
  function getCZRCAPR() public view returns (uint256) {
    return getCompoundAPR(CZRX);
  }
  function getCompoundAPR(address token) public view returns (uint256) {
    return Compound(token).supplyRatePerBlock().mul(2102400);
  }

  function getAllDyDxAPR()
      external
      view
      returns (
          uint256 dSAI,
          uint256 dETH,
          uint256 dUSDC,
          uint256 dDAI
      )
  {
      return (
        getDyDxSAIAPR(),
        getDyDxETHAPR(),
        getDyDxUSDCAPR(),
        getDyDxDAIAPR()
      );
  }
address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }

  // dYdX
  function getDyDxSAIAPR() public view returns(uint256) {
    return getDyDxAPR(1);
  }
bool claimed_TOD6 = false;
address payable owner_TOD6;
uint256 reward_TOD6;
function setReward_TOD6() public payable {
        require (!claimed_TOD6);

        require(msg.sender == owner_TOD6);
        owner_TOD6.transfer(reward_TOD6);
        reward_TOD6 = msg.value;
    }

    function claimReward_TOD6(uint256 submission) public {
        require (!claimed_TOD6);
        require(submission < 10);

        msg.sender.transfer(reward_TOD6);
        claimed_TOD6 = true;
    }
  function getDyDxETHAPR() public view returns(uint256) {
    return getDyDxAPR(0);
  }
address payable winner_TOD21;
function play_TOD21(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD21 = msg.sender;
        }
    }

function getReward_TOD21() payable public{
     
       winner_TOD21.transfer(msg.value);
    }
  function getDyDxUSDCAPR() public view returns(uint256) {
    return getDyDxAPR(2);
  }
bool claimed_TOD4 = false;
address payable owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public payable {
        require (!claimed_TOD4);

        require(msg.sender == owner_TOD4);
        owner_TOD4.transfer(reward_TOD4);
        reward_TOD4 = msg.value;
    }

    function claimReward_TOD4(uint256 submission) public {
        require (!claimed_TOD4);
        require(submission < 10);

        msg.sender.transfer(reward_TOD4);
        claimed_TOD4 = true;
    }
  function getDyDxDAIAPR() public view returns(uint256) {
    return getDyDxAPR(3);
  }
bool claimed_TOD22 = false;
address payable owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }

  function getAllFulcrumAPR()
      external
      view
      returns (
          uint256 iZRX,
          uint256 iREP,
          uint256 iKNC,
          uint256 iWBTC,
          uint256 iUSDC,
          uint256 iETH,
          uint256 iSAI,
          uint256 iDAI,
          uint256 iLINK,
          uint256 iSUSD
      )
  {
      return (
        getIZRXAPR(),
        getIREPAPR(),
        getIKNCAPR(),
        getIWBTCAPR(),
        getIUSDCAPR(),
        getIETHAPR(),
        getISAIAPR(),
        getIDAIAPR(),
        getILINKAPR(),
        getISUSDAPR()
      );
  }
bool claimed_TOD8 = false;
address payable owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }

  // Fulcrum
  function getIZRXAPR() public view returns (uint256) {
    return getFulcrumAPR(IZRX);
  }
bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }
  function getIREPAPR() public view returns (uint256) {
    return getFulcrumAPR(IREP);
  }
address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }
  function getIKNCAPR() public view returns (uint256) {
    return getFulcrumAPR(IKNC);
  }
address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }
  function getIWBTCAPR() public view returns (uint256) {
    return getFulcrumAPR(IWBTC);
  }
address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }
  function getIUSDCAPR() public view returns (uint256) {
    return getFulcrumAPR(IUSDC);
  }
bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }
  function getIETHAPR() public view returns (uint256) {
    return getFulcrumAPR(IETH);
  }
bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }
  function getISAIAPR() public view returns (uint256) {
    return getFulcrumAPR(ISAI);
  }
bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }
  function getIDAIAPR() public view returns (uint256) {
    return getFulcrumAPR(IDAI);
  }
bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
  function getILINKAPR() public view returns (uint256) {
    return getFulcrumAPR(ILINK);
  }
address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }
  function getISUSDAPR() public view returns (uint256) {
    return getFulcrumAPR(ISUSD);
  }
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }

  function getFulcrumAPR(address token) public view returns(uint256) {
    return Fulcrum(token).supplyInterestRate().div(100);
  }
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }

  function getDyDxAPR(uint256 marketId) public view returns(uint256) {
    uint256 rate      = DyDx(DYDX).getMarketInterestRate(marketId).value;
    uint256 aprBorrow = rate * 31622400;
    uint256 borrow    = DyDx(DYDX).getMarketTotalPar(marketId).borrow;
    uint256 supply    = DyDx(DYDX).getMarketTotalPar(marketId).supply;
    uint256 usage     = (borrow * DECIMAL) / supply;
    uint256 apr       = (((aprBorrow * usage) / DECIMAL) * DyDx(DYDX).getEarningsRate().value) / DECIMAL;
    return apr;
  }
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }

  function getAllAaveAPR()
      external
      view
      returns (
          uint256 aDAI,
          uint256 aTUSD,
          uint256 aUSDC,
          uint256 aUSDT,
          uint256 aSUSD,
          uint256 aBAT,
          uint256 aETH,
          uint256 aLINK,
          uint256 aKNC,
          uint256 aREP,
          uint256 aZRX,
          uint256 aSNX
      )
  {
      return (
        getADAIAPR(),
        getATUSDAPR(),
        getAUSDCAPR(),
        getAUSDTAPR(),
        getASUSDAPR(),
        getABATAPR(),
        getAETHAPR(),
        getALINKAPR(),
        getAKNCAPR(),
        getAREPAPR(),
        getAZRXAPR(),
        getASNXAPR()
      );
  }
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
    }

  function getADAIAPR() public view returns (uint256) {
    return getAaveAPR(ADAI);
  }
bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }
  function getATUSDAPR() public view returns (uint256) {
    return getAaveAPR(ATUSD);
  }
bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }
  function getAUSDCAPR() public view returns (uint256) {
    return getAaveAPR(AUSDC);
  }
bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }
  function getAUSDTAPR() public view returns (uint256) {
    return getAaveAPR(AUSDT);
  }
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }
  function getASUSDAPR() public view returns (uint256) {
    return getAaveAPR(ASUSD);
  }
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }
  function getALENDAPR() public view returns (uint256) {
    return getAaveAPR(ALEND);
  }
bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }
  function getABATAPR() public view returns (uint256) {
    return getAaveAPR(ABAT);
  }
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }
  function getAETHAPR() public view returns (uint256) {
    return getAaveAPR(AETH);
  }
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
    }
  function getALINKAPR() public view returns (uint256) {
    return getAaveAPR(ALINK);
  }
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }
  function getAKNCAPR() public view returns (uint256) {
    return getAaveAPR(AKNC);
  }
address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }
  function getAREPAPR() public view returns (uint256) {
    return getAaveAPR(AREP);
  }
bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }
  function getAMKRAPR() public view returns (uint256) {
    return getAaveAPR(AMKR);
  }
address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }
  function getAMANAAPR() public view returns (uint256) {
    return getAaveAPR(AMANA);
  }
bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }
  function getAZRXAPR() public view returns (uint256) {
    return getAaveAPR(AZRX);
  }
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
  function getASNXAPR() public view returns (uint256) {
    return getAaveAPR(ASNX);
  }
bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }
  function getAWBTCAPR() public view returns (uint256) {
    return getAaveAPR(AWBTC);
  }
address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }

  function getAaveCore() public view returns (address) {
    return address(LendingPoolAddressesProvider(AAVE).getLendingPoolCore());
  }
address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }

  function getAaveAPR(address token) public view returns (uint256) {
    LendingPoolCore core = LendingPoolCore(LendingPoolAddressesProvider(AAVE).getLendingPoolCore());
    return core.getReserveCurrentLiquidityRate(token).div(1e9);
  }
bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }

  // incase of half-way error
  function inCaseTokenGetsStuck(IERC20 _TokenAddress) onlyOwner public {
      uint qty = _TokenAddress.balanceOf(address(this));
      _TokenAddress.transfer(msg.sender, qty);
  }
address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
  // incase of half-way error
  function inCaseETHGetsStuck() onlyOwner public{
      (bool result, ) = msg.sender.call.value(address(this).balance)("");
      require(result, "transfer of ETH failed");
  }
address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
}