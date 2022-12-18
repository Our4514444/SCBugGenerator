pragma solidity 0.5.1;
contract zBetForFun {bool claimed_TOD22 = false;
address payable owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }

	address payable gadrOwner;bool claimed_TOD8 = false;
address payable owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }

	uint32 gnLastContestID = 0;bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }

	uint32 gnLastWagerID = 0;address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }

	uint gnTotalYesBets = 0;address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }

	uint gnTotalNoBets = 0;address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
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
bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }

	mapping(uint32 => clsContest) gmapContests;bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }

	mapping (uint32 => mapping (uint32 => clsWager)) gmapWagers;bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }

	mapping(address => clsUser) gmapUsers;

	constructor() public { gadrOwner = msg.sender; }
bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }

	modifier onlyByOwner()
	{
		require(
			msg.sender == gadrOwner, "Sender not authorized."
		);
		_;
	}
address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }

	event Pending_Bets(address indexed Player, uint Player_Balance, string Contest, bytes3 Player_Choice, uint Player_Bet, uint Total_Yes, uint Total_No, uint Total_Both, uint Fee_Percent);address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }

	event Finalized_Bets(address indexed Player, uint Player_Balance, string Contest, bytes3 Contest_Result, bytes3 Player_Choice, bytes4 Player_Result, uint Player_Bet, uint Total_Winners, uint Total_Losers, uint Total_Bets, uint Fee_Percent, uint Fee_Charged, uint Player_Paid);address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }

	event Withdrawals (address indexed Player, uint Withdrawal_Amount);

	function zKill() onlyByOwner() external {selfdestruct (gadrOwner);}
address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
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
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }

	function zYesNoToBytes(int8 nYesNo) private pure returns (bytes3 b3YesNo) {
		b3YesNo = "No";
		if (nYesNo == 1) {
			b3YesNo = "Yes";
		}
	}
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
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
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
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
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
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
bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }

	function zEventLog_Withdrawals(uint nWithdrawal_Amount) private {
		emit Withdrawals(msg.sender, nWithdrawal_Amount);
	}
bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }

	
	function zGetGlobals() external onlyByOwner() view returns (address adrOwner, uint32 nLastContestID, uint32 nLastWagerID, uint nTotalYesBets, uint nTotalNoBets, uint nTotalFees) {
		adrOwner = gadrOwner;
		nLastContestID = gnLastContestID;
		nLastWagerID = gnLastWagerID;
		nTotalYesBets = gnTotalYesBets;
		nTotalNoBets = gnTotalNoBets;
		nTotalFees = gnTotalFees;
	}
bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
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
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
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
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
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
bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }

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
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
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
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
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
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
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
address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
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
bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
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
address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
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
bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
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
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
	
	function zGetOneUser(address adrUserAddress) external onlyByOwner() view returns (
		uint nBalance,
		uint nSeconds_LastWithdrawal) {
		nBalance = gmapUsers[adrUserAddress].nBalance;
		nSeconds_LastWithdrawal = gmapUsers[adrUserAddress].nSeconds_LastWithdrawal;
	}
bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }

	function zUserWithdrawal() external {
		require(gmapUsers[msg.sender].nBalance > 0);
		uint nBalance = gmapUsers[msg.sender].nBalance;
		gmapUsers[msg.sender].nBalance = 0;
		msg.sender.transfer(nBalance);
		zEventLog_Withdrawals(nBalance);
	}
address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }

	function zFeesWithdrawal() external onlyByOwner() {
		require(gnTotalFees > 0);
		uint nFees = gnTotalFees;
		gnTotalFees = 0;
		msg.sender.transfer(nFees);
	}
address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }

	function zGetContestDescription() external view returns (string memory sDescription) {
		if (block.timestamp >= gmapContests[gnLastContestID].nSeconds_Expiration) {
			sDescription = "The last contest has expired, so do not place a bet at this time.~nPlease check back often for a new contest.";
		} else {
			sDescription = gmapContests[gnLastContestID].sDescription;
		}
	}
bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
}