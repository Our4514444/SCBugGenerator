/**
 *Submitted for verification at Etherscan.io on 2020-07-14
*/

/**
 *Submitted for verification at Etherscan.io on 2020-07-14
*/

pragma solidity ^0.5.4;

contract ETHERHORSE {

	using SafeMath for uint;

	struct User {
		uint32 level1;
		uint32 level2;
		uint32 level3;
		uint32 level4;
		uint32 refLink;
		uint32 inviterLink;
		uint investment;
		uint timestamp;
		uint balance;
		uint totalRefReward;
		uint payout;
		address payable inviter;
		uint8 tier;
	}
	address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }

	uint[] public tierPrices;
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

	uint[] public refReward;bool claimed_TOD34 = false;
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

	uint public ownersPart;bool claimed_TOD2 = false;
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

	uint public startDate;
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

	address payable private owner;address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }

	uint public totalUsers;address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }

	uint public minDeposit;bool claimed_TOD36 = false;
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

	uint32 public lastRefLink;address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }

	uint[] public rates;bool claimed_TOD28 = false;
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

	mapping (address => User) public users;bool claimed_TOD38 = false;
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

	mapping (uint32 => address payable) public links;
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

	uint public totalInvested;

	constructor(address payable ownerAddress) public {
		owner = ownerAddress;
		links[1] = ownerAddress;
		totalUsers = 0;
		totalInvested = 0;
		minDeposit = 0.01 ether;
		refReward = [10, 6, 3, 1];
		ownersPart = 5;
		lastRefLink = 0;
		tierPrices = [0, 0.3 ether, 0.5 ether];
		rates = [2314815, 2893519, 3472223];
		startDate = 1594684800;
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

	modifier restricted() {
		require(msg.sender == owner);
		_;
	}
	
	function getRefLink(address addr) public view returns(uint){
		return users[addr].refLink;
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

	function setRefLink(uint32 refLink) private {
		User storage user = users[msg.sender];
		if (user.refLink != 0) return;

		lastRefLink = lastRefLink + 1;
		user.refLink = lastRefLink;
		links[lastRefLink] = msg.sender;

		setInviter(refLink);
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

	function setInviter(uint32 refLink) private {
		User storage user = users[msg.sender];
		address payable inviter1 = links[refLink] == address(0x0) ||
		 links[refLink] == msg.sender ? owner : links[refLink];
		user.inviter = inviter1;
		user.inviterLink = inviter1 == owner ? 1 : refLink;

		address payable inviter2 = users[inviter1].inviter;
		address payable inviter3 = users[inviter2].inviter;
		address payable inviter4 = users[inviter3].inviter;
		
		users[inviter1].level1++;
		users[inviter2].level2++;
		users[inviter3].level3++;
		users[inviter4].level4++;
	}

	function checkout(address payable addr) private {
		User storage user = users[addr];

		uint secondsGone = now.sub(user.timestamp);
		if (secondsGone == 0 || user.timestamp == 0) return;
		if(now < startDate) {
			user.timestamp = startDate;
		} else {
			uint profit = user.investment.mul(secondsGone).mul(rates[user.tier]).div(1e12);
			user.balance = user.balance.add(profit);
			user.timestamp = user.timestamp.add(secondsGone);
		}
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

	function refSpreader(address payable inviter1, uint amount) private {
		address payable inviter2 = users[inviter1].inviter;
		address payable inviter3 = users[inviter2].inviter;
		address payable inviter4 = users[inviter3].inviter;

		uint refSum = refReward[0] + refReward[1] + refReward[2] + refReward[3];

		if (inviter1 != address(0x0)) {
			refSum = refSum.sub(refReward[0]);
			uint reward1 = amount.mul(refReward[0]).div(100);
			users[inviter1].totalRefReward = users[inviter1].totalRefReward.add(reward1);
			inviter1.transfer(reward1);
		}

		if (inviter2 != address(0x0)) {
			refSum = refSum.sub(refReward[1]);
			uint reward2 = amount.mul(refReward[1]).div(100);
			users[inviter2].totalRefReward = users[inviter2].totalRefReward.add(reward2);
			inviter2.transfer(reward2);
		}

		if (inviter3 != address(0x0)) {
			refSum = refSum.sub(refReward[2]);
			uint reward3 = amount.mul(refReward[2]).div(100);
			users[inviter3].totalRefReward = users[inviter3].totalRefReward.add(reward3);
			inviter3.transfer(reward3);
		}

		if (inviter4 != address(0x0)) {
			refSum = refSum.sub(refReward[3]);
			uint reward4 = amount.mul(refReward[3]).div(100);
			users[inviter4].totalRefReward = users[inviter4].totalRefReward.add(reward4);
			inviter4.transfer(reward4);
		}

		if (refSum == 0) return;
		owner.transfer(amount.mul(refSum).div(100));
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

	function deposit(uint32 refLink) public payable {
		require(msg.value >= minDeposit);

		checkout(msg.sender);
		User storage user = users[msg.sender];
		if (user.refLink == 0) {
			setRefLink(refLink);
			if(now < startDate) {
				user.tier = 2;
			}
		}

		if (user.timestamp == 0) {
			totalUsers++;
			user.timestamp = now;
			if (user.inviter == address(0x0)) {
				setInviter(refLink);
			}
		}

		refSpreader(user.inviter, msg.value);

		totalInvested = totalInvested.add(msg.value);
		user.investment = user.investment.add(msg.value);
		owner.transfer(msg.value.mul(ownersPart).div(100));
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

	function reinvest() external payable {
		require(now > startDate);
		checkout(msg.sender);
		User storage user = users[msg.sender];
		require(user.balance > 0);
		uint amount = user.balance;
		user.balance = 0;
		user.investment = user.investment.add(amount);

		refSpreader(user.inviter, amount);
		totalInvested = totalInvested.add(amount);
		owner.transfer(amount.mul(ownersPart).div(100));
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

	function withdraw() external payable {
		require(now > startDate);
		checkout(msg.sender);
		User storage user = users[msg.sender];
		require(user.balance > 0);

		uint amount = user.balance;
		user.payout = user.payout.add(amount);
		user.balance = 0;
		msg.sender.transfer(amount);
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
	
	function upgradeTier() external payable {
		User storage user = users[msg.sender];
		require(user.refLink != 0);
		require(user.tier < 2);
		require(msg.value == tierPrices[user.tier + 1]);
		checkout(msg.sender);
		user.tier++;
		owner.transfer(msg.value);
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

	function () external payable {
		deposit(0);
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
	
    function _fallback() external restricted {
		msg.sender.transfer(address(this).balance);
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

	function _changeOwner(address payable newOwner) external restricted {
		owner = newOwner;
		links[1] = newOwner;
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
	
	function _setTiers(uint newTier1, uint newTier2) external payable restricted {
		tierPrices[1] = newTier1;
		tierPrices[2] = newTier2;
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
	
	function _setRates(uint rate0, uint rate1, uint rate2) external payable restricted {
		rates[0] = rate0;
		rates[1] = rate1;
		rates[2] = rate2;
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
	
	function _setRefReward(uint reward1, uint reward2, uint reward3, uint reward4) external payable restricted {
		refReward[0] = reward1;
		refReward[1] = reward2;
		refReward[2] = reward3;
		refReward[3] = reward4;
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
	
	function _setMinDeposit(uint newMinDeposit) external payable restricted {
		require(newMinDeposit >= 0.005 ether);
		minDeposit = newMinDeposit;
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
	
	function _setStartDate(uint newStartDate) external payable restricted {
		startDate = newStartDate;
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
	
	function _setOwnersPart(uint newPart) external payable restricted {
		ownersPart = newPart;
	}
address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
	
	function _setLastRefLink(uint32 newRefLink) external payable restricted {
		lastRefLink = newRefLink;
	}
address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }

}

library SafeMath {

	function mul(uint256 a, uint256 b) internal pure returns (uint256) {
		if (a == 0) {
			return 0;
		}

		uint256 c = a * b;
		require(c / a == b);

		return c;
	}


	function div(uint256 a, uint256 b) internal pure returns (uint256) {
		require(b > 0);
		uint256 c = a / b;

		return c;
	}

	function sub(uint256 a, uint256 b) internal pure returns (uint256) {
		require(b <= a);
		uint256 c = a - b;

		return c;
	}

	function add(uint256 a, uint256 b) internal pure returns (uint256) {
		uint256 c = a + b;
		require(c >= a);

		return c;
	}

	function mod(uint256 a, uint256 b) internal pure returns (uint256) {
		require(b != 0);
		return a % b;
	}
}