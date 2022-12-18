pragma solidity ^0.5.7;

contract Ownable {
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
  address public owner;
    
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
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
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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

  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
  event DelegatedCall(
        address requester,
        address to
    );

  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event DeliveredRate(
        address requester,
        bytes32 currency,
        uint256 deliverTimestamp,
        uint256 rate,
        uint256 decimals
    );

  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event UpdatedRate(
        address delegate,
        bytes32 currency,
        uint256 timestamp,
        uint256 rate,
        uint256 decimals
    );
    
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event SetExpirationTime(uint256 _time);
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event SetUrl(string _url);
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event SetFallback(address _fallback);
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event SetDelegate(address _delegate);

  function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  Oracle public fallback;
  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
  address public delegate;
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  uint256 public expiration = 6 hours;

  function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  mapping(bytes32 => Rate) public rates;

  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
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
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}

    function setExpirationTime(uint256 _time) external onlyOwner {
        expiration = _time;
        emit SetExpirationTime(_time);
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function setUrl(string calldata _url) external onlyOwner {
        iurl = _url;
        emit SetUrl(_url);
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

    function setFallback(Oracle _fallback) external onlyOwner {
        fallback = _fallback;
        emit SetFallback(address(_fallback));
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function setDelegate(address _delegate) external onlyOwner {
        delegate = _delegate;
        emit SetDelegate(_delegate);
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
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

    function isExpired(uint256 timestamp) internal view returns (bool) {
        return timestamp <= now - expiration;
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
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
}