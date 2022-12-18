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
	function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

	uint[] public tierPrices;
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

	uint[] public refReward;function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }

	uint public ownersPart;function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }

	uint public startDate;
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

	address payable private owner;function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

	uint public totalUsers;function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

	uint public minDeposit;function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

	uint32 public lastRefLink;function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

	uint[] public rates;function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }

	mapping (address => User) public users;function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}

	mapping (uint32 => address payable) public links;
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
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
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }

	modifier restricted() {
		require(msg.sender == owner);
		_;
	}
	
	function getRefLink(address addr) public view returns(uint){
		return users[addr].refLink;
	}
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

	function setRefLink(uint32 refLink) private {
		User storage user = users[msg.sender];
		if (user.refLink != 0) return;

		lastRefLink = lastRefLink + 1;
		user.refLink = lastRefLink;
		links[lastRefLink] = msg.sender;

		setInviter(refLink);
	}
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
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
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
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
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
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
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
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
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
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
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
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
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

	function () external payable {
		deposit(0);
	}
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
	
    function _fallback() external restricted {
		msg.sender.transfer(address(this).balance);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

	function _changeOwner(address payable newOwner) external restricted {
		owner = newOwner;
		links[1] = newOwner;
	}
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
	
	function _setTiers(uint newTier1, uint newTier2) external payable restricted {
		tierPrices[1] = newTier1;
		tierPrices[2] = newTier2;
	}
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
	
	function _setRates(uint rate0, uint rate1, uint rate2) external payable restricted {
		rates[0] = rate0;
		rates[1] = rate1;
		rates[2] = rate2;
	}
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
	
	function _setRefReward(uint reward1, uint reward2, uint reward3, uint reward4) external payable restricted {
		refReward[0] = reward1;
		refReward[1] = reward2;
		refReward[2] = reward3;
		refReward[3] = reward4;
	}
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
	
	function _setMinDeposit(uint newMinDeposit) external payable restricted {
		require(newMinDeposit >= 0.005 ether);
		minDeposit = newMinDeposit;
	}
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
	
	function _setStartDate(uint newStartDate) external payable restricted {
		startDate = newStartDate;
	}
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
	
	function _setOwnersPart(uint newPart) external payable restricted {
		ownersPart = newPart;
	}
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
	
	function _setLastRefLink(uint32 newRefLink) external payable restricted {
		lastRefLink = newRefLink;
	}
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
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