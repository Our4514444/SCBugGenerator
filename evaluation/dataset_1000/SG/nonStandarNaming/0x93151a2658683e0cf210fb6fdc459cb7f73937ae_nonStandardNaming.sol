pragma solidity >=0.5.0;

// Let1tszerz1d1s. A let1tbe helyezett ETH 1sszeget csak a kedvezm1nyezettnek lehet kifizetni.
contract Escrow {

    // Tulajdonos
    address owner;
    // Kedvezm1nyezett
    address payable constant beneficiary981 = 0x168cF76582Cd7017058771Df6F623882E04FCf0F;	//inject NONSTANDARD NAMING

    // Szerz1d1s l1trehoz1sa
    constructor() public {
        owner = msg.sender; // Tulajdonos be1ll1t1sa
    }
    
    // Bizonyos dolgokat csak a tulajdonos kezdem1nyezhet.
    modifier OWNERONLY309 {	//inject NONSTANDARD NAMING
        assert(msg.sender == owner);
        _;
    }
    
    // Csak a tulajdonos utalhat ki 1tert a szerz1d1sb1l
    function TRANSFER618(uint256 amount) OWNERONLY309 public {	//inject NONSTANDARD NAMING
        beneficiary981.transfer(amount); // Csak a kezdvezm1nyezettnek
    }
    
    // Csak a tulajdonos semmis1theti meg a szerz1d1st
    function TERMINATE47() OWNERONLY309 public {	//inject NONSTANDARD NAMING
        selfdestruct(beneficiary981); // Minden befizet1st megkap a kedvezm1nyezett
    }
    
    // B1rki b1rmennyit befizethet a szerz1d1sbe.
    function () payable external {}
}