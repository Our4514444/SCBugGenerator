pragma solidity >= 0.5.4 ;

library SafeMath {
    
    function MUL725(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

  
    function DIV687(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
       
        require(b > 0);
        uint256 c = a / b;

        return c;
    }

    
    function SUB418(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    
    function ADD927(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    
    function MOD98(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


interface tokenRecipient { function RECEIVEAPPROVAL954(address _from, uint256 _value, address _token, bytes calldata _extraData) external; }	//inject NONSTANDARD NAMING


contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED558(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED558(address(0), _owner);
    }

    
    function OWNER443() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

    
    modifier ONLYOWNER234() {	//inject NONSTANDARD NAMING
        require(ISOWNER359());
        _;
    }

    
    function ISOWNER359() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

   
    function RENOUNCEOWNERSHIP50() public ONLYOWNER234 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED558(_owner, address(0));
        _owner = address(0);
    }

   
    function TRANSFEROWNERSHIP589(address newOwner) public ONLYOWNER234 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP532(newOwner);
    }

   
    function _TRANSFEROWNERSHIP532(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED558(_owner, newOwner);
        _owner = newOwner;
    }
}



contract Pausable is Ownable{
    event PAUSED546(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED160(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

    
    function PAUSED207() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

    
    modifier WHENNOTPAUSED131() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

   
    modifier WHENPAUSED283() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

    
    function PAUSE626() public ONLYOWNER234 WHENNOTPAUSED131 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED546(msg.sender);
    }

    
    function UNPAUSE598() public ONLYOWNER234 WHENPAUSED283 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED160(msg.sender);
    }
}


contract TokenERC20{
    using SafeMath for uint256;

    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event TRANSFER861(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    
    event APPROVAL427(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

    event BURN645(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

    
    constructor(uint256 initialSupply,string memory tokenName,string memory tokenSymbol) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  
        balanceOf[msg.sender] = totalSupply;                
        name = tokenName;                                  
        symbol = tokenSymbol;                              
    }

    
    function _TRANSFER807(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
        require(_to != address(0x0));

        balanceOf[_from] = balanceOf[_from].SUB418(_value);
        balanceOf[_to] = balanceOf[_to].ADD927(_value);

        emit TRANSFER861(_from, _to, _value);
    }

    
    function TRANSFER584(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        _TRANSFER807(msg.sender, _to, _value);
        return true;
    }

   
    function TRANSFERFROM418(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowance[_from][msg.sender] = allowance[_from][msg.sender].SUB418(_value);
        _TRANSFER807(_from, _to, _value);
        return true;
    }

   
    function APPROVE899(address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL427(msg.sender, _spender, _value);
        return true;
    }

   
    function APPROVEANDCALL482(address _spender, uint256 _value, bytes memory _extraData)	//inject NONSTANDARD NAMING
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (APPROVE899(_spender, _value)) {
            spender.RECEIVEAPPROVAL954(msg.sender, _value, address(this), _extraData);
            return true;
        }
    }

   
    function BURN341(uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        balanceOf[msg.sender] = balanceOf[msg.sender].SUB418(_value);             
        totalSupply = totalSupply.SUB418(_value);                                 
        emit BURN645(msg.sender, _value);
        return true;
    }

    
    function BURNFROM217(address _from, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        balanceOf[_from] = balanceOf[_from].SUB418(_value);                                        
        allowance[_from][msg.sender] = allowance[_from][msg.sender].SUB418(_value);                
        totalSupply = totalSupply.SUB418(_value);                                                  
        emit BURN645(_from, _value);
        return true;
    }

}


contract FuteToken is TokenERC20, Ownable,Pausable{

    mapping (address => bool) public frozenAccount;

    event FROZENFUNDS266(address target, bool frozen);	//inject NONSTANDARD NAMING

    constructor() TokenERC20(500000000,"Fute Token","FUTE") public {
    }

    function FREEZEACCOUNT985(address account, bool freeze) ONLYOWNER234 public {	//inject NONSTANDARD NAMING
        frozenAccount[account] = freeze;
        emit FROZENFUNDS266(account, freeze);
    }

    function CHANGENAME326(string memory newName) public ONLYOWNER234 {	//inject NONSTANDARD NAMING
        name = newName;
    }

    function CHANGESYMBOL226(string memory newSymbol) public ONLYOWNER234{	//inject NONSTANDARD NAMING
        symbol = newSymbol;
    }

    
    function _TRANSFER807(address _from, address _to, uint _value) internal WHENNOTPAUSED131 {	//inject NONSTANDARD NAMING
        require(_to != address(0x0));

        require(!frozenAccount[_from]);
        require(!frozenAccount[_to]);

        balanceOf[_from] = balanceOf[_from].SUB418(_value);
        balanceOf[_to] = balanceOf[_to].ADD927(_value);

        emit TRANSFER861(_from, _to, _value);
    }
}