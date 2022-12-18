                                                                 

pragma solidity 0.5.12;

contract BlockLoopsToken {
    // Mapeia quantos tokens cada endereco possui
    mapping (address => uint256) public balanceOf;
   
    // Altere essa secao para a sua necessidade
    string public name = "Token BlockLoops";
    string public symbol = "BLKL";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);
   
    event TRANSFER53(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
   
    constructor() public {
        // Inicialmente cede todos os tokens ao criador do contrato.
        balanceOf[msg.sender] = totalSupply;
       
}

function TRANSFER41(address to, uint256 value) public returns (bool sucess) {	//inject NONSTANDARD NAMING
    require(balanceOf[msg.sender] >=value);
   
    balanceOf[msg.sender] -= value; // deduct from sender's balance
    balanceOf[to] += value;        // add to recipient's balance
    emit TRANSFER53(msg.sender, to, value);
    return true;
}

event APPROVAL335(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

mapping(address => mapping(address => uint256)) public allowance;

function APPROVE612(address spender, uint256 value)	//inject NONSTANDARD NAMING
    public
    returns (bool sucess)
{
    allowance[msg.sender][spender] = value;
    emit APPROVAL335(msg.sender, spender, value);
    return true;
}

function TRANSFERFROM289(address from, address to, uint256 value)	//inject NONSTANDARD NAMING
    public
    returns (bool success)
{
    require(value <= balanceOf[from]);
    require(value <= allowance[from][msg.sender]);
       
    balanceOf[from] -= value;
    balanceOf[to] += value;
    allowance[from][msg.sender]-= value;
    emit TRANSFER53(from, to, value);
    return true;
}
}