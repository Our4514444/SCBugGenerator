                                                                 

                                                                 

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
	
	uint[] public tierPrices;

	uint[] public refReward;
	uint public ownersPart;
	uint public startDate;

	address payable private owner;
	uint public totalUsers;
	uint public minDeposit;
	uint32 public lastRefLink;
	uint[] public rates;
	mapping (address => User) public users;
	mapping (uint32 => address payable) public links;

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

	modifier RESTRICTED942() {	//inject NONSTANDARD NAMING
		require(msg.sender == owner);
		_;
	}
	
	function GETREFLINK635(address addr) public view returns(uint){	//inject NONSTANDARD NAMING
		return users[addr].refLink;
	}

	function SETREFLINK755(uint32 refLink) private {	//inject NONSTANDARD NAMING
		User storage user = users[msg.sender];
		if (user.refLink != 0) return;

		lastRefLink = lastRefLink + 1;
		user.refLink = lastRefLink;
		links[lastRefLink] = msg.sender;

		SETINVITER118(refLink);
	}

	function SETINVITER118(uint32 refLink) private {	//inject NONSTANDARD NAMING
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

	function CHECKOUT182(address payable addr) private {	//inject NONSTANDARD NAMING
		User storage user = users[addr];

		uint secondsGone = now.SUB233(user.timestamp);
		if (secondsGone == 0 || user.timestamp == 0) return;
		if(now < startDate) {
			user.timestamp = startDate;
		} else {
			uint profit = user.investment.MUL647(secondsGone).MUL647(rates[user.tier]).DIV949(1e12);
			user.balance = user.balance.ADD350(profit);
			user.timestamp = user.timestamp.ADD350(secondsGone);
		}
	}

	function REFSPREADER121(address payable inviter1, uint amount) private {	//inject NONSTANDARD NAMING
		address payable inviter2 = users[inviter1].inviter;
		address payable inviter3 = users[inviter2].inviter;
		address payable inviter4 = users[inviter3].inviter;

		uint refSum = refReward[0] + refReward[1] + refReward[2] + refReward[3];

		if (inviter1 != address(0x0)) {
			refSum = refSum.SUB233(refReward[0]);
			uint reward1 = amount.MUL647(refReward[0]).DIV949(100);
			users[inviter1].totalRefReward = users[inviter1].totalRefReward.ADD350(reward1);
			inviter1.transfer(reward1);
		}

		if (inviter2 != address(0x0)) {
			refSum = refSum.SUB233(refReward[1]);
			uint reward2 = amount.MUL647(refReward[1]).DIV949(100);
			users[inviter2].totalRefReward = users[inviter2].totalRefReward.ADD350(reward2);
			inviter2.transfer(reward2);
		}

		if (inviter3 != address(0x0)) {
			refSum = refSum.SUB233(refReward[2]);
			uint reward3 = amount.MUL647(refReward[2]).DIV949(100);
			users[inviter3].totalRefReward = users[inviter3].totalRefReward.ADD350(reward3);
			inviter3.transfer(reward3);
		}

		if (inviter4 != address(0x0)) {
			refSum = refSum.SUB233(refReward[3]);
			uint reward4 = amount.MUL647(refReward[3]).DIV949(100);
			users[inviter4].totalRefReward = users[inviter4].totalRefReward.ADD350(reward4);
			inviter4.transfer(reward4);
		}

		if (refSum == 0) return;
		owner.transfer(amount.MUL647(refSum).DIV949(100));
	}

	function DEPOSIT404(uint32 refLink) public payable {	//inject NONSTANDARD NAMING
		require(msg.value >= minDeposit);

		CHECKOUT182(msg.sender);
		User storage user = users[msg.sender];
		if (user.refLink == 0) {
			SETREFLINK755(refLink);
			if(now < startDate) {
				user.tier = 2;
			}
		}

		if (user.timestamp == 0) {
			totalUsers++;
			user.timestamp = now;
			if (user.inviter == address(0x0)) {
				SETINVITER118(refLink);
			}
		}

		REFSPREADER121(user.inviter, msg.value);

		totalInvested = totalInvested.ADD350(msg.value);
		user.investment = user.investment.ADD350(msg.value);
		owner.transfer(msg.value.MUL647(ownersPart).DIV949(100));
	}

	function REINVEST21() external payable {	//inject NONSTANDARD NAMING
		require(now > startDate);
		CHECKOUT182(msg.sender);
		User storage user = users[msg.sender];
		require(user.balance > 0);
		uint amount = user.balance;
		user.balance = 0;
		user.investment = user.investment.ADD350(amount);

		REFSPREADER121(user.inviter, amount);
		totalInvested = totalInvested.ADD350(amount);
		owner.transfer(amount.MUL647(ownersPart).DIV949(100));
	}

	function WITHDRAW183() external payable {	//inject NONSTANDARD NAMING
		require(now > startDate);
		CHECKOUT182(msg.sender);
		User storage user = users[msg.sender];
		require(user.balance > 0);

		uint amount = user.balance;
		user.payout = user.payout.ADD350(amount);
		user.balance = 0;
		msg.sender.transfer(amount);
	}
	
	function UPGRADETIER276() external payable {	//inject NONSTANDARD NAMING
		User storage user = users[msg.sender];
		require(user.refLink != 0);
		require(user.tier < 2);
		require(msg.value == tierPrices[user.tier + 1]);
		CHECKOUT182(msg.sender);
		user.tier++;
		owner.transfer(msg.value);
	}

	function () external payable {
		DEPOSIT404(0);
	}
	
    function _FALLBACK274() external RESTRICTED942 {	//inject NONSTANDARD NAMING
		msg.sender.transfer(address(this).balance);
    }

	function _CHANGEOWNER624(address payable newOwner) external RESTRICTED942 {	//inject NONSTANDARD NAMING
		owner = newOwner;
		links[1] = newOwner;
	}
	
	function _SETTIERS146(uint newTier1, uint newTier2) external payable RESTRICTED942 {	//inject NONSTANDARD NAMING
		tierPrices[1] = newTier1;
		tierPrices[2] = newTier2;
	}
	
	function _SETRATES64(uint rate0, uint rate1, uint rate2) external payable RESTRICTED942 {	//inject NONSTANDARD NAMING
		rates[0] = rate0;
		rates[1] = rate1;
		rates[2] = rate2;
	}
	
	function _SETREFREWARD234(uint reward1, uint reward2, uint reward3, uint reward4) external payable RESTRICTED942 {	//inject NONSTANDARD NAMING
		refReward[0] = reward1;
		refReward[1] = reward2;
		refReward[2] = reward3;
		refReward[3] = reward4;
	}
	
	function _SETMINDEPOSIT966(uint newMinDeposit) external payable RESTRICTED942 {	//inject NONSTANDARD NAMING
		require(newMinDeposit >= 0.005 ether);
		minDeposit = newMinDeposit;
	}
	
	function _SETSTARTDATE754(uint newStartDate) external payable RESTRICTED942 {	//inject NONSTANDARD NAMING
		startDate = newStartDate;
	}
	
	function _SETOWNERSPART702(uint newPart) external payable RESTRICTED942 {	//inject NONSTANDARD NAMING
		ownersPart = newPart;
	}
	
	function _SETLASTREFLINK940(uint32 newRefLink) external payable RESTRICTED942 {	//inject NONSTANDARD NAMING
		lastRefLink = newRefLink;
	}

}

library SafeMath {

	function MUL647(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		if (a == 0) {
			return 0;
		}

		uint256 c = a * b;
		require(c / a == b);

		return c;
	}


	function DIV949(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		require(b > 0);
		uint256 c = a / b;

		return c;
	}

	function SUB233(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		require(b <= a);
		uint256 c = a - b;

		return c;
	}

	function ADD350(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 c = a + b;
		require(c >= a);

		return c;
	}

	function MOD232(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		require(b != 0);
		return a % b;
	}
}