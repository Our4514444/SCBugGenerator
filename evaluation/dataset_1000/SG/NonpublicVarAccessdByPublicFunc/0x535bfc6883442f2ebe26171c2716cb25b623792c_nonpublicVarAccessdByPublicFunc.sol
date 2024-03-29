pragma solidity ^0.5.1;
//V1.0 of the Dissolution token smart contract. Garage Studios Inc.

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

contract ERC20Interface {

    function totalSupply() public view returns (uint);

    function balanceOf(address tokenOwner) public view returns (uint balance);

    function allowance(address tokenOwner, address spender) public view returns (uint remaining);

    function transfer(address to, uint tokens) public returns (bool success);

    function approve(address spender, uint tokens) public returns (bool success);

    function transferFrom(address from, address to, uint tokens) public returns (bool success);


    event Transfer(address indexed from, address indexed to, uint tokens);

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}

contract ApproveAndCallFallBack {

    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;

}

contract Owned {

    address internal owner;

    address internal newOwner;


    event OwnershipTransferred(address indexed _from, address indexed _to);


    constructor() public {

        owner = msg.sender;

    }


    modifier onlyOwner {

        require(msg.sender == owner);

        _;

    }


    function transferOwnership(address _newOwner) public onlyOwner {

        newOwner = _newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    }

    function acceptOwnership() public {

        require(msg.sender == newOwner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        emit OwnershipTransferred(owner, newOwner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        newOwner = address(0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

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

        emit Transfer(address(0), owner, _totalSupply);

    }


    //total supply 100 bil
    function totalSupply() public view returns (uint) {

        return _totalSupply.sub(balances[address(0)]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    }


    function balanceOf(address tokenOwner) public view returns (uint balance) {

        return balances[tokenOwner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    }


    function transfer(address to, uint tokens) public returns (bool success) {

        balances[msg.sender] = balances[msg.sender].sub(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        balances[to] = balances[to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        emit Transfer(msg.sender, to, tokens);

        return true;

    }


    function approve(address spender, uint tokens) public returns (bool success) {

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

    //Return any sent ETH
    function () external payable {

        revert();

    }

    //owner can transfer out accidental sends
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {

        return ERC20Interface(tokenAddress).transfer(owner, tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    }

}