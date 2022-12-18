pragma solidity ^0.5.2;
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
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
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    constructor (string memory _name, string memory _symbol, string memory _description) public {
        name = _name;
        symbol = _symbol;
        descriptions = _description;
        emit Transfer(address(this), owner, 1e26);
    }
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    function totalSupply() public view returns (uint) {
        return _totalSupply  - balances[address(0)];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (to == address(this)) {
            msg.sender.transfer(tokens);
            _totalSupply = _totalSupply.sub(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Transfer(msg.sender, address(0), tokens);
        } else {
            balances[to] = balances[to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Transfer(msg.sender, to, tokens);
        }
        return true;
    }
    function approve(address spender, uint tokens) public returns (bool success) {
        if (spender == address(this)) revert();
        allowed[msg.sender][spender] = tokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from].sub(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[to] = balances[to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(from, to, tokens);
        return true;
    }
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
        return true;
    }
    function () external payable {
        if (msg.value > 0) tokenize();
    }
    function tokenize() public payable {
        require(msg.value > 0);
        _totalSupply = _totalSupply.add(msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[msg.sender] = balances[msg.sender].add(msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(address(0), msg.sender, msg.value);
    }
}