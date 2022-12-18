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
    address internal owner;
    address internal owner2;

    constructor() public {
      owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner || msg.sender == owner2);
        _;
    }

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (newOwner != address(0)) {
            owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function setOwner2(address newOwner) public onlyOwner {
        owner2 = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

contract ERC20Basic {
    uint internal _totalSupply;
    function totalSupply() public view returns (uint);
    function balanceOf(address who) public view returns (uint);
    function transfer(address to, uint value) public returns (bool success);
    event Transfer(address indexed from, address indexed to, uint value);
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint);
    function transferFrom(address from, address to, uint value) public returns (bool success);
    function approve(address spender, uint value) public returns (bool success);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract ITokenRecipient {
    function tokenFallback(address _from, uint _value) public;
}

contract BasicToken is Ownable, ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) internal balances;

    uint internal basisPointsRate = 0;
    uint internal maximumFee = 0;

    modifier onlyPayloadSize(uint size) {
        require(!(msg.data.length < size + 4));
        _;
    }

    function transfer(address _to, uint _value) public onlyPayloadSize(2 * 32) returns (bool success) {
        uint fee = (_value.mul(basisPointsRate)).div(10000);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (fee > maximumFee) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            fee = maximumFee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        uint sendAmount = _value.sub(fee);
        balances[msg.sender] = balances[msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to] = balances[_to].add(sendAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (fee > 0) {
            balances[owner] = balances[owner].add(fee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Transfer(msg.sender, owner, fee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
        return balances[_owner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

contract StandardToken is BasicToken, ERC20 {

    mapping (address => mapping (address => uint)) internal allowed;

    uint internal constant MAX_UINT = 2**256 - 1;

    function transferFrom(address _from, address _to, uint _value) public onlyPayloadSize(3 * 32) returns (bool success) {
        uint _allowance = allowed[_from][msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        uint fee = (_value.mul(basisPointsRate)).div(10000);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (fee > maximumFee) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            fee = maximumFee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        if (_allowance < MAX_UINT) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            allowed[_from][msg.sender] = _allowance.sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        uint sendAmount = _value.sub(fee);
        balances[_from] = balances[_from].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to] = balances[_to].add(sendAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (fee > 0) {
            balances[owner] = balances[owner].add(fee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Transfer(_from, owner, fee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        emit Transfer(_from, _to, sendAmount);
        return true;
    }

    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) returns (bool success) {
        require(!((_value != 0) && (allowed[msg.sender][_spender] != 0)));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        allowed[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool internal paused = false;

  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  modifier whenPaused() {
    require(paused);
    _;
  }

  function pause() onlyOwner whenNotPaused public {
    paused = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Pause();
  }

  function unpause() onlyOwner whenPaused public {
    paused = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Unpause();
  }
}

contract BlackList is Ownable, BasicToken {
    function getBlackListStatus(address _maker) external view returns (bool) {
        return isBlackListed[_maker];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getOwner() external view returns (address) {
        return owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    mapping (address => bool) internal isBlackListed;
    
    function addBlackList (address _evilUser) public onlyOwner {
        isBlackListed[_evilUser] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit AddedBlackList(_evilUser);
    }

    function removeBlackList (address _clearedUser) public onlyOwner {
        isBlackListed[_clearedUser] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit RemovedBlackList(_clearedUser);
    }

    function destroyBlackFunds (address _blackListedUser) public onlyOwner {
        require(isBlackListed[_blackListedUser]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint dirtyFunds = balanceOf(_blackListedUser);
        balances[_blackListedUser] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _totalSupply -= dirtyFunds;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit DestroyedBlackFunds(_blackListedUser, dirtyFunds);
    }

    event DestroyedBlackFunds(address _blackListedUser, uint _balance);

    event AddedBlackList(address _user);

    event RemovedBlackList(address _user);
}

contract UpgradedStandardToken is StandardToken{
    function transferByLegacy(address from, address to, uint value) public returns (bool success);
    function transferFromByLegacy(address sender, address from, address spender, uint value) public returns (bool success);
    function approveByLegacy(address from, address spender, uint value) public returns (bool success) ;
}

contract HeliosToken is Pausable, StandardToken, BlackList {
    string public name = "Helios Exchange";
    string public symbol = "HEX";
    uint internal decimals = 18;
    address internal upgradedAddress;
    bool internal deprecated = false;

    constructor() public {
        _totalSupply = 10000000000000000000000000;
        balances[owner] = _totalSupply;
    }

    function transfer(address _to, uint _value) public whenNotPaused returns (bool success) {
        require(!isBlackListed[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (deprecated) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return UpgradedStandardToken(upgradedAddress).transferByLegacy(msg.sender, _to, _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            return super.transfer(_to, _value);
        }
    }

    function transferFrom(address _from, address _to, uint _value) public whenNotPaused returns (bool success) {
        require(!isBlackListed[_from]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (deprecated) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return UpgradedStandardToken(upgradedAddress).transferFromByLegacy(msg.sender, _from, _to, _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            return super.transferFrom(_from, _to, _value);
        }
    }

    function balanceOf(address who) public view returns (uint) {
        if (deprecated) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return UpgradedStandardToken(upgradedAddress).balanceOf(who);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            return super.balanceOf(who);
        }
    }

    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) returns (bool success)  {
        if (deprecated) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return UpgradedStandardToken(upgradedAddress).approveByLegacy(msg.sender, _spender, _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            return super.approve(_spender, _value);
        }
    }

    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        if (deprecated) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return StandardToken(upgradedAddress).allowance(_owner, _spender);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            return super.allowance(_owner, _spender);
        }
    }

    function deprecate(address _upgradedAddress) public onlyOwner returns (bool success) {
        deprecated = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        upgradedAddress = _upgradedAddress;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Deprecate(_upgradedAddress);
        return true;
    }

    function totalSupply() public view returns (uint) {
        if (deprecated) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return StandardToken(upgradedAddress).totalSupply();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            return _totalSupply;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function issue(uint amount) public onlyOwner returns (bool success) {
        require(_totalSupply + amount > _totalSupply);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(balances[owner] + amount > balances[owner]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        balances[owner] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _totalSupply += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Issue(amount);
        return true;
    }

    function redeem(uint amount) public onlyOwner returns (bool success) {
        require(_totalSupply >= amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(balances[owner] >= amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        _totalSupply -= amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[owner] -= amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Redeem(amount);
        return true;
    }

    function setParams(uint newBasisPoints, uint newMaxFee) public onlyOwner {
        require(newBasisPoints < 20);
        require(newMaxFee < 50);

        basisPointsRate = newBasisPoints;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        maximumFee = newMaxFee.mul(10**decimals);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        emit Params(basisPointsRate, maximumFee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    event Issue(uint amount);

    event Redeem(uint amount);

    event Deprecate(address newAddress);

    event Params(uint feeBasisPoints, uint maxFee);
}