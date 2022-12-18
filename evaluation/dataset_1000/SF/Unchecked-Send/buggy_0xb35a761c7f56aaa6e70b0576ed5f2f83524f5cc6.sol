/**
 *Submitted for verification at Etherscan.io on 2020-02-04
*/

pragma solidity 0.5.11;

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Ownable {
    address public owner;
    address public owner2;

    constructor() public {
      owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner || msg.sender == owner2);
        _;
    }

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner);
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }

    function setOwner2(address newOwner) public onlyOwner {
        owner2 = newOwner;
    }
}

contract ERC20Basic {
    uint public _totalSupply;
    function totalSupply() public view returns (uint);
    function balanceOf(address who) public view returns (uint);
    function transfer(address to, uint value) public returns (bool success);
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint value);
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint);
    function transferFrom(address from, address to, uint value) public returns (bool success);
    function approve(address spender, uint value) public returns (bool success);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint value);
}

contract ITokenRecipient {
    function tokenFallback(address _from, uint _value) public;
}

contract BasicToken is Ownable, ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) public balances;

    uint public basisPointsRate = 0;
    uint public maximumFee = 0;

    modifier onlyPayloadSize(uint size) {
        require(!(msg.data.length < size + 4));
        _;
    }

    function transfer(address _to, uint _value) public onlyPayloadSize(2 * 32) returns (bool success) {
        uint fee = (_value.mul(basisPointsRate)).div(10000);
        if (fee > maximumFee) {
            fee = maximumFee;
        }
        uint sendAmount = _value.sub(fee);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(sendAmount);
        if (fee > 0) {
            balances[owner] = balances[owner].add(fee);
            emit Transfer(msg.sender, owner, fee);
        }
        if(isContract(_to)) {
            ITokenRecipient receiver = ITokenRecipient(_to);
            receiver.tokenFallback(msg.sender, sendAmount);
        }
        emit Transfer(msg.sender, _to, sendAmount);
        return true;
    }

    function isContract(address _address) private view returns (bool) {
        uint length;
        assembly { length := extcodesize(_address) }
        return (length > 0);
    }

    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
}

contract StandardToken is BasicToken, ERC20 {

    mapping (address => mapping (address => uint)) public allowed;

    uint public constant MAX_UINT = 2**256 - 1;

    function transferFrom(address _from, address _to, uint _value) public onlyPayloadSize(3 * 32) returns (bool success) {
        uint _allowance = allowed[_from][msg.sender];

        uint fee = (_value.mul(basisPointsRate)).div(10000);
        if (fee > maximumFee) {
            fee = maximumFee;
        }
        if (_allowance < MAX_UINT) {
            allowed[_from][msg.sender] = _allowance.sub(_value);
        }
        uint sendAmount = _value.sub(fee);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(sendAmount);
        if (fee > 0) {
            balances[owner] = balances[owner].add(fee);
            emit Transfer(_from, owner, fee);
        }
        emit Transfer(_from, _to, sendAmount);
        return true;
    }

    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) returns (bool success) {
        require(!((_value != 0) && (allowed[msg.sender][_spender] != 0)));

        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];
    }
}

contract Pausable is Ownable {
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event Pause();
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  event Unpause();

  bool public paused = false;

  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  modifier whenPaused() {
    require(paused);
    _;
  }

  function pause() onlyOwner whenNotPaused public {
    paused = true;
    emit Pause();
  }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

  function unpause() onlyOwner whenPaused public {
    paused = false;
    emit Unpause();
  }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
}

contract BlackList is Ownable, BasicToken {
    function getBlackListStatus(address _maker) external view returns (bool) {
        return isBlackListed[_maker];
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

    function getOwner() external view returns (address) {
        return owner;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    mapping (address => bool) public isBlackListed;
    
    function addBlackList (address _evilUser) public onlyOwner {
        isBlackListed[_evilUser] = true;
        emit AddedBlackList(_evilUser);
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    function removeBlackList (address _clearedUser) public onlyOwner {
        isBlackListed[_clearedUser] = false;
        emit RemovedBlackList(_clearedUser);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function destroyBlackFunds (address _blackListedUser) public onlyOwner {
        require(isBlackListed[_blackListedUser]);
        uint dirtyFunds = balanceOf(_blackListedUser);
        balances[_blackListedUser] = 0;
        _totalSupply -= dirtyFunds;
        emit DestroyedBlackFunds(_blackListedUser, dirtyFunds);
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  event DestroyedBlackFunds(address _blackListedUser, uint _balance);

  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event AddedBlackList(address _user);

  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event RemovedBlackList(address _user);
}

contract UpgradedStandardToken is StandardToken{
    function transferByLegacy(address from, address to, uint value) public returns (bool success);
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function transferFromByLegacy(address sender, address from, address spender, uint value) public returns (bool success);
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    function approveByLegacy(address from, address spender, uint value) public returns (bool success) ;
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
}

contract HeliosToken is Pausable, StandardToken, BlackList {
    string public name = "Helios Exchange";
    string public symbol = "HEX";
    uint public decimals = 18;
    address public upgradedAddress;
    bool public deprecated = false;

    constructor() public {
        _totalSupply = 10000000000000000000000000;
        balances[owner] = _totalSupply;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address _to, uint _value) public whenNotPaused returns (bool success) {
        require(!isBlackListed[msg.sender]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).transferByLegacy(msg.sender, _to, _value);
        } else {
            return super.transfer(_to, _value);
        }
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint _value) public whenNotPaused returns (bool success) {
        require(!isBlackListed[_from]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).transferFromByLegacy(msg.sender, _from, _to, _value);
        } else {
            return super.transferFrom(_from, _to, _value);
        }
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address who) public view returns (uint) {
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).balanceOf(who);
        } else {
            return super.balanceOf(who);
        }
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) returns (bool success)  {
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).approveByLegacy(msg.sender, _spender, _value);
        } else {
            return super.approve(_spender, _value);
        }
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        if (deprecated) {
            return StandardToken(upgradedAddress).allowance(_owner, _spender);
        } else {
            return super.allowance(_owner, _spender);
        }
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function deprecate(address _upgradedAddress) public onlyOwner returns (bool success) {
        deprecated = true;
        upgradedAddress = _upgradedAddress;
        emit Deprecate(_upgradedAddress);
        return true;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function totalSupply() public view returns (uint) {
        if (deprecated) {
            return StandardToken(upgradedAddress).totalSupply();
        } else {
            return _totalSupply;
        }
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    function issue(uint amount) public onlyOwner returns (bool success) {
        require(_totalSupply + amount > _totalSupply);
        require(balances[owner] + amount > balances[owner]);

        balances[owner] += amount;
        _totalSupply += amount;
        emit Issue(amount);
        return true;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function redeem(uint amount) public onlyOwner returns (bool success) {
        require(_totalSupply >= amount);
        require(balances[owner] >= amount);

        _totalSupply -= amount;
        balances[owner] -= amount;
        emit Redeem(amount);
        return true;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function setParams(uint newBasisPoints, uint newMaxFee) public onlyOwner {
        require(newBasisPoints < 20);
        require(newMaxFee < 50);

        basisPointsRate = newBasisPoints;
        maximumFee = newMaxFee.mul(10**decimals);

        emit Params(basisPointsRate, maximumFee);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Issue(uint amount);

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Redeem(uint amount);

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Deprecate(address newAddress);

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Params(uint feeBasisPoints, uint maxFee);
}