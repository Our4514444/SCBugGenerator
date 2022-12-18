                                                                 

pragma solidity 0.5.7;

contract PHCMath {
    function ADD358(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "phc-math-add");
    }
    function SUB184(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "phc-math-sub");
    }
    function MUL797(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "phc-math-mul");
    }

    function MIN191(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function MAX904(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }
    function IMIN326(int x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function IMAX638(int x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }

    uint256 constant wad15 = 10 ** 18;	//inject NONSTANDARD NAMING
    uint256 constant ray286 = 10 ** 27;	//inject NONSTANDARD NAMING

    function WMUL978(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD358(MUL797(x, y), wad15 / 2) / wad15;
    }
    function RMUL437(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD358(MUL797(x, y), ray286 / 2) / ray286;
    }
    function WDIV854(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD358(MUL797(x, wad15), y / 2) / y;
    }
    function RDIV825(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD358(MUL797(x, ray286), y / 2) / y;
    }

    function RPOW144(uint256 x, uint256 n) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = n % 2 != 0 ? x : ray286;

        for (n /= 2; n != 0; n /= 2) {
            x = RMUL437(x, x);

            if (n % 2 != 0) {
                z = RMUL437(z, x);
            }
        }
    }
}

contract ERC20Events {
    event APPROVAL791(address indexed src, address indexed guy, uint256 wad);	//inject NONSTANDARD NAMING
    event TRANSFER398(address indexed src, address indexed dst, uint256 wad);	//inject NONSTANDARD NAMING
}

contract ERC20 is ERC20Events {
    function TOTALSUPPLY338() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF152(address guy) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE399(address src, address guy) public view returns (uint256);	//inject NONSTANDARD NAMING

    function APPROVE401(address guy, uint256 wad) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER898(address dst, uint256 wad) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM227(	//inject NONSTANDARD NAMING
        address src, address dst, uint256 wad
    ) public returns (bool);
}

contract PHCTokenBase is ERC20, PHCMath {
    mapping (address => uint256)                       _balances;
    mapping (address => mapping (address => uint256))  _approvals;

    uint256 constant _supply802 = (10000000) * (10**18);	//inject NONSTANDARD NAMING
    constructor() public {
        _balances[msg.sender] = _supply802;
    }

    function TOTALSUPPLY338() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _supply802;
    }
    function BALANCEOF152(address src) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[src];
    }
    function ALLOWANCE399(address src, address guy) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _approvals[src][guy];
    }

    function TRANSFER898(address dst, uint256 wad) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM227(msg.sender, dst, wad);
    }

    function TRANSFERFROM227(address src, address dst, uint256 wad)	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        if (src != msg.sender) {
            require(_approvals[src][msg.sender] >= wad, "phc-token-insufficient-approval");
            _approvals[src][msg.sender] = SUB184(_approvals[src][msg.sender], wad);
        }

        require(_balances[src] >= wad, "phc-token-insufficient-balance");
        _balances[src] = SUB184(_balances[src], wad);
        _balances[dst] = ADD358(_balances[dst], wad);

        emit TRANSFER398(src, dst, wad);

        return true;
    }

    function APPROVE401(address guy, uint256 wad) public returns (bool) {	//inject NONSTANDARD NAMING
        _approvals[msg.sender][guy] = wad;

        emit APPROVAL791(msg.sender, guy, wad);

        return true;
    }
}

contract PHCNote {
    event LOGNOTE782(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  guy,
        bytes32  indexed  foo,
        bytes32  indexed  bar,
        uint256              wad,
        bytes             fax
    ) anonymous;

    modifier NOTE995 {	//inject NONSTANDARD NAMING
        bytes32 foo;
        bytes32 bar;

        assembly {
            foo := calldataload(4)
            bar := calldataload(36)
        }

        emit LOGNOTE782(msg.sig, msg.sender, foo, bar, msg.value, msg.data);

        _;
    }
}

contract PHCAuthority {
    function CANCALL279(	//inject NONSTANDARD NAMING
        address src, address dst, bytes4 sig
    ) public view returns (bool);
}

contract PHCAuthEvents {
    event LOGSETAUTHORITY537 (address indexed authority);	//inject NONSTANDARD NAMING
    event LOGSETOWNER284     (address indexed owner);	//inject NONSTANDARD NAMING
}

contract PHCAuth is PHCAuthEvents {
    PHCAuthority  public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LOGSETOWNER284(msg.sender);
    }

    function SETOWNER304(address owner_)	//inject NONSTANDARD NAMING
        public
        AUTH35
    {
        owner = owner_;
        emit LOGSETOWNER284(owner);
    }

    function SETAUTHORITY308(PHCAuthority authority_)	//inject NONSTANDARD NAMING
        public
        AUTH35
    {
        authority = authority_;
        emit LOGSETAUTHORITY537(address(authority));
    }

    modifier AUTH35 {	//inject NONSTANDARD NAMING
        require(ISAUTHORIZED785(msg.sender, msg.sig));
        _;
    }

    function ISAUTHORIZED785(address src, bytes4 sig) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == PHCAuthority(0)) {
            return false;
        } else {
            return authority.CANCALL279(src, address(this), sig);
        }
    }
}

contract PHCStop is PHCNote, PHCAuth {

    bool public stopped;

    modifier STOPPABLE453 {	//inject NONSTANDARD NAMING
        require(!stopped);
        _;
    }
    function STOP762() public payable AUTH35 NOTE995 {	//inject NONSTANDARD NAMING
        stopped = true;
    }
    function START54() public payable AUTH35 NOTE995 {	//inject NONSTANDARD NAMING
        stopped = false;
    }

}

contract PHC is PHCTokenBase, PHCStop {
    mapping (address => mapping (address => bool)) _trusted;

    bytes32  public  symbol;
    uint256  public  decimals = 18; // standard token precision. override to customize

    constructor(bytes32 symbol_) public {
        symbol = symbol_;
    }

    event TRUST104(address indexed src, address indexed guy, bool wat);	//inject NONSTANDARD NAMING

    function TRUSTED898(address src, address guy) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _trusted[src][guy];
    }
    function TRUST591(address guy, bool wat) public STOPPABLE453 {	//inject NONSTANDARD NAMING
        _trusted[msg.sender][guy] = wat;
        emit TRUST104(msg.sender, guy, wat);
    }

    function APPROVE401(address guy, uint256 wad) public STOPPABLE453 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE401(guy, wad);
    }
    function TRANSFERFROM227(address src, address dst, uint256 wad)	//inject NONSTANDARD NAMING
        public
        STOPPABLE453
        returns (bool)
    {
        if (src != msg.sender && !_trusted[src][msg.sender]) {
            _approvals[src][msg.sender] = SUB184(_approvals[src][msg.sender], wad);
        }

        _balances[src] = SUB184(_balances[src], wad);
        _balances[dst] = ADD358(_balances[dst], wad);

        emit TRANSFER398(src, dst, wad);

        return true;
    }

    function PUSH905(address dst, uint256 wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM227(msg.sender, dst, wad);
    }
    function PULL918(address src, uint256 wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM227(src, msg.sender, wad);
    }
    function MOVE113(address src, address dst, uint256 wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM227(src, dst, wad);
    }

    // Optional token name
    bytes32   public  name = "";

    function SETNAME473(bytes32 name_) public AUTH35 {	//inject NONSTANDARD NAMING
        name = name_;
    }
}