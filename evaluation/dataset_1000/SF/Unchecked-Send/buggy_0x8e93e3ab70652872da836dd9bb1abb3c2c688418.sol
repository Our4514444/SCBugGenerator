pragma solidity ^0.5.3 <0.6.0;



  contract Ownable {
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  address private _owner;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * @notice Renouncing to ownership will leave the contract without an owner.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
}

// https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}
contract SimpleToken is Ownable {
    using SafeMath for uint256;

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);

  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) private _balances;

  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private _totalSupply;

    /**
     * @dev Total number of tokens in existence
     */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Gets the balance of the specified address.
     * @param owner The address to query the balance of.
     * @return An uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Transfer token for a specified address
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}


    /**
     * @dev Transfer token for a specified addresses
     * @param from The address to transfer from.
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));
        require(value <= _balances[from]); // Check there is enough balance.

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev public function that mints an amount of the token and assigns it to
     * an account. This encapsulates the modification of balances such that the
     * proper events are emitted.
     * @param account The account that will receive the created tokens.
     * @param value The amount that will be created.
     */
    function _mint(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
}
contract FiatContract {
  function USD(uint _id) public pure returns (uint256);
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
}

contract RealToken is Ownable, SimpleToken {
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  FiatContract public price;
    
  using SafeMath for uint256;

function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  string public constant name = "DreamPot Token";
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  string public constant symbol = "DPT";
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  uint32 public constant decimals = 0;

function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address payable public ethOwner;

function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public factor;

function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event GetEth(address indexed from, uint256 value);

  constructor() public {
    price = FiatContract(0x8055d0504666e2B6942BeB8D6014c964658Ca591);
    ethOwner = address(uint160(owner()));
    factor = 100;
  }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

  function setEthOwner(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    ethOwner = address(uint160(newOwner));
  }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

  function setFactor(uint256 newFactor) public onlyOwner {
    factor = newFactor;
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  
  // Calcs mint tokens
  function calcTokens(uint256 weivalue) public view returns(uint256) {
    uint256 ethCent = price.USD(0);
    uint256 usdv = ethCent.div(1000);
    usdv = usdv.mul(factor);
    return weivalue.div(usdv);
  }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

  function() external payable {
    uint256 tokens = calcTokens(msg.value);
    ethOwner.transfer(msg.value);
    emit GetEth(msg.sender, msg.value);
    _mint(msg.sender, tokens);
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}