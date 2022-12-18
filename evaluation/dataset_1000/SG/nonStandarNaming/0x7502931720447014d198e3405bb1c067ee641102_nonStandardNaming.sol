                                                                 

pragma solidity 0.5.17;

contract Ownable {
    address public owner;

    event OWNERSHIPTRANSFERRED989(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER512() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "permission denied");
        _;
    }

    function TRANSFEROWNERSHIP242(address newOwner) public ONLYOWNER512 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "invalid address");
        emit OWNERSHIPTRANSFERRED989(owner, newOwner);
        owner = newOwner;
    }
}

contract ApproveAndCallFallBack {
    function RECEIVEAPPROVAL987(address from, uint256 value, address token, bytes calldata data) external;	//inject NONSTANDARD NAMING
}

contract DEFIGOLD is Ownable {
    // --- ERC20 Data ---
    string  public constant name512     = "defigold.network";	//inject NONSTANDARD NAMING
    string  public constant symbol546   = "DFG";	//inject NONSTANDARD NAMING
    string  public constant version624  = "1";	//inject NONSTANDARD NAMING
    uint8   public constant decimals144 = 18;	//inject NONSTANDARD NAMING
    uint256 public totalSupply;

    mapping (address => uint256)                      public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
    mapping (address => uint256)                      public nonces;

    event APPROVAL814(address indexed holder, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
    event TRANSFER776(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    // --- Math ---
    function ADD612(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x);
    }
    function SUB904(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x);
    }

    // --- EIP712 niceties ---
    bytes32 public DOMAIN_SEPARATOR;
    // bytes32 public constant PERMIT_TYPEHASH = keccak256("Permit(address holder,address spender,uint256 nonce,uint256 expiry,bool allowed)");
    bytes32 public constant permit_typehash499 = 0xea2aa0a1be11a07ed86d755c93467f4f82362b452371d1ba94d1715123511acb;	//inject NONSTANDARD NAMING

    constructor(uint256 chainId_) public {
        DOMAIN_SEPARATOR = keccak256(abi.encode(
            keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
            keccak256(bytes(name512)),
            keccak256(bytes(version624)),
            chainId_,
            address(this)
        ));
    }

    // --- Token ---
    
    function SUPPLY344(address to, uint256 amount) external ONLYOWNER512 {	//inject NONSTANDARD NAMING
        balanceOf[to] = ADD612(balanceOf[to], amount);
        totalSupply = ADD612(totalSupply, amount);
        emit TRANSFER776(address(0), to, amount);
    }
    
    function TRANSFER523(address to, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM582(msg.sender, to, amount);
    }
    
    function TRANSFERFROM582(address from, address to, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        if (from != msg.sender && allowance[from][msg.sender] != uint256(-1))
            allowance[from][msg.sender] = SUB904(allowance[from][msg.sender], amount);
        require(balanceOf[from] >= amount, "insufficient-balance");
        balanceOf[from] = SUB904(balanceOf[from], amount);
        balanceOf[to] = ADD612(balanceOf[to], amount);
        emit TRANSFER776(from, to, amount);
        return true;
    }
    
    function BURN486(address from, uint256 amount) external {	//inject NONSTANDARD NAMING
        if (from != msg.sender && allowance[from][msg.sender] != uint256(-1))
            allowance[from][msg.sender] = SUB904(allowance[from][msg.sender], amount);
        require(balanceOf[from] >= amount, "insufficient-balance");
        balanceOf[from] = SUB904(balanceOf[from], amount);
        totalSupply = SUB904(totalSupply, amount);
        emit TRANSFER776(from, address(0), amount);
    }
    
    function APPROVE38(address spender, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        allowance[msg.sender][spender] = amount;
        emit APPROVAL814(msg.sender, spender, amount);
        return true;
    }

    // --- Approve and call contract ---
    function APPROVEANDCALL389(address spender, uint256 amount, bytes calldata data) external returns (bool) {	//inject NONSTANDARD NAMING
        allowance[msg.sender][spender] = amount;
        emit APPROVAL814(msg.sender, spender, amount);
        ApproveAndCallFallBack(spender).RECEIVEAPPROVAL987(msg.sender, amount, address(this), data);
        return true;
    }

    // --- Approve by signature ---
    function PERMIT338(address holder, address spender, uint256 nonce, uint256 expiry,	//inject NONSTANDARD NAMING
                    bool allowed, uint8 v, bytes32 r, bytes32 s) external
    {
        bytes32 digest =
            keccak256(abi.encodePacked(
                "\x19\x01",
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(permit_typehash499,
                                     holder,
                                     spender,
                                     nonce,
                                     expiry,
                                     allowed))
        ));

        require(holder != address(0), "invalid-address-0");
        require(holder == ecrecover(digest, v, r, s), "invalid-permit");
        require(expiry == 0 || now <= expiry, "permit-expired");
        require(nonce == nonces[holder]++, "invalid-nonce");
        uint256 amount = allowed ? uint256(-1) : 0;
        allowance[holder][spender] = amount;
        emit APPROVAL814(holder, spender, amount);
    }
}