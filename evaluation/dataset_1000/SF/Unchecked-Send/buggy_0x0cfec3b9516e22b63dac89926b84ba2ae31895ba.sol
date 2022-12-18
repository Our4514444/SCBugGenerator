/**
 *Submitted for verification at Etherscan.io on 2020-04-02
*/

pragma solidity ^0.5.1 ;


contract SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
}

contract HKDOLLARSTABLECOINConstants {
    uint256 constant TOKEN_DECIMALS = 18;
    uint256 constant TOKEN_DECIMALS_UINT8 = uint8(TOKEN_DECIMALS);
    uint256 constant TOKEN_DECIMAL_MULTIPLIER = 10 ** TOKEN_DECIMALS;
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  string public name = "HKDOLLARSTABLECOIN";
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol = "HKDS";
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  string public standard = "ERC20";
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  string public Owner = "Wallex Trust";
}



contract owned {
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
}

contract ERC20Basic {
    uint256 public totalSupply;
    //function balanceOf(address who) view public returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
    //function allowance(address owner, address spender) view public returns (uint256);
  	function transferFrom(address from, address to, uint256 value) public returns (bool);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  	function approve(address spender, uint256 value) public returns (bool);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
 function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
 	event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes calldata _extraData) external; }





contract HKDOLLARSTABLECOIN is owned, ERC20, HKDOLLARSTABLECOINConstants,SafeMath  {

    
    

  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public frozenAccount;

    /* This generates a public event on the blockchain that will notify clients */
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event FrozenFunds(address target, bool frozen);

    /* Initializes contract with initial supply tokens to the creator of the contract */
   
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public balanceOf;
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address from, address to, uint256 value);
    uint256 public totalSupply;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint256)) public allowance;
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address owner, address spender, uint256 value);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Burn(address who, uint256 value);

    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal {
        require (_to != address(0x0));                          // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);                   // Check if the sender has enough
        require (balanceOf[_to] + _value >= balanceOf[_to]);    // Check for overflows
        require(!frozenAccount[_from]);                         // Check if sender is frozen
        require(!frozenAccount[_to]);                           // Check if recipient is frozen
        balanceOf[_from] -= _value;                             // Subtract from the sender
        balanceOf[_to] += _value;                               // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice Create `mintedAmount` tokens and send it to `target`
    /// @param target Address to receive the tokens
    /// @param mintedAmount the amount of tokens it will receive
    function mintToken(address target, uint256 mintedAmount) onlyOwner public {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(address(0), address(this), mintedAmount);
        emit Transfer(address(this), target, mintedAmount);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    /// @param target Address to be frozen
    /// @param freeze either to freeze it or not
    function freezeAccount(address target, bool freeze) onlyOwner public {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    


    /**
     * Internal transfer, only can be called by this contract
     */

    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` in behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) onlyOwner public returns (bool success) {
        //require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Set allowance for other address
     *
     * Allows `_spender` to spend no more than `_value` tokens in your behalf
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) onlyOwner public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Set allowance for other address and notify
     *
     * Allows `_spender` to spend no more than `_value` tokens in your behalf, and then ping the contract about it
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     * @param _extraData some extra information to send to the approved contract
     */
    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData)
        onlyOwner   public 
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, address(this), _extraData);
            return true;
        }
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly
     *
     * @param _value the amount of money to burn
     */
    function burn(uint256 _value) onlyOwner public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) onlyOwner public returns (bool success) {
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        //require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the targeted balance
        allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        totalSupply -= _value;                              // Update totalSupply
        emit Burn(_from, _value);
        return true;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
}