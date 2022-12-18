                                                                 

                                                                 

pragma solidity ^0.5.0;


contract HidethepainToken {
    string public name = "HideThePain Harold"; //Optional
    string public symbol = "HTPH"; //Optional
    string public standard = "HideThePain Harold v1.0"; //Not in documentation, extra!
    uint256 public totalSupply;

    event TRANSFER737(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING

    event APPROVAL46(	//inject NONSTANDARD NAMING
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    function TRANSFER403(address _to, uint256 _value)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value, "Not enough balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit TRANSFER737(msg.sender, _to, _value);
        return true;
    }

    function APPROVE629(address _spender, uint256 _value)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL46(msg.sender, _spender, _value);
        return true;
    }

    function TRANSFERFROM948(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(
            balanceOf[_from] >= _value,
            "_from does not have enough tokens"
        );
        require(
            allowance[_from][msg.sender] >= _value,
            "Spender limit exceeded"
        );
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit TRANSFER737(_from, _to, _value);
        return true;
    }
}