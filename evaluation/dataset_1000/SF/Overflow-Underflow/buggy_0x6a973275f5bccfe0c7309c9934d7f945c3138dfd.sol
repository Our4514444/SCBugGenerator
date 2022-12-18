pragma solidity 0.5.6;

// ---------------------------------------------------------------------------
//  Message_Transport
// ---------------------------------------------------------------------------
//import './SafeMath.sol';
/*
    Overflow protected math functions
*/
contract SafeMath {
    /**
        constructor
    */
    constructor() public {
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

    /**
        @dev returns the sum of _x and _y, asserts if the calculation overflows

        @param _x   value 1
        @param _y   value 2

        @return sum
    */
    function safeAdd(uint256 _x, uint256 _y) pure internal returns (uint256) {
        uint256 z = _x + _y;
        assert(z >= _x);
        return z;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }

    /**
        @dev returns the difference of _x minus _y, asserts if the subtraction results in a negative number

        @param _x   minuend
        @param _y   subtrahend

        @return difference
    */
    function safeSub(uint256 _x, uint256 _y) pure internal returns (uint256) {
        assert(_x >= _y);
        return _x - _y;
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

    /**
        @dev returns the product of multiplying _x by _y, asserts if the calculation overflows

        @param _x   factor 1
        @param _y   factor 2

        @return product
    */
    function safeMul(uint256 _x, uint256 _y) pure internal returns (uint256) {
        uint256 z = _x * _y;
        assert(_x == 0 || z / _x == _y);
        return z;
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
}

//import './Ownable.sol';
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
  address private _owner;

  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }

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
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     * @notice Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
}


contract MessageTransport is SafeMath, Ownable {

  // -------------------------------------------------------------------------
  // events
  // etherscan.io's Event Log API does not have an option to match multiple values
  // in an individual topic. so in order to match any one of three message id's we
  // duplicate the message id into 3 topic position.
  // -------------------------------------------------------------------------
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event InviteEvent(address indexed _toAddr, address indexed _fromAddr);
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event MessageEvent(uint indexed _id1, uint indexed _id2, uint indexed _id3,
                     address _fromAddr, address _toAddr, address _via, uint _txCount, uint _rxCount, uint _attachmentIdx, uint _ref, bytes message);
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event MessageTxEvent(address indexed _fromAddr, uint indexed _txCount, uint _id);
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event MessageRxEvent(address indexed _toAddr, uint indexed _rxCount, uint _id);


  // -------------------------------------------------------------------------
  // Account structure
  // there is a single account structure for all account types
  // -------------------------------------------------------------------------
  struct Account {
    bool isValid;
    uint messageFee;           // pay this much for every non-spam message sent to this account
    uint spamFee;              // pay this much for every spam message sent to this account
    uint feeBalance;           // includes spam and non-spam fees
    uint recvMessageCount;     // total messages received
    uint sentMessageCount;     // total messages sent
    bytes publicKey;           // encryption parameter
    bytes encryptedPrivateKey; // encryption parameter
    mapping (address => uint256) peerRecvMessageCount;
    mapping (uint256 => uint256) recvIds;
    mapping (uint256 => uint256) sentIds;
  }


  // -------------------------------------------------------------------------
  // data storage
  // -------------------------------------------------------------------------
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  bool public isLocked;
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
  address public tokenAddr;
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }
  uint public messageCount;
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  uint public retainedFeesBalance;
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => bool) public trusted;
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => Account) public accounts;


  // -------------------------------------------------------------------------
  // modifiers
  // -------------------------------------------------------------------------
  modifier trustedOnly {
    require(trusted[msg.sender] == true, "trusted only");
    _;
  }


  // -------------------------------------------------------------------------
  //  MessageTransport constructor
  // -------------------------------------------------------------------------
  constructor(address _tokenAddr) public {
    tokenAddr = _tokenAddr;
  }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  function setTrust(address _trustedAddr, bool _trust) public onlyOwner {
    trusted[_trustedAddr] = _trust;
  }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}


  // -------------------------------------------------------------------------
  // register a message account
  // the decryption key for the encryptedPrivateKey should be guarded with the
  // same secrecy and caution as the ethereum private key. in fact the decryption
  // key should never be tranmitted or stored at all -- but always derived from a
  // message signature; that is, through metamask.
  // -------------------------------------------------------------------------
  function register(uint256 _messageFee, uint256 _spamFee, bytes memory _publicKey, bytes memory _encryptedPrivateKey) public {
    Account storage _account = accounts[msg.sender];
    require(_account.isValid == false, "account already registered");
    _account.publicKey = _publicKey;
    _account.encryptedPrivateKey = _encryptedPrivateKey;
    _account.isValid = true;
    _modifyAccount(_account, _messageFee, _spamFee);
  }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
  function modifyAccount(uint256 _messageFee, uint256 _spamFee) public {
    Account storage _account = accounts[msg.sender];
    require(_account.isValid == true, "not registered");
    _modifyAccount(_account, _messageFee, _spamFee);
  }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  function _modifyAccount(Account storage _account, uint256 _messageFee, uint256 _spamFee) internal {
    _account.messageFee = _messageFee;
    _account.spamFee = _spamFee;
  }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}


  // -------------------------------------------------------------------------
  // get the number of messages that have been sent from one peer to another
  // -------------------------------------------------------------------------
  function getPeerMessageCount(address _from, address _to) public view returns(uint256 _messageCount) {
    Account storage _account = accounts[_to];
    _messageCount = _account.peerRecvMessageCount[_from];
  }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}



  // -------------------------------------------------------------------------
  // get _maxResults message id's of received messages
  // note that array will always have _maxResults entries. ignore messageID = 0
  // -------------------------------------------------------------------------
  function getRecvMsgs(address _to, uint256 _startIdx, uint256 _maxResults) public view returns(uint256 _idx, uint256[] memory _messageIds) {
    uint _count = 0;
    Account storage _recvAccount = accounts[_to];
    uint256 _recvMessageCount = _recvAccount.recvMessageCount;
    _messageIds = new uint256[](_maxResults);
    mapping(uint256 => uint256) storage _recvIds = _recvAccount.recvIds;
    //first messageID is at recvIds[0];
    for (_idx = _startIdx; _idx < _recvMessageCount; ++_idx) {
      _messageIds[_count] = _recvIds[_idx];
      if (++_count >= _maxResults)
        break;
    }
  }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

  // -------------------------------------------------------------------------
  // get _maxResults message id's of sent messages
  // note that array will always have _maxResults entries. ignore messageID = 0
  // -------------------------------------------------------------------------
  function getSentMsgs(address _from, uint256 _startIdx, uint256 _maxResults) public view returns(uint256 _idx, uint256[] memory _messageIds) {
    uint _count = 0;
    Account storage _sentAccount = accounts[_from];
    uint256 _sentMessageCount = _sentAccount.sentMessageCount;
    _messageIds = new uint256[](_maxResults);
    mapping(uint256 => uint256) storage _sentIds = _sentAccount.sentIds;
    //note first messageID is at recvIds[0];
    for (_idx = _startIdx; _idx < _sentMessageCount; ++_idx) {
      _messageIds[_count] = _sentIds[_idx];
      if (++_count >= _maxResults)
        break;
    }
  }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}


  // -------------------------------------------------------------------------
  // get the required fee in order to send a message (or spam message)
  // the second version is handy for calls from partner contract(s)
  // -------------------------------------------------------------------------
  function getFee(address _toAddr) public view returns(uint256 _fee) {
    Account storage _sendAccount = accounts[msg.sender];
    Account storage _recvAccount = accounts[_toAddr];
    if (_sendAccount.peerRecvMessageCount[_toAddr] == 0)
      _fee = _recvAccount.spamFee;
    else
      _fee = _recvAccount.messageFee;
  }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
  function getFee(address _fromAddr, address _toAddr) public view trustedOnly returns(uint256 _fee) {
    Account storage _sendAccount = accounts[_fromAddr];
    Account storage _recvAccount = accounts[_toAddr];
    if (_sendAccount.peerRecvMessageCount[_toAddr] == 0)
      _fee = _recvAccount.spamFee;
    else
      _fee = _recvAccount.messageFee;
  }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}


  // -------------------------------------------------------------------------
  // send message
  // the via address is set to the address of the trusted contract (or zero in
  // case the fromAddr is msg.sender). in this way a DApp can indicate the via
  // address to the recipient when the message was not sent directly from the
  // sender.
  // -------------------------------------------------------------------------
  function sendMessage(address _toAddr, uint attachmentIdx, uint _ref, bytes memory _message) public payable returns (uint _messageId) {
    uint256 _noDataLength = 4 + 32 + 32 + 32 + 64;
    _messageId = doSendMessage(_noDataLength, msg.sender, _toAddr, address(0), attachmentIdx, _ref, _message);
  }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
  function sendMessage(address _fromAddr, address _toAddr, uint attachmentIdx, uint _ref, bytes memory _message) public payable trustedOnly returns (uint _messageId) {
    uint256 _noDataLength = 4 + 32 + 32 + 32 + 32 + 64;
    _messageId = doSendMessage(_noDataLength, _fromAddr, _toAddr, msg.sender, attachmentIdx, _ref, _message);
  }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }


  function doSendMessage(uint256 _noDataLength, address _fromAddr, address _toAddr, address _via, uint attachmentIdx, uint _ref, bytes memory _message) internal returns (uint _messageId) {
    Account storage _sendAccount = accounts[_fromAddr];
    Account storage _recvAccount = accounts[_toAddr];
    require(_sendAccount.isValid == true, "sender not registered");
    require(_recvAccount.isValid == true, "recipient not registered");
    //if message text is empty then no fees are necessary, and we don't create a log entry.
    //after you introduce yourself to someone this way their subsequent message to you won't
    //incur your spamFee.
    if (msg.data.length > _noDataLength) {
      if (_sendAccount.peerRecvMessageCount[_toAddr] == 0)
        require(msg.value >= _recvAccount.spamFee, "spam fee is insufficient");
      else
        require(msg.value >= _recvAccount.messageFee, "fee is insufficient");
      messageCount = safeAdd(messageCount, 1);
      _recvAccount.recvIds[_recvAccount.recvMessageCount] = messageCount;
      _sendAccount.sentIds[_sendAccount.sentMessageCount] = messageCount;
      _recvAccount.recvMessageCount = safeAdd(_recvAccount.recvMessageCount, 1);
      _sendAccount.sentMessageCount = safeAdd(_sendAccount.sentMessageCount, 1);
      emit MessageEvent(messageCount, messageCount, messageCount, _fromAddr, _toAddr, _via, _sendAccount.sentMessageCount, _recvAccount.recvMessageCount, attachmentIdx, _ref, _message);
      emit MessageTxEvent(_fromAddr, _sendAccount.sentMessageCount, messageCount);
      emit MessageRxEvent(_toAddr, _recvAccount.recvMessageCount, messageCount);
      //return message id, which a calling function might want to log
      _messageId = messageCount;
    } else {
      emit InviteEvent(_toAddr, _fromAddr);
      _messageId = 0;
    }
    uint _retainAmount = safeMul(msg.value, 30) / 100;
    retainedFeesBalance = safeAdd(retainedFeesBalance, _retainAmount);
    _recvAccount.feeBalance = safeAdd(_recvAccount.feeBalance, safeSub(msg.value, _retainAmount));
    _recvAccount.peerRecvMessageCount[_fromAddr] = safeAdd(_recvAccount.peerRecvMessageCount[_fromAddr], 1);
  }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}


  // -------------------------------------------------------------------------
  // withdraw accumulated message & spam fees
  // -------------------------------------------------------------------------
  function withdraw() public {
    Account storage _account = accounts[msg.sender];
    uint _amount = _account.feeBalance;
    _account.feeBalance = 0;
    msg.sender.transfer(_amount);
  }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }


  // -------------------------------------------------------------------------
  // pay retained fees funds to token contract; burn half.
  // -------------------------------------------------------------------------
  function withdrawRetainedFees() public {
    uint _amount = retainedFeesBalance / 2;
    address(0).transfer(_amount);
    _amount = safeSub(retainedFeesBalance, _amount);
    retainedFeesBalance = 0;
    (bool paySuccess, ) = tokenAddr.call.value(_amount)("");
    require(paySuccess, "failed to transfer fees");
  }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

}