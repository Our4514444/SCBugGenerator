                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
pragma solidity >=0.5.17 <0.7.0;

contract SmartBitPoint {
    uint public currUserID;
    address private owner;
    address private manager;
    mapping (uint => uint) public LEVEL_PRICE;
    mapping (uint => uint) public LEVEL_PERIOD;
    mapping (uint => uint) public StatsLevel;
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
    mapping (address => User) public mapusers;
    mapping (uint => address) public usersAddress;
    bool private ContractInit;

    event REGLEVELEVENT601(address indexed _user, address indexed _referrer, uint8 indexed _type, uint _id, uint _time, uint _expires);	//inject NONSTANDARD NAMING
    event BUYLEVELEVENT975(address indexed _user, uint indexed _level, uint _time, uint _expires);	//inject NONSTANDARD NAMING
    event GETMONEYFORLEVELEVENT222(address indexed _user, address indexed _referral, uint indexed _level, uint _time);	//inject NONSTANDARD NAMING
    event LOSTMONEYFORLEVELEVENT518(address indexed _user, address indexed _referral, uint indexed _level, uint _time);	//inject NONSTANDARD NAMING

    modifier ONLYOWNER608 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
    modifier ONLYOWNERORMANAGER112 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == manager, "Only owner or manager can call this function.");
        _;
    }
    modifier USERNOTREGISTERED800(address _user) {	//inject NONSTANDARD NAMING
        require(mapusers[_user].id == 0, 'User is already registered');
        _;
    }
    modifier USERREGISTERED411(address _user) {	//inject NONSTANDARD NAMING
        require(mapusers[_user].id != 0, 'User does not exist');
        _;
    }
    modifier VALIDLEVEL748(uint _level) {	//inject NONSTANDARD NAMING
        require(_level > 0 && _level <= 8, 'Invalid level');
        _;
    }
    modifier VALIDPERIOD802(uint _period) {	//inject NONSTANDARD NAMING
        require(_period > 0 && _period * 1 days <= now, 'Invalid period');
        _;
    }
    modifier VALIDPRICE203(uint _price) {	//inject NONSTANDARD NAMING
        require(_price > 0 && _price % 3 == 0, 'Invalid price');
        _;
    }
    modifier VALIDADDRESS753(address _user) {	//inject NONSTANDARD NAMING
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
            PAYFORLEVEL267(level, msg.sender);
            StatsPay[level]++;
            emit BUYLEVELEVENT975(msg.sender, level, now, mapusers[msg.sender].levelExpired[level]);
        } else if(level == 1){
            address referrer = _BYTESTOADDRESS48(msg.data);
            require(mapusers[referrer].id != 0, 'Incorrect referrer');

            uint bone = mapusers[referrer].id;
            uint two = mapusers[referrer].id;
            uint tree = mapusers[referrer].id;
            if(VIEWUSERREFERRALSB435(usersAddress[mapusers[referrer].id]).length >= 2)
                bone = mapusers[FINDFREEREFERRERB246(usersAddress[mapusers[referrer].id])].id;
            if(VIEWUSERREFERRALST358(usersAddress[mapusers[referrer].id]).length >= 3)
                two = mapusers[FINDFREEREFERRERT993(usersAddress[mapusers[referrer].id])].id;
            currUserID++;
            mapusers[msg.sender] = User({ id: currUserID, referrerB: bone, referrerT: two, referrerL: tree, referralsB: new address[](0), referralsT: new address[](0), referralsL: new address[](0) });
            usersAddress[currUserID] = msg.sender;
            mapusers[msg.sender].levelExpired[1] = now + LEVEL_PERIOD[1];
            mapusers[usersAddress[bone]].referralsB.push(msg.sender);
            mapusers[usersAddress[two]].referralsT.push(msg.sender);
            mapusers[usersAddress[tree]].referralsL.push(msg.sender);
            PAYFORLEVEL267(1, msg.sender);
            StatsLevel[1]++;
            StatsPay[1]++;
            emit REGLEVELEVENT601(msg.sender, usersAddress[bone], 1, currUserID, now, mapusers[msg.sender].levelExpired[1]);
            emit REGLEVELEVENT601(msg.sender, usersAddress[two], 2, currUserID, now, mapusers[msg.sender].levelExpired[1]);
            emit REGLEVELEVENT601(msg.sender, usersAddress[tree], 3, currUserID, now, mapusers[msg.sender].levelExpired[1]);
        } else {
            revert('Buy first level');
        }
    }

    function PAYFORLEVEL267(uint _level, address _user) internal {	//inject NONSTANDARD NAMING
        uint height;
        address referrer;

        height = _level;
        referrer = _user;
        while (referrer != address(0)) {
            referrer = usersAddress[mapusers[referrer].referrerB];
            height--;
            if(height == 0){
                if(mapusers[referrer].levelExpired[_level] >= now) break;
                emit LOSTMONEYFORLEVELEVENT518(referrer, msg.sender, _level, now);
                mapusers[referrer].countLostMoney[_level]++;
                height = _level;
            }
        }
        if(referrer == address(0)) referrer = owner;
        if(address(uint160(referrer)).send(LEVEL_PRICE[_level]/3)) {
            emit GETMONEYFORLEVELEVENT222(referrer, msg.sender, _level, now);
            mapusers[referrer].countGetMoney[_level]++;
        }

        height = _level < 5 ? _level : _level - 4;
        referrer = _user;
        while (referrer != address(0)) {
            referrer = usersAddress[mapusers[referrer].referrerT];
            height--;
            if(height == 0){
                if(mapusers[referrer].levelExpired[_level] >= now) break;
                emit LOSTMONEYFORLEVELEVENT518(referrer, msg.sender, _level, now);
                mapusers[referrer].countLostMoney[_level]++;
                height = _level < 5 ? _level : _level - 4;
            }
        }
        if(referrer == address(0)) referrer = owner;
        if(address(uint160(referrer)).send(LEVEL_PRICE[_level]/3)) {
            emit GETMONEYFORLEVELEVENT222(referrer, msg.sender, _level, now);
            mapusers[referrer].countGetMoney[_level]++;
        }

        height = _level % 2 == 0 ? 2 : 1;
        referrer = _user;
        while (referrer != address(0)) {
            referrer = usersAddress[mapusers[referrer].referrerL];
            height--;
            if(height == 0){
                if(mapusers[referrer].levelExpired[_level] >= now) break;
                emit LOSTMONEYFORLEVELEVENT518(referrer, msg.sender, _level, now);
                mapusers[referrer].countLostMoney[_level]++;
                height = _level % 2 == 0 ? 2 : 1;
            }
        }
        if(referrer == address(0)) referrer = owner;
        if(address(uint160(referrer)).send(LEVEL_PRICE[_level]/3)) {
            emit GETMONEYFORLEVELEVENT222(referrer, msg.sender, _level, now);
            mapusers[referrer].countGetMoney[_level]++;
        }
    }

    function FINDFREEREFERRERB246(address _user) public view returns(address) {	//inject NONSTANDARD NAMING
        if(VIEWUSERREFERRALSB435(_user).length < 2) return _user;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(VIEWUSERREFERRALSB435(referrals[i]).length < 2) return referrals[i];
            address[] memory currentReferrals = VIEWUSERREFERRALSB435(referrals[i]);
            for(uint l=0; l<currentReferrals.length;l++){
                current++;
                referrals[current] = currentReferrals[l];
            }
        }
        return referrals[current];
    }
    function FINDFREEREFERRERT993(address _user) public view returns(address) {	//inject NONSTANDARD NAMING
        if(VIEWUSERREFERRALST358(_user).length < 3) return _user;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(VIEWUSERREFERRALST358(referrals[i]).length < 3) return referrals[i];
            address[] memory currentReferrals = VIEWUSERREFERRALST358(referrals[i]);
            for(uint l=0; l<currentReferrals.length;l++){
                current++;
                referrals[current] = currentReferrals[l];
            }
        }
        return referrals[current];
    }

    function GETCOUNTUSERREFERRALSB155(address _user, uint _level, uint8 _type) public view returns(uint) {	//inject NONSTANDARD NAMING
        if(VIEWUSERREFERRALSB435(_user).length == 0 || _level == 1) return VIEWUSERREFERRALSB435(_user).length;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        uint result = 0;
        uint level = 0;
        uint current_level = 0;
        uint next_level = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(mapusers[referrals[i]].id == 0) break;
            address[] memory currentReferrals = VIEWUSERREFERRALSB435(referrals[i]);
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
    function GETCOUNTUSERREFERRALST232(address _user, uint _level, uint8 _type) public view returns(uint) {	//inject NONSTANDARD NAMING
        if(VIEWUSERREFERRALST358(_user).length == 0 || _level == 1) return VIEWUSERREFERRALST358(_user).length;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        uint result = 0;
        uint level = 0;
        uint current_level = 0;
        uint next_level = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(mapusers[referrals[i]].id == 0) break;
            address[] memory currentReferrals = VIEWUSERREFERRALST358(referrals[i]);
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
    function GETCOUNTUSERREFERRALSL684(address _user, uint _level, uint8 _type) public view returns(uint) {	//inject NONSTANDARD NAMING
        if(VIEWUSERREFERRALSL439(_user).length == 0 || _level == 1) return VIEWUSERREFERRALSL439(_user).length;
        address[] memory referrals = new address[](currUserID);
        uint current = 0;
        uint result = 0;
        uint level = 0;
        uint current_level = 0;
        uint next_level = 0;
        referrals[current] = _user;
        for(uint i=0; i<currUserID;i++){
            if(mapusers[referrals[i]].id == 0) break;
            address[] memory currentReferrals = VIEWUSERREFERRALSL439(referrals[i]);
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

    function VIEWUSERREFERRALSB435(address _user) public view returns(address[] memory) {	//inject NONSTANDARD NAMING
        return mapusers[_user].referralsB;
    }
    function VIEWUSERREFERRALST358(address _user) public view returns(address[] memory) {	//inject NONSTANDARD NAMING
        return mapusers[_user].referralsT;
    }
    function VIEWUSERREFERRALSL439(address _user) public view returns(address[] memory) {	//inject NONSTANDARD NAMING
        return mapusers[_user].referralsL;
    }

    function GETCOUNTGETMONEY585(address _user, uint _level) public view returns(uint) {	//inject NONSTANDARD NAMING
        return mapusers[_user].countGetMoney[_level];
    }
    function GETCOUNTLOSTMONEY383(address _user, uint _level) public view returns(uint) {	//inject NONSTANDARD NAMING
        return mapusers[_user].countLostMoney[_level];
    }

    function VIEWUSERLEVELEXPIRED364(address _user, uint _level) public view returns(uint) {	//inject NONSTANDARD NAMING
        return mapusers[_user].levelExpired[_level];
    }

    function GETUSERINFO702(address _user) public view returns(uint,uint256[3] memory,address[3] memory,uint256[8] memory,uint256[8] memory,bool[8] memory){	//inject NONSTANDARD NAMING
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

    function SETLEVELPERIOD238(uint _level, uint _period) public ONLYOWNERORMANAGER112 VALIDLEVEL748(_level) VALIDPERIOD802(_period) {	//inject NONSTANDARD NAMING
        LEVEL_PERIOD[_level] = _period * 1 days;
    }
    function SETLEVELPRICE987(uint _level, uint _price) public ONLYOWNERORMANAGER112 VALIDLEVEL748(_level) VALIDPRICE203(_price) {	//inject NONSTANDARD NAMING
        LEVEL_PRICE[_level] = _price * 0.01 ether;
    }
    function SETUSERLEVELEXPIRED349(address _user, uint _level, uint _period) public ONLYOWNERORMANAGER112 USERREGISTERED411(_user) VALIDLEVEL748(_level) VALIDPERIOD802(_period) {	//inject NONSTANDARD NAMING
        mapusers[_user].levelExpired[_level] = now + _period * 1 days;
    }

    function SETOWNER864(address _user) public ONLYOWNER608 VALIDADDRESS753(_user) { owner = _user; }	//inject NONSTANDARD NAMING
    function SETMANAGER308(address _user) public ONLYOWNERORMANAGER112 VALIDADDRESS753(_user) { manager = _user; }	//inject NONSTANDARD NAMING
    function GETOWNER818() external view returns (address) { return owner; }	//inject NONSTANDARD NAMING
    function GETMANAGER249() external view returns (address) { return manager; }	//inject NONSTANDARD NAMING
    function _BYTESTOADDRESS48(bytes memory _bys) internal pure returns(address addr) {	//inject NONSTANDARD NAMING
        assembly {
            addr := mload(add(_bys, 20))
        }
    }
}