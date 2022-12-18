pragma solidity ^0.5.2;
library SafeMath {
    function ADD906(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SUB667(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a);
        c = a - b;
    }
    function MUL470(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function DIV36(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}
contract ApproveAndCallFallBack {
    function RECEIVEAPPROVAL85(address from, uint256 tokens, address token, bytes memory data) public;	//inject NONSTANDARD NAMING
}
contract EtherReserve {
    using SafeMath for uint;
    address public owner = address(0);
    string public symbol;
    string public  name;
    uint8 public decimals = 18;
    string public descriptions;
    uint _totalSupply;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    event TRANSFER948(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL266(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
    constructor (string memory _name, string memory _symbol, string memory _description) public {
        name = _name;
        symbol = _symbol;
        descriptions = _description;
        emit TRANSFER948(address(this), owner, 1e26);
    }
    modifier ONLYOWNER477() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }
    function TOTALSUPPLY923() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply  - balances[address(0)];
    }
    function BALANCEOF451(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[tokenOwner];
    }
    function TRANSFER210(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[msg.sender] = balances[msg.sender].SUB667(tokens);
        if (to == address(this)) {
            msg.sender.transfer(tokens);
            _totalSupply = _totalSupply.SUB667(tokens);
            emit TRANSFER948(msg.sender, address(0), tokens);
        } else {
            balances[to] = balances[to].ADD906(tokens);
            emit TRANSFER948(msg.sender, to, tokens);
        }
        return true;
    }
    function APPROVE420(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        if (spender == address(this)) revert();
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL266(msg.sender, spender, tokens);
        return true;
    }
    function TRANSFERFROM664(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[from] = balances[from].SUB667(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].SUB667(tokens);
        balances[to] = balances[to].ADD906(tokens);
        emit TRANSFER948(from, to, tokens);
        return true;
    }
    function ALLOWANCE728(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[tokenOwner][spender];
    }
    function APPROVEANDCALL857(address spender, uint tokens, bytes memory data) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL266(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).RECEIVEAPPROVAL85(msg.sender, tokens, address(this), data);
        return true;
    }
    function () external payable {
        if (msg.value > 0) TOKENIZE146();
    }
    function TOKENIZE146() public payable {	//inject NONSTANDARD NAMING
        require(msg.value > 0);
        _totalSupply = _totalSupply.ADD906(msg.value);
        balances[msg.sender] = balances[msg.sender].ADD906(msg.value);
        emit TRANSFER948(address(0), msg.sender, msg.value);
    }
}