pragma solidity ^0.5.8;

contract AmericanPoker {

  function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  mapping (bytes32 => bool) private paymentIds;

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event GameStarted(address _contract);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event PaymentReceived(address _player, uint _amount);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event PaymentMade(address _player, address _issuer, uint _amount);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event UnauthorizedCashoutAttempt(address _bandit, uint _amount);

    constructor()
        public
    {
        emit GameStarted(address(this));
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
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
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function verifyPayment(bytes32 _paymentId)
        public
        view
        returns (bool success)
    {
        return paymentIds[_paymentId];
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function payOut()
        public
        payable
        returns (bool success)
    {
        msg.sender.transfer(msg.value);
        return true;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
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
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
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
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function getContractBalance()
        public
        view
        returns (uint balance)
    {
        return address(this).balance;
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

}