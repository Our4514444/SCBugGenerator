pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL227(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV674(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB465(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD901(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD591(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                                                                                                                                  
contract Ownable {
    address public owner;

    event OWNERSHIPTRANSFERRED813(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                                
    constructor() public {
        owner = msg.sender;
    }

                                                                                 
    modifier ONLYOWNER619() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP942(address newOwner) ONLYOWNER619 public {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED813(owner, newOwner);
        owner = newOwner;
    }
}

                                                                                                                                                                                                                                                    
contract ERC223 {
    using SafeMath for uint256;

    // ERC223 and ERC20 functions and events
    function BALANCEOF570(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY9() public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER608(address to, uint value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER608(address to, uint value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER105(address indexed from, address indexed to, uint value, bytes indexed data);	//inject NONSTANDARD NAMING

    // ERC223 functions
    function NAME103() public view returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL724() public view returns (string memory);	//inject NONSTANDARD NAMING
    function DECIMALS550() public view returns (uint8);	//inject NONSTANDARD NAMING

    // ERC20 functions and events
    function TRANSFERFROM82(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE49(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE322(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    event TRANSFER105(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL570(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

                                                                                      
contract ContractReceiver {
                                                                                                                                                                                                                             
    function TOKENFALLBACK725(address _from, uint _value, bytes memory _data) public;	//inject NONSTANDARD NAMING
}

                                                                                                                                                   
contract ZENI is ERC223, Ownable {
    using SafeMath for uint256;

    string private _name = "ZENI";
    string private _symbol = "ZENI";
    uint8 private _decimals = 8;
    uint256 private _initialSupply = 60e9 * 1e8;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;
    uint private _totalSupply;

    bool public mintingFinished = false;
    mapping (address => bool) public frozenAccount;
    mapping (address => uint256) public unlockUnixTime;

    event FROZENFUNDS974(address indexed target, bool frozen);	//inject NONSTANDARD NAMING
    event LOCKEDFUNDS469(address indexed target, uint256 locked);	//inject NONSTANDARD NAMING
    event BURN845(address indexed from, uint256 amount);	//inject NONSTANDARD NAMING
    event MINT962(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event MINTFINISHED180();	//inject NONSTANDARD NAMING

                                                                                       
    constructor() public {
        _totalSupply = _initialSupply;
        _balances[msg.sender] = _totalSupply;
    }


    function NAME103() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL724() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS550() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }

    function TOTALSUPPLY9() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF570(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[_owner];
    }

                                                                                                                                                                           
    function FREEZEACCOUNTS690(address[] memory targets, bool isFrozen) public ONLYOWNER619 {	//inject NONSTANDARD NAMING
        require(targets.length > 0);

        for (uint j = 0; j < targets.length; j++) {
            require(targets[j] != address(0));
            frozenAccount[targets[j]] = isFrozen;
            emit FROZENFUNDS974(targets[j], isFrozen);
        }
    }

                                                                                                                                                                                                                         
    function LOCKUPACCOUNTS977(address[] memory targets, uint[] memory unixTimes) public ONLYOWNER619 {	//inject NONSTANDARD NAMING
        require(
            targets.length > 0 &&
            targets.length == unixTimes.length
        );

        for(uint i = 0; i < targets.length; i++){
            require(unlockUnixTime[targets[i]] < unixTimes[i]);
            unlockUnixTime[targets[i]] = unixTimes[i];
            emit LOCKEDFUNDS469(targets[i], unixTimes[i]);
        }
    }

    // Function that is called when a user or another contract wants to transfer funds .
    function TRANSFER608(address _to, uint _value, bytes memory _data) public returns (bool) {	//inject NONSTANDARD NAMING
        require(
            _value > 0 &&
            frozenAccount[msg.sender] == false &&
            frozenAccount[_to] == false &&
            now > unlockUnixTime[msg.sender] &&
            now > unlockUnixTime[_to]
        );

        if(ISCONTRACT205(_to)) {
            return TRANSFERTOCONTRACT457(_to, _value, _data);
        }
        else {
            return TRANSFERTOADDRESS884(_to, _value, _data);
        }
    }

                                                                                                                                                       
    function TRANSFER608(address _to, uint _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(
            _value > 0 &&
            frozenAccount[msg.sender] == false &&
            frozenAccount[_to] == false &&
            now > unlockUnixTime[msg.sender] &&
            now > unlockUnixTime[_to]
        );

        bytes memory empty;
        if (ISCONTRACT205(_to)) {
            return TRANSFERTOCONTRACT457(_to, _value, empty);
        } else {
            return TRANSFERTOADDRESS884(_to, _value, empty);
        }
    }

    // assemble the given address bytecode. If bytecode exists then the _addr is a contract.
    function ISCONTRACT205(address _addr) private view returns (bool) {	//inject NONSTANDARD NAMING
        uint length;
        assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_addr)
        }
        return (length > 0);
    }

    // function that is called when transaction target is an address
    function TRANSFERTOADDRESS884(address _to, uint _value, bytes memory _data) private returns (bool) {	//inject NONSTANDARD NAMING
        require(BALANCEOF570(msg.sender) >= _value);
        _balances[msg.sender] = _balances[msg.sender].SUB465(_value);
        _balances[_to] = _balances[_to].ADD901(_value);
        emit TRANSFER105(msg.sender, _to, _value, _data);
        emit TRANSFER105(msg.sender, _to, _value);
        return true;
    }

    // function that is called when transaction target is a contract
    function TRANSFERTOCONTRACT457(address _to, uint _value, bytes memory _data) private returns (bool) {	//inject NONSTANDARD NAMING
        require(BALANCEOF570(msg.sender) >= _value);
        ContractReceiver receiver = ContractReceiver(_to);
        receiver.TOKENFALLBACK725(msg.sender, _value, _data);
        emit TRANSFER105(msg.sender, _to, _value, _data);
        emit TRANSFER105(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                      
    function TRANSFERFROM82(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(
            _to != address(0) &&
            _value > 0 &&
            _balances[_from] >= _value &&
            _allowed[_from][msg.sender] >= _value &&
            frozenAccount[_from] == false &&
            frozenAccount[_to] == false &&
            now > unlockUnixTime[_from] &&
            now > unlockUnixTime[_to]
        );

        _balances[_from] = _balances[_from].SUB465(_value);
        _balances[_to] = _balances[_to].ADD901(_value);
        _allowed[_from][msg.sender] = _allowed[_from][msg.sender].SUB465(_value);
        emit TRANSFER105(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                    
    function APPROVE49(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[msg.sender][_spender] = _value;
        emit APPROVAL570(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                     
    function ALLOWANCE322(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[_owner][_spender];
    }

                                                                                                                                                                                     
    function BURN513(address _from, uint256 _unitAmount) public ONLYOWNER619 {	//inject NONSTANDARD NAMING
        require(
            _unitAmount > 0 &&
            BALANCEOF570(_from) >= _unitAmount
        );

        _balances[_from] = _balances[_from].SUB465(_unitAmount);
        _totalSupply = _totalSupply.SUB465(_unitAmount);
        emit BURN845(_from, _unitAmount);
    }


    modifier CANMINT126() {	//inject NONSTANDARD NAMING
        require(!mintingFinished);
        _;
    }

                                                                                                                                                                              
    function MINT204(address _to, uint256 _unitAmount) public ONLYOWNER619 CANMINT126 returns (bool) {	//inject NONSTANDARD NAMING
        require(_unitAmount > 0);

        _totalSupply = _totalSupply.ADD901(_unitAmount);
        _balances[_to] = _balances[_to].ADD901(_unitAmount);
        emit MINT962(_to, _unitAmount);
        emit TRANSFER105(address(0), _to, _unitAmount);
        return true;
    }

                                                                
    function FINISHMINTING658() public ONLYOWNER619 CANMINT126 returns (bool) {	//inject NONSTANDARD NAMING
        mintingFinished = true;
        emit MINTFINISHED180();
        return true;
    }

                                                                                                         
    function DISTRIBUTEAIRDROP777(address[] memory addresses, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        require(
            amount > 0 &&
            addresses.length > 0 &&
            frozenAccount[msg.sender] == false &&
            now > unlockUnixTime[msg.sender]
        );

        uint256 mulAmount = amount.MUL227(1e8);
        uint256 totalAmount = mulAmount.MUL227(addresses.length);
        require(_balances[msg.sender] >= totalAmount);

        for (uint i = 0; i < addresses.length; i++) {
            require(
                addresses[i] != address(0) &&
                frozenAccount[addresses[i]] == false &&
                now > unlockUnixTime[addresses[i]]
            );

            _balances[addresses[i]] = _balances[addresses[i]].ADD901(mulAmount);
            emit TRANSFER105(msg.sender, addresses[i], mulAmount);
        }
        _balances[msg.sender] = _balances[msg.sender].SUB465(totalAmount);
        return true;
    }

    function DISTRIBUTEAIRDROP777(address[] memory addresses, uint[] memory amounts) public returns (bool) {	//inject NONSTANDARD NAMING
        require(
            addresses.length > 0 &&
            addresses.length == amounts.length &&
            frozenAccount[msg.sender] == false &&
            now > unlockUnixTime[msg.sender]
        );

        uint256 totalAmount = 0;

        for(uint i = 0; i < addresses.length; i++){
            require(
                amounts[i] > 0 &&
                addresses[i] != address(0) &&
                frozenAccount[addresses[i]] == false &&
                now > unlockUnixTime[addresses[i]]
            );

            amounts[i] = amounts[i].MUL227(1e8);
            totalAmount = totalAmount.ADD901(amounts[i]);
        }
        require(_balances[msg.sender] >= totalAmount);

        for (uint j = 0; j < addresses.length; j++) {
            _balances[addresses[j]] = _balances[addresses[j]].ADD901(amounts[j]);
            emit TRANSFER105(msg.sender, addresses[j], amounts[j]);
        }
        _balances[msg.sender] = _balances[msg.sender].SUB465(totalAmount);
        return true;
    }

                                                                                 
    function COLLECTTOKENS934(address[] memory addresses, uint[] memory amounts) public ONLYOWNER619 returns (bool) {	//inject NONSTANDARD NAMING
        require(
            addresses.length > 0 &&
            addresses.length == amounts.length
        );

        uint256 totalAmount = 0;

        for (uint i = 0; i < addresses.length; i++) {
            require(
                amounts[i] > 0 &&
                addresses[i] != address(0) &&
                frozenAccount[addresses[i]] == false &&
                now > unlockUnixTime[addresses[i]]
            );

            amounts[i] = amounts[i].MUL227(1e8);
            require(_balances[addresses[i]] >= amounts[i]);
            _balances[addresses[i]] = _balances[addresses[i]].SUB465(amounts[i]);
            totalAmount = totalAmount.ADD901(amounts[i]);
            emit TRANSFER105(addresses[i], msg.sender, amounts[i]);
        }
        _balances[msg.sender] = _balances[msg.sender].ADD901(totalAmount);
        return true;
    }

                                             
    function() external {
        revert();
    }

                                                                                                                                                                                                                                                                 
    function TOKENFALLBACK725(address from_, uint256 value_, bytes memory data_) public pure {	//inject NONSTANDARD NAMING
        from_;
        value_;
        data_;
        revert();
    }
}