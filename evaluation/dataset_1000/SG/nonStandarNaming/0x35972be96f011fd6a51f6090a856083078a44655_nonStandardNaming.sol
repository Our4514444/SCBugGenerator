                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.2;

contract Owned {

    address public owner;

    event NEWOWNER779(address indexed old, address indexed current);	//inject NONSTANDARD NAMING

    modifier ONLYOWNER540 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function SETOWNER820(address _new)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER540
    {
        require(_new != address(0));
        owner = _new;
        emit NEWOWNER779(owner, _new);
    }
}

interface RigoToken {

                            
    event TOKENMINTED999(address indexed recipient, uint256 amount);	//inject NONSTANDARD NAMING

                                    
    function MINTTOKEN282(address _recipient, uint256 _amount) external;	//inject NONSTANDARD NAMING
    function CHANGEMINTINGADDRESS458(address _newAddress) external;	//inject NONSTANDARD NAMING
    function CHANGERIGOBLOCKADDRESS694(address _newAddress) external;	//inject NONSTANDARD NAMING
    
    function BALANCEOF725(address _who) external view returns (uint256);	//inject NONSTANDARD NAMING
}

interface Authority {

                            
    event AUTHORITYSET373(address indexed authority);	//inject NONSTANDARD NAMING
    event WHITELISTERSET128(address indexed whitelister);	//inject NONSTANDARD NAMING
    event WHITELISTEDUSER470(address indexed target, bool approved);	//inject NONSTANDARD NAMING
    event WHITELISTEDREGISTRY734(address indexed registry, bool approved);	//inject NONSTANDARD NAMING
    event WHITELISTEDFACTORY136(address indexed factory, bool approved);	//inject NONSTANDARD NAMING
    event WHITELISTEDVAULT7(address indexed vault, bool approved);	//inject NONSTANDARD NAMING
    event WHITELISTEDDRAGO955(address indexed drago, bool isWhitelisted);	//inject NONSTANDARD NAMING
    event NEWDRAGOEVENTFUL119(address indexed dragoEventful);	//inject NONSTANDARD NAMING
    event NEWVAULTEVENTFUL996(address indexed vaultEventful);	//inject NONSTANDARD NAMING
    event NEWNAVVERIFIER469(address indexed navVerifier);	//inject NONSTANDARD NAMING
    event NEWEXCHANGESAUTHORITY712(address indexed exchangesAuthority);	//inject NONSTANDARD NAMING

                                    
    function SETAUTHORITY261(address _authority, bool _isWhitelisted) external;	//inject NONSTANDARD NAMING
    function SETWHITELISTER34(address _whitelister, bool _isWhitelisted) external;	//inject NONSTANDARD NAMING
    function WHITELISTUSER849(address _target, bool _isWhitelisted) external;	//inject NONSTANDARD NAMING
    function WHITELISTDRAGO940(address _drago, bool _isWhitelisted) external;	//inject NONSTANDARD NAMING
    function WHITELISTVAULT181(address _vault, bool _isWhitelisted) external;	//inject NONSTANDARD NAMING
    function WHITELISTREGISTRY781(address _registry, bool _isWhitelisted) external;	//inject NONSTANDARD NAMING
    function WHITELISTFACTORY853(address _factory, bool _isWhitelisted) external;	//inject NONSTANDARD NAMING
    function SETDRAGOEVENTFUL746(address _dragoEventful) external;	//inject NONSTANDARD NAMING
    function SETVAULTEVENTFUL449(address _vaultEventful) external;	//inject NONSTANDARD NAMING
    function SETNAVVERIFIER985(address _navVerifier) external;	//inject NONSTANDARD NAMING
    function SETEXCHANGESAUTHORITY898(address _exchangesAuthority) external;	//inject NONSTANDARD NAMING

                                               
    function ISWHITELISTEDUSER20(address _target) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISAUTHORITY487(address _authority) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISWHITELISTEDREGISTRY669(address _registry) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISWHITELISTEDDRAGO776(address _drago) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISWHITELISTEDVAULT709(address _vault) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISWHITELISTEDFACTORY806(address _factory) external view returns (bool);	//inject NONSTANDARD NAMING
    function GETDRAGOEVENTFUL697() external view returns (address);	//inject NONSTANDARD NAMING
    function GETVAULTEVENTFUL455() external view returns (address);	//inject NONSTANDARD NAMING
    function GETNAVVERIFIER178() external view returns (address);	//inject NONSTANDARD NAMING
    function GETEXCHANGESAUTHORITY83() external view returns (address);	//inject NONSTANDARD NAMING
}

contract SafeMath {

    function SAFEMUL337(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function SAFEDIV357(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return c;
    }

    function SAFESUB281(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function SAFEADD386(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c>=a && c>=b);
        return c;
    }

    function MAX64401(uint64 a, uint64 b) internal pure returns (uint64) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

    function MIN64961(uint64 a, uint64 b) internal pure returns (uint64) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

    function MAX256275(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

    function MIN256613(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }
}

interface InflationFace {

                                    
    function MINTINFLATION967(address _thePool, uint256 _reward) external returns (bool);	//inject NONSTANDARD NAMING
    function SETINFLATIONFACTOR858(address _group, uint256 _inflationFactor) external;	//inject NONSTANDARD NAMING
    function SETMINIMUMRIGO856(uint256 _minimum) external;	//inject NONSTANDARD NAMING
    function SETRIGOBLOCK338(address _newRigoblock) external;	//inject NONSTANDARD NAMING
    function SETAUTHORITY261(address _authority) external;	//inject NONSTANDARD NAMING
    function SETPROOFOFPERFORMANCE798(address _pop) external;	//inject NONSTANDARD NAMING
    function SETPERIOD190(uint256 _newPeriod) external;	//inject NONSTANDARD NAMING

                                               
    function CANWITHDRAW277(address _thePool) external view returns (bool);	//inject NONSTANDARD NAMING
    function TIMEUNTILCLAIM939(address _thePool) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETINFLATIONFACTOR3(address _group) external view returns (uint256);	//inject NONSTANDARD NAMING
}

                                                                
                                               
// solhint-disable-next-line
contract Inflation is
    SafeMath,
    InflationFace
{
    address public RIGOTOKENADDRESS;

    uint256 public period = 1 days;
    uint256 public minimumGRG = 0;
    address public proofOfPerformance;
    address public authority;
    address public rigoblockDao;

    mapping(address => Performer) performers;
    mapping(address => Group) groups;

    struct Performer {
        uint256 claimedTokens;
        mapping(uint256 => bool) claim;
        uint256 startTime;
        uint256 endTime;
        uint256 epoch;
    }

    struct Group {
        uint256 epochReward;
    }

                                                                               
    modifier MINIMUMRIGO628(address _ofPool) {	//inject NONSTANDARD NAMING
        RigoToken rigoToken = RigoToken(RIGOTOKENADDRESS);
        require(
            rigoToken.BALANCEOF725(GETPOOLOWNER179(_ofPool)) >= minimumGRG,
            "BELOW_MINIMUM_GRG"
        );
        _;
    }

    modifier ONLYRIGOBLOCKDAO960 {	//inject NONSTANDARD NAMING
        require(
            msg.sender == rigoblockDao,
            "ONLY_RIGOBLOCK_DAO"
        );
        _;
    }

    modifier ONLYPROOFOFPERFORMANCE704 {	//inject NONSTANDARD NAMING
        require(
            msg.sender == proofOfPerformance,
            "ONLY_POP_CONTRACT"
        );
        _;
    }

    modifier ISAPPROVEDFACTORY633(address _factory) {	//inject NONSTANDARD NAMING
        Authority auth = Authority(authority);
        require(
            auth.ISWHITELISTEDFACTORY806(_factory),
            "NOT_APPROVED_AUTHORITY"
        );
        _;
    }

    modifier TIMEATLEAST368(address _thePool) {	//inject NONSTANDARD NAMING
        require(
            now >= performers[_thePool].endTime,
            "TIME_NOT_ENOUGH"
        );
        _;
    }

    constructor(
        address _rigoTokenAddress,
        address _proofOfPerformance,
        address _authority)
        public
    {
        RIGOTOKENADDRESS = _rigoTokenAddress;
        rigoblockDao = msg.sender;
        proofOfPerformance = _proofOfPerformance;
        authority = _authority;
    }

                                    
                                                      
                                                  
                                                      
                                                       
    function MINTINFLATION967(address _thePool, uint256 _reward)	//inject NONSTANDARD NAMING
        external
        ONLYPROOFOFPERFORMANCE704
        MINIMUMRIGO628(_thePool)
        TIMEATLEAST368(_thePool)
        returns (bool)
    {
        performers[_thePool].startTime = now;
        performers[_thePool].endTime = now + period;
        ++performers[_thePool].epoch;
        uint256 reward = _reward * 95 / 100; //5% royalty to rigoblock dao
        uint256 rigoblockReward = SAFESUB281(_reward, reward);
        RigoToken rigoToken = RigoToken(RIGOTOKENADDRESS);
        rigoToken.MINTTOKEN282(GETPOOLOWNER179(_thePool), reward);
        rigoToken.MINTTOKEN282(rigoblockDao, rigoblockReward);
        return true;
    }

                                                                         
                                                  
                                                          
    function SETINFLATIONFACTOR858(address _group, uint256 _inflationFactor)	//inject NONSTANDARD NAMING
        external
        ONLYRIGOBLOCKDAO960
        ISAPPROVEDFACTORY633(_group)
    {
        groups[_group].epochReward = _inflationFactor;
    }

                                                                              
                                                
    function SETMINIMUMRIGO856(uint256 _minimum)	//inject NONSTANDARD NAMING
        external
        ONLYRIGOBLOCKDAO960
    {
        minimumGRG = _minimum;
    }

                                                        
                                                             
    function SETRIGOBLOCK338(address _newRigoblock)	//inject NONSTANDARD NAMING
        external
        ONLYRIGOBLOCKDAO960
    {
        rigoblockDao = _newRigoblock;
    }

                                                         
                                                  
    function SETAUTHORITY261(address _authority)	//inject NONSTANDARD NAMING
        external
        ONLYRIGOBLOCKDAO960
    {
        authority = _authority;
    }

                                                                
                                                                
    function SETPROOFOFPERFORMANCE798(address _pop)	//inject NONSTANDARD NAMING
        external
        ONLYRIGOBLOCKDAO960
    {
        proofOfPerformance = _pop;
    }

                                                                                   
                                                             
                                                                 
    function SETPERIOD190(uint256 _newPeriod)	//inject NONSTANDARD NAMING
        external
        ONLYRIGOBLOCKDAO960
    {
        period = _newPeriod;
    }

                                               
                                                             
                                                  
                                         
    function CANWITHDRAW277(address _thePool)	//inject NONSTANDARD NAMING
        external
        view
        returns (bool)
    {
        if (now >= performers[_thePool].endTime) {
            return true;
        }
    }

                                                          
                                                  
                                 
    function TIMEUNTILCLAIM939(address _thePool)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        if (now < performers[_thePool].endTime) {
            return (performers[_thePool].endTime);
        }
    }

                                                 
                                          
                                          
    function GETINFLATIONFACTOR3(address _group)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        return groups[_group].epochReward;
    }

                                        
                                                  
                                                    
                                         
    function GETPOOLOWNER179(address _ofPool)	//inject NONSTANDARD NAMING
        internal
        view
        returns (address)
    {
        return Owned(_ofPool).owner();
    }
}