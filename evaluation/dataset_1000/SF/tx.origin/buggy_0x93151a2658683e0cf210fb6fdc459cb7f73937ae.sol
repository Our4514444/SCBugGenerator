pragma solidity >=0.5.0;

// Letétszerződés. A letétbe helyezett ETH összeget csak a kedvezményezettnek lehet kifizetni.
contract Escrow {

    // Tulajdonos
    address owner;
    // Kedvezményezett
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  address payable constant beneficiary = 0x168cF76582Cd7017058771Df6F623882E04FCf0F;

    // Szerződés létrehozása
    constructor() public {
        owner = msg.sender; // Tulajdonos beállítása
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
    
    // Bizonyos dolgokat csak a tulajdonos kezdeményezhet.
    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }
    
    // Csak a tulajdonos utalhat ki étert a szerződésből
    function transfer(uint256 amount) ownerOnly public {
        beneficiary.transfer(amount); // Csak a kezdvezményezettnek
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
    
    // Csak a tulajdonos semmisítheti meg a szerződést
    function terminate() ownerOnly public {
        selfdestruct(beneficiary); // Minden befizetést megkap a kedvezményezett
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
    
    // Bárki bármennyit befizethet a szerződésbe.
    function () payable external {}
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}