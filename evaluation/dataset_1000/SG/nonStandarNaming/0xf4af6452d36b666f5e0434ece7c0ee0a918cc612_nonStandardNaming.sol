pragma solidity ^0.5.1;

contract Token{

    // ERC20 Token, with the addition of symbol, name and decimals and a
    // fixed supply

    string public constant symbol94 = 'PKR-TIG';	//inject NONSTANDARD NAMING
    string public constant name238 = 'PKR Tigereum';	//inject NONSTANDARD NAMING
    uint8 public constant decimals479 = 2;	//inject NONSTANDARD NAMING
    uint public constant _totalsupply7 = 100000000 * 10**uint(decimals479);	//inject NONSTANDARD NAMING
    address public owner;
    string public webAddress;

    // Balances for each account
    mapping(address => uint256) balances;

    // Owner of account approves the transfer of an amount to another account
    mapping(address => mapping(address => uint256)) allowed;

    constructor() public {
        balances[msg.sender] = _totalsupply7;
        owner = msg.sender;
        webAddress = "https://tigereum.io";
    }

    function TOTALSUPPLY261() public pure returns (uint) {	//inject NONSTANDARD NAMING
        return _totalsupply7;
    }

    // Get the token balance for account { tokenOwner }
    function BALANCEOF85(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[tokenOwner];
    }

    // Transfer the balance from owner's account to another account
    function TRANSFER861(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        require( balances[msg.sender] >= tokens && tokens > 0 );
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        emit TRANSFER42(msg.sender, to, tokens);
        return true;
    }

    // Send {tokens} amount of tokens from address {from} to address {to}
    // The transferFrom method is used for a withdraw workflow, allowing contracts to send
    // tokens on your behalf
    function TRANSFERFROM365(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        require( allowed[from][msg.sender] >= tokens && balances[from] >= tokens && tokens > 0 );
        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;
        emit TRANSFER42(from, to, tokens);
        return true;
    }

    // Allow {spender} to withdraw from your account, multiple times, up to the {tokens} amount.
    function APPROVE183(address sender, uint256 tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][sender] = tokens;
        emit APPROVAL691(msg.sender, sender, tokens);
        return true;
    }

    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    function ALLOWANCE274(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[tokenOwner][spender];
    }


    event TRANSFER42(address indexed _from, address indexed _to, uint256 _amount);	//inject NONSTANDARD NAMING
    event APPROVAL691(address indexed _owner, address indexed _to, uint256 _amount);	//inject NONSTANDARD NAMING
}