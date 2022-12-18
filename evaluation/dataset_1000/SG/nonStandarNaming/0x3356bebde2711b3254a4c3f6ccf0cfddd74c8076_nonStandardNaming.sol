pragma solidity ^0.5.4;

contract GVC{
    event MINTTRANSFER836(address indexe,uint);	//inject NONSTANDARD NAMING
    event TRANSFER709(address indexed _from,address indexed _to,uint _amount);	//inject NONSTANDARD NAMING
    event APPROVAL723(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
    event BURN433(address,uint);	//inject NONSTANDARD NAMING
    string public constant name488="GlobalVc";	//inject NONSTANDARD NAMING
    string public constant symbol496="GVC";	//inject NONSTANDARD NAMING
    uint public constant decimals788=18;	//inject NONSTANDARD NAMING
    uint  public constant initialsuply975=1000000;	//inject NONSTANDARD NAMING
    uint public  totalSupply= initialsuply975*10**decimals788;
    address ownerOfTotalSupply;
    constructor(address _ownerOfTotalSupply)public{
        ownerOfTotalSupply = _ownerOfTotalSupply;
        balanceOf[_ownerOfTotalSupply] = totalSupply;
    }
    mapping(address=>uint)balanceOf;
    mapping(address=>mapping(address=>uint))allowed;
    function BALANCE729(address _owner)public view returns(uint){	//inject NONSTANDARD NAMING
        return(balanceOf[_owner]);
    }
    function _TRANSFER257(address _from,address _to,uint _value)public {	//inject NONSTANDARD NAMING
        require(_to != address(0x0));
        require(_to != _from);
        require(balanceOf[_from]>= _value);
        require(balanceOf[_to]+_value >= balanceOf[_to]);
        require(_value>0 );
        uint previosBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from]-=_value;
        balanceOf[_to]+=_value;
        emit TRANSFER709(_from,_to,_value);
        assert(balanceOf[_from] + balanceOf[_to] == previosBalances);
    }
    function TRANSFER480(address _to,uint _value)public returns(bool success){	//inject NONSTANDARD NAMING
        _TRANSFER257(msg.sender,_to,_value);
        return true;
    }
    function TRANSFERFROM426(address _from,address _to,uint _value)public returns(bool success){	//inject NONSTANDARD NAMING
        require(_value<=allowed[_from][msg.sender]);
        _TRANSFER257(_from,_to,_value);
        return true;
    }
    function APPROVE54(address _spender,uint _value)public returns(bool success){	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender]=_value;
        emit APPROVAL723(msg.sender,_spender,_value);
        return true;
    }
    function MINTTOKEN764(address _target,uint _amountMintToken)public{	//inject NONSTANDARD NAMING
        require(msg.sender == ownerOfTotalSupply);
        balanceOf[_target]+=_amountMintToken;
        totalSupply+=_amountMintToken;
        emit MINTTRANSFER836(ownerOfTotalSupply,_amountMintToken);
        emit TRANSFER709(ownerOfTotalSupply,_target,_amountMintToken);
    }
    function BURN41(uint _amount)public returns(bool success){	//inject NONSTANDARD NAMING
        require(msg.sender == ownerOfTotalSupply);
        require(balanceOf[msg.sender] >=_amount);
        balanceOf[msg.sender]-=_amount;
        totalSupply-=_amount;
        emit BURN433(msg.sender,_amount);
        return true;
    }
    function BURNFROM306(address _from,uint _amount)public  returns(bool success){	//inject NONSTANDARD NAMING
        require(balanceOf[_from]>= _amount);
        require(_amount<=allowed[_from][msg.sender]);
        balanceOf[_from]-=_amount;
        allowed[_from][msg.sender]-=_amount;
        totalSupply-=_amount;
        emit BURN433(_from,_amount);
        return true;
        
    }
}