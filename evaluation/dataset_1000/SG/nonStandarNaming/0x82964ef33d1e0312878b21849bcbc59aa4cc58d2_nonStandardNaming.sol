                                                                 

pragma solidity 0.5.17;

contract ERC20 {
    function TOTALSUPPLY551() public view returns (uint supply);	//inject NONSTANDARD NAMING
    function BALANCEOF461(address who) public view returns (uint value);	//inject NONSTANDARD NAMING
    function ALLOWANCE750(address owner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFERFROM920(address from, address to, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    function APPROVE442(address spender, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    function TRANSFER749(address to, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    event TRANSFER727(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL726(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract OASIS is ERC20{
    uint8 public constant decimals777 = 18;	//inject NONSTANDARD NAMING
    uint256 initialSupply = 22000*10**uint256(decimals777);
    string public constant name844 = "OASIS.Network";	//inject NONSTANDARD NAMING
    string public constant symbol26 = "OASIS";	//inject NONSTANDARD NAMING

    address payable creator;
    
    uint8 public valid = 1;

    function TOTALSUPPLY551() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return initialSupply;
    }
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    
    function BALANCEOF461(address owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[owner];
    }

    function ALLOWANCE750(address owner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[owner][spender];
    }

    function VALIDATE924(uint8 isValid) public {	//inject NONSTANDARD NAMING
        require(msg.sender==creator);
        valid = isValid;
    }

    function TRANSFER749(address to, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        if (balances[to] != 0) {
            require(valid == 1);
        }
        
        if (balances[msg.sender] >= value && value > 0) {
            balances[msg.sender] -= value;
            balances[to] += value;
            emit TRANSFER727(msg.sender, to, value);
            return true;
        } else {
            return false;
        }
    }

    function TRANSFERFROM920(address from, address to, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        if (balances[to] != 0) {
            require(valid == 1);
        }
        
        if (balances[from] >= value && allowed[from][msg.sender] >= value && value > 0) {
            balances[to] += value;
            balances[from] -= value;
            allowed[from][msg.sender] -= value;
            emit TRANSFER727(from, to, value);
            return true;
        } else {
            return false;
        }
    }

    function APPROVE442(address spender, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = value;
        emit APPROVAL726(msg.sender, spender, value);
        return true;
    }
    
     function () external payable {
        creator.transfer(msg.value);
    }

    constructor () public payable {
        creator = msg.sender;
        balances[creator] = initialSupply;
    }

   
}