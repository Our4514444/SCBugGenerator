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

  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event RegisterTreeEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event RegisterPayPlanEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);
  uint256 bugv_tmstmp4 = block.timestamp;
  event ReinvestSlotEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);

  uint256 bugv_tmstmp5 = block.timestamp;
  event PayDirectRefBonusEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);
  uint256 bugv_tmstmp2 = block.timestamp;
  event PaySponsorBonusEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);    
  uint256 bugv_tmstmp3 = block.timestamp;
  event PayPlanRefPaymentEvent(uint256 amount, address indexed _from, address indexed _to, uint256 _time);
  uint256 bugv_tmstmp1 = block.timestamp;
  event TreeRefPaymentEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _level, uint256 _time);


  function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping(address => Tree) public entrance;
  address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  mapping(address => PayPlan) public treePayPlan;
  function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping(uint256 => Slots) public slots;

  address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  mapping(uint256 => address) private idToAddress;
  function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (uint8 => uint8) public uplineAmount;
    
  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public newTreeId = 1;
  function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint256 public newTreeIdPayPlan = 1;

  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  uint256 public newSlotId = 1;
  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public activeSlot = 1;
    
  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  address public owner;
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
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
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    
    function joinTree(uint256 _referrerId) 
      public 
      payable 
      validReferrerId(_referrerId) 
    {
        
        require(msg.value == 0.15 ether, "Joining amount is 0.15 ETH");
        require(!isTreeExists(msg.sender), "Already registered in a Tree");

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

        emit RegisterTreeEvent(newTreeId, msg.sender, sponsorAddress, msg.value, now);
        
        newTreeId++;
        
        entrance[sponsorAddress].referrals.push(_userAddress);
        entrance[sponsorAddress].referrerCount++;
        
        if ( isTreeExists(sponsorAddress) ) {
            payDirectRefBonus(sponsorAddress);
            entrance[sponsorAddress].earnedFromRef += 0.05 ether;
        } else {
            payDirectRefBonus(idToAddress[1]);
            entrance[idToAddress[1]].earnedFromRef += 0.05 ether;
        }

        uint256 amountToDistribute = 0.1 ether;

        sponsorAddress = idToAddress[entrance[sponsorAddress].referrerId];

        for (uint8 i = 1; i <= 10; i++) {
            
            if ( isTreeExists(sponsorAddress) ) {

                uint256 paid = payRefTree(sponsorAddress, i);
                amountToDistribute -= paid;
                entrance[sponsorAddress].earnedFromRef += paid;
                address _nextSponsorAddress = idToAddress[entrance[sponsorAddress].referrerId];
                sponsorAddress = _nextSponsorAddress;
            }
            
        }
        
        if (amountToDistribute > 0) {
            payDirectReferral(idToAddress[1], amountToDistribute);
            entrance[idToAddress[1]].earnedFromRef += amountToDistribute;
        }
        
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function JoinPayPlan() 
      public 
      payable 
      isEligibleBuy()
    {
        require(msg.value == 1 ether, "Participation fee in Pay Plan is 1 ETH");
        require(isTreeExists(msg.sender), "Not registered in Tree");

        uint256 eventCount = slots[activeSlot].eventsCount;
        uint256 newEventCount = eventCount + 1;

        if (newEventCount == 3) {
            require(reinvestSlot(
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
        
        emit RegisterPayPlanEvent(newSlotId, msg.sender, idToAddress[_referrerId], msg.value, now);
        
        if (_referrerId > 0) {
            paySponsorBonus(idToAddress[_referrerId]);
            entrance[idToAddress[_referrerId]].earnedFromRef += 0.5 ether;
        }
        else{
            paySponsorBonus(idToAddress[1]);
            entrance[idToAddress[1]].earnedFromRef += 0.5 ether;
        }

        newSlotId++;

        if (eventCount < 2) {
            
            if(eventCount == 0) {
                payUpline(slots[activeSlot].userAddress);
                entrance[slots[activeSlot].userAddress].earnedFromPayplan += msg.value/2;
            }
            if(eventCount == 1) {
                if (slots[activeSlot].referrerId > 0) {
                    payUpline(idToAddress[slots[activeSlot].referrerId]);
                    entrance[idToAddress[slots[activeSlot].referrerId]].earnedFromRef += msg.value/2;
                }
                else {
                    payUpline(idToAddress[1]);
                    entrance[idToAddress[1]].earnedFromRef += msg.value/2;
                }
            }

            slots[activeSlot].eventsCount++;
            
        }
        
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
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
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function payUpline(address _sponsorAddress) private returns (uint distributeAmount) {        
        distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayPlanRefPaymentEvent(distributeAmount, msg.sender, _sponsorAddress, now);
        }        
        return distributeAmount;
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}    

    function paySponsorBonus(address _sponsorAddress) private {
        uint256 distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PaySponsorBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
    
    // Pays to Ref LEvels from Tree
    function payRefTree(address _sponsorAddress, uint8 _refLevel) private returns (uint256 distributeAmount) {        
        require( _refLevel <= 10);
        distributeAmount = 0.1 ether / 100 * uplineAmount[_refLevel];
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit TreeRefPaymentEvent(distributeAmount, _sponsorAddress, msg.sender, _refLevel, now);
        }        
        return distributeAmount;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    // Pay direct ref bonus from Tree
    function payDirectRefBonus(address _sponsorAddress) private {
        uint256 distributeAmount = 0.05 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayDirectRefBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    
    // Pay to ID 1 from Tree
    function payDirectReferral(address _sponsorAddress, uint256 payAmount) private returns (uint256 distributeAmount) {        
        distributeAmount = payAmount;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayDirectRefBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }        
        return distributeAmount;        
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function isTreeExists(address _userAddress) public view returns (bool) {
        return (entrance[_userAddress].id != 0);
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    
    function getTreeReferrals(address _userAddress)
        public
        view
        returns (address[] memory)
      {
        return entrance[_userAddress].referrals;
      }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    
}