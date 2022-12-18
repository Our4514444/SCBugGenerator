pragma solidity 0.5.7;

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
    function totalSupply() public view returns (uint256);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address who) public view returns (uint256);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint256 value) public returns (bool);
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
}
/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    /**
     * @dev Multiplies two numbers, throws on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
    /**
     * @dev Integer division of two numbers, truncating the quotient.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }
    /**
     * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
    /**
     * @dev Adds two numbers, throws on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Ownable {
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * account.
     */
    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     */
    function transferOwnership(address _newOwner) public onlyOwner {
        _transferOwnership(_newOwner);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Transfers control of the contract to a newOwner.
     */
    function _transferOwnership(address _newOwner) internal {
        require(_newOwner != address(0));
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
}
/**
 * @title Basic token
 */
contract BasicToken is ERC20Basic, Ownable {
    using SafeMath for uint256;
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) balances;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint256 totalSupply_;

    /**
     * @dev total number of tokens in existence
     */
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    /**
     */
    function transfer(address _to, uint256 _value) public returns (bool) {
        if (_to == address(0)) {
            totalSupply_ = totalSupply_.sub(_value);
        }

        require(_value <= balances[msg.sender]);
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    /**
     */
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
}
/**
 * @title ERC20 interface
 */
contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint256);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint256 value) public returns (bool);
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint256 value) public returns (bool);
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
/**
 * @title Standard ERC20 token
 *
 */
contract StandardToken is ERC20, BasicToken {
    uint public constant MAX_UINT = 2**256 - 1;

  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) internal allowed;

    /**
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        if (_to == address(0)) {
            totalSupply_ = totalSupply_.sub(_value);
        }

        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);

        /// an allowance of MAX_UINT represents an unlimited allowance.
        /// @dev see https://github.com/ethereum/EIPs/issues/717
        if (allowed[_from][msg.sender] < MAX_UINT) {
            allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        }
        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     */
    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    /**
     */
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    /**
     * @dev Increase the amount of tokens that an owner allowed to a spender.
     */
    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    /**
     * @dev Decrease the amount of tokens that an owner allowed to a spender.
     */
    function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}

contract SatowalletShares is StandardToken {
    using SafeMath for uint256;

  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  string     public name = "Satowallet Shares";
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  string     public symbol = "SATOS";
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  uint8      public decimals = 8;
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  uint256    private constant initialSupply = 10000000;

    constructor() public {
        totalSupply_ = initialSupply * 10 ** uint256(decimals);
        balances[0x1800D1901880cd5615C8c91A1DdEc4853b852adE] = totalSupply_;
        emit Transfer(address(0), 0x1800D1901880cd5615C8c91A1DdEc4853b852adE, totalSupply_);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function () payable external {
        revert();
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

}