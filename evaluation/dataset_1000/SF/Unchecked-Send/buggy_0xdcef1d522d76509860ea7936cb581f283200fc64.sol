/**
 *Submitted for verification at Etherscan.io on 2020-09-11
*/

/**
 *Submitted for verification at Etherscan.io on 2020-05-29
*/

pragma solidity ^0.5.0;


contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract Context {
    constructor () internal { }

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

library SafeMath {
	
	function mul(uint256 a, uint256 b) internal pure returns (uint256) {
		uint256 c = a * b;
		assert(a == 0 || c / a == b);
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

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;
        return c;
    }
	
	function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
		c = a + b;
		assert(c >= a);
		return c;
	}
}


contract BasicToken is Context, ERC20{
  using SafeMath for uint256;

  mapping(address => uint256) balances;
  mapping (address => mapping (address => uint256)) internal allowed;

  uint256 totalSupply_;

 
  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

  function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
    allowed[msg.sender][_spender] = (
      allowed[msg.sender][_spender].add(_addedValue));
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

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

   
 function _mint(address account, uint256 amount) internal {
    require(account != address(0), "ERC20: mint to the zero address");

    totalSupply_ = totalSupply_.add(amount);
    balances[account] = balances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }
  
  function _burn(address account, uint256 amount) internal {
    require(account != address(0), "ERC20: burn from the zero address");

    balances[account] = balances[account].sub(amount, "ERC20: burn amount exceeds balance");
    totalSupply_ = totalSupply_.sub(amount);
    emit Transfer(account, address(0), amount);
  }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

  
  function _approve(address owner, address _spender, uint256 amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(_spender != address(0), "ERC20: approve to the zero address");

        allowed[owner][_spender] = amount;
        emit Approval(owner, _spender, amount);
  }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

   
  function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, msg.sender, allowed[account][msg.sender].sub(amount, "ERC20: burn amount exceeds allowance"));
  }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

}

contract Ownable {
  address public owner;


function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipRenounced(address indexed previousOwner);
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  constructor() public {
    owner = msg.sender;
  }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

  function renounceOwnership() public onlyOwner {
    emit OwnershipRenounced(owner);
    owner = address(0);
  }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
}



contract Pausable is Ownable {
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event Pause();
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Unpause();
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event NotPausable();

  bool public paused = false;
  bool public canPause = true;

  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require(!paused || msg.sender == owner);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {
    require(paused);
    _;
  }

  /**
     * @dev called by the owner to pause, triggers stopped state
     **/
    function pause() onlyOwner whenNotPaused public {
        require(canPause == true);
        paused = true;
        emit Pause();
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused public {
    require(paused == true);
    paused = false;
    emit Unpause();
  }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  
  /**
     * @dev Prevent the token from ever being paused again
     **/
    function notPausable() onlyOwner public{
        paused = false;
        canPause = false;
        emit NotPausable();
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
}



contract Mintable is BasicToken, Ownable {
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Mint(address indexed to, uint256 amount);
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event MintFinished();

  bool public mintingFinished = false;


  modifier canMint() {
    require(!mintingFinished);
    _;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * @dev Function to stop minting new tokens.
   * @return True if the operation was successful.
   */
  function finishMinting() onlyOwner canMint public returns (bool) {
    mintingFinished = true;
    emit MintFinished();
    return true;
  }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}



contract ERC20Burnable is Context, BasicToken {
   
    function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function burnFrom(address account, uint256 amount) public {
        _burnFrom(account, amount);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
}


contract ERC20Detailed is ERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function name() public view returns (string memory) {
        return _name;
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
}


contract PausableToken is BasicToken, ERC20Detailed, Pausable, ERC20Burnable, Mintable {
    string public constant NAME = "Korea Racing Gold Pay";
    string public constant SYMBOL = "KRGP";
    uint256 public constant DECIMALS = 8;
    uint256 public constant INITIAL_SUPPLY = 100000000 * 10**8;

    /**
     * @dev Transfer tokens when not paused
     **/
    function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transfer(_to, _value);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
     * @dev transferFrom function to tansfer tokens when token is not paused
     **/
    function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
     * @dev approve spender when not paused
     **/
    function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
        return super.approve(_spender, _value);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
     * @dev increaseApproval of spender when not paused
     **/
    function increaseApproval(address _spender, uint _addedValue) public whenNotPaused returns (bool success) {
        return super.increaseApproval(_spender, _addedValue);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
     * @dev decreaseApproval of spender when not paused
     **/
    function decreaseApproval(address _spender, uint _subtractedValue) public whenNotPaused returns (bool success) {
        return super.decreaseApproval(_spender, _subtractedValue);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    
    /**
   * Pausable Token Constructor
   * @dev Create and issue tokens to msg.sender.
   */
   /*
   constructor() public {
     totalSupply_ = INITIAL_SUPPLY;
     balances[msg.sender] = INITIAL_SUPPLY;
   } 
  */

    constructor () public ERC20Detailed("Korea Racing Gold Pay", "KRGP", 8) {
      
         _mint(_msgSender(), 100000000 * (10 ** uint256(decimals())));
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);} 
}