pragma solidity ^0.5.1;
//V1.0 of the Dissolution token smart contract. Garage Studios Inc.

library SafeMath {

    function ADD651(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING

        c = a + b;

        require(c >= a);

    }

    function SUB199(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING

        require(b <= a);

        c = a - b;

    }

    function MUL26(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING

        c = a * b;

        require(a == 0 || c / a == b);

    }

    function DIV741(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING

        require(b > 0);

        c = a / b;

    }

}

contract ERC20Interface {

    function TOTALSUPPLY592() public view returns (uint);	//inject NONSTANDARD NAMING

    function BALANCEOF938(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING

    function ALLOWANCE94(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING

    function TRANSFER16(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    function APPROVE607(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    function TRANSFERFROM794(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING


    event TRANSFER83(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING

    event APPROVAL293(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING

}

contract ApproveAndCallFallBack {

    function RECEIVEAPPROVAL840(address from, uint256 tokens, address token, bytes memory data) public;	//inject NONSTANDARD NAMING

}

contract Owned {

    address public owner;

    address public newOwner;


    event OWNERSHIPTRANSFERRED83(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING


    constructor() public {

        owner = msg.sender;

    }


    modifier ONLYOWNER664 {	//inject NONSTANDARD NAMING

        require(msg.sender == owner);

        _;

    }


    function TRANSFEROWNERSHIP914(address _newOwner) public ONLYOWNER664 {	//inject NONSTANDARD NAMING

        newOwner = _newOwner;

    }

    function ACCEPTOWNERSHIP733() public {	//inject NONSTANDARD NAMING

        require(msg.sender == newOwner);

        emit OWNERSHIPTRANSFERRED83(owner, newOwner);

        owner = newOwner;

        newOwner = address(0);

    }

}

contract DissolutionToken is ERC20Interface, Owned {

    using SafeMath for uint;


    string public symbol;

    string public  name;

    uint8 public decimals;

    uint _totalSupply;


    mapping(address => uint) balances;

    mapping(address => mapping(address => uint)) allowed;


    constructor() public {

        symbol = "DIS";

        name = "Dissolution";

        decimals = 0;

    //100 billion total supply
        _totalSupply = 100000000000 * 10**uint(decimals);

        balances[owner] = _totalSupply;

        emit TRANSFER83(address(0), owner, _totalSupply);

    }


    //total supply 100 bil
    function TOTALSUPPLY592() public view returns (uint) {	//inject NONSTANDARD NAMING

        return _totalSupply.SUB199(balances[address(0)]);

    }


    function BALANCEOF938(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING

        return balances[tokenOwner];

    }


    function TRANSFER16(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING

        balances[msg.sender] = balances[msg.sender].SUB199(tokens);

        balances[to] = balances[to].ADD651(tokens);

        emit TRANSFER83(msg.sender, to, tokens);

        return true;

    }


    function APPROVE607(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING

        allowed[msg.sender][spender] = tokens;

        emit APPROVAL293(msg.sender, spender, tokens);

        return true;

    }


    function TRANSFERFROM794(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING

        balances[from] = balances[from].SUB199(tokens);

        allowed[from][msg.sender] = allowed[from][msg.sender].SUB199(tokens);

        balances[to] = balances[to].ADD651(tokens);

        emit TRANSFER83(from, to, tokens);

        return true;

    }


    function ALLOWANCE94(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING

        return allowed[tokenOwner][spender];

    }


    function APPROVEANDCALL980(address spender, uint tokens, bytes memory data) public returns (bool success) {	//inject NONSTANDARD NAMING

        allowed[msg.sender][spender] = tokens;

        emit APPROVAL293(msg.sender, spender, tokens);

        ApproveAndCallFallBack(spender).RECEIVEAPPROVAL840(msg.sender, tokens, address(this), data);

        return true;

    }

    //Return any sent ETH
    function () external payable {

        revert();

    }

    //owner can transfer out accidental sends
    function TRANSFERANYERC20TOKEN542(address tokenAddress, uint tokens) public ONLYOWNER664 returns (bool success) {	//inject NONSTANDARD NAMING

        return ERC20Interface(tokenAddress).TRANSFER16(owner, tokens);

    }

}