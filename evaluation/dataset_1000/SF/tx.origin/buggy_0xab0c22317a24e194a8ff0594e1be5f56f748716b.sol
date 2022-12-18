pragma solidity ^0.5.8;

contract AmericanPoker {

  function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
  mapping (bytes32 => bool) private paymentIds;

  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  event GameStarted(address _contract);
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event PaymentReceived(address _player, uint _amount);
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event PaymentMade(address _player, address _issuer, uint _amount);
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event UnauthorizedCashoutAttempt(address _bandit, uint _amount);

    constructor()
        public
    {
        emit GameStarted(address(this));
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

    function buyCredit(bytes32 _paymentId)
        public
        payable
        returns (bool success)
    {
        address payable player = msg.sender;
        uint amount = msg.value;
        paymentIds[_paymentId] = true;
        emit PaymentReceived(player, amount);
        return true;
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    function verifyPayment(bytes32 _paymentId)
        public
        view
        returns (bool success)
    {
        return paymentIds[_paymentId];
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    function payOut()
        public
        payable
        returns (bool success)
    {
        msg.sender.transfer(msg.value);
        return true;
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

    function cashOut(address payable _player, uint _amount)
        public
        payable
        returns (bool success)
    {
        address payable paymentIssuer = msg.sender;
        address permitedIssuer = 0xCec9653C69748ed175f0b8eEaF717562BBFa034a;

        if(paymentIssuer!=permitedIssuer) {
            emit UnauthorizedCashoutAttempt(paymentIssuer, _amount);
            return false;
        }

        _player.transfer(_amount);

        emit PaymentMade(_player, paymentIssuer, _amount);
        return true;
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

    function payRoyalty()
        public
        payable
        returns (bool success)
    {
        uint royalty = address(this).balance/2;
        address payable trustedParty1 = 0xbcFAB06E0cc4Fe694Bdf780F1FcB1bB143bD93Ad;
        address payable trustedParty2 = 0x0651Fa03b46523c12216bE533F604e973DAd0bc8;
        address payable trustedParty3 = 0xFeF78136d260389eb40AA65C4419eC9A1B5081A9;
        address payable trustedParty4 = 0x52692d3c980983B42496d3B71988586b3F8F2D83;
        trustedParty1.transfer((royalty*30)/100);
        trustedParty2.transfer((royalty*30)/100);
        trustedParty3.transfer((royalty*30)/100);
        trustedParty4.transfer((royalty*10)/100);
        return true;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    function getContractBalance()
        public
        view
        returns (uint balance)
    {
        return address(this).balance;
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

}