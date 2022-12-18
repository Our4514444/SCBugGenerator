/**
 *Submitted for verification at Etherscan.io on 2020-01-01
*/

pragma solidity 0.5.12;

contract BlockLoopsToken {
    // Mapeia quantos tokens cada endereco possui
    mapping (address => uint256) public balanceOf;
   
    // Altere essa secao para a sua necessidade
    string public name ;	//inject UNINIT LOCAL/STATE VAR

    string public symbol ;	//inject UNINIT LOCAL/STATE VAR

    uint8 public decimals ;	//inject UNINIT LOCAL/STATE VAR

    uint256 public totalSupply ;	//inject UNINIT LOCAL/STATE VAR

   
    event Transfer(address indexed from, address indexed to, uint256 value);
   
    constructor() public {
        // Inicialmente cede todos os tokens ao criador do contrato.
        balanceOf[msg.sender] = totalSupply;
       
}

function transfer(address to, uint256 value) public returns (bool sucess) {
    require(balanceOf[msg.sender] >=value);
   
    balanceOf[msg.sender] -= value; // deduct from sender's balance
    balanceOf[to] += value;        // add to recipient's balance
    emit Transfer(msg.sender, to, value);
    return true;
}

event Approval(address indexed owner, address indexed spender, uint256 value);

mapping(address => mapping(address => uint256)) public allowance;

function approve(address spender, uint256 value)
    public
    returns (bool sucess)
{
    allowance[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
}

function transferFrom(address from, address to, uint256 value)
    public
    returns (bool success)
{
    require(value <= balanceOf[from]);
    require(value <= allowance[from][msg.sender]);
       
    balanceOf[from] -= value;
    balanceOf[to] += value;
    allowance[from][msg.sender]-= value;
    emit Transfer(from, to, value);
    return true;
}
}