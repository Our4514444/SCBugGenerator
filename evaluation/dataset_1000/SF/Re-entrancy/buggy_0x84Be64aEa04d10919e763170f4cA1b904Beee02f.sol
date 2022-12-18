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

  uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
  event RegisterTreeEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);
  mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
  event RegisterPayPlanEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);
  address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
  event ReinvestSlotEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);

  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  event PayDirectRefBonusEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);
  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event PaySponsorBonusEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);    
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event PayPlanRefPaymentEvent(uint256 amount, address indexed _from, address indexed _to, uint256 _time);
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event TreeRefPaymentEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _level, uint256 _time);


  uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  mapping(address => Tree) public entrance;
  mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
  mapping(address => PayPlan) public treePayPlan;
  mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  mapping(uint256 => Slots) public slots;

  mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
  mapping(uint256 => address) private idToAddress;
  mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
  mapping (uint8 => uint8) public uplineAmount;
    
  uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
  uint256 public newTreeId = 1;
  mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  uint256 public newTreeIdPayPlan = 1;

  mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  uint256 public newSlotId = 1;
  mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  uint256 public activeSlot = 1;
    
  address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
  address public owner;
  mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
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
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }
    
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
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
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
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
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
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }

    function payUpline(address _sponsorAddress) private returns (uint distributeAmount) {        
        distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayPlanRefPaymentEvent(distributeAmount, msg.sender, _sponsorAddress, now);
        }        
        return distributeAmount;
    }
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }    

    function paySponsorBonus(address _sponsorAddress) private {
        uint256 distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PaySponsorBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
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
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }

    // Pay direct ref bonus from Tree
    function payDirectRefBonus(address _sponsorAddress) private {
        uint256 distributeAmount = 0.05 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayDirectRefBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
    
    // Pay to ID 1 from Tree
    function payDirectReferral(address _sponsorAddress, uint256 payAmount) private returns (uint256 distributeAmount) {        
        distributeAmount = payAmount;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayDirectRefBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }        
        return distributeAmount;        
    }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
    
    function isTreeExists(address _userAddress) public view returns (bool) {
        return (entrance[_userAddress].id != 0);
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
    
    function getTreeReferrals(address _userAddress)
        public
        view
        returns (address[] memory)
      {
        return entrance[_userAddress].referrals;
      }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
    
}