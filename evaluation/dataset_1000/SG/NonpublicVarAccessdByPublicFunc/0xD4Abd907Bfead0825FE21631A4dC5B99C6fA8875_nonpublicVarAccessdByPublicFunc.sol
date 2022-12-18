/**
 *Submitted for verification at Etherscan.io on 2020-01-01
*/

pragma solidity 0.5.12;

contract BlockLoopsToken {
    // Mapeia quantos tokens cada endereco possui
    mapping (address => uint256) internal balanceOf;
   
    // Altere essa secao para a sua necessidade
    string public name = "Token BlockLoops";
    string public symbol = "BLKL";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);
   
    event Transfer(address indexed from, address indexed to, uint256 value);
   
    constructor() public {
        // Inicialmente cede todos os tokens ao criador do contrato.
        balanceOf[msg.sender] = totalSupply;
       
}

function transfer(address to, uint256 value) public returns (bool sucess) {
    require(balanceOf[msg.sender] >=value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
   
    balanceOf[msg.sender] -= value; // deduct from sender's balance	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balanceOf[to] += value;        // add to recipient's balance	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(msg.sender, to, value);
    return true;
}

event Approval(address indexed owner, address indexed spender, uint256 value);

mapping(address => mapping(address => uint256)) internal allowance;

function approve(address spender, uint256 value)
    public
    returns (bool sucess)
{
    allowance[msg.sender][spender] = value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Approval(msg.sender, spender, value);
    return true;
}

function transferFrom(address from, address to, uint256 value)
    public
    returns (bool success)
{
    require(value <= balanceOf[from]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    require(value <= allowance[from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
       
    balanceOf[from] -= value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balanceOf[to] += value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    allowance[from][msg.sender]-= value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(from, to, value);
    return true;
}
}