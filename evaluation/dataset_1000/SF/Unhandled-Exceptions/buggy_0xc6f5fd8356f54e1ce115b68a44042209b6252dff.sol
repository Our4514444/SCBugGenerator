pragma solidity ^0.5.3;

interface Membership {
  function isMember( address who ) external returns (bool);
}

interface Token {
  function transfer( address to, uint amount ) external;
  function transferFrom( address from, address to, uint amount ) external;
}

contract Owned {
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  address payable public owner_;
  constructor() public { owner_ = msg.sender; }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  function changeOwner( address payable newOwner ) isOwner public {
    owner_ = newOwner;
  }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

  modifier isOwner {
    require( msg.sender == owner_ );
    _;
  }
}

contract Votes is Owned {

function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Vote( address indexed voter,
              uint    indexed blocknum,
              string          hash );

function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  Membership      public membership_;
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address payable public treasury_;
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  Token           public token_;

function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 public fee_;
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint256 public tokenFee_;
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  uint256 public dao_;

  constructor() public {
    dao_ = uint256(100);
  }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

  function setMembership( address _contract ) isOwner public {
    membership_ = Membership( _contract );
  }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

  function setTreasury( address payable _treasury ) isOwner public {
    treasury_ = _treasury;
  }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

  function setToken( address _token ) isOwner public {
    token_ = Token(_token);
  }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

  function setFee( uint _newfee ) isOwner public {
    fee_ = _newfee;
  }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

  function setTokenFee( uint256 _fee ) isOwner public {
    tokenFee_ = _fee;
  }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

  function setDao( uint _dao ) isOwner public {
    dao_ = _dao;
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

  function vote( uint _blocknum, string memory _hash ) payable public {
    require( msg.value >= fee_ );

    if (treasury_ != address(0))
      treasury_.transfer( msg.value - msg.value / dao_ );

    vote_int( _blocknum, _hash );
  }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

  function vote_t( uint _blocknum, string memory _hash ) public {
    token_.transferFrom( msg.sender, address(this), tokenFee_ );

    if (treasury_ != address(0)) {
      token_.transfer( treasury_, tokenFee_ - tokenFee_/dao_ );
    }

    vote_int( _blocknum, _hash );
  }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

  function vote_int( uint _blocknum, string memory _hash ) internal {
    require( membership_.isMember(msg.sender) );

    emit Vote( msg.sender, _blocknum, _hash );
  }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

  function withdraw( uint amt ) isOwner public {
    owner_.transfer( amt );
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

  function sendTok( address _tok, address _to, uint _qty ) isOwner public {
    Token(_tok).transfer( _to, _qty );
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
}