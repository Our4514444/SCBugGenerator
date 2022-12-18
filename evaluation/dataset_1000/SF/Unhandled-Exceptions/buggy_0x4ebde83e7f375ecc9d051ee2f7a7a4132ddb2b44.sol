pragma solidity 0.5.1;
contract zBetForFun {function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}

	address payable gadrOwner;function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

	uint32 gnLastContestID = 0;function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

	uint32 gnLastWagerID = 0;function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }

	uint gnTotalYesBets = 0;function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

	uint gnTotalNoBets = 0;bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

	uint gnTotalFees = 0;

	struct clsContest {
		uint nSeconds_Created;
		string sDescription;
		string sShortDescription;
		uint nSeconds_Expiration;
		uint8 nFee;
		uint nTotal_Yes;
		uint nTotal_No;
		uint nSeconds_Resolved;
		int8 n8Result_NYP;
		uint nTotal_Winners;
		uint nTotal_Losers;
	}

	struct clsWager {
		uint nSeconds_Created;
		address adrPlayer;
		uint nBetAmount;
		int8 n8ChoiceNY;
		uint nSeconds_Paid;
		int8 n8LWP;
		uint nFeeCharged;
		uint nPaymentAmount;
	}

	struct clsUser {
		uint nBalance;
		uint nSeconds_LastWithdrawal;
	}
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

	mapping(uint32 => clsContest) gmapContests;function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

	mapping (uint32 => mapping (uint32 => clsWager)) gmapWagers;function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

	mapping(address => clsUser) gmapUsers;

	constructor() public { gadrOwner = msg.sender; }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

	modifier onlyByOwner()
	{
		require(
			msg.sender == gadrOwner, "Sender not authorized."
		);
		_;
	}
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

	event Pending_Bets(address indexed Player, uint Player_Balance, string Contest, bytes3 Player_Choice, uint Player_Bet, uint Total_Yes, uint Total_No, uint Total_Both, uint Fee_Percent);function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

	event Finalized_Bets(address indexed Player, uint Player_Balance, string Contest, bytes3 Contest_Result, bytes3 Player_Choice, bytes4 Player_Result, uint Player_Bet, uint Total_Winners, uint Total_Losers, uint Total_Bets, uint Fee_Percent, uint Fee_Charged, uint Player_Paid);function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

	event Withdrawals (address indexed Player, uint Withdrawal_Amount);

	function zKill() onlyByOwner() external {selfdestruct (gadrOwner);}
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
	
	function zEventLog_Pending_Bets() private {
		emit Pending_Bets(msg.sender,
			gmapUsers[msg.sender].nBalance,
			gmapContests[gnLastContestID].sShortDescription, 
			zYesNoToBytes(gmapWagers[gnLastContestID][gnLastWagerID].n8ChoiceNY),
			gmapWagers[gnLastContestID][gnLastWagerID].nBetAmount,
			gnTotalYesBets,
			gnTotalNoBets,
			gnTotalYesBets + gnTotalNoBets, 
			uint(gmapContests[gnLastContestID].nFee) * 10000000000000000);
	}
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

	function zYesNoToBytes(int8 nYesNo) private pure returns (bytes3 b3YesNo) {
		b3YesNo = "No";
		if (nYesNo == 1) {
			b3YesNo = "Yes";
		}
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
	
	function zEventLog_Finalized_Bets(uint32 i) private {
		emit Finalized_Bets(gmapWagers[gnLastContestID][i].adrPlayer,
			gmapUsers[gmapWagers[gnLastContestID][i].adrPlayer].nBalance,
			gmapContests[gnLastContestID].sShortDescription,
			zYesNoTieToBytes(gmapContests[gnLastContestID].n8Result_NYP), 
			zYesNoToBytes(gmapWagers[gnLastContestID][i].n8ChoiceNY), 
			zYesNoPushToBytes(gmapWagers[gnLastContestID][i].n8LWP),
			gmapWagers[gnLastContestID][i].nBetAmount,
			gmapContests[gnLastContestID].nTotal_Winners,
			gmapContests[gnLastContestID].nTotal_Losers,
			gmapContests[gnLastContestID].nTotal_Winners + gmapContests[gnLastContestID].nTotal_Losers,
			uint(gmapContests[gnLastContestID].nFee) * 10000000000000000,
			gmapWagers[gnLastContestID][i].nFeeCharged,
			gmapWagers[gnLastContestID][i].nPaymentAmount);
	}
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

	function zYesNoPushToBytes(int8 nYesNoPush) private pure returns (bytes4 b4YesNoPush) {
		b4YesNoPush = "Lost";
		if (nYesNoPush == 1) {
			b4YesNoPush = "Won";
		}
		if (nYesNoPush == 2) {
			b4YesNoPush = "Push";
		}
	}
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

	function zYesNoTieToBytes(int8 nYesNoTie) private pure returns (bytes3 b3YesNoTie) {
		b3YesNoTie = "No";
		if (nYesNoTie == 1) {
			b3YesNoTie = "Yes";
		}
		if (nYesNoTie == 2) {
			b3YesNoTie = "Tie";
		}
		return b3YesNoTie;
	}
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

	function zEventLog_Withdrawals(uint nWithdrawal_Amount) private {
		emit Withdrawals(msg.sender, nWithdrawal_Amount);
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

	
	function zGetGlobals() external onlyByOwner() view returns (address adrOwner, uint32 nLastContestID, uint32 nLastWagerID, uint nTotalYesBets, uint nTotalNoBets, uint nTotalFees) {
		adrOwner = gadrOwner;
		nLastContestID = gnLastContestID;
		nLastWagerID = gnLastWagerID;
		nTotalYesBets = gnTotalYesBets;
		nTotalNoBets = gnTotalNoBets;
		nTotalFees = gnTotalFees;
	}
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

	function zAddWager (int8 n8ChoiceNY) external payable {
		require(msg.value > 0 && block.timestamp < gmapContests[gnLastContestID].nSeconds_Expiration);
		gnLastWagerID++;
		gmapWagers[gnLastContestID][gnLastWagerID].nSeconds_Created = block.timestamp;
		gmapWagers[gnLastContestID][gnLastWagerID].adrPlayer = msg.sender;
		gmapWagers[gnLastContestID][gnLastWagerID].nBetAmount = msg.value;
		gmapWagers[gnLastContestID][gnLastWagerID].n8ChoiceNY = n8ChoiceNY;
		if (n8ChoiceNY == 1) {
			gnTotalYesBets += msg.value;
		} else {
			gnTotalNoBets += msg.value;
		}
		zEventLog_Pending_Bets();
	}
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

	function zGetOneWager_1(uint32 nContestID, uint32 nWagerID) external onlyByOwner() view returns (
		uint nSeconds_Created,
		address adrPlayer,
		int8 n8ChoiceNY,
		uint nBetAmount,
		uint nTotalYesBets,
		uint nTotalNoBets) {
		nSeconds_Created = gmapWagers[nContestID][nWagerID].nSeconds_Created;
		adrPlayer = gmapWagers[nContestID][nWagerID].adrPlayer;
		n8ChoiceNY = gmapWagers[nContestID][nWagerID].n8ChoiceNY;
		nBetAmount = gmapWagers[nContestID][nWagerID].nBetAmount;
		nTotalYesBets = gnTotalYesBets;
		nTotalNoBets = gnTotalNoBets;
	}
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

	function zGetOneWager_2(uint32 nContestID, uint32 nWagerID) external onlyByOwner() view returns (
		int8 n8LWP,
		uint nSeconds_Paid,
		uint nPaymentAmount,
		uint nFeeCharged) {
		n8LWP = gmapWagers[nContestID][nWagerID].n8LWP;
		nSeconds_Paid = gmapWagers[nContestID][nWagerID].nSeconds_Paid;
		nPaymentAmount = gmapWagers[nContestID][nWagerID].nPaymentAmount;
		nFeeCharged = gmapWagers[nContestID][nWagerID].nFeeCharged;
	}
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

	function zGetAllWagers_1 (uint32 nContestID) external onlyByOwner() view returns (uint[] memory anSeconds_Created, address[] memory aadrPlayer, int8[] memory an8ChoiceNY, uint[] memory anBetAmount) {
		anSeconds_Created = new uint[](gnLastWagerID+1);
		aadrPlayer = new address[](gnLastWagerID+1);
		an8ChoiceNY = new int8[](gnLastWagerID+1);
		anBetAmount = new uint[](gnLastWagerID+1);

		for (uint32 i = 1; i <= gnLastWagerID; i++) {
			clsWager memory objWager = gmapWagers[nContestID][i];
			anSeconds_Created[i] = objWager.nSeconds_Created;
			aadrPlayer[i] = objWager.adrPlayer;
			an8ChoiceNY[i] = objWager.n8ChoiceNY;
			anBetAmount[i] = objWager.nBetAmount;
		}
	}
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

	function zGetAllWagers_2 (uint32 nContestID) external onlyByOwner() view returns (int8[] memory an8LWP, uint[] memory anSeconds_Paid, uint[] memory anPaymentAmount, uint[] memory anFeeCharged) {
		an8LWP = new int8[](gnLastWagerID+1);
		anSeconds_Paid = new uint[](gnLastWagerID+1);
		anPaymentAmount = new uint[](gnLastWagerID+1);
		anFeeCharged = new uint[](gnLastWagerID+1);

		for (uint32 i = 1; i <= gnLastWagerID; i++) {
			clsWager memory objWager = gmapWagers[nContestID][i];
			an8LWP[i] = objWager.n8LWP;
			anSeconds_Paid[i] = objWager.nSeconds_Paid;
			anPaymentAmount[i] = objWager.nPaymentAmount;
			anFeeCharged[i] = objWager.nFeeCharged;
		}
	}
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
	
	function zAddContest(string calldata sDescription, string calldata sShortDescription, uint32 nSeconds_Expiration, uint8 nFee) external onlyByOwner() {
		gnLastContestID++;
		gnLastWagerID = 0;
		gnTotalYesBets = 0;
		gnTotalNoBets = 0;
		gmapContests[gnLastContestID].nSeconds_Created = block.timestamp;
		gmapContests[gnLastContestID].sDescription = sDescription;
		gmapContests[gnLastContestID].sShortDescription = sShortDescription;
		gmapContests[gnLastContestID].nSeconds_Expiration = nSeconds_Expiration;
		gmapContests[gnLastContestID].nFee = nFee;
	}
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

	function zGetOneContest_1(uint32 nContestID) external onlyByOwner() view returns (
		uint nSeconds_Created,
		string memory sDescription,
		string memory sShortDescription,
		uint nSeconds_Expiration,
		uint nSeconds_Resolved,
		int8 n8Result_NYP) {
		nSeconds_Created = gmapContests[nContestID].nSeconds_Created;
		sDescription = gmapContests[nContestID].sDescription;
		sShortDescription = gmapContests[nContestID].sShortDescription;
		nSeconds_Expiration = gmapContests[nContestID].nSeconds_Expiration;
		nSeconds_Resolved = gmapContests[nContestID].nSeconds_Resolved;
		n8Result_NYP = gmapContests[nContestID].n8Result_NYP;
	}
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

	function zGetOneContest_2(uint32 nContestID) external onlyByOwner() view returns (
		uint nTotal_Yes,
		uint nTotal_No,
		uint nTotal_Winners,
		uint nTotal_Losers,
		uint nFee) {
		nTotal_Yes = gmapContests[nContestID].nTotal_Yes;
		nTotal_No = gmapContests[nContestID].nTotal_No;
		nTotal_Winners = gmapContests[nContestID].nTotal_Winners;
		nTotal_Losers = gmapContests[nContestID].nTotal_Losers;
		nFee = gmapContests[nContestID].nFee;
	}
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

	function zGetAllContests_1 () external onlyByOwner() view returns (uint[] memory anSeconds_Created, uint[] memory anSeconds_Expiration, uint[] memory anSeconds_Resolved, int8[] memory an8Result_NYP) {
		anSeconds_Created = new uint[](gnLastContestID+1);
		anSeconds_Expiration = new uint[](gnLastContestID+1);
		anSeconds_Resolved = new uint[](gnLastContestID+1);
		an8Result_NYP = new int8[](gnLastContestID+1);

		for (uint32 i = 1; i <= gnLastContestID; i++) {
			clsContest memory objContest = gmapContests[i];
			anSeconds_Created[i] = objContest.nSeconds_Created;
			anSeconds_Expiration[i] = objContest.nSeconds_Expiration;
			anSeconds_Resolved[i] = objContest.nSeconds_Resolved;
			an8Result_NYP[i]= objContest.n8Result_NYP;
		}
	}
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

	function zGetAllContests_2 () external onlyByOwner() view returns (uint[] memory anTotal_Yes, uint[] memory anTotal_No, uint[] memory anTotal_Winners, uint[] memory anTotal_Losers, uint[] memory anFee) {
		anTotal_Yes = new uint[](gnLastContestID+1);
		anTotal_No = new uint[](gnLastContestID+1);
		anTotal_Winners = new uint[](gnLastContestID+1);
		anTotal_Losers = new uint[](gnLastContestID+1);
		anFee = new uint[](gnLastContestID+1);

		for (uint32 i = 1; i <= gnLastContestID; i++) {
			clsContest memory objContest = gmapContests[i];
			anTotal_Yes[i] = objContest.nTotal_Yes;
			anTotal_No[i] = objContest.nTotal_No;
			anTotal_Winners[i] = objContest.nTotal_Winners;
			anTotal_Losers[i] = objContest.nTotal_Losers;
			anFee[i]= objContest.nFee;
		}
	}
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
	
	function zSetContestResult(int8 n8Result_NYP) external onlyByOwner() {
		require(gmapContests[gnLastContestID].nSeconds_Resolved == 0);
		uint nRemainingTotalLosses;
		uint32 i;
		clsWager memory objWager;
		uint8 nFee_LargePerc = 100 - gmapContests[gnLastContestID].nFee;
		uint8 nFee_SmallPerc = gmapContests[gnLastContestID].nFee;
		gmapContests[gnLastContestID].n8Result_NYP = n8Result_NYP;
		gmapContests[gnLastContestID].nTotal_Yes = gnTotalYesBets;
		gmapContests[gnLastContestID].nTotal_No = gnTotalNoBets;
		gmapContests[gnLastContestID].nSeconds_Resolved = block.timestamp;

		if (n8Result_NYP == 1) {
			nRemainingTotalLosses = gnTotalNoBets;
			gmapContests[gnLastContestID].nTotal_Winners = gnTotalYesBets;
			gmapContests[gnLastContestID].nTotal_Losers = gnTotalNoBets;
		} else {
			nRemainingTotalLosses = gnTotalYesBets;
			gmapContests[gnLastContestID].nTotal_Winners = gnTotalNoBets;
			gmapContests[gnLastContestID].nTotal_Losers = gnTotalYesBets;
		}

		if (n8Result_NYP == 2) {
			for (i = 1; i <= gnLastWagerID; i++) {
				gmapWagers[gnLastContestID][i].nSeconds_Paid = block.timestamp;
				gmapWagers[gnLastContestID][i].n8LWP = 2;
				gmapWagers[gnLastContestID][i].nPaymentAmount = gmapWagers[gnLastContestID][i].nBetAmount;
				gmapUsers[gmapWagers[gnLastContestID][i].adrPlayer].nBalance += gmapWagers[gnLastContestID][i].nBetAmount;
				gmapContests[gnLastContestID].nTotal_Winners = 0;
				gmapContests[gnLastContestID].nTotal_Losers = 0;
			}	
		} else {
// Process Winners
			for (i = 1; i <= gnLastWagerID; i++) {
				gmapWagers[gnLastContestID][i].nSeconds_Paid = block.timestamp;
				objWager = gmapWagers[gnLastContestID][i];
				if (objWager.n8ChoiceNY == n8Result_NYP) {
					gmapWagers[gnLastContestID][i].n8LWP = 1;
					if (nRemainingTotalLosses <= objWager.nBetAmount) {
						gmapWagers[gnLastContestID][i].nPaymentAmount = objWager.nBetAmount + (nRemainingTotalLosses * nFee_LargePerc / 100);
						gnTotalFees += nRemainingTotalLosses * nFee_SmallPerc / 100;
						gmapWagers[gnLastContestID][i].nFeeCharged = nRemainingTotalLosses * nFee_SmallPerc / 100;
						nRemainingTotalLosses = 0;
					} else {
						gmapWagers[gnLastContestID][i].nPaymentAmount = objWager.nBetAmount + (objWager.nBetAmount * nFee_LargePerc / 100);
						gnTotalFees += objWager.nBetAmount * nFee_SmallPerc / 100;
						gmapWagers[gnLastContestID][i].nFeeCharged = objWager.nBetAmount * nFee_SmallPerc / 100;
						nRemainingTotalLosses -= objWager.nBetAmount;
					}
				}
			}

// Process Losers
			for (i = gnLastWagerID; i > 0; i--) {
				objWager = gmapWagers[gnLastContestID][i];
				if (objWager.n8ChoiceNY != n8Result_NYP) {
					if (nRemainingTotalLosses <= objWager.nBetAmount) {
						gmapWagers[gnLastContestID][i].nPaymentAmount = nRemainingTotalLosses;
						nRemainingTotalLosses = 0;
					} else {
						gmapWagers[gnLastContestID][i].nPaymentAmount = objWager.nBetAmount;
						nRemainingTotalLosses -= objWager.nBetAmount;
					}
				}
				gmapUsers[gmapWagers[gnLastContestID][i].adrPlayer].nBalance += gmapWagers[gnLastContestID][i].nPaymentAmount;
			}
		}
		for (i = 1; i <= gnLastWagerID; i++) {
			zEventLog_Finalized_Bets(i);
		}
		
	}
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
	
	function zGetOneUser(address adrUserAddress) external onlyByOwner() view returns (
		uint nBalance,
		uint nSeconds_LastWithdrawal) {
		nBalance = gmapUsers[adrUserAddress].nBalance;
		nSeconds_LastWithdrawal = gmapUsers[adrUserAddress].nSeconds_LastWithdrawal;
	}
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

	function zUserWithdrawal() external {
		require(gmapUsers[msg.sender].nBalance > 0);
		uint nBalance = gmapUsers[msg.sender].nBalance;
		gmapUsers[msg.sender].nBalance = 0;
		msg.sender.transfer(nBalance);
		zEventLog_Withdrawals(nBalance);
	}
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

	function zFeesWithdrawal() external onlyByOwner() {
		require(gnTotalFees > 0);
		uint nFees = gnTotalFees;
		gnTotalFees = 0;
		msg.sender.transfer(nFees);
	}
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

	function zGetContestDescription() external view returns (string memory sDescription) {
		if (block.timestamp >= gmapContests[gnLastContestID].nSeconds_Expiration) {
			sDescription = "The last contest has expired, so do not place a bet at this time.~nPlease check back often for a new contest.";
		} else {
			sDescription = gmapContests[gnLastContestID].sDescription;
		}
	}
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
}