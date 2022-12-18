                                                                 

pragma solidity 0.5.7;

contract PHCMath {
    function ADD932(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "phc-math-add");
    }
    function SUB820(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "phc-math-sub");
    }
    function MUL437(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "phc-math-mul");
    }

    function MIN617(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function MAX776(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }
    function IMIN785(int x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function IMAX610(int x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }

    uint256 constant wad851 = 10 ** 18;	//inject NONSTANDARD NAMING
    uint256 constant ray298 = 10 ** 27;	//inject NONSTANDARD NAMING

    function WMUL89(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD932(MUL437(x, y), wad851 / 2) / wad851;
    }
    function RMUL374(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD932(MUL437(x, y), ray298 / 2) / ray298;
    }
    function WDIV135(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD932(MUL437(x, wad851), y / 2) / y;
    }
    function RDIV462(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD932(MUL437(x, ray298), y / 2) / y;
    }

    function RPOW697(uint256 x, uint256 n) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = n % 2 != 0 ? x : ray298;

        for (n /= 2; n != 0; n /= 2) {
            x = RMUL374(x, x);

            if (n % 2 != 0) {
                z = RMUL374(z, x);
            }
        }
    }
}

contract ERC20Events {
    event APPROVAL454(address indexed src, address indexed guy, uint256 wad);	//inject NONSTANDARD NAMING
    event TRANSFER39(address indexed src, address indexed dst, uint256 wad);	//inject NONSTANDARD NAMING
}

contract ERC20 is ERC20Events {
    function TOTALSUPPLY708() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF757(address guy) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE955(address src, address guy) public view returns (uint256);	//inject NONSTANDARD NAMING

    function APPROVE202(address guy, uint256 wad) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER213(address dst, uint256 wad) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM20(	//inject NONSTANDARD NAMING
        address src, address dst, uint256 wad
    ) public returns (bool);
}

contract PHCTokenBase is ERC20, PHCMath {
    mapping (address => uint256)                       _balances;
    mapping (address => mapping (address => uint256))  _approvals;

    uint256 constant _supply534 = (2000000000) * (10**18);	//inject NONSTANDARD NAMING
    constructor() public {
        _balances[msg.sender] = _supply534;
    }

    function TOTALSUPPLY708() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _supply534;
    }
    function BALANCEOF757(address src) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[src];
    }
    function ALLOWANCE955(address src, address guy) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _approvals[src][guy];
    }

    function TRANSFER213(address dst, uint256 wad) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM20(msg.sender, dst, wad);
    }

    function TRANSFERFROM20(address src, address dst, uint256 wad)	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        if (src != msg.sender) {
            require(_approvals[src][msg.sender] >= wad, "phc-token-insufficient-approval");
            _approvals[src][msg.sender] = SUB820(_approvals[src][msg.sender], wad);
        }

        require(_balances[src] >= wad, "phc-token-insufficient-balance");
        _balances[src] = SUB820(_balances[src], wad);
        _balances[dst] = ADD932(_balances[dst], wad);

        emit TRANSFER39(src, dst, wad);

        return true;
    }

    function APPROVE202(address guy, uint256 wad) public returns (bool) {	//inject NONSTANDARD NAMING
        _approvals[msg.sender][guy] = wad;

        emit APPROVAL454(msg.sender, guy, wad);

        return true;
    }
}

contract PHCNote {
    event LOGNOTE854(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  guy,
        bytes32  indexed  foo,
        bytes32  indexed  bar,
        uint256              wad,
        bytes             fax
    ) anonymous;

    modifier NOTE794 {	//inject NONSTANDARD NAMING
        bytes32 foo;
        bytes32 bar;

        assembly {
            foo := calldataload(4)
            bar := calldataload(36)
        }

        emit LOGNOTE854(msg.sig, msg.sender, foo, bar, msg.value, msg.data);

        _;
    }
}

contract PHCAuthority {
    function CANCALL626(	//inject NONSTANDARD NAMING
        address src, address dst, bytes4 sig
    ) public view returns (bool);
}

contract PHCAuthEvents {
    event LOGSETAUTHORITY34 (address indexed authority);	//inject NONSTANDARD NAMING
    event LOGSETOWNER620     (address indexed owner);	//inject NONSTANDARD NAMING
}

contract PHCAuth is PHCAuthEvents {
    PHCAuthority  public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LOGSETOWNER620(msg.sender);
    }

    function SETOWNER249(address owner_)	//inject NONSTANDARD NAMING
        public
        AUTH332
    {
        owner = owner_;
        emit LOGSETOWNER620(owner);
    }

    function SETAUTHORITY450(PHCAuthority authority_)	//inject NONSTANDARD NAMING
        public
        AUTH332
    {
        authority = authority_;
        emit LOGSETAUTHORITY34(address(authority));
    }

    modifier AUTH332 {	//inject NONSTANDARD NAMING
        require(ISAUTHORIZED204(msg.sender, msg.sig));
        _;
    }

    function ISAUTHORIZED204(address src, bytes4 sig) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == PHCAuthority(0)) {
            return false;
        } else {
            return authority.CANCALL626(src, address(this), sig);
        }
    }
}

contract PHCStop is PHCNote, PHCAuth {

    bool public stopped;

    modifier STOPPABLE498 {	//inject NONSTANDARD NAMING
        require(!stopped);
        _;
    }
    function STOP658() public payable AUTH332 NOTE794 {	//inject NONSTANDARD NAMING
        stopped = true;
    }
    function START313() public payable AUTH332 NOTE794 {	//inject NONSTANDARD NAMING
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

    event TRUST667(address indexed src, address indexed guy, bool wat);	//inject NONSTANDARD NAMING

    function TRUSTED653(address src, address guy) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _trusted[src][guy];
    }
    function TRUST529(address guy, bool wat) public STOPPABLE498 {	//inject NONSTANDARD NAMING
        _trusted[msg.sender][guy] = wat;
        emit TRUST667(msg.sender, guy, wat);
    }

    function APPROVE202(address guy, uint256 wad) public STOPPABLE498 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE202(guy, wad);
    }
    function TRANSFERFROM20(address src, address dst, uint256 wad)	//inject NONSTANDARD NAMING
        public
        STOPPABLE498
        returns (bool)
    {
        if (src != msg.sender && !_trusted[src][msg.sender]) {
            _approvals[src][msg.sender] = SUB820(_approvals[src][msg.sender], wad);
        }

        _balances[src] = SUB820(_balances[src], wad);
        _balances[dst] = ADD932(_balances[dst], wad);

        emit TRANSFER39(src, dst, wad);

        return true;
    }

    function PUSH139(address dst, uint256 wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM20(msg.sender, dst, wad);
    }
    function PULL13(address src, uint256 wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM20(src, msg.sender, wad);
    }
    function MOVE193(address src, address dst, uint256 wad) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM20(src, dst, wad);
    }

    // Optional token name
    bytes32   public  name = "";

    function SETNAME678(bytes32 name_) public AUTH332 {	//inject NONSTANDARD NAMING
        name = name_;
    }
}