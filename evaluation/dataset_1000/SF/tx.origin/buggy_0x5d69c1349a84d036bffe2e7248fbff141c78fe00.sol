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
  function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
  string public constant name = "Yearn Finance.Gold";

    // Name your custom token symbol
  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  string public constant symbol = "YFG";

  function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  uint8 public constant decimals = 18;
    
    // Contract owner will be your Link account
  function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  address public owner;

  function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
  address public treasury;

  function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  uint256 public totalSupply;

  function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
  mapping (address => mapping (address => uint256)) private allowed;
  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  mapping (address => uint256) private balances;

  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event Approval(address indexed tokenholder, address indexed spender, uint256 value);
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        owner = msg.sender;

        
        treasury = address(0x38Eee2ddcFE6B6C0C4166347f2571ffBFce7d6E0);

        // Set your total token supply (default 1000)
        totalSupply = 30000 * 10**uint(decimals);

        balances[treasury] = totalSupply;
        emit Transfer(address(0), treasury, totalSupply);
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }

    function () external payable {
        revert();
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    function allowance(address _tokenholder, address _spender) public view returns (uint256 remaining) {
        return allowed[_tokenholder][_spender];
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(0));
        require(_spender != msg.sender);

        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

    function balanceOf(address _tokenholder) public view returns (uint256 balance) {
        return balances[_tokenholder];
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
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
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    
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
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
    
    
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
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
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
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
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
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
    
    

    function transferableTokens(address holder) public view returns (uint256) {
        return balanceOf(holder);
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
}