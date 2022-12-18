pragma solidity 0.5.2;

library SafeMath {

                                                                     
    function MUL172(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

                                                                                   
    function DIV830(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

                                                                                                                  
    function SUB696(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

                                                               
    function ADD657(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Ownable {

    address public owner;
    bool public stopped = false;

    event OWNERSHIPTRANSFERRED188(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor() public{
        owner = msg.sender;
    }

                                                                                 
    modifier ONLYOWNER192() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP544(address newOwner) public ONLYOWNER192 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED188(owner, newOwner);
        owner = newOwner;
    }

                                       
    function STOP431() ONLYOWNER192 public{	//inject NONSTANDARD NAMING
        stopped = true;
    }

                                        
    function START557() ONLYOWNER192 public{	//inject NONSTANDARD NAMING
        stopped = false;
    }

                                           
    modifier ISRUNNING974 {	//inject NONSTANDARD NAMING
        assert (!stopped);
        _;
    }
}

contract ERC20Basic {
    function TOTALSUPPLY154() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF557(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER771(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER653(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

contract BasicToken is ERC20Basic {

    using SafeMath for uint256;
    mapping(address => uint256) balances;
    uint256 totalSupply_;

                                                             
    function TOTALSUPPLY154() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

                                                                                                                                                               
    function TRANSFER771(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].SUB696(_value);
        balances[_to] = balances[_to].ADD657(_value);
        emit TRANSFER653(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                               
    function BALANCEOF557(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

                                                                                                                                                                                                                                                                                                                                    
  function _MINT742(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
    require(account != address(0));
    totalSupply_ = totalSupply_.ADD657(value);
    balances[account] = balances[account].ADD657(value);
    emit TRANSFER653(address(0), account, value);
  }

}

contract BurnableToken is BasicToken, Ownable {

    event BURN317(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                     
    function BURN507(uint256 _value) public ONLYOWNER192{	//inject NONSTANDARD NAMING
        require(_value <= balances[msg.sender]);
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure

        address burner = msg.sender;
        balances[burner] = balances[burner].SUB696(_value);
        totalSupply_ = totalSupply_.SUB696(_value);
        emit BURN317(burner, _value);
    }
}

contract ERC20 is ERC20Basic {
    function ALLOWANCE397(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM762(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE763(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL626(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeERC20 {

    function SAFETRANSFER541(ERC20Basic token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        assert(token.TRANSFER771(to, value));
    }
    function SAFETRANSFERFROM261(ERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        assert(token.TRANSFERFROM762(from, to, value));
    }
    function SAFEAPPROVE705(ERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        assert(token.APPROVE763(spender, value));
    }
}

contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) internal allowed;

                                                                                                                                                                                                                                                                                          
    function TRANSFERFROM762(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].SUB696(_value);
        balances[_to] = balances[_to].ADD657(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB696(_value);
        emit TRANSFER653(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function APPROVE763(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL626(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                      
    function ALLOWANCE397(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function INCREASEAPPROVAL512(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD657(_addedValue);
        emit APPROVAL626(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function DECREASEAPPROVAL984(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB696(_subtractedValue);
        }
        emit APPROVAL626(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}

                                                            
contract ERC20Mintable is BasicToken, Ownable {
                                                                                                                                                                                                                                                
    function MINT2( address to, uint256 value ) public ONLYOWNER192 returns (bool){	//inject NONSTANDARD NAMING
      _MINT742(to, value);
      return true;
    }
  }

contract CryptoxygenToken is StandardToken, BurnableToken, ERC20Mintable {

    using SafeMath for uint;

    string constant public symbol314 = "OXY2";	//inject NONSTANDARD NAMING
    string constant public name596 = "Cryptoxygen";	//inject NONSTANDARD NAMING

    uint8 constant public decimals380 = 5;	//inject NONSTANDARD NAMING
    uint256 public constant decimalfactor795 = 10 ** uint256(decimals380);	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply500 = 250000000 * decimalfactor795;	//inject NONSTANDARD NAMING

    uint constant itsstarttime753 = 1547553600;  // Tuesday, 15 January 2019 12:00:00	//inject NONSTANDARD NAMING
    uint constant itsendtime717 = 1553256000;    // Friday, 22 March 2019 12:00:00	//inject NONSTANDARD NAMING
    uint constant unlocktimef1869 = 1558440000; // Tuesday, 21 May 2019 12:00:00	//inject NONSTANDARD NAMING
    uint constant unlocktimef2539 = 1561118400;  // Friday, 21 June 2019 12:00:00	//inject NONSTANDARD NAMING

    uint256 constant publictokens7  = 150000000 * decimalfactor795;	//inject NONSTANDARD NAMING
    uint256 constant devtokens996 = 45000000 * decimalfactor795;	//inject NONSTANDARD NAMING
    uint256 constant investortokens915= 15000000 * decimalfactor795;	//inject NONSTANDARD NAMING
    uint256 constant foundertokens1166 = 20000000 * decimalfactor795;	//inject NONSTANDARD NAMING
    uint256 constant foundertokens2825 = 10000000 * decimalfactor795;	//inject NONSTANDARD NAMING
    uint256 constant foundertokens3996 = 10000000 * decimalfactor795;	//inject NONSTANDARD NAMING

    address constant adrdev76 = 0xF14Eb018a5cAa6b22B67FFFfA61c9B78aB3957d2;	//inject NONSTANDARD NAMING
    address constant adrinvestor203 = 0x2A7B09b90f8bDD22a9d66c83aDa49961827C1Dbe;	//inject NONSTANDARD NAMING
    address constant adrfounder1175 = 0x68293d5F4826E200A33055d183E73F4227ecEd99;	//inject NONSTANDARD NAMING
    address constant adrfounder2990 = 0xaE4dA48373f8CD3d54Dd3a8AAAa9aEc568ef29C6;	//inject NONSTANDARD NAMING
    address constant adrfounder3470 = 0x77264564D740245E377E263675bdDA2D23baaC97;	//inject NONSTANDARD NAMING

    constructor(address ownerAdrs) public {
        totalSupply_ = initial_supply500;
        //InitialDistribution
        PRESALE496(ownerAdrs,publictokens7);
        
        PRESALE496(adrdev76,devtokens996);
        PRESALE496(adrinvestor203,investortokens915);
        PRESALE496(adrfounder1175,foundertokens1166);
        PRESALE496(adrfounder2990,foundertokens2825);
        PRESALE496(adrfounder3470,foundertokens3996);
    }

    function PRESALE496(address _address, uint _amount) internal returns (bool) {	//inject NONSTANDARD NAMING
        balances[_address] = _amount;
        emit TRANSFER653(address(0x0), _address, _amount);
    }

    function CHECKPERMISSIONS53(address _address) internal view returns (bool) {	//inject NONSTANDARD NAMING

        if( ( block.timestamp < unlocktimef1869 ) && ( _address == adrfounder1175 || _address == adrfounder2990 || _address == adrfounder3470 ) ){
            return false;
        }else if( ( block.timestamp < unlocktimef2539 ) && ( _address == adrdev76 || _address == adrinvestor203 ) ){
            return false;
        }else if ( _address == owner ){
            return true;
        }else if( block.timestamp < itsendtime717 ){
            return false;
        }else{
            return true;
        }
    }

    function TRANSFER771(address _to, uint256 _value) ISRUNNING974 public returns (bool) {	//inject NONSTANDARD NAMING
        require(CHECKPERMISSIONS53(msg.sender));
        super.TRANSFER771(_to, _value);
        return true;
    }

    function TRANSFERFROM762(address _from, address _to, uint256 _value) ISRUNNING974 public returns (bool) {	//inject NONSTANDARD NAMING
        require(CHECKPERMISSIONS53(_from));
        super.TRANSFERFROM762(_from, _to, _value);
        return true;
    }
    
}