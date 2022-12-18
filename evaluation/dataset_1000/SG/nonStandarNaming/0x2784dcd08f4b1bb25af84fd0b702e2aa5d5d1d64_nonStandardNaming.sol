pragma solidity ^0.5.8;

                                                                                         
library SafeMath 
{
    function MUL976(uint256 a, uint256 b) internal pure returns (uint256) 	//inject NONSTANDARD NAMING
    {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV361(uint256 a, uint256 b) internal pure returns (uint256) 	//inject NONSTANDARD NAMING
    {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB658(uint256 a, uint256 b) internal pure returns (uint256) 	//inject NONSTANDARD NAMING
    {
        assert(b <= a);
        return a - b;
    }

    function ADD362(uint256 a, uint256 b) internal pure returns (uint256) 	//inject NONSTANDARD NAMING
    {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


                                                                                                                                                                                             
contract Ownable 
{
    address public owner;

                                                                                                                           
    constructor() public
    {
        owner = msg.sender;
    }

                                                                                 
    modifier ONLYOWNER384() 	//inject NONSTANDARD NAMING
    {
        assert(msg.sender == owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP810(address newOwner) ONLYOWNER384 public	//inject NONSTANDARD NAMING
    {
        assert(newOwner != address(0));
        owner = newOwner;
    }
}

                                                                                                                               
contract ERC20Basic 
{
    uint256 public totalSupply;
    function BALANCEOF60(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER931(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER196(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic 
{
    function ALLOWANCE601(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM854(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE110(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL360(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                             
contract POS 
{
    uint256 public stakeStartTime;
    uint256 public stakeMinAge;
    uint256 public stakeMaxAge;
    function POS918() public returns (bool);	//inject NONSTANDARD NAMING
    function COINAGE27() public view returns (uint);	//inject NONSTANDARD NAMING
    function ANNUALPOS334() public view returns (uint256);	//inject NONSTANDARD NAMING
    event MINT113(address indexed _address, uint _reward);	//inject NONSTANDARD NAMING
}

contract CraftR is ERC20,POS,Ownable 
{
    using SafeMath for uint256;

    string public name = "CraftR";
    string public symbol = "CRAFTR";
    uint public decimals = 18;

    uint public chainStartTime; 
    uint public chainStartBlockNumber;
    uint public stakeStartTime;
    uint public stakeMinAge = 1 days;
    uint public stakeMaxAge = 90 days;
    uint public defaultPOS = 10**17; // default 10% annual interest

    uint public totalSupply;
    uint public maxTotalSupply;
    uint public totalInitialSupply;

    struct transferInStruct
    {
        uint128 amount;
        uint64 time;
    }

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    mapping(address => transferInStruct[]) txIns;

    event BURN200(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

                                                                   
    modifier ONLYPAYLOADSIZE213(uint size) 	//inject NONSTANDARD NAMING
    {
        assert(msg.data.length >= size + 4);
        _;
    }

    modifier CANRUNPOS926() 	//inject NONSTANDARD NAMING
    {
        assert(totalSupply < maxTotalSupply);
        _;
    }

    constructor () public 
    {
        maxTotalSupply = 100*10**24; // 100 Mil
        totalInitialSupply = 60*10**24; // 60 Mil

        chainStartTime = now;
        chainStartBlockNumber = block.number;
        stakeStartTime = now;

        balances[msg.sender] = totalInitialSupply;
        totalSupply = totalInitialSupply;
    }

    function TRANSFER931(address _to, uint256 _value) ONLYPAYLOADSIZE213(2 * 32) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        if(msg.sender == _to) return POS918();
        balances[msg.sender] = balances[msg.sender].SUB658(_value);
        balances[_to] = balances[_to].ADD362(_value);
        emit TRANSFER196(msg.sender, _to, _value);
        if(txIns[msg.sender].length > 0) delete txIns[msg.sender];
        uint64 _now = uint64(now);
        txIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),_now));
        txIns[_to].push(transferInStruct(uint128(_value),_now));
        return true;
    }

    function BALANCEOF60(address _owner) public view returns (uint256 balance) 	//inject NONSTANDARD NAMING
    {
        return balances[_owner];
    }

    function TRANSFERFROM854(address _from, address _to, uint256 _value) ONLYPAYLOADSIZE213(3 * 32) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        require(_to != address(0));

        uint256 _allowance = allowed[_from][msg.sender];

        balances[_from] = balances[_from].SUB658(_value);
        balances[_to] = balances[_to].ADD362(_value);
        allowed[_from][msg.sender] = _allowance.SUB658(_value);
        emit TRANSFER196(_from, _to, _value);
        if(txIns[_from].length > 0) delete txIns[_from];
        uint64 _now = uint64(now);
        txIns[_from].push(transferInStruct(uint128(balances[_from]),_now));
        txIns[_to].push(transferInStruct(uint128(_value),_now));
        return true;
    }

    function APPROVE110(address _spender, uint256 _value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));

        allowed[msg.sender][_spender] = _value;
        emit APPROVAL360(msg.sender, _spender, _value);
        return true;
    }

    function ALLOWANCE601(address _owner, address _spender) public view returns (uint256 remaining) 	//inject NONSTANDARD NAMING
    {
        return allowed[_owner][_spender];
    }

    function POS918() CANRUNPOS926 public returns (bool) 	//inject NONSTANDARD NAMING
    {
        if(balances[msg.sender] <= 0) return false;
        if(txIns[msg.sender].length <= 0) return false;

        uint reward = GETPOSREWARD212(msg.sender);
        if(reward <= 0) return false;

        totalSupply = totalSupply.ADD362(reward);
        balances[msg.sender] = balances[msg.sender].ADD362(reward);
        delete txIns[msg.sender];
        txIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),uint64(now)));

        emit MINT113(msg.sender, reward);
        return true;
    }

    function GETCRAFTRBLOCKNUMBER962() public view returns (uint blockNumber) 	//inject NONSTANDARD NAMING
    {
        blockNumber = block.number.SUB658(chainStartBlockNumber);
    }

    function COINAGE27() public view returns (uint myCoinAge) 	//inject NONSTANDARD NAMING
    {
        myCoinAge = GETCOINAGE148(msg.sender,now);
    }

    function ANNUALPOS334() public view returns(uint interest) 	//inject NONSTANDARD NAMING
    {
        uint _now = now;
        interest = defaultPOS;
        if((_now.SUB658(stakeStartTime)).DIV361(365 days) == 0)
        {
            interest = (435 * defaultPOS).DIV361(100);
        }
    }

    function GETPOSREWARD212(address _address) internal view returns (uint) 	//inject NONSTANDARD NAMING
    {
        require( (now >= stakeStartTime) && (stakeStartTime > 0) );

        uint _now = now;
        uint _coinAge = GETCOINAGE148(_address, _now);
        if(_coinAge <= 0) return 0;

        uint interest = defaultPOS;
        // Due to the high interest rate for the first two years, compounding should be taken into account.
        // Effective annual interest rate = (1 + (nominal rate / number of compounding periods)) ^ (number of compounding periods) - 1
        if((_now.SUB658(stakeStartTime)).DIV361(365 days) == 0) 
        {
            // 2nd year effective annual interest rate is 50% when we select the stakeMaxAge (90 days) as the compounding period.
            // 1st year has already been calculated through the old contract
            interest = (435 * defaultPOS).DIV361(100);
        }
        return (_coinAge * interest).DIV361(365 * (10**decimals));
    }

    function GETCOINAGE148(address _address, uint _now) internal view returns (uint _coinAge) 	//inject NONSTANDARD NAMING
    {
        if(txIns[_address].length <= 0) return 0;

        for (uint i = 0; i < txIns[_address].length; i++){
            if( _now < uint(txIns[_address][i].time).ADD362(stakeMinAge) ) continue;

            uint nCoinSeconds = _now.SUB658(uint(txIns[_address][i].time));
            if( nCoinSeconds > stakeMaxAge ) nCoinSeconds = stakeMaxAge;

            _coinAge = _coinAge.ADD362(uint(txIns[_address][i].amount) * nCoinSeconds.DIV361(1 days));
        }
    }

    function OWNERMULTISEND805(address[] memory _recipients, uint[] memory _values) ONLYOWNER384 public returns (bool) 	//inject NONSTANDARD NAMING
    {
        require( _recipients.length > 0 && _recipients.length == _values.length);

        uint total = 0;
        for(uint i = 0; i < _values.length; i++)
        {
            total = total.ADD362(_values[i]);
        }
        require(total <= balances[msg.sender]);

        uint64 _now = uint64(now);
        for(uint j = 0; j < _recipients.length; j++)
        {
            balances[_recipients[j]] = balances[_recipients[j]].ADD362(_values[j]);
            txIns[_recipients[j]].push(transferInStruct(uint128(_values[j]),_now));
            emit TRANSFER196(msg.sender, _recipients[j], _values[j]);
        }

        balances[msg.sender] = balances[msg.sender].SUB658(total);
        if(txIns[msg.sender].length > 0) delete txIns[msg.sender];
        if(balances[msg.sender] > 0) txIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),_now));

        return true;
    }

    function OWNERBURNTOKENS507(uint _value) ONLYOWNER384 public 	//inject NONSTANDARD NAMING
    {
        require(_value > 0);

        balances[msg.sender] = balances[msg.sender].SUB658(_value);
        delete txIns[msg.sender];
        txIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),uint64(now)));

        totalSupply = totalSupply.SUB658(_value);
        totalInitialSupply = totalInitialSupply.SUB658(_value);
        maxTotalSupply = maxTotalSupply.SUB658(_value*10);

        emit BURN200(msg.sender, _value);
    }   
}