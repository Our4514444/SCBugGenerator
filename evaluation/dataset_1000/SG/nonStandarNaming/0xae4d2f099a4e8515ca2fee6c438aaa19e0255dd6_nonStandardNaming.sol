pragma solidity ^0.5.2;

// File: zeppelin-solidity/contracts/ownership/Ownable.sol

                                                                                                                                                                                             
contract Ownable {
  address public owner;


  event OWNERSHIPTRANSFERRED907(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING


                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }


                                                                           
  modifier ONLYOWNER525() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }


                                                                                                                                                            
  function TRANSFEROWNERSHIP228(address newOwner) public ONLYOWNER525 {	//inject NONSTANDARD NAMING
    require(newOwner != address(0));
    emit OWNERSHIPTRANSFERRED907(owner, newOwner);
    owner = newOwner;
  }

}

// File: zeppelin-solidity/contracts/lifecycle/Pausable.sol

                                                                                                                
contract Pausable is Ownable {
  event PAUSE791();	//inject NONSTANDARD NAMING
  event UNPAUSE35();	//inject NONSTANDARD NAMING

  bool public paused = false;


                                                                                                
  modifier WHENNOTPAUSED199() {	//inject NONSTANDARD NAMING
    require(!paused);
    _;
  }

                                                                                            
  modifier WHENPAUSED157() {	//inject NONSTANDARD NAMING
    require(paused);
    _;
  }

                                                                          
  function PAUSE868() ONLYOWNER525 WHENNOTPAUSED199 public {	//inject NONSTANDARD NAMING
    paused = true;
    emit PAUSE791();
  }

                                                                             
  function UNPAUSE799() ONLYOWNER525 WHENPAUSED157 public {	//inject NONSTANDARD NAMING
    paused = false;
    emit UNPAUSE35();
  }
}

// File: zeppelin-solidity/contracts/math/SafeMath.sol

                                                                                         
library SafeMath {
  function MUL932(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function DIV642(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function SUB324(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD959(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

// File: zeppelin-solidity/contracts/token/ERC20Basic.sol

                                                                                                                               
contract ERC20Basic {
  uint256 public totalSupply;
  function BALANCEOF103(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER711(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER522(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

// File: zeppelin-solidity/contracts/token/BasicToken.sol

                                                                                         
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

                                                                                                                                                     
  function TRANSFER711(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].SUB324(_value);
    balances[_to] = balances[_to].ADD959(_value);
    emit TRANSFER522(msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                     
  function BALANCEOF103(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

}

// File: zeppelin-solidity/contracts/token/ERC20.sol

                                                                                        
contract ERC20 is ERC20Basic {
  function ALLOWANCE105(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFERFROM870(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE377(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event APPROVAL685(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: zeppelin-solidity/contracts/token/StandardToken.sol

                                                                                                                                                                                                                                                                          
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


                                                                                                                                                                                                                                                                              
  function TRANSFERFROM870(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].SUB324(_value);
    balances[_to] = balances[_to].ADD959(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB324(_value);
    emit TRANSFER522(_from, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function APPROVE377(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _value;
    emit APPROVAL685(msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                          
  function ALLOWANCE105(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return allowed[_owner][_spender];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function INCREASEAPPROVAL34(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD959(_addedValue);
    emit APPROVAL685(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function DECREASEAPPROVAL387(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    uint oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.SUB324(_subtractedValue);
    }
    emit APPROVAL685(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

// File: zeppelin-solidity/contracts/token/PausableToken.sol

                                                                                            

contract PausableToken is StandardToken, Pausable {

  function TRANSFER711(address _to, uint256 _value) public WHENNOTPAUSED199 returns (bool) {	//inject NONSTANDARD NAMING
    return super.TRANSFER711(_to, _value);
  }

  function TRANSFERFROM870(address _from, address _to, uint256 _value) public WHENNOTPAUSED199 returns (bool) {	//inject NONSTANDARD NAMING
    return super.TRANSFERFROM870(_from, _to, _value);
  }

  function APPROVE377(address _spender, uint256 _value) public WHENNOTPAUSED199 returns (bool) {	//inject NONSTANDARD NAMING
    return super.APPROVE377(_spender, _value);
  }

  function INCREASEAPPROVAL34(address _spender, uint _addedValue) public WHENNOTPAUSED199 returns (bool success) {	//inject NONSTANDARD NAMING
    return super.INCREASEAPPROVAL34(_spender, _addedValue);
  }

  function DECREASEAPPROVAL387(address _spender, uint _subtractedValue) public WHENNOTPAUSED199 returns (bool success) {	//inject NONSTANDARD NAMING
    return super.DECREASEAPPROVAL387(_spender, _subtractedValue);
  }
}

// File: contracts/URACToken.sol

                             
                                                                                 
                    
contract URACToken is PausableToken {
    using SafeMath for uint;

                                      
    string public constant name228 = "URACToken";	//inject NONSTANDARD NAMING
    string public constant symbol941 = "URAC";	//inject NONSTANDARD NAMING
    uint public constant decimals66 = 18;	//inject NONSTANDARD NAMING

                                
    uint public currentSupply;

                                                   
                           
    address public minter;

                                               
    mapping (address => uint) public lockedBalances;

                  
    bool public claimedFlag;

                               
    modifier ONLYMINTER102 {	//inject NONSTANDARD NAMING
        require(msg.sender == minter);
        _;
    }

    modifier CANCLAIMED809 {	//inject NONSTANDARD NAMING
        require(claimedFlag == true);
        _;
    }

    modifier MAXTOKENAMOUNTNOTREACHED421 (uint amount){	//inject NONSTANDARD NAMING
        require(currentSupply.ADD959(amount) <= totalSupply);
        _;
    }

    modifier VALIDADDRESS6( address addr ) {	//inject NONSTANDARD NAMING
        require(addr != address(0x0));
        require(addr != address(this));
        _;
    }

                                                                                                                                                                                 
    constructor(address _minter, address _admin, uint _maxTotalSupply)
        public
        VALIDADDRESS6(_admin)
        VALIDADDRESS6(_minter)
        {
        minter = _minter;
        totalSupply = _maxTotalSupply;
        claimedFlag = false;
        TRANSFEROWNERSHIP228(_admin);
    }

    function MINTEX812(uint amount) public ONLYOWNER525 {	//inject NONSTANDARD NAMING
        balances[msg.sender] = balances[msg.sender].ADD959(amount);
        totalSupply = totalSupply.ADD959(amount);
    }

                                                                                                                                                                                                                                                                                           

    function MINT52(address receipent, uint amount, bool isLock)	//inject NONSTANDARD NAMING
        external
        ONLYMINTER102
        MAXTOKENAMOUNTNOTREACHED421(amount)
        returns (bool)
    {
        if (isLock ) {
            lockedBalances[receipent] = lockedBalances[receipent].ADD959(amount);
        } else {
            balances[receipent] = balances[receipent].ADD959(amount);
        }
        currentSupply = currentSupply.ADD959(amount);
        return true;
    }


    function SETCLAIMEDFLAG581(bool flag)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER525
    {
        claimedFlag = flag;
    }

                                       

                                                                                 
    function CLAIMTOKENS152(address[] calldata receipents)	//inject NONSTANDARD NAMING
        external
        CANCLAIMED809
    {
        for (uint i = 0; i < receipents.length; i++) {
            address receipent = receipents[i];
            //balances[receipent] = balances[receipent].add(lockedBalances[receipent]);
            balances[msg.sender] = balances[msg.sender].ADD959(lockedBalances[receipent]);
            TRANSFER711(receipent, lockedBalances[receipent]);
            lockedBalances[receipent] = 0;
        }
    }
}

// File: contracts/URACCrowdSale.sol

                                 
                                                                                 
                    
contract URACCrowdSale is Pausable {
    using SafeMath for uint;

                       
                                
    uint public constant urac_total_supply788 = 3500000000 ether;	//inject NONSTANDARD NAMING
    uint public constant max_sale_duration726 = 10 days;	//inject NONSTANDARD NAMING
    uint public constant stage_1_time73 =  3 days;	//inject NONSTANDARD NAMING
    uint public constant stage_2_time425 = 7 days;	//inject NONSTANDARD NAMING
    uint public constant min_limit475 = 0.1 ether;	//inject NONSTANDARD NAMING
    uint public constant max_stage_1_limit411 = 10 ether;	//inject NONSTANDARD NAMING

    //uint public constant STAGE_1 = 1;
    //uint public constant STAGE_2 = 2;
    enum STAGE {STAGE_1, STAGE_2}

                      
    uint public  exchangeRate = 6200;


    uint public constant miner_stake350 = 4000;    // for minter	//inject NONSTANDARD NAMING
    uint public constant open_sale_stake573 = 158; // for public	//inject NONSTANDARD NAMING
    uint public constant other_stake26 = 5842;    // for others	//inject NONSTANDARD NAMING


    uint public constant divisor_stake842 = 10000;	//inject NONSTANDARD NAMING

    // max open sale tokens
    uint public constant max_open_sold642 = urac_total_supply788 * open_sale_stake573 / divisor_stake842;	//inject NONSTANDARD NAMING
    uint public constant stake_multiplier302 = urac_total_supply788 / divisor_stake842;	//inject NONSTANDARD NAMING

                                                                      
    address payable public wallet;
    address payable public minerAddress;
    address payable public otherAddress;

                               
    uint public startTime;
                             
    uint public endTime;

                                               
                                        
    uint public openSoldTokens;
                                                   
    URACToken public uracToken;

                                               
    mapping (address => bool) public fullWhiteList;

    mapping (address => uint) public firstStageFund;
 
                            
    event NEWSALE899(address indexed destAddress, uint ethCost, uint gotTokens);	//inject NONSTANDARD NAMING
    event NEWWALLET429(address onwer, address oldWallet, address newWallet);	//inject NONSTANDARD NAMING

    modifier NOTEARLIERTHAN868(uint x) {	//inject NONSTANDARD NAMING
        require(now >= x);
        _;
    }

    modifier EARLIERTHAN433(uint x) {	//inject NONSTANDARD NAMING
        require(now < x);
        _;
    }

    modifier CEILINGNOTREACHED147() {	//inject NONSTANDARD NAMING
        require(openSoldTokens < max_open_sold642);
        _;
    }

    modifier ISSALEENDED681() {	//inject NONSTANDARD NAMING
        require(now > endTime || openSoldTokens >= max_open_sold642);
        _;
    }

    modifier VALIDADDRESS6( address addr ) {	//inject NONSTANDARD NAMING
        require(addr != address(0x0));
        require(addr != address(this));
        _;
    }

    constructor (
        address payable _wallet,
        address payable _minerAddress,
        address payable _otherAddress
        ) public
        VALIDADDRESS6(_wallet)
        VALIDADDRESS6(_minerAddress)
        VALIDADDRESS6(_otherAddress)
        {
        paused = true;
        wallet = _wallet;
        minerAddress = _minerAddress;
        otherAddress = _otherAddress;

        openSoldTokens = 0;
                                               
        uracToken = new URACToken(address(this), msg.sender, urac_total_supply788);

        uracToken.MINT52(minerAddress, miner_stake350 * stake_multiplier302, false);
        uracToken.MINT52(otherAddress, other_stake26 * stake_multiplier302, false);
    }

    function SETEXCHANGERATE212(uint256 rate)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER525
        EARLIERTHAN433(endTime)
    {
        exchangeRate = rate;
    }

    function SETSTARTTIME815(uint _startTime )	//inject NONSTANDARD NAMING
        public
        ONLYOWNER525
    {
        startTime = _startTime;
        endTime = startTime + max_sale_duration726;
    }

                                           
                               
    function SETWHITELIST273(address[] calldata users, bool openTag)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER525
        EARLIERTHAN433(endTime)
    {
        require(SALENOTEND664());
        for (uint i = 0; i < users.length; i++) {
            fullWhiteList[users[i]] = openTag;
        }
    }


                                                 
                               
    function ADDWHITELIST431(address user, bool openTag)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER525
        EARLIERTHAN433(endTime)
    {
        require(SALENOTEND664());
        fullWhiteList[user] = openTag;

    }

                                
    function SETWALLET661(address payable newAddress)  external ONLYOWNER525 {	//inject NONSTANDARD NAMING
        emit NEWWALLET429(owner, wallet, newAddress);
        wallet = newAddress;
    }

                                                        
    function SALENOTEND664() view internal returns (bool) {	//inject NONSTANDARD NAMING
        return now < endTime && openSoldTokens < max_open_sold642;
    }

                                                                                                                                                
    function ()external payable {
        BUYURAC984(msg.sender);
    }

                                      
                                                                   
                                              
    function BUYURAC984(address receipient)	//inject NONSTANDARD NAMING
        internal
        WHENNOTPAUSED199
        CEILINGNOTREACHED147
        NOTEARLIERTHAN868(startTime)
        EARLIERTHAN433(endTime)
        VALIDADDRESS6(receipient)
        returns (bool)
    {
        // Do not allow contracts to game the system
        require(!ISCONTRACT505(msg.sender));
        require(tx.gasprice <= 10000000000 wei);
        require(msg.value >= min_limit475);

        bool inWhiteListTag = fullWhiteList[receipient];
        require(inWhiteListTag == true);

        STAGE stage = STAGE.STAGE_2;
        if ( startTime <= now && now < startTime + stage_1_time73 ) {
            stage = STAGE.STAGE_1;
            require(msg.value <= max_stage_1_limit411);
            uint fund1 = firstStageFund[receipient];
            require (fund1 < max_stage_1_limit411 );
        }

        DOBUY572(receipient, stage);

        return true;
    }


                                    
    function DOBUY572(address receipient, STAGE stage) internal {	//inject NONSTANDARD NAMING
        // protect partner quota in stage one
        uint value = msg.value;

        if ( stage == STAGE.STAGE_1 ) {
            uint fund1 = firstStageFund[receipient];
            fund1 = fund1.ADD959(value);
            if (fund1 > max_stage_1_limit411 ) {
                uint refund1 = fund1.SUB324(max_stage_1_limit411);
                value = value.SUB324(refund1);
                msg.sender.transfer(refund1);
            }
        }

        uint tokenAvailable = max_open_sold642.SUB324(openSoldTokens);
        require(tokenAvailable > 0);
        uint toFund;
        uint toCollect;
        (toFund, toCollect) = COSTANDBUYTOKENS930(tokenAvailable, value);
        if (toFund > 0) {
            require(uracToken.MINT52(receipient, toCollect, true));
            wallet.transfer(toFund);
            openSoldTokens = openSoldTokens.ADD959(toCollect);
            emit NEWSALE899(receipient, toFund, toCollect);
        }

        // not enough token sale, just return eth
        uint toReturn = value.SUB324(toFund);
        if (toReturn > 0) {
            msg.sender.transfer(toReturn);
        }

        if ( stage == STAGE.STAGE_1 ) {
            firstStageFund[receipient] = firstStageFund[receipient].ADD959(toFund);
        }
    }

                                                                            
    function COSTANDBUYTOKENS930(uint availableToken, uint value) view internal returns (uint costValue, uint getTokens) {	//inject NONSTANDARD NAMING
        // all conditions has checked in the caller functions
        getTokens = exchangeRate * value;

        if (availableToken >= getTokens) {
            costValue = value;
        } else {
            costValue = availableToken / exchangeRate;
            getTokens = availableToken;
        }
    }

                                                                       
                                              
                                             
    function ISCONTRACT505(address payable _addr) view internal returns(bool) {	//inject NONSTANDARD NAMING
        uint size;
        if (_addr == 0x0000000000000000000000000000000000000000) {
            return false;
        }

        assembly {
            size := extcodesize(_addr)
        }
        return size > 0;
    }
}