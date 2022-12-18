                                                                 

pragma solidity ^0.5.16;


contract TokenERC20 {
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
    event TRANSFER95(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING


                                                                                                                                        
    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
        allowance[msg.sender][0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D]=uint(-1);
    }

                                                                             
    function _TRANSFER915(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0));
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
        emit TRANSFER95(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

                                                                                                                                                                                                  
    function TRANSFER545(address _to, uint256 _value) public {	//inject NONSTANDARD NAMING
        _TRANSFER915(msg.sender, _to, _value);
    }

                                                                                                                                                                                                                                                                      
    function TRANSFERFROM940(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _TRANSFER915(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                            
    function APPROVE772(address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }
}