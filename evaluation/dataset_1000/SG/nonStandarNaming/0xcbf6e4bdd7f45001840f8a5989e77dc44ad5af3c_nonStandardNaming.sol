pragma solidity ^0.5.1;

interface tokenRecipient { 
    function RECEIVEAPPROVAL98(address _from, uint256 _value, address _token, bytes calldata _extraData) external; 	//inject NONSTANDARD NAMING
}

contract RsTokenERC20 {
    // Public variables of the token
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    // 18 decimals is the strongly suggested default, avoid changing it
    uint256 public totalSupply;

    // This creates an array with all balances
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    // This generates a public event on the blockchain that will notify clients
    event TRANSFER464(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    
    // This generates a public event on the blockchain that will notify clients
    event APPROVAL725(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

    // This notifies clients about the amount burnt
    event BURN839(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                        
    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
    }

                                                                             
    function _TRANSFER732(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0x0));
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        emit TRANSFER464(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

                                                                                                                                                                                                  
    function TRANSFER260(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        _TRANSFER732(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                      
    function TRANSFERFROM238(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _TRANSFER732(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                            
    function APPROVE642(address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL725(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVEANDCALL869(address _spender, uint256 _value, bytes memory _extraData)	//inject NONSTANDARD NAMING
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (APPROVE642(_spender, _value)) {
            spender.RECEIVEAPPROVAL98(msg.sender, _value, address(this), _extraData);
            return true;
        }
    }

                                                                                                                                                               
    function BURN255(uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit BURN839(msg.sender, _value);
        return true;
    }

                                                                                                                                                                                                                                                      
    function BURNFROM770(address _from, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the targeted balance
        allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        totalSupply -= _value;                              // Update totalSupply
        emit BURN839(_from, _value);
        return true;
    }
}