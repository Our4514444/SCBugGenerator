                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity 0.5.2;

contract SubscryptoMeta {

    uint constant min_subscription_dai_cents942 = 100;	//inject NONSTANDARD NAMING

    event REGISTER307(address indexed receiver);	//inject NONSTANDARD NAMING

    struct SubscriptionTemplate {
        bytes32     slug;
        string      name;
        string      description;
        string      url;
        uint        daiCents;        // 32 bytes
        address     receiver;        // 20 bytes
        uint32      interval;        //  4 bytes
    }

    mapping (address => SubscriptionTemplate) public subscriptions;
    mapping (bytes32 => SubscriptionTemplate) public subscriptionsBySlug;


    function REGISTERSUBSCRIPTION984(	//inject NONSTANDARD NAMING
        bytes32 slug, 
        string calldata name, 
        string calldata description, 
        string calldata url,
        uint daiCents, 
        uint32 interval) external 
    {
        require(daiCents >= min_subscription_dai_cents942, "Subsciption amount too low");
        require(interval >= 86400, "Interval must be at least 1 day");
        require(interval <= 31557600, "Interval must be at most 1 year");
        require(subscriptionsBySlug[slug].daiCents == 0 || subscriptionsBySlug[slug].receiver == msg.sender, "Slug is already reserved");

        subscriptions[msg.sender] = SubscriptionTemplate(slug, name, description, url, daiCents, msg.sender, interval);
        subscriptionsBySlug[slug] = subscriptions[msg.sender];

        emit REGISTER307(msg.sender);
    }

    function UNREGISTERSUBSCRIPTION804() external {	//inject NONSTANDARD NAMING
        require(subscriptions[msg.sender].daiCents > 0, "No subcription found for address");
        delete subscriptionsBySlug[subscriptions[msg.sender].slug];
        delete subscriptions[msg.sender];
    }

}