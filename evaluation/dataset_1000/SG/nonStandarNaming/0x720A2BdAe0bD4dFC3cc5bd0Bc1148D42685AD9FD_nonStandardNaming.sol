                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity ^0.5.12;
pragma experimental ABIEncoderV2;

contract Math {
    // --- Math ---
    function ADD646(uint x, int y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = x + uint(y);
        require(y >= 0 || z <= x);
        require(y <= 0 || z >= x);
    }
    function SUB127(uint x, int y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = x - uint(y);
        require(y <= 0 || z <= x);
        require(y >= 0 || z >= x);
    }
    function MUL761(uint x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        z = int(x) * y;
        require(int(x) >= 0);
        require(y == 0 || z / y == int(x));
    }
    function ADD646(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x);
    }
    function SUB127(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x);
    }
    function MUL761(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x);
    }

    uint constant ray388 = 10 ** 27;	//inject NONSTANDARD NAMING

    function RDIV963(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = MUL761(x, ray388) / y;
    }
    function RMUL402(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = MUL761(x, y) / ray388;
    }
    function RPOW75(uint x, uint n, uint b) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
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

    function TOINT293(uint x) internal pure returns (int y) {	//inject NONSTANDARD NAMING
        y = int(x);
        require(y >= 0);
    }
}


contract LibNote {
    event LOGNOTE598(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier NOTE230 {	//inject NONSTANDARD NAMING
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
    function UPDATESCORE24(uint cdp, bytes32 ilk, int dink, int dart, uint time) external;	//inject NONSTANDARD NAMING
}

contract BCdpScoreConnector {
    BCdpScoreLike public score;
    mapping(uint => uint) public left;

    constructor(BCdpScoreLike score_) public {
        score = score_;
    }

    function SETSCORE929(BCdpScoreLike bcdpScore) internal {	//inject NONSTANDARD NAMING
        score = bcdpScore;
    }

    function UPDATESCORE24(uint cdp, bytes32 ilk, int dink, int dart, uint time) internal {	//inject NONSTANDARD NAMING
        if(left[cdp] == 0) score.UPDATESCORE24(cdp, ilk, dink, dart, time);
    }

    function QUITSCORE954(uint cdp) internal {	//inject NONSTANDARD NAMING
        if(left[cdp] == 0) left[cdp] = now;
    }
}



contract UrnHandler {
    constructor(address vat) public {
        VatLike(vat).HOPE65(msg.sender);
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

    event NEWCDP826(address indexed usr, address indexed own, uint indexed cdp);	//inject NONSTANDARD NAMING

    modifier CDPALLOWED901(	//inject NONSTANDARD NAMING
        uint cdp
    ) {
        require(msg.sender == owns[cdp] || cdpCan[owns[cdp]][cdp][msg.sender] == 1, "cdp-not-allowed");
        _;
    }

    modifier URNALLOWED115(	//inject NONSTANDARD NAMING
        address urn
    ) {
        require(msg.sender == urn || urnCan[urn][msg.sender] == 1, "urn-not-allowed");
        _;
    }

    constructor(address vat_) public {
        vat = vat_;
    }

    function ADD646(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x);
    }

    function SUB127(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x);
    }

    function TOINT293(uint x) internal pure returns (int y) {	//inject NONSTANDARD NAMING
        y = int(x);
        require(y >= 0);
    }

    // Allow/disallow a usr address to manage the cdp.
    function CDPALLOW310(	//inject NONSTANDARD NAMING
        uint cdp,
        address usr,
        uint ok
    ) public CDPALLOWED901(cdp) {
        cdpCan[owns[cdp]][cdp][usr] = ok;
    }

    // Allow/disallow a usr address to quit to the the sender urn.
    function URNALLOW82(	//inject NONSTANDARD NAMING
        address usr,
        uint ok
    ) public {
        urnCan[msg.sender][usr] = ok;
    }

    // Open a new cdp for a given usr address.
    function OPEN884(	//inject NONSTANDARD NAMING
        bytes32 ilk,
        address usr
    ) public NOTE230 returns (uint) {
        require(usr != address(0), "usr-address-0");

        cdpi = ADD646(cdpi, 1);
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
        count[usr] = ADD646(count[usr], 1);

        emit NEWCDP826(msg.sender, usr, cdpi);
        return cdpi;
    }

    // Give the cdp ownership to a dst address.
    function GIVE724(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst
    ) public NOTE230 CDPALLOWED901(cdp) {
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
        count[owns[cdp]] = SUB127(count[owns[cdp]], 1);

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
        count[dst] = ADD646(count[dst], 1);
    }

    // Frob the cdp keeping the generated DAI or collateral freed in the cdp urn address.
    function FROB520(	//inject NONSTANDARD NAMING
        uint cdp,
        int dink,
        int dart
    ) public NOTE230 CDPALLOWED901(cdp) {
        address urn = urns[cdp];
        VatLike(vat).FROB520(
            ilks[cdp],
            urn,
            urn,
            urn,
            dink,
            dart
        );
    }

    // Transfer wad amount of cdp collateral from the cdp address to a dst address.
    function FLUX839(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst,
        uint wad
    ) public NOTE230 CDPALLOWED901(cdp) {
        VatLike(vat).FLUX839(ilks[cdp], urns[cdp], dst, wad);
    }

    // Transfer wad amount of any type of collateral (ilk) from the cdp address to a dst address.
    // This function has the purpose to take away collateral from the system that doesn't correspond to the cdp but was sent there wrongly.
    function FLUX839(	//inject NONSTANDARD NAMING
        bytes32 ilk,
        uint cdp,
        address dst,
        uint wad
    ) public NOTE230 CDPALLOWED901(cdp) {
        VatLike(vat).FLUX839(ilk, urns[cdp], dst, wad);
    }

    // Transfer wad amount of DAI from the cdp address to a dst address.
    function MOVE577(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst,
        uint rad
    ) public NOTE230 CDPALLOWED901(cdp) {
        VatLike(vat).MOVE577(urns[cdp], dst, rad);
    }

    // Quit the system, migrating the cdp (ink, art) to a different dst urn
    function QUIT56(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst
    ) public NOTE230 CDPALLOWED901(cdp) URNALLOWED115(dst) {
        (uint ink, uint art) = VatLike(vat).URNS947(ilks[cdp], urns[cdp]);
        VatLike(vat).FORK281(
            ilks[cdp],
            urns[cdp],
            dst,
            TOINT293(ink),
            TOINT293(art)
        );
    }

    // Import a position from src urn to the urn owned by cdp
    function ENTER344(	//inject NONSTANDARD NAMING
        address src,
        uint cdp
    ) public NOTE230 URNALLOWED115(src) CDPALLOWED901(cdp) {
        (uint ink, uint art) = VatLike(vat).URNS947(ilks[cdp], src);
        VatLike(vat).FORK281(
            ilks[cdp],
            src,
            urns[cdp],
            TOINT293(ink),
            TOINT293(art)
        );
    }

    // Move a position from cdpSrc urn to the cdpDst urn
    function SHIFT158(	//inject NONSTANDARD NAMING
        uint cdpSrc,
        uint cdpDst
    ) public NOTE230 CDPALLOWED901(cdpSrc) CDPALLOWED901(cdpDst) {
        require(ilks[cdpSrc] == ilks[cdpDst], "non-matching-cdps");
        (uint ink, uint art) = VatLike(vat).URNS947(ilks[cdpSrc], urns[cdpSrc]);
        VatLike(vat).FORK281(
            ilks[cdpSrc],
            urns[cdpSrc],
            urns[cdpDst],
            TOINT293(ink),
            TOINT293(art)
        );
    }
}


interface DSAuthority {
    function CANCALL916(	//inject NONSTANDARD NAMING
        address src, address dst, bytes4 sig
    ) external view returns (bool);
}

contract DSAuthEvents {
    event LOGSETAUTHORITY248 (address indexed authority);	//inject NONSTANDARD NAMING
    event LOGSETOWNER100     (address indexed owner);	//inject NONSTANDARD NAMING
}

contract DSAuth is DSAuthEvents {
    DSAuthority  public  authority;
    address      public  owner;

    constructor() public {
        owner = msg.sender;
        emit LOGSETOWNER100(msg.sender);
    }

    function SETOWNER227(address owner_)	//inject NONSTANDARD NAMING
        public
        AUTH523
    {
        owner = owner_;
        emit LOGSETOWNER100(owner);
    }

    function SETAUTHORITY722(DSAuthority authority_)	//inject NONSTANDARD NAMING
        public
        AUTH523
    {
        authority = authority_;
        emit LOGSETAUTHORITY248(address(authority));
    }

    modifier AUTH523 {	//inject NONSTANDARD NAMING
        require(ISAUTHORIZED361(msg.sender, msg.sig), "ds-auth-unauthorized");
        _;
    }

    function ISAUTHORIZED361(address src, bytes4 sig) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (src == address(this)) {
            return true;
        } else if (src == owner) {
            return true;
        } else if (authority == DSAuthority(0)) {
            return false;
        } else {
            return authority.CANCALL916(src, address(this), sig);
        }
    }
}


contract VatLike {
    function URNS947(bytes32, address) public view returns (uint, uint);	//inject NONSTANDARD NAMING
    function HOPE65(address) external;	//inject NONSTANDARD NAMING
    function FLUX839(bytes32, address, address, uint) public;	//inject NONSTANDARD NAMING
    function MOVE577(address, address, uint) public;	//inject NONSTANDARD NAMING
    function FROB520(bytes32, address, address, address, int, int) public;	//inject NONSTANDARD NAMING
    function FORK281(bytes32, address, address, int, int) public;	//inject NONSTANDARD NAMING
    function ILKS523(bytes32 ilk) public view returns(uint Art, uint rate, uint spot, uint line, uint dust);	//inject NONSTANDARD NAMING
    function DAI818(address usr) external view returns(uint);	//inject NONSTANDARD NAMING
}

contract CatLike {
    function ILKS523(bytes32) public returns(address flip, uint256 chop, uint256 lump);	//inject NONSTANDARD NAMING
}

contract EndLike {
    function CAT770() public view returns(CatLike);	//inject NONSTANDARD NAMING
}

contract PriceFeedLike {
    function READ16(bytes32 ilk) external view returns(bytes32);	//inject NONSTANDARD NAMING
}

contract LiquidationMachine is DssCdpManager, BCdpScoreConnector, Math {
    VatLike                   public vat;
    EndLike                   public end;
    address                   public pool;
    PriceFeedLike             public real;

    mapping(uint => uint)     public tic;  // time of bite
    mapping(uint => uint)     public cushion; // how much was topped in art units

    uint constant             public grace982 = 1 hours;	//inject NONSTANDARD NAMING
    uint constant             public wad748 = 1e18;	//inject NONSTANDARD NAMING

    mapping (uint => bool)    public out;

    modifier ONLYPOOL394 {	//inject NONSTANDARD NAMING
        require(msg.sender == pool, "not-pool");
        _;
    }

    constructor(VatLike vat_, EndLike end_, address pool_, PriceFeedLike real_) public {
        vat = vat_;
        end = end_;
        pool = pool_;
        real = real_;
    }

    function SETPOOL877(address newPool) internal {	//inject NONSTANDARD NAMING
        pool = newPool;
    }

    function QUITBLIQUIDATION171(uint cdp) internal {	//inject NONSTANDARD NAMING
        UNTOP663(cdp);
        out[cdp] = true;
    }

    function TOPUP157(uint cdp, uint dtopup) external ONLYPOOL394 {	//inject NONSTANDARD NAMING
        if(out[cdp]) return;

        address urn = urns[cdp];
        bytes32 ilk = ilks[cdp];

        (, uint rate,,,) = vat.ILKS523(ilk);
        uint dtab = MUL761(rate, dtopup);

        vat.MOVE577(pool, address(this), dtab);
        vat.FROB520(ilk, urn, urn, address(this), 0, -TOINT293(dtopup));

        cushion[cdp] = ADD646(cushion[cdp], dtopup);
    }

    function BITTEN496(uint cdp) public view returns(bool) {	//inject NONSTANDARD NAMING
        return tic[cdp] + grace982 > now;
    }

    function UNTOP663(uint cdp) internal {	//inject NONSTANDARD NAMING
        require(! BITTEN496(cdp), "untop: cdp was already bitten");

        uint top = cushion[cdp];
        if(top == 0) return; // nothing to do

        bytes32 ilk = ilks[cdp];
        address urn = urns[cdp];

        (, uint rate,,,) = vat.ILKS523(ilk);
        uint dtab = MUL761(rate, top);

        cushion[cdp] = 0;

        // move topping to pool
        vat.FROB520(ilk, urn, urn, urn, 0, TOINT293(top));
        vat.MOVE577(urn, pool, dtab);
    }

    function UNTOPBYPOOL15(uint cdp) external ONLYPOOL394 {	//inject NONSTANDARD NAMING
        UNTOP663(cdp);
    }

    function DOBITE150(uint dart, bytes32 ilk, address urn, uint dink) internal {	//inject NONSTANDARD NAMING
        (, uint rate,,,) = vat.ILKS523(ilk);
        uint dtab = MUL761(rate, dart);

        vat.MOVE577(pool, address(this), dtab);

        vat.FROB520(ilk, urn, urn, address(this), 0, -TOINT293(dart));
        vat.FROB520(ilk, urn, msg.sender, urn, -TOINT293(dink), 0);
    }

    function CALCDINK751(uint dart, uint rate, bytes32 ilk) internal returns(uint dink) {	//inject NONSTANDARD NAMING
        (, uint chop,) = end.CAT770().ILKS523(ilk);
        uint tab = MUL761(MUL761(dart, rate), chop) / wad748;
        bytes32 realtimePrice = real.READ16(ilk);

        dink = RMUL402(tab, wad748) / uint(realtimePrice);
    }

    function BITE249(uint cdp, uint dart) external ONLYPOOL394 returns(uint dink){	//inject NONSTANDARD NAMING
        address urn = urns[cdp];
        bytes32 ilk = ilks[cdp];

        (uint ink, uint art) = vat.URNS947(ilk, urn);
        art = ADD646(art, cushion[cdp]);
        (, uint rate, uint spotValue,,) = vat.ILKS523(ilk);

        require(dart <= art, "debt is too low");

        // verify cdp is unsafe now
        if(! BITTEN496(cdp)) {
            require(MUL761(art, rate) > MUL761(ink, spotValue), "bite: cdp is safe");
            require(cushion[cdp] > 0, "bite: not-topped");
            tic[cdp] = now;
        }

        dink = CALCDINK751(dart, rate, ilk);
        UPDATESCORE24(cdp, ilk, -TOINT293(dink), -TOINT293(dart), now);

        uint usedCushion = MUL761(cushion[cdp], dart) / art;
        cushion[cdp] = SUB127(cushion[cdp], usedCushion);
        uint bart = SUB127(dart, usedCushion);

        DOBITE150(bart, ilk, urn, dink);
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
    function FROB520(	//inject NONSTANDARD NAMING
        uint cdp,
        int dink,
        int dart
    ) public CDPALLOWED901(cdp) {
        bytes32 ilk = ilks[cdp];

        UNTOP663(cdp);
        UPDATESCORE24(cdp, ilk, dink, dart, now);

        super.FROB520(cdp, dink, dart);
    }

    // Quit the system, migrating the cdp (ink, art) to a different dst urn
    function QUIT56(	//inject NONSTANDARD NAMING
        uint cdp,
        address dst
    ) public CDPALLOWED901(cdp) URNALLOWED115(dst) {
        address urn = urns[cdp];
        bytes32 ilk = ilks[cdp];

        UNTOP663(cdp);
        (uint ink, uint art) = vat.URNS947(ilk, urn);
        UPDATESCORE24(cdp, ilk, -TOINT293(ink), -TOINT293(art), now);

        super.QUIT56(cdp, dst);
    }

    // Import a position from src urn to the urn owned by cdp
    function ENTER344(	//inject NONSTANDARD NAMING
        address src,
        uint cdp
    ) public URNALLOWED115(src) CDPALLOWED901(cdp) {
        bytes32 ilk = ilks[cdp];

        UNTOP663(cdp);
        (uint ink, uint art) = vat.URNS947(ilk, src);
        UPDATESCORE24(cdp, ilk, TOINT293(ink), TOINT293(art), now);

        super.ENTER344(src, cdp);
    }

    // Move a position from cdpSrc urn to the cdpDst urn
    function SHIFT158(	//inject NONSTANDARD NAMING
        uint cdpSrc,
        uint cdpDst
    ) public CDPALLOWED901(cdpSrc) CDPALLOWED901(cdpDst) {
        bytes32 ilkSrc = ilks[cdpSrc];

        UNTOP663(cdpSrc);
        UNTOP663(cdpDst);

        address src = urns[cdpSrc];

        (uint inkSrc, uint artSrc) = vat.URNS947(ilkSrc, src);

        UPDATESCORE24(cdpSrc, ilkSrc, -TOINT293(inkSrc), -TOINT293(artSrc), now);
        UPDATESCORE24(cdpDst, ilkSrc, TOINT293(inkSrc), TOINT293(artSrc), now);

        super.SHIFT158(cdpSrc, cdpDst);
    }

                                                                                

    function QUITB483(uint cdp) external CDPALLOWED901(cdp) NOTE230 {	//inject NONSTANDARD NAMING
        QUITSCORE954(cdp);
        QUITBLIQUIDATION171(cdp);
    }

    function SETSCORECONTRACT96(BCdpScoreLike _score) external AUTH523 {	//inject NONSTANDARD NAMING
        super.SETSCORE929(_score);
    }

    function SETPOOLCONTRACT301(address _pool) external AUTH523 {	//inject NONSTANDARD NAMING
        super.SETPOOL877(_pool);
    }
}

contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER847() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA69() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED407(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER847();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED407(address(0), msgSender);
    }

                                                                     
    function OWNER911() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER99() {	//inject NONSTANDARD NAMING
        require(ISOWNER735(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER735() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER847() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP80() public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED407(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP646(address newOwner) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP252(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP252(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED407(_owner, newOwner);
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

    bytes32 constant public global_user189 = bytes32(0x0);	//inject NONSTANDARD NAMING

    uint public start; // start time of the campaign;

    function SPIN787() external ONLYOWNER99 { // start a new round	//inject NONSTANDARD NAMING
        start = now;
    }

    function ASSETSCORE907(AssetScore storage score, uint time, uint spinStart) internal view returns(uint) {	//inject NONSTANDARD NAMING
        uint last = score.last;
        uint currentScore = score.score;
        if(last < spinStart) {
            last = spinStart;
            currentScore = 0;
        }

        return ADD646(currentScore, MUL761(score.balance, SUB127(time, last)));
    }

    function ADDCHECKPOINT83(bytes32 user, bytes32 asset) internal {	//inject NONSTANDARD NAMING
        checkpoints[user][asset].push(userScore[user][asset]);
    }

    function UPDATEASSETSCORE396(bytes32 user, bytes32 asset, int dbalance, uint time) internal {	//inject NONSTANDARD NAMING
        AssetScore storage score = userScore[user][asset];

        if(score.last < start) ADDCHECKPOINT83(user, asset);

        score.score = ASSETSCORE907(score, time, start);
        score.balance = ADD646(score.balance, dbalance);
        
        score.last = time;
    }

    function UPDATESCORE24(bytes32 user, bytes32 asset, int dbalance, uint time) internal {	//inject NONSTANDARD NAMING
        UPDATEASSETSCORE396(user, asset, dbalance, time);
        UPDATEASSETSCORE396(global_user189, asset, dbalance, time);
    }

    function GETSCORE912(bytes32 user, bytes32 asset, uint time, uint spinStart, uint checkPointHint) public view returns(uint score) {	//inject NONSTANDARD NAMING
        if(time >= userScore[user][asset].last) return ASSETSCORE907(userScore[user][asset], time, spinStart);

        // else - check the checkpoints
        uint checkpointsLen = checkpoints[user][asset].length;
        if(checkpointsLen == 0) return 0;

        // hint is invalid
        if(checkpoints[user][asset][checkPointHint].last < time) checkPointHint = checkpointsLen - 1;

        for(uint i = checkPointHint ; ; i--){
            if(checkpoints[user][asset][i].last <= time) return ASSETSCORE907(checkpoints[user][asset][i], time, spinStart);
        }

        // this supposed to be unreachable
        return 0;
    }

    function GETCURRENTBALANCE338(bytes32 user, bytes32 asset) public view returns(uint balance) {	//inject NONSTANDARD NAMING
        balance = userScore[user][asset].balance;
    }

    // Math functions without errors
    // ==============================
    function ADD646(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = x + y;
        if(!(z >= x)) return 0;

        return z;
    }

    function ADD646(uint x, int y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = x + uint(y);
        if(!(y >= 0 || z <= x)) return 0;
        if(!(y <= 0 || z >= x)) return 0;

        return z;
    }

    function SUB127(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        if(!(y <= x)) return 0;
        z = x - y;

        return z;
    }

    function MUL761(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        if (x == 0) return 0;

        z = x * y;
        if(!(z / x == y)) return 0;

        return z;
    }
}


contract BCdpScore is ScoringMachine {
    BCdpManager public manager;

    modifier ONLYMANAGER887 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(manager), "not-manager");
        _;
    }

    function SETMANAGER443(address newManager) external ONLYOWNER99 {	//inject NONSTANDARD NAMING
        manager = BCdpManager(newManager);
    }

    function USER136(uint cdp) public pure returns(bytes32) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encodePacked("BCdpScore", cdp));
    }

    function ARTASSET930(bytes32 ilk) public pure returns(bytes32) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encodePacked("BCdpScore", "art", ilk));
    }

    function UPDATESCORE24(uint cdp, bytes32 ilk, int dink, int dart, uint time) external ONLYMANAGER887 {	//inject NONSTANDARD NAMING
        dink; // shh compiler warning
        UPDATESCORE24(USER136(cdp), ARTASSET930(ilk), dart, time);
    }

    function SLASHSCORE320(uint maliciousCdp) external {	//inject NONSTANDARD NAMING
        address urn = manager.urns(maliciousCdp);
        bytes32 ilk = manager.ilks(maliciousCdp);

        (, uint realArt) = manager.vat().URNS947(ilk, urn);

        bytes32 maliciousUser = USER136(maliciousCdp);
        bytes32 asset = ARTASSET930(ilk);

        uint left = BCdpScoreConnector(address(manager)).left(maliciousCdp);

        realArt = left > 0 ? 0 : realArt;
        uint startTime = left > 0 ? left : now;

        uint calculatedArt = GETCURRENTBALANCE338(maliciousUser, asset);
        require(realArt < calculatedArt, "slashScore-cdp-is-ok");
        int dart = int(realArt) - int(calculatedArt);
        uint time = SUB127(startTime, 30 days);
        if(time < start) time = start;
        
        UPDATESCORE24(maliciousUser, asset, dart, time);
    }

    function GETARTSCORE236(uint cdp, bytes32 ilk, uint time, uint spinStart) public view returns(uint) {	//inject NONSTANDARD NAMING
        return GETSCORE912(USER136(cdp), ARTASSET930(ilk), time, spinStart, 0);
    }

    function GETARTGLOBALSCORE773(bytes32 ilk, uint time, uint spinStart) public view returns(uint) {	//inject NONSTANDARD NAMING
        return GETSCORE912(global_user189, ARTASSET930(ilk), time, spinStart, 0);
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

    function SETMANAGER443(address _manager) public {	//inject NONSTANDARD NAMING
        require(man == BCdpManager(0), "manager-already-set");
        man = BCdpManager(_manager);
        score = BCdpScore(address(man.score()));
    }

    // callable by anyone
    function SPIN787() public {	//inject NONSTANDARD NAMING
        if(round == 0) {
            round++;
            score.SPIN787();
            start[0] = score.start();
        }
        if(round == 1 && now > end[0]) {
            round++;
            score.SPIN787();
            start[1] = score.start();
        }
        if(round == 2 && now > end[1]) {
            round++;        
            // score is not counted anymore, and this must be followed by contract upgrade
            score.SPIN787();
        }
    }

    function GETUSERSCORE694(bytes32 user) external view returns (uint) {	//inject NONSTANDARD NAMING
        if(round == 0) return 0;

        uint cdp = uint(user);
        bytes32 ilk = man.ilks(cdp);

        // Should return 0 score for unsupported ilk
        if( ! milks[ilk]) return 0;

        if(round == 1) return 2 * score.GETARTSCORE236(cdp, ilk, now, start[0]);

        uint firstRoundScore = 2 * score.GETARTSCORE236(cdp, ilk, start[1], start[0]);
        uint time = now;
        if(round > 2) time = end[1];

        return ADD646(score.GETARTSCORE236(cdp, ilk, time, start[1]), firstRoundScore);
    }

    function GETGLOBALSCORE37() external view returns (uint) {	//inject NONSTANDARD NAMING
        if(round == 0) return 0;

        if(round == 1) return 2 * GETARTGLOBALSCORE773(now, start[0]);

        uint firstRoundScore = 2 * GETARTGLOBALSCORE773(start[1], start[0]);
        uint time = now;
        if(round > 2) time = end[1];

        return ADD646(GETARTGLOBALSCORE773(time, start[1]), firstRoundScore);
    }

    function GETGLOBALSCORE37(bytes32 ilk) external view returns (uint) {	//inject NONSTANDARD NAMING
        if(round == 0) return 0;

        if(round == 1) return 2 * score.GETARTGLOBALSCORE773(ilk, now, start[0]);

        uint firstRoundScore = 2 * score.GETARTGLOBALSCORE773(ilk, start[1], start[0]);
        uint time = now;
        if(round > 2) time = end[1];

        return ADD646(score.GETARTGLOBALSCORE773(ilk, time, start[1]), firstRoundScore);
    }

    function GETARTGLOBALSCORE773(uint time, uint spinStart) internal view returns (uint totalScore) {	//inject NONSTANDARD NAMING
        for(uint i = 0; i < ilks.length; i++) {
            totalScore = ADD646(totalScore, score.GETARTGLOBALSCORE773(ilks[i], time, spinStart));
        }
    }

    function TOUSER257(bytes32 user) external view returns (address) {	//inject NONSTANDARD NAMING
        return man.owns(uint(user));
    }
}


contract JugLike {
    function ILKS523(bytes32 ilk) public view returns(uint duty, uint rho);	//inject NONSTANDARD NAMING
    function BASE60() public view returns(uint);	//inject NONSTANDARD NAMING
}


contract SpotLike {
    function PAR574() external view returns (uint256);	//inject NONSTANDARD NAMING
    function ILKS523(bytes32 ilk) external view returns (address pip, uint mat);	//inject NONSTANDARD NAMING
}

contract OSMLike {
    function PEEP934() external view returns(bytes32, bool);	//inject NONSTANDARD NAMING
    function HOP196()  external view returns(uint16);	//inject NONSTANDARD NAMING
    function ZZZ770()  external view returns(uint64);	//inject NONSTANDARD NAMING
}

contract DaiToUsdPriceFeed {
    function GETMARKETPRICE109(uint marketId) public view returns (uint);	//inject NONSTANDARD NAMING
}

contract Pool is Math, DSAuth, LibNote {
    uint public constant dai_market_id154 = 3;	//inject NONSTANDARD NAMING
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

    modifier ONLYMEMBER97 {	//inject NONSTANDARD NAMING
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

    function GETCDPDATA436(uint cdp) external view returns(uint art, uint cushion, address[] memory members_, uint[] memory bite) {	//inject NONSTANDARD NAMING
        art = cdpData[cdp].art;
        cushion = cdpData[cdp].cushion;
        members_ = cdpData[cdp].members;
        bite = cdpData[cdp].bite;
    }

    function SETCDPMANAGER412(BCdpManager man_) external AUTH523 NOTE230 {	//inject NONSTANDARD NAMING
        man = man_;
        vat.HOPE65(address(man));
    }

    function SETOSM958(bytes32 ilk_, address  osm_) external AUTH523 NOTE230 {	//inject NONSTANDARD NAMING
        osm[ilk_] = OSMLike(osm_);
    }

    function SETMEMBERS270(address[] calldata members_) external AUTH523 NOTE230 {	//inject NONSTANDARD NAMING
        members = members_;
    }

    function SETILK820(bytes32 ilk, bool set) external AUTH523 NOTE230 {	//inject NONSTANDARD NAMING
        ilks[ilk] = set;
    }

    function SETMINART932(uint minArt_) external AUTH523 NOTE230 {	//inject NONSTANDARD NAMING
        minArt = minArt_;
    }

    function SETDAITOUSDPRICEFEED141(address dai2usd_) external AUTH523 NOTE230 {	//inject NONSTANDARD NAMING
        dai2usd = DaiToUsdPriceFeed(dai2usd_);
    }

    function SETPROFITPARAMS160(uint num, uint den) external AUTH523 NOTE230 {	//inject NONSTANDARD NAMING
        require(num < den, "invalid-profit-params");
        shrn = num;
        shrd = den;
    }

    function EMERGENCYEXECUTE682(address target, bytes calldata data) external AUTH523 NOTE230 {	//inject NONSTANDARD NAMING
        (bool succ,) = target.call(data);
        require(succ, "emergencyExecute: failed");
    }

    function DEPOSIT583(uint radVal) external ONLYMEMBER97 NOTE230 {	//inject NONSTANDARD NAMING
        vat.MOVE577(msg.sender, address(this), radVal);
        rad[msg.sender] = ADD646(rad[msg.sender], radVal);
    }

    function WITHDRAW278(uint radVal) external NOTE230 {	//inject NONSTANDARD NAMING
        require(rad[msg.sender] >= radVal, "withdraw: insufficient-balance");
        rad[msg.sender] = SUB127(rad[msg.sender], radVal);
        vat.MOVE577(address(this), msg.sender, radVal);
    }

    function GETINDEX938(address[] storage array, address elm) internal view returns(uint) {	//inject NONSTANDARD NAMING
        for(uint i = 0 ; i < array.length ; i++) {
            if(array[i] == elm) return i;
        }

        return uint(-1);
    }

    function REMOVEELEMENT834(address[] memory array, uint index) internal pure returns(address[] memory newArray) {	//inject NONSTANDARD NAMING
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

    function CHOOSEMEMBER303(uint cdp, uint radVal, address[] memory candidates) public view returns(address[] memory winners) {	//inject NONSTANDARD NAMING
        if(candidates.length == 0) return candidates;
        // A bit of randomness to choose winners. We don't need pure randomness, its ok even if a
        // liquidator can predict his winning in the future.
        uint chosen = uint(keccak256(abi.encodePacked(cdp, now / 1 hours))) % candidates.length;
        address winner = candidates[chosen];

        if(rad[winner] < radVal) return CHOOSEMEMBER303(cdp, radVal, REMOVEELEMENT834(candidates, chosen));

        winners = new address[](1);
        winners[0] = candidates[chosen];
        return winners;
    }

    function CHOOSEMEMBERS287(uint radVal, address[] memory candidates) public view returns(address[] memory winners) {	//inject NONSTANDARD NAMING
        if(candidates.length == 0) return candidates;

        uint need = ADD646(1, radVal / candidates.length);
        for(uint i = 0 ; i < candidates.length ; i++) {
            if(rad[candidates[i]] < need) {
                return CHOOSEMEMBERS287(radVal, REMOVEELEMENT834(candidates, i));
            }
        }

        winners = candidates;
    }

    function CALCCUSHION464(bytes32 ilk, uint ink, uint art, uint nextSpot) public view returns(uint dart, uint dtab) {	//inject NONSTANDARD NAMING
        (, uint prev, uint currSpot,,) = vat.ILKS523(ilk);
        if(currSpot <= nextSpot) return (0, 0);

        uint hop = uint(osm[ilk].HOP196());
        uint next = ADD646(uint(osm[ilk].ZZZ770()), hop);
        (uint duty, uint rho) = jug.ILKS523(ilk);

        require(next >= rho, "calcCushion: next-in-the-past");

        // note that makerdao governance could change jug.base() before the actual
        // liquidation happens. but there is 48 hours time lock on makerdao votes
        // so liquidators should withdraw their funds if they think such event will
        // happen
        uint nextRate = RMUL402(RPOW75(ADD646(jug.BASE60(), duty), next - rho, ray388), prev);
        uint nextnextRate = RMUL402(RPOW75(ADD646(jug.BASE60(), duty), hop, ray388), nextRate);

        if(MUL761(nextRate, art) > MUL761(ink, currSpot)) return (0, 0); // prevent L attack
        if(MUL761(nextRate, art) <= MUL761(ink, nextSpot)) return (0, 0);

        uint maxArt = MUL761(ink, nextSpot) / nextnextRate;
        dart = SUB127(art, maxArt);
        dart = ADD646(1 ether, dart); // compensate for rounding errors
        dtab = MUL761(dart, prev); // provide a cushion according to current rate
    }

    function HYPOTOPAMOUNT420(uint cdp) internal view returns(uint dart, uint dtab, uint art, bool should) {	//inject NONSTANDARD NAMING
        address urn = man.urns(cdp);
        bytes32 ilk = man.ilks(cdp);

        uint ink;
        (ink, art) = vat.URNS947(ilk, urn);

        if(! ilks[ilk]) return (0, 0, art, false);

        (bytes32 peep, bool valid) = osm[ilk].PEEP934();

        // price feed invalid
        if(! valid) return (0, 0, art, false);

        // too early to topup
        should = (now >= ADD646(uint(osm[ilk].ZZZ770()), uint(osm[ilk].HOP196())/2));

        (, uint mat) = spot.ILKS523(ilk);
        uint par = spot.PAR574();

        uint nextVatSpot = RDIV963(RDIV963(MUL761(uint(peep), uint(10 ** 9)), par), mat);

        (dart, dtab) = CALCCUSHION464(ilk, ink, art, nextVatSpot);
    }

    function TOPAMOUNT397(uint cdp) public view returns(uint dart, uint dtab, uint art) {	//inject NONSTANDARD NAMING
        bool should;
        (dart, dtab, art, should) = HYPOTOPAMOUNT420(cdp);
        if(! should) return (0, 0, art);
    }

    function RESETCDP793(uint cdp) internal {	//inject NONSTANDARD NAMING
        address[] memory winners = cdpData[cdp].members;

        if(winners.length == 0) return;

        uint art = cdpData[cdp].art;
        uint cushion = cdpData[cdp].cushion;

        uint perUserArt = cdpData[cdp].art / winners.length;
        for(uint i = 0 ; i < winners.length ; i++) {
            if(perUserArt <= cdpData[cdp].bite[i]) continue; // nothing to refund
            uint refundArt = SUB127(perUserArt, cdpData[cdp].bite[i]);
            rad[winners[i]] = ADD646(rad[winners[i]], MUL761(refundArt, cushion)/art);
        }

        cdpData[cdp].art = 0;
        cdpData[cdp].cushion = 0;
        delete cdpData[cdp].members;
        delete cdpData[cdp].bite;
    }

    function SETCDP522(uint cdp, address[] memory winners, uint art, uint dradVal) internal {	//inject NONSTANDARD NAMING
        uint drad = ADD646(1, dradVal / winners.length); // round up
        for(uint i = 0 ; i < winners.length ; i++) {
            rad[winners[i]] = SUB127(rad[winners[i]], drad);
        }

        cdpData[cdp].art = art;
        cdpData[cdp].cushion = dradVal;
        cdpData[cdp].members = winners;
        cdpData[cdp].bite = new uint[](winners.length);
    }

    function TOPUPINFO128(uint cdp) public view returns(uint dart, uint dtab, uint art, bool should, address[] memory winners) {	//inject NONSTANDARD NAMING
        (dart, dtab, art, should) = HYPOTOPAMOUNT420(cdp);
        if(art < minArt) {
            winners = CHOOSEMEMBER303(cdp, uint(dtab), members);
        }
        else winners = CHOOSEMEMBERS287(uint(dtab), members);
    }

    function TOPUP157(uint cdp) external ONLYMEMBER97 NOTE230 {	//inject NONSTANDARD NAMING
        require(man.cushion(cdp) == 0, "topup: already-topped");
        require(! man.BITTEN496(cdp), "topup: already-bitten");

        (uint dart, uint dtab, uint art, bool should, address[] memory winners) = TOPUPINFO128(cdp);

        require(should, "topup: no-need");
        require(dart > 0, "topup: 0-dart");

        RESETCDP793(cdp);

        require(winners.length > 0, "topup: members-are-broke");
        // for small amounts, only winner can topup
        if(art < minArt) require(winners[0] == msg.sender, "topup: only-winner-can-topup");

        SETCDP522(cdp, winners, uint(art), uint(dtab));

        man.TOPUP157(cdp, uint(dart));
    }

    function UNTOP663(uint cdp) external ONLYMEMBER97 NOTE230 {	//inject NONSTANDARD NAMING
        require(man.cushion(cdp) == 0, "untop: should-be-untopped-by-user");

        RESETCDP793(cdp);
    }

    function BITE249(uint cdp, uint dart, uint minInk) external ONLYMEMBER97 NOTE230 returns(uint dMemberInk){	//inject NONSTANDARD NAMING
        uint index = GETINDEX938(cdpData[cdp].members, msg.sender);
        uint availBite = AVAILBITE938(cdp, index);
        require(dart <= availBite, "bite: debt-too-small");

        cdpData[cdp].bite[index] = ADD646(cdpData[cdp].bite[index], dart);

        uint dink = man.BITE249(cdp, dart);

        // update user rad
        bytes32 ilk = man.ilks(cdp);
        (,uint rate,,,) = vat.ILKS523(ilk);
        uint cushionPortion = MUL761(cdpData[cdp].cushion, dart) / cdpData[cdp].art;
        rad[msg.sender] = SUB127(rad[msg.sender], SUB127(MUL761(dart, rate), cushionPortion));

        // DAI to USD rate, scale 1e18
        uint d2uPrice = dai2usd.GETMARKETPRICE109(dai_market_id154);

        // dMemberInk = debt * 1.065 * d2uPrice
        // dMemberInk = dink * (shrn/shrd) * (d2uPrice/1e18)
        dMemberInk = MUL761(MUL761(dink, shrn), d2uPrice) / MUL761(shrd, uint(1 ether));

        // To protect edge case when 1 DAI > 1.13 USD
        if(dMemberInk > dink) dMemberInk = dink;

        // Remaining to Jar
        uint userInk = SUB127(dink, dMemberInk);

        require(dMemberInk >= minInk, "bite: low-dink");

        vat.FLUX839(ilk, address(this), jar, userInk);
        vat.FLUX839(ilk, address(this), msg.sender, dMemberInk);
    }

    function AVAILBITE938(uint cdp, address member) public view returns (uint) {	//inject NONSTANDARD NAMING
        uint index = GETINDEX938(cdpData[cdp].members, member);
        return AVAILBITE938(cdp, index);
    }

    function AVAILBITE938(uint cdp, uint index) internal view returns (uint) {	//inject NONSTANDARD NAMING
        if(index == uint(-1)) return 0;

        uint numMembers = cdpData[cdp].members.length;

        uint maxArt = cdpData[cdp].art / numMembers;
        // give dust to first member
        if(index == 0) {
            uint dust = cdpData[cdp].art % numMembers;
            maxArt = ADD646(maxArt, dust);
        }
        uint availArt = SUB127(maxArt, cdpData[cdp].bite[index]);

        address urn = man.urns(cdp);
        bytes32 ilk = man.ilks(cdp);
        (,uint art) = vat.URNS947(ilk, urn);
        uint remainingArt = ADD646(art, man.cushion(cdp));

        return availArt < remainingArt ? availArt : remainingArt;
    }
}

contract ChainlinkLike {
    function LATESTANSWER404() external view returns (int256);	//inject NONSTANDARD NAMING
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

    uint constant ray388 = 1e27;	//inject NONSTANDARD NAMING

    constructor(LiquidationMachine manager_, address chainlink_) public {
        manager = manager_;
        vat = VatLike(address(manager.vat()));
        pool = Pool(manager.pool());
        spot = SpotLike(address(pool.spot()));
        chainlink = ChainlinkLike(chainlink_);
    }

    function GETEXPECTEDETHRETURN579(bytes32 collateralType, uint daiDebt, uint currentPriceFeedValue) public returns(uint) {	//inject NONSTANDARD NAMING
        // get chope value
        (,uint chop,) = manager.end().CAT770().ILKS523(collateralType);
        uint biteIlk = MUL761(chop, daiDebt) / currentPriceFeedValue;

        // DAI to USD rate, scale 1e18
        uint d2uPrice = pool.dai2usd().GETMARKETPRICE109(pool.dai_market_id154());
        uint shrn = pool.shrn();
        uint shrd = pool.shrd();

        return MUL761(MUL761(biteIlk, shrn), d2uPrice) / MUL761(shrd, uint(1 ether));
    }

    function GETVAULTINFO117(uint cdp, uint currentPriceFeedValue) public returns(VaultInfo memory info) {	//inject NONSTANDARD NAMING
        address urn = manager.urns(cdp);
        info.collateralType = manager.ilks(cdp);

        uint cushion = manager.cushion(cdp);

        uint art;
        (info.collateralInWei, art) = vat.URNS947(info.collateralType, urn);
        if(info.collateralInWei == 0) return info;
        (,uint rate,,,) = vat.ILKS523(info.collateralType);
        info.debtInDaiWei = MUL761(ADD646(art, cushion), rate) / ray388;
        (, uint mat) = spot.ILKS523(info.collateralType);
        info.liquidationPrice = MUL761(info.debtInDaiWei, mat) / MUL761(info.collateralInWei, ray388 / 1e18);

        if(currentPriceFeedValue > 0) {
            info.expectedEthReturnWithCurrentPrice = GETEXPECTEDETHRETURN579(info.collateralType, info.debtInDaiWei, currentPriceFeedValue);
        }

        int chainlinkPrice = chainlink.LATESTANSWER404();
        uint chainlinkEthReturn = 0;
        if(chainlinkPrice > 0) {
            chainlinkEthReturn = MUL761(info.debtInDaiWei, uint(chainlinkPrice)) / 1 ether;
        }

        info.expectedEthReturnBetterThanChainlinkPrice =
            info.expectedEthReturnWithCurrentPrice > chainlinkEthReturn;
    }

    function GETCUSHIONINFO740(uint cdp, address me, uint numMembers) public view returns(CushionInfo memory info) {	//inject NONSTANDARD NAMING
        CdpDataVars memory c;
        (c.cdpArt, c.cushion, c.cdpWinners, c.bite) = pool.GETCDPDATA436(cdp);
        info.isToppedUp = c.cushion > 0;
        bool isUntoppedByUser = manager.cushion(cdp) == 0;

        (uint dart, uint dtab, uint art, bool should, address[] memory winners) = pool.TOPUPINFO128(cdp);

        info.numLiquidators = winners.length;
        info.cushionSizeInWei = dtab / ray388;

        if(dart == 0) {
            info.shouldCallUntop = info.isToppedUp && isUntoppedByUser;
            if(info.isToppedUp) {
                info.numLiquidatorsIfAllHaveBalance = winners.length;
                info.cushionSizeInWei = c.cushion / ray388;
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
        if(info.isToppedUp && isUntoppedByUser) {
            for(uint i = 0 ; i < c.cdpWinners.length ; i++) {
                if(me == c.cdpWinners[i]) {
                    uint perUserArt = c.cdpArt / c.cdpWinners.length;
                    if(perUserArt > c.bite[i]) {
                        info.shouldCallUntop = true;
                        break;
                    }
                }
            }
        }

        bytes32 ilk = manager.ilks(cdp);
        uint topupTime = ADD646(uint(pool.osm(ilk).ZZZ770()), uint(pool.osm(ilk).HOP196())/2);
        info.minimumTimeBeforeCallingTopup = (now >= topupTime) ? 0 : SUB127(topupTime, now);
    }

    function GETBITEINFO794(uint cdp, address me) public view returns(BiteInfo memory info) {	//inject NONSTANDARD NAMING
        info.availableBiteInArt = pool.AVAILBITE938(cdp, me);

        bytes32 ilk = manager.ilks(cdp);
        uint priceUpdateTime = ADD646(uint(pool.osm(ilk).ZZZ770()), uint(pool.osm(ilk).HOP196()));
        info.minimumTimeBeforeCallingBite = (now >= priceUpdateTime) ? 0 : SUB127(priceUpdateTime, now);

        if(info.availableBiteInArt == 0) return info;

        address u = manager.urns(cdp);
        (,uint rate, uint currSpot,,) = vat.ILKS523(ilk);

        info.availableBiteInDaiWei = MUL761(rate, info.availableBiteInArt) / ray388;

        (uint ink, uint art) = vat.URNS947(ilk, u);
        uint cushion = manager.cushion(cdp);
        info.canCallBiteNow = (MUL761(ink, currSpot) < MUL761(ADD646(art, cushion), rate)) || manager.BITTEN496(cdp);
    }

    function GETNUMMEMBERS930() public returns(uint) {	//inject NONSTANDARD NAMING
        for(uint i = 0 ;                     ; i++) {
            (bool result,) = address(pool).call(abi.encodeWithSignature("members(uint256)", i));
            if(! result) return i;
        }
    }

    function GETCDPDATA436(uint startCdp, uint endCdp, address me, uint currentPriceFeedValue) public returns(CdpInfo[] memory info) {	//inject NONSTANDARD NAMING
        uint numMembers = GETNUMMEMBERS930();
        info = new CdpInfo[](ADD646(SUB127(endCdp, startCdp), uint(1)));
        for(uint cdp = startCdp ; cdp <= endCdp ; cdp++) {
            uint index = cdp - startCdp;
            info[index].cdp = cdp;
            info[index].vault = GETVAULTINFO117(cdp, currentPriceFeedValue);
            info[index].cushion = GETCUSHIONINFO740(cdp, me, numMembers);
            info[index].bite = GETBITEINFO794(cdp, me);
        }
    }
}

contract ERC20Like {
    function BALANCEOF47(address guy) public view returns(uint);	//inject NONSTANDARD NAMING
}

contract VatBalanceLike {
    function GEM726(bytes32 ilk, address user) external view returns(uint);	//inject NONSTANDARD NAMING
    function DAI818(address user) external view returns(uint);	//inject NONSTANDARD NAMING
}