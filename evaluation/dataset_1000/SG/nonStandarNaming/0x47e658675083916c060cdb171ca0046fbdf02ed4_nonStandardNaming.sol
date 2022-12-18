pragma solidity ^0.5.8;

library SafeMath {
    
                                                                                
    function MUL444(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV378(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB233(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD611(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD76(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

interface IERC20 {
    function TRANSFER322(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE734(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM819(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY789() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF644(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE244(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER134(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL154(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                             
    function TOTALSUPPLY789() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF644(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }
    
    function _BALANCEOF584(address owner) view internal returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE244(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER322(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER515(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE734(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL154(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM819(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB233(value);
        _TRANSFER515(from, to, value);
        emit APPROVAL154(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE20(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD611(addedValue);
        emit APPROVAL154(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE610(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB233(subtractedValue);
        emit APPROVAL154(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER515(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        // require(to != address(0));

        _balances[from] = _balances[from].SUB233(value);
        _balances[to] = _balances[to].ADD611(value);
        emit TRANSFER134(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT973(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD611(value);
        _balances[account] = _balances[account].ADD611(value);
        emit TRANSFER134(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN461(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB233(value);
        _balances[account] = _balances[account].SUB233(value);
        emit TRANSFER134(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM553(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB233(value);
        _BURN461(account, value);
        emit APPROVAL154(account, msg.sender, _allowed[account][msg.sender]);
    }
}

contract ContractReceiver {
    function TOKENFALLBACK83(address _from, uint _value, bytes memory _data) public returns (bool);	//inject NONSTANDARD NAMING
}

contract ForeignToken {
    function BALANCEOF644(address _owner) public returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER322(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
}

contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME305() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL881() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS203() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

contract WiseNetwork is ERC20, ERC20Detailed {
    uint256 public burned; 
	address payable public owner;

    string private constant name30 = "Wise Network";	//inject NONSTANDARD NAMING
    string private constant symbol25 = "WISE";	//inject NONSTANDARD NAMING
    uint8 private constant decimals294 = 18;	//inject NONSTANDARD NAMING
    uint256 private constant initial_supply76 = 1 * 10**8 * 10**18; // init 100 million	//inject NONSTANDARD NAMING
    
    event DONATE670(address indexed account, uint256 amount);	//inject NONSTANDARD NAMING
    event APPROVEANDCALL752(address _sender,uint256 _value,bytes _extraData);	//inject NONSTANDARD NAMING
    event TRANSFER2CONTRACT113(address indexed from, address indexed to, uint256 value, bytes indexed data);	//inject NONSTANDARD NAMING
    
    modifier ONLYOWNER836() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    constructor () public ERC20Detailed(name30, symbol25, decimals294) {
        _MINT973(msg.sender, initial_supply76);
        
        owner = msg.sender;
    }

    function BURN799(uint256 _value) public returns(bool) {	//inject NONSTANDARD NAMING
        burned = burned.ADD611(_value);
        _BURN461(msg.sender, _value);
        return true;
    }
    
    function TRANSFEROWNERSHIP867(address payable _account) ONLYOWNER836 public returns(bool){	//inject NONSTANDARD NAMING
        require(_account != address(0));

        owner = _account;
        return true;
    }
    
    function GETTOKENBALANCE490(address tokenAddress, address who) public returns (uint){	//inject NONSTANDARD NAMING
        ForeignToken t = ForeignToken(tokenAddress);
        uint bal = t.BALANCEOF644(who);
        return bal;
    }
    
    function WITHDRAW115(uint256 _amount) ONLYOWNER836 public {	//inject NONSTANDARD NAMING
        require(_amount <= address(this).balance);
        
        uint256 etherBalance = _amount;
        owner.transfer(etherBalance);
    }
    
    function WITHDRAWFOREIGNTOKENS694(address _tokenContract, uint256 _amount) ONLYOWNER836 public returns (bool) {	//inject NONSTANDARD NAMING
        ForeignToken token = ForeignToken(_tokenContract);
        uint256 amount = token.BALANCEOF644(address(this));
        
        require(_amount <= amount);
        
        (bool success,) = _tokenContract.call(abi.encodeWithSignature("transfer(address,uint256)", owner, _amount));
        require(success == true);
        
        return true;
    }
    
	function() external payable{
        emit DONATE670(msg.sender, msg.value);
    }
    
    function ISCONTRACT510(address _addr) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint length;
        assembly {
            length := extcodesize(_addr)
        }
        return (length>0);
    }
    
    // mitigates the ERC20 short address attack
    modifier ONLYPAYLOADSIZE362(uint size) {	//inject NONSTANDARD NAMING
        assert(msg.data.length >= size + 4);
        _;
    }
    
    
    function TRANSFER322(address _to, uint256 _amount) ONLYPAYLOADSIZE362(2 * 32) public returns (bool success) {	//inject NONSTANDARD NAMING
        
        bytes memory empty;
        
        if(ISCONTRACT510(_to)) {
            return TRANSFERTOCONTRACT228(_to, _amount, empty);
        }else {
            _TRANSFER515(msg.sender, _to, _amount);
            return true;
        }
    }
    
    //erc223-tansfer
    function TRANSFER322(address _to, uint256 _amount, bytes memory _data, string memory _custom_fallback) ONLYPAYLOADSIZE362(2 * 32) public returns (bool success) {	//inject NONSTANDARD NAMING
        
        require(msg.sender != _to);
        
        if(ISCONTRACT510(_to)) {

            _TRANSFER515(msg.sender, _to, _amount);

            ContractReceiver receiver = ContractReceiver(_to);

            (bool success1,) = address(receiver).call(abi.encodeWithSignature(_custom_fallback, msg.sender, _amount, _data));
            require(success1 == true);
            
            emit TRANSFER2CONTRACT113(msg.sender, _to, _amount, _data);
            return true;
        }
        else {
            _TRANSFER515(msg.sender, _to, _amount);
            return true;
        }
    }

    //erc223-transfer
    function TRANSFER322(address _to, uint256 _amount, bytes memory _data) ONLYPAYLOADSIZE362(2 * 32) public returns (bool success) {	//inject NONSTANDARD NAMING

        require(msg.sender != _to);

        if(ISCONTRACT510(_to)) {
            return TRANSFERTOCONTRACT228(_to, _amount, _data);
        }
        else {
            _TRANSFER515(msg.sender, _to, _amount);
            return true;
        }
    }
    
    
    function APPROVEANDCALL949(address _spender, uint256 _value, bytes memory _extraData) payable public returns (bool) {	//inject NONSTANDARD NAMING
        
        APPROVE734(_spender, _value);
        
        (bool success1,) = msg.sender.call(abi.encodeWithSignature("receiveApproval(address,uint256,address,bytes)", msg.sender, _value, this, _extraData));
        require(success1 == true);
        
        emit APPROVEANDCALL752(_spender, _value, _extraData);
        
        return true;
    }
    
    function TRANSFERTOCONTRACT228(address _to, uint _value, bytes memory _data) private returns (bool) {	//inject NONSTANDARD NAMING
        
        _TRANSFER515(msg.sender, _to, _value);
        
        ContractReceiver receiver = ContractReceiver(_to);
        receiver.TOKENFALLBACK83(msg.sender, _value, _data);
        
        emit TRANSFER2CONTRACT113(msg.sender, _to, _value, _data);
        return true;
    }
    
}