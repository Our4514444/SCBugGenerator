                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
pragma solidity ^0.5.7;


library SafeMath {

  function MUL874(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function DIV193(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a / b;
    return c;
  }

  function SUB198(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD972(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

}


contract Ownable {

  address public owner;
  address public manager;
  address public ownerWallet;

  constructor() public {
    owner = msg.sender;
    manager = msg.sender;
    ownerWallet = 0xd5E9F24607CA70910973dC2149f9B780f84d8839;
  }

  modifier ONLYOWNER915() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner, "only for owner");
    _;
  }

  modifier ONLYOWNERORMANAGER811() {	//inject NONSTANDARD NAMING
     require((msg.sender == owner)||(msg.sender == manager), "only for owner or manager");
      _;
  }

  function TRANSFEROWNERSHIP109(address newOwner) public ONLYOWNER915 {	//inject NONSTANDARD NAMING
    owner = newOwner;
  }

  function SETMANAGER650(address _manager) public ONLYOWNERORMANAGER811 {	//inject NONSTANDARD NAMING
      manager = _manager;
  }
}

contract CryptoHands is Ownable {

    event REGLEVELEVENT533(address indexed _user, address indexed _referrer, uint _time);	//inject NONSTANDARD NAMING
    event BUYLEVELEVENT310(address indexed _user, uint _level, uint _time);	//inject NONSTANDARD NAMING
    event PROLONGATELEVELEVENT304(address indexed _user, uint _level, uint _time);	//inject NONSTANDARD NAMING
    event GETMONEYFORLEVELEVENT378(address indexed _user, address indexed _referral, uint _level, uint _time);	//inject NONSTANDARD NAMING
    event LOSTMONEYFORLEVELEVENT721(address indexed _user, address indexed _referral, uint _level, uint _time);	//inject NONSTANDARD NAMING
    //------------------------------

    mapping (uint => uint) public LEVEL_PRICE;
    uint REFERRER_1_LEVEL_LIMIT = 3;
    uint PERIOD_LENGTH = 365 days;


    struct UserStruct {
        bool isExist;
        uint id;
        uint referrerID;
        address[] referral;
        mapping (uint => uint) levelExpired;
    }

    mapping (address => UserStruct) public users;
    mapping (uint => address) public userList;
    uint public currUserID = 0;




    constructor() public {

        LEVEL_PRICE[1] = 0.05 ether;
        LEVEL_PRICE[2] = 0.15 ether;
        LEVEL_PRICE[3] = 0.45 ether;
        LEVEL_PRICE[4] = 1.35 ether;
        LEVEL_PRICE[5] = 4.05 ether;
        LEVEL_PRICE[6] = 12.15 ether;
        LEVEL_PRICE[7] = 36.45 ether;
        LEVEL_PRICE[8] = 109.35 ether;

        UserStruct memory userStruct;
        currUserID++;

        userStruct = UserStruct({
            isExist : true,
            id : currUserID,
            referrerID : 0,
            referral : new address[](0)
        });
        users[ownerWallet] = userStruct;
        userList[currUserID] = ownerWallet;

        users[ownerWallet].levelExpired[1] = 77777777777;
        users[ownerWallet].levelExpired[2] = 77777777777;
        users[ownerWallet].levelExpired[3] = 77777777777;
        users[ownerWallet].levelExpired[4] = 77777777777;
        users[ownerWallet].levelExpired[5] = 77777777777;
        users[ownerWallet].levelExpired[6] = 77777777777;
        users[ownerWallet].levelExpired[7] = 77777777777;
        users[ownerWallet].levelExpired[8] = 77777777777;
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
            revert('Incorrect Value send');
        }

        if(users[msg.sender].isExist){
            BUYLEVEL520(level);
        } else if(level == 1) {
            uint refId = 0;
            address referrer = BYTESTOADDRESS774(msg.data);

            if (users[referrer].isExist){
                refId = users[referrer].id;
            } else {
                revert('Incorrect referrer');
            }

            REGUSER477(refId);
        } else {
            revert("Please buy first level for 0.05 ETH");
        }
    }

    function REGUSER477(uint _referrerID) public payable {	//inject NONSTANDARD NAMING
        require(!users[msg.sender].isExist, 'User exist');

        require(_referrerID > 0 && _referrerID <= currUserID, 'Incorrect referrer Id');

        require(msg.value==LEVEL_PRICE[1], 'Incorrect Value');


        if(users[userList[_referrerID]].referral.length >= REFERRER_1_LEVEL_LIMIT)
        {
            _referrerID = users[FINDFREEREFERRER765(userList[_referrerID])].id;
        }


        UserStruct memory userStruct;
        currUserID++;

        userStruct = UserStruct({
            isExist : true,
            id : currUserID,
            referrerID : _referrerID,
            referral : new address[](0)
        });

        users[msg.sender] = userStruct;
        userList[currUserID] = msg.sender;

        users[msg.sender].levelExpired[1] = now + PERIOD_LENGTH;
        users[msg.sender].levelExpired[2] = 0;
        users[msg.sender].levelExpired[3] = 0;
        users[msg.sender].levelExpired[4] = 0;
        users[msg.sender].levelExpired[5] = 0;
        users[msg.sender].levelExpired[6] = 0;
        users[msg.sender].levelExpired[7] = 0;
        users[msg.sender].levelExpired[8] = 0;

        users[userList[_referrerID]].referral.push(msg.sender);

        PAYFORLEVEL746(1, msg.sender);

        emit REGLEVELEVENT533(msg.sender, userList[_referrerID], now);
    }

    function BUYLEVEL520(uint _level) public payable {	//inject NONSTANDARD NAMING
        require(users[msg.sender].isExist, 'User not exist');

        require( _level>0 && _level<=8, 'Incorrect level');

        if(_level == 1){
            require(msg.value==LEVEL_PRICE[1], 'Incorrect Value');
            users[msg.sender].levelExpired[1] += PERIOD_LENGTH;
        } else {
            require(msg.value==LEVEL_PRICE[_level], 'Incorrect Value');

            for(uint l =_level-1; l>0; l-- ){
                require(users[msg.sender].levelExpired[l] >= now, 'Buy the previous level');
            }

            if(users[msg.sender].levelExpired[_level] == 0){
                users[msg.sender].levelExpired[_level] = now + PERIOD_LENGTH;
            } else {
                users[msg.sender].levelExpired[_level] += PERIOD_LENGTH;
            }
        }
        PAYFORLEVEL746(_level, msg.sender);
        emit BUYLEVELEVENT310(msg.sender, _level, now);
    }

    function PAYFORLEVEL746(uint _level, address _user) internal {	//inject NONSTANDARD NAMING

        address referer;
        address referer1;
        address referer2;
        address referer3;
        if(_level == 1 || _level == 5){
            referer = userList[users[_user].referrerID];
        } else if(_level == 2 || _level == 6){
            referer1 = userList[users[_user].referrerID];
            referer = userList[users[referer1].referrerID];
        } else if(_level == 3 || _level == 7){
            referer1 = userList[users[_user].referrerID];
            referer2 = userList[users[referer1].referrerID];
            referer = userList[users[referer2].referrerID];
        } else if(_level == 4 || _level == 8){
            referer1 = userList[users[_user].referrerID];
            referer2 = userList[users[referer1].referrerID];
            referer3 = userList[users[referer2].referrerID];
            referer = userList[users[referer3].referrerID];
        }

        if(!users[referer].isExist){
            referer = userList[1];
        }

        if(users[referer].levelExpired[_level] >= now ){
            bool result;
            result = address(uint160(referer)).send(LEVEL_PRICE[_level]);
            emit GETMONEYFORLEVELEVENT378(referer, msg.sender, _level, now);
        } else {
            emit LOSTMONEYFORLEVELEVENT721(referer, msg.sender, _level, now);
            PAYFORLEVEL746(_level,referer);
        }
    }

    function FINDFREEREFERRER765(address _user) public view returns(address) {	//inject NONSTANDARD NAMING
        if(users[_user].referral.length < REFERRER_1_LEVEL_LIMIT){
            return _user;
        }

        address[] memory referrals = new address[](363);
        referrals[0] = users[_user].referral[0]; 
        referrals[1] = users[_user].referral[1];
        referrals[2] = users[_user].referral[2];

        address freeReferrer;
        bool noFreeReferrer = true;

        for(uint i =0; i<363;i++){
            if(users[referrals[i]].referral.length == REFERRER_1_LEVEL_LIMIT){
                if(i<120){
                    referrals[(i+1)*3] = users[referrals[i]].referral[0];
                    referrals[(i+1)*3+1] = users[referrals[i]].referral[1];
                    referrals[(i+1)*3+2] = users[referrals[i]].referral[2];
                }
            }else{
                noFreeReferrer = false;
                freeReferrer = referrals[i];
                break;
            }
        }
        require(!noFreeReferrer, 'No Free Referrer');
        return freeReferrer;

    }

    function VIEWUSERREFERRAL942(address _user) public view returns(address[] memory) {	//inject NONSTANDARD NAMING
        return users[_user].referral;
    }

    function VIEWUSERLEVELEXPIRED773(address _user, uint _level) public view returns(uint) {	//inject NONSTANDARD NAMING
        return users[_user].levelExpired[_level];
    }
    function BYTESTOADDRESS774(bytes memory bys) private pure returns (address  addr ) {	//inject NONSTANDARD NAMING
        assembly {
            addr := mload(add(bys, 20))
        }
    }
}