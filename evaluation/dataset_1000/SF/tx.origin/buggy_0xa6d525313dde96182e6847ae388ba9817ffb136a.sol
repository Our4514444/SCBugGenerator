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

  function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
  uint constant MIN_SUBSCRIPTION_DAI_CENTS = 100;

  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
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

  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  mapping (address => SubscriptionTemplate) public subscriptions;
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
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
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}

    function unregisterSubscription() external {
        require(subscriptions[msg.sender].daiCents > 0, "No subcription found for address");
        delete subscriptionsBySlug[subscriptions[msg.sender].slug];
        delete subscriptions[msg.sender];
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

}