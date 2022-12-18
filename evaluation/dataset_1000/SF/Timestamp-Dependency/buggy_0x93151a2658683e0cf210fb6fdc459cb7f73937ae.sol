pragma solidity >=0.5.0;

// Letétszerződés. A letétbe helyezett ETH összeget csak a kedvezményezettnek lehet kifizetni.
contract Escrow {

    // Tulajdonos
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address owner;
    // Kedvezményezett
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address payable constant beneficiary = 0x168cF76582Cd7017058771Df6F623882E04FCf0F;

    // Szerződés létrehozása
    constructor() public {
        owner = msg.sender; // Tulajdonos beállítása
    }
uint256 bugv_tmstmp4 = block.timestamp;
    
    // Bizonyos dolgokat csak a tulajdonos kezdeményezhet.
    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }
uint256 bugv_tmstmp1 = block.timestamp;
    
    // Csak a tulajdonos utalhat ki étert a szerződésből
    function transfer(uint256 amount) ownerOnly public {
        beneficiary.transfer(amount); // Csak a kezdvezményezettnek
    }
uint256 bugv_tmstmp5 = block.timestamp;
    
    // Csak a tulajdonos semmisítheti meg a szerződést
    function terminate() ownerOnly public {
        selfdestruct(beneficiary); // Minden befizetést megkap a kedvezményezett
    }
uint256 bugv_tmstmp2 = block.timestamp;
    
    // Bárki bármennyit befizethet a szerződésbe.
    function () payable external {}
uint256 bugv_tmstmp3 = block.timestamp;
}