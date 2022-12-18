pragma solidity ^0.5.4;

contract GVC{
    event mintTransfer(address indexe,uint);
    event Transfer(address indexed _from,address indexed _to,uint _amount);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Burn(address,uint);
    string public constant name="GlobalVc";
    string public constant symbol="GVC";
    uint public constant decimals=18;
    uint  public constant initialSuply=1000000;
    uint internal  totalSupply= initialSuply*10**decimals;
    address ownerOfTotalSupply;
    constructor(address _ownerOfTotalSupply)public{
        ownerOfTotalSupply = _ownerOfTotalSupply;
        balanceOf[_ownerOfTotalSupply] = totalSupply;
    }
    mapping(address=>uint)balanceOf;
    mapping(address=>mapping(address=>uint))allowed;
    function balance(address _owner)public view returns(uint){
        return(balanceOf[_owner]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function _transfer(address _from,address _to,uint _value)public {
        require(_to != address(0x0));
        require(_to != _from);
        require(balanceOf[_from]>= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(balanceOf[_to]+_value >= balanceOf[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_value>0 );
        uint previosBalances = balanceOf[_from] + balanceOf[_to];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_from]-=_value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_to]+=_value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(_from,_to,_value);
        assert(balanceOf[_from] + balanceOf[_to] == previosBalances);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function transfer(address _to,uint _value)public returns(bool success){
        _transfer(msg.sender,_to,_value);
        return true;
    }
    function transferFrom(address _from,address _to,uint _value)public returns(bool success){
        require(_value<=allowed[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _transfer(_from,_to,_value);
        return true;
    }
    function approve(address _spender,uint _value)public returns(bool success){
        allowed[msg.sender][_spender]=_value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender,_spender,_value);
        return true;
    }
    function mintToken(address _target,uint _amountMintToken)public{
        require(msg.sender == ownerOfTotalSupply);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_target]+=_amountMintToken;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply+=_amountMintToken;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit mintTransfer(ownerOfTotalSupply,_amountMintToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(ownerOfTotalSupply,_target,_amountMintToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function burn(uint _amount)public returns(bool success){
        require(msg.sender == ownerOfTotalSupply);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(balanceOf[msg.sender] >=_amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[msg.sender]-=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply-=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Burn(msg.sender,_amount);
        return true;
    }
    function burnFrom(address _from,uint _amount)public  returns(bool success){
        require(balanceOf[_from]>= _amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_amount<=allowed[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_from]-=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowed[_from][msg.sender]-=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply-=_amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Burn(_from,_amount);
        return true;
        
    }
}