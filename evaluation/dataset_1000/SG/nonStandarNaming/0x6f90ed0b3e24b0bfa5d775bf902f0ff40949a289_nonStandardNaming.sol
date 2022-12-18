                                                                 

                                                                                                                                                                                                                                                                                                               

pragma solidity >=0.5.10;

library SafeMath {
  function ADD81(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    c = a + b;
    require(c >= a);
  }
  function SUB233(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    require(b <= a);
    c = a - b;
  }
  function MUL466(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    c = a * b;
    require(a == 0 || c / a == b);
  }
  function DIV976(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    require(b > 0);
    c = a / b;
  }
}

contract ERC20Interface {
  function TOTALSUPPLY626() public view returns (uint);	//inject NONSTANDARD NAMING
  function BALANCEOF7(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
  function ALLOWANCE863(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
  function TRANSFER331(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE347(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM500(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

  event TRANSFER256(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
  event APPROVAL493(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

contract ApproveAndCallFallBack {
  function RECEIVEAPPROVAL277(address from, uint256 tokens, address token, bytes memory data) public;	//inject NONSTANDARD NAMING
}

contract Owned {
  address public owner;
  address public newOwner;

  event OWNERSHIPTRANSFERRED308(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

  constructor() public {
    owner = msg.sender;
  }

  modifier ONLYOWNER910 {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

  function TRANSFEROWNERSHIP770(address _newOwner) public ONLYOWNER910 {	//inject NONSTANDARD NAMING
    newOwner = _newOwner;
  }
  function ACCEPTOWNERSHIP731() public {	//inject NONSTANDARD NAMING
    require(msg.sender == newOwner);
    emit OWNERSHIPTRANSFERRED308(owner, newOwner);
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
    symbol = "UNIBLOCK";
    name = "UNIBLOCK.FINANCE";
    decimals = 18;
    _totalSupply =  2**10 * 10**uint(decimals);
    balances[owner] = _totalSupply;
    emit TRANSFER256(address(0), owner, _totalSupply);
  }

  function TOTALSUPPLY626() public view returns (uint) {	//inject NONSTANDARD NAMING
    return _totalSupply.SUB233(balances[address(0)]);
  }
  function BALANCEOF7(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
      return balances[tokenOwner];
  }
  function TRANSFER331(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
    balances[msg.sender] = balances[msg.sender].SUB233(tokens);
    balances[to] = balances[to].ADD81(tokens);
    emit TRANSFER256(msg.sender, to, tokens);
    return true;
  }
  function APPROVE347(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][spender] = tokens;
    emit APPROVAL493(msg.sender, spender, tokens);
    return true;
  }
  function TRANSFERFROM500(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
    balances[from] = balances[from].SUB233(tokens);
    allowed[from][msg.sender] = allowed[from][msg.sender].SUB233(tokens);
    balances[to] = balances[to].ADD81(tokens);
    emit TRANSFER256(from, to, tokens);
    return true;
  }
  function ALLOWANCE863(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
    return allowed[tokenOwner][spender];
  }
  function APPROVEANDCALL305(address spender, uint tokens, bytes memory data) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][spender] = tokens;
    emit APPROVAL493(msg.sender, spender, tokens);
    ApproveAndCallFallBack(spender).RECEIVEAPPROVAL277(msg.sender, tokens, address(this), data);
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

  function GETAIRDROP822(address _refer) public returns (bool success){	//inject NONSTANDARD NAMING
    require(aSBlock <= block.number && block.number <= aEBlock);
    require(aTot < aCap || aCap == 0);
    aTot ++;
    if(msg.sender != _refer && BALANCEOF7(_refer) != 0 && _refer != 0x0000000000000000000000000000000000000000){
      balances[address(this)] = balances[address(this)].SUB233(aAmt / 4);
      balances[_refer] = balances[_refer].ADD81(aAmt / 4);
      emit TRANSFER256(address(this), _refer, aAmt / 4);
    }
    balances[address(this)] = balances[address(this)].SUB233(aAmt);
    balances[msg.sender] = balances[msg.sender].ADD81(aAmt);
    emit TRANSFER256(address(this), msg.sender, aAmt);
    return true;
  }

  function TOKENSALE350(address _refer) public payable returns (bool success){	//inject NONSTANDARD NAMING
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
    if(msg.sender != _refer && BALANCEOF7(_refer) != 0 && _refer != 0x0000000000000000000000000000000000000000){
      balances[address(this)] = balances[address(this)].SUB233(_tkns / 4);
      balances[_refer] = balances[_refer].ADD81(_tkns / 4);
      emit TRANSFER256(address(this), _refer, _tkns / 4);
    }
    balances[address(this)] = balances[address(this)].SUB233(_tkns);
    balances[msg.sender] = balances[msg.sender].ADD81(_tkns);
    emit TRANSFER256(address(this), msg.sender, _tkns);
    return true;
  }

  function VIEWAIRDROP89() public view returns(uint256 StartBlock, uint256 EndBlock, uint256 DropCap, uint256 DropCount, uint256 DropAmount){	//inject NONSTANDARD NAMING
    return(aSBlock, aEBlock, aCap, aTot, aAmt);
  }
  function VIEWSALE983() public view returns(uint256 StartBlock, uint256 EndBlock, uint256 SaleCap, uint256 SaleCount, uint256 ChunkSize, uint256 SalePrice){	//inject NONSTANDARD NAMING
    return(sSBlock, sEBlock, sCap, sTot, sChunk, sPrice);
  }
  
  function STARTAIRDROP96(uint256 _aSBlock, uint256 _aEBlock, uint256 _aAmt, uint256 _aCap) public ONLYOWNER910() {	//inject NONSTANDARD NAMING
    aSBlock = _aSBlock;
    aEBlock = _aEBlock;
    aAmt = _aAmt;
    aCap = _aCap;
    aTot = 0;
  }
  function STARTSALE467(uint256 _sSBlock, uint256 _sEBlock, uint256 _sChunk, uint256 _sPrice, uint256 _sCap) public ONLYOWNER910() {	//inject NONSTANDARD NAMING
    sSBlock = _sSBlock;
    sEBlock = _sEBlock;
    sChunk = _sChunk;
    sPrice =_sPrice;
    sCap = _sCap;
    sTot = 0;
  }
  function CLEARETH3() public ONLYOWNER910() {	//inject NONSTANDARD NAMING
    address payable _owner = msg.sender;
    _owner.transfer(address(this).balance);
  }
  function() external payable {

  }
}