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

  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  uint constant MIN_SUBSCRIPTION_DAI_CENTS = 100;

  uint256 bugv_tmstmp1 = block.timestamp;
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

  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => SubscriptionTemplate) public subscriptions;
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
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

      uint256 bugv_tmstmp5 = block.timestamp;
  emit Register(msg.sender);
    }
uint256 bugv_tmstmp2 = block.timestamp;

    function unregisterSubscription() external {
        require(subscriptions[msg.sender].daiCents > 0, "No subcription found for address");
        delete subscriptionsBySlug[subscriptions[msg.sender].slug];
      uint256 bugv_tmstmp4 = block.timestamp;
  delete subscriptions[msg.sender];
    }
uint256 bugv_tmstmp3 = block.timestamp;

}