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

	modifier ONLYBYOWNER67()	//inject NONSTANDARD NAMING
	{
		require(
			msg.sender == gadrOwner, "Sender not authorized."
		);
		_;
	}

	event PENDING_BETS755(address indexed Player, uint Player_Balance, string Contest, bytes3 Player_Choice, uint Player_Bet, uint Total_Yes, uint Total_No, uint Total_Both, uint Fee_Percent);	//inject NONSTANDARD NAMING
	event FINALIZED_BETS614(address indexed Player, uint Player_Balance, string Contest, bytes3 Contest_Result, bytes3 Player_Choice, bytes4 Player_Result, uint Player_Bet, uint Total_Winners, uint Total_Losers, uint Total_Bets, uint Fee_Percent, uint Fee_Charged, uint Player_Paid);	//inject NONSTANDARD NAMING
	event WITHDRAWALS118 (address indexed Player, uint Withdrawal_Amount);	//inject NONSTANDARD NAMING

	function ZKILL203() ONLYBYOWNER67() external {selfdestruct (gadrOwner);}	//inject NONSTANDARD NAMING
	
	function ZEVENTLOG_PENDING_BETS168() private {	//inject NONSTANDARD NAMING
		emit PENDING_BETS755(msg.sender,
			gmapUsers[msg.sender].nBalance,
			gmapContests[gnLastContestID].sShortDescription, 
			ZYESNOTOBYTES965(gmapWagers[gnLastContestID][gnLastWagerID].n8ChoiceNY),
			gmapWagers[gnLastContestID][gnLastWagerID].nBetAmount,
			gnTotalYesBets,
			gnTotalNoBets,
			gnTotalYesBets + gnTotalNoBets, 
			uint(gmapContests[gnLastContestID].nFee) * 10000000000000000);
	}

	function ZYESNOTOBYTES965(int8 nYesNo) private pure returns (bytes3 b3YesNo) {	//inject NONSTANDARD NAMING
		b3YesNo = "No";
		if (nYesNo == 1) {
			b3YesNo = "Yes";
		}
	}
	
	function ZEVENTLOG_FINALIZED_BETS445(uint32 i) private {	//inject NONSTANDARD NAMING
		emit FINALIZED_BETS614(gmapWagers[gnLastContestID][i].adrPlayer,
			gmapUsers[gmapWagers[gnLastContestID][i].adrPlayer].nBalance,
			gmapContests[gnLastContestID].sShortDescription,
			ZYESNOTIETOBYTES545(gmapContests[gnLastContestID].n8Result_NYP), 
			ZYESNOTOBYTES965(gmapWagers[gnLastContestID][i].n8ChoiceNY), 
			ZYESNOPUSHTOBYTES145(gmapWagers[gnLastContestID][i].n8LWP),
			gmapWagers[gnLastContestID][i].nBetAmount,
			gmapContests[gnLastContestID].nTotal_Winners,
			gmapContests[gnLastContestID].nTotal_Losers,
			gmapContests[gnLastContestID].nTotal_Winners + gmapContests[gnLastContestID].nTotal_Losers,
			uint(gmapContests[gnLastContestID].nFee) * 10000000000000000,
			gmapWagers[gnLastContestID][i].nFeeCharged,
			gmapWagers[gnLastContestID][i].nPaymentAmount);
	}

	function ZYESNOPUSHTOBYTES145(int8 nYesNoPush) private pure returns (bytes4 b4YesNoPush) {	//inject NONSTANDARD NAMING
		b4YesNoPush = "Lost";
		if (nYesNoPush == 1) {
			b4YesNoPush = "Won";
		}
		if (nYesNoPush == 2) {
			b4YesNoPush = "Push";
		}
	}

	function ZYESNOTIETOBYTES545(int8 nYesNoTie) private pure returns (bytes3 b3YesNoTie) {	//inject NONSTANDARD NAMING
		b3YesNoTie = "No";
		if (nYesNoTie == 1) {
			b3YesNoTie = "Yes";
		}
		if (nYesNoTie == 2) {
			b3YesNoTie = "Tie";
		}
		return b3YesNoTie;
	}

	function ZEVENTLOG_WITHDRAWALS710(uint nWithdrawal_Amount) private {	//inject NONSTANDARD NAMING
		emit WITHDRAWALS118(msg.sender, nWithdrawal_Amount);
	}

	
	function ZGETGLOBALS56() external ONLYBYOWNER67() view returns (address adrOwner, uint32 nLastContestID, uint32 nLastWagerID, uint nTotalYesBets, uint nTotalNoBets, uint nTotalFees) {	//inject NONSTANDARD NAMING
		adrOwner = gadrOwner;
		nLastContestID = gnLastContestID;
		nLastWagerID = gnLastWagerID;
		nTotalYesBets = gnTotalYesBets;
		nTotalNoBets = gnTotalNoBets;
		nTotalFees = gnTotalFees;
	}

	function ZADDWAGER345 (int8 n8ChoiceNY) external payable {	//inject NONSTANDARD NAMING
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
		ZEVENTLOG_PENDING_BETS168();
	}

	function ZGETONEWAGER_1163(uint32 nContestID, uint32 nWagerID) external ONLYBYOWNER67() view returns (	//inject NONSTANDARD NAMING
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

	function ZGETONEWAGER_2303(uint32 nContestID, uint32 nWagerID) external ONLYBYOWNER67() view returns (	//inject NONSTANDARD NAMING
		int8 n8LWP,
		uint nSeconds_Paid,
		uint nPaymentAmount,
		uint nFeeCharged) {
		n8LWP = gmapWagers[nContestID][nWagerID].n8LWP;
		nSeconds_Paid = gmapWagers[nContestID][nWagerID].nSeconds_Paid;
		nPaymentAmount = gmapWagers[nContestID][nWagerID].nPaymentAmount;
		nFeeCharged = gmapWagers[nContestID][nWagerID].nFeeCharged;
	}

	function ZGETALLWAGERS_1595 (uint32 nContestID) external ONLYBYOWNER67() view returns (uint[] memory anSeconds_Created, address[] memory aadrPlayer, int8[] memory an8ChoiceNY, uint[] memory anBetAmount) {	//inject NONSTANDARD NAMING
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

	function ZGETALLWAGERS_245 (uint32 nContestID) external ONLYBYOWNER67() view returns (int8[] memory an8LWP, uint[] memory anSeconds_Paid, uint[] memory anPaymentAmount, uint[] memory anFeeCharged) {	//inject NONSTANDARD NAMING
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
	
	function ZADDCONTEST81(string calldata sDescription, string calldata sShortDescription, uint32 nSeconds_Expiration, uint8 nFee) external ONLYBYOWNER67() {	//inject NONSTANDARD NAMING
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

	function ZGETONECONTEST_152(uint32 nContestID) external ONLYBYOWNER67() view returns (	//inject NONSTANDARD NAMING
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

	function ZGETONECONTEST_2598(uint32 nContestID) external ONLYBYOWNER67() view returns (	//inject NONSTANDARD NAMING
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

	function ZGETALLCONTESTS_1466 () external ONLYBYOWNER67() view returns (uint[] memory anSeconds_Created, uint[] memory anSeconds_Expiration, uint[] memory anSeconds_Resolved, int8[] memory an8Result_NYP) {	//inject NONSTANDARD NAMING
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

	function ZGETALLCONTESTS_2953 () external ONLYBYOWNER67() view returns (uint[] memory anTotal_Yes, uint[] memory anTotal_No, uint[] memory anTotal_Winners, uint[] memory anTotal_Losers, uint[] memory anFee) {	//inject NONSTANDARD NAMING
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
	
	function ZSETCONTESTRESULT743(int8 n8Result_NYP) external ONLYBYOWNER67() {	//inject NONSTANDARD NAMING
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
			ZEVENTLOG_FINALIZED_BETS445(i);
		}
		
	}
	
	function ZGETONEUSER878(address adrUserAddress) external ONLYBYOWNER67() view returns (	//inject NONSTANDARD NAMING
		uint nBalance,
		uint nSeconds_LastWithdrawal) {
		nBalance = gmapUsers[adrUserAddress].nBalance;
		nSeconds_LastWithdrawal = gmapUsers[adrUserAddress].nSeconds_LastWithdrawal;
	}

	function ZUSERWITHDRAWAL2() external {	//inject NONSTANDARD NAMING
		require(gmapUsers[msg.sender].nBalance > 0);
		uint nBalance = gmapUsers[msg.sender].nBalance;
		gmapUsers[msg.sender].nBalance = 0;
		msg.sender.transfer(nBalance);
		ZEVENTLOG_WITHDRAWALS710(nBalance);
	}

	function ZFEESWITHDRAWAL97() external ONLYBYOWNER67() {	//inject NONSTANDARD NAMING
		require(gnTotalFees > 0);
		uint nFees = gnTotalFees;
		gnTotalFees = 0;
		msg.sender.transfer(nFees);
	}

	function ZGETCONTESTDESCRIPTION896() external view returns (string memory sDescription) {	//inject NONSTANDARD NAMING
		if (block.timestamp >= gmapContests[gnLastContestID].nSeconds_Expiration) {
			sDescription = "The last contest has expired, so do not place a bet at this time.~nPlease check back often for a new contest.";
		} else {
			sDescription = gmapContests[gnLastContestID].sDescription;
		}
	}
}