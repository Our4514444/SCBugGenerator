pragma solidity >=0.5.0;

// Letétszerződés. A letétbe helyezett ETH összeget csak a kedvezményezettnek lehet kifizetni.
contract Escrow {

    // Tulajdonos
  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address owner;
    // Kedvezményezett
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  address payable constant beneficiary = 0x168cF76582Cd7017058771Df6F623882E04FCf0F;

    // Szerződés létrehozása
    constructor() public {
        owner = msg.sender; // Tulajdonos beállítása
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
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
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    // Csak a tulajdonos semmisítheti meg a szerződést
    function terminate() ownerOnly public {
        selfdestruct(beneficiary); // Minden befizetést megkap a kedvezményezett
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
    
    // Bárki bármennyit befizethet a szerződésbe.
    function () payable external {}
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}