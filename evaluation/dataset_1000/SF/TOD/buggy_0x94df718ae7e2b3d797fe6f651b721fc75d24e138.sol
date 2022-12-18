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
  bool claimed_TOD22 = false;
address payable owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }
  uint public currUserID;
  bool claimed_TOD8 = false;
address payable owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }
  address private owner;
  bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }
  address private manager;
  address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }
  mapping (uint => uint) public LEVEL_PRICE;
  address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }
  mapping (uint => uint) public LEVEL_PERIOD;
  address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }
  mapping (uint => uint) public StatsLevel;
  bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
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
  bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }
  mapping (address => User) public mapusers;
  bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }
  mapping (uint => address) public usersAddress;
  bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
  bool private ContractInit;

  bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
  event regLevelEvent(address indexed _user, address indexed _referrer, uint8 indexed _type, uint _id, uint _time, uint _expires);
  address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
  event buyLevelEvent(address indexed _user, uint indexed _level, uint _time, uint _expires);
  address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
  event getMoneyForLevelEvent(address indexed _user, address indexed _referral, uint indexed _level, uint _time);
  address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
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
address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
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
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
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
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
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
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
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
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
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
bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }
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
bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }

    function viewUserReferralsB(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsB;
    }
bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }
    function viewUserReferralsT(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsT;
    }
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }
    function viewUserReferralsL(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsL;
    }
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }

    function getCountGetMoney(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].countGetMoney[_level];
    }
bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }
    function getCountLostMoney(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].countLostMoney[_level];
    }
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }

    function viewUserLevelExpired(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].levelExpired[_level];
    }
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
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
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }

    function setLevelPeriod(uint _level, uint _period) public onlyOwnerOrManager validLevel(_level) validPeriod(_period) {
        LEVEL_PERIOD[_level] = _period * 1 days;
    }
address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }
    function setLevelPrice(uint _level, uint _price) public onlyOwnerOrManager validLevel(_level) validPrice(_price) {
        LEVEL_PRICE[_level] = _price * 0.01 ether;
    }
bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }
    function setUserLevelExpired(address _user, uint _level, uint _period) public onlyOwnerOrManager userRegistered(_user) validLevel(_level) validPeriod(_period) {
        mapusers[_user].levelExpired[_level] = now + _period * 1 days;
    }
address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }

    function setOwner(address _user) public onlyOwner validAddress(_user) { owner = _user; }
bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }
    function setManager(address _user) public onlyOwnerOrManager validAddress(_user) { manager = _user; }
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
    function getOwner() external view returns (address) { return owner; }
bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }
    function getManager() external view returns (address) { return manager; }
address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }
    function _bytesToAddress(bytes memory _bys) internal pure returns(address addr) {
        assembly {
            addr := mload(add(_bys, 20))
        }
    }
address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
}