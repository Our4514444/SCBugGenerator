pragma solidity 0.5.1;
contract zBetForFun {
	address payable gadrOwner;
	uint32 gnLastContestID = 0;
	uint32 gnLastWagerID = 0;
	uint gnTotalYesBets = 0;
	uint gnTotalNoBets = 0;
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

	mapping(uint32 => clsContest) gmapContests;
	mapping (uint32 => mapping (uint32 => clsWager)) gmapWagers;
	mapping(address => clsUser) gmapUsers;

	constructor() public { gadrOwner = msg.sender; }

	modifier onlyByOwner()
	{
		require(
			msg.sender == gadrOwner, "Sender not authorized."
		);
		_;
	}

	event Pending_Bets(address indexed Player, uint Player_Balance, string Contest, bytes3 Player_Choice, uint Player_Bet, uint Total_Yes, uint Total_No, uint Total_Both, uint Fee_Percent);
	event Finalized_Bets(address indexed Player, uint Player_Balance, string Contest, bytes3 Contest_Result, bytes3 Player_Choice, bytes4 Player_Result, uint Player_Bet, uint Total_Winners, uint Total_Losers, uint Total_Bets, uint Fee_Percent, uint Fee_Charged, uint Player_Paid);
	event Withdrawals (address indexed Player, uint Withdrawal_Amount);

	function zKill() onlyByOwner() external {selfdestruct (gadrOwner);}	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	
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

	function zYesNoToBytes(int8 nYesNo) private pure returns (bytes3 b3YesNo) {
		b3YesNo = "No";
		if (nYesNo == 1) {
			b3YesNo = "Yes";
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

	function zYesNoPushToBytes(int8 nYesNoPush) private pure returns (bytes4 b4YesNoPush) {
		b4YesNoPush = "Lost";
		if (nYesNoPush == 1) {
			b4YesNoPush = "Won";
		}
		if (nYesNoPush == 2) {
			b4YesNoPush = "Push";
		}
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

	function zEventLog_Withdrawals(uint nWithdrawal_Amount) private {
		emit Withdrawals(msg.sender, nWithdrawal_Amount);
	}

	
	function zGetGlobals() external onlyByOwner() view returns (address adrOwner, uint32 nLastContestID, uint32 nLastWagerID, uint nTotalYesBets, uint nTotalNoBets, uint nTotalFees) {
		adrOwner = gadrOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nLastContestID = gnLastContestID;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nLastWagerID = gnLastWagerID;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nTotalYesBets = gnTotalYesBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nTotalNoBets = gnTotalNoBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nTotalFees = gnTotalFees;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}

	function zAddWager (int8 n8ChoiceNY) external payable {
		require(msg.value > 0 && block.timestamp < gmapContests[gnLastContestID].nSeconds_Expiration);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gnLastWagerID++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapWagers[gnLastContestID][gnLastWagerID].nSeconds_Created = block.timestamp;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapWagers[gnLastContestID][gnLastWagerID].adrPlayer = msg.sender;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapWagers[gnLastContestID][gnLastWagerID].nBetAmount = msg.value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapWagers[gnLastContestID][gnLastWagerID].n8ChoiceNY = n8ChoiceNY;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		if (n8ChoiceNY == 1) {
			gnTotalYesBets += msg.value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		} else {
			gnTotalNoBets += msg.value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		}
		zEventLog_Pending_Bets();
	}

	function zGetOneWager_1(uint32 nContestID, uint32 nWagerID) external onlyByOwner() view returns (
		uint nSeconds_Created,
		address adrPlayer,
		int8 n8ChoiceNY,
		uint nBetAmount,
		uint nTotalYesBets,
		uint nTotalNoBets) {
		nSeconds_Created = gmapWagers[nContestID][nWagerID].nSeconds_Created;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		adrPlayer = gmapWagers[nContestID][nWagerID].adrPlayer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		n8ChoiceNY = gmapWagers[nContestID][nWagerID].n8ChoiceNY;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nBetAmount = gmapWagers[nContestID][nWagerID].nBetAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nTotalYesBets = gnTotalYesBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nTotalNoBets = gnTotalNoBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}

	function zGetOneWager_2(uint32 nContestID, uint32 nWagerID) external onlyByOwner() view returns (
		int8 n8LWP,
		uint nSeconds_Paid,
		uint nPaymentAmount,
		uint nFeeCharged) {
		n8LWP = gmapWagers[nContestID][nWagerID].n8LWP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nSeconds_Paid = gmapWagers[nContestID][nWagerID].nSeconds_Paid;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nPaymentAmount = gmapWagers[nContestID][nWagerID].nPaymentAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nFeeCharged = gmapWagers[nContestID][nWagerID].nFeeCharged;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}

	function zGetAllWagers_1 (uint32 nContestID) external onlyByOwner() view returns (uint[] memory anSeconds_Created, address[] memory aadrPlayer, int8[] memory an8ChoiceNY, uint[] memory anBetAmount) {
		anSeconds_Created = new uint[](gnLastWagerID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		aadrPlayer = new address[](gnLastWagerID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		an8ChoiceNY = new int8[](gnLastWagerID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anBetAmount = new uint[](gnLastWagerID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

		for (uint32 i = 1; i <= gnLastWagerID; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			clsWager memory objWager = gmapWagers[nContestID][i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			anSeconds_Created[i] = objWager.nSeconds_Created;
			aadrPlayer[i] = objWager.adrPlayer;
			an8ChoiceNY[i] = objWager.n8ChoiceNY;
			anBetAmount[i] = objWager.nBetAmount;
		}
	}

	function zGetAllWagers_2 (uint32 nContestID) external onlyByOwner() view returns (int8[] memory an8LWP, uint[] memory anSeconds_Paid, uint[] memory anPaymentAmount, uint[] memory anFeeCharged) {
		an8LWP = new int8[](gnLastWagerID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anSeconds_Paid = new uint[](gnLastWagerID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anPaymentAmount = new uint[](gnLastWagerID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anFeeCharged = new uint[](gnLastWagerID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

		for (uint32 i = 1; i <= gnLastWagerID; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			clsWager memory objWager = gmapWagers[nContestID][i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			an8LWP[i] = objWager.n8LWP;
			anSeconds_Paid[i] = objWager.nSeconds_Paid;
			anPaymentAmount[i] = objWager.nPaymentAmount;
			anFeeCharged[i] = objWager.nFeeCharged;
		}
	}
	
	function zAddContest(string calldata sDescription, string calldata sShortDescription, uint32 nSeconds_Expiration, uint8 nFee) external onlyByOwner() {
		gnLastContestID++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gnLastWagerID = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gnTotalYesBets = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gnTotalNoBets = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].nSeconds_Created = block.timestamp;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].sDescription = sDescription;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].sShortDescription = sShortDescription;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].nSeconds_Expiration = nSeconds_Expiration;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].nFee = nFee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}

	function zGetOneContest_1(uint32 nContestID) external onlyByOwner() view returns (
		uint nSeconds_Created,
		string memory sDescription,
		string memory sShortDescription,
		uint nSeconds_Expiration,
		uint nSeconds_Resolved,
		int8 n8Result_NYP) {
		nSeconds_Created = gmapContests[nContestID].nSeconds_Created;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		sDescription = gmapContests[nContestID].sDescription;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		sShortDescription = gmapContests[nContestID].sShortDescription;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nSeconds_Expiration = gmapContests[nContestID].nSeconds_Expiration;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nSeconds_Resolved = gmapContests[nContestID].nSeconds_Resolved;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		n8Result_NYP = gmapContests[nContestID].n8Result_NYP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}

	function zGetOneContest_2(uint32 nContestID) external onlyByOwner() view returns (
		uint nTotal_Yes,
		uint nTotal_No,
		uint nTotal_Winners,
		uint nTotal_Losers,
		uint nFee) {
		nTotal_Yes = gmapContests[nContestID].nTotal_Yes;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nTotal_No = gmapContests[nContestID].nTotal_No;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nTotal_Winners = gmapContests[nContestID].nTotal_Winners;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nTotal_Losers = gmapContests[nContestID].nTotal_Losers;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nFee = gmapContests[nContestID].nFee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}

	function zGetAllContests_1 () external onlyByOwner() view returns (uint[] memory anSeconds_Created, uint[] memory anSeconds_Expiration, uint[] memory anSeconds_Resolved, int8[] memory an8Result_NYP) {
		anSeconds_Created = new uint[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anSeconds_Expiration = new uint[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anSeconds_Resolved = new uint[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		an8Result_NYP = new int8[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

		for (uint32 i = 1; i <= gnLastContestID; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			clsContest memory objContest = gmapContests[i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			anSeconds_Created[i] = objContest.nSeconds_Created;
			anSeconds_Expiration[i] = objContest.nSeconds_Expiration;
			anSeconds_Resolved[i] = objContest.nSeconds_Resolved;
			an8Result_NYP[i]= objContest.n8Result_NYP;
		}
	}

	function zGetAllContests_2 () external onlyByOwner() view returns (uint[] memory anTotal_Yes, uint[] memory anTotal_No, uint[] memory anTotal_Winners, uint[] memory anTotal_Losers, uint[] memory anFee) {
		anTotal_Yes = new uint[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anTotal_No = new uint[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anTotal_Winners = new uint[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anTotal_Losers = new uint[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		anFee = new uint[](gnLastContestID+1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

		for (uint32 i = 1; i <= gnLastContestID; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			clsContest memory objContest = gmapContests[i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			anTotal_Yes[i] = objContest.nTotal_Yes;
			anTotal_No[i] = objContest.nTotal_No;
			anTotal_Winners[i] = objContest.nTotal_Winners;
			anTotal_Losers[i] = objContest.nTotal_Losers;
			anFee[i]= objContest.nFee;
		}
	}
	
	function zSetContestResult(int8 n8Result_NYP) external onlyByOwner() {
		require(gmapContests[gnLastContestID].nSeconds_Resolved == 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		uint nRemainingTotalLosses;
		uint32 i;
		clsWager memory objWager;
		uint8 nFee_LargePerc = 100 - gmapContests[gnLastContestID].nFee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		uint8 nFee_SmallPerc = gmapContests[gnLastContestID].nFee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].n8Result_NYP = n8Result_NYP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].nTotal_Yes = gnTotalYesBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].nTotal_No = gnTotalNoBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapContests[gnLastContestID].nSeconds_Resolved = block.timestamp;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

		if (n8Result_NYP == 1) {
			nRemainingTotalLosses = gnTotalNoBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			gmapContests[gnLastContestID].nTotal_Winners = gnTotalYesBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			gmapContests[gnLastContestID].nTotal_Losers = gnTotalNoBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		} else {
			nRemainingTotalLosses = gnTotalYesBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			gmapContests[gnLastContestID].nTotal_Winners = gnTotalNoBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			gmapContests[gnLastContestID].nTotal_Losers = gnTotalYesBets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		}

		if (n8Result_NYP == 2) {
			for (i = 1; i <= gnLastWagerID; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				gmapWagers[gnLastContestID][i].nSeconds_Paid = block.timestamp;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				gmapWagers[gnLastContestID][i].n8LWP = 2;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				gmapWagers[gnLastContestID][i].nPaymentAmount = gmapWagers[gnLastContestID][i].nBetAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				gmapUsers[gmapWagers[gnLastContestID][i].adrPlayer].nBalance += gmapWagers[gnLastContestID][i].nBetAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				gmapContests[gnLastContestID].nTotal_Winners = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				gmapContests[gnLastContestID].nTotal_Losers = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			}	
		} else {
// Process Winners
			for (i = 1; i <= gnLastWagerID; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				gmapWagers[gnLastContestID][i].nSeconds_Paid = block.timestamp;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				objWager = gmapWagers[gnLastContestID][i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				if (objWager.n8ChoiceNY == n8Result_NYP) {
					gmapWagers[gnLastContestID][i].n8LWP = 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
					if (nRemainingTotalLosses <= objWager.nBetAmount) {
						gmapWagers[gnLastContestID][i].nPaymentAmount = objWager.nBetAmount + (nRemainingTotalLosses * nFee_LargePerc / 100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
						gnTotalFees += nRemainingTotalLosses * nFee_SmallPerc / 100;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
						gmapWagers[gnLastContestID][i].nFeeCharged = nRemainingTotalLosses * nFee_SmallPerc / 100;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
						nRemainingTotalLosses = 0;
					} else {
						gmapWagers[gnLastContestID][i].nPaymentAmount = objWager.nBetAmount + (objWager.nBetAmount * nFee_LargePerc / 100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
						gnTotalFees += objWager.nBetAmount * nFee_SmallPerc / 100;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
						gmapWagers[gnLastContestID][i].nFeeCharged = objWager.nBetAmount * nFee_SmallPerc / 100;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
						nRemainingTotalLosses -= objWager.nBetAmount;
					}
				}
			}

// Process Losers
			for (i = gnLastWagerID; i > 0; i--) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				objWager = gmapWagers[gnLastContestID][i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
				if (objWager.n8ChoiceNY != n8Result_NYP) {
					if (nRemainingTotalLosses <= objWager.nBetAmount) {
						gmapWagers[gnLastContestID][i].nPaymentAmount = nRemainingTotalLosses;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
						nRemainingTotalLosses = 0;
					} else {
						gmapWagers[gnLastContestID][i].nPaymentAmount = objWager.nBetAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
						nRemainingTotalLosses -= objWager.nBetAmount;
					}
				}
				gmapUsers[gmapWagers[gnLastContestID][i].adrPlayer].nBalance += gmapWagers[gnLastContestID][i].nPaymentAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			}
		}
		for (i = 1; i <= gnLastWagerID; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			zEventLog_Finalized_Bets(i);
		}
		
	}
	
	function zGetOneUser(address adrUserAddress) external onlyByOwner() view returns (
		uint nBalance,
		uint nSeconds_LastWithdrawal) {
		nBalance = gmapUsers[adrUserAddress].nBalance;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		nSeconds_LastWithdrawal = gmapUsers[adrUserAddress].nSeconds_LastWithdrawal;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}

	function zUserWithdrawal() external {
		require(gmapUsers[msg.sender].nBalance > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		uint nBalance = gmapUsers[msg.sender].nBalance;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gmapUsers[msg.sender].nBalance = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		msg.sender.transfer(nBalance);
		zEventLog_Withdrawals(nBalance);
	}

	function zFeesWithdrawal() external onlyByOwner() {
		require(gnTotalFees > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		uint nFees = gnTotalFees;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		gnTotalFees = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		msg.sender.transfer(nFees);
	}

	function zGetContestDescription() external view returns (string memory sDescription) {
		if (block.timestamp >= gmapContests[gnLastContestID].nSeconds_Expiration) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
			sDescription = "The last contest has expired, so do not place a bet at this time.~nPlease check back often for a new contest.";
		} else {
			sDescription = gmapContests[gnLastContestID].sDescription;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		}
	}
}