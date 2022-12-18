pragma solidity ^0.5.2;

                                                           
contract RevealPrivilege {
    address owner;
    address public delegateAddr;
    mapping(address => bool) public isAdmin;

    modifier ONLYADMINS441() {	//inject NONSTANDARD NAMING
        require(isAdmin[msg.sender] == true);
        _;
    }
    
    modifier ISCONTRACTOWNER764() {	//inject NONSTANDARD NAMING
        require(owner == msg.sender);
        _;
    }
    
    function ADDADMIN984(address _addr) ISCONTRACTOWNER764 public {	//inject NONSTANDARD NAMING
        isAdmin[_addr] = true;
    }
    
    function REMOVEADMIN345(address _addr) ISCONTRACTOWNER764 public {	//inject NONSTANDARD NAMING
        isAdmin[_addr] = false;
    }
    
    function TRANSFEROWNER79(address _addr) ISCONTRACTOWNER764 public {	//inject NONSTANDARD NAMING
        owner = _addr;
    }
    
    function SETDELEGATEADDR777(address _addr) ONLYADMINS441 public {	//inject NONSTANDARD NAMING
        delegateAddr = _addr;
    }
}

contract FIH is RevealPrivilege {
    using SafeMath for uint256;
    
    // constant value
    uint256 constant withdrawalfee910 = 0.05 ether;	//inject NONSTANDARD NAMING
    uint256 constant stake449 = 0.01 ether;	//inject NONSTANDARD NAMING
    
    uint256 public bonusCodeNonce;
    uint16 public currentPeriod;
    uint256 bonusPool;
    uint256 public teamBonus;
    
    struct BonusCode {
        uint8 prefix;
        uint256 orderId;
        uint256 code;
        uint256 nums;
        uint256 period;
        address addr;
    }
    
    //user balance
    mapping(address => uint256) balanceOf;
    mapping(address => bool) public allowance;
    // _period => BonusCode
    mapping(uint16 => BonusCode) public revealResultPerPeriod;
    mapping(uint16 => uint256) revealBonusPerPeriod;
    
    mapping(address => BonusCode[]) revealInfoByAddr;

    mapping(uint16 => uint256) gameBonusPerPeriod;
    
    mapping(uint16 => mapping(address => uint256)) invitedBonus; // period => address => amount
    mapping(address => address) invitedRelations;

    mapping(uint16 => mapping(uint8 => uint256)) sideTotalAmount; // period => prefix => amount
    mapping(uint16 => mapping(uint256 => BonusCode)) public revealBonusCodes; // period => code => BonusCode
    mapping(uint16 => uint256[]) bcodes; // period => code

    event BET598(uint16 _currentPeriod, uint256 _orderId, uint256 _code, address _from);	//inject NONSTANDARD NAMING
    event DEPOSIT907(address _from, address _to, uint256 _amount);	//inject NONSTANDARD NAMING
    event REVEAL114(uint16 _currentPeriod, uint256 _orderId, uint256 _prefix, uint256 _code, address _addr, uint256 _winnerBonus);	//inject NONSTANDARD NAMING
    event WITHDRAWAL995(address _to, uint256 _amount);	//inject NONSTANDARD NAMING

    constructor () public {
        owner = msg.sender;
        isAdmin[owner] = true;
        currentPeriod = 1;
        bonusCodeNonce = 0;
        bonusPool = 0;
        teamBonus = 0;
        gameBonusPerPeriod[currentPeriod] = 0;
    }

    function DEPOSIT198(address _to) payable public { 	//inject NONSTANDARD NAMING
        require(msg.value > 0);
        if (msg.sender != _to) {
            require(msg.sender == delegateAddr, "deposit can only from self-address or delegated address");
            allowance[_to] = true;
        }
        balanceOf[_to] = SafeMath.SAFEADD886(balanceOf[_to], msg.value);
        emit DEPOSIT907(msg.sender, _to, msg.value);
    }
    
    function BET306(address _from, address _invitedAddr, uint256 _amount, uint8 _fType) public {	//inject NONSTANDARD NAMING
        // validate
        require(stake449 <= _amount  && _amount <= balanceOf[_from], "amount should more than stake and less or equal to balance");
        if (msg.sender != _from) {
            require(msg.sender == delegateAddr && allowance[_from] == true, "permission rejected");
        }
        if (_invitedAddr != address(0x0)) {
             require(_from != _invitedAddr, "bet _from is not equals _invitedAddr");
        }
        
        //handler balance and allowance
        balanceOf[_from] = balanceOf[_from].SAFESUB210(_amount);
         
        sideTotalAmount[currentPeriod][_fType] = sideTotalAmount[currentPeriod][_fType].SAFEADD886(_amount);
                          
        //1. bonusPool
        uint256 currentAmount = _amount;
        uint256 gameBonusPercentVal = _amount.SAFEMUL671(20).SAFEDIV950(100);
        uint256 teamBonusPercentVal = _amount.SAFEMUL671(15).SAFEDIV950(100);
        uint256 bonusPoolPercentVal = _amount.SAFEMUL671(50).SAFEDIV950(100);
        
        gameBonusPerPeriod[currentPeriod] = gameBonusPerPeriod[currentPeriod].SAFEADD886(gameBonusPercentVal);
        currentAmount = currentAmount.SAFESUB210(gameBonusPercentVal);
        
        teamBonus = teamBonus.SAFEADD886(teamBonusPercentVal);
        currentAmount = currentAmount.SAFESUB210(teamBonusPercentVal);
        
        bonusPool = bonusPool.SAFEADD886(bonusPoolPercentVal);
        currentAmount = currentAmount.SAFESUB210(bonusPoolPercentVal);
        
        //invited bonus 
        uint256 bonusLevelOne = _amount.SAFEMUL671(10).SAFEDIV950(100);
        uint256 bonusLevelTwo = _amount.SAFEMUL671(5).SAFEDIV950(100);
        
        if(_invitedAddr != address(0x0)) {
            invitedRelations[_from] = _invitedAddr;
        }
        if (invitedRelations[_from] != address(0x0)) {
            address fa = invitedRelations[_from];
            invitedBonus[currentPeriod][fa] = invitedBonus[currentPeriod][fa].SAFEADD886(bonusLevelOne);
            balanceOf[fa] = balanceOf[fa].SAFEADD886(bonusLevelOne);
            currentAmount = currentAmount.SAFESUB210(bonusLevelOne);
            address gfa = invitedRelations[fa];
            if (gfa != address(0x0)) {
               invitedBonus[currentPeriod][gfa] = invitedBonus[currentPeriod][gfa].SAFEADD886(bonusLevelTwo);
               balanceOf[gfa] = balanceOf[gfa].SAFEADD886(bonusLevelTwo);
               currentAmount = currentAmount.SAFESUB210(bonusLevelTwo);
            }
        }
        assert(currentAmount >= 0);
        bonusPool = bonusPool.SAFEADD886(currentAmount);
        
        //generate order and bonusCodes
        uint256 oId = block.timestamp;
        
        BonusCode memory bc = BonusCode({
            orderId: oId,
            prefix:  _fType,
            code:    bonusCodeNonce,
            nums:    _amount.SAFEDIV950(stake449),
            addr:    _from, 
            period:  currentPeriod
        });
        revealBonusCodes[currentPeriod][bonusCodeNonce] = bc;
        bcodes[currentPeriod].push(bonusCodeNonce);
        emit BET598(currentPeriod, oId, bonusCodeNonce, _from);
        bonusCodeNonce = bonusCodeNonce.SAFEADD886(_amount.SAFEDIV950(stake449));
    }
    
    event DEBUG746(uint256 winnerIndex, uint256 bcodesLen, uint256 pos);	//inject NONSTANDARD NAMING
    function REVEAL4(string memory _seed) public ONLYADMINS441 {	//inject NONSTANDARD NAMING
        // random winner index
        
        uint256 winner = uint256(keccak256(abi.encodePacked(_seed, msg.sender, block.timestamp))) % bonusCodeNonce;
        uint256 lt = 0;
        uint256 rt = bcodes[currentPeriod].length - 1;
        require(lt <= rt, "bcodes length is not correct");
        uint256 pos = lt;
        while (lt <= rt) {
            uint256 mid = lt + (rt - lt) / 2;
            if (bcodes[currentPeriod][mid] <= winner) {
                pos = mid;
                lt = mid + 1;
            } else {
                rt = mid - 1;
            }
        }
        emit DEBUG746(winner, bcodes[currentPeriod].length, pos);
        
        
        uint256 halfBonusPool = bonusPool.SAFEMUL671(50).SAFEDIV950(100);
        BonusCode memory winnerBcode = revealBonusCodes[currentPeriod][bcodes[currentPeriod][pos]];
        
        // iterate;  
        uint256 bcodesLen = bcodes[currentPeriod].length;
        for (uint256 i = 0; i < bcodesLen; i++) {
            if (revealBonusCodes[currentPeriod][bcodes[currentPeriod][i]].prefix != winnerBcode.prefix) {
                continue;
            }
            BonusCode memory thisBonusCode = revealBonusCodes[currentPeriod][bcodes[currentPeriod][i]];
            if (thisBonusCode.addr == winnerBcode.addr && thisBonusCode.orderId == winnerBcode.orderId) {
                balanceOf[winnerBcode.addr] = balanceOf[winnerBcode.addr].SAFEADD886(halfBonusPool);
            } else {
                uint256 bonusAmount = halfBonusPool.SAFEMUL671(
                    thisBonusCode.nums.SAFEMUL671(stake449).SAFEDIV950(sideTotalAmount[currentPeriod][winnerBcode.prefix])
                    );
                balanceOf[thisBonusCode.addr] = balanceOf[thisBonusCode.addr].SAFEADD886(bonusAmount);
            }
        }
        
        // update reveal result && reset value
        revealBonusPerPeriod[currentPeriod] = halfBonusPool;
        revealResultPerPeriod[currentPeriod] = winnerBcode;
        revealInfoByAddr[winnerBcode.addr].push(winnerBcode);
        currentPeriod++;
        bonusPool = 0;
        bonusCodeNonce = 0;
        gameBonusPerPeriod[currentPeriod] = 0;
        
        emit REVEAL114(currentPeriod - 1, winnerBcode.orderId, winnerBcode.prefix, winnerBcode.code, winnerBcode.addr, halfBonusPool);
    }
    
    function WITHDRAWAL312(address _from, address payable _to, uint256 _amount) public {	//inject NONSTANDARD NAMING
        // permission check
        if (msg.sender != _from) {
            require(allowance[_from] == true && msg.sender == delegateAddr, "permission rejected");
        }
        // amount check
        require(withdrawalfee910 <= _amount && _amount <= balanceOf[_from], "Don't have enough balance");
        
        balanceOf[_from] = balanceOf[_from].SAFESUB210(_amount);
        _amount = _amount.SAFESUB210(withdrawalfee910);
        teamBonus = teamBonus.SAFEADD886(withdrawalfee910);
        
	  	_to.transfer(_amount);
	    emit WITHDRAWAL995(_to, _amount);
    }
    
    function TEAMWITHDRAWAL421() ONLYADMINS441 public {	//inject NONSTANDARD NAMING
        require(teamBonus > 0, "Don't have enough teamBonus");
        uint256 tmp = teamBonus;
        teamBonus = 0;
        msg.sender.transfer(tmp);
    }
    
    function GAMEBONUSWITHDRAWAL380(uint16 _period) ONLYADMINS441 public {	//inject NONSTANDARD NAMING
        require(gameBonusPerPeriod[_period] > 0, "Don't have enough money");
        uint256 tmp = gameBonusPerPeriod[_period];
        gameBonusPerPeriod[_period] = 0;
        msg.sender.transfer(tmp);
    }
    
    function UPDATECONTRACT846() ISCONTRACTOWNER764 public {	//inject NONSTANDARD NAMING
        msg.sender.transfer(address(this).balance);
    }
    
                                                      
    function GETBALANCE138(address _addr) public view returns(uint256) {	//inject NONSTANDARD NAMING
        return balanceOf[_addr];
    }
    
    function GETBONUSPOOL609() public view returns(uint256) {	//inject NONSTANDARD NAMING
        return bonusPool;
    }

    function GETBONUSINVITED461(address _from) public view returns(uint256) {	//inject NONSTANDARD NAMING
        return invitedBonus[currentPeriod][_from];
    }
    
    function GETREVEALRESULTPERPERIOD761(uint16 _period) public view returns(uint8 _prefix, uint256 _orderId, uint256 _code, uint256 _nums, address _addr, uint256 _revealBonus) {	//inject NONSTANDARD NAMING
        _prefix = revealResultPerPeriod[_period].prefix;
        _orderId = revealResultPerPeriod[_period].orderId;
        _code = revealResultPerPeriod[_period].code;
        _nums = revealResultPerPeriod[_period].nums;
        _addr = revealResultPerPeriod[_period].addr;
        _revealBonus = revealBonusPerPeriod[_period];
    }
}

                                                                                                   
library SafeMath {
                                                                                  
    function SAFEMUL671(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                           
    function SAFEDIV950(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SAFESUB210(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function SAFEADD886(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function SAFEMOD578(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}