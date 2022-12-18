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
  address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
  uint public currUserID;
  address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
  address private owner;
  function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address private manager;
  address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
  mapping (uint => uint) public LEVEL_PRICE;
  address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
  mapping (uint => uint) public LEVEL_PERIOD;
  address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
  mapping (uint => uint) public StatsLevel;
  function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
  function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => User) public mapusers;
  function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (uint => address) public usersAddress;
  address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  bool private ContractInit;

  uint256 bugv_tmstmp5 = block.timestamp;
  event regLevelEvent(address indexed _user, address indexed _referrer, uint8 indexed _type, uint _id, uint _time, uint _expires);
  uint256 bugv_tmstmp2 = block.timestamp;
  event buyLevelEvent(address indexed _user, uint indexed _level, uint _time, uint _expires);
  uint256 bugv_tmstmp3 = block.timestamp;
  event getMoneyForLevelEvent(address indexed _user, address indexed _referral, uint indexed _level, uint _time);
  uint256 bugv_tmstmp1 = block.timestamp;
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
uint256 bugv_tmstmp4 = block.timestamp;

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
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
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
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

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
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
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
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
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
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function viewUserReferralsB(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsB;
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
    function viewUserReferralsT(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsT;
    }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function viewUserReferralsL(address _user) public view returns(address[] memory) {
        return mapusers[_user].referralsL;
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    function getCountGetMoney(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].countGetMoney[_level];
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function getCountLostMoney(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].countLostMoney[_level];
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

    function viewUserLevelExpired(address _user, uint _level) public view returns(uint) {
        return mapusers[_user].levelExpired[_level];
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function setLevelPeriod(uint _level, uint _period) public onlyOwnerOrManager validLevel(_level) validPeriod(_period) {
        LEVEL_PERIOD[_level] = _period * 1 days;
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
    function setLevelPrice(uint _level, uint _price) public onlyOwnerOrManager validLevel(_level) validPrice(_price) {
        LEVEL_PRICE[_level] = _price * 0.01 ether;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
    function setUserLevelExpired(address _user, uint _level, uint _period) public onlyOwnerOrManager userRegistered(_user) validLevel(_level) validPeriod(_period) {
        mapusers[_user].levelExpired[_level] = now + _period * 1 days;
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    function setOwner(address _user) public onlyOwner validAddress(_user) { owner = _user; }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function setManager(address _user) public onlyOwnerOrManager validAddress(_user) { manager = _user; }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    function getOwner() external view returns (address) { return owner; }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    function getManager() external view returns (address) { return manager; }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function _bytesToAddress(bytes memory _bys) internal pure returns(address addr) {
        assembly {
            addr := mload(add(_bys, 20))
        }
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}