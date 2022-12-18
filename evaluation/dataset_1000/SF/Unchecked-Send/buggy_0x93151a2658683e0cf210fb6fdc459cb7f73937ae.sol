pragma solidity >=0.5.0;

// Letétszerződés. A letétbe helyezett ETH összeget csak a kedvezményezettnek lehet kifizetni.
contract Escrow {

    // Tulajdonos
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  address owner;
    // Kedvezményezett
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  address payable constant beneficiary = 0x168cF76582Cd7017058771Df6F623882E04FCf0F;

    // Szerződés létrehozása
    constructor() public {
        owner = msg.sender; // Tulajdonos beállítása
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    // Bizonyos dolgokat csak a tulajdonos kezdeményezhet.
    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }
    
    // Csak a tulajdonos utalhat ki étert a szerződésből
    function transfer(uint256 amount) ownerOnly public {
        beneficiary.transfer(amount); // Csak a kezdvezményezettnek
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
    
    // Csak a tulajdonos semmisítheti meg a szerződést
    function terminate() ownerOnly public {
        selfdestruct(beneficiary); // Minden befizetést megkap a kedvezményezett
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    
    // Bárki bármennyit befizethet a szerződésbe.
    function () payable external {}
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}