pragma solidity ^0.5.1;

contract tokenRecipientInterface {
  function receiveApproval(address _from, uint256 _value, address _token, bytes memory _extraData) public;
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
}

contract ERC20TokenInterface {
  function totalSupply() public view returns (uint256 _totalSupply);
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
  function balanceOf(address _owner) public view returns (uint256 balance);
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
  function transfer(address _to, uint256 _value) public returns (bool success);
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
  function approve(address _spender, uint256 _value) public returns (bool success);
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
  function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }

function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract SafeMath {
    
    uint256 constant public MAX_UINT256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

    function safeAdd(uint256 x, uint256 y) pure internal returns (uint256 z) {
        require(x <= MAX_UINT256 - y);
        return x + y;
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    function safeSub(uint256 x, uint256 y) pure internal returns (uint256 z) {
        require(x >= y);
        return x - y;
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

    function safeMul(uint256 x, uint256 y) pure internal returns (uint256 z) {
        if (y == 0) {
            return 0;
        }
        require(x <= (MAX_UINT256 / y));
        return x * y;
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
}

contract Owned {
    address payable public owner;
    address payable public newOwner;

    constructor() public{
        //owner = msg.sender;
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

    modifier onlyOwner {
        assert(msg.sender == owner);
        _;
    }

    function transferOwnership(address payable _newOwner) public onlyOwner {
        require(_newOwner != owner);
        newOwner = _newOwner;
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnerUpdate(owner, newOwner);
        owner = newOwner;
        newOwner = address(0x0);
    }
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }

  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  event OwnerUpdate(address _prevOwner, address _newOwner);
}

contract Lockable is Owned {

    uint256 public lockedUntilBlock;

  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event ContractLocked(uint256 _untilBlock, string _reason);

    modifier lockAffected {
        require(block.number > lockedUntilBlock);
        _;
    }

    function lockFromSelf(uint256 _untilBlock, string memory _reason) internal {
        lockedUntilBlock = _untilBlock;
        emit ContractLocked(_untilBlock, _reason);
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}


    function lockUntil(uint256 _untilBlock, string memory _reason) onlyOwner public {
        lockedUntilBlock = _untilBlock;
        emit ContractLocked(_untilBlock, _reason);
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
}

contract ERC20Token is ERC20TokenInterface, SafeMath, Owned, Lockable {

    // Name of token
    string public name;
    // Abbreviation of tokens name
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  string public symbol;
    // Number of decimals token has
  function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
  uint8 public decimals;
    // Maximum tokens that can be minted
  function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
  uint256 public totalSupplyLimit;

    // Current supply of tokens
  function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  uint256 supply = 0;
    // Map of users balances
  function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => uint256) balances;
    // Map of users allowances
  function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
  mapping (address => mapping (address => uint256)) allowances;

    // Event that shows that new tokens were created
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event Mint(address indexed _to, uint256 _value);
    // Event that shows that old tokens were destroyed
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event Burn(address indexed _from, uint _value);

    /**
    * @dev Returns number of tokens in circulation
    *
    * @return total number od tokens
    */
    function totalSupply() public view returns (uint256) {
        return supply;
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }

    /**
    * @dev Returns the balance of specific account
    *
    * @param _owner The account that caller wants to querry
    * @return the balance on this account
    */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

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
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}

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
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }

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
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}

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
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
    
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
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

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
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

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
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

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
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

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
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    /**
    * @dev Disables the contract and wipes all the balances, can be used only by owner
    */
    function killContract() public onlyOwner {
        selfdestruct(owner);
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
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
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
}