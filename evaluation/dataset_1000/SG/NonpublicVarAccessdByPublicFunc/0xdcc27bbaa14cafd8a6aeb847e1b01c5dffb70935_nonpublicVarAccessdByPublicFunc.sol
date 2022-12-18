pragma solidity ^0.5.1;

// Made By Tom Jung

library SafeMath
{
  	function mul(uint256 a, uint256 b) internal pure returns (uint256)
    	{
		uint256 c = a * b;
		assert(a == 0 || c / a == b);

		return c;
  	}

  	function div(uint256 a, uint256 b) internal pure returns (uint256)
	{
		uint256 c = a / b;

		return c;
  	}

  	function sub(uint256 a, uint256 b) internal pure returns (uint256)
	{
		assert(b <= a);

		return a - b;
  	}

  	function add(uint256 a, uint256 b) internal pure returns (uint256)
	{
		uint256 c = a + b;
		assert(c >= a);

		return c;
  	}
}

contract OwnerHelper
{
  	address internal master;
  	address internal issuer;
  	address internal manager;

  	event ChangeMaster(address indexed _from, address indexed _to);
  	event ChangeIssuer(address indexed _from, address indexed _to);
  	event ChangeManager(address indexed _from, address indexed _to);

  	modifier onlyMaster
	{
		require(msg.sender == master);
		_;
  	}
  	
  	modifier onlyIssuer
	{
		require(msg.sender == issuer);
		_;
  	}
  	
  	modifier onlyManager
	{
		require(msg.sender == manager);
		_;
  	}

  	constructor() public
	{
		master = msg.sender;
  	}
  	
  	function transferMastership(address _to) onlyMaster public
  	{
        	require(_to != master);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	require(_to != issuer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	require(_to != manager);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	require(_to != address(0x0));

		address from = master;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  	    	master = _to;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  	    
  	    	emit ChangeMaster(from, _to);
  	}

  	function transferIssuer(address _to) onlyMaster public
	{
	        require(_to != master);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	require(_to != issuer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	require(_to != manager);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	        require(_to != address(0x0));

		address from = issuer;        	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	    	issuer = _to;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
    		emit ChangeIssuer(from, _to);
  	}

  	function transferManager(address _to) onlyMaster public
	{
	        require(_to != master);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	        require(_to != issuer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        	require(_to != manager);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	        require(_to != address(0x0));
        	
		address from = manager;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    		manager = _to;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
	    	emit ChangeManager(from, _to);
  	}
}

contract ERC20Interface
{
    event Transfer( address indexed _from, address indexed _to, uint _value);
    event Approval( address indexed _owner, address indexed _spender, uint _value);
    
    function totalSupply() view public returns (uint _supply);
    function balanceOf( address _who ) public view returns (uint _value);
    function transfer( address _to, uint _value) public returns (bool _success);
    function approve( address _spender, uint _value ) public returns (bool _success);
    function allowance( address _owner, address _spender ) public view returns (uint _allowance);
    function transferFrom( address _from, address _to, uint _value) public returns (bool _success);
}

contract VantaToken is ERC20Interface, OwnerHelper
{
    using SafeMath for uint;
    
    string public name;
    uint public decimals;
    string public symbol;
    
    uint constant private E18 = 1000000000000000000;
    uint constant private month = 2592000;
    
    uint constant public maxTotalSupply     = 56200000000 * E18;
    
    uint constant internal maxSaleSupply      = 19670000000 * E18;
    uint constant internal maxBdevSupply      =  8430000000 * E18;
    uint constant internal maxMktSupply       =  8430000000 * E18;
    uint constant internal maxRndSupply       =  8430000000 * E18;
    uint constant internal maxTeamSupply      =  5620000000 * E18;
    uint constant internal maxReserveSupply   =  2810000000 * E18;
    uint constant internal maxAdvisorSupply   =  2810000000 * E18;
    
    uint constant internal teamVestingSupplyPerTime       = 351250000 * E18;
    uint constant internal advisorVestingSupplyPerTime    = 702500000 * E18;
    uint constant internal teamVestingDate                = 2 * month;
    uint constant internal teamVestingTime                = 16;
    uint constant internal advisorVestingDate             = 3 * month;
    uint constant internal advisorVestingTime             = 4;
    
    uint internal totalTokenSupply;
    
    uint internal tokenIssuedSale;
    uint internal privateIssuedSale;
    uint internal publicIssuedSale;
    uint internal tokenIssuedBdev;
    uint internal tokenIssuedMkt;
    uint internal tokenIssuedRnd;
    uint internal tokenIssuedTeam;
    uint internal tokenIssuedReserve;
    uint internal tokenIssuedAdvisor;
    
    uint internal burnTokenSupply;
    
    mapping (address => uint) internal balances;
    mapping (address => mapping ( address => uint )) internal approvals;
    
    mapping (address => uint) internal privateFirstWallet;
    
    mapping (address => uint) internal privateSecondWallet;
    
    mapping (uint => uint) internal teamVestingTimeAtSupply;
    mapping (uint => uint) internal advisorVestingTimeAtSupply;
    
    bool internal tokenLock = true;
    bool internal saleTime = true;
    uint internal endSaleTime = 0;
    
    event Burn(address indexed _from, uint _value);
    
    event SaleIssue(address indexed _to, uint _tokens);
    event BdevIssue(address indexed _to, uint _tokens);
    event MktIssue(address indexed _to, uint _tokens);
    event RndIssue(address indexed _to, uint _tokens);
    event TeamIssue(address indexed _to, uint _tokens);
    event ReserveIssue(address indexed _to, uint _tokens);
    event AdvisorIssue(address indexed _to, uint _tokens);
    
    event TokenUnLock(address indexed _to, uint _tokens);
    
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
        
        require(maxTotalSupply == maxSaleSupply + maxBdevSupply + maxMktSupply + maxRndSupply + maxTeamSupply + maxReserveSupply + maxAdvisorSupply);
        
        require(maxTeamSupply == teamVestingSupplyPerTime * teamVestingTime);
        require(maxAdvisorSupply == advisorVestingSupplyPerTime * advisorVestingTime);
    }
    
    // ERC - 20 Interface -----

    function totalSupply() view public returns (uint) 
    {
        return totalTokenSupply;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function balanceOf(address _who) view public returns (uint) 
    {
        uint balance = balances[_who];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balance = balance.add(privateFirstWallet[_who] + privateSecondWallet[_who]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        return balance;
    }
    
    function transfer(address _to, uint _value) public returns (bool) 
    {
        require(isTransferable() == true);
        require(balances[msg.sender] >= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[msg.sender] = balances[msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to] = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
    
    function approve(address _spender, uint _value) public returns (bool)
    {
        require(isTransferable() == true);
        require(balances[msg.sender] >= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        approvals[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Approval(msg.sender, _spender, _value);
        
        return true; 
    }
    
    function allowance(address _owner, address _spender) view public returns (uint) 
    {
        return approvals[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function transferFrom(address _from, address _to, uint _value) public returns (bool) 
    {
        require(isTransferable() == true);
        require(balances[_from] >= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(approvals[_from][msg.sender] >= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        approvals[_from][msg.sender] = approvals[_from][msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_from] = balances[_from].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to]  = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Transfer(_from, _to, _value);
        
        return true;
    }
    
    // -----
    
    // Issue Function -----
    
    function privateIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(maxSaleSupply >= tokenIssuedSale.add(tokens));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[_to]                   = balances[_to].add( tokens.mul(435)/1000 );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        privateFirstWallet[_to]         = privateFirstWallet[_to].add( tokens.mul(435)/1000 );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        privateSecondWallet[_to]        = privateSecondWallet[_to].add( tokens.mul(130)/1000 );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        totalTokenSupply = totalTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenIssuedSale = tokenIssuedSale.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        privateIssuedSale = privateIssuedSale.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit SaleIssue(_to, tokens);
    }
    
    function publicIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(maxSaleSupply >= tokenIssuedSale.add(tokens));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[_to] = balances[_to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        totalTokenSupply = totalTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenIssuedSale = tokenIssuedSale.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        publicIssuedSale = publicIssuedSale.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit SaleIssue(_to, tokens);
    }
    
    function bdevIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(maxBdevSupply >= tokenIssuedBdev.add(tokens));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[_to] = balances[_to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        totalTokenSupply = totalTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenIssuedBdev = tokenIssuedBdev.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit BdevIssue(_to, tokens);
    }
    
    function mktIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(maxMktSupply >= tokenIssuedMkt.add(tokens));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[_to] = balances[_to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        totalTokenSupply = totalTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenIssuedMkt = tokenIssuedMkt.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit MktIssue(_to, tokens);
    }
    
    function rndIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(maxRndSupply >= tokenIssuedRnd.add(tokens));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[_to] = balances[_to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        totalTokenSupply = totalTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenIssuedRnd = tokenIssuedRnd.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit RndIssue(_to, tokens);
    }
    
    function reserveIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(maxReserveSupply >= tokenIssuedReserve.add(tokens));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[_to] = balances[_to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        totalTokenSupply = totalTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenIssuedReserve = tokenIssuedReserve.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit ReserveIssue(_to, tokens);
    }
    
    // ----
    
    // Vesting Issue Function -----
    
    function teamIssueVesting(address _to, uint _time) onlyIssuer public
    {
        require(saleTime == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(teamVestingTime >= _time);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint time = now;
        require( ( ( endSaleTime + (_time * teamVestingDate) ) < time ) && ( teamVestingTimeAtSupply[_time] > 0 ) );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint tokens = teamVestingTimeAtSupply[_time];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        require(maxTeamSupply >= tokenIssuedTeam.add(tokens));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[_to] = balances[_to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        teamVestingTimeAtSupply[_time] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        totalTokenSupply = totalTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenIssuedTeam = tokenIssuedTeam.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit TeamIssue(_to, tokens);
    }
    
    function advisorIssueVesting(address _to, uint _time) onlyIssuer public
    {
        require(saleTime == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(advisorVestingTime >= _time);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint time = now;
        require( ( ( endSaleTime + (_time * advisorVestingDate) ) < time ) && ( advisorVestingTimeAtSupply[_time] > 0 ) );	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint tokens = advisorVestingTimeAtSupply[_time];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        require(maxAdvisorSupply >= tokenIssuedAdvisor.add(tokens));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[_to] = balances[_to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        advisorVestingTimeAtSupply[_time] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        totalTokenSupply = totalTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenIssuedAdvisor = tokenIssuedAdvisor.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit AdvisorIssue(_to, tokens);
    }
    
    // -----
    
    // Lock Function -----
    
    function isTransferable() private view returns (bool)
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
    
    function setTokenUnlock() onlyManager public
    {
        require(tokenLock == true);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(saleTime == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        tokenLock = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function setTokenLock() onlyManager public
    {
        require(tokenLock == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        tokenLock = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function privateUnlock(address _to) onlyManager public
    {
        require(tokenLock == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(saleTime == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint time = now;
        uint unlockTokens = 0;

        if( (time >= endSaleTime.add(month)) && (privateFirstWallet[_to] > 0) )	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        {
            balances[_to] = balances[_to].add(privateFirstWallet[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            unlockTokens = unlockTokens.add(privateFirstWallet[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            privateFirstWallet[_to] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        if( (time >= endSaleTime.add(month * 2)) && (privateSecondWallet[_to] > 0) )	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        {
            balances[_to] = balances[_to].add(privateSecondWallet[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            unlockTokens = unlockTokens.add(privateSecondWallet[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            privateSecondWallet[_to] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        emit TokenUnLock(_to, unlockTokens);
    }
    
    // -----
    
    // ETC / Burn Function -----
    
    function () payable external
    {
        revert();
    }
    
    function endSale() onlyManager public
    {
        require(saleTime == true);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        saleTime = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint time = now;
        
        endSaleTime = time;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        for(uint i = 1; i <= teamVestingTime; i++)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        {
            teamVestingTimeAtSupply[i] = teamVestingTimeAtSupply[i].add(teamVestingSupplyPerTime);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        for(uint i = 1; i <= advisorVestingTime; i++)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        {
            advisorVestingTimeAtSupply[i] = advisorVestingTimeAtSupply[i].add(advisorVestingSupplyPerTime);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }
    
    function withdrawTokens(address _contract, uint _decimals, uint _value) onlyManager public
    {

        if(_contract == address(0x0))
        {
            uint eth = _value.mul(10 ** _decimals);
            msg.sender.transfer(eth);
        }
        else
        {
            uint tokens = _value.mul(10 ** _decimals);
            ERC20Interface(_contract).transfer(msg.sender, tokens);
            
            emit Transfer(address(0x0), msg.sender, tokens);
        }
    }
    
    function burnToken(uint _value) onlyManager public
    {
        uint tokens = _value * E18;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        require(balances[msg.sender] >= tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        balances[msg.sender] = balances[msg.sender].sub(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        burnTokenSupply = burnTokenSupply.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalTokenSupply = totalTokenSupply.sub(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Burn(msg.sender, tokens);
    }
    
    function close() onlyMaster public
    {
        selfdestruct(msg.sender);
    }
    
    // -----
}