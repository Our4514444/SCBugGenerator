pragma solidity ^0.5.3;

interface Membership {
  function isMember( address who ) external returns (bool);
}

interface Token {
  function transfer( address to, uint amount ) external;
  function transferFrom( address from, address to, uint amount ) external;
}

contract Owned {
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address payable public owner_;
  constructor() public { owner_ = msg.sender; }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  function changeOwner( address payable newOwner ) isOwner public {
    owner_ = newOwner;
  }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

  modifier isOwner {
    require( msg.sender == owner_ );
    _;
  }
}

contract Votes is Owned {

function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Vote( address indexed voter,
              uint    indexed blocknum,
              string          hash );

function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  Membership      public membership_;
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  address payable public treasury_;
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  Token           public token_;

function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public fee_;
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public tokenFee_;
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public dao_;

  constructor() public {
    dao_ = uint256(100);
  }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

  function setMembership( address _contract ) isOwner public {
    membership_ = Membership( _contract );
  }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

  function setTreasury( address payable _treasury ) isOwner public {
    treasury_ = _treasury;
  }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

  function setToken( address _token ) isOwner public {
    token_ = Token(_token);
  }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

  function setFee( uint _newfee ) isOwner public {
    fee_ = _newfee;
  }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

  function setTokenFee( uint256 _fee ) isOwner public {
    tokenFee_ = _fee;
  }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

  function setDao( uint _dao ) isOwner public {
    dao_ = _dao;
  }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

  function vote( uint _blocknum, string memory _hash ) payable public {
    require( msg.value >= fee_ );

    if (treasury_ != address(0))
      treasury_.transfer( msg.value - msg.value / dao_ );

    vote_int( _blocknum, _hash );
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

  function vote_t( uint _blocknum, string memory _hash ) public {
    token_.transferFrom( msg.sender, address(this), tokenFee_ );

    if (treasury_ != address(0)) {
      token_.transfer( treasury_, tokenFee_ - tokenFee_/dao_ );
    }

    vote_int( _blocknum, _hash );
  }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

  function vote_int( uint _blocknum, string memory _hash ) internal {
    require( membership_.isMember(msg.sender) );

    emit Vote( msg.sender, _blocknum, _hash );
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  function withdraw( uint amt ) isOwner public {
    owner_.transfer( amt );
  }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

  function sendTok( address _tok, address _to, uint _qty ) isOwner public {
    Token(_tok).transfer( _to, _qty );
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}