                                                                 

                                                                                                                                                                                                                                                                          

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
        
    modifier VALIDREFERRERID947(uint256 _referrerId) {	//inject NONSTANDARD NAMING
        require((_referrerId > 0) && (_referrerId < newTreeId), "Invalid referrer ID");
        _;
    }

    modifier ONLYOWNER783 {	//inject NONSTANDARD NAMING
        require(
            msg.sender == ownerWallet,
            "Only owner can call this function."
        );
        _;
    }
    
    modifier ISELIGIBLEBUY826 {	//inject NONSTANDARD NAMING
        require((now - entrance[msg.sender].lastslottime) > 60, "Allowed to buy slot once per minute!");
        _;
    }

    event REGISTERTREEEVENT770(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);	//inject NONSTANDARD NAMING
    event REGISTERPAYPLANEVENT571(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);	//inject NONSTANDARD NAMING
    event REINVESTSLOTEVENT119(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);	//inject NONSTANDARD NAMING

    event PAYDIRECTREFBONUSEVENT240(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);	//inject NONSTANDARD NAMING
    event PAYSPONSORBONUSEVENT488(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);    	//inject NONSTANDARD NAMING
    event PAYPLANREFPAYMENTEVENT754(uint256 amount, address indexed _from, address indexed _to, uint256 _time);	//inject NONSTANDARD NAMING
    event TREEREFPAYMENTEVENT123(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _level, uint256 _time);	//inject NONSTANDARD NAMING


    mapping(address => Tree) public entrance;
    mapping(address => PayPlan) public treePayPlan;
    mapping(uint256 => Slots) public slots;

    mapping(uint256 => address) private idToAddress;
    mapping (uint8 => uint8) public uplineAmount;
    
    uint256 public newTreeId = 1;
    uint256 public newTreeIdPayPlan = 1;

    uint256 public newSlotId = 1;
    uint256 public activeSlot = 1;
    
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
    
    function JOINTREE863(uint256 _referrerId) 	//inject NONSTANDARD NAMING
      public 
      payable 
      VALIDREFERRERID947(_referrerId) 
    {
        
        require(msg.value == 0.15 ether, "Joining amount is 0.15 ETH");
        require(!ISTREEEXISTS282(msg.sender), "Already registered in a Tree");

        address _userAddress = msg.sender;
        address sponsorAddress = idToAddress[_referrerId];
        
        uint32 size;
        assembly {
            size := extcodesize(_userAddress)
        }
        require(size == 0, "cannot be a contract");
               
        entrance[_userAddress] = Tree({
            id: newTreeId,
            referrerCount: uint256(0),
            referrerId: _referrerId,
            earnedFromRef: uint256(0),
            earnedFromPayplan: uint256(0),
            lastslottime: now,
            referrals: new address[](0)
        });
        idToAddress[newTreeId] = _userAddress;

        emit REGISTERTREEEVENT770(newTreeId, msg.sender, sponsorAddress, msg.value, now);
        
        newTreeId++;
        
        entrance[sponsorAddress].referrals.push(_userAddress);
        entrance[sponsorAddress].referrerCount++;
        
        if ( ISTREEEXISTS282(sponsorAddress) ) {
            PAYDIRECTREFBONUS881(sponsorAddress);
            entrance[sponsorAddress].earnedFromRef += 0.05 ether;
        } else {
            PAYDIRECTREFBONUS881(idToAddress[1]);
            entrance[idToAddress[1]].earnedFromRef += 0.05 ether;
        }

        uint256 amountToDistribute = 0.1 ether;

        sponsorAddress = idToAddress[entrance[sponsorAddress].referrerId];

        for (uint8 i = 1; i <= 10; i++) {
            
            if ( ISTREEEXISTS282(sponsorAddress) ) {

                uint256 paid = PAYREFTREE984(sponsorAddress, i);
                amountToDistribute -= paid;
                entrance[sponsorAddress].earnedFromRef += paid;
                address _nextSponsorAddress = idToAddress[entrance[sponsorAddress].referrerId];
                sponsorAddress = _nextSponsorAddress;
            }
            
        }
        
        if (amountToDistribute > 0) {
            PAYDIRECTREFERRAL581(idToAddress[1], amountToDistribute);
            entrance[idToAddress[1]].earnedFromRef += amountToDistribute;
        }
        
    }
    
    function JOINPAYPLAN505() 	//inject NONSTANDARD NAMING
      public 
      payable 
      ISELIGIBLEBUY826()
    {
        require(msg.value == 1 ether, "Participation fee in Pay Plan is 1 ETH");
        require(ISTREEEXISTS282(msg.sender), "Not registered in Tree");

        uint256 eventCount = slots[activeSlot].eventsCount;
        uint256 newEventCount = eventCount + 1;

        if (newEventCount == 3) {
            require(REINVESTSLOT550(
                slots[activeSlot].userAddress, 
                slots[activeSlot].id, 
                idToAddress[entrance[slots[activeSlot].userAddress].referrerId]
            ));
            slots[activeSlot].eventsCount++;
        }
        
        uint256 _referrerId = entrance[msg.sender].referrerId;

        PayPlan memory payPlanUser = PayPlan({
            id: newSlotId,
            referrerId: _referrerId,
            reinvestCount: uint256(0)
        });
        treePayPlan[msg.sender] = payPlanUser;
        
        Slots memory _newSlot = Slots({
            id: newSlotId,
            userAddress: msg.sender,
            referrerId: _referrerId,
            slottime: now,
            eventsCount: uint8(0)
        });

        entrance[msg.sender].lastslottime = now;
        
        slots[newSlotId] = _newSlot;
        newTreeIdPayPlan++;
        
        emit REGISTERPAYPLANEVENT571(newSlotId, msg.sender, idToAddress[_referrerId], msg.value, now);
        
        if (_referrerId > 0) {
            PAYSPONSORBONUS943(idToAddress[_referrerId]);
            entrance[idToAddress[_referrerId]].earnedFromRef += 0.5 ether;
        }
        else{
            PAYSPONSORBONUS943(idToAddress[1]);
            entrance[idToAddress[1]].earnedFromRef += 0.5 ether;
        }

        newSlotId++;

        if (eventCount < 2) {
            
            if(eventCount == 0) {
                PAYUPLINE771(slots[activeSlot].userAddress);
                entrance[slots[activeSlot].userAddress].earnedFromPayplan += msg.value/2;
            }
            if(eventCount == 1) {
                if (slots[activeSlot].referrerId > 0) {
                    PAYUPLINE771(idToAddress[slots[activeSlot].referrerId]);
                    entrance[idToAddress[slots[activeSlot].referrerId]].earnedFromRef += msg.value/2;
                }
                else {
                    PAYUPLINE771(idToAddress[1]);
                    entrance[idToAddress[1]].earnedFromRef += msg.value/2;
                }
            }

            slots[activeSlot].eventsCount++;
            
        }
        
    }

    function REINVESTSLOT550(address _userAddress, uint256 _userId, address _sponsorAddress) private returns (bool _isReinvested) {	//inject NONSTANDARD NAMING

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
        emit REINVESTSLOTEVENT119(newSlotId, _userAddress, _sponsorAddress, msg.value, now);
        newSlotId++;

        slots[activeSlot].eventsCount = 3;
        uint256 _nextActiveSlot = activeSlot+1;

        PAYUPLINE771(slots[_nextActiveSlot].userAddress);
        entrance[slots[_nextActiveSlot].userAddress].earnedFromPayplan += msg.value/2;
        activeSlot++;

        _isReinvested = true;

        return _isReinvested;

    }

    function PAYUPLINE771(address _sponsorAddress) private returns (uint distributeAmount) {        	//inject NONSTANDARD NAMING
        distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PAYPLANREFPAYMENTEVENT754(distributeAmount, msg.sender, _sponsorAddress, now);
        }        
        return distributeAmount;
    }    

    function PAYSPONSORBONUS943(address _sponsorAddress) private {	//inject NONSTANDARD NAMING
        uint256 distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PAYSPONSORBONUSEVENT488(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
    
    // Pays to Ref LEvels from Tree
    function PAYREFTREE984(address _sponsorAddress, uint8 _refLevel) private returns (uint256 distributeAmount) {        	//inject NONSTANDARD NAMING
        require( _refLevel <= 10);
        distributeAmount = 0.1 ether / 100 * uplineAmount[_refLevel];
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit TREEREFPAYMENTEVENT123(distributeAmount, _sponsorAddress, msg.sender, _refLevel, now);
        }        
        return distributeAmount;
    }

    // Pay direct ref bonus from Tree
    function PAYDIRECTREFBONUS881(address _sponsorAddress) private {	//inject NONSTANDARD NAMING
        uint256 distributeAmount = 0.05 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PAYDIRECTREFBONUSEVENT240(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
    
    // Pay to ID 1 from Tree
    function PAYDIRECTREFERRAL581(address _sponsorAddress, uint256 payAmount) private returns (uint256 distributeAmount) {        	//inject NONSTANDARD NAMING
        distributeAmount = payAmount;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PAYDIRECTREFBONUSEVENT240(distributeAmount, _sponsorAddress, msg.sender, now);
        }        
        return distributeAmount;        
    }
    
    function ISTREEEXISTS282(address _userAddress) public view returns (bool) {	//inject NONSTANDARD NAMING
        return (entrance[_userAddress].id != 0);
    }
    
    function GETTREEREFERRALS736(address _userAddress)	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory)
      {
        return entrance[_userAddress].referrals;
      }
    
}