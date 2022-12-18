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

  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  event RegisterTreeEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  event RegisterPayPlanEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);
  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event ReinvestSlotEvent(uint256 _userid, address indexed _user, address indexed _referrerAddress, uint256 _amount, uint256 _time);

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event PayDirectRefBonusEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event PaySponsorBonusEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _time);    
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event PayPlanRefPaymentEvent(uint256 amount, address indexed _from, address indexed _to, uint256 _time);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event TreeRefPaymentEvent(uint256 amount, address indexed _sponsorAddress, address indexed _fromAddress, uint256 _level, uint256 _time);


  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  mapping(address => Tree) public entrance;
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping(address => PayPlan) public treePayPlan;
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  mapping(uint256 => Slots) public slots;

  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(uint256 => address) private idToAddress;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  mapping (uint8 => uint8) public uplineAmount;
    
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public newTreeId = 1;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  uint256 public newTreeIdPayPlan = 1;

  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint256 public newSlotId = 1;
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  uint256 public activeSlot = 1;
    
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address public owner;
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
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
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
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
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
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
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

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
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function payUpline(address _sponsorAddress) private returns (uint distributeAmount) {        
        distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayPlanRefPaymentEvent(distributeAmount, msg.sender, _sponsorAddress, now);
        }        
        return distributeAmount;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }    

    function paySponsorBonus(address _sponsorAddress) private {
        uint256 distributeAmount = 0.5 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PaySponsorBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
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
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    // Pay direct ref bonus from Tree
    function payDirectRefBonus(address _sponsorAddress) private {
        uint256 distributeAmount = 0.05 ether;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayDirectRefBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    
    // Pay to ID 1 from Tree
    function payDirectReferral(address _sponsorAddress, uint256 payAmount) private returns (uint256 distributeAmount) {        
        distributeAmount = payAmount;
        if (address(uint160(_sponsorAddress)).send(distributeAmount)) {
            emit PayDirectRefBonusEvent(distributeAmount, _sponsorAddress, msg.sender, now);
        }        
        return distributeAmount;        
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    
    function isTreeExists(address _userAddress) public view returns (bool) {
        return (entrance[_userAddress].id != 0);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    function getTreeReferrals(address _userAddress)
        public
        view
        returns (address[] memory)
      {
        return entrance[_userAddress].referrals;
      }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
}