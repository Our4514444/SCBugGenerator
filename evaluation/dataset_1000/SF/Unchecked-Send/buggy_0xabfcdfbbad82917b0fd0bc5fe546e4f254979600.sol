pragma solidity ^0.5.1;

contract tokenRecipientInterface {
  function receiveApproval(address _from, uint256 _value, address _token, bytes memory _extraData) public;
}

contract ERC20TokenInterface {
  function totalSupply() public view returns (uint256 _totalSupply);
  function balanceOf(address _owner) public view returns (uint256 balance);
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  function transfer(address _to, uint256 _value) public returns (bool success);
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  function approve(address _spender, uint256 _value) public returns (bool success);
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract SafeMath {
    
    uint256 constant public MAX_UINT256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

    function safeAdd(uint256 x, uint256 y) pure internal returns (uint256 z) {
        require(x <= MAX_UINT256 - y);
        return x + y;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function safeSub(uint256 x, uint256 y) pure internal returns (uint256 z) {
        require(x >= y);
        return x - y;
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function safeMul(uint256 x, uint256 y) pure internal returns (uint256 z) {
        if (y == 0) {
            return 0;
        }
        require(x <= (MAX_UINT256 / y));
        return x * y;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
}

contract Owned {
    address payable public owner;
    address payable public newOwner;

    constructor() public{
        //owner = msg.sender;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        assert(msg.sender == owner);
        _;
    }

    function transferOwnership(address payable _newOwner) public onlyOwner {
        require(_newOwner != owner);
        newOwner = _newOwner;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnerUpdate(owner, newOwner);
        owner = newOwner;
        newOwner = address(0x0);
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event OwnerUpdate(address _prevOwner, address _newOwner);
}

contract Lockable is Owned {

    uint256 public lockedUntilBlock;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event ContractLocked(uint256 _untilBlock, string _reason);

    modifier lockAffected {
        require(block.number > lockedUntilBlock);
        _;
    }

    function lockFromSelf(uint256 _untilBlock, string memory _reason) internal {
        lockedUntilBlock = _untilBlock;
        emit ContractLocked(_untilBlock, _reason);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}


    function lockUntil(uint256 _untilBlock, string memory _reason) onlyOwner public {
        lockedUntilBlock = _untilBlock;
        emit ContractLocked(_untilBlock, _reason);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
}

contract ERC20Token is ERC20TokenInterface, SafeMath, Owned, Lockable {

    // Name of token
    string public name;
    // Abbreviation of tokens name
    string public symbol;
    // Number of decimals token has
    uint8 public decimals;
    // Maximum tokens that can be minted
    uint256 public totalSupplyLimit;

    // Current supply of tokens
    uint256 supply = 0;
    // Map of users balances
    mapping (address => uint256) balances;
    // Map of users allowances
    mapping (address => mapping (address => uint256)) allowances;

    // Event that shows that new tokens were created
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Mint(address indexed _to, uint256 _value);
    // Event that shows that old tokens were destroyed
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Burn(address indexed _from, uint _value);

    /**
    * @dev Returns number of tokens in circulation
    *
    * @return total number od tokens
    */
    function totalSupply() public view returns (uint256) {
        return supply;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Returns the balance of specific account
    *
    * @param _owner The account that caller wants to querry
    * @return the balance on this account
    */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev User can transfer tokens with this method, method is disabled if emergencyLock is activated
    *
    * @param _to Reciever of tokens
    * @param _value The amount of tokens that will be sent 
    * @return if successful returns true
    */
    function transfer(address _to, uint256 _value) lockAffected public returns (bool success) {
        require(_to != address(0x0) && _to != address(this));
        balances[msg.sender] = safeSub(balanceOf(msg.sender), _value);
        balances[_to] = safeAdd(balanceOf(_to), _value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev This is used to allow some account to utilise transferFrom and sends tokens on your behalf, this method is disabled if emergencyLock is activated
    *
    * @param _spender Who can send tokens on your behalf
    * @param _value The amount of tokens that are allowed to be sent 
    * @return if successful returns true
    */
    function approve(address _spender, uint256 _value) lockAffected public returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev This is used to send tokens and execute code on other smart contract, this method is disabled if emergencyLock is activated
    *
    * @param _spender Contract that is receiving tokens
    * @param _value The amount that msg.sender is sending
    * @param _extraData Additional params that can be used on reciving smart contract
    * @return if successful returns true
    */
    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) lockAffected public returns (bool success) {
        tokenRecipientInterface spender = tokenRecipientInterface(_spender);
        approve(_spender, _value);
        spender.receiveApproval(msg.sender, _value, address(this), _extraData);
        return true;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Sender can transfer tokens on others behalf, this method is disabled if emergencyLock is activated
    *
    * @param _from The account that will send tokens
    * @param _to Account that will recive the tokens
    * @param _value The amount that msg.sender is sending
    * @return if successful returns true
    */
    function transferFrom(address _from, address _to, uint256 _value) lockAffected public returns (bool success) {
        require(_to != address(0x0) && _to != address(this));
        balances[_from] = safeSub(balanceOf(_from), _value);
        balances[_to] = safeAdd(balanceOf(_to), _value);
        allowances[_from][msg.sender] = safeSub(allowances[_from][msg.sender], _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
    * @dev Owner can transfer tokens on others behalf withouth any allowance
    *
    * @param _from The account that will send tokens
    * @param _to Account that will recive the tokens
    * @param _value The amount that msg.sender is sending
    * @return if successful returns true
    */
    function ownerTransferFrom(address _from, address _to, uint256 _value) onlyOwner public returns (bool success) {
        balances[_from] = safeSub(balanceOf(_from), _value);
        balances[_to] = safeAdd(balanceOf(_to), _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Returns the amount od tokens that can be sent from this addres by spender
    *
    * @param _owner Account that has tokens
    * @param _spender Account that can spend tokens
    * @return remaining balance to spend
    */
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Creates new tokens as long as total supply does not reach limit
    *
    * @param _to Reciver od newly created tokens
    * @param _amount Amount of tokens to be created;
    */
    function mintTokens(address _to, uint256 _amount) onlyOwner public {
        require(supply + _amount <= totalSupplyLimit);
        supply = safeAdd(supply, _amount);
        balances[_to] = safeAdd(balances[_to], _amount);
        emit Mint(_to, _amount);
        emit Transfer(address(0x0), _to, _amount);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Destroys the amount of tokens and lowers total supply
    *
    * @param _amount Number of tokens user wants to destroy
    */
    function burn(uint _amount) public {
        balances[msg.sender] = safeSub(balanceOf(msg.sender), _amount);
        supply = safeSub(supply, _amount);
        emit Burn(msg.sender, _amount);
        emit Transfer(msg.sender, address(0x0), _amount);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Saves exidentaly sent tokens to this contract, can be used only by owner
    *
    * @param _tokenAddress Address of tokens smart contract
    * @param _to Where to send the tokens
    * @param _amount The amount of tokens that we are salvaging
    */
    function salvageTokensFromContract(address _tokenAddress, address _to, uint _amount) onlyOwner public {
        ERC20TokenInterface(_tokenAddress).transfer(_to, _amount);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Disables the contract and wipes all the balances, can be used only by owner
    */
    function killContract() public onlyOwner {
        selfdestruct(owner);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}

contract MRPROTokenContract is ERC20Token {

    /**
    * @dev Intialises token and all the necesary variable
    */
    constructor() public {
        owner = 0xa12F88dC40BA5629C87D37d20EE46759b6a2f6ac;
        name = "MRPROToken";
        symbol = "MRPRO";
        decimals = 18;
        totalSupplyLimit = 1000000000 * 10**18;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
}