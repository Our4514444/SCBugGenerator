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

  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  uint constant MIN_SUBSCRIPTION_DAI_CENTS = 100;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
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

  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  mapping (address => SubscriptionTemplate) public subscriptions;
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
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
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    function unregisterSubscription() external {
        require(subscriptions[msg.sender].daiCents > 0, "No subcription found for address");
        delete subscriptionsBySlug[subscriptions[msg.sender].slug];
        delete subscriptions[msg.sender];
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

}