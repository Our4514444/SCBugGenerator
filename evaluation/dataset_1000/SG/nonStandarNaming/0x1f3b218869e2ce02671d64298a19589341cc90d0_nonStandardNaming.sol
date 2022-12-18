                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity ^0.5.12;
pragma experimental ABIEncoderV2;

contract Math {
    // --- Math ---
    function ADD873(uint x, int y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = x + uint(y);
        require(y >= 0 || z <= x);
        require(y <= 0 || z >= x);
    }
    function SUB60(uint x, int y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = x - uint(y);
        require(y <= 0 || z <= x);
        require(y >= 0 || z >= x);
    }
    function MUL674(uint x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        z = int(x) * y;
        require(int(x) >= 0);
        require(y == 0 || z / y == int(x));
    }
    function ADD873(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x);
    }
    function SUB60(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x);
    }
    function MUL674(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x);
    }

    uint constant ray35 = 10 ** 27;	//inject NONSTANDARD NAMING

    function RDIV179(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = MUL674(x, ray35) / y;
    }
    function RMUL44(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = MUL674(x, y) / ray35;
    }
    function RPOW605(uint x, uint n, uint b) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
      assembly {
        switch x case 0 {switch n case 0 {z := b} default {z := 0}}
        default {
          switch mod(n, 2) case 0 { z := b } default { z := x }
          let half := div(b, 2)  // for rounding.
          for { n := div(n, 2) } n { n := div(n,2) } {
            let xx := mul(x, x)
            if iszero(eq(div(xx, x), x)) { revert(0,0) }
            let xxRound := add(xx, half)
            if lt(xxRound, xx) { revert(0,0) }
            x := div(xxRound, b)
            if mod(n,2) {
              let zx := mul(z, x)
              if and(iszero(iszero(x)), iszero(eq(div(zx, x), z))) { revert(0,0) }
              let zxRound := add(zx, half)
              if lt(zxRound, zx) { revert(0,0) }
              z := div(zxRound, b)
            }
          }
        }
      }
    }

    function TOINT435(uint x) internal pure returns (int y) {	//inject NONSTANDARD NAMING
        y = int(x);
        require(y >= 0);
    }
}


contract LibNote {
    event LOGNOTE334(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier NOTE236 {	//inject NONSTANDARD NAMING
        _;
        assembly {
            // log an 'anonymous' event with a constant 6 words of calldata
            // and four indexed topics: selector, caller, arg1 and arg2
            let mark := msize()                       // end of memory ensures zero
            mstore(0x40, add(mark, 288))              // update free memory pointer
            mstore(mark, 0x20)                        // bytes type data offset
            mstore(add(mark, 0x20), 224)              // bytes size (padded)
            calldatacopy(add(mark, 0x40), 0, 224)     // bytes payload
            log4(mark, 288,                           // calldata
                 shl(224, shr(224, calldataload(0))), // msg.sig
                 caller(),                            // msg.sender
                 calldataload(4),                     // arg1
                 calldataload(36)                     // arg2
                )
        }
    }
}

contract BCdpScoreLike {
    function UPDATESCORE929(uint cdp, bytes32 ilk, int dink, int dart, uint time) external;	//inject NONSTANDARD NAMING
}

contract BCdpScoreConnector {
    BCdpScoreLike public score;
    mapping(uint => uint) public left;

    constructor(BCdpScoreLike score_) public {
        score = score_;
    }

    function SETSCORE603(BCdpScoreLike bcdpScore) internal {	//inject NONSTANDARD NAMING
        score = bcdpScore;
    }

    function UPDATESCORE929(uint cdp, bytes32 ilk, int dink, int dart, uint time) internal {	//inject NONSTANDARD NAMING
        if(left[cdp] == 0) score.UPDATESCORE929(cdp, ilk, dink, dart, time);
    }

    function QUITSCORE85(uint cdp) internal {	//inject NONSTANDARD NAMING
        if(left[cdp] == 0) left[cdp] = now;
    }
}



contract UrnHandler {
    constructor(address vat) public {
        VatLike(vat).HOPE790(msg.sender);
    }
}

contract DssCdpManager is LibNote {
    address                   public vat;
    uint                      public cdpi;      // Auto incremental
    mapping (uint => address) public urns;      // CDPId => UrnHandler
    mapping (uint => List)    public list;      // CDPId => Prev & Next CDPIds (double linked list)
    mapping (uint => address) public owns;      // CDPId => Owner
    mapping (uint => bytes32) public ilks;      // CDPId => Ilk

    mapping (address => uint) public first;     // Owner => First CDPId
    mapping (address => uint) public last;      // Owner => Last CDPId
    mapping (address => uint) public count;     // Owner => Amount of CDPs

    mapping (
        address => mapping (
            uint => mapping (
                address => uint
            )
        )
    ) public cdpCan;                            // Owner => CDPId => Allowed Addr => True/False

    mapping (
        address => mapping (
            address => uint
        )
    ) public urnCan;                            // Urn => Allowed Addr => True/False

    struct List {
        uint prev;
        uint next;
    }

    event NEWCDP753(address indexed usr, address indexed own, uint indexed cdp);	//inject NONSTANDARD NAMING

    modifier CDPALLOWED523(	//inject NONSTANDARD NAMING
        uint cdp
    ) {
        require(msg.sender == owns[cdp] || cdpCan[owns[cdp]][cdp][msg.sender] == 1, "cdp-not-allowed");
        _;
    }

    modifier URNALLOWED554(	//inject NONSTANDARD NAMING
        address urn
    ) {
        require(msg.sender == urn || urnCan[urn][msg.sender] == 1, "urn-not-allowed");
        _;
    }

    constructor(address vat_) public {
        vat = vat_;
    }

    function ADD873(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x);
    }

    function SUB60(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x);
    }

    function TOINT435(uint x) internal pure returns (int y) {	//inject NONSTANDARD NAMING
        y = int(x);
        require(y >= 0);
    }

    // Allow/disallow a usr address to manage the cdp.
    function CDPALLOW815(	//inject NONSTANDARD NAMING
        uint cdp,
        address usr,
        uint ok
    ) public CDPALLOWED523(cdp) {
        cdpCan[owns[cdp]][cdp][usr] = ok;
    }

    // Allow/disallow a usr address to quit to the the sender urn.
    function URNALLOW465(	//inject NONSTANDARD NAMING
        address usr,
        uint ok
    ) public {
        urnCan[msg.sender][usr] = ok;
    }

    // Open a new cdp for a given usr address.
    function OPEN180(	//inject NONSTANDARD NAMING
        bytes32 ilk,
        address usr
    ) public NOTE236 returns (uint) {
        require(usr != address(0), "usr-address-0");

        cdpi = ADD873(cdpi, 1);
        urns[cdpi] = address(new UrnHandler(vat));
        owns[cdpi] = usr;
        ilks[cdpi] = ilk;

        // Add new CDP to double linked list and pointers
        if (first[usr] == 0) {
            first[usr] = cdpi;
        }
        if (last[usr] != 0) {
            list[cdpi].prev = last[usr];
            list[last[usr]].next = cdpi;
        }
        last[usr] = cdpi;
        count[usr] = ADD873(count[usr], 1);

        emit NEWCDP753(msg.sender, usr, cdpi);
        return cdpi;
    }

    // Give the cdp ownership to a dst address.
    function GIVE573(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst
    ) public NOTE236 CDPALLOWED523(cdp) {
        require(dst != address(0), "dst-address-0");
        require(dst != owns[cdp], "dst-already-owner");

        // Remove transferred CDP from double linked list of origin user and pointers
        if (list[cdp].prev != 0) {
            list[list[cdp].prev].next = list[cdp].next;         // Set the next pointer of the prev cdp (if exists) to the next of the transferred one
        }
        if (list[cdp].next != 0) {                              // If wasn't the last one
            list[list[cdp].next].prev = list[cdp].prev;         // Set the prev pointer of the next cdp to the prev of the transferred one
        } else {                                                // If was the last one
            last[owns[cdp]] = list[cdp].prev;                   // Update last pointer of the owner
        }
        if (first[owns[cdp]] == cdp) {                          // If was the first one
            first[owns[cdp]] = list[cdp].next;                  // Update first pointer of the owner
        }
        count[owns[cdp]] = SUB60(count[owns[cdp]], 1);

        // Transfer ownership
        owns[cdp] = dst;

        // Add transferred CDP to double linked list of destiny user and pointers
        list[cdp].prev = last[dst];
        list[cdp].next = 0;
        if (last[dst] != 0) {
            list[last[dst]].next = cdp;
        }
        if (first[dst] == 0) {
            first[dst] = cdp;
        }
        last[dst] = cdp;
        count[dst] = ADD873(count[dst], 1);
    }

    // Frob the cdp keeping the generated DAI or collateral freed in the cdp urn address.
    function FROB657(	//inject NONSTANDARD NAMING
        uint cdp,
        int dink,
        int dart
    ) public NOTE236 CDPALLOWED523(cdp) {
        address urn = urns[cdp];
        VatLike(vat).FROB657(
            ilks[cdp],
            urn,
            urn,
            urn,
            dink,
            dart
        );
    }

    // Transfer wad amount of cdp collateral from the cdp address to a dst address.
    function FLUX692(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst,
        uint wad
    ) public NOTE236 CDPALLOWED523(cdp) {
        VatLike(vat).FLUX692(ilks[cdp], urns[cdp], dst, wad);
    }

    // Transfer wad amount of any type of collateral (ilk) from the cdp address to a dst address.
    // This function has the purpose to take away collateral from the system that doesn't correspond to the cdp but was sent there wrongly.
    function FLUX692(	//inject NONSTANDARD NAMING
        bytes32 ilk,
        uint cdp,
        address dst,
        uint wad
    ) public NOTE236 CDPALLOWED523(cdp) {
        VatLike(vat).FLUX692(ilk, urns[cdp], dst, wad);
    }

    // Transfer wad amount of DAI from the cdp address to a dst address.
    function MOVE492(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst,
        uint rad
    ) public NOTE236 CDPALLOWED523(cdp) {
        VatLike(vat).MOVE492(urns[cdp], dst, rad);
    }

    // Quit the system, migrating the cdp (ink, art) to a different dst urn
    function QUIT914(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst
    ) public NOTE236 CDPALLOWED523(cdp) URNALLOWED554(dst) {
        (uint ink, uint art) = VatLike(vat).URNS364(ilks[cdp], urns[cdp]);
        VatLike(vat).FORK875(
            ilks[cdp],
            urns[cdp],
            dst,
            TOINT435(ink),
            TOINT435(art)
        );
    }

    // Import a position from src urn to the urn owned by cdp
    function ENTER922(	//inject NONSTANDARD NAMING
        address src,
        uint cdp
    ) public NOTE236 URNALLOWED554(src) CDPALLOWED523(cdp) {
        (uint ink, uint art) = VatLike(vat).URNS364(ilks[cdp], src);
        VatLike(vat).FORK875(
            ilks[cdp],
            src,
            urns[cdp],
            TOINT435(ink),
            TOINT435(art)
        );
    }

    // Move a position from cdpSrc urn to the cdpDst urn
    function SHIFT979(	//inject NONSTANDARD NAMING
        uint cdpSrc,
        uint cdpDst
    ) public NOTE236 CDPALLOWED523(cdpSrc) CDPALLOWED523(cdpDst) {
        require(ilks[cdpSrc] == ilks[cdpDst], "non-matching-cdps");
        (uint ink, uint art) = VatLike(vat).URNS364(ilks[cdpSrc], urns[cdpSrc]);
        VatLike(vat).FORK875(
            ilks[cdpSrc],
            urns[cdpSrc],
            urns[cdpDst],
            TOINT435(ink),
            TOINT435(art)
        );
    }
}


interface DSAuthority {
    function CANCALL55(	//inject NONSTANDARD NAMING
        address src, address dst, bytes4 sig
    ) external view returns (bool);
}

contract DSAuthEvents {
    event LOGSETAUTHORITY488 (address indexed authority);	//inject NONSTANDARD NAMING
    event LOGSETOWNER990     (address indexed owner);	//inject NONSTANDARD NAMING
}

contract DSAuth is DSAuthEvents {
    DSAuthority  public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LOGSETOWNER990(msg.sender);
    }

    function SETOWNER545(address owner_)	//inject NONSTANDARD NAMING
        public
        AUTH533
    {
        owner = owner_;
        emit LOGSETOWNER990(owner);
    }

    function SETAUTHORITY391(DSAuthority authority_)	//inject NONSTANDARD NAMING
        public
        AUTH533
    {
        authority = authority_;
        emit LOGSETAUTHORITY488(address(authority));
    }

    modifier AUTH533 {	//inject NONSTANDARD NAMING
        require(ISAUTHORIZED561(msg.sender, msg.sig), "ds-auth-unauthorized");
        _;
    }

    function ISAUTHORIZED561(address src, bytes4 sig) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == DSAuthority(0)) {
            return false;
        } else {
            return authority.CANCALL55(src, address(this), sig);
        }
    }
}


contract VatLike {
    function URNS364(bytes32, address) public view returns (uint, uint);	//inject NONSTANDARD NAMING
    function HOPE790(address) external;	//inject NONSTANDARD NAMING
    function FLUX692(bytes32, address, address, uint) public;	//inject NONSTANDARD NAMING
    function MOVE492(address, address, uint) public;	//inject NONSTANDARD NAMING
    function FROB657(bytes32, address, address, address, int, int) public;	//inject NONSTANDARD NAMING
    function FORK875(bytes32, address, address, int, int) public;	//inject NONSTANDARD NAMING
    function ILKS516(bytes32 ilk) public view returns(uint Art, uint rate, uint spot, uint line, uint dust);	//inject NONSTANDARD NAMING
    function DAI993(address usr) external view returns(uint);	//inject NONSTANDARD NAMING
}

contract CatLike {
    function ILKS516(bytes32) public returns(address flip, uint256 chop, uint256 lump);	//inject NONSTANDARD NAMING
}

contract EndLike {
    function CAT952() public view returns(CatLike);	//inject NONSTANDARD NAMING
}

contract PriceFeedLike {
    function READ472(bytes32 ilk) external view returns(bytes32);	//inject NONSTANDARD NAMING
}

contract LiquidationMachine is DssCdpManager, BCdpScoreConnector, Math {
    VatLike                   public vat;
    EndLike                   public end;
    address                   public pool;
    PriceFeedLike             public real;

    mapping(uint => uint)     public tic;  // time of bite
    mapping(uint => uint)     public cushion; // how much was topped in art units

    uint constant             public grace912 = 1 hours;	//inject NONSTANDARD NAMING
    uint constant             public wad260 = 1e18;	//inject NONSTANDARD NAMING

    mapping (uint => bool)    public out;

    modifier ONLYPOOL17 {	//inject NONSTANDARD NAMING
        require(msg.sender == pool, "not-pool");
        _;
    }

    constructor(VatLike vat_, EndLike end_, address pool_, PriceFeedLike real_) public {
        vat = vat_;
        end = end_;
        pool = pool_;
        real = real_;
    }

    function SETPOOL788(address newPool) internal {	//inject NONSTANDARD NAMING
        pool = newPool;
    }

    function QUITBLIQUIDATION635(uint cdp) internal {	//inject NONSTANDARD NAMING
        UNTOP279(cdp);
        out[cdp] = true;
    }

    function TOPUP31(uint cdp, uint dtopup) external ONLYPOOL17 {	//inject NONSTANDARD NAMING
        if(out[cdp]) return;

        address urn = urns[cdp];
        bytes32 ilk = ilks[cdp];

        (, uint rate,,,) = vat.ILKS516(ilk);
        uint dtab = MUL674(rate, dtopup);

        vat.MOVE492(pool, address(this), dtab);
        vat.FROB657(ilk, urn, urn, address(this), 0, -TOINT435(dtopup));

        cushion[cdp] = ADD873(cushion[cdp], dtopup);
    }

    function BITTEN519(uint cdp) public view returns(bool) {	//inject NONSTANDARD NAMING
        return tic[cdp] + grace912 > now;
    }

    function UNTOP279(uint cdp) internal {	//inject NONSTANDARD NAMING
        require(! BITTEN519(cdp), "untop: cdp was already bitten");

        uint top = cushion[cdp];
        if(top == 0) return; // nothing to do

        bytes32 ilk = ilks[cdp];
        address urn = urns[cdp];

        (, uint rate,,,) = vat.ILKS516(ilk);
        uint dtab = MUL674(rate, top);

        cushion[cdp] = 0;

        // move topping to pool
        vat.FROB657(ilk, urn, urn, urn, 0, TOINT435(top));
        vat.MOVE492(urn, pool, dtab);
    }

    function UNTOPBYPOOL227(uint cdp) external ONLYPOOL17 {	//inject NONSTANDARD NAMING
        UNTOP279(cdp);
    }

    function DOBITE832(uint dart, bytes32 ilk, address urn, uint dink) internal {	//inject NONSTANDARD NAMING
        (, uint rate,,,) = vat.ILKS516(ilk);
        uint dtab = MUL674(rate, dart);

        vat.MOVE492(pool, address(this), dtab);

        vat.FROB657(ilk, urn, urn, address(this), 0, -TOINT435(dart));
        vat.FROB657(ilk, urn, msg.sender, urn, -TOINT435(dink), 0);
    }

    function CALCDINK91(uint dart, uint rate, bytes32 ilk) internal returns(uint dink) {	//inject NONSTANDARD NAMING
        (, uint chop,) = end.CAT952().ILKS516(ilk);
        uint tab = MUL674(MUL674(dart, rate), chop) / wad260;
        bytes32 realtimePrice = real.READ472(ilk);

        dink = RMUL44(tab, wad260) / uint(realtimePrice);
    }

    function BITE312(uint cdp, uint dart) external ONLYPOOL17 returns(uint dink){	//inject NONSTANDARD NAMING
        address urn = urns[cdp];
        bytes32 ilk = ilks[cdp];

        (uint ink, uint art) = vat.URNS364(ilk, urn);
        art = ADD873(art, cushion[cdp]);
        (, uint rate, uint spotValue,,) = vat.ILKS516(ilk);

        require(dart <= art, "debt is too low");

        // verify cdp is unsafe now
        if(! BITTEN519(cdp)) {
            require(MUL674(art, rate) > MUL674(ink, spotValue), "bite: cdp is safe");
            require(cushion[cdp] > 0, "bite: not-topped");
            tic[cdp] = now;
        }

        dink = CALCDINK91(dart, rate, ilk);
        UPDATESCORE929(cdp, ilk, -TOINT435(dink), -TOINT435(dart), now);

        uint usedCushion = MUL674(cushion[cdp], dart) / art;
        cushion[cdp] = SUB60(cushion[cdp], usedCushion);
        uint bart = SUB60(dart, usedCushion);

        DOBITE832(bart, ilk, urn, dink);
    }
}


contract BCdpManager is BCdpScoreConnector, LiquidationMachine, DSAuth {
    constructor(address vat_, address end_, address pool_, address real_, address score_) public
        DssCdpManager(vat_)
        LiquidationMachine(VatLike(vat_), EndLike(end_), pool_, PriceFeedLike(real_))
        BCdpScoreConnector(BCdpScoreLike(score_))
    {

    }

    // Frob the cdp keeping the generated DAI or collateral freed in the cdp urn address.
    function FROB657(	//inject NONSTANDARD NAMING
        uint cdp,
        int dink,
        int dart
    ) public CDPALLOWED523(cdp) {
        bytes32 ilk = ilks[cdp];

        UNTOP279(cdp);
        UPDATESCORE929(cdp, ilk, dink, dart, now);

        super.FROB657(cdp, dink, dart);
    }

    // Quit the system, migrating the cdp (ink, art) to a different dst urn
    function QUIT914(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst
    ) public CDPALLOWED523(cdp) URNALLOWED554(dst) {
        address urn = urns[cdp];
        bytes32 ilk = ilks[cdp];

        UNTOP279(cdp);
        (uint ink, uint art) = vat.URNS364(ilk, urn);
        UPDATESCORE929(cdp, ilk, -TOINT435(ink), -TOINT435(art), now);

        super.QUIT914(cdp, dst);
    }

    // Import a position from src urn to the urn owned by cdp
    function ENTER922(	//inject NONSTANDARD NAMING
        address src,
        uint cdp
    ) public URNALLOWED554(src) CDPALLOWED523(cdp) {
        bytes32 ilk = ilks[cdp];

        UNTOP279(cdp);
        (uint ink, uint art) = vat.URNS364(ilk, src);
        UPDATESCORE929(cdp, ilk, TOINT435(ink), TOINT435(art), now);

        super.ENTER922(src, cdp);
    }

    // Move a position from cdpSrc urn to the cdpDst urn
    function SHIFT979(	//inject NONSTANDARD NAMING
        uint cdpSrc,
        uint cdpDst
    ) public CDPALLOWED523(cdpSrc) CDPALLOWED523(cdpDst) {
        bytes32 ilkSrc = ilks[cdpSrc];

        UNTOP279(cdpSrc);
        UNTOP279(cdpDst);

        address src = urns[cdpSrc];

        (uint inkSrc, uint artSrc) = vat.URNS364(ilkSrc, src);

        UPDATESCORE929(cdpSrc, ilkSrc, -TOINT435(inkSrc), -TOINT435(artSrc), now);
        UPDATESCORE929(cdpDst, ilkSrc, TOINT435(inkSrc), TOINT435(artSrc), now);

        super.SHIFT979(cdpSrc, cdpDst);
    }

                                                                                

    function QUITB871(uint cdp) external CDPALLOWED523(cdp) NOTE236 {	//inject NONSTANDARD NAMING
        QUITSCORE85(cdp);
        QUITBLIQUIDATION635(cdp);
    }

    function SETSCORECONTRACT360(BCdpScoreLike _score) external AUTH533 {	//inject NONSTANDARD NAMING
        super.SETSCORE603(_score);
    }

    function SETPOOLCONTRACT687(address _pool) external AUTH533 {	//inject NONSTANDARD NAMING
        super.SETPOOL788(_pool);
    }
}

contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER884() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA685() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED764(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER884();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED764(address(0), msgSender);
    }

                                                                     
    function OWNER520() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER276() {	//inject NONSTANDARD NAMING
        require(ISOWNER676(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER676() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER884() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP248() public ONLYOWNER276 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED764(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP674(address newOwner) public ONLYOWNER276 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP186(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP186(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED764(_owner, newOwner);
        _owner = newOwner;
    }
}

contract ScoringMachine is Ownable {
    struct AssetScore {
        // total score so far
        uint score;

        // current balance
        uint balance;

        // time when last update was
        uint last;
    }

    // user is bytes32 (will be the sha3 of address or cdp number)
    mapping(bytes32 => mapping(bytes32 => AssetScore[])) public checkpoints;

    mapping(bytes32 => mapping(bytes32 => AssetScore)) public userScore;

    bytes32 constant public global_user663 = bytes32(0x0);	//inject NONSTANDARD NAMING

    uint public start; // start time of the campaign;

    function SPIN744() external ONLYOWNER276 { // start a new round	//inject NONSTANDARD NAMING
        start = now;
    }

    function ASSETSCORE458(AssetScore storage score, uint time, uint spinStart) internal view returns(uint) {	//inject NONSTANDARD NAMING
        uint last = score.last;
        uint currentScore = score.score;
        if(last < spinStart) {
            last = spinStart;
            currentScore = 0;
        }

        return ADD873(currentScore, MUL674(score.balance, SUB60(time, last)));
    }

    function ADDCHECKPOINT457(bytes32 user, bytes32 asset) internal {	//inject NONSTANDARD NAMING
        checkpoints[user][asset].push(userScore[user][asset]);
    }

    function UPDATEASSETSCORE308(bytes32 user, bytes32 asset, int dbalance, uint time) internal {	//inject NONSTANDARD NAMING
        AssetScore storage score = userScore[user][asset];

        if(score.last < start) ADDCHECKPOINT457(user, asset);

        score.score = ASSETSCORE458(score, time, start);
        score.balance = ADD873(score.balance, dbalance);
        
        score.last = time;
    }

    function UPDATESCORE929(bytes32 user, bytes32 asset, int dbalance, uint time) internal {	//inject NONSTANDARD NAMING
        UPDATEASSETSCORE308(user, asset, dbalance, time);
        UPDATEASSETSCORE308(global_user663, asset, dbalance, time);
    }

    function GETSCORE437(bytes32 user, bytes32 asset, uint time, uint spinStart, uint checkPointHint) public view returns(uint score) {	//inject NONSTANDARD NAMING
        if(time >= userScore[user][asset].last) return ASSETSCORE458(userScore[user][asset], time, spinStart);

        // else - check the checkpoints
        uint checkpointsLen = checkpoints[user][asset].length;
        if(checkpointsLen == 0) return 0;

        // hint is invalid
        if(checkpoints[user][asset][checkPointHint].last < time) checkPointHint = checkpointsLen - 1;

        for(uint i = checkPointHint ; ; i--){
            if(checkpoints[user][asset][i].last <= time) return ASSETSCORE458(checkpoints[user][asset][i], time, spinStart);
        }

        // this supposed to be unreachable
        return 0;
    }

    function GETCURRENTBALANCE803(bytes32 user, bytes32 asset) public view returns(uint balance) {	//inject NONSTANDARD NAMING
        balance = userScore[user][asset].balance;
    }

    // Math functions without errors
    // ==============================
    function ADD873(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = x + y;
        if(!(z >= x)) return 0;

        return z;
    }

    function ADD873(uint x, int y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = x + uint(y);
        if(!(y >= 0 || z <= x)) return 0;
        if(!(y <= 0 || z >= x)) return 0;

        return z;
    }

    function SUB60(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        if(!(y <= x)) return 0;
        z = x - y;

        return z;
    }

    function MUL674(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        if (x == 0) return 0;

        z = x * y;
        if(!(z / x == y)) return 0;

        return z;
    }
}


contract BCdpScore is ScoringMachine {
    BCdpManager public manager;

    modifier ONLYMANAGER771 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(manager), "not-manager");
        _;
    }

    function SETMANAGER284(address newManager) external ONLYOWNER276 {	//inject NONSTANDARD NAMING
        manager = BCdpManager(newManager);
    }

    function USER828(uint cdp) public pure returns(bytes32) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encodePacked("BCdpScore", cdp));
    }

    function ARTASSET147(bytes32 ilk) public pure returns(bytes32) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encodePacked("BCdpScore", "art", ilk));
    }

    function UPDATESCORE929(uint cdp, bytes32 ilk, int dink, int dart, uint time) external ONLYMANAGER771 {	//inject NONSTANDARD NAMING
        dink; // shh compiler warning
        UPDATESCORE929(USER828(cdp), ARTASSET147(ilk), dart, time);
    }

    function SLASHSCORE86(uint maliciousCdp) external {	//inject NONSTANDARD NAMING
        address urn = manager.urns(maliciousCdp);
        bytes32 ilk = manager.ilks(maliciousCdp);

        (, uint realArt) = manager.vat().URNS364(ilk, urn);

        bytes32 maliciousUser = USER828(maliciousCdp);
        bytes32 asset = ARTASSET147(ilk);

        uint left = BCdpScoreConnector(address(manager)).left(maliciousCdp);

        realArt = left > 0 ? 0 : realArt;
        uint startTime = left > 0 ? left : now;

        uint calculatedArt = GETCURRENTBALANCE803(maliciousUser, asset);
        require(realArt < calculatedArt, "slashScore-cdp-is-ok");
        int dart = int(realArt) - int(calculatedArt);
        uint time = SUB60(startTime, 30 days);
        if(time < start) time = start;
        
        UPDATESCORE929(maliciousUser, asset, dart, time);
    }

    function GETARTSCORE438(uint cdp, bytes32 ilk, uint time, uint spinStart) public view returns(uint) {	//inject NONSTANDARD NAMING
        return GETSCORE437(USER828(cdp), ARTASSET147(ilk), time, spinStart, 0);
    }

    function GETARTGLOBALSCORE498(bytes32 ilk, uint time, uint spinStart) public view returns(uint) {	//inject NONSTANDARD NAMING
        return GETSCORE437(global_user663, ARTASSET147(ilk), time, spinStart, 0);
    }
}



contract JarConnector is Math {
    BCdpScore   public score;
    BCdpManager public man;
    bytes32[]   public ilks;
    // ilk => supported
    mapping(bytes32 => bool) public milks;

    // end of every round
    uint[2] public end;
    // start time of every round
    uint[2] public start;

    uint public round;

    constructor(
        bytes32[] memory _ilks,
        uint[2] memory _duration
    ) public {
        ilks = _ilks;

        for(uint i = 0; i < _ilks.length; i++) {
            milks[_ilks[i]] = true;
        }

        end[0] = now + _duration[0];
        end[1] = now + _duration[0] + _duration[1];

        round = 0;
    }

    function SETMANAGER284(address _manager) public {	//inject NONSTANDARD NAMING
        require(man == BCdpManager(0), "manager-already-set");
        man = BCdpManager(_manager);
        score = BCdpScore(address(man.score()));
    }

    // callable by anyone
    function SPIN744() public {	//inject NONSTANDARD NAMING
        if(round == 0) {
            round++;
            score.SPIN744();
            start[0] = score.start();
        }
        if(round == 1 && now > end[0]) {
            round++;
            score.SPIN744();
            start[1] = score.start();
        }
        if(round == 2 && now > end[1]) {
            round++;        
            // score is not counted anymore, and this must be followed by contract upgrade
            score.SPIN744();
        }
    }

    function GETUSERSCORE208(bytes32 user) external view returns (uint) {	//inject NONSTANDARD NAMING
        if(round == 0) return 0;

        uint cdp = uint(user);
        bytes32 ilk = man.ilks(cdp);

        // Should return 0 score for unsupported ilk
        if( ! milks[ilk]) return 0;

        if(round == 1) return 2 * score.GETARTSCORE438(cdp, ilk, now, start[0]);

        uint firstRoundScore = 2 * score.GETARTSCORE438(cdp, ilk, start[1], start[0]);
        uint time = now;
        if(round > 2) time = end[1];

        return ADD873(score.GETARTSCORE438(cdp, ilk, time, start[1]), firstRoundScore);
    }

    function GETGLOBALSCORE362() external view returns (uint) {	//inject NONSTANDARD NAMING
        if(round == 0) return 0;

        if(round == 1) return 2 * GETARTGLOBALSCORE498(now, start[0]);

        uint firstRoundScore = 2 * GETARTGLOBALSCORE498(start[1], start[0]);
        uint time = now;
        if(round > 2) time = end[1];

        return ADD873(GETARTGLOBALSCORE498(time, start[1]), firstRoundScore);
    }

    function GETGLOBALSCORE362(bytes32 ilk) external view returns (uint) {	//inject NONSTANDARD NAMING
        if(round == 0) return 0;

        if(round == 1) return 2 * score.GETARTGLOBALSCORE498(ilk, now, start[0]);

        uint firstRoundScore = 2 * score.GETARTGLOBALSCORE498(ilk, start[1], start[0]);
        uint time = now;
        if(round > 2) time = end[1];

        return ADD873(score.GETARTGLOBALSCORE498(ilk, time, start[1]), firstRoundScore);
    }

    function GETARTGLOBALSCORE498(uint time, uint spinStart) internal view returns (uint totalScore) {	//inject NONSTANDARD NAMING
        for(uint i = 0; i < ilks.length; i++) {
            totalScore = ADD873(totalScore, score.GETARTGLOBALSCORE498(ilks[i], time, spinStart));
        }
    }

    function TOUSER302(bytes32 user) external view returns (address) {	//inject NONSTANDARD NAMING
        return man.owns(uint(user));
    }
}


contract JugLike {
    function ILKS516(bytes32 ilk) public view returns(uint duty, uint rho);	//inject NONSTANDARD NAMING
    function BASE597() public view returns(uint);	//inject NONSTANDARD NAMING
}


contract SpotLike {
    function PAR423() external view returns (uint256);	//inject NONSTANDARD NAMING
    function ILKS516(bytes32 ilk) external view returns (address pip, uint mat);	//inject NONSTANDARD NAMING
}

contract OSMLike {
    function PEEP429() external view returns(bytes32, bool);	//inject NONSTANDARD NAMING
    function HOP630()  external view returns(uint16);	//inject NONSTANDARD NAMING
    function ZZZ258()  external view returns(uint64);	//inject NONSTANDARD NAMING
}

contract DaiToUsdPriceFeed {
    function GETMARKETPRICE345(uint marketId) public view returns (uint);	//inject NONSTANDARD NAMING
}

contract Pool is Math, DSAuth, LibNote {
    uint public constant dai_market_id975 = 3;	//inject NONSTANDARD NAMING
    address[] public members;
    mapping(bytes32 => bool) public ilks;
    uint                     public minArt; // min debt to share among members
    uint                     public shrn;   // share profit % numerator
    uint                     public shrd;   // share profit % denumerator
    mapping(address => uint) public rad;    // mapping from member to its dai balance in rad

    VatLike                   public vat;
    BCdpManager               public man;
    SpotLike                  public spot;
    JugLike                   public jug;
    address                   public jar;
    DaiToUsdPriceFeed         public dai2usd;

    mapping(uint => CdpData)  internal cdpData;

    mapping(bytes32 => OSMLike) public osm; // mapping from ilk to osm

    struct CdpData {
        uint       art;        // topup in art units
        uint       cushion;    // cushion in rad units
        address[]  members;    // liquidators that are in
        uint[]     bite;       // how much was already bitten
    }

    modifier ONLYMEMBER979 {	//inject NONSTANDARD NAMING
        bool member = false;
        for(uint i = 0 ; i < members.length ; i++) {
            if(members[i] == msg.sender) {
                member = true;
                break;
            }
        }
        require(member, "not-member");
        _;
    }

    constructor(address vat_, address jar_, address spot_, address jug_, address dai2usd_) public {
        spot = SpotLike(spot_);
        jug = JugLike(jug_);
        vat = VatLike(vat_);
        jar = jar_;
        dai2usd = DaiToUsdPriceFeed(dai2usd_);
    }

    function GETCDPDATA2(uint cdp) external view returns(uint art, uint cushion, address[] memory members_, uint[] memory bite) {	//inject NONSTANDARD NAMING
        art = cdpData[cdp].art;
        cushion = cdpData[cdp].cushion;
        members_ = cdpData[cdp].members;
        bite = cdpData[cdp].bite;
    }

    function SETCDPMANAGER308(BCdpManager man_) external AUTH533 NOTE236 {	//inject NONSTANDARD NAMING
        man = man_;
        vat.HOPE790(address(man));
    }

    function SETOSM357(bytes32 ilk_, address  osm_) external AUTH533 NOTE236 {	//inject NONSTANDARD NAMING
        osm[ilk_] = OSMLike(osm_);
    }

    function SETMEMBERS717(address[] calldata members_) external AUTH533 NOTE236 {	//inject NONSTANDARD NAMING
        members = members_;
    }

    function SETILK760(bytes32 ilk, bool set) external AUTH533 NOTE236 {	//inject NONSTANDARD NAMING
        ilks[ilk] = set;
    }

    function SETMINART948(uint minArt_) external AUTH533 NOTE236 {	//inject NONSTANDARD NAMING
        minArt = minArt_;
    }

    function SETDAITOUSDPRICEFEED593(address dai2usd_) external AUTH533 NOTE236 {	//inject NONSTANDARD NAMING
        dai2usd = DaiToUsdPriceFeed(dai2usd_);
    }

    function SETPROFITPARAMS627(uint num, uint den) external AUTH533 NOTE236 {	//inject NONSTANDARD NAMING
        require(num < den, "invalid-profit-params");
        shrn = num;
        shrd = den;
    }

    function EMERGENCYEXECUTE288(address target, bytes calldata data) external AUTH533 NOTE236 {	//inject NONSTANDARD NAMING
        (bool succ,) = target.call(data);
        require(succ, "emergencyExecute: failed");
    }

    function DEPOSIT469(uint radVal) external ONLYMEMBER979 NOTE236 {	//inject NONSTANDARD NAMING
        vat.MOVE492(msg.sender, address(this), radVal);
        rad[msg.sender] = ADD873(rad[msg.sender], radVal);
    }

    function WITHDRAW47(uint radVal) external NOTE236 {	//inject NONSTANDARD NAMING
        require(rad[msg.sender] >= radVal, "withdraw: insufficient-balance");
        rad[msg.sender] = SUB60(rad[msg.sender], radVal);
        vat.MOVE492(address(this), msg.sender, radVal);
    }

    function GETINDEX676(address[] storage array, address elm) internal view returns(uint) {	//inject NONSTANDARD NAMING
        for(uint i = 0 ; i < array.length ; i++) {
            if(array[i] == elm) return i;
        }

        return uint(-1);
    }

    function REMOVEELEMENT600(address[] memory array, uint index) internal pure returns(address[] memory newArray) {	//inject NONSTANDARD NAMING
        if(index >= array.length) {
            newArray = array;
        }
        else {
            newArray = new address[](array.length - 1);
            for(uint i = 0 ; i < array.length ; i++) {
                if(i == index) continue;
                if(i < index) newArray[i] = array[i];
                else newArray[i-1] = array[i];
            }
        }
    }

    function CHOOSEMEMBER820(uint cdp, uint radVal, address[] memory candidates) public view returns(address[] memory winners) {	//inject NONSTANDARD NAMING
        if(candidates.length == 0) return candidates;
        // A bit of randomness to choose winners. We don't need pure randomness, its ok even if a
        // liquidator can predict his winning in the future.
        uint chosen = uint(keccak256(abi.encodePacked(cdp, now / 1 hours))) % candidates.length;
        address winner = candidates[chosen];

        if(rad[winner] < radVal) return CHOOSEMEMBER820(cdp, radVal, REMOVEELEMENT600(candidates, chosen));

        winners = new address[](1);
        winners[0] = candidates[chosen];
        return winners;
    }

    function CHOOSEMEMBERS125(uint radVal, address[] memory candidates) public view returns(address[] memory winners) {	//inject NONSTANDARD NAMING
        if(candidates.length == 0) return candidates;

        uint need = ADD873(1, radVal / candidates.length);
        for(uint i = 0 ; i < candidates.length ; i++) {
            if(rad[candidates[i]] < need) {
                return CHOOSEMEMBERS125(radVal, REMOVEELEMENT600(candidates, i));
            }
        }

        winners = candidates;
    }

    function CALCCUSHION695(bytes32 ilk, uint ink, uint art, uint nextSpot) public view returns(uint dart, uint dtab) {	//inject NONSTANDARD NAMING
        (, uint prev, uint currSpot,,) = vat.ILKS516(ilk);
        if(currSpot <= nextSpot) return (0, 0);

        uint hop = uint(osm[ilk].HOP630());
        uint next = ADD873(uint(osm[ilk].ZZZ258()), hop);
        (uint duty, uint rho) = jug.ILKS516(ilk);

        require(next >= rho, "calcCushion: next-in-the-past");

        // note that makerdao governance could change jug.base() before the actual
        // liquidation happens. but there is 48 hours time lock on makerdao votes
        // so liquidators should withdraw their funds if they think such event will
        // happen
        uint nextRate = RMUL44(RPOW605(ADD873(jug.BASE597(), duty), next - rho, ray35), prev);
        uint nextnextRate = RMUL44(RPOW605(ADD873(jug.BASE597(), duty), hop, ray35), nextRate);

        if(MUL674(nextRate, art) > MUL674(ink, currSpot)) return (0, 0); // prevent L attack
        if(MUL674(nextRate, art) <= MUL674(ink, nextSpot)) return (0, 0);

        uint maxArt = MUL674(ink, nextSpot) / nextnextRate;
        dart = SUB60(art, maxArt);
        dart = ADD873(1 ether, dart); // compensate for rounding errors
        dtab = MUL674(dart, prev); // provide a cushion according to current rate
    }

    function HYPOTOPAMOUNT220(uint cdp) internal view returns(uint dart, uint dtab, uint art, bool should) {	//inject NONSTANDARD NAMING
        address urn = man.urns(cdp);
        bytes32 ilk = man.ilks(cdp);

        uint ink;
        (ink, art) = vat.URNS364(ilk, urn);

        if(! ilks[ilk]) return (0, 0, art, false);

        (bytes32 peep, bool valid) = osm[ilk].PEEP429();

        // price feed invalid
        if(! valid) return (0, 0, art, false);

        // too early to topup
        should = (now >= ADD873(uint(osm[ilk].ZZZ258()), uint(osm[ilk].HOP630())/2));

        (, uint mat) = spot.ILKS516(ilk);
        uint par = spot.PAR423();

        uint nextVatSpot = RDIV179(RDIV179(MUL674(uint(peep), uint(10 ** 9)), par), mat);

        (dart, dtab) = CALCCUSHION695(ilk, ink, art, nextVatSpot);
    }

    function TOPAMOUNT571(uint cdp) public view returns(uint dart, uint dtab, uint art) {	//inject NONSTANDARD NAMING
        bool should;
        (dart, dtab, art, should) = HYPOTOPAMOUNT220(cdp);
        if(! should) return (0, 0, art);
    }

    function RESETCDP701(uint cdp) internal {	//inject NONSTANDARD NAMING
        address[] memory winners = cdpData[cdp].members;

        if(winners.length == 0) return;

        uint art = cdpData[cdp].art;
        uint cushion = cdpData[cdp].cushion;

        uint perUserArt = cdpData[cdp].art / winners.length;
        for(uint i = 0 ; i < winners.length ; i++) {
            if(perUserArt <= cdpData[cdp].bite[i]) continue; // nothing to refund
            uint refundArt = SUB60(perUserArt, cdpData[cdp].bite[i]);
            rad[winners[i]] = ADD873(rad[winners[i]], MUL674(refundArt, cushion)/art);
        }

        cdpData[cdp].art = 0;
        cdpData[cdp].cushion = 0;
        delete cdpData[cdp].members;
        delete cdpData[cdp].bite;
    }

    function SETCDP978(uint cdp, address[] memory winners, uint art, uint dradVal) internal {	//inject NONSTANDARD NAMING
        uint drad = ADD873(1, dradVal / winners.length); // round up
        for(uint i = 0 ; i < winners.length ; i++) {
            rad[winners[i]] = SUB60(rad[winners[i]], drad);
        }

        cdpData[cdp].art = art;
        cdpData[cdp].cushion = dradVal;
        cdpData[cdp].members = winners;
        cdpData[cdp].bite = new uint[](winners.length);
    }

    function TOPUPINFO357(uint cdp) public view returns(uint dart, uint dtab, uint art, bool should, address[] memory winners) {	//inject NONSTANDARD NAMING
        (dart, dtab, art, should) = HYPOTOPAMOUNT220(cdp);
        if(art < minArt) {
            winners = CHOOSEMEMBER820(cdp, uint(dtab), members);
        }
        else winners = CHOOSEMEMBERS125(uint(dtab), members);
    }

    function TOPUP31(uint cdp) external ONLYMEMBER979 NOTE236 {	//inject NONSTANDARD NAMING
        require(man.cushion(cdp) == 0, "topup: already-topped");
        require(! man.BITTEN519(cdp), "topup: already-bitten");

        (uint dart, uint dtab, uint art, bool should, address[] memory winners) = TOPUPINFO357(cdp);

        require(should, "topup: no-need");
        require(dart > 0, "topup: 0-dart");

        RESETCDP701(cdp);

        require(winners.length > 0, "topup: members-are-broke");
        // for small amounts, only winner can topup
        if(art < minArt) require(winners[0] == msg.sender, "topup: only-winner-can-topup");

        SETCDP978(cdp, winners, uint(art), uint(dtab));

        man.TOPUP31(cdp, uint(dart));
    }

    function UNTOP279(uint cdp) external ONLYMEMBER979 NOTE236 {	//inject NONSTANDARD NAMING
        require(man.cushion(cdp) == 0, "untop: should-be-untopped-by-user");

        RESETCDP701(cdp);
    }

    function BITE312(uint cdp, uint dart, uint minInk) external ONLYMEMBER979 NOTE236 returns(uint dMemberInk){	//inject NONSTANDARD NAMING
        uint index = GETINDEX676(cdpData[cdp].members, msg.sender);
        uint availBite = AVAILBITE58(cdp, index);
        require(dart <= availBite, "bite: debt-too-small");

        cdpData[cdp].bite[index] = ADD873(cdpData[cdp].bite[index], dart);

        uint dink = man.BITE312(cdp, dart);

        // update user rad
        bytes32 ilk = man.ilks(cdp);
        (,uint rate,,,) = vat.ILKS516(ilk);
        uint cushionPortion = MUL674(cdpData[cdp].cushion, dart) / cdpData[cdp].art;
        rad[msg.sender] = SUB60(rad[msg.sender], SUB60(MUL674(dart, rate), cushionPortion));

        // DAI to USD rate, scale 1e18
        uint d2uPrice = dai2usd.GETMARKETPRICE345(dai_market_id975);

        // dMemberInk = debt * 1.065 * d2uPrice
        // dMemberInk = dink * (shrn/shrd) * (d2uPrice/1e18)
        dMemberInk = MUL674(MUL674(dink, shrn), d2uPrice) / MUL674(shrd, uint(1 ether));

        // To protect edge case when 1 DAI > 1.13 USD
        if(dMemberInk > dink) dMemberInk = dink;

        // Remaining to Jar
        uint userInk = SUB60(dink, dMemberInk);

        require(dMemberInk >= minInk, "bite: low-dink");

        vat.FLUX692(ilk, address(this), jar, userInk);
        vat.FLUX692(ilk, address(this), msg.sender, dMemberInk);
    }

    function AVAILBITE58(uint cdp, address member) public view returns (uint) {	//inject NONSTANDARD NAMING
        uint index = GETINDEX676(cdpData[cdp].members, member);
        return AVAILBITE58(cdp, index);
    }

    function AVAILBITE58(uint cdp, uint index) internal view returns (uint) {	//inject NONSTANDARD NAMING
        if(index == uint(-1)) return 0;

        uint numMembers = cdpData[cdp].members.length;

        uint maxArt = cdpData[cdp].art / numMembers;
        // give dust to first member
        if(index == 0) {
            uint dust = cdpData[cdp].art % numMembers;
            maxArt = ADD873(maxArt, dust);
        }
        uint availArt = SUB60(maxArt, cdpData[cdp].bite[index]);

        address urn = man.urns(cdp);
        bytes32 ilk = man.ilks(cdp);
        (,uint art) = vat.URNS364(ilk, urn);
        uint remainingArt = ADD873(art, man.cushion(cdp));

        return availArt < remainingArt ? availArt : remainingArt;
    }
}

contract ChainlinkLike {
    function LATESTANSWER193() external view returns (int256);	//inject NONSTANDARD NAMING
}

contract LiquidatorInfo is Math {
    struct VaultInfo {
        bytes32 collateralType;
        uint collateralInWei;
        uint debtInDaiWei;
        uint liquidationPrice;
        uint expectedEthReturnWithCurrentPrice;
        bool expectedEthReturnBetterThanChainlinkPrice;
    }

    struct CushionInfo {
        uint cushionSizeInWei;
        uint numLiquidators;

        uint cushionSizeInWeiIfAllHaveBalance;
        uint numLiquidatorsIfAllHaveBalance;

        bool shouldProvideCushion;
        bool shouldProvideCushionIfAllHaveBalance;

        uint minimumTimeBeforeCallingTopup;
        bool canCallTopupNow;

        bool shouldCallUntop;
        bool isToppedUp;
    }

    struct BiteInfo {
        uint availableBiteInArt;
        uint availableBiteInDaiWei;
        uint minimumTimeBeforeCallingBite;
        bool canCallBiteNow;
    }

    struct CdpInfo {
        uint cdp;
        uint blockNumber;
        VaultInfo vault;
        CushionInfo cushion;
        BiteInfo bite;
    }

    // Struct to store local vars. This avoid stack too deep error
    struct CdpDataVars {
        uint cdpArt;
        uint cushion;
         address[] cdpWinners;
         uint[] bite;
    }

    LiquidationMachine manager;
    VatLike public vat;
    Pool pool;
    SpotLike spot;
    ChainlinkLike chainlink;

    uint constant ray35 = 1e27;	//inject NONSTANDARD NAMING

    constructor(LiquidationMachine manager_, address chainlink_) public {
        manager = manager_;
        vat = VatLike(address(manager.vat()));
        pool = Pool(manager.pool());
        spot = SpotLike(address(pool.spot()));
        chainlink = ChainlinkLike(chainlink_);
    }

    function GETEXPECTEDETHRETURN727(bytes32 collateralType, uint daiDebt, uint currentPriceFeedValue) public returns(uint) {	//inject NONSTANDARD NAMING
        // get chope value
        (,uint chop,) = manager.end().CAT952().ILKS516(collateralType);
        uint biteIlk = MUL674(chop, daiDebt) / currentPriceFeedValue;

        // DAI to USD rate, scale 1e18
        uint d2uPrice = pool.dai2usd().GETMARKETPRICE345(pool.dai_market_id975());
        uint shrn = pool.shrn();
        uint shrd = pool.shrd();

        return MUL674(MUL674(biteIlk, shrn), d2uPrice) / MUL674(shrd, uint(1 ether));
    }

    function GETVAULTINFO801(uint cdp, uint currentPriceFeedValue) public returns(VaultInfo memory info) {	//inject NONSTANDARD NAMING
        address urn = manager.urns(cdp);
        info.collateralType = manager.ilks(cdp);

        uint cushion = manager.cushion(cdp);

        uint art;
        (info.collateralInWei, art) = vat.URNS364(info.collateralType, urn);
        if(info.collateralInWei == 0) return info;
        (,uint rate,,,) = vat.ILKS516(info.collateralType);
        info.debtInDaiWei = MUL674(ADD873(art, cushion), rate) / ray35;
        (, uint mat) = spot.ILKS516(info.collateralType);
        info.liquidationPrice = MUL674(info.debtInDaiWei, mat) / MUL674(info.collateralInWei, ray35 / 1e18);

        if(currentPriceFeedValue > 0) {
            info.expectedEthReturnWithCurrentPrice = GETEXPECTEDETHRETURN727(info.collateralType, info.debtInDaiWei, currentPriceFeedValue);
        }

        int chainlinkPrice = chainlink.LATESTANSWER193();
        uint chainlinkEthReturn = 0;
        if(chainlinkPrice > 0) {
            chainlinkEthReturn = MUL674(info.debtInDaiWei, uint(chainlinkPrice)) / 1 ether;
        }

        info.expectedEthReturnBetterThanChainlinkPrice =
            info.expectedEthReturnWithCurrentPrice > chainlinkEthReturn;
    }

    function GETCUSHIONINFO102(uint cdp, address me, uint numMembers) public view returns(CushionInfo memory info) {	//inject NONSTANDARD NAMING
        CdpDataVars memory c;
        (c.cdpArt, c.cushion, c.cdpWinners, c.bite) = pool.GETCDPDATA2(cdp);
        
        for(uint i = 0 ; i < c.cdpWinners.length ; i++) {
            if(me == c.cdpWinners[i]) {
                uint perUserArt = c.cdpArt / c.cdpWinners.length;
                info.shouldCallUntop = manager.cushion(cdp) == 0 && c.cushion > 0 && c.bite[i] < perUserArt;
                info.isToppedUp = c.bite[i] < perUserArt;
                break;
            }
        }

        (uint dart, uint dtab, uint art, bool should, address[] memory winners) = pool.TOPUPINFO357(cdp);

        info.numLiquidators = winners.length;
        info.cushionSizeInWei = dtab / ray35;

        if(dart == 0) {
            if(info.isToppedUp) {
                info.numLiquidatorsIfAllHaveBalance = winners.length;
                info.cushionSizeInWei = c.cushion / ray35;
            }

            return info;
        }

        if(art < pool.minArt()) {
            info.cushionSizeInWeiIfAllHaveBalance = info.cushionSizeInWei;
            info.numLiquidatorsIfAllHaveBalance = 1;
            info.shouldProvideCushion = false;
            for(uint i = 0 ; i < winners.length ; i++) {
                if(me == winners[i]) info.shouldProvideCushion = true;
            }

            uint chosen = uint(keccak256(abi.encodePacked(cdp, now / 1 hours))) % numMembers;
            info.shouldProvideCushionIfAllHaveBalance = (pool.members(chosen) == me);
        }
        else {
            info.cushionSizeInWeiIfAllHaveBalance = info.cushionSizeInWei / numMembers;
            info.numLiquidatorsIfAllHaveBalance = numMembers;
            info.shouldProvideCushion = true;
            info.shouldProvideCushionIfAllHaveBalance = true;
        }

        info.canCallTopupNow = !info.isToppedUp && should && info.shouldProvideCushion;

        bytes32 ilk = manager.ilks(cdp);
        uint topupTime = ADD873(uint(pool.osm(ilk).ZZZ258()), uint(pool.osm(ilk).HOP630())/2);
        info.minimumTimeBeforeCallingTopup = (now >= topupTime) ? 0 : SUB60(topupTime, now);
    }

    function GETBITEINFO42(uint cdp, address me) public view returns(BiteInfo memory info) {	//inject NONSTANDARD NAMING
        info.availableBiteInArt = pool.AVAILBITE58(cdp, me);

        bytes32 ilk = manager.ilks(cdp);
        uint priceUpdateTime = ADD873(uint(pool.osm(ilk).ZZZ258()), uint(pool.osm(ilk).HOP630()));
        info.minimumTimeBeforeCallingBite = (now >= priceUpdateTime) ? 0 : SUB60(priceUpdateTime, now);

        if(info.availableBiteInArt == 0) return info;

        address u = manager.urns(cdp);
        (,uint rate, uint currSpot,,) = vat.ILKS516(ilk);

        info.availableBiteInDaiWei = MUL674(rate, info.availableBiteInArt) / ray35;

        (uint ink, uint art) = vat.URNS364(ilk, u);
        uint cushion = manager.cushion(cdp);
        info.canCallBiteNow = (MUL674(ink, currSpot) < MUL674(ADD873(art, cushion), rate)) || manager.BITTEN519(cdp);
    }

    function GETNUMMEMBERS29() public returns(uint) {	//inject NONSTANDARD NAMING
        for(uint i = 0 ;                     ; i++) {
            (bool result,) = address(pool).call(abi.encodeWithSignature("members(uint256)", i));
            if(! result) return i;
        }
    }

    function GETCDPDATA2(uint startCdp, uint endCdp, address me, uint currentPriceFeedValue) public returns(CdpInfo[] memory info) {	//inject NONSTANDARD NAMING
        uint numMembers = GETNUMMEMBERS29();
        info = new CdpInfo[](ADD873(SUB60(endCdp, startCdp), uint(1)));
        for(uint cdp = startCdp ; cdp <= endCdp ; cdp++) {
            uint index = cdp - startCdp;
            info[index].cdp = cdp;
            info[index].blockNumber = block.number;
            info[index].vault = GETVAULTINFO801(cdp, currentPriceFeedValue);
            info[index].cushion = GETCUSHIONINFO102(cdp, me, numMembers);
            info[index].bite = GETBITEINFO42(cdp, me);
        }
    }
}

contract FlatLiquidatorInfo is LiquidatorInfo {
    constructor(LiquidationMachine manager_, address chainlink_) public LiquidatorInfo(manager_, chainlink_) {}

    function GETVAULTINFOFLAT448(uint cdp, uint currentPriceFeedValue) external	//inject NONSTANDARD NAMING
        returns(bytes32 collateralType, uint collateralInWei, uint debtInDaiWei, uint liquidationPrice,
                uint expectedEthReturnWithCurrentPrice, bool expectedEthReturnBetterThanChainlinkPrice) {
        VaultInfo memory info = GETVAULTINFO801(cdp, currentPriceFeedValue);
        collateralType = info.collateralType;
        collateralInWei = info.collateralInWei;
        debtInDaiWei = info.debtInDaiWei;
        liquidationPrice = info.liquidationPrice;
        expectedEthReturnWithCurrentPrice = info.expectedEthReturnWithCurrentPrice;
        expectedEthReturnBetterThanChainlinkPrice = info.expectedEthReturnBetterThanChainlinkPrice;
    }

    function GETCUSHIONINFOFLAT484(uint cdp, address me, uint numMembers) external view	//inject NONSTANDARD NAMING
        returns(uint cushionSizeInWei, uint numLiquidators, uint cushionSizeInWeiIfAllHaveBalance,
                uint numLiquidatorsIfAllHaveBalance, bool shouldProvideCushion, bool shouldProvideCushionIfAllHaveBalance,
                bool canCallTopupNow, bool shouldCallUntop, uint minimumTimeBeforeCallingTopup,
                bool isToppedUp) {

        CushionInfo memory info = GETCUSHIONINFO102(cdp, me, numMembers);
        cushionSizeInWei = info.cushionSizeInWei;
        numLiquidators = info.numLiquidators;
        cushionSizeInWeiIfAllHaveBalance = info.cushionSizeInWeiIfAllHaveBalance;
        numLiquidatorsIfAllHaveBalance = info.numLiquidatorsIfAllHaveBalance;
        shouldProvideCushion = info.shouldProvideCushion;
        shouldProvideCushionIfAllHaveBalance = info.shouldProvideCushionIfAllHaveBalance;
        canCallTopupNow = info.canCallTopupNow;
        shouldCallUntop = info.shouldCallUntop;
        minimumTimeBeforeCallingTopup = info.minimumTimeBeforeCallingTopup;
        isToppedUp = info.isToppedUp;
    }

    function GETBITEINFOFLAT981(uint cdp, address me) external view	//inject NONSTANDARD NAMING
        returns(uint availableBiteInArt, uint availableBiteInDaiWei, bool canCallBiteNow,uint minimumTimeBeforeCallingBite) {
        BiteInfo memory info = GETBITEINFO42(cdp, me);
        availableBiteInArt = info.availableBiteInArt;
        availableBiteInDaiWei = info.availableBiteInDaiWei;
        canCallBiteNow = info.canCallBiteNow;
        minimumTimeBeforeCallingBite = info.minimumTimeBeforeCallingBite;
    }
}

contract ERC20Like {
    function BALANCEOF113(address guy) public view returns(uint);	//inject NONSTANDARD NAMING
}

contract VatBalanceLike {
    function GEM278(bytes32 ilk, address user) external view returns(uint);	//inject NONSTANDARD NAMING
    function DAI993(address user) external view returns(uint);	//inject NONSTANDARD NAMING
}

contract LiquidatorBalanceInfo {
    struct BalanceInfo {
        uint blockNumber;
        uint ethBalance;
        uint wethBalance;
        uint daiBalance;
        uint vatDaiBalanceInWei;
        uint vatEthBalanceInWei;
        uint poolDaiBalanceInWei;
    }

    uint constant ray35 = 1e27;	//inject NONSTANDARD NAMING

    function GETBALANCEINFO53(address me, address pool, address vat, bytes32 ilk, address dai, address weth)	//inject NONSTANDARD NAMING
        public view returns(BalanceInfo memory info) {

        info.blockNumber = block.number;
        info.ethBalance = me.balance;
        info.wethBalance = ERC20Like(weth).BALANCEOF113(me);
        info.daiBalance = ERC20Like(dai).BALANCEOF113(me);
        info.vatDaiBalanceInWei = VatBalanceLike(vat).DAI993(me) / ray35;
        info.vatEthBalanceInWei = VatBalanceLike(vat).GEM278(ilk, me);
        info.poolDaiBalanceInWei = Pool(pool).rad(me) / ray35;
    }

    function GETBALANCEINFOFLAT564(address me, address pool, address vat, bytes32 ilk, address dai, address weth)	//inject NONSTANDARD NAMING
        public view returns(uint blockNumber, uint ethBalance, uint wethBalance, uint daiBalance, uint vatDaiBalanceInWei,
                            uint vatEthBalanceInWei, uint poolDaiBalanceInWei) {

        BalanceInfo memory info = GETBALANCEINFO53(me, pool, vat, ilk, dai, weth);
        blockNumber = info.blockNumber;
        ethBalance = info.ethBalance;
        wethBalance = info.wethBalance;
        daiBalance = info.daiBalance;
        vatDaiBalanceInWei = info.vatDaiBalanceInWei;
        vatEthBalanceInWei = info.vatEthBalanceInWei;
        poolDaiBalanceInWei = info.poolDaiBalanceInWei;
    }
}