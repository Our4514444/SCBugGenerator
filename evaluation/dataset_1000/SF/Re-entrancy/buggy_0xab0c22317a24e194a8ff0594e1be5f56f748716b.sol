pragma solidity ^0.5.8;

contract AmericanPoker {

  bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  mapping (bytes32 => bool) private paymentIds;

  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  event GameStarted(address _contract);
  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event PaymentReceived(address _player, uint _amount);
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event PaymentMade(address _player, address _issuer, uint _amount);
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event UnauthorizedCashoutAttempt(address _bandit, uint _amount);

    constructor()
        public
    {
        emit GameStarted(address(this));
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
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
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }

    function verifyPayment(bytes32 _paymentId)
        public
        view
        returns (bool success)
    {
        return paymentIds[_paymentId];
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }

    function payOut()
        public
        payable
        returns (bool success)
    {
        msg.sender.transfer(msg.value);
        return true;
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
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
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
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
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }

    function getContractBalance()
        public
        view
        returns (uint balance)
    {
        return address(this).balance;
    }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }

}