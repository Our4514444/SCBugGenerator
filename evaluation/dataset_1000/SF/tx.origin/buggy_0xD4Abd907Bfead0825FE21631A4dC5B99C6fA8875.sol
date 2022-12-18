/**
 *Submitted for verification at Etherscan.io on 2020-01-01
*/

pragma solidity 0.5.12;

contract BlockLoopsToken {
    // Mapeia quantos tokens cada endereco possui
  function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
  mapping (address => uint256) public balanceOf;
   
    // Altere essa secao para a sua necessidade
  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  string public name = "Token BlockLoops";
  function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
  string public symbol = "BLKL";
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);
   
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event Transfer(address indexed from, address indexed to, uint256 value);
   
    constructor() public {
        // Inicialmente cede todos os tokens ao criador do contrato.
        balanceOf[msg.sender] = totalSupply;
       
}
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

function transfer(address to, uint256 value) public returns (bool sucess) {
    require(balanceOf[msg.sender] >=value);
   
    balanceOf[msg.sender] -= value; // deduct from sender's balance
    balanceOf[to] += value;        // add to recipient's balance
    emit Transfer(msg.sender, to, value);
    return true;
}
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}

event Approval(address indexed owner, address indexed spender, uint256 value);
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

mapping(address => mapping(address => uint256)) public allowance;

function approve(address spender, uint256 value)
    public
    returns (bool sucess)
{
    allowance[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
}
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
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
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
}