pragma solidity ^0.5.0;

contract BIP
{
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_;
    string internal name_;
    string internal symbol_;
    uint8 internal decimals_;

    constructor (uint256 total) public
    {
        if (total <= 200000000000000000000000000)
        {
            total = 200000000000000000000000000;
        }
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;

    		name_ = "Blockchain Invest Platform Token";
    		decimals_ = 18;
    		symbol_ = "BIP";
    }

// getters

    function name() public view returns (string memory)
    {
        return name_;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function symbol() public view returns (string memory)
    {
        return symbol_;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function decimals() public view returns (uint8)
    {
        return decimals_;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

// erc-20 fns

    function totalSupply() public view returns (uint256)
    {
        return totalSupply_;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function balanceOf(address tokenOwner) public view returns (uint)
    {
      return balances[tokenOwner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function transfer(address receiver, uint numTokens) public returns (bool)
    {
        require(numTokens <= balances[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[msg.sender] = balances[msg.sender] - numTokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[receiver] = balances[receiver] + numTokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }


    function allowance(address owner, address delegate) public view returns (uint)
    {
        return allowed[owner][delegate];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function approve(address delegate, uint numTokens) public returns (bool)
    {
        allowed[msg.sender][delegate] = numTokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool)
    {
        require(numTokens <= balances[owner]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(numTokens <= allowed[owner][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[owner] = balances[owner] - numTokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowed[owner][msg.sender] = allowed[owner][msg.sender] - numTokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[buyer] = balances[buyer] + numTokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(owner, buyer, numTokens); 
        return true;
    }

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

}