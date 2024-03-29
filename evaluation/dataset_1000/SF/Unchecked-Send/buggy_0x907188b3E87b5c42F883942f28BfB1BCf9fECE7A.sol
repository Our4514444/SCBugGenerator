/**
 *Submitted for verification at Etherscan.io on 2020-09-27
*/

pragma solidity ^0.5.8;
// This is a token designed to research Impermanent Loss in an LP. Do not purchase! Token creator will not be liable for any financial damage or loss.//
/**
 * @title SafeMaths
 * @dev Math operations with safety checks that throw on error
 */

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

/**
 */
contract Token {
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;

    function balanceOf(address who) public view returns (uint256);
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint256 value) public returns (bool);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address owner, address spender) public view returns (uint256);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint256 value) public returns (bool);
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint256 value) public returns (bool);
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract StandardToken is Token {
    using SafeMath for uint256;
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping (address => uint256)) internal allowed;
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) balances;

    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(balances[msg.sender] >= _value && balances[_to].add(_value) >= balances[_to]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);

        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}


    /**
    * @dev Transfer tokens from one address to another
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);

        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send19() payable public{
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
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Function to check the amount of tokens that an owner allowed to a spender.
    * @param _owner address The address which owns the funds.
    * @param _spender address The address which will spend the funds.
    * @return A uint256 specifying the amount of tokens still available for the spender.
    */
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * approve should be called when allowed[_spender] == 0. To increment
    * allowed value is better to use this function to avoid 2 calls (and wait until
    * the first transaction is mined)
    * From MonolithDAO Token.sol
    */
    function increaseApproval(address _spender, uint256 _addedValue) public returns (bool success) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);

        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function decreaseApproval(address _spender, uint256 _subtractedValue) public returns (bool success) {
        uint256 oldValue = allowed[msg.sender][_spender];

        if (_subtractedValue > oldValue) {
          allowed[msg.sender][_spender] = 0;
        } else {
          allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }

        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}

contract DappChannel is StandardToken {
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  string public constant name = "Archangel";
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  string public constant symbol = "ARCH";
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public constant decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 100000 * (10**decimals);
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  address public tokenWallet;

    constructor() public {
        totalSupply = INITIAL_SUPPLY;
        tokenWallet = msg.sender;
        balances[tokenWallet] = totalSupply;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}