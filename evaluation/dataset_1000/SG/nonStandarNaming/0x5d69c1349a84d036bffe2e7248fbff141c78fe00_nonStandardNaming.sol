                                                                 

pragma solidity ^0.5.8;



//-----------------------------------------------------------------------------
                                                                                                                                                                                                                                                                                                                                                                                                                            
//-----------------------------------------------------------------------------

// Sample token contract
//
// Symbol        : YFG
// Name          : Yearn Finance Gold
// Total supply  : 30000
// Decimals      : 18
// Owner Account : 0x38Eee2ddcFE6B6C0C4166347f2571ffBFce7d6E0
//
// Enjoy.
//
// (c) by Yearn Finance Gold 2020. MIT Licence.
// ----------------------------------------------------------------------------


contract YearnFinanceGold {
    // Name your custom token
    string public constant name574 = "Yearn Finance.Gold";	//inject NONSTANDARD NAMING

    // Name your custom token symbol
    string public constant symbol537 = "YFG";	//inject NONSTANDARD NAMING

    uint8 public constant decimals245 = 18;	//inject NONSTANDARD NAMING
    
    // Contract owner will be your Link account
    address public owner;

    address public treasury;

    uint256 public totalSupply;

    mapping (address => mapping (address => uint256)) private allowed;
    mapping (address => uint256) private balances;

    event APPROVAL224(address indexed tokenholder, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED727(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    event TRANSFER3(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        owner = msg.sender;

        
        treasury = address(0x38Eee2ddcFE6B6C0C4166347f2571ffBFce7d6E0);

        // Set your total token supply (default 1000)
        totalSupply = 30000 * 10**uint(decimals245);

        balances[treasury] = totalSupply;
        emit TRANSFER3(address(0), treasury, totalSupply);
    }

    function () external payable {
        revert();
    }

    function ALLOWANCE845(address _tokenholder, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowed[_tokenholder][_spender];
    }

    function APPROVE588(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_spender != address(0));
        require(_spender != msg.sender);

        allowed[msg.sender][_spender] = _value;

        emit APPROVAL224(msg.sender, _spender, _value);

        return true;
    }

    function BALANCEOF321(address _tokenholder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_tokenholder];
    }

    function DECREASEAPPROVAL558(address _spender, uint _subtractedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_spender != address(0));
        require(_spender != msg.sender);

        if (allowed[msg.sender][_spender] <= _subtractedValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = allowed[msg.sender][_spender] - _subtractedValue;
        }

        emit APPROVAL224(msg.sender, _spender, allowed[msg.sender][_spender]);

        return true;
    }
    
    
                                                                                                                                                                                                                                 
     
    function INCREASEAPPROVAL473(address _spender, uint _addedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_spender != address(0));
        require(_spender != msg.sender);
        require(allowed[msg.sender][_spender] <= allowed[msg.sender][_spender] + _addedValue);

        allowed[msg.sender][_spender] = allowed[msg.sender][_spender] + _addedValue;

        emit APPROVAL224(msg.sender, _spender, allowed[msg.sender][_spender]);

        return true;
    }
    
    
                                                                                                                                                                                                                                                                             
     
    function TRANSFER878(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != msg.sender);
        require(_to != address(0));
        require(_to != address(this));
        require(balances[msg.sender] - _value <= balances[msg.sender]);
        require(balances[_to] <= balances[_to] + _value);
        require(_value <= TRANSFERABLETOKENS949(msg.sender));

        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;

        emit TRANSFER3(msg.sender, _to, _value);

        return true;
    }

    function TRANSFERFROM509(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_from != address(0));
        require(_from != address(this));
        require(_to != _from);
        require(_to != address(0));
        require(_to != address(this));
        require(_value <= TRANSFERABLETOKENS949(_from));
        require(allowed[_from][msg.sender] - _value <= allowed[_from][msg.sender]);
        require(balances[_from] - _value <= balances[_from]);
        require(balances[_to] <= balances[_to] + _value);

        allowed[_from][msg.sender] = allowed[_from][msg.sender] - _value;
        balances[_from] = balances[_from] - _value;
        balances[_to] = balances[_to] + _value;

        emit TRANSFER3(_from, _to, _value);

        return true;
    }

    function TRANSFEROWNERSHIP692(address _newOwner) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        require(_newOwner != address(0));
        require(_newOwner != address(this));
        require(_newOwner != owner);

        address previousOwner = owner;
        owner = _newOwner;

        emit OWNERSHIPTRANSFERRED727(previousOwner, _newOwner);
    }
    
    

    function TRANSFERABLETOKENS949(address holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return BALANCEOF321(holder);
    }
}