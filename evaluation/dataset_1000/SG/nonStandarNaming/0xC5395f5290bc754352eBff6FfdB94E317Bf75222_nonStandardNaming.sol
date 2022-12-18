                                                                 

// SPDX-License-Identifier: MIT
pragma solidity ^0.5.2;

library SafeMath {
                                                                                  
    function MUL814(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                           
    function DIV197(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB232(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD307(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD193(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

pragma solidity ^0.5.2;

library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD307(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS628(role, account));

        role.bearer[account] = true;
    }

                                                                    
    function REMOVE62(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS628(role, account));

        role.bearer[account] = false;
    }

                                                                                  
    function HAS628(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

pragma solidity ^0.5.2;

contract Ownable {
    address public _owner;

    event OWNERSHIPTRANSFERRED474(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    constructor () public {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED474(address(0), msg.sender);
    }

    function OWNER524() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

    modifier ONLYOWNER632() {	//inject NONSTANDARD NAMING
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    function RENOUNCEOWNERSHIP219() public ONLYOWNER632 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED474(_owner, address(0));
        _owner = address(0);
    }

    function TRANSFEROWNERSHIP996(address newOwner) public ONLYOWNER632 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED474(_owner, newOwner);
        _owner = newOwner;
    }
}


pragma solidity ^0.5.2;

contract DJCoin is Ownable {

    using SafeMath for uint256;

    event LOGBURN494(uint256 indexed epoch, uint256 decayrate, uint256 totalSupply);	//inject NONSTANDARD NAMING
    event TRANSFER196(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL128(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
    

    modifier VALIDRECIPIENT982(address to) {	//inject NONSTANDARD NAMING
        require(to != address(0x0));
        require(to != address(this));
        _;
    }

    string public constant name947 = "DJ Coin";	//inject NONSTANDARD NAMING
    string public constant symbol678 = "DJM";	//inject NONSTANDARD NAMING
    uint256 public constant decimals605 = 4;	//inject NONSTANDARD NAMING

    uint256 private constant decimals605 = 4;	//inject NONSTANDARD NAMING
    uint256 private constant max_uint256525 = ~uint256(0); //(2^256) - 1	//inject NONSTANDARD NAMING
    uint256 private constant initial_fragments_supply945 = 210000000 * 10**decimals605;	//inject NONSTANDARD NAMING
    uint256 private constant total_gons809 = max_uint256525 - (max_uint256525 % initial_fragments_supply945);	//inject NONSTANDARD NAMING
    uint256 private constant max_supply839 = ~uint128(0); //(2^128) - 1	//inject NONSTANDARD NAMING

    uint256 private _totalSupply;
    uint256 private _gonsPerFragment;
    mapping(address => uint256) private _gonBalances;
    mapping (address => mapping (address => uint256)) private _allowedFragments;
   
    
    uint256 public lastMintedtime;
    uint256 public totalParticipants = 0;
    uint256 public tokensPerBlock = 1*10**decimals605;
    address public tokencontractAddress = address(this);
    
    constructor() public {
        _owner = msg.sender;
        
        _totalSupply = initial_fragments_supply945;
        _gonBalances[_owner] = total_gons809;
        _gonsPerFragment = total_gons809.DIV197(_totalSupply);

        emit TRANSFER196(address(0x0), _owner, _totalSupply);
       
        lastMintedtime = now;
    }


    function BURN637(uint256 epoch, uint256 decayrate) external ONLYOWNER632 returns (uint256)	//inject NONSTANDARD NAMING
    {
        uint256 _remainrate = 10000; //0.25%->decayrate=25
        _remainrate = _remainrate.SUB232(decayrate);


        _totalSupply = _totalSupply.MUL814(_remainrate);
        _totalSupply = _totalSupply.SUB232(_totalSupply.MOD193(10000));
        _totalSupply = _totalSupply.DIV197(10000);

        
        if (_totalSupply > max_supply839) {
            _totalSupply = max_supply839;
        }

        _gonsPerFragment = total_gons809.DIV197(_totalSupply);

        emit LOGBURN494(epoch, decayrate, _totalSupply);
        return _totalSupply;
    }

    

    function TOTALSUPPLY872() public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return _totalSupply;
    }

    function BALANCEOF825(address who) public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return _gonBalances[who].DIV197(_gonsPerFragment);
    }

    function TRANSFER950(address to, uint256 value) public  VALIDRECIPIENT982(to) returns (bool)	//inject NONSTANDARD NAMING
    {
        uint256 decayvalue = value.MUL814(25); //2.5%->25/1000
        decayvalue = decayvalue.SUB232(decayvalue.MOD193(1000));
        decayvalue = decayvalue.DIV197(1000);
        
        uint256 gonValue = value.MUL814(_gonsPerFragment);
        uint256 leftgonValue = value.SUB232(decayvalue);
        leftgonValue = leftgonValue.MUL814(_gonsPerFragment);
        _gonBalances[msg.sender] = _gonBalances[msg.sender].SUB232(gonValue);
        _gonBalances[to] = _gonBalances[to].ADD307(leftgonValue);
        
        _totalSupply = _totalSupply.SUB232(decayvalue);
        
        emit TRANSFER196(msg.sender, to, value);
        return true;
    }

    function ALLOWANCE875(address owner_, address spender) public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return _allowedFragments[owner_][spender];
    }

    function TRANSFERFROM91(address from, address to, uint256 value) public VALIDRECIPIENT982(to) returns (bool)	//inject NONSTANDARD NAMING
    {
        _allowedFragments[from][msg.sender] = _allowedFragments[from][msg.sender].SUB232(value);
        
        uint256 decayvalue = value.MUL814(25); //2.5%->25/1000
        decayvalue = decayvalue.SUB232(decayvalue.MOD193(1000));
        decayvalue = decayvalue.DIV197(1000);
        
        uint256 gonValue = value.MUL814(_gonsPerFragment);
        uint256 leftgonValue = value.SUB232(decayvalue);
        leftgonValue = leftgonValue.MUL814(_gonsPerFragment);
        
        _totalSupply = _totalSupply.SUB232(decayvalue);
        
        _gonBalances[from] = _gonBalances[from].SUB232(gonValue);
        _gonBalances[to] = _gonBalances[to].ADD307(leftgonValue);
        emit TRANSFER196(from, to, value);

        return true;
    }

    function APPROVE30(address spender, uint256 value) public returns (bool)	//inject NONSTANDARD NAMING
    {
        _allowedFragments[msg.sender][spender] = value;
        emit APPROVAL128(msg.sender, spender, value);
        return true;
    }

    function INCREASEALLOWANCE804(address spender, uint256 addedValue) public returns (bool)	//inject NONSTANDARD NAMING
    {
        _allowedFragments[msg.sender][spender] =
            _allowedFragments[msg.sender][spender].ADD307(addedValue);
        emit APPROVAL128(msg.sender, spender, _allowedFragments[msg.sender][spender]);
        return true;
    }

    function DECREASEALLOWANCE632(address spender, uint256 subtractedValue) public returns (bool)	//inject NONSTANDARD NAMING
    {
        uint256 oldValue = _allowedFragments[msg.sender][spender];
        if (subtractedValue >= oldValue) {
            _allowedFragments[msg.sender][spender] = 0;
        } else {
            _allowedFragments[msg.sender][spender] = oldValue.SUB232(subtractedValue);
        }
        emit APPROVAL128(msg.sender, spender, _allowedFragments[msg.sender][spender]);
        return true;
    }
    
    function CHANGETOKENSPERBLOCK62(uint256 _newtokensPerBlock) external returns (bool) {	//inject NONSTANDARD NAMING
        tokensPerBlock = _newtokensPerBlock*10**decimals605;
        return true;
    }
    
}