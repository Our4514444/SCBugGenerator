pragma solidity 0.5.7;

                                                                                                                               
contract ERC20Basic {
    function TOTALSUPPLY350() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF572(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER149(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER600(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}
                                                                                         
library SafeMath {
                                                                       
    function MUL795(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
                                                                                     
    function DIV651(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }
                                                                                                                   
    function SUB856(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }
                                                                 
    function ADD345(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Ownable {
    address public owner;

    event OWNERSHIPTRANSFERRED370(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                               
    constructor() public {
        owner = msg.sender;
    }

                                                                                 
    modifier ONLYOWNER661() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                       
    function TRANSFEROWNERSHIP411(address _newOwner) public ONLYOWNER661 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP620(_newOwner);
    }

                                                                            
    function _TRANSFEROWNERSHIP620(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0));
        emit OWNERSHIPTRANSFERRED370(owner, _newOwner);
        owner = _newOwner;
    }
}
                             
contract BasicToken is ERC20Basic, Ownable {
    using SafeMath for uint256;
    mapping(address => uint256) balances;
    uint256 totalSupply_;

                                                               
    function TOTALSUPPLY350() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

               
    function TRANSFER149(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        if (_to == address(0)) {
            totalSupply_ = totalSupply_.SUB856(_value);
        }

        require(_value <= balances[msg.sender]);
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].SUB856(_value);
        balances[_to] = balances[_to].ADD345(_value);
        emit TRANSFER600(msg.sender, _to, _value);
        return true;
    }
               
    function BALANCEOF572(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }
}
                                 
contract ERC20 is ERC20Basic {
    function ALLOWANCE415(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM108(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE488(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL890(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}
                                         
contract StandardToken is ERC20, BasicToken {
    uint public constant max_uint550 = 2**256 - 1;	//inject NONSTANDARD NAMING

    mapping (address => mapping (address => uint256)) internal allowed;

               
    function TRANSFERFROM108(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        if (_to == address(0)) {
            totalSupply_ = totalSupply_.SUB856(_value);
        }

        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        balances[_from] = balances[_from].SUB856(_value);
        balances[_to] = balances[_to].ADD345(_value);

                                                                       
                                                                
        if (allowed[_from][msg.sender] < max_uint550) {
            allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB856(_value);
        }
        emit TRANSFER600(_from, _to, _value);
        return true;
    }
                                                                                                                       
    function APPROVE488(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL890(msg.sender, _spender, _value);
        return true;
    }
               
    function ALLOWANCE415(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }
                                                                                             
    function INCREASEAPPROVAL834(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD345(_addedValue);
        emit APPROVAL890(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
                                                                                             
    function DECREASEAPPROVAL378(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB856(_subtractedValue);
        }
        emit APPROVAL890(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}

contract SatowalletShares is StandardToken {
    using SafeMath for uint256;

    string     public name = "Satowallet Shares";
    string     public symbol = "SATOS";
    uint8      public decimals = 8;
    uint256    private constant initialsupply786 = 10000000;	//inject NONSTANDARD NAMING

    constructor() public {
        totalSupply_ = initialsupply786 * 10 ** uint256(decimals);
        balances[0x1800D1901880cd5615C8c91A1DdEc4853b852adE] = totalSupply_;
        emit TRANSFER600(address(0), 0x1800D1901880cd5615C8c91A1DdEc4853b852adE, totalSupply_);
    }

    function () payable external {
        revert();
    }

}