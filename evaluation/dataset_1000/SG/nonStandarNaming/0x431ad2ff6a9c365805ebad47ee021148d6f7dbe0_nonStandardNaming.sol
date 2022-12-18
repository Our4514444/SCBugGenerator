                                                                 

pragma solidity ^0.5.2;

contract DSMath {
    function ADD914(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "ds-math-add-overflow");
    }
    function SUB317(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
    function MUL23(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "ds-math-mul-overflow");
    }

    function DIV160(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y > 0, "ds-math-div-overflow");
        z = x / y;
    }

    function MIN643(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function MAX69(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }
    // function imin(int x, int y) internal pure returns (int z) {
    //     return x <= y ? x : y;
    // }
    // function imax(int x, int y) internal pure returns (int z) {
    //     return x >= y ? x : y;
    // }

    uint constant wad413 = 10 ** 18;	//inject NONSTANDARD NAMING
    // uint constant RAY = 10 ** 27;

    // function wmul(uint x, uint y) internal pure returns (uint z) {
    //     z = add(mul(x, y), WAD / 2) / WAD;
    // }
    // function rmul(uint x, uint y) internal pure returns (uint z) {
    //     z = add(mul(x, y), RAY / 2) / RAY;
    // }
    function WDIV832(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD914(MUL23(x, wad413), y / 2) / y;
    }
    // function rdiv(uint x, uint y) internal pure returns (uint z) {
    //     z = add(mul(x, RAY), y / 2) / y;
    // }

    // This famous algorithm is called "exponentiation by squaring"
    // and calculates x^n with x as fixed-point and n as regular unsigned.
    //
    // It's O(log n), instead of O(n) for naive repeated multiplication.
    //
    // These facts are why it works:
    //
    //  If n is even, then x^n = (x^2)^(n/2).
    //  If n is odd,  then x^n = x * x^(n-1),
    //   and applying the equation for even x gives
    //    x^n = x * (x^2)^((n-1) / 2).
    //
    //  Also, EVM division is flooring and
    //    floor[(n-1) / 2] = floor[n / 2].
    //
    // function rpow(uint _x, uint n) internal pure returns (uint z) {
    //     uint x = _x;
    //     z = n % 2 != 0 ? x : RAY;

    //     for (n /= 2; n != 0; n /= 2) {
    //         x = rmul(x, x);

    //         if (n % 2 != 0) {
    //             z = rmul(z, x);
    //         }
    //     }
    // }

                                                                     
    function POW821(uint256 base, uint256 exponent) public pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (exponent == 0) {
            return 1;
        }
        else if (exponent == 1) {
            return base;
        }
        else if (base == 0 && exponent != 0) {
            return 0;
        }
        else {
            uint256 z = base;
            for (uint256 i = 1; i < exponent; i++)
                z = MUL23(z, base);
            return z;
        }
    }
}

contract DSAuthEvents {
    event LOGSETAUTHORITY714 (address indexed authority);	//inject NONSTANDARD NAMING
    event LOGSETOWNER801     (address indexed owner);	//inject NONSTANDARD NAMING
}

contract DSAuth is DSAuthEvents {
    address      public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LOGSETOWNER801(msg.sender);
    }

    function SETOWNER524(address owner_)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER855
    {
        require(owner_ != address(0), "invalid owner address");
        owner = owner_;
        emit LOGSETOWNER801(owner);
    }

    function SETAUTHORITY838(address authority_)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER855
    {
        authority = authority_;
        emit LOGSETAUTHORITY714(address(authority));
    }

    modifier AUTH708 {	//inject NONSTANDARD NAMING
        require(ISAUTHORIZED121(msg.sender), "ds-auth-unauthorized");
        _;
    }

    modifier ONLYOWNER855 {	//inject NONSTANDARD NAMING
        require(ISOWNER560(msg.sender), "ds-auth-non-owner");
        _;
    }

    function ISOWNER560(address src) public view returns (bool) {	//inject NONSTANDARD NAMING
        return bool(src == owner);
    }

    function ISAUTHORIZED121(address src) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == address(0)) {
            return false;
        } else if (src == authority) {
            return true;
        } else {
            return false;
        }
    }
}

contract DSNote {
    event LOGNOTE973(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  guy,
        bytes32  indexed  foo,
        bytes32  indexed  bar,
        uint256           wad,
        bytes             fax
    ) anonymous;

    modifier NOTE824 {	//inject NONSTANDARD NAMING
        bytes32 foo;
        bytes32 bar;
        uint256 wad;

        assembly {
            foo := calldataload(4)
            bar := calldataload(36)
            wad := callvalue
        }

        emit LOGNOTE973(msg.sig, msg.sender, foo, bar, wad, msg.data);

        _;
    }
}

contract DSStop is DSNote, DSAuth, DSMath {
    bool public stopped;

    modifier STOPPABLE132 {	//inject NONSTANDARD NAMING
        require(!stopped, "ds-stop-is-stopped");
        _;
    }
    function STOP402() public ONLYOWNER855 NOTE824 {	//inject NONSTANDARD NAMING
        stopped = true;
    }
    function START454() public ONLYOWNER855 NOTE824 {	//inject NONSTANDARD NAMING
        stopped = false;
    }
}

contract ERC20Events {
    event APPROVAL813(address indexed src, address indexed guy, uint wad);	//inject NONSTANDARD NAMING
    event TRANSFER585(address indexed src, address indexed dst, uint wad);	//inject NONSTANDARD NAMING
}

contract ERC20 is ERC20Events {
    function TOTALSUPPLY834() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF669(address guy) public view returns (uint);	//inject NONSTANDARD NAMING
    function ALLOWANCE767(address src, address guy) public view returns (uint);	//inject NONSTANDARD NAMING

    function APPROVE650(address guy, uint wad) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER183(address dst, uint wad) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM406(address src, address dst, uint wad) public returns (bool);	//inject NONSTANDARD NAMING
}

contract DSTokenBase is ERC20, DSMath {
    uint256                                            _supply;
    mapping (address => uint256)                       _balances;
    mapping (address => mapping (address => uint256))  _approvals;

    constructor(uint supply) public {
        _supply = supply;
    }

    function TOTALSUPPLY834() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _supply;
    }
    function BALANCEOF669(address src) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[src];
    }
    function ALLOWANCE767(address src, address guy) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _approvals[src][guy];
    }

    function TRANSFER183(address dst, uint wad) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM406(msg.sender, dst, wad);
    }

    function TRANSFERFROM406(address src, address dst, uint wad)	//inject NONSTANDARD NAMING
        public
        returns (bool)
    {
        if (src != msg.sender) {
            require(_approvals[src][msg.sender] >= wad, "ds-token-insufficient-approval");
            _approvals[src][msg.sender] = SUB317(_approvals[src][msg.sender], wad);
        }

        require(_balances[src] >= wad, "ds-token-insufficient-balance");
        _balances[src] = SUB317(_balances[src], wad);
        _balances[dst] = ADD914(_balances[dst], wad);

        emit TRANSFER585(src, dst, wad);

        return true;
    }

    function APPROVE650(address guy, uint wad) public returns (bool) {	//inject NONSTANDARD NAMING
        _approvals[msg.sender][guy] = wad;

        emit APPROVAL813(msg.sender, guy, wad);

        return true;
    }
}

contract DSToken is DSTokenBase(0), DSStop {

    bytes32  public  name = "";
    bytes32  public  symbol;
    uint256  public  decimals = 18;

    constructor(bytes32 symbol_) public {
        symbol = symbol_;
    }

    function SETNAME730(bytes32 name_) public ONLYOWNER855 {	//inject NONSTANDARD NAMING
        name = name_;
    }

    function APPROVEX979(address guy) public STOPPABLE132 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE650(guy, uint(-1));
    }

    function APPROVE650(address guy, uint wad) public STOPPABLE132 returns (bool) {	//inject NONSTANDARD NAMING
        require(_approvals[msg.sender][guy] == 0 || wad == 0); //take care of re-approve.
        return super.APPROVE650(guy, wad);
    }

    function TRANSFERFROM406(address src, address dst, uint wad)	//inject NONSTANDARD NAMING
        public
        STOPPABLE132
        returns (bool)
    {
        if (src != msg.sender && _approvals[src][msg.sender] != uint(-1)) {
            require(_approvals[src][msg.sender] >= wad, "ds-token-insufficient-approval");
            _approvals[src][msg.sender] = SUB317(_approvals[src][msg.sender], wad);
        }

        require(_balances[src] >= wad, "ds-token-insufficient-balance");
        _balances[src] = SUB317(_balances[src], wad);
        _balances[dst] = ADD914(_balances[dst], wad);

        emit TRANSFER585(src, dst, wad);

        return true;
    }

    function MINT153(address guy, uint wad) public AUTH708 STOPPABLE132 {	//inject NONSTANDARD NAMING
        _MINT442(guy, wad);
    }

    function BURN603(address guy, uint wad) public AUTH708 STOPPABLE132 {	//inject NONSTANDARD NAMING
        _BURN862(guy, wad);
    }

    function _MINT442(address guy, uint wad) internal {	//inject NONSTANDARD NAMING
        require(guy != address(0), "ds-token-mint: mint to the zero address");

        _balances[guy] = ADD914(_balances[guy], wad);
        _supply = ADD914(_supply, wad);
        emit TRANSFER585(address(0), guy, wad);
    }

    function _BURN862(address guy, uint wad) internal {	//inject NONSTANDARD NAMING
        require(guy != address(0), "ds-token-burn: burn from the zero address");
        require(_balances[guy] >= wad, "ds-token-insufficient-balance");

        if (guy != msg.sender && _approvals[guy][msg.sender] != uint(-1)) {
            require(_approvals[guy][msg.sender] >= wad, "ds-token-insufficient-approval");
            _approvals[guy][msg.sender] = SUB317(_approvals[guy][msg.sender], wad);
        }

        _balances[guy] = SUB317(_balances[guy], wad);
        _supply = SUB317(_supply, wad);
        emit TRANSFER585(guy, address(0), wad);
    }
}