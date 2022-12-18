pragma solidity >=0.5.0;

// Let1tszerz1d1s. A let1tbe helyezett ETH 1sszeget csak a kedvezm1nyezettnek lehet kifizetni.
contract Escrow {

    // Tulajdonos
    address owner;
    // Kedvezm1nyezett
    address payable constant beneficiary = 0x168cF76582Cd7017058771Df6F623882E04FCf0F;

    // Szerz1d1s l1trehoz1sa
    constructor() public {
        owner = msg.sender; // Tulajdonos be1ll1t1sa
    }
    
    // Bizonyos dolgokat csak a tulajdonos kezdem1nyezhet.
    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }
    
    // Csak a tulajdonos utalhat ki 1tert a szerz1d1sb1l
    function transfer(uint256 amount) ownerOnly public {
        beneficiary.transfer(amount); // Csak a kezdvezm1nyezettnek	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    // Csak a tulajdonos semmis1theti meg a szerz1d1st
    function terminate() ownerOnly public {
        selfdestruct(beneficiary); // Minden befizet1st megkap a kedvezm1nyezett	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    // B1rki b1rmennyit befizethet a szerz1d1sbe.
    function () payable external {}
}