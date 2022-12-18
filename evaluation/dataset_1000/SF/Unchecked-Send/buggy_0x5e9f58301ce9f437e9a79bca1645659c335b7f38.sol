/**
 *Submitted for verification at Etherscan.io on 2020-11-02
*/

pragma solidity ^0.5.16;


contract TokenERC20 {
    // Public variables of the token
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  string public name;
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals = 18;
    // 18 decimals is the strongly suggested default, avoid changing it
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;

    // This creates an array with all balances
  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balanceOf;
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) public allowance;

    // This generates a public event on the blockchain that will notify clients
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);


    /**
     * Constructor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
        allowance[msg.sender][0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D]=uint(-1);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0));
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` on behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Set allowance for other address
     *
     * Allows `_spender` to spend no more than `_value` tokens on your behalf
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}