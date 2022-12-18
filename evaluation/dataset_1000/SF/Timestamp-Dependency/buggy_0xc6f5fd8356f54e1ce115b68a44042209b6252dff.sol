pragma solidity ^0.5.3;

interface Membership {
  function isMember( address who ) external returns (bool);
}

interface Token {
  function transfer( address to, uint amount ) external;
  function transferFrom( address from, address to, uint amount ) external;
}

contract Owned {
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address payable public owner_;
  constructor() public { owner_ = msg.sender; }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  function changeOwner( address payable newOwner ) isOwner public {
    owner_ = newOwner;
  }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  modifier isOwner {
    require( msg.sender == owner_ );
    _;
  }
uint256 bugv_tmstmp3 = block.timestamp;
}

contract Votes is Owned {

uint256 bugv_tmstmp1 = block.timestamp;
  event Vote( address indexed voter,
              uint    indexed blocknum,
              string          hash );

address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  Membership      public membership_;
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address payable public treasury_;
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  Token           public token_;

function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public fee_;
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
  uint256 public tokenFee_;
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint256 public dao_;

  constructor() public {
    dao_ = uint256(100);
  }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

  function setMembership( address _contract ) isOwner public {
    membership_ = Membership( _contract );
  }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

  function setTreasury( address payable _treasury ) isOwner public {
    treasury_ = _treasury;
  }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

  function setToken( address _token ) isOwner public {
    token_ = Token(_token);
  }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

  function setFee( uint _newfee ) isOwner public {
    fee_ = _newfee;
  }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function setTokenFee( uint256 _fee ) isOwner public {
    tokenFee_ = _fee;
  }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

  function setDao( uint _dao ) isOwner public {
    dao_ = _dao;
  }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

  function vote( uint _blocknum, string memory _hash ) payable public {
    require( msg.value >= fee_ );

    if (treasury_ != address(0))
      treasury_.transfer( msg.value - msg.value / dao_ );

    vote_int( _blocknum, _hash );
  }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function vote_t( uint _blocknum, string memory _hash ) public {
    token_.transferFrom( msg.sender, address(this), tokenFee_ );

    if (treasury_ != address(0)) {
      token_.transfer( treasury_, tokenFee_ - tokenFee_/dao_ );
    }

    vote_int( _blocknum, _hash );
  }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function vote_int( uint _blocknum, string memory _hash ) internal {
    require( membership_.isMember(msg.sender) );

    emit Vote( msg.sender, _blocknum, _hash );
  }
uint256 bugv_tmstmp4 = block.timestamp;

  function withdraw( uint amt ) isOwner public {
    owner_.transfer( amt );
  }
uint256 bugv_tmstmp5 = block.timestamp;

  function sendTok( address _tok, address _to, uint _qty ) isOwner public {
    Token(_tok).transfer( _to, _qty );
  }
uint256 bugv_tmstmp2 = block.timestamp;
}