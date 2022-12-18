                                                                 

                                                                 

pragma solidity ^0.5.10;

library SafeMath {
    function ADD98(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SUB740(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a);
        c = a - b;
    }
    function MUL728(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function DIV44(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}

contract ERC20Interface {
    function TOTALSUPPLY338() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF603(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE580(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER536(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE417(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM413(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    event TRANSFER55(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL428(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

contract ApproveAndCallFallBack {
    function RECEIVEAPPROVAL792(address from, uint256 tokens, address token, bytes memory data) public;	//inject NONSTANDARD NAMING
}

contract Owned {
    address public owner;
    address public newOwner;

    event OWNERSHIPTRANSFERRED795(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER839 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP857(address _newOwner) public ONLYOWNER839 {	//inject NONSTANDARD NAMING
        newOwner = _newOwner;
    }
    function ACCEPTOWNERSHIP109() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner);
        emit OWNERSHIPTRANSFERRED795(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

contract CryptoProjectsToken is ERC20Interface, Owned {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;


    constructor(string memory _symbol, string memory _name, uint8 _decimals, uint _supply) public {
        symbol = _symbol;
        name = _name;
        decimals = _decimals;
        _totalSupply = _supply * 10**uint(decimals);
        balances[owner] = _totalSupply;
        emit TRANSFER55(address(0), owner, _totalSupply);
    }

    function TOTALSUPPLY338() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply.SUB740(balances[address(0)]);
    }

    function BALANCEOF603(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[tokenOwner];
    }

    function TRANSFER536(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[msg.sender] = balances[msg.sender].SUB740(tokens);
        balances[to] = balances[to].ADD98(tokens);
        emit TRANSFER55(msg.sender, to, tokens);
        return true;
    }

    function APPROVE417(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL428(msg.sender, spender, tokens);
        return true;
    }

    function TRANSFERFROM413(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[from] = balances[from].SUB740(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].SUB740(tokens);
        balances[to] = balances[to].ADD98(tokens);
        emit TRANSFER55(from, to, tokens);
        return true;
    }

    function ALLOWANCE580(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[tokenOwner][spender];
    }

    function APPROVEANDCALL299(address spender, uint tokens, bytes memory data) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL428(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).RECEIVEAPPROVAL792(msg.sender, tokens, address(this), data);
        return true;
    }

    function () external payable {
        revert();
    }
    function TRANSFERANYERC20TOKEN977(address tokenAddress, uint tokens) public ONLYOWNER839 returns (bool success) {	//inject NONSTANDARD NAMING
        return ERC20Interface(tokenAddress).TRANSFER536(owner, tokens);
    }
}