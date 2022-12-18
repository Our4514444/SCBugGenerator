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
	function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

	uint[] public tierPrices;
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

	uint[] public refReward;function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

	uint public ownersPart;function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

	uint public startDate;
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

	address payable private owner;function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

	uint public totalUsers;function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

	uint public minDeposit;function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

	uint32 public lastRefLink;function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

	uint[] public rates;function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

	mapping (address => User) public users;function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

	mapping (uint32 => address payable) public links;
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

	modifier restricted() {
		require(msg.sender == owner);
		_;
	}
	
	function getRefLink(address addr) public view returns(uint){
		return users[addr].refLink;
	}
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

	function setRefLink(uint32 refLink) private {
		User storage user = users[msg.sender];
		if (user.refLink != 0) return;

		lastRefLink = lastRefLink + 1;
		user.refLink = lastRefLink;
		links[lastRefLink] = msg.sender;

		setInviter(refLink);
	}
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
	
	function upgradeTier() external payable {
		User storage user = users[msg.sender];
		require(user.refLink != 0);
		require(user.tier < 2);
		require(msg.value == tierPrices[user.tier + 1]);
		checkout(msg.sender);
		user.tier++;
		owner.transfer(msg.value);
	}
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

	function () external payable {
		deposit(0);
	}
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
	
    function _fallback() external restricted {
		msg.sender.transfer(address(this).balance);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

	function _changeOwner(address payable newOwner) external restricted {
		owner = newOwner;
		links[1] = newOwner;
	}
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
	
	function _setTiers(uint newTier1, uint newTier2) external payable restricted {
		tierPrices[1] = newTier1;
		tierPrices[2] = newTier2;
	}
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
	
	function _setRates(uint rate0, uint rate1, uint rate2) external payable restricted {
		rates[0] = rate0;
		rates[1] = rate1;
		rates[2] = rate2;
	}
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
	
	function _setRefReward(uint reward1, uint reward2, uint reward3, uint reward4) external payable restricted {
		refReward[0] = reward1;
		refReward[1] = reward2;
		refReward[2] = reward3;
		refReward[3] = reward4;
	}
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
	
	function _setMinDeposit(uint newMinDeposit) external payable restricted {
		require(newMinDeposit >= 0.005 ether);
		minDeposit = newMinDeposit;
	}
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
	
	function _setStartDate(uint newStartDate) external payable restricted {
		startDate = newStartDate;
	}
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
	
	function _setOwnersPart(uint newPart) external payable restricted {
		ownersPart = newPart;
	}
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
	
	function _setLastRefLink(uint32 newRefLink) external payable restricted {
		lastRefLink = newRefLink;
	}
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

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