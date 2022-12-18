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

    mapping(address => uint256) internal balanceOf;
    mapping(address => mapping(address => uint256)) internal allowance;

    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value, "Not enough balance");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[msg.sender] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_to] += _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
            balanceOf[_from] >= _value,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            "_from does not have enough tokens"
        );
        require(
            allowance[_from][msg.sender] >= _value,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            "Spender limit exceeded"
        );
        balanceOf[_from] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_to] += _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowance[_from][msg.sender] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(_from, _to, _value);
        return true;
    }
}