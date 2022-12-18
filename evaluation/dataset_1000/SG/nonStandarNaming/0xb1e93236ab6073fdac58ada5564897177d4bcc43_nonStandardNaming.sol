                                                                 

pragma solidity ^0.5.1;

library IterableMapping {
    struct itmap {
        mapping(address => IndexValue) data;
        KeyFlag[] keys;
        uint256 size;
    }
    struct IndexValue {
        uint256 keyIndex;
        uint256 value;
    }
    struct KeyFlag {
        address key;
        bool deleted;
    }
    function INSERT188(itmap storage self, address key, uint256 value)	//inject NONSTANDARD NAMING
        public
        returns (bool replaced)
    {
        uint256 keyIndex = self.data[key].keyIndex;
        self.data[key].value = value;
        if (keyIndex > 0) return true;
        else {
            keyIndex = self.keys.length++;
            self.data[key].keyIndex = keyIndex + 1;
            self.keys[keyIndex].key = key;
            self.size++;
            return false;
        }
    }
    function ITERATE_START733(itmap storage self)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 keyIndex)
    {
        return ITERATE_NEXT666(self, uint256(-1));
    }
    function ITERATE_VALID376(itmap storage self, uint256 keyIndex)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool)
    {
        return keyIndex < self.keys.length;
    }
    function ITERATE_NEXT666(itmap storage self, uint256 keyIndex)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256)
    {
        uint256 _tmpKeyIndex = keyIndex;
        _tmpKeyIndex++;
        while (
            _tmpKeyIndex < self.keys.length && self.keys[_tmpKeyIndex].deleted
        ) _tmpKeyIndex++;
        return _tmpKeyIndex;
    }
    function ITERATE_GET312(itmap storage self, uint256 keyIndex)	//inject NONSTANDARD NAMING
        public
        view
        returns (address key, uint256 value)
    {
        key = self.keys[keyIndex].key;
        value = self.data[key].value;
    }
    function ITERATE_GETVALUE302(itmap storage self, address key)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 value)
    {
        return self.data[key].value;
    }
}

// File: zeppelin-solidity/contracts/ownership/Ownable.sol

                                                                                                                                                                                             
contract Ownable {
    address public owner;

    event OWNERSHIPTRANSFERRED548(	//inject NONSTANDARD NAMING
        address indexed previousOwner,
        address indexed newOwner
    );

                                                                                                                     
    constructor() public {
        owner = msg.sender;
    }

                                                                             
    modifier ONLYOWNER505() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == owner,
            "called by any account other than the owner"
        );
        _;
    }

                                                                                                                                                              
    function TRANSFEROWNERSHIP359(address newOwner) public ONLYOWNER505 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "owner address should not 0");
        emit OWNERSHIPTRANSFERRED548(owner, newOwner);
        owner = newOwner;
    }

}

// File: zeppelin-solidity/contracts/lifecycle/Pausable.sol

                                                                                                                
contract Pausable is Ownable {
    event PAUSE817();	//inject NONSTANDARD NAMING
    event UNPAUSE199();	//inject NONSTANDARD NAMING

    bool public paused = false;

                                                                                                  
    modifier WHENNOTPAUSED196() {	//inject NONSTANDARD NAMING
        require(!paused, "callable when the contract is not paused");
        _;
    }

                                                                                              
    modifier WHENPAUSED684() {	//inject NONSTANDARD NAMING
        require(paused, "callable when the contract is paused");
        _;
    }

                                                                            
    function PAUSE986() public ONLYOWNER505 WHENNOTPAUSED196 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE817();
    }

                                                                               
    function UNPAUSE875() public ONLYOWNER505 WHENPAUSED684 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE199();
    }
}

                                                                                         
library SafeMath {
                                                                 
    function MUL208(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (_a == 0) {
            return 0;
        }

        c = _a * _b;
        assert(c / _a == _b);
        return c;
    }

                                                                               
    function DIV289(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(_b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = _a / _b;
        assert(_a == _b * c + (_a % _b)); // There is no case in which this doesn't hold
        return _a / _b;
    }

                                                                                                             
    function SUB426(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(_b <= _a);
        return _a - _b;
    }

                                                           
    function ADD578(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = _a + _b;
        assert(c >= _a);
        return c;
    }
}

                                                                                                                          
contract ERC20Basic {
    function TOTALSUPPLY282() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF73(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER527(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER745(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                         
contract BasicToken is ERC20Basic {
    using SafeMath for uint256;
    IterableMapping.itmap balances;

    uint256 internal totalSupply_;

                                                         
    function TOTALSUPPLY282() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

                                                                                                                                                       
    function TRANSFER527(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(
            _value <= IterableMapping.ITERATE_GETVALUE302(balances, msg.sender),
            "not enough balances"
        );
        require(_to != address(0), "0 address not allow");

        IterableMapping.INSERT188(
            balances,
            msg.sender,
            IterableMapping.ITERATE_GETVALUE302(balances, msg.sender).SUB426(_value)
        );
        IterableMapping.INSERT188(
            balances,
            _to,
            IterableMapping.ITERATE_GETVALUE302(balances, _to).ADD578(_value)
        );
        emit TRANSFER745(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                       
    function BALANCEOF73(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return IterableMapping.ITERATE_GETVALUE302(balances, _owner);
    }

}

                                                                                        
contract ERC20 is ERC20Basic {
    function ALLOWANCE71(address _owner, address _spender)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256);

    function TRANSFERFROM864(address _from, address _to, uint256 _value)	//inject NONSTANDARD NAMING
        public
        returns (bool);

    function APPROVE112(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL425(	//inject NONSTANDARD NAMING
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

                                                                                                                                                                                                                                                                
contract StandardToken is ERC20, BasicToken {
    mapping(address => mapping(address => uint256)) internal allowed;

                                                                                                                                                                                                                                                                                
    function TRANSFERFROM864(address _from, address _to, uint256 _value)	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        require(
            _value <= IterableMapping.ITERATE_GETVALUE302(balances, _from),
            "balance not enough"
        );
        require(_value <= allowed[_from][msg.sender], "balance not enough");
        require(_to != address(0), "0 address not allow");

        IterableMapping.INSERT188(
            balances,
            _from,
            IterableMapping.ITERATE_GETVALUE302(balances, _from).SUB426(_value)
        );
        IterableMapping.INSERT188(
            balances,
            _to,
            IterableMapping.ITERATE_GETVALUE302(balances, _to).ADD578(_value)
        );
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB426(_value);
        emit TRANSFER745(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function APPROVE112(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL425(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                            
    function ALLOWANCE71(address _owner, address _spender)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256)
    {
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function INCREASEAPPROVAL595(address _spender, uint256 _addedValue)	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        allowed[msg.sender][_spender] = (
            allowed[msg.sender][_spender].ADD578(_addedValue)
        );
        emit APPROVAL425(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function DECREASEAPPROVAL755(address _spender, uint256 _subtractedValue)	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        uint256 oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue >= oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB426(_subtractedValue);
        }
        emit APPROVAL425(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

}

                                                                                            

contract PausableToken is StandardToken, Pausable {
    function TRANSFER527(address _to, uint256 _value)	//inject NONSTANDARD NAMING
        public
        WHENNOTPAUSED196
        returns (bool)
    {
        return super.TRANSFER527(_to, _value);
    }

    function TRANSFERFROM864(address _from, address _to, uint256 _value)	//inject NONSTANDARD NAMING
        public
        WHENNOTPAUSED196
        returns (bool)
    {
        return super.TRANSFERFROM864(_from, _to, _value);
    }

    function APPROVE112(address _spender, uint256 _value)	//inject NONSTANDARD NAMING
        public
        WHENNOTPAUSED196
        returns (bool)
    {
        return super.APPROVE112(_spender, _value);
    }

    function INCREASEAPPROVAL595(address _spender, uint256 _addedValue)	//inject NONSTANDARD NAMING
        public
        WHENNOTPAUSED196
        returns (bool success)
    {
        return super.INCREASEAPPROVAL595(_spender, _addedValue);
    }

    function DECREASEAPPROVAL755(address _spender, uint256 _subtractedValue)	//inject NONSTANDARD NAMING
        public
        WHENNOTPAUSED196
        returns (bool success)
    {
        return super.DECREASEAPPROVAL755(_spender, _subtractedValue);
    }
}

contract Seele is PausableToken {
    string public name = "Seele Token";
    string public symbol = "Seele";
    uint8 public decimals = 18;
    uint256 public INITIAL_SUPPLY = 30000000000 ether;

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        IterableMapping.INSERT188(balances, msg.sender, INITIAL_SUPPLY);
    }

    function BALANCESSTART416() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return IterableMapping.ITERATE_START733(balances);
    }

    function BALANCESGETBOOL40(uint256 num) public view returns (bool) {	//inject NONSTANDARD NAMING
        return IterableMapping.ITERATE_VALID376(balances, num);
    }

    function BALANCESGETNEXT113(uint256 num) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return IterableMapping.ITERATE_NEXT666(balances, num);
    }
    function BALANCESGETVALUE959(uint256 num)	//inject NONSTANDARD NAMING
        public
        view
        returns (address, uint256)
    {
        address key;
        uint256 value;
        (key, value) = IterableMapping.ITERATE_GET312(balances, num);
        return (key, value);
    }
}