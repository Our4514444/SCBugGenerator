pragma solidity ^0.5.2;
/**
 * Data Revolution Technologies PTY LTD
 * Touch Smart Token (TST)
 */
 
/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return c;
    }

    /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;

  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipRenounced(address indexed previousOwner);
  function bug_unchk_send19() payable public{
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
        require(msg.sender == owner);
        _;
    }

    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param newOwner The address to transfer ownership to.
    */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    /**
    * @dev Allows the current owner to relinquish control of the contract.
    */
    function renounceOwnership() public onlyOwner {
        emit OwnershipRenounced(owner);
        owner = address(0);
    }
}

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
    function totalSupply() public view returns (uint256);
    function balanceOf(address who) public view returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint256);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

    /**
    * @dev total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

}
/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 * @dev Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
    *
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
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Function to check the amount of tokens that an owner allowed to a spender.
    * @param _owner address The address which owns the funds.
    * @param _spender address The address which will spend the funds.
    * @return A uint256 specifying the amount of tokens still available for the spender.
    */
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Increase the amount of tokens that an owner allowed to a spender.
    *
    * approve should be called when allowed[_spender] == 0. To increment
    * allowed value is better to use this function to avoid 2 calls (and wait until
    * the first transaction is mined)
    * From MonolithDAO Token.sol
    * @param _spender The address which will spend the funds.
    * @param _addedValue The amount of tokens to increase the allowance by.
    */
    function increaseApproval(address _spender, uint256 _addedValue) public returns (bool) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Decrease the amount of tokens that an owner allowed to a spender.
    *
    * approve should be called when allowed[_spender] == 0. To decrement
    * allowed value is better to use this function to avoid 2 calls (and wait until
    * the first transaction is mined)
    * From MonolithDAO Token.sol
    * @param _spender The address which will spend the funds.
    * @param _subtractedValue The amount of tokens to decrease the allowance by.
    */
    function decreaseApproval(address _spender, uint256 _subtractedValue) public returns (bool) {
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

}

contract Pausable is Ownable {
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event Pause();
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Unpause();

    bool public paused = false;


    /**
    * @dev Modifier to make a function callable only when the contract is not paused.
    */
    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    /**
    * @dev Modifier to make a function callable only when the contract is paused.
    */
    modifier whenPaused() {
        require(paused);
        _;
    }

    /**
    * @dev called by the owner to pause, triggers stopped state
    */
    function pause() onlyOwner whenNotPaused public {
        paused = true;
        emit Pause();
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev called by the owner to unpause, returns to normal state
    */
    function unpause() onlyOwner whenPaused public {
        paused = false;
        emit Unpause();
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

contract PausableToken is StandardToken, Pausable {

    function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transfer(_to, _value);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
        return super.approve(_spender, _value);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function increaseApproval(address _spender, uint256 _addedValue) public whenNotPaused returns (bool) {
        return super.increaseApproval(_spender, _addedValue);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function decreaseApproval(address _spender, uint256 _subtractedValue) public whenNotPaused returns (bool) {
        return super.decreaseApproval(_spender, _subtractedValue);
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
}

contract TSToken is PausableToken {
    string public constant name = "Touch Smart Token"; 
    string public constant symbol = "TST";
    uint256 public constant decimals = 18;

    mapping (address => uint256) freezes;

    /* This notifies clients about the amount burnt */
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Burn(address indexed from, uint256 value);
	
	/* This notifies clients about the amount frozen */
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Freeze(address indexed from, uint256 value);
	
	/* This notifies clients about the amount unfrozen */
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Unfreeze(address indexed from, uint256 value);

    constructor() public {
        totalSupply_ = 1000000000 * (10 ** uint256(decimals));
        balances[msg.sender] = totalSupply_;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    
    function freezeOf(address _owner) public view returns (uint256) {
        return freezes[_owner];
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    function burn(uint256 _value) whenNotPaused public returns (bool) {
        require(_value <= balances[msg.sender]);
        
        balances[msg.sender] = balances[msg.sender].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
	
	function freeze(uint256 _value) whenNotPaused public returns (bool) {
        require(_value <= balances[msg.sender]);
        
        balances[msg.sender] = balances[msg.sender].sub(_value);
        freezes[msg.sender] = freezes[msg.sender].add(_value);
        emit Freeze(msg.sender, _value);
        return true;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
	
	function unfreeze(uint256 _value) whenNotPaused public returns (bool) {
        require(_value <= freezes[msg.sender]);
        
        freezes[msg.sender] = freezes[msg.sender].sub(_value);
		balances[msg.sender] = balances[msg.sender].add(_value);
        emit Unfreeze(msg.sender, _value);
        return true;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param newOwner The address to transfer ownership to.
    */
    function transferOwnership(address newOwner) onlyOwner whenNotPaused public {
        super.transferOwnership(newOwner);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * The fallback function.
    */
    function() payable external {
        revert();
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
}