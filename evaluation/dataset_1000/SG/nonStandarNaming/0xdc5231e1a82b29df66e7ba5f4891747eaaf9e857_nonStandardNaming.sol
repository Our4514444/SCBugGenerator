                                                                 

                                                                 

pragma solidity ^0.5.0;


contract HidethepainToken {
    string public name = "HideThePain Harold"; //Optional
    string public symbol = "HTPH"; //Optional
    string public standard = "HideThePain Harold v1.0"; //Not in documentation, extra!
    uint256 public totalSupply;

    event TRANSFER360(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING

    event APPROVAL496(	//inject NONSTANDARD NAMING
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

    function TRANSFER739(address _to, uint256 _value)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value, "Not enough balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit TRANSFER360(msg.sender, _to, _value);
        return true;
    }

    function APPROVE514(address _spender, uint256 _value)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL496(msg.sender, _spender, _value);
        return true;
    }

    function TRANSFERFROM555(	//inject NONSTANDARD NAMING
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
        emit TRANSFER360(_from, _to, _value);
        return true;
    }
}

contract HidethepainTokenSale {
    address payable admin;
    HidethepainToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event SELL333(address _buyer, uint256 _amount);	//inject NONSTANDARD NAMING

    constructor(HidethepainToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function BUYTOKENS217(uint256 _numberOfTokens) public payable {	//inject NONSTANDARD NAMING
        require(
            msg.value == _numberOfTokens * tokenPrice,
            "Number of tokens does not match with the value"
        );
        require(
            tokenContract.balanceOf(address(this)) >= _numberOfTokens,
            "Contact does not have enough tokens"
        );
        require(
            tokenContract.TRANSFER739(msg.sender, _numberOfTokens),
            "Some problem with token transfer"
        );
        tokensSold += _numberOfTokens;
        emit SELL333(msg.sender, _numberOfTokens);
    }

    function ENDSALE559() public {	//inject NONSTANDARD NAMING
        require(msg.sender == admin, "Only the admin can call this function");
        require(
            tokenContract.TRANSFER739(
                msg.sender,
                tokenContract.balanceOf(address(this))
            ),
            "Unable to transfer tokens to admin"
        );
        // destroy contract
        selfdestruct(admin);
    }
}