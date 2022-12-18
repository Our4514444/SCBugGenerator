/**
 *Submitted for verification at Etherscan.io on 2020-06-12
*/

/**
* ==========================================================
*
* The Friends Tree
* Why can't we be friends?
* 
* Website  : https://frndstree.io
* Telegram : https://t.me/thefriendstree_official
*
* ==========================================================
**/

pragma solidity >=0.5.12 <0.7.0;

contract TheFriendsTree {

    struct Tree {
        uint256 id;
        uint256 referrerCount;
        uint256 referrerId;
        uint256 earnedFromRef;
        uint256 earnedFromPayplan;
        uint256 lastslottime;
        address[] referrals;
    }
    
    struct PayPlan {
        uint256 id;
        uint256 referrerId;
        uint256 reinvestCount;
    }
    
    struct Slots {
        uint256 id;
        address userAddress;
        uint256 referrerId;
        uint256 slottime;
        uint8 eventsCount;
    }
        
    modifier validReferrerId(uint256 _referrerId) {
        require((_referrerId > 0) && (_referrerId < newTreeId), "Invalid referrer ID");
        _;
    }

    modifier onlyOwner {
        require(
            msg.sender == ownerWallet,
            "Only owner can call this function."
        );
        _;
    }
    
    modifier isEligibleBuy {
        require((now - entrance[msg.sender].lastslottime) > 60, "Allowed to buy slot once per minute!");
        _;
    }

    event RegisterTreeEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);
    event RegisterPayPlanEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);
    event ReinvestSlotEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);

    event PayDirectRefBonusEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);
    event PaySponsorBonusEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);    
    event PayPlanRefPaymentEvent(uint256 amount, address indexed _from, address indexed _to, uint256 _time);
    event TreeRefPaymentEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _level, uint256 _time);


    mapping(address => Tree) internal entrance;
    mapping(address => PayPlan) internal treePayPlan;
    mapping(uint256 => Slots) internal slots;

    mapping(uint256 => address) private idToAddress;
    mapping (uint8 => uint8) public uplineAmount;
    
    uint256 internal newTreeId = 1;
    uint256 internal newTreeIdPayPlan = 1;

    uint256 internal newSlotId = 1;
    uint256 internal activeSlot = 1;
    
    address public owner;
    address payable ownerWallet;
    
    constructor(address _ownerAddress) public {
        
        uplineAmount[1] = 10;
        uplineAmount[2] = 10;
        uplineAmount[3] = 10;
        uplineAmount[4] = 10;
        uplineAmount[5] = 10;
        uplineAmount[6] = 10;
        uplineAmount[7] = 10;
        uplineAmount[8] = 10;
        uplineAmount[9] = 10;
        uplineAmount[10] = 10;
        
        owner = _ownerAddress;
        ownerWallet = msg.sender;
        
        Tree memory user = Tree({
            id: newTreeId,
            referrerCount: uint256(0),
            referrerId: uint256(0),
            earnedFromRef: uint256(0),
            earnedFromPayplan: uint256(0),
            lastslottime: now,
            referrals: new address[](0)
        });
        
        entrance[_ownerAddress] = user;
        idToAddress[newTreeId] = _ownerAddress;
        
        newTreeId++;
        
        //////
        
        PayPlan memory payPlanUser = PayPlan({
            id: newSlotId,
            referrerId: uint256(0),
            reinvestCount: uint256(0)
        });
        
        treePayPlan[_ownerAddress] = payPlanUser;
        
        Slots memory newSlot = Slots({
            id: newSlotId,
            userAddress: _ownerAddress,
            referrerId: uint256(0),
            slottime: now,
            eventsCount: uint8(0)
        });
        
        slots[newSlotId] = newSlot;
        newTreeIdPayPlan++;
        newSlotId++;
        
    }
    
    function joinTree(uint256 _referrerId) 
      public 
      payable 
      validReferrerId(_referrerId) 
    {
        
        require(msg.value == 0.15 ether, "Joining amount is 0.15 ETH");
        require(!isTreeExists(msg.sender), "Already registered in a Tree");

        address _userAddress = msg.sender;
        address sponsorAddress = idToAddress[_referrerId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint32 size;
        assembly {
            size := extcodesize(_userAddress)
        }
        require(size == 0, "cannot be a contract");
               
        entrance[_userAddress] = Tree({	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            id: newTreeId,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            referrerCount: uint256(0),
            referrerId: _referrerId,
            earnedFromRef: uint256(0),
            earnedFromPayplan: uint256(0),
            lastslottime: now,
            referrals: new address[](0)
        });
        idToAddress[newTreeId] = _userAddress;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        emit RegisterTreeEvent(newTreeId, msg.sender, sponsorAddress, msg.value, now);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        newTreeId++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        entrance[sponsorAddress].referrals.push(_userAddress);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        entrance[sponsorAddress].referrerCount++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        if ( isTreeExists(sponsorAddress) ) {
            payDirectRefBonus(sponsorAddress);
            entrance[sponsorAddress].earnedFromRef += 0.05 ether;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            payDirectRefBonus(idToAddress[1]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            entrance[idToAddress[1]].earnedFromRef += 0.05 ether;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        uint256 amountToDistribute = 0.1 ether;

        sponsorAddress = idToAddress[entrance[sponsorAddress].referrerId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        for (uint8 i = 1; i <= 10; i++) {
            
            if ( isTreeExists(sponsorAddress) ) {

                uint256 paid = payRefTree(sponsorAddress, i);
                amountToDistribute -= paid;
                entrance[sponsorAddress].earnedFromRef += paid;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                address _nextSponsorAddress = idToAddress[entrance[sponsorAddress].referrerId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                sponsorAddress = _nextSponsorAddress;
            }
            
        }
        
        if (amountToDistribute > 0) {
            payDirectReferral(idToAddress[1], amountToDistribute);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            entrance[idToAddress[1]].earnedFromRef += amountToDistribute;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
    }
    
    function JoinPayPlan() 
      public 
      payable 
      isEligibleBuy()
    {
        require(msg.value == 1 ether, "Participation fee in Pay Plan is 1 ETH");
        require(isTreeExists(msg.sender), "Not registered in Tree");

        uint256 eventCount = slots[activeSlot].eventsCount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint256 newEventCount = eventCount + 1;

        if (newEventCount == 3) {
            require(reinvestSlot(
                slots[activeSlot].userAddress, 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                slots[activeSlot].id, 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                idToAddress[entrance[slots[activeSlot].userAddress].referrerId]	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            ));
            slots[activeSlot].eventsCount++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        uint256 _referrerId = entrance[msg.sender].referrerId;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        PayPlan memory payPlanUser = PayPlan({
            id: newSlotId,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            referrerId: _referrerId,
            reinvestCount: uint256(0)
        });
        treePayPlan[msg.sender] = payPlanUser;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        Slots memory _newSlot = Slots({
            id: newSlotId,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            userAddress: msg.sender,
            referrerId: _referrerId,
            slottime: now,
            eventsCount: uint8(0)
        });

        entrance[msg.sender].lastslottime = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        slots[newSlotId] = _newSlot;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        newTreeIdPayPlan++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit RegisterPayPlanEvent(newSlotId, msg.sender, idToAddress[_referrerId], msg.value, now);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        if (_referrerId > 0) {
            paySponsorBonus(idToAddress[_referrerId]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            entrance[idToAddress[_referrerId]].earnedFromRef += 0.5 ether;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        else{
            paySponsorBonus(idToAddress[1]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            entrance[idToAddress[1]].earnedFromRef += 0.5 ether;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        newSlotId++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        if (eventCount < 2) {
            
            if(eventCount == 0) {
                payUpline(slots[activeSlot].userAddress);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                entrance[slots[activeSlot].userAddress].earnedFromPayplan += msg.value/2;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            }
            if(eventCount == 1) {
                if (slots[activeSlot].referrerId > 0) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                    payUpline(idToAddress[slots[activeSlot].referrerId]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                    entrance[idToAddress[slots[activeSlot].referrerId]].earnedFromRef += msg.value/2;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                }
                else {
                    payUpline(idToAddress[1]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                    entrance[idToAddress[1]].earnedFromRef += msg.value/2;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                }
            }

            slots[activeSlot].eventsCount++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            
        }
        
    }

    function reinvestSlot(address _userAddress, uint256 _userId, address _sponsorAddress) private returns (bool _isReinvested) {

        uint256 _referrerId = entrance[_userAddress].referrerId;

        Slots memory _reinvestslot = Slots({
            id: _userId,
            userAddress: _userAddress,
            referrerId: _referrerId,
            slottime: now,
            eventsCount: uint8(0)
        });
        
        treePayPlan[slots[activeSlot].userAddress].reinvestCount++;        
        slots[newSlotId] = _reinvestslot;
        emit ReinvestSlotEvent(newSlotId, _userAddress, _sponsorAddress, msg.value, now);
        newSlotId++;

        slots[activeSlot].eventsCount = 3;
        uint256 _nextActiveSlot = activeSlot+1;

        payUpline(slots[_nextActiveSlot].userAddress);
        entrance[slots[_nextActiveSlot].userAddress].earnedFromPayplan += msg.value/2;
        activeSlot++;

        _isReinvested = true;

        return _isReinvested;

    }

    function payUpline(address _sponsorAddress) private returns (uint distributeAmount) {        
        distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayPlanRefPaymentEvent(distributeAmount, msg.sender, _sponsorAddress, now);
        }        
        return distributeAmount;
    }    

    function paySponsorBonus(address _sponsorAddress) private {
        uint256 distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PaySponsorBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
    
    // Pays to Ref LEvels from Tree
    function payRefTree(address _sponsorAddress, uint8 _refLevel) private returns (uint256 distributeAmount) {        
        require( _refLevel <= 10);
        distributeAmount = 0.1 ether / 100 * uplineAmount[_refLevel];
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit TreeRefPaymentEvent(distributeAmount, _sponsorAddress, msg.sender, _refLevel, now);
        }        
        return distributeAmount;
    }

    // Pay direct ref bonus from Tree
    function payDirectRefBonus(address _sponsorAddress) private {
        uint256 distributeAmount = 0.05 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayDirectRefBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
    
    // Pay to ID 1 from Tree
    function payDirectReferral(address _sponsorAddress, uint256 payAmount) private returns (uint256 distributeAmount) {        
        distributeAmount = payAmount;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayDirectRefBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }        
        return distributeAmount;        
    }
    
    function isTreeExists(address _userAddress) public view returns (bool) {
        return (entrance[_userAddress].id != 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getTreeReferrals(address _userAddress)
        public
        view
        returns (address[] memory)
      {
        return entrance[_userAddress].referrals;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      }
    
}