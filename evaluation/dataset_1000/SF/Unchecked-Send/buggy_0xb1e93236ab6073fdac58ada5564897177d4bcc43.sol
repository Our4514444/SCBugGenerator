/**
 *Submitted for verification at Etherscan.io on 2020-03-22
*/

pragma solidity ^0.5.1;

library IterableMapping {
    struct itmap {
        mapping(address => IndexValue) data;
        KeyFlag[] keys;
        uint256 size;
    }
    struct IndexValue {
        uint256 keyIndex;
        uint256 value;
    }
    struct KeyFlag {
        address key;
        bool deleted;
    }
    function insert(itmap storage self, address key, uint256 value)
        public
        returns (bool replaced)
    {
        uint256 keyIndex = self.data[key].keyIndex;
        self.data[key].value = value;
        if (keyIndex > 0) return true;
        else {
            keyIndex = self.keys.length++;
            self.data[key].keyIndex = keyIndex + 1;
            self.keys[keyIndex].key = key;
            self.size++;
            return false;
        }
    }
    function iterate_start(itmap storage self)
        public
        view
        returns (uint256 keyIndex)
    {
        return iterate_next(self, uint256(-1));
    }
    function iterate_valid(itmap storage self, uint256 keyIndex)
        public
        view
        returns (bool)
    {
        return keyIndex < self.keys.length;
    }
    function iterate_next(itmap storage self, uint256 keyIndex)
        public
        view
        returns (uint256)
    {
        uint256 _tmpKeyIndex = keyIndex;
        _tmpKeyIndex++;
        while (
            _tmpKeyIndex < self.keys.length && self.keys[_tmpKeyIndex].deleted
        ) _tmpKeyIndex++;
        return _tmpKeyIndex;
    }
    function iterate_get(itmap storage self, uint256 keyIndex)
        public
        view
        returns (address key, uint256 value)
    {
        key = self.keys[keyIndex].key;
        value = self.data[key].value;
    }
    function iterate_getValue(itmap storage self, address key)
        public
        view
        returns (uint256 value)
    {
        return self.data[key].value;
    }
}

// File: zeppelin-solidity/contracts/ownership/Ownable.sol

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;

  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
    constructor() public {
        owner = msg.sender;
    }

    /**
   * @dev Throws if called by any account other than the owner.
   */
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "called by any account other than the owner"
        );
        _;
    }

    /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "owner address should not 0");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

}

// File: zeppelin-solidity/contracts/lifecycle/Pausable.sol

/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is Ownable {
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Pause();
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Unpause();

    bool public paused = false;

    /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
    modifier whenNotPaused() {
        require(!paused, "callable when the contract is not paused");
        _;
    }

    /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
    modifier whenPaused() {
        require(paused, "callable when the contract is paused");
        _;
    }

    /**
   * @dev called by the owner to pause, triggers stopped state
   */
    function pause() public onlyOwner whenNotPaused {
        paused = true;
        emit Pause();
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

    /**
   * @dev called by the owner to unpause, returns to normal state
   */
    function unpause() public onlyOwner whenPaused {
        paused = false;
        emit Unpause();
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    /**
  * @dev Multiplies two numbers, throws on overflow.
  */
    function mul(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
        // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (_a == 0) {
            return 0;
        }

        c = _a * _b;
        assert(c / _a == _b);
        return c;
    }

    /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
    function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
        assert(_b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = _a / _b;
        assert(_a == _b * c + (_a % _b)); // There is no case in which this doesn't hold
        return _a / _b;
    }

    /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
    function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
        assert(_b <= _a);
        return _a - _b;
    }

    /**
  * @dev Adds two numbers, throws on overflow.
  */
    function add(uint256 _a, uint256 _b) internal pure returns (uint256 c) {
        c = _a + _b;
        assert(c >= _a);
        return c;
    }
}

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * See https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
    function totalSupply() public view returns (uint256);
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address _who) public view returns (uint256);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address _to, uint256 _value) public returns (bool);
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is ERC20Basic {
    using SafeMath for uint256;
    IterableMapping.itmap balances;

    uint256 internal totalSupply_;

    /**
  * @dev Total number of tokens in existence
  */
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    /**
  * @dev Transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(
            _value <= IterableMapping.iterate_getValue(balances, msg.sender),
            "not enough balances"
        );
        require(_to != address(0), "0 address not allow");

        IterableMapping.insert(
            balances,
            msg.sender,
            IterableMapping.iterate_getValue(balances, msg.sender).sub(_value)
        );
        IterableMapping.insert(
            balances,
            _to,
            IterableMapping.iterate_getValue(balances, _to).add(_value)
        );
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
    function balanceOf(address _owner) public view returns (uint256) {
        return IterableMapping.iterate_getValue(balances, _owner);
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256);
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint256 _value)
        public
        returns (bool);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint256 _value) public returns (bool);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * https://github.com/ethereum/EIPs/issues/20
 * Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is ERC20, BasicToken {
    mapping(address => mapping(address => uint256)) internal allowed;

    /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
    function transferFrom(address _from, address _to, uint256 _value)
        public
        returns (bool)
    {
        require(
            _value <= IterableMapping.iterate_getValue(balances, _from),
            "balance not enough"
        );
        require(_value <= allowed[_from][msg.sender], "balance not enough");
        require(_to != address(0), "0 address not allow");

        IterableMapping.insert(
            balances,
            _from,
            IterableMapping.iterate_getValue(balances, _from).sub(_value)
        );
        IterableMapping.insert(
            balances,
            _to,
            IterableMapping.iterate_getValue(balances, _to).add(_value)
        );
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256)
    {
        return allowed[_owner][_spender];
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
    function increaseApproval(address _spender, uint256 _addedValue)
        public
        returns (bool)
    {
        allowed[msg.sender][_spender] = (
            allowed[msg.sender][_spender].add(_addedValue)
        );
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * From MonolithDAO Token.sol
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
    function decreaseApproval(address _spender, uint256 _subtractedValue)
        public
        returns (bool)
    {
        uint256 oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue >= oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

}

/**
 * @title Pausable token
 *
 * @dev StandardToken modified with pausable transfers.
 **/

contract PausableToken is StandardToken, Pausable {
    function transfer(address _to, uint256 _value)
        public
        whenNotPaused
        returns (bool)
    {
        return super.transfer(_to, _value);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint256 _value)
        public
        whenNotPaused
        returns (bool)
    {
        return super.transferFrom(_from, _to, _value);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint256 _value)
        public
        whenNotPaused
        returns (bool)
    {
        return super.approve(_spender, _value);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function increaseApproval(address _spender, uint256 _addedValue)
        public
        whenNotPaused
        returns (bool success)
    {
        return super.increaseApproval(_spender, _addedValue);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    function decreaseApproval(address _spender, uint256 _subtractedValue)
        public
        whenNotPaused
        returns (bool success)
    {
        return super.decreaseApproval(_spender, _subtractedValue);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
}

contract Seele is PausableToken {
    string public name = "Seele Token";
    string public symbol = "Seele";
    uint8 public decimals = 18;
    uint256 public INITIAL_SUPPLY = 30000000000 ether;

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        IterableMapping.insert(balances, msg.sender, INITIAL_SUPPLY);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function balancesStart() public view returns (uint256) {
        return IterableMapping.iterate_start(balances);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function balancesGetBool(uint256 num) public view returns (bool) {
        return IterableMapping.iterate_valid(balances, num);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function balancesGetNext(uint256 num) public view returns (uint256) {
        return IterableMapping.iterate_next(balances, num);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function balancesGetValue(uint256 num)
        public
        view
        returns (address, uint256)
    {
        address key;
        uint256 value;
        (key, value) = IterableMapping.iterate_get(balances, num);
        return (key, value);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}