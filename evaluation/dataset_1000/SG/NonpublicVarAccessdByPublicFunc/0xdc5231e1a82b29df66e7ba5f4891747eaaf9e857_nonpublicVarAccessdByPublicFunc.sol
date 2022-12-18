/**
 *Submitted for verification at Etherscan.io on 2020-09-02
*/

/**
 *Submitted for verification at Etherscan.io on 2020-09-01
*/

pragma solidity ^0.5.0;


contract HidethepainToken {
    string public name = "HideThePain Harold"; //Optional
    string public symbol = "HTPH"; //Optional
    string public standard = "HideThePain Harold v1.0"; //Not in documentation, extra!
    uint256 public totalSupply;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) internal allowance;

    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value, "Not enough balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(
            balanceOf[_from] >= _value,
            "_from does not have enough tokens"
        );
        require(
            allowance[_from][msg.sender] >= _value,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            "Spender limit exceeded"
        );
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(_from, _to, _value);
        return true;
    }
}

contract HidethepainTokenSale {
    address payable admin;
    HidethepainToken internal tokenContract;
    uint256 internal tokenPrice;
    uint256 internal tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(HidethepainToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        require(
            msg.value == _numberOfTokens * tokenPrice,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            "Number of tokens does not match with the value"
        );
        require(
            tokenContract.balanceOf(address(this)) >= _numberOfTokens,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            "Contact does not have enough tokens"
        );
        require(
            tokenContract.transfer(msg.sender, _numberOfTokens),	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            "Some problem with token transfer"
        );
        tokensSold += _numberOfTokens;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Sell(msg.sender, _numberOfTokens);
    }

    function endSale() public {
        require(msg.sender == admin, "Only the admin can call this function");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(
            tokenContract.transfer(	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                msg.sender,
                tokenContract.balanceOf(address(this))	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            ),
            "Unable to transfer tokens to admin"
        );
        // destroy contract
        selfdestruct(admin);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}