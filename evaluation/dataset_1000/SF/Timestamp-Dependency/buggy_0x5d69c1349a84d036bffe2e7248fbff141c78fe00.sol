/**
 *Submitted for verification at Etherscan.io on 2020-11-03
*/

pragma solidity ^0.5.8;



//-----------------------------------------------------------------------------
/*

YFG is fork of Yearn Finance Gold.
The core development team is made up of a team of people from different countries who have high experience in the crypto environment.
The YFG technology is independently forked and upgraded to a cluster interactive intelligent aggregator,
which aggregates multiple platforms Agreement to realize the interaction of assets on different decentralized liquidity platforms.

*/
//-----------------------------------------------------------------------------

// Sample token contract
//
// Symbol        : YFG
// Name          : Yearn Finance Gold
// Total supply  : 30000
// Decimals      : 18
// Owner Account : 0x38Eee2ddcFE6B6C0C4166347f2571ffBFce7d6E0
//
// Enjoy.
//
// (c) by Yearn Finance Gold 2020. MIT Licence.
// ----------------------------------------------------------------------------


contract YearnFinanceGold {
    // Name your custom token
  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  string public constant name = "Yearn Finance.Gold";

    // Name your custom token symbol
  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  string public constant symbol = "YFG";

  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  uint8 public constant decimals = 18;
    
    // Contract owner will be your Link account
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public owner;

  address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
  address public treasury;

  function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint256 public totalSupply;

  function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (address => mapping (address => uint256)) private allowed;
  function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => uint256) private balances;

  uint256 bugv_tmstmp2 = block.timestamp;
  event Approval(address indexed tokenholder, address indexed spender, uint256 value);
  uint256 bugv_tmstmp3 = block.timestamp;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
  uint256 bugv_tmstmp1 = block.timestamp;
  event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        owner = msg.sender;

        
        treasury = address(0x38Eee2ddcFE6B6C0C4166347f2571ffBFce7d6E0);

        // Set your total token supply (default 1000)
        totalSupply = 30000 * 10**uint(decimals);

        balances[treasury] = totalSupply;
        emit Transfer(address(0), treasury, totalSupply);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function () external payable {
        revert();
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    function allowance(address _tokenholder, address _spender) public view returns (uint256 remaining) {
        return allowed[_tokenholder][_spender];
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(0));
        require(_spender != msg.sender);

        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    function balanceOf(address _tokenholder) public view returns (uint256 balance) {
        return balances[_tokenholder];
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool success) {
        require(_spender != address(0));
        require(_spender != msg.sender);

        if (allowed[msg.sender][_spender] <= _subtractedValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = allowed[msg.sender][_spender] - _subtractedValue;
        }

        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);

        return true;
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    
    
    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     *
     * Emits a `Transfer` event.
     */
     
    function increaseApproval(address _spender, uint _addedValue) public returns (bool success) {
        require(_spender != address(0));
        require(_spender != msg.sender);
        require(allowed[msg.sender][_spender] <= allowed[msg.sender][_spender] + _addedValue);

        allowed[msg.sender][_spender] = allowed[msg.sender][_spender] + _addedValue;

        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);

        return true;
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    
    
     /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through `transferFrom`. This is
     * zero by default.
     *
     * This value changes when `approve` or `transferFrom` are called.
     */
     
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != msg.sender);
        require(_to != address(0));
        require(_to != address(this));
        require(balances[msg.sender] - _value <= balances[msg.sender]);
        require(balances[_to] <= balances[_to] + _value);
        require(_value <= transferableTokens(msg.sender));

        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_from != address(0));
        require(_from != address(this));
        require(_to != _from);
        require(_to != address(0));
        require(_to != address(this));
        require(_value <= transferableTokens(_from));
        require(allowed[_from][msg.sender] - _value <= allowed[_from][msg.sender]);
        require(balances[_from] - _value <= balances[_from]);
        require(balances[_to] <= balances[_to] + _value);

        allowed[_from][msg.sender] = allowed[_from][msg.sender] - _value;
        balances[_from] = balances[_from] - _value;
        balances[_to] = balances[_to] + _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function transferOwnership(address _newOwner) public {
        require(msg.sender == owner);
        require(_newOwner != address(0));
        require(_newOwner != address(this));
        require(_newOwner != owner);

        address previousOwner = owner;
        owner = _newOwner;

        emit OwnershipTransferred(previousOwner, _newOwner);
    }
uint256 bugv_tmstmp4 = block.timestamp;
    
    

    function transferableTokens(address holder) public view returns (uint256) {
        return balanceOf(holder);
    }
uint256 bugv_tmstmp5 = block.timestamp;
}