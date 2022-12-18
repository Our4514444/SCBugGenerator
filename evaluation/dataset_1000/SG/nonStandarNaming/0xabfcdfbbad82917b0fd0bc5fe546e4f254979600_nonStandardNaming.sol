pragma solidity ^0.5.1;

contract tokenRecipientInterface {
  function RECEIVEAPPROVAL253(address _from, uint256 _value, address _token, bytes memory _extraData) public;	//inject NONSTANDARD NAMING
}

contract ERC20TokenInterface {
  function TOTALSUPPLY915() public view returns (uint256 _totalSupply);	//inject NONSTANDARD NAMING
  function BALANCEOF695(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
  function TRANSFER718(address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM146(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE219(address _spender, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function ALLOWANCE748(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING

  event TRANSFER83(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
  event APPROVAL459(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
}

contract SafeMath {
    
    uint256 constant public max_uint25613 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;	//inject NONSTANDARD NAMING

    function SAFEADD269(uint256 x, uint256 y) pure internal returns (uint256 z) {	//inject NONSTANDARD NAMING
        require(x <= max_uint25613 - y);
        return x + y;
    }

    function SAFESUB66(uint256 x, uint256 y) pure internal returns (uint256 z) {	//inject NONSTANDARD NAMING
        require(x >= y);
        return x - y;
    }

    function SAFEMUL232(uint256 x, uint256 y) pure internal returns (uint256 z) {	//inject NONSTANDARD NAMING
        if (y == 0) {
            return 0;
        }
        require(x <= (max_uint25613 / y));
        return x * y;
    }
}

contract Owned {
    address payable public owner;
    address payable public newOwner;

    constructor() public{
        //owner = msg.sender;
    }

    modifier ONLYOWNER461 {	//inject NONSTANDARD NAMING
        assert(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP771(address payable _newOwner) public ONLYOWNER461 {	//inject NONSTANDARD NAMING
        require(_newOwner != owner);
        newOwner = _newOwner;
    }

    function ACCEPTOWNERSHIP316() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner);
        emit OWNERUPDATE313(owner, newOwner);
        owner = newOwner;
        newOwner = address(0x0);
    }

    event OWNERUPDATE313(address _prevOwner, address _newOwner);	//inject NONSTANDARD NAMING
}

contract Lockable is Owned {

    uint256 public lockedUntilBlock;

    event CONTRACTLOCKED737(uint256 _untilBlock, string _reason);	//inject NONSTANDARD NAMING

    modifier LOCKAFFECTED374 {	//inject NONSTANDARD NAMING
        require(block.number > lockedUntilBlock);
        _;
    }

    function LOCKFROMSELF491(uint256 _untilBlock, string memory _reason) internal {	//inject NONSTANDARD NAMING
        lockedUntilBlock = _untilBlock;
        emit CONTRACTLOCKED737(_untilBlock, _reason);
    }


    function LOCKUNTIL747(uint256 _untilBlock, string memory _reason) ONLYOWNER461 public {	//inject NONSTANDARD NAMING
        lockedUntilBlock = _untilBlock;
        emit CONTRACTLOCKED737(_untilBlock, _reason);
    }
}

contract ERC20Token is ERC20TokenInterface, SafeMath, Owned, Lockable {

    // Name of token
    string public name;
    // Abbreviation of tokens name
    string public symbol;
    // Number of decimals token has
    uint8 public decimals;
    // Maximum tokens that can be minted
    uint256 public totalSupplyLimit;

    // Current supply of tokens
    uint256 supply = 0;
    // Map of users balances
    mapping (address => uint256) balances;
    // Map of users allowances
    mapping (address => mapping (address => uint256)) allowances;

    // Event that shows that new tokens were created
    event MINT694(address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
    // Event that shows that old tokens were destroyed
    event BURN885(address indexed _from, uint _value);	//inject NONSTANDARD NAMING

                                                                                                            
    function TOTALSUPPLY915() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return supply;
    }

                                                                                                                                                                             
    function BALANCEOF695(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

                                                                                                                                                                                                                                                                    
    function TRANSFER718(address _to, uint256 _value) LOCKAFFECTED374 public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_to != address(0x0) && _to != address(this));
        balances[msg.sender] = SAFESUB66(BALANCEOF695(msg.sender), _value);
        balances[_to] = SAFEADD269(BALANCEOF695(_to), _value);
        emit TRANSFER83(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                         
    function APPROVE219(address _spender, uint256 _value) LOCKAFFECTED374 public returns (bool success) {	//inject NONSTANDARD NAMING
        allowances[msg.sender][_spender] = _value;
        emit APPROVAL459(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                            
    function APPROVEANDCALL684(address _spender, uint256 _value, bytes memory _extraData) LOCKAFFECTED374 public returns (bool success) {	//inject NONSTANDARD NAMING
        tokenRecipientInterface spender = tokenRecipientInterface(_spender);
        APPROVE219(_spender, _value);
        spender.RECEIVEAPPROVAL253(msg.sender, _value, address(this), _extraData);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                               
    function TRANSFERFROM146(address _from, address _to, uint256 _value) LOCKAFFECTED374 public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_to != address(0x0) && _to != address(this));
        balances[_from] = SAFESUB66(BALANCEOF695(_from), _value);
        balances[_to] = SAFEADD269(BALANCEOF695(_to), _value);
        allowances[_from][msg.sender] = SAFESUB66(allowances[_from][msg.sender], _value);
        emit TRANSFER83(_from, _to, _value);
        return true;
    }
    
                                                                                                                                                                                                                                                                                                              
    function OWNERTRANSFERFROM897(address _from, address _to, uint256 _value) ONLYOWNER461 public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[_from] = SAFESUB66(BALANCEOF695(_from), _value);
        balances[_to] = SAFEADD269(BALANCEOF695(_to), _value);
        emit TRANSFER83(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                  
    function ALLOWANCE748(address _owner, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowances[_owner][_spender];
    }

                                                                                                                                                                                                     
    function MINTTOKENS467(address _to, uint256 _amount) ONLYOWNER461 public {	//inject NONSTANDARD NAMING
        require(supply + _amount <= totalSupplyLimit);
        supply = SAFEADD269(supply, _amount);
        balances[_to] = SAFEADD269(balances[_to], _amount);
        emit MINT694(_to, _amount);
        emit TRANSFER83(address(0x0), _to, _amount);
    }

                                                                                                                                                 
    function BURN184(uint _amount) public {	//inject NONSTANDARD NAMING
        balances[msg.sender] = SAFESUB66(BALANCEOF695(msg.sender), _amount);
        supply = SAFESUB66(supply, _amount);
        emit BURN885(msg.sender, _amount);
        emit TRANSFER83(msg.sender, address(0x0), _amount);
    }

                                                                                                                                                                                                                                                                              
    function SALVAGETOKENSFROMCONTRACT90(address _tokenAddress, address _to, uint _amount) ONLYOWNER461 public {	//inject NONSTANDARD NAMING
        ERC20TokenInterface(_tokenAddress).TRANSFER718(_to, _amount);
    }

                                                                                                     
    function KILLCONTRACT109() public ONLYOWNER461 {	//inject NONSTANDARD NAMING
        selfdestruct(owner);
    }
}

contract MRPROTokenContract is ERC20Token {

                                                                        
    constructor() public {
        owner = 0xa12F88dC40BA5629C87D37d20EE46759b6a2f6ac;
        name = "MRPROToken";
        symbol = "MRPRO";
        decimals = 18;
        totalSupplyLimit = 1000000000 * 10**18;
    }
}