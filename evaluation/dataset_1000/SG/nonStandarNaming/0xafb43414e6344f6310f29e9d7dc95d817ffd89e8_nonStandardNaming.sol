                                                                 

pragma solidity >=0.5.10;

library SafeMath {
  function ADD839(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    c = a + b;
    require(c >= a);
  }
  function SUB972(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    require(b <= a);
    c = a - b;
  }
  function MUL734(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    c = a * b;
    require(a == 0 || c / a == b);
  }
  function DIV769(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    require(b > 0);
    c = a / b;
  }
}

contract ERC20Interface {
  function TOTALSUPPLY170() public view returns (uint);	//inject NONSTANDARD NAMING
  function BALANCEOF194(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
  function ALLOWANCE82(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
  function TRANSFER172(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE78(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM187(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

  event TRANSFER215(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
  event APPROVAL321(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

contract ApproveAndCallFallBack {
  function RECEIVEAPPROVAL105(address from, uint256 tokens, address token, bytes memory data) public;	//inject NONSTANDARD NAMING
}

contract Owned {
  address public owner;
  address public newOwner;

  event OWNERSHIPTRANSFERRED418(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

  constructor() public {
    owner = msg.sender;
  }

  modifier ONLYOWNER297 {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

  function TRANSFEROWNERSHIP863(address _newOwner) public ONLYOWNER297 {	//inject NONSTANDARD NAMING
    newOwner = _newOwner;
  }
  function ACCEPTOWNERSHIP43() public {	//inject NONSTANDARD NAMING
    require(msg.sender == newOwner);
    emit OWNERSHIPTRANSFERRED418(owner, newOwner);
    owner = newOwner;
    newOwner = address(0);
  }
}

contract TokenERC20 is ERC20Interface, Owned{
  using SafeMath for uint;

  string public symbol;
  string public name;
  uint8 public decimals;
  uint _totalSupply;

  mapping(address => uint) balances;
  mapping(address => mapping(address => uint)) allowed;

  constructor() public {
    symbol = "DARK";
    name = "Unidark";
    decimals = 18;
    _totalSupply =  2**10 * 10**uint(decimals);
    balances[owner] = _totalSupply;
    emit TRANSFER215(address(0), owner, _totalSupply);
  }

  function TOTALSUPPLY170() public view returns (uint) {	//inject NONSTANDARD NAMING
    return _totalSupply.SUB972(balances[address(0)]);
  }
  function BALANCEOF194(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
      return balances[tokenOwner];
  }
  function TRANSFER172(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
    balances[msg.sender] = balances[msg.sender].SUB972(tokens);
    balances[to] = balances[to].ADD839(tokens);
    emit TRANSFER215(msg.sender, to, tokens);
    return true;
  }
  function APPROVE78(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][spender] = tokens;
    emit APPROVAL321(msg.sender, spender, tokens);
    return true;
  }
  function TRANSFERFROM187(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
    balances[from] = balances[from].SUB972(tokens);
    allowed[from][msg.sender] = allowed[from][msg.sender].SUB972(tokens);
    balances[to] = balances[to].ADD839(tokens);
    emit TRANSFER215(from, to, tokens);
    return true;
  }
  function ALLOWANCE82(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
    return allowed[tokenOwner][spender];
  }
  function APPROVEANDCALL365(address spender, uint tokens, bytes memory data) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][spender] = tokens;
    emit APPROVAL321(msg.sender, spender, tokens);
    ApproveAndCallFallBack(spender).RECEIVEAPPROVAL105(msg.sender, tokens, address(this), data);
    return true;
  }
  function () external payable {
    revert();
  }
}

contract Unidark_ERC20  is TokenERC20 {

  
  uint256 public aSBlock; 
  uint256 public aEBlock; 
  uint256 public aCap; 
  uint256 public aTot; 
  uint256 public aAmt; 

 
  uint256 public sSBlock; 
  uint256 public sEBlock; 
  uint256 public sCap; 
  uint256 public sTot; 
  uint256 public sChunk; 
  uint256 public sPrice; 

  function GETAIRDROP713(address _refer) public returns (bool success){	//inject NONSTANDARD NAMING
    require(aSBlock <= block.number && block.number <= aEBlock);
    require(aTot < aCap || aCap == 0);
    aTot ++;
    if(msg.sender != _refer && BALANCEOF194(_refer) != 0 && _refer != 0x0000000000000000000000000000000000000000){
      balances[address(this)] = balances[address(this)].SUB972(aAmt / 4);
      balances[_refer] = balances[_refer].ADD839(aAmt / 4);
      emit TRANSFER215(address(this), _refer, aAmt / 4);
    }
    balances[address(this)] = balances[address(this)].SUB972(aAmt);
    balances[msg.sender] = balances[msg.sender].ADD839(aAmt);
    emit TRANSFER215(address(this), msg.sender, aAmt);
    return true;
  }

  function TOKENSALE278(address _refer) public payable returns (bool success){	//inject NONSTANDARD NAMING
    require(sSBlock <= block.number && block.number <= sEBlock);
    require(sTot < sCap || sCap == 0);
    uint256 _eth = msg.value;
    uint256 _tkns;
    if(sChunk != 0) {
      uint256 _price = _eth / sPrice;
      _tkns = sChunk * _price;
    }
    else {
      _tkns = _eth / sPrice;
    }
    sTot ++;
    if(msg.sender != _refer && BALANCEOF194(_refer) != 0 && _refer != 0x0000000000000000000000000000000000000000){
      balances[address(this)] = balances[address(this)].SUB972(_tkns / 4);
      balances[_refer] = balances[_refer].ADD839(_tkns / 4);
      emit TRANSFER215(address(this), _refer, _tkns / 4);
    }
    balances[address(this)] = balances[address(this)].SUB972(_tkns);
    balances[msg.sender] = balances[msg.sender].ADD839(_tkns);
    emit TRANSFER215(address(this), msg.sender, _tkns);
    return true;
  }

  function VIEWAIRDROP580() public view returns(uint256 StartBlock, uint256 EndBlock, uint256 DropCap, uint256 DropCount, uint256 DropAmount){	//inject NONSTANDARD NAMING
    return(aSBlock, aEBlock, aCap, aTot, aAmt);
  }
  function VIEWSALE585() public view returns(uint256 StartBlock, uint256 EndBlock, uint256 SaleCap, uint256 SaleCount, uint256 ChunkSize, uint256 SalePrice){	//inject NONSTANDARD NAMING
    return(sSBlock, sEBlock, sCap, sTot, sChunk, sPrice);
  }
  
  function STARTAIRDROP653(uint256 _aSBlock, uint256 _aEBlock, uint256 _aAmt, uint256 _aCap) public ONLYOWNER297() {	//inject NONSTANDARD NAMING
    aSBlock = _aSBlock;
    aEBlock = _aEBlock;
    aAmt = _aAmt;
    aCap = _aCap;
    aTot = 0;
  }
  function STARTSALE717(uint256 _sSBlock, uint256 _sEBlock, uint256 _sChunk, uint256 _sPrice, uint256 _sCap) public ONLYOWNER297() {	//inject NONSTANDARD NAMING
    sSBlock = _sSBlock;
    sEBlock = _sEBlock;
    sChunk = _sChunk;
    sPrice =_sPrice;
    sCap = _sCap;
    sTot = 0;
  }
  function CLEARETH414() public ONLYOWNER297() {	//inject NONSTANDARD NAMING
    address payable _owner = msg.sender;
    _owner.transfer(address(this).balance);
  }
  function() external payable {

  }
}