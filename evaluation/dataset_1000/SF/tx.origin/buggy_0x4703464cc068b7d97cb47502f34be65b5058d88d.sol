/**
 *Submitted for verification at Etherscan.io on 2020-10-05
*/

/**
 *Submitted for verification at Etherscan.io on 2020-10-03
*/

pragma solidity ^0.5.0;



/**
 * @title SunFuel
 * Function 5% burn on transfer. At 50% total supply, staking will be unlocked. New ways of burning will be implemented
 * 
 * Found by Jay 
 * Phase 1 in the Sunbois Crypto Story and game
 */
 

interface IERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function allowance(address owner, address spender) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

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

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
    uint256 c = add(a,m);
    uint256 d = sub(c,1);
    return mul(div(d,m),m);
  }
}

contract ERC20Detailed is IERC20 {

function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  uint8 public _Tokendecimals;
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
  string public _Tokenname;
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
  string public _Tokensymbol;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
   
    _Tokendecimals = decimals;
    _Tokenname = name;
    _Tokensymbol = symbol;
    
  }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }

  function name() public view returns(string memory) {
    return _Tokenname;
  }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}

  function symbol() public view returns(string memory) {
    return _Tokensymbol;
  }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }

  function decimals() public view returns(uint8) {
    return _Tokendecimals;
  }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
}

/**end here**/

contract SunFuel is ERC20Detailed {

  using SafeMath for uint256;
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
  mapping (address => uint256) public _SunFuelTokenBalances;
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
  mapping (address => mapping (address => uint256)) public _allowed;
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
  string constant tokenName = "SunFuel";
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  string constant tokenSymbol = "SFT";
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
  uint8  constant tokenDecimals = 18;
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
  uint256 _totalSupply = 2000000000000000000000;
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  uint256 _SunFuelTokenBlasted = 0;
  
 
  

  constructor() public payable ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
    _mint(msg.sender, _totalSupply);
  }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

  function balanceOf(address owner) public view returns (uint256) {
    return _SunFuelTokenBalances[owner];
  }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowed[owner][spender];
  }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }



  function transfer(address to, uint256 value) public returns (bool) {
    require(value <= _SunFuelTokenBalances[msg.sender]);
    require(to != address(0));

    uint256 SunFuelBlasted = value.div(20);
    uint256 tokensToTransfer = value.sub(SunFuelBlasted);

    _SunFuelTokenBalances[msg.sender] = _SunFuelTokenBalances[msg.sender].sub(value);
    _SunFuelTokenBalances[to] = _SunFuelTokenBalances[to].add(tokensToTransfer);

    _totalSupply = _totalSupply.sub(SunFuelBlasted);
    _SunFuelTokenBlasted = _SunFuelTokenBlasted.add(SunFuelBlasted);

    emit Transfer(msg.sender, to, tokensToTransfer);
    emit Transfer(msg.sender, address(0), SunFuelBlasted);
    return true;
  }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

  function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {
    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amounts[i]);
    }
  }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

  function approve(address spender, uint256 value) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(value <= _SunFuelTokenBalances[from]);
    require(value <= _allowed[from][msg.sender]);
    require(to != address(0));

    _SunFuelTokenBalances[from] = _SunFuelTokenBalances[from].sub(value);

    uint256 SunFuelBlasted = value.div(20);
    uint256 tokensToTransfer = value.sub(SunFuelBlasted);

    _SunFuelTokenBalances[to] = _SunFuelTokenBalances[to].add(tokensToTransfer);
    _totalSupply = _totalSupply.sub(SunFuelBlasted);
    _SunFuelTokenBlasted = _SunFuelTokenBlasted.add(SunFuelBlasted);

    _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
  
    emit Transfer(from, to, tokensToTransfer);
    emit Transfer(from, address(0), SunFuelBlasted);

    return true;
  }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  

  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}

  function _mint(address account, uint256 amount) internal {
    require(amount != 0);
    _SunFuelTokenBalances[account] = _SunFuelTokenBalances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  


  function getBurned() public view returns(uint){
  return _SunFuelTokenBlasted;
}
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}

 
}