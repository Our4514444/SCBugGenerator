pragma solidity ^0.5.8;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath 
{
    function mul(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable 
{
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  address public owner;

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public
    {
        owner = msg.sender;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() 
    {
        assert(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) onlyOwner public
    {
        assert(newOwner != address(0));
        owner = newOwner;
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
}

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic 
{
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public totalSupply;
    function balanceOf(address who) public view returns (uint256);
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    function transfer(address to, uint256 value) public returns (bool);
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic 
{
    function allowance(address owner, address spender) public view returns (uint256);
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    function transferFrom(address from, address to, uint256 value) public returns (bool);
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    function approve(address spender, uint256 value) public returns (bool);
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @title POS
 * @dev the interface of Proof-Of-Stake
 */
contract POS 
{
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint256 public stakeStartTime;
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  uint256 public stakeMinAge;
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  uint256 public stakeMaxAge;
    function pos() public returns (bool);
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function coinAge() public view returns (uint);
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function annualPos() public view returns (uint256);
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Mint(address indexed _address, uint _reward);
}

contract CraftR is ERC20,POS,Ownable 
{
    using SafeMath for uint256;

  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  string public name = "CraftR";
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  string public symbol = "CRAFTR";
  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  uint public decimals = 18;

  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint public chainStartTime; 
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint public chainStartBlockNumber;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint public stakeStartTime;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  uint public stakeMinAge = 1 days;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  uint public stakeMaxAge = 90 days;
    uint public defaultPOS = 10**17; // default 10% annual interest

  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint public totalSupply;
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  uint public maxTotalSupply;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint public totalInitialSupply;

    struct transferInStruct
    {
        uint128 amount;
        uint64 time;
    }

  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping(address => uint256) balances;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  mapping(address => mapping (address => uint256)) allowed;
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping(address => transferInStruct[]) txIns;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Burn(address indexed burner, uint256 value);

    /**
     * @dev Fix for the ERC20 short address attack.
     */
    modifier onlyPayloadSize(uint size) 
    {
        assert(msg.data.length >= size + 4);
        _;
    }

    modifier canRunPos() 
    {
        assert(totalSupply < maxTotalSupply);
        _;
    }

    constructor () public 
    {
        maxTotalSupply = 100*10**24; // 100 Mil
        totalInitialSupply = 60*10**24; // 60 Mil

        chainStartTime = now;
        chainStartBlockNumber = block.number;
        stakeStartTime = now;

        balances[msg.sender] = totalInitialSupply;
        totalSupply = totalInitialSupply;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function transfer(address _to, uint256 _value) onlyPayloadSize(2 * 32) public returns (bool) 
    {
        if(msg.sender == _to) return pos();
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        if(txIns[msg.sender].length > 0) delete txIns[msg.sender];
        uint64 _now = uint64(now);
        txIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),_now));
        txIns[_to].push(transferInStruct(uint128(_value),_now));
        return true;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    function balanceOf(address _owner) public view returns (uint256 balance) 
    {
        return balances[_owner];
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function transferFrom(address _from, address _to, uint256 _value) onlyPayloadSize(3 * 32) public returns (bool) 
    {
        require(_to != address(0));

        uint256 _allowance = allowed[_from][msg.sender];

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = _allowance.sub(_value);
        emit Transfer(_from, _to, _value);
        if(txIns[_from].length > 0) delete txIns[_from];
        uint64 _now = uint64(now);
        txIns[_from].push(transferInStruct(uint128(balances[_from]),_now));
        txIns[_to].push(transferInStruct(uint128(_value),_now));
        return true;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function approve(address _spender, uint256 _value) public returns (bool) 
    {
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));

        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) 
    {
        return allowed[_owner][_spender];
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function pos() canRunPos public returns (bool) 
    {
        if(balances[msg.sender] <= 0) return false;
        if(txIns[msg.sender].length <= 0) return false;

        uint reward = getPosReward(msg.sender);
        if(reward <= 0) return false;

        totalSupply = totalSupply.add(reward);
        balances[msg.sender] = balances[msg.sender].add(reward);
        delete txIns[msg.sender];
        txIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),uint64(now)));

        emit Mint(msg.sender, reward);
        return true;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function getCraftrBlockNumber() public view returns (uint blockNumber) 
    {
        blockNumber = block.number.sub(chainStartBlockNumber);
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function coinAge() public view returns (uint myCoinAge) 
    {
        myCoinAge = getCoinAge(msg.sender,now);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function annualPos() public view returns(uint interest) 
    {
        uint _now = now;
        interest = defaultPOS;
        if((_now.sub(stakeStartTime)).div(365 days) == 0)
        {
            interest = (435 * defaultPOS).div(100);
        }
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function getPosReward(address _address) internal view returns (uint) 
    {
        require( (now >= stakeStartTime) && (stakeStartTime > 0) );

        uint _now = now;
        uint _coinAge = getCoinAge(_address, _now);
        if(_coinAge <= 0) return 0;

        uint interest = defaultPOS;
        // Due to the high interest rate for the first two years, compounding should be taken into account.
        // Effective annual interest rate = (1 + (nominal rate / number of compounding periods)) ^ (number of compounding periods) - 1
        if((_now.sub(stakeStartTime)).div(365 days) == 0) 
        {
            // 2nd year effective annual interest rate is 50% when we select the stakeMaxAge (90 days) as the compounding period.
            // 1st year has already been calculated through the old contract
            interest = (435 * defaultPOS).div(100);
        }
        return (_coinAge * interest).div(365 * (10**decimals));
    }

    function getCoinAge(address _address, uint _now) internal view returns (uint _coinAge) 
    {
        if(txIns[_address].length <= 0) return 0;

        for (uint i = 0; i < txIns[_address].length; i++){
            if( _now < uint(txIns[_address][i].time).add(stakeMinAge) ) continue;

            uint nCoinSeconds = _now.sub(uint(txIns[_address][i].time));
            if( nCoinSeconds > stakeMaxAge ) nCoinSeconds = stakeMaxAge;

            _coinAge = _coinAge.add(uint(txIns[_address][i].amount) * nCoinSeconds.div(1 days));
        }
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function ownerMultiSend(address[] memory _recipients, uint[] memory _values) onlyOwner public returns (bool) 
    {
        require( _recipients.length > 0 && _recipients.length == _values.length);

        uint total = 0;
        for(uint i = 0; i < _values.length; i++)
        {
            total = total.add(_values[i]);
        }
        require(total <= balances[msg.sender]);

        uint64 _now = uint64(now);
        for(uint j = 0; j < _recipients.length; j++)
        {
            balances[_recipients[j]] = balances[_recipients[j]].add(_values[j]);
            txIns[_recipients[j]].push(transferInStruct(uint128(_values[j]),_now));
            emit Transfer(msg.sender, _recipients[j], _values[j]);
        }

        balances[msg.sender] = balances[msg.sender].sub(total);
        if(txIns[msg.sender].length > 0) delete txIns[msg.sender];
        if(balances[msg.sender] > 0) txIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),_now));

        return true;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function ownerBurnTokens(uint _value) onlyOwner public 
    {
        require(_value > 0);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        delete txIns[msg.sender];
        txIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),uint64(now)));

        totalSupply = totalSupply.sub(_value);
        totalInitialSupply = totalInitialSupply.sub(_value);
        maxTotalSupply = maxTotalSupply.sub(_value*10);

        emit Burn(msg.sender, _value);
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}   
}