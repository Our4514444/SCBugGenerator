pragma solidity ^0.5.0;

contract BIP
{
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_;
    string public name_;
    string public symbol_;
    uint8 public decimals_;

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

    function NAME835() public view returns (string memory)	//inject NONSTANDARD NAMING
    {
        return name_;
    }

    function SYMBOL891() public view returns (string memory)	//inject NONSTANDARD NAMING
    {
        return symbol_;
    }

    function DECIMALS262() public view returns (uint8)	//inject NONSTANDARD NAMING
    {
        return decimals_;
    }

// erc-20 fns

    function TOTALSUPPLY735() public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return totalSupply_;
    }

    function BALANCEOF658(address tokenOwner) public view returns (uint)	//inject NONSTANDARD NAMING
    {
      return balances[tokenOwner];
    }

    function TRANSFER671(address receiver, uint numTokens) public returns (bool)	//inject NONSTANDARD NAMING
    {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender] - numTokens;
        balances[receiver] = balances[receiver] + numTokens;
        emit TRANSFER775(msg.sender, receiver, numTokens);
        return true;
    }


    function ALLOWANCE283(address owner, address delegate) public view returns (uint)	//inject NONSTANDARD NAMING
    {
        return allowed[owner][delegate];
    }

    function APPROVE175(address delegate, uint numTokens) public returns (bool)	//inject NONSTANDARD NAMING
    {
        allowed[msg.sender][delegate] = numTokens;
        emit APPROVAL919(msg.sender, delegate, numTokens);
        return true;
    }

    function TRANSFERFROM367(address owner, address buyer, uint numTokens) public returns (bool)	//inject NONSTANDARD NAMING
    {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);
        balances[owner] = balances[owner] - numTokens;
        allowed[owner][msg.sender] = allowed[owner][msg.sender] - numTokens;
        balances[buyer] = balances[buyer] + numTokens;
        emit TRANSFER775(owner, buyer, numTokens); 
        return true;
    }

    event APPROVAL919(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
    event TRANSFER775(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING

}