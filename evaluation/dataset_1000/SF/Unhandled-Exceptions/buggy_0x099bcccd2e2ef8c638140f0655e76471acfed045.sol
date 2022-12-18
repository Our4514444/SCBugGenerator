pragma solidity ^0.5.7;

contract Ownable {
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address public owner;
    
  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  event SetOwner(address _owner);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        emit SetOwner(msg.sender);
        owner = msg.sender; 
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /**
        @dev Transfers the ownership of the contract.

        @param _to Address of the new owner
    */
    function setOwner(address _to) external onlyOwner returns (bool) {
        require(_to != address(0));
        emit SetOwner(_to);
        owner = _to;
        return true;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    } 
}

interface Oracle {
    function getRate(bytes32 currency, bytes calldata data) external returns (uint256, uint256);
}

library SafeCast {
    function toUint8(uint256 _v) internal pure returns (uint8) {
        require(_v < 2 ** 8, "uint8 overflow");
        return uint8(_v);
    }

    function toUint40(uint256 _v) internal pure returns (uint40) {
        require(_v < 2 ** 40, "uint40 overflow");
        return uint40(_v);
    }

    function toUint208(uint256 _v) internal pure returns (uint208) {
        require(_v < 2 ** 208, "uint208 overflow");
        return uint208(_v);
    }
}

contract SimpleOracle is Ownable {
    using SafeCast for uint256;

  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  event DelegatedCall(
        address requester,
        address to
    );

  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  event DeliveredRate(
        address requester,
        bytes32 currency,
        uint256 deliverTimestamp,
        uint256 rate,
        uint256 decimals
    );

  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event UpdatedRate(
        address delegate,
        bytes32 currency,
        uint256 timestamp,
        uint256 rate,
        uint256 decimals
    );
    
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event SetExpirationTime(uint256 _time);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event SetUrl(string _url);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event SetFallback(address _fallback);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event SetDelegate(address _delegate);

  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  Oracle public fallback;
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  address public delegate;
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  uint256 public expiration = 6 hours;

  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(bytes32 => Rate) public rates;

  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  string private iurl;

    struct Rate {
        uint8 decimals;
        uint40 timestamp; 
        uint208 value;
    }

    modifier delegateOrOwner() {
        require(msg.sender == delegate || msg.sender == owner, "Not authorized");
        _;
    }

    function url() public view returns (string memory) {
        return iurl;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    function setExpirationTime(uint256 _time) external onlyOwner {
        expiration = _time;
        emit SetExpirationTime(_time);
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function setUrl(string calldata _url) external onlyOwner {
        iurl = _url;
        emit SetUrl(_url);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function setFallback(Oracle _fallback) external onlyOwner {
        fallback = _fallback;
        emit SetFallback(address(_fallback));
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    function setDelegate(address _delegate) external onlyOwner {
        delegate = _delegate;
        emit SetDelegate(_delegate);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
    function updateRate(
        bytes32 _currency,
        uint256 _value,
        uint256 _timestamp,
        uint256 _decimals
    ) external delegateOrOwner {
        require(_timestamp <= block.timestamp, "Future rate");
        require(_timestamp + expiration > block.timestamp, "Rate expired");

        rates[_currency] = Rate(
            _decimals.toUint8(),
            _timestamp.toUint40(),
            _value.toUint208()
        );

        emit UpdatedRate(
            msg.sender,
            _currency,
            _timestamp,
            _value,
            _decimals
        );
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function isExpired(uint256 timestamp) internal view returns (bool) {
        return timestamp <= now - expiration;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function getRate(bytes32 _currency, bytes calldata _data) external returns (uint256, uint256) {
        if (address(fallback) != address(0)) {
            emit DelegatedCall(msg.sender, address(fallback));
            return fallback.getRate(_currency, _data);
        }

        Rate memory rate = rates[_currency];
        require(rate.timestamp + expiration > block.timestamp);
        emit DeliveredRate(msg.sender, _currency, rate.timestamp, rate.value, rate.decimals);
        return (rate.value, rate.decimals);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
}