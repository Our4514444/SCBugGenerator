                                                                 

pragma solidity 0.5.17;

library SafeMath {
    function ADD704(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);
        return c;
    }
    
    function SUB938(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;
        return c;
    }
    
    function MUL882(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        
        uint256 c = a * b;
        require(c / a == b);
        return c;
    }
}

contract ReentrancyGuard { 
    bool private _notEntered; 
    
    function _INITREENTRANCYGUARD603() internal {	//inject NONSTANDARD NAMING
        _notEntered = true;
    } 
}

contract LexTokenLite is ReentrancyGuard {
    using SafeMath for uint256;
    
    address payable public owner;
    address public resolver;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public saleRate;
    uint256 public totalSupply;
    uint256 public totalSupplyCap;
    bytes32 public message;
    bool public forSale;
    bool private initialized;
    bool public transferable; 
    
    event APPROVAL433(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
    event TRANSFER988(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    
    mapping(address => mapping(address => uint256)) public allowances;
    mapping(address => uint256) private balances;
    
    modifier ONLYOWNER992 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "!owner");
        _;
    }
    
    function INIT31(	//inject NONSTANDARD NAMING
        string calldata _name, 
        string calldata _symbol, 
        uint8 _decimals, 
        address payable _owner, 
        address _resolver, 
        uint256 ownerSupply, 
        uint256 _saleRate, 
        uint256 saleSupply, 
        uint256 _totalSupplyCap, 
        bytes32 _message, 
        bool _forSale, 
        bool _transferable
    ) external {
        require(!initialized, "initialized"); 
        require(ownerSupply.ADD704(saleSupply) <= _totalSupplyCap, "capped");
        
        name = _name; 
        symbol = _symbol; 
        decimals = _decimals; 
        owner = _owner; 
        resolver = _resolver;
        saleRate = _saleRate; 
        totalSupplyCap = _totalSupplyCap; 
        message = _message; 
        forSale = _forSale; 
        initialized = true; 
        transferable = _transferable; 
        balances[owner] = balances[owner].ADD704(ownerSupply);
        balances[address(this)] = balances[address(this)].ADD704(saleSupply);
        totalSupply = ownerSupply.ADD704(saleSupply);
        
        emit TRANSFER988(address(0), owner, ownerSupply);
        emit TRANSFER988(address(0), address(this), saleSupply);
        _INITREENTRANCYGUARD603(); 
    }
    
    function() external payable { // SALE 
        require(forSale, "!forSale");
        
        (bool success, ) = owner.call.value(msg.value)("");
        require(success, "!transfer");
        uint256 amount = msg.value.MUL882(saleRate); 
        _TRANSFER15(address(this), msg.sender, amount);
    } 
    
    function APPROVE999(address spender, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        require(amount == 0 || allowances[msg.sender][spender] == 0, "!reset"); 
        
        allowances[msg.sender][spender] = amount; 
        
        emit APPROVAL433(msg.sender, spender, amount); 
        return true;
    }
    
    function BALANCEOF71(address account) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return balances[account];
    }
    
    function BALANCERESOLUTION727(address sender, address recipient, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == resolver, "!resolver"); 
        
        _TRANSFER15(sender, recipient, amount); 
        
        return true;
    }
    
    function BURN239(uint256 amount) external {	//inject NONSTANDARD NAMING
        balances[msg.sender] = balances[msg.sender].SUB938(amount); 
        totalSupply = totalSupply.SUB938(amount); 
        
        emit TRANSFER988(msg.sender, address(0), amount);
    }
    
    function _TRANSFER15(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        balances[sender] = balances[sender].SUB938(amount); 
        balances[recipient] = balances[recipient].ADD704(amount); 
        
        emit TRANSFER988(sender, recipient, amount); 
    }
    
    function TRANSFER965(address recipient, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        require(transferable, "!transferable"); 
        
        _TRANSFER15(msg.sender, recipient, amount);
        
        return true;
    }
    
    function TRANSFERBATCH569(address[] calldata recipient, uint256[] calldata amount) external returns (bool) {	//inject NONSTANDARD NAMING
        require(transferable, "!transferable");
        require(recipient.length == amount.length, "!recipient/amount");
        
        for (uint256 i = 0; i < recipient.length; i++) {
            _TRANSFER15(msg.sender, recipient[i], amount[i]);
        }
        
        return true;
    }
    
    function TRANSFERFROM944(address sender, address recipient, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        require(transferable, "!transferable");
        
        _TRANSFER15(sender, recipient, amount);
        allowances[sender][msg.sender] = allowances[sender][msg.sender].SUB938(amount); 
        
        return true;
    }
    
                                                           
    function MINT596(address recipient, uint256 amount) external ONLYOWNER992 {	//inject NONSTANDARD NAMING
        require(totalSupply.ADD704(amount) <= totalSupplyCap, "capped"); 
        
        balances[recipient] = balances[recipient].ADD704(amount); 
        totalSupply = totalSupply.ADD704(amount); 
        
        emit TRANSFER988(address(0), recipient, amount); 
    }
    
    function MINTBATCH159(address[] calldata recipient, uint256[] calldata amount) external ONLYOWNER992 {	//inject NONSTANDARD NAMING
        require(recipient.length == amount.length, "!recipient/amount");
        
        for (uint256 i = 0; i < recipient.length; i++) {
            balances[recipient[i]] = balances[recipient[i]].ADD704(amount[i]); 
            totalSupply = totalSupply.ADD704(amount[i]);
            emit TRANSFER988(address(0), recipient[i], amount[i]); 
        }
        
        require(totalSupply <= totalSupplyCap, "capped");
    }

    function UPDATEMESSAGE127(bytes32 _message) external ONLYOWNER992 {	//inject NONSTANDARD NAMING
        message = _message;
    }
    
    function UPDATEOWNER58(address payable _owner) external ONLYOWNER992 {	//inject NONSTANDARD NAMING
        owner = _owner;
    }
    
    function UPDATERESOLVER354(address _resolver) external ONLYOWNER992 {	//inject NONSTANDARD NAMING
        resolver = _resolver;
    }
    
    function UPDATESALE197(uint256 amount, bool _forSale) external ONLYOWNER992 {	//inject NONSTANDARD NAMING
        require(totalSupply.ADD704(amount) <= totalSupplyCap, "capped");
        
        forSale = _forSale;
        balances[address(this)] = balances[address(this)].ADD704(amount); 
        totalSupply = totalSupply.ADD704(amount); 
        
        emit TRANSFER988(address(0), address(this), amount);
    }
    
    function UPDATESALERATE846(uint256 _saleRate) external ONLYOWNER992 {	//inject NONSTANDARD NAMING
        saleRate = _saleRate;
    }
    
    function UPDATETRANSFERABILITY281(bool _transferable) external ONLYOWNER992 {	//inject NONSTANDARD NAMING
        transferable = _transferable;
    }
}