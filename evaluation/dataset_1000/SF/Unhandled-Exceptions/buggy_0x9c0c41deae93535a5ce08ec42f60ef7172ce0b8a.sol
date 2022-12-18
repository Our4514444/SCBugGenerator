pragma solidity ^0.5.4;

/**
    INSTRUCTION:
    Send more then 0.01 ETH to one of Wallet Contract address
    [wallet_0, wallet_1, wallet_2], after round end send to This contract 0 ETH
    transaction and if you choise won, take your winnings.

    DAPP:     http://smartlottery.game (mirror: http://smartlottery.clab)
    BOT:      http://t.me/SmartLotteryGame_bot
    LICENSE:  Under proprietary rights. All rights reserved.
              Except <lib.SafeMath, cont.Ownable> under The MIT License (MIT)
    AUTHOR:   http://t.me/pironmind
    
*/

library SafeMath {
    function mul(uint256 _a, uint256 _b) internal pure returns (uint256) {
        if (_a == 0) {
            return 0;
        }
        uint256 c = _a * _b;
        require(c / _a == _b);
        return c;
    }

    function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
        require(_b > 0);
        uint256 c = _a / _b;
        return c;
    }

    function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
        require(_b <= _a);
        uint256 c = _a - _b;
        return c;
    }

    function add(uint256 _a, uint256 _b) internal pure returns (uint256) {
        uint256 c = _a + _b;
        require(c >= _a);
        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

contract Ownable {
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  address public owner;

  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event OwnershipRenounced(address indexed previousOwner);
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function renounceOwnership() public onlyOwner {
        emit OwnershipRenounced(owner);
        owner = address(0);
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function transferOwnership(address _newOwner) public onlyOwner {
        _transferOwnership(_newOwner);
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

    function _transferOwnership(address _newOwner) internal {
        require(_newOwner != address(0));
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
}

contract Wallet is Ownable {
    using SafeMath for uint256;

  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  LotteryData public lotteryData;

    uint256 public minPaymnent = 10**16;

    function setMinPayment(uint256 value) public onlyOwner {
        minPaymnent = value;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    constructor() public {
        lotteryData = LotteryData(msg.sender);
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function() payable external {
        require(msg.value >= minPaymnent);
        lotteryData.participate(msg.sender, msg.value);
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    function finishDay() external returns(uint256) {
        require(msg.sender == address(lotteryData));
        uint256 balance = address(this).balance;
        if (balance >= minPaymnent) {
            lotteryData.getFunds.value(balance)();
            return balance;
        } else {
            return 0;
        }
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
}

contract LotteryData is Ownable {
    using SafeMath for uint;

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Withdrawn(address indexed payee, uint256 weiAmount);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Deposited(address indexed payee, uint256 weiAmount);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event WinnerWallet(address indexed wallet, uint256 bank);

    Wallet public wallet_0 = new Wallet();
    Wallet public wallet_1 = new Wallet();
    Wallet public wallet_2 = new Wallet();

  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  uint256 public finishTime;
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 constant roundTime = 86400;

  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint internal dilemma;
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  uint internal max_participators = 100;
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  uint internal participators;
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  uint internal randNonce = 19;
    uint internal winner;
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint internal winner_1;
  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  uint internal winner_2;
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 internal fund;
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint256 internal commission;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint256 internal totalBetsWithoutCommission;

  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  mapping(uint => address) public wallets;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  mapping(address => mapping (address => uint256)) public playersBets;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping(address => mapping (uint => address)) public players;
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  mapping(address => uint256) public totalBets;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  mapping(address => uint) public totalPlayers;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping(address => uint256) private _deposits;

  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint public games;

    struct wins{
        address winner;
        uint256 time;
    }

  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping(uint => wins) public gamesLog;

    constructor() public {
        wallets[0] = address(wallet_0);
        wallets[1] = address(wallet_1);
        wallets[2] = address(wallet_2);
        finishTime = now.add(roundTime);
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    modifier validWallets() {
        require(
            msg.sender == address(wallet_0) ||
            msg.sender == address(wallet_1) ||
            msg.sender == address(wallet_2)
        );
        _;
    }

    function depositsOf(address payee) public view returns (uint256) {
        return _deposits[payee];
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function deposit(address payee, uint256 amount) internal {
        _deposits[payee] = _deposits[payee].add(amount);
        emit Deposited(payee, amount);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function getFunds() public payable validWallets {}
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    function lastWinner() public view returns(address) {
        return gamesLog[games].winner;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function getRandomWallet() internal returns(uint) {
        uint result = uint(keccak256(abi.encodePacked(now, randNonce, blockhash(block.number - 1)))) % 3;
        randNonce = randNonce.add(result.add(2));
        return result;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function _fundriser() internal returns(uint256) {
        fund = fund.add(wallet_0.finishDay());
        fund = fund.add(wallet_1.finishDay());
        return fund.add(wallet_2.finishDay());
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    function _randomizer() internal returns(uint) {
        // random choose one of three wallets
        winner = getRandomWallet();
        // check if this address had payments, if no solving it
        if(totalPlayers[wallets[winner]] == 0) {
            dilemma = uint(keccak256(abi.encodePacked(now, winner, blockhash(block.number - 1)))) % 2;
            if(winner == 0) {
                if(dilemma == 1) {
                    winner_1 = 2; winner_2 = 1;
                } else {
                    winner_1 = 1; winner_2 = 2;
                }
            }
            if(winner == 1) {
                if(dilemma == 1) {
                    winner_1 = 2; winner_2 = 0;
                } else {
                    winner_1 = 0; winner_2 = 2;
                }
            }
            if(winner == 2) {
                if(dilemma == 1) {
                    winner_1 = 1; winner_2 = 0;
                } else {
                    winner_1 = 0; winner_2 = 1;
                }
            }
            winner = (totalPlayers[wallets[winner_1]] == 0) ? winner_2 : winner_1;
        }

        return winner;
    }

    function _distribute() internal {
        // calculate commission
        commission = fund.mul(15).div(100);
        totalBetsWithoutCommission = fund.sub(commission);
        deposit(owner, commission);
        // calculate and make deposits
        for (uint i = 0; i < totalPlayers[wallets[winner]]; i++) {
            uint percents = playersBets[wallets[winner]][players[wallets[winner]][i]].mul(10000).div(totalBets[wallets[winner]]);
            deposit(players[wallets[winner]][i], totalBetsWithoutCommission.mul(percents).div(10000));
        }
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function _collector() internal {
        fund = 0;
        participators = 0;
        totalBets[wallets[0]] = 0;
        for (uint j = 0; j < 3; j++) {
            for (uint k = 0; k < totalPlayers[wallets[j]]; k++) {
                playersBets[wallets[j]][players[wallets[j]][k]] = 0;
                players[wallets[j]][k] = address(0x0);
            }
            totalBets[wallets[j]] = 0;
            totalPlayers[wallets[j]] = 0;
        }
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function _logger(address _winner, uint256 _fund) internal {
        games = games + 1;
        gamesLog[games].winner =_winner;
        gamesLog[games].time = now;
        emit WinnerWallet(_winner, _fund);
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function participate(address player, uint256 amount) external validWallets {
        if (now >= finishTime || participators >= max_participators) {
            // send all funds to this wallet
            fund = _fundriser();
            // if it has participators
            if(fund > 0) {
                // get winner
                winner = _randomizer();
                // _distribute
                _distribute();
                // clear state
                _collector();
                // log data
                _logger(wallets[winner], fund);
            }
            // update round
            finishTime = now.add(roundTime);
        }

        if (playersBets[msg.sender][player] == 0) {
            players[msg.sender][totalPlayers[msg.sender]] = player;
            totalPlayers[msg.sender] = totalPlayers[msg.sender].add(1);
            participators = participators.add(1);
        }
        playersBets[msg.sender][player] = playersBets[msg.sender][player].add(amount);
        totalBets[msg.sender] = totalBets[msg.sender].add(amount);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    /**
    * @dev Withdraw accumulated balance for a payee.
    */
    function withdraw() public {
        uint256 payment = _deposits[msg.sender];
        _deposits[msg.sender] = 0;
        msg.sender.transfer(payment);
        emit Withdrawn(msg.sender, payment);
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function paymentValidator(address _payee, uint256 _amount) internal {
        if(_payee != address(wallet_0) &&
           _payee != address(wallet_1) &&
           _payee != address(wallet_2))
        {
            if(_amount == uint(0)) {
                if(depositsOf(_payee) != uint(0)) {
                    withdraw();
                } else {
                    revert("You have zero balance");
                }
            } else {
                revert("You can't do nonzero transaction");
            }
        }
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function() external payable {
        paymentValidator(msg.sender, msg.value);
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
}