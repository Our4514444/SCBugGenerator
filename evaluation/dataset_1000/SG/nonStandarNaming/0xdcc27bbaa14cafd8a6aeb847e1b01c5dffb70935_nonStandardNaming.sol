pragma solidity ^0.5.1;

// Made By Tom Jung

library SafeMath
{
  	function MUL641(uint256 a, uint256 b) internal pure returns (uint256)	//inject NONSTANDARD NAMING
    	{
		uint256 c = a * b;
		assert(a == 0 || c / a == b);

		return c;
  	}

  	function DIV731(uint256 a, uint256 b) internal pure returns (uint256)	//inject NONSTANDARD NAMING
	{
		uint256 c = a / b;

		return c;
  	}

  	function SUB749(uint256 a, uint256 b) internal pure returns (uint256)	//inject NONSTANDARD NAMING
	{
		assert(b <= a);

		return a - b;
  	}

  	function ADD444(uint256 a, uint256 b) internal pure returns (uint256)	//inject NONSTANDARD NAMING
	{
		uint256 c = a + b;
		assert(c >= a);

		return c;
  	}
}

contract OwnerHelper
{
  	address public master;
  	address public issuer;
  	address public manager;

  	event CHANGEMASTER704(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING
  	event CHANGEISSUER311(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING
  	event CHANGEMANAGER537(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

  	modifier ONLYMASTER837	//inject NONSTANDARD NAMING
	{
		require(msg.sender == master);
		_;
  	}
  	
  	modifier ONLYISSUER167	//inject NONSTANDARD NAMING
	{
		require(msg.sender == issuer);
		_;
  	}
  	
  	modifier ONLYMANAGER616	//inject NONSTANDARD NAMING
	{
		require(msg.sender == manager);
		_;
  	}

  	constructor() public
	{
		master = msg.sender;
  	}
  	
  	function TRANSFERMASTERSHIP189(address _to) ONLYMASTER837 public	//inject NONSTANDARD NAMING
  	{
        	require(_to != master);
        	require(_to != issuer);
        	require(_to != manager);
        	require(_to != address(0x0));

		address from = master;
  	    	master = _to;
  	    
  	    	emit CHANGEMASTER704(from, _to);
  	}

  	function TRANSFERISSUER677(address _to) ONLYMASTER837 public	//inject NONSTANDARD NAMING
	{
	        require(_to != master);
        	require(_to != issuer);
        	require(_to != manager);
	        require(_to != address(0x0));

		address from = issuer;        
	    	issuer = _to;
        
    		emit CHANGEISSUER311(from, _to);
  	}

  	function TRANSFERMANAGER162(address _to) ONLYMASTER837 public	//inject NONSTANDARD NAMING
	{
	        require(_to != master);
	        require(_to != issuer);
        	require(_to != manager);
	        require(_to != address(0x0));
        	
		address from = manager;
    		manager = _to;
        
	    	emit CHANGEMANAGER537(from, _to);
  	}
}

contract ERC20Interface
{
    event TRANSFER37( address indexed _from, address indexed _to, uint _value);	//inject NONSTANDARD NAMING
    event APPROVAL739( address indexed _owner, address indexed _spender, uint _value);	//inject NONSTANDARD NAMING
    
    function TOTALSUPPLY714() view public returns (uint _supply);	//inject NONSTANDARD NAMING
    function BALANCEOF556( address _who ) public view returns (uint _value);	//inject NONSTANDARD NAMING
    function TRANSFER492( address _to, uint _value) public returns (bool _success);	//inject NONSTANDARD NAMING
    function APPROVE207( address _spender, uint _value ) public returns (bool _success);	//inject NONSTANDARD NAMING
    function ALLOWANCE436( address _owner, address _spender ) public view returns (uint _allowance);	//inject NONSTANDARD NAMING
    function TRANSFERFROM461( address _from, address _to, uint _value) public returns (bool _success);	//inject NONSTANDARD NAMING
}

contract VantaToken is ERC20Interface, OwnerHelper
{
    using SafeMath for uint;
    
    string public name;
    uint public decimals;
    string public symbol;
    
    uint constant private e18360 = 1000000000000000000;	//inject NONSTANDARD NAMING
    uint constant private month647 = 2592000;	//inject NONSTANDARD NAMING
    
    uint constant public maxtotalsupply456     = 56200000000 * e18360;	//inject NONSTANDARD NAMING
    
    uint constant public maxsalesupply2      = 19670000000 * e18360;	//inject NONSTANDARD NAMING
    uint constant public maxbdevsupply923      =  8430000000 * e18360;	//inject NONSTANDARD NAMING
    uint constant public maxmktsupply215       =  8430000000 * e18360;	//inject NONSTANDARD NAMING
    uint constant public maxrndsupply56       =  8430000000 * e18360;	//inject NONSTANDARD NAMING
    uint constant public maxteamsupply584      =  5620000000 * e18360;	//inject NONSTANDARD NAMING
    uint constant public maxreservesupply132   =  2810000000 * e18360;	//inject NONSTANDARD NAMING
    uint constant public maxadvisorsupply202   =  2810000000 * e18360;	//inject NONSTANDARD NAMING
    
    uint constant public teamvestingsupplypertime551       = 351250000 * e18360;	//inject NONSTANDARD NAMING
    uint constant public advisorvestingsupplypertime800    = 702500000 * e18360;	//inject NONSTANDARD NAMING
    uint constant public teamvestingdate738                = 2 * month647;	//inject NONSTANDARD NAMING
    uint constant public teamvestingtime371                = 16;	//inject NONSTANDARD NAMING
    uint constant public advisorvestingdate215             = 3 * month647;	//inject NONSTANDARD NAMING
    uint constant public advisorvestingtime861             = 4;	//inject NONSTANDARD NAMING
    
    uint public totalTokenSupply;
    
    uint public tokenIssuedSale;
    uint public privateIssuedSale;
    uint public publicIssuedSale;
    uint public tokenIssuedBdev;
    uint public tokenIssuedMkt;
    uint public tokenIssuedRnd;
    uint public tokenIssuedTeam;
    uint public tokenIssuedReserve;
    uint public tokenIssuedAdvisor;
    
    uint public burnTokenSupply;
    
    mapping (address => uint) public balances;
    mapping (address => mapping ( address => uint )) public approvals;
    
    mapping (address => uint) public privateFirstWallet;
    
    mapping (address => uint) public privateSecondWallet;
    
    mapping (uint => uint) public teamVestingTimeAtSupply;
    mapping (uint => uint) public advisorVestingTimeAtSupply;
    
    bool public tokenLock = true;
    bool public saleTime = true;
    uint public endSaleTime = 0;
    
    event BURN83(address indexed _from, uint _value);	//inject NONSTANDARD NAMING
    
    event SALEISSUE209(address indexed _to, uint _tokens);	//inject NONSTANDARD NAMING
    event BDEVISSUE52(address indexed _to, uint _tokens);	//inject NONSTANDARD NAMING
    event MKTISSUE172(address indexed _to, uint _tokens);	//inject NONSTANDARD NAMING
    event RNDISSUE654(address indexed _to, uint _tokens);	//inject NONSTANDARD NAMING
    event TEAMISSUE576(address indexed _to, uint _tokens);	//inject NONSTANDARD NAMING
    event RESERVEISSUE329(address indexed _to, uint _tokens);	//inject NONSTANDARD NAMING
    event ADVISORISSUE364(address indexed _to, uint _tokens);	//inject NONSTANDARD NAMING
    
    event TOKENUNLOCK472(address indexed _to, uint _tokens);	//inject NONSTANDARD NAMING
    
    constructor() public
    {
        name        = "VANTA Token";
        decimals    = 18;
        symbol      = "VNT";
        
        totalTokenSupply = 0;
        
        tokenIssuedSale     = 0;
        tokenIssuedBdev     = 0;
        tokenIssuedMkt      = 0;
        tokenIssuedRnd      = 0;
        tokenIssuedTeam     = 0;
        tokenIssuedReserve  = 0;
        tokenIssuedAdvisor  = 0;
        
        require(maxtotalsupply456 == maxsalesupply2 + maxbdevsupply923 + maxmktsupply215 + maxrndsupply56 + maxteamsupply584 + maxreservesupply132 + maxadvisorsupply202);
        
        require(maxteamsupply584 == teamvestingsupplypertime551 * teamvestingtime371);
        require(maxadvisorsupply202 == advisorvestingsupplypertime800 * advisorvestingtime861);
    }
    
    // ERC - 20 Interface -----

    function TOTALSUPPLY714() view public returns (uint) 	//inject NONSTANDARD NAMING
    {
        return totalTokenSupply;
    }
    
    function BALANCEOF556(address _who) view public returns (uint) 	//inject NONSTANDARD NAMING
    {
        uint balance = balances[_who];
        balance = balance.ADD444(privateFirstWallet[_who] + privateSecondWallet[_who]);
        
        return balance;
    }
    
    function TRANSFER492(address _to, uint _value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        require(ISTRANSFERABLE340() == true);
        require(balances[msg.sender] >= _value);
        
        balances[msg.sender] = balances[msg.sender].SUB749(_value);
        balances[_to] = balances[_to].ADD444(_value);
        
        emit TRANSFER37(msg.sender, _to, _value);
        
        return true;
    }
    
    function APPROVE207(address _spender, uint _value) public returns (bool)	//inject NONSTANDARD NAMING
    {
        require(ISTRANSFERABLE340() == true);
        require(balances[msg.sender] >= _value);
        
        approvals[msg.sender][_spender] = _value;
        
        emit APPROVAL739(msg.sender, _spender, _value);
        
        return true; 
    }
    
    function ALLOWANCE436(address _owner, address _spender) view public returns (uint) 	//inject NONSTANDARD NAMING
    {
        return approvals[_owner][_spender];
    }

    function TRANSFERFROM461(address _from, address _to, uint _value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        require(ISTRANSFERABLE340() == true);
        require(balances[_from] >= _value);
        require(approvals[_from][msg.sender] >= _value);
        
        approvals[_from][msg.sender] = approvals[_from][msg.sender].SUB749(_value);
        balances[_from] = balances[_from].SUB749(_value);
        balances[_to]  = balances[_to].ADD444(_value);
        
        emit TRANSFER37(_from, _to, _value);
        
        return true;
    }
    
    // -----
    
    // Issue Function -----
    
    function PRIVATEISSUE428(address _to, uint _value) ONLYISSUER167 public	//inject NONSTANDARD NAMING
    {
        uint tokens = _value * e18360;
        require(maxsalesupply2 >= tokenIssuedSale.ADD444(tokens));
        
        balances[_to]                   = balances[_to].ADD444( tokens.MUL641(435)/1000 );
        privateFirstWallet[_to]         = privateFirstWallet[_to].ADD444( tokens.MUL641(435)/1000 );
        privateSecondWallet[_to]        = privateSecondWallet[_to].ADD444( tokens.MUL641(130)/1000 );
        
        totalTokenSupply = totalTokenSupply.ADD444(tokens);
        tokenIssuedSale = tokenIssuedSale.ADD444(tokens);
        privateIssuedSale = privateIssuedSale.ADD444(tokens);
        
        emit SALEISSUE209(_to, tokens);
    }
    
    function PUBLICISSUE383(address _to, uint _value) ONLYISSUER167 public	//inject NONSTANDARD NAMING
    {
        uint tokens = _value * e18360;
        require(maxsalesupply2 >= tokenIssuedSale.ADD444(tokens));
        
        balances[_to] = balances[_to].ADD444(tokens);
        
        totalTokenSupply = totalTokenSupply.ADD444(tokens);
        tokenIssuedSale = tokenIssuedSale.ADD444(tokens);
        publicIssuedSale = publicIssuedSale.ADD444(tokens);
        
        emit SALEISSUE209(_to, tokens);
    }
    
    function BDEVISSUE512(address _to, uint _value) ONLYISSUER167 public	//inject NONSTANDARD NAMING
    {
        uint tokens = _value * e18360;
        require(maxbdevsupply923 >= tokenIssuedBdev.ADD444(tokens));
        
        balances[_to] = balances[_to].ADD444(tokens);
        
        totalTokenSupply = totalTokenSupply.ADD444(tokens);
        tokenIssuedBdev = tokenIssuedBdev.ADD444(tokens);
        
        emit BDEVISSUE52(_to, tokens);
    }
    
    function MKTISSUE443(address _to, uint _value) ONLYISSUER167 public	//inject NONSTANDARD NAMING
    {
        uint tokens = _value * e18360;
        require(maxmktsupply215 >= tokenIssuedMkt.ADD444(tokens));
        
        balances[_to] = balances[_to].ADD444(tokens);
        
        totalTokenSupply = totalTokenSupply.ADD444(tokens);
        tokenIssuedMkt = tokenIssuedMkt.ADD444(tokens);
        
        emit MKTISSUE172(_to, tokens);
    }
    
    function RNDISSUE681(address _to, uint _value) ONLYISSUER167 public	//inject NONSTANDARD NAMING
    {
        uint tokens = _value * e18360;
        require(maxrndsupply56 >= tokenIssuedRnd.ADD444(tokens));
        
        balances[_to] = balances[_to].ADD444(tokens);
        
        totalTokenSupply = totalTokenSupply.ADD444(tokens);
        tokenIssuedRnd = tokenIssuedRnd.ADD444(tokens);
        
        emit RNDISSUE654(_to, tokens);
    }
    
    function RESERVEISSUE919(address _to, uint _value) ONLYISSUER167 public	//inject NONSTANDARD NAMING
    {
        uint tokens = _value * e18360;
        require(maxreservesupply132 >= tokenIssuedReserve.ADD444(tokens));
        
        balances[_to] = balances[_to].ADD444(tokens);
        
        totalTokenSupply = totalTokenSupply.ADD444(tokens);
        tokenIssuedReserve = tokenIssuedReserve.ADD444(tokens);
        
        emit RESERVEISSUE329(_to, tokens);
    }
    
    // ----
    
    // Vesting Issue Function -----
    
    function TEAMISSUEVESTING418(address _to, uint _time) ONLYISSUER167 public	//inject NONSTANDARD NAMING
    {
        require(saleTime == false);
        require(teamvestingtime371 >= _time);
        
        uint time = now;
        require( ( ( endSaleTime + (_time * teamvestingdate738) ) < time ) && ( teamVestingTimeAtSupply[_time] > 0 ) );
        
        uint tokens = teamVestingTimeAtSupply[_time];

        require(maxteamsupply584 >= tokenIssuedTeam.ADD444(tokens));
        
        balances[_to] = balances[_to].ADD444(tokens);
        teamVestingTimeAtSupply[_time] = 0;
        
        totalTokenSupply = totalTokenSupply.ADD444(tokens);
        tokenIssuedTeam = tokenIssuedTeam.ADD444(tokens);
        
        emit TEAMISSUE576(_to, tokens);
    }
    
    function ADVISORISSUEVESTING704(address _to, uint _time) ONLYISSUER167 public	//inject NONSTANDARD NAMING
    {
        require(saleTime == false);
        require(advisorvestingtime861 >= _time);
        
        uint time = now;
        require( ( ( endSaleTime + (_time * advisorvestingdate215) ) < time ) && ( advisorVestingTimeAtSupply[_time] > 0 ) );
        
        uint tokens = advisorVestingTimeAtSupply[_time];
        
        require(maxadvisorsupply202 >= tokenIssuedAdvisor.ADD444(tokens));
        
        balances[_to] = balances[_to].ADD444(tokens);
        advisorVestingTimeAtSupply[_time] = 0;
        
        totalTokenSupply = totalTokenSupply.ADD444(tokens);
        tokenIssuedAdvisor = tokenIssuedAdvisor.ADD444(tokens);
        
        emit ADVISORISSUE364(_to, tokens);
    }
    
    // -----
    
    // Lock Function -----
    
    function ISTRANSFERABLE340() private view returns (bool)	//inject NONSTANDARD NAMING
    {
        if(tokenLock == false)
        {
            return true;
        }
        else if(msg.sender == manager)
        {
            return true;
        }
        
        return false;
    }
    
    function SETTOKENUNLOCK525() ONLYMANAGER616 public	//inject NONSTANDARD NAMING
    {
        require(tokenLock == true);
        require(saleTime == false);
        
        tokenLock = false;
    }
    
    function SETTOKENLOCK199() ONLYMANAGER616 public	//inject NONSTANDARD NAMING
    {
        require(tokenLock == false);
        
        tokenLock = true;
    }
    
    function PRIVATEUNLOCK381(address _to) ONLYMANAGER616 public	//inject NONSTANDARD NAMING
    {
        require(tokenLock == false);
        require(saleTime == false);
        
        uint time = now;
        uint unlockTokens = 0;

        if( (time >= endSaleTime.ADD444(month647)) && (privateFirstWallet[_to] > 0) )
        {
            balances[_to] = balances[_to].ADD444(privateFirstWallet[_to]);
            unlockTokens = unlockTokens.ADD444(privateFirstWallet[_to]);
            privateFirstWallet[_to] = 0;
        }
        
        if( (time >= endSaleTime.ADD444(month647 * 2)) && (privateSecondWallet[_to] > 0) )
        {
            balances[_to] = balances[_to].ADD444(privateSecondWallet[_to]);
            unlockTokens = unlockTokens.ADD444(privateSecondWallet[_to]);
            privateSecondWallet[_to] = 0;
        }
        
        emit TOKENUNLOCK472(_to, unlockTokens);
    }
    
    // -----
    
    // ETC / Burn Function -----
    
    function () payable external
    {
        revert();
    }
    
    function ENDSALE760() ONLYMANAGER616 public	//inject NONSTANDARD NAMING
    {
        require(saleTime == true);
        
        saleTime = false;
        
        uint time = now;
        
        endSaleTime = time;
        
        for(uint i = 1; i <= teamvestingtime371; i++)
        {
            teamVestingTimeAtSupply[i] = teamVestingTimeAtSupply[i].ADD444(teamvestingsupplypertime551);
        }
        
        for(uint i = 1; i <= advisorvestingtime861; i++)
        {
            advisorVestingTimeAtSupply[i] = advisorVestingTimeAtSupply[i].ADD444(advisorvestingsupplypertime800);
        }
    }
    
    function WITHDRAWTOKENS916(address _contract, uint _decimals, uint _value) ONLYMANAGER616 public	//inject NONSTANDARD NAMING
    {

        if(_contract == address(0x0))
        {
            uint eth = _value.MUL641(10 ** _decimals);
            msg.sender.transfer(eth);
        }
        else
        {
            uint tokens = _value.MUL641(10 ** _decimals);
            ERC20Interface(_contract).TRANSFER492(msg.sender, tokens);
            
            emit TRANSFER37(address(0x0), msg.sender, tokens);
        }
    }
    
    function BURNTOKEN293(uint _value) ONLYMANAGER616 public	//inject NONSTANDARD NAMING
    {
        uint tokens = _value * e18360;
        
        require(balances[msg.sender] >= tokens);
        
        balances[msg.sender] = balances[msg.sender].SUB749(tokens);
        
        burnTokenSupply = burnTokenSupply.ADD444(tokens);
        totalTokenSupply = totalTokenSupply.SUB749(tokens);
        
        emit BURN83(msg.sender, tokens);
    }
    
    function CLOSE336() ONLYMASTER837 public	//inject NONSTANDARD NAMING
    {
        selfdestruct(msg.sender);
    }
    
    // -----
}