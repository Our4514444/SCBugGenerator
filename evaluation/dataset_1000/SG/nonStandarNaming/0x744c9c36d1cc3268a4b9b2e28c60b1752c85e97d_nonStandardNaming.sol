pragma solidity ^0.5.1;

// @title Alluva (ALV) Token Contract
// @owner Alluva

// @notice Safe Maths Contract to stop over/underflow errors
contract SafeMath {
    // @dev safe addition, reverts if integer overflow
    function SAFEADD598(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    // @dev safe subtraction, reverts if integer underflow
    function SAFESUB369(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a);
        c = a - b;
    }
    // @dev safe multiplication, reverts if integer overflow
    function SAFEMUL664(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }
    // @dev safe division, revert on division by zero
    function SAFEDIV890(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}

// @title ERC Token Standard #20 Interface
// @notice https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// @dev ERC20 contract framework with default function definitions
contract ERC20Interface {
    uint256 public totalSupply;

    function BALANCEOF363(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
    function TRANSFER909(address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM564(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE940(address _spender, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
    function ALLOWANCE806(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING

    event TRANSFER289(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
    event APPROVAL597(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
}

// @title Contract ownership functionality
// @notice based on OpenZeppelin Ownable.sol
contract Owned {
    address public owner;
    address public newOwner;

    event OWNERSHIPTRANSFERRED225(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

    // @dev sets msg.sender to contract owner on initial deployment
    constructor() public {
        owner = msg.sender;
    }

    // @dev modifier to check ownership before function execution
    modifier ONLYOWNER726 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    // @notice transfer ownership from one address to another
    // @param _newOwner The address of the new owner
    // @dev can only be executed by contract owner
    function TRANSFEROWNERSHIP254(address _newOwner) public ONLYOWNER726 {	//inject NONSTANDARD NAMING
        newOwner = _newOwner;
    }

    // @notice function for new owner to accept contract ownership
    // @dev reverts if called before transferOwnership
    function ACCEPTOWNERSHIP996() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner);
        owner = newOwner;
        newOwner = address(0);
        emit OWNERSHIPTRANSFERRED225(owner, newOwner);
    }
}

// @title Alluva ERC20 Token
// @notice Inherits default interface, ownership and safe maths.
contract AlluvaToken is ERC20Interface, Owned, SafeMath {
    address public owner = msg.sender;
    string public symbol;
    string public name;
    uint8 public decimals;
    uint public totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    // @dev Constructor function
    constructor() public {
        symbol = "ALV";
        name = "Alluva";
        decimals = 18;
        totalSupply = 3000000000000000000000000000;
        balances[owner] = totalSupply;
        emit TRANSFER289(address(0), owner, totalSupply);
    }

    // @dev Returns the token balance for provided address
    // @param _owner The address of token owner
    // @return Balance of requested address
    function BALANCEOF363(address _owner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    // @dev Transfer tokens from sender to another address
    // @param _to Address of recipient
    // @param _value Number of tokens to transfer (in smallest divisible unit)
    // @return True if transaction was successful
    function TRANSFER909(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_to != address(0));

        require(balances[msg.sender] >= _value);
        balances[msg.sender] = SAFESUB369(balances[msg.sender], _value);
        balances[_to] = SAFEADD598(balances[_to], _value);
        emit TRANSFER289(msg.sender, _to, _value);
        return true;
    }

    // @dev Transfer _value tokens from address _from to address _to. Caller
    // needs to be approved by _from, using approve method, prior to calling
    // @param _from Address to transfer tokens from
    // @param _to Address to transfer tokens to
    // @param _value Number of tokens to transfer (in smallest divisible unit)
    // @return True if transaction was successful
    function TRANSFERFROM564(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_to != address(0));

        allowed[_from][msg.sender] = SAFESUB369(allowed[_from][msg.sender], _value);
        balances[_from] = SAFESUB369(balances[_from], _value);
        balances[_to] = SAFEADD598(balances[_to], _value);
        emit TRANSFER289(_from, _to, _value);
        return true;
    }

    // @dev Approves _spender to transfer _value tokens from message sender address
    // @notice Frontend/Client should set allowance to 0 prior to updating to
    // prevent approve/transferFrom attack vector as described here:
    // https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    // @param _spender Address to allocate spending limit to
    // @param _value Number of tokens to allow spender (in smallest divisible unit)
    // @return True if transaction was successful
    function APPROVE940(address _spender, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_spender != address(0));

        allowed[msg.sender][_spender] = _value;
        emit APPROVAL597(msg.sender, _spender, _value);
        return true;
    }

    // @dev Returns the number of tokens that can be transferred from _owner to
    // _spender, set by approve method
    // @param _owner Address of token owner
    // @param _spender Address of approved spender
    // @return Remaining approved spending
    function ALLOWANCE806(address _owner, address _spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    // @dev Increase the amount of tokens that _spender can transfer from owner
    // approve should be called when allowed[_spender] == 0. To increment
    // allowed value use this function to avoid 2 calls (and wait until the
    // first transaction is mined)
    // From OpenZeppelin ERC20.sol
    // Emits an Approval event
    // @param _spender The address that is allowed to spend funds
    // @param _addedValue The value to add to allowance
    function INCREASEALLOWANCE326(address _spender, uint256 _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_spender != address(0));

        allowed[msg.sender][_spender] = SAFEADD598(allowed[msg.sender][_spender], _addedValue);
        emit APPROVAL597(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    // @dev Decrease the amount of tokens that _spender can transfer from owner
    // approve should be called when allowed[_spender] == 0. To decrease
    // allowed value use this function to avoid 2 calls (and wait until the
    // first transaction is mined)
    // From OpenZeppelin ERC20.sol
    // Emits an Approval event
    // @param _spender The address that is allowed to spend funds
    // @param _subtractedValue The value to subtract from allowance
    function DECREASEALLOWANCE187(address _spender, uint256 _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_spender != address(0));

        allowed[msg.sender][_spender] = SAFESUB369(allowed[msg.sender][_spender], _subtractedValue);
        emit APPROVAL597(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }


    // @dev Fallback function to reject ether sent to contract
    function () external payable {
        revert();
    }

    // @dev Allow contract owner to transfer other tokens sent to contract
    // @param _tokenAddress contract address of token to transfer
    // @param _tokens number of tokens to transfer
    // @return True if transaction was successful
    function TRANSFERANYERC20TOKEN767(address _tokenAddress, uint _tokens) public ONLYOWNER726 returns (bool success) {	//inject NONSTANDARD NAMING
        return ERC20Interface(_tokenAddress).TRANSFER909(owner, _tokens);
    }

}