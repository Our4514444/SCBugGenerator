/*  
    Subscrypto
    Copyright (C) 2019 Subscrypto Team

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity 0.5.2;

contract SubscryptoMeta {

  mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
  uint constant MIN_SUBSCRIPTION_DAI_CENTS = 100;

  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event Register(address indexed receiver);

    struct SubscriptionTemplate {
        bytes32     slug;
        string      name;
        string      description;
        string      url;
        uint        daiCents;        // 32 bytes
        address     receiver;        // 20 bytes
        uint32      interval;        //  4 bytes
    }

  address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
  mapping (address => SubscriptionTemplate) public subscriptions;
  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  mapping (bytes32 => SubscriptionTemplate) public subscriptionsBySlug;


    function registerSubscription(
        bytes32 slug, 
        string calldata name, 
        string calldata description, 
        string calldata url,
        uint daiCents, 
        uint32 interval) external 
    {
        require(daiCents >= MIN_SUBSCRIPTION_DAI_CENTS, "Subsciption amount too low");
        require(interval >= 86400, "Interval must be at least 1 day");
        require(interval <= 31557600, "Interval must be at most 1 year");
        require(subscriptionsBySlug[slug].daiCents == 0 || subscriptionsBySlug[slug].receiver == msg.sender, "Slug is already reserved");

        subscriptions[msg.sender] = SubscriptionTemplate(slug, name, description, url, daiCents, msg.sender, interval);
        subscriptionsBySlug[slug] = subscriptions[msg.sender];

        emit Register(msg.sender);
    }
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }

    function unregisterSubscription() external {
        require(subscriptions[msg.sender].daiCents > 0, "No subcription found for address");
        delete subscriptionsBySlug[subscriptions[msg.sender].slug];
        delete subscriptions[msg.sender];
    }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }

}