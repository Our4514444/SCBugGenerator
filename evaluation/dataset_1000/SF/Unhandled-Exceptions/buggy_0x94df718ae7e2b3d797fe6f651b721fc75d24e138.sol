/**
 *Submitted for verification at Etherscan.io on 2020-05-23
*/

/*
╔═══╗╔═╗╔═╗╔═══╗╔═══╗╔════╗╔══╗─╔══╗╔════╗╔═══╗╔═══╗╔══╗╔═╗─╔╗╔════╗
║╔═╗║║║╚╝║║║╔═╗║║╔═╗║║╔╗╔╗║║╔╗║─╚╣─╝║╔╗╔╗║║╔═╗║║╔═╗║╚╣─╝║║╚╗║║║╔╗╔╗║
║╚══╗║╔╗╔╗║║║─║║║╚═╝║╚╝║║╚╝║╚╝╚╗─║║─╚╝║║╚╝║╚═╝║║║─║║─║║─║╔╗╚╝║╚╝║║╚╝
╚══╗║║║║║║║║╚═╝║║╔╗╔╝──║║──║╔═╗║─║║───║║──║╔══╝║║─║║─║║─║║╚╗║║──║║──
║╚═╝║║║║║║║║╔═╗║║║║╚╗──║║──║╚═╝║╔╣─╗──║║──║║───║╚═╝║╔╣─╗║║─║║║──║║──
╚═══╝╚╝╚╝╚╝╚╝─╚╝╚╝╚═╝──╚╝──╚═══╝╚══╝──╚╝──╚╝───╚═══╝╚══╝╚╝─╚═╝──╚╝──
telegram channel: @smartbitpoint
telegram group: @smartbitpoint_com
telegram bot: @smartbitpoint_bot
hashtag: #smartbitpoint
*/
pragma solidity >=0.5.17 <0.7.0;

contract SmartBitPoint {
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint public currUserID;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  address private owner;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  address private manager;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping (uint => uint) public LEVEL_PRICE;
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  mapping (uint => uint) public LEVEL_PERIOD;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  mapping (uint => uint) public StatsLevel;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping (uint => uint) public StatsPay;
    struct User {
        uint id;
        uint referrerB;
        uint referrerT;
        uint referrerL;
        address[] referralsB;
        address[] referralsT;
        address[] referralsL;
        mapping (uint => uint) countGetMoney;
        mapping (uint => uint) countLostMoney;
        mapping (uint => uint) levelExpired;
    }
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  mapping (address => User) public mapusers;
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping (uint => address) public usersAddress;
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  bool private ContractInit;

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event regLevelEvent(address indexed _user, address indexed _referrer, uint8 indexed _type, uint _id, uint _time, uint _expires);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event buyLevelEvent(address indexed _user, uint indexed _level, uint _time, uint _expires);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event getMoneyForLevelEvent(address indexed _user, address indexed _referral, uint indexed _level, uint _time);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event lostMoneyForLevelEvent(address indexed _user, address indexed _referral, uint indexed _level, uint _time);

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
    modifier onlyOwnerOrManager {
        require(msg.sender == owner || msg.sender == manager, "Only owner or manager can call this function.");
        _;
    }
    modifier userNotRegistered(address _user) {
        require(mapusers[_user].id == 0, 'User is already registered');
        _;
    }
    modifier userRegistered(address _user) {
        require(mapusers[_user].id != 0, 'User does not exist');
        _;
    }
    modifier validLevel(uint _level) {
        require(_level > 0 && _level <= 8, 'Invalid level');
        _;
    }
    modifier validPeriod(uint _period) {
        require(_period > 0 && _period * 1 days <= now, 'Invalid period');
        _;
    }
    modifier validPrice(uint _price) {
        require(_price > 0 && _price % 3 == 0, 'Invalid price');
        _;
    }
    modifier validAddress(address _user) {
        require(_user != address(0), "Zero address");
        _;
    }

    constructor() public {
        require(!ContractInit,"this contract inited!");

        owner = msg.sender;
        manager = msg.sender;
        address admin1 = 0x9FE5F739D3df1BEf612bbB8a06952D233C5474E3;
        address admin2 = 0x93fD13DD91236269cBDce8859521A0121E4A437E;
        address admin3 = 0xcF8AFeEdF9446ec79C3A3433F102E56A51fF90c0;
        address admin4 = 0xaC77396F01Dd706108930CA1E375f4F400d39121;

        LEVEL_PERIOD[1] = 15 days;
        LEVEL_PERIOD[2] = 30 days;
        LEVEL_PERIOD[3] = 45 days;
        LEVEL_PERIOD[4] = 60 days;
        LEVEL_PERIOD[5] = 75 days;
        LEVEL_PERIOD[6] = 90 days;
        LEVEL_PERIOD[7] = 105 days;
        LEVEL_PERIOD[8] = 120 days;

        LEVEL_PRICE[1] = 0.15 ether;
        LEVEL_PRICE[2] = 0.3 ether;
        LEVEL_PRICE[3] = 0.45 ether;
        LEVEL_PRICE[4] = 0.75 ether;
        LEVEL_PRICE[5] = 1.35 ether;
        LEVEL_PRICE[6] = 3 ether;
        LEVEL_PRICE[7] = 6 ether;
        LEVEL_PRICE[8] = 10.5 ether;

        currUserID++;
        mapusers[admin1] = User({ id: currUserID, referrerB: 0, referrerT: 0, referrerL: 0, referralsB: new address[](0), referralsT: new address[](0), referralsL: new address[](0) });
        usersAddress[currUserID] = admin1;
        currUserID++;
        mapusers[admin2] = User({ id: currUserID, referrerB: 1, referrerT: 1, referrerL: 1, referralsB: new address[](0), referralsT: new address[](0), referralsL: new address[](0) });
        usersAddress[currUserID] = admin2;
        currUserID++;
        mapusers[admin3] = User({ id: currUserID, referrerB: 1, referrerT: 1, referrerL: 1, referralsB: new address[](0), referralsT: new address[](0), referralsL: new address[](0) });
        usersAddress[currUserID] = admin3;
        currUserID++;
        mapusers[admin4] = User({ id: currUserID, referrerB: 2, referrerT: 1, referrerL: 1, referralsB: new address[](0), referralsT: new address[](0), referralsL: new address[](0) });
        usersAddress[currUserID] = admin4;
        for(uint i = 1; i <= 8; i++) {
            mapusers[admin1].levelExpired[i] = 113131641600;
            mapusers[admin2].levelExpired[i] = 113131641600;
            mapusers[admin3].levelExpired[i] = 113131641600;
            mapusers[admin4].levelExpired[i] = 113131641600;
            StatsLevel[i] = 4;
            StatsPay[i] = 4;
        }
        mapusers[admin1].referralsB.push(admin2);
        mapusers[admin1].referralsB.push(admin3);
        mapusers[admin1].referralsT.push(admin2);
        mapusers[admin1].referralsT.push(admin3);
        mapusers[admin1].referralsT.push(admin4);
        mapusers[admin1].referralsL.push(admin2);
        mapusers[admin1].referralsL.push(admin3);
        mapusers[admin1].referralsL.push(admin4);

        mapusers[admin2].referralsB.push(admin4);
        ContractInit = true;
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function () external payable {
        uint level;
        if(msg.value == LEVEL_PRICE[1]){
            level = 1;
        }else if(msg.value == LEVEL_PRICE[2]){
            level = 2;
        }else if(msg.value == LEVEL_PRICE[3]){
            level = 3;
        }else if(msg.value == LEVEL_PRICE[4]){
            level = 4;
        }else if(msg.value == LEVEL_PRICE[5]){
            level = 5;
        }else if(msg.value == LEVEL_PRICE[6]){
            level = 6;
        }else if(msg.value == LEVEL_PRICE[7]){
            level = 7;
        }else if(msg.value == LEVEL_PRICE[8]){
            level = 8;
        }else {
            revert('Invalid amount has sent');
        }

        if(mapusers[msg.sender].id != 0){

            for(uint i=level-1; i>0; i--){
                require(mapusers[msg.sender].levelExpired[i] >= now, 'Buy the previous level');
            }
            if(mapusers[msg.sender].levelExpired[level] < now){
                if(mapusers[msg.sender].levelExpired[level] == 0) StatsLevel[level]++;
                mapusers[msg.sender].levelExpired[level] = now + LEVEL_PERIOD[level];
            } else {
                mapusers[msg.sender].levelExpired[level] += LEVEL_PERIOD[level];
            }
            payForLevel(level, msg.sender);
            StatsPay[level]++;
            emit buyLevelEvent(msg.sender, level, now, mapusers[msg.sender].levelExpired[level]);
        } else if(level == 1){
            address referrer = _bytesToAddress(msg.data);
            require(mapusers[referrer].id != 0, 'Incorrect referrer');

            uint bone = mapusers[referrer].id;
            uint two = mapusers[referrer].id;
            uint tree = mapusers[referrer].id;
            if(viewUserReferralsB(usersAddress[mapusers[referrer].id]).length >= 2)
                bone = mapusers[findFreeReferrerB(usersAddress[mapusers[referrer].id])].id;
            if(viewUserReferralsT(usersAddress[mapusers[referrer].id]).length >= 3)
                two = mapusers[findFreeReferrerT(usersAddress[mapusers[referrer].id])].id;
            currUserID++;
            mapusers[msg.sender] = User({ id: currUserID, referrerB: bone, referrerT: two, referrerL: tree, referralsB: new address[](0), referralsT: new address[](0), referralsL: new address[](0) });
            usersAddress[currUserID] = msg.sender;
            mapusers[msg.sender].levelExpired[1] = now + LEVEL_PERIOD[1];
            mapusers[usersAddress[bone]].referralsB.push(msg.sender);
            mapusers[usersAddress[two]].referralsT.push(msg.sender);
            mapusers[usersAddress[tree]].referralsL.push(msg.sender);
            payForLevel(1, msg.sender);
            StatsLevel[1]++;
            StatsPay[1]++;
            emit regLevelEvent(msg.sender, usersAddress[bone], 1, currUserID, now, mapusers[msg.sender].levelExpired[1]);
            emit regLevelEvent(msg.sender, usersAddress[two], 2, currUserID, now, mapusers[msg.sender].levelExpired[1]);
            emit regLevelEvent(msg.sender, usersAddress[tree], 3, currUserID, now, mapusers[msg.sender].levelExpired[1]);
        } else {
            revert('Buy first level');
        }
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

    function payForLevel(uint _level, address _user) internal {
        uint height;
        address referrer;

        height = _level;
        referrer = _user;
        while (referrer != address(0)) {
            referrer = usersAddress[mapusers[referrer].referrerB];
            height--;
            if(height == 0){
                if(mapusers[referrer].levelExpired[_level] >= now) break;
                emit lostMoneyForLevelEvent(referrer, msg.sender, _level, now);
                mapusers[referrer].countLostMoney[_level]++;
                height = _level;
            }
        }
        if(referrer == address(0)) referrer = owner;
        if(address(uint160(referrer)).send(LEVEL_PRICE[_level]/3)) {
            emit getMoneyForLevelEvent(referrer, msg.sender, _level, now);
            mapusers[referrer].countGetMoney[_level]++;
        }

        height = _level < 5 ? _level : _level - 4;
        referrer = _user;
        while (referrer != address(0)) {
            referrer = usersAddress[mapusers[referrer].referrerT];
            height--;
            if(height == 0){
                if(mapusers[referrer].levelExpired[_level] >= now) break;
                emit lostMoneyForLevelEvent(referrer, msg.sender, _level, now);
                mapusers[referrer].countLostMoney[_level]++;
                height = _level < 5 ? _level : _level - 4;
            }
        }
        if(referrer == address(0)) referrer = owner;
        if(address(uint160(referrer)).send(LEVEL_PRICE[_level]/3)) {
            emit getMoneyForLevelEvent(referrer, msg.sender, _level, now);
            mapusers[referrer].countGetMoney[_level]++;
        }

        height = _level % 2 == 0 ? 2 : 1;
        referrer = _user;
        while (referrer != address(0)) {
            referrer = usersAddress[mapusers[referrer].referrerL];
            height--;
            if(height == 0){
                if(mapusers[referrer].levelExpired[_level] >= now) break;
                emit lostMoneyForLevelEvent(referrer, msg.sender, _level, now);
                mapusers[referrer].countLostMoney[_level]++;
                height = _level % 2 == 0 ? 2 : 1;
            }
        }
        if(referrer == address(0)) referrer = owner;
        if(address(uint160(referrer)).send(LEVEL_PRICE[_level]/3)) {
            emit getMoneyForLevelEvent(referrer, msg.sender, _level, now);
            mapusers[referrer].countGetMoney[_level]++;
        }
    }

    function findFreeReferrerB(address _user) public view returns(address) {
        if(viewUserReferralsB(_user).length < 2) return _user;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(viewUserReferralsB(referrals[i]).length < 2) return referrals[i];
            address[] memory currentReferrals = viewUserReferralsB(referrals[i]);
            for(uint l=0; l<currentReferrals.length;l++){
                current++;
                referrals[current] = currentReferrals[l];
            }
        }
        return referrals[current];
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function findFreeReferrerT(address _user) public view returns(address) {
        if(viewUserReferralsT(_user).length < 3) return _user;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(viewUserReferralsT(referrals[i]).length < 3) return referrals[i];
            address[] memory currentReferrals = viewUserReferralsT(referrals[i]);
            for(uint l=0; l<currentReferrals.length;l++){
                current++;
                referrals[current] = currentReferrals[l];
            }
        }
        return referrals[current];
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    function getCountUserReferralsB(address _user, uint _level, uint8 _type) public view returns(uint) {
        if(viewUserReferralsB(_user).length == 0 || _level == 1) return viewUserReferralsB(_user).length;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        uint result = 0;
        uint level = 0;
        uint current_level = 0;
        uint next_level = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(mapusers[referrals[i]].id == 0) break;
            address[] memory currentReferrals = viewUserReferralsB(referrals[i]);
            if(current_level == 0){
                current_level += currentReferrals.length;
                level++;
            } else next_level += currentReferrals.length;
            for(uint l=0; l<currentReferrals.length;l++){
                if(_level != 0 && _type == 1){
                    if(level == _level) result++;
                } else result++;
                current++;
                referrals[current] = currentReferrals[l];
            }
            current_level--;
            if(current_level == 0){
                if(_level != 0 && level == _level) return result;
                level++;
                current_level = next_level;
                next_level = 0;
            }
        }
        return result;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    function getCountUserReferralsT(address _user, uint _level, uint8 _type) public view returns(uint) {
        if(viewUserReferralsT(_user).length == 0 || _level == 1) return viewUserReferralsT(_user).length;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        uint result = 0;
        uint level = 0;
        uint current_level = 0;
        uint next_level = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(mapusers[referrals[i]].id == 0) break;
            address[] memory currentReferrals = viewUserReferralsT(referrals[i]);
            if(current_level == 0){
                current_level += currentReferrals.length;
                level++;
            } else next_level += currentReferrals.length;
            for(uint l=0; l<currentReferrals.length;l++){
                if(_level != 0 && _type == 1){
                    if(level == _level) result++;
                } else result++;
                current++;
                referrals[current] = currentReferrals[l];
            }
            current_level--;
            if(current_level == 0){
                if(_level != 0 && level == _level) return result;
                level++;
                current_level = next_level;
                next_level = 0;
            }
        }
        return result;
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
    function getCountUserReferralsL(address _user, uint _level, uint8 _type) public view returns(uint) {
        if(viewUserReferralsL(_user).length == 0 || _level == 1) return viewUserReferralsL(_user).length;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        uint result = 0;
        uint level = 0;
        uint current_level = 0;
        uint next_level = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(mapusers[referrals[i]].id == 0) break;
            address[] memory currentReferrals = viewUserReferralsL(referrals[i]);
            if(current_level == 0){
                current_level += currentReferrals.length;
                level++;
            } else next_level += currentReferrals.length;
            for(uint l=0; l<currentReferrals.length;l++){
                if(_level != 0 && _type == 1){
                    if(level == _level) result++;
                } else result++;
                current++;
                referrals[current] = currentReferrals[l];
            }
            current_level--;
            if(current_level == 0){
                if(_level != 0 && level == _level) return result;
                level++;
                current_level = next_level;
                next_level = 0;
            }
        }
        return result;
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function viewUserReferralsB(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsB;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function viewUserReferralsT(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsT;
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function viewUserReferralsL(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsL;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function getCountGetMoney(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].countGetMoney[_level];
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function getCountLostMoney(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].countLostMoney[_level];
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function viewUserLevelExpired(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].levelExpired[_level];
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function getUserInfo(address _user) public view returns(uint,uint256[3] memory,address[3] memory,uint256[8] memory,uint256[8] memory,bool[8] memory){
        User storage user = mapusers[_user];
        return (
        user.id, [
        user.referrerB, user.referrerT, user.referrerL
        ], [
        usersAddress[user.referrerB], usersAddress[user.referrerT], usersAddress[user.referrerL]
        ], [
        user.countGetMoney[1], user.countGetMoney[2], user.countGetMoney[3], user.countGetMoney[4],
        user.countGetMoney[5], user.countGetMoney[6], user.countGetMoney[7], user.countGetMoney[8]
        ], [
        user.countLostMoney[1], user.countLostMoney[2], user.countLostMoney[3], user.countLostMoney[4],
        user.countLostMoney[5], user.countLostMoney[6], user.countLostMoney[7], user.countLostMoney[8]
        ], [
        user.levelExpired[1] < now, user.levelExpired[2] < now, user.levelExpired[3] < now, user.levelExpired[4] < now,
        user.levelExpired[5] < now, user.levelExpired[6] < now, user.levelExpired[7] < now, user.levelExpired[8] < now
        ]);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    function setLevelPeriod(uint _level, uint _period) public onlyOwnerOrManager validLevel(_level) validPeriod(_period) {
        LEVEL_PERIOD[_level] = _period * 1 days;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    function setLevelPrice(uint _level, uint _price) public onlyOwnerOrManager validLevel(_level) validPrice(_price) {
        LEVEL_PRICE[_level] = _price * 0.01 ether;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    function setUserLevelExpired(address _user, uint _level, uint _period) public onlyOwnerOrManager userRegistered(_user) validLevel(_level) validPeriod(_period) {
        mapusers[_user].levelExpired[_level] = now + _period * 1 days;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function setOwner(address _user) public onlyOwner validAddress(_user) { owner = _user; }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    function setManager(address _user) public onlyOwnerOrManager validAddress(_user) { manager = _user; }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    function getOwner() external view returns (address) { return owner; }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    function getManager() external view returns (address) { return manager; }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    function _bytesToAddress(bytes memory _bys) internal pure returns(address addr) {
        assembly {
            addr := mload(add(_bys, 20))
        }
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
}