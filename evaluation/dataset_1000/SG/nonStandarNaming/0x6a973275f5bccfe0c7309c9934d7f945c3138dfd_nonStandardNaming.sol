pragma solidity 0.5.6;

// ---------------------------------------------------------------------------
//  Message_Transport
// ---------------------------------------------------------------------------
//import './SafeMath.sol';
                                           
contract SafeMath {
                                  
    constructor() public {
    }

                                                                                                                                                                            
    function SAFEADD625(uint256 _x, uint256 _y) pure internal returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 z = _x + _y;
        assert(z >= _x);
        return z;
    }

                                                                                                                                                                                                                  
    function SAFESUB921(uint256 _x, uint256 _y) pure internal returns (uint256) {	//inject NONSTANDARD NAMING
        assert(_x >= _y);
        return _x - _y;
    }

                                                                                                                                                                                                 
    function SAFEMUL664(uint256 _x, uint256 _y) pure internal returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 z = _x * _y;
        assert(_x == 0 || z / _x == _y);
        return z;
    }
}

//import './Ownable.sol';
                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED894(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED894(address(0), _owner);
    }

                                                        
    function OWNER299() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER993() {	//inject NONSTANDARD NAMING
        require(ISOWNER343());
        _;
    }

                                                                                 
    function ISOWNER343() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP562() public ONLYOWNER993 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED894(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP371(address newOwner) public ONLYOWNER993 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP804(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP804(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED894(_owner, newOwner);
        _owner = newOwner;
    }
}


contract MessageTransport is SafeMath, Ownable {

  // -------------------------------------------------------------------------
  // events
  // etherscan.io's Event Log API does not have an option to match multiple values
  // in an individual topic. so in order to match any one of three message id's we
  // duplicate the message id into 3 topic position.
  // -------------------------------------------------------------------------
  event INVITEEVENT30(address indexed _toAddr, address indexed _fromAddr);	//inject NONSTANDARD NAMING
  event MESSAGEEVENT13(uint indexed _id1, uint indexed _id2, uint indexed _id3,	//inject NONSTANDARD NAMING
                     address _fromAddr, address _toAddr, address _via, uint _txCount, uint _rxCount, uint _attachmentIdx, uint _ref, bytes message);
  event MESSAGETXEVENT782(address indexed _fromAddr, uint indexed _txCount, uint _id);	//inject NONSTANDARD NAMING
  event MESSAGERXEVENT52(address indexed _toAddr, uint indexed _rxCount, uint _id);	//inject NONSTANDARD NAMING


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
  bool public isLocked;
  address public tokenAddr;
  uint public messageCount;
  uint public retainedFeesBalance;
  mapping (address => bool) public trusted;
  mapping (address => Account) public accounts;


  // -------------------------------------------------------------------------
  // modifiers
  // -------------------------------------------------------------------------
  modifier TRUSTEDONLY492 {	//inject NONSTANDARD NAMING
    require(trusted[msg.sender] == true, "trusted only");
    _;
  }


  // -------------------------------------------------------------------------
  //  MessageTransport constructor
  // -------------------------------------------------------------------------
  constructor(address _tokenAddr) public {
    tokenAddr = _tokenAddr;
  }
  function SETTRUST545(address _trustedAddr, bool _trust) public ONLYOWNER993 {	//inject NONSTANDARD NAMING
    trusted[_trustedAddr] = _trust;
  }


  // -------------------------------------------------------------------------
  // register a message account
  // the decryption key for the encryptedPrivateKey should be guarded with the
  // same secrecy and caution as the ethereum private key. in fact the decryption
  // key should never be tranmitted or stored at all -- but always derived from a
  // message signature; that is, through metamask.
  // -------------------------------------------------------------------------
  function REGISTER654(uint256 _messageFee, uint256 _spamFee, bytes memory _publicKey, bytes memory _encryptedPrivateKey) public {	//inject NONSTANDARD NAMING
    Account storage _account = accounts[msg.sender];
    require(_account.isValid == false, "account already registered");
    _account.publicKey = _publicKey;
    _account.encryptedPrivateKey = _encryptedPrivateKey;
    _account.isValid = true;
    _MODIFYACCOUNT14(_account, _messageFee, _spamFee);
  }
  function MODIFYACCOUNT862(uint256 _messageFee, uint256 _spamFee) public {	//inject NONSTANDARD NAMING
    Account storage _account = accounts[msg.sender];
    require(_account.isValid == true, "not registered");
    _MODIFYACCOUNT14(_account, _messageFee, _spamFee);
  }
  function _MODIFYACCOUNT14(Account storage _account, uint256 _messageFee, uint256 _spamFee) internal {	//inject NONSTANDARD NAMING
    _account.messageFee = _messageFee;
    _account.spamFee = _spamFee;
  }


  // -------------------------------------------------------------------------
  // get the number of messages that have been sent from one peer to another
  // -------------------------------------------------------------------------
  function GETPEERMESSAGECOUNT505(address _from, address _to) public view returns(uint256 _messageCount) {	//inject NONSTANDARD NAMING
    Account storage _account = accounts[_to];
    _messageCount = _account.peerRecvMessageCount[_from];
  }



  // -------------------------------------------------------------------------
  // get _maxResults message id's of received messages
  // note that array will always have _maxResults entries. ignore messageID = 0
  // -------------------------------------------------------------------------
  function GETRECVMSGS615(address _to, uint256 _startIdx, uint256 _maxResults) public view returns(uint256 _idx, uint256[] memory _messageIds) {	//inject NONSTANDARD NAMING
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

  // -------------------------------------------------------------------------
  // get _maxResults message id's of sent messages
  // note that array will always have _maxResults entries. ignore messageID = 0
  // -------------------------------------------------------------------------
  function GETSENTMSGS627(address _from, uint256 _startIdx, uint256 _maxResults) public view returns(uint256 _idx, uint256[] memory _messageIds) {	//inject NONSTANDARD NAMING
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


  // -------------------------------------------------------------------------
  // get the required fee in order to send a message (or spam message)
  // the second version is handy for calls from partner contract(s)
  // -------------------------------------------------------------------------
  function GETFEE195(address _toAddr) public view returns(uint256 _fee) {	//inject NONSTANDARD NAMING
    Account storage _sendAccount = accounts[msg.sender];
    Account storage _recvAccount = accounts[_toAddr];
    if (_sendAccount.peerRecvMessageCount[_toAddr] == 0)
      _fee = _recvAccount.spamFee;
    else
      _fee = _recvAccount.messageFee;
  }
  function GETFEE195(address _fromAddr, address _toAddr) public view TRUSTEDONLY492 returns(uint256 _fee) {	//inject NONSTANDARD NAMING
    Account storage _sendAccount = accounts[_fromAddr];
    Account storage _recvAccount = accounts[_toAddr];
    if (_sendAccount.peerRecvMessageCount[_toAddr] == 0)
      _fee = _recvAccount.spamFee;
    else
      _fee = _recvAccount.messageFee;
  }


  // -------------------------------------------------------------------------
  // send message
  // the via address is set to the address of the trusted contract (or zero in
  // case the fromAddr is msg.sender). in this way a DApp can indicate the via
  // address to the recipient when the message was not sent directly from the
  // sender.
  // -------------------------------------------------------------------------
  function SENDMESSAGE691(address _toAddr, uint attachmentIdx, uint _ref, bytes memory _message) public payable returns (uint _messageId) {	//inject NONSTANDARD NAMING
    uint256 _noDataLength = 4 + 32 + 32 + 32 + 64;
    _messageId = DOSENDMESSAGE92(_noDataLength, msg.sender, _toAddr, address(0), attachmentIdx, _ref, _message);
  }
  function SENDMESSAGE691(address _fromAddr, address _toAddr, uint attachmentIdx, uint _ref, bytes memory _message) public payable TRUSTEDONLY492 returns (uint _messageId) {	//inject NONSTANDARD NAMING
    uint256 _noDataLength = 4 + 32 + 32 + 32 + 32 + 64;
    _messageId = DOSENDMESSAGE92(_noDataLength, _fromAddr, _toAddr, msg.sender, attachmentIdx, _ref, _message);
  }


  function DOSENDMESSAGE92(uint256 _noDataLength, address _fromAddr, address _toAddr, address _via, uint attachmentIdx, uint _ref, bytes memory _message) internal returns (uint _messageId) {	//inject NONSTANDARD NAMING
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
      messageCount = SAFEADD625(messageCount, 1);
      _recvAccount.recvIds[_recvAccount.recvMessageCount] = messageCount;
      _sendAccount.sentIds[_sendAccount.sentMessageCount] = messageCount;
      _recvAccount.recvMessageCount = SAFEADD625(_recvAccount.recvMessageCount, 1);
      _sendAccount.sentMessageCount = SAFEADD625(_sendAccount.sentMessageCount, 1);
      emit MESSAGEEVENT13(messageCount, messageCount, messageCount, _fromAddr, _toAddr, _via, _sendAccount.sentMessageCount, _recvAccount.recvMessageCount, attachmentIdx, _ref, _message);
      emit MESSAGETXEVENT782(_fromAddr, _sendAccount.sentMessageCount, messageCount);
      emit MESSAGERXEVENT52(_toAddr, _recvAccount.recvMessageCount, messageCount);
      //return message id, which a calling function might want to log
      _messageId = messageCount;
    } else {
      emit INVITEEVENT30(_toAddr, _fromAddr);
      _messageId = 0;
    }
    uint _retainAmount = SAFEMUL664(msg.value, 30) / 100;
    retainedFeesBalance = SAFEADD625(retainedFeesBalance, _retainAmount);
    _recvAccount.feeBalance = SAFEADD625(_recvAccount.feeBalance, SAFESUB921(msg.value, _retainAmount));
    _recvAccount.peerRecvMessageCount[_fromAddr] = SAFEADD625(_recvAccount.peerRecvMessageCount[_fromAddr], 1);
  }


  // -------------------------------------------------------------------------
  // withdraw accumulated message & spam fees
  // -------------------------------------------------------------------------
  function WITHDRAW416() public {	//inject NONSTANDARD NAMING
    Account storage _account = accounts[msg.sender];
    uint _amount = _account.feeBalance;
    _account.feeBalance = 0;
    msg.sender.transfer(_amount);
  }


  // -------------------------------------------------------------------------
  // pay retained fees funds to token contract; burn half.
  // -------------------------------------------------------------------------
  function WITHDRAWRETAINEDFEES225() public {	//inject NONSTANDARD NAMING
    uint _amount = retainedFeesBalance / 2;
    address(0).transfer(_amount);
    _amount = SAFESUB921(retainedFeesBalance, _amount);
    retainedFeesBalance = 0;
    (bool paySuccess, ) = tokenAddr.call.value(_amount)("");
    require(paySuccess, "failed to transfer fees");
  }

}