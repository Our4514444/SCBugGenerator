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
  	address public master;
  	address public issuer;
  	address public manager;

 function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
 	event ChangeMaster(address indexed _from, address indexed _to);
 function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
 	event ChangeIssuer(address indexed _from, address indexed _to);
 function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
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
        	require(_to != master);
        	require(_to != issuer);
        	require(_to != manager);
        	require(_to != address(0x0));

		address from = master;
  	    	master = _to;
  	    
  	    	emit ChangeMaster(from, _to);
  	}

  	function transferIssuer(address _to) onlyMaster public
	{
	        require(_to != master);
        	require(_to != issuer);
        	require(_to != manager);
	        require(_to != address(0x0));

		address from = issuer;        
	    	issuer = _to;
        
    		emit ChangeIssuer(from, _to);
  	}

  	function transferManager(address _to) onlyMaster public
	{
	        require(_to != master);
	        require(_to != issuer);
        	require(_to != manager);
	        require(_to != address(0x0));
        	
		address from = manager;
    		manager = _to;
        
	    	emit ChangeManager(from, _to);
  	}
}

contract ERC20Interface
{
  function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
  event Transfer( address indexed _from, address indexed _to, uint _value);
  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  event Approval( address indexed _owner, address indexed _spender, uint _value);
    
    function totalSupply() view public returns (uint _supply);
    function balanceOf( address _who ) public view returns (uint _value);
    function transfer( address _to, uint _value) public returns (bool _success);
    function approve( address _spender, uint _value ) public returns (bool _success);
    function allowance( address _owner, address _spender ) public view returns (uint _allowance);
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
    function transferFrom( address _from, address _to, uint _value) public returns (bool _success);
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
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
    
    uint constant public maxSaleSupply      = 19670000000 * E18;
    uint constant public maxBdevSupply      =  8430000000 * E18;
    uint constant public maxMktSupply       =  8430000000 * E18;
    uint constant public maxRndSupply       =  8430000000 * E18;
    uint constant public maxTeamSupply      =  5620000000 * E18;
    uint constant public maxReserveSupply   =  2810000000 * E18;
    uint constant public maxAdvisorSupply   =  2810000000 * E18;
    
    uint constant public teamVestingSupplyPerTime       = 351250000 * E18;
    uint constant public advisorVestingSupplyPerTime    = 702500000 * E18;
    uint constant public teamVestingDate                = 2 * month;
    uint constant public teamVestingTime                = 16;
    uint constant public advisorVestingDate             = 3 * month;
    uint constant public advisorVestingTime             = 4;
    
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
    
  function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
  event Burn(address indexed _from, uint _value);
    
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  event SaleIssue(address indexed _to, uint _tokens);
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  event BdevIssue(address indexed _to, uint _tokens);
  function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
  event MktIssue(address indexed _to, uint _tokens);
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  event RndIssue(address indexed _to, uint _tokens);
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  event TeamIssue(address indexed _to, uint _tokens);
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event ReserveIssue(address indexed _to, uint _tokens);
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event AdvisorIssue(address indexed _to, uint _tokens);
    
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
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
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
    
    // ERC - 20 Interface -----

    function totalSupply() view public returns (uint) 
    {
        return totalTokenSupply;
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
    
    function balanceOf(address _who) view public returns (uint) 
    {
        uint balance = balances[_who];
        balance = balance.add(privateFirstWallet[_who] + privateSecondWallet[_who]);
        
        return balance;
    }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
    
    function transfer(address _to, uint _value) public returns (bool) 
    {
        require(isTransferable() == true);
        require(balances[msg.sender] >= _value);
        
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    
    function approve(address _spender, uint _value) public returns (bool)
    {
        require(isTransferable() == true);
        require(balances[msg.sender] >= _value);
        
        approvals[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);
        
        return true; 
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
    
    function allowance(address _owner, address _spender) view public returns (uint) 
    {
        return approvals[_owner][_spender];
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

    function transferFrom(address _from, address _to, uint _value) public returns (bool) 
    {
        require(isTransferable() == true);
        require(balances[_from] >= _value);
        require(approvals[_from][msg.sender] >= _value);
        
        approvals[_from][msg.sender] = approvals[_from][msg.sender].sub(_value);
        balances[_from] = balances[_from].sub(_value);
        balances[_to]  = balances[_to].add(_value);
        
        emit Transfer(_from, _to, _value);
        
        return true;
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    
    // -----
    
    // Issue Function -----
    
    function privateIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;
        require(maxSaleSupply >= tokenIssuedSale.add(tokens));
        
        balances[_to]                   = balances[_to].add( tokens.mul(435)/1000 );
        privateFirstWallet[_to]         = privateFirstWallet[_to].add( tokens.mul(435)/1000 );
        privateSecondWallet[_to]        = privateSecondWallet[_to].add( tokens.mul(130)/1000 );
        
        totalTokenSupply = totalTokenSupply.add(tokens);
        tokenIssuedSale = tokenIssuedSale.add(tokens);
        privateIssuedSale = privateIssuedSale.add(tokens);
        
        emit SaleIssue(_to, tokens);
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
    
    function publicIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;
        require(maxSaleSupply >= tokenIssuedSale.add(tokens));
        
        balances[_to] = balances[_to].add(tokens);
        
        totalTokenSupply = totalTokenSupply.add(tokens);
        tokenIssuedSale = tokenIssuedSale.add(tokens);
        publicIssuedSale = publicIssuedSale.add(tokens);
        
        emit SaleIssue(_to, tokens);
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    
    function bdevIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;
        require(maxBdevSupply >= tokenIssuedBdev.add(tokens));
        
        balances[_to] = balances[_to].add(tokens);
        
        totalTokenSupply = totalTokenSupply.add(tokens);
        tokenIssuedBdev = tokenIssuedBdev.add(tokens);
        
        emit BdevIssue(_to, tokens);
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
    
    function mktIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;
        require(maxMktSupply >= tokenIssuedMkt.add(tokens));
        
        balances[_to] = balances[_to].add(tokens);
        
        totalTokenSupply = totalTokenSupply.add(tokens);
        tokenIssuedMkt = tokenIssuedMkt.add(tokens);
        
        emit MktIssue(_to, tokens);
    }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
    
    function rndIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;
        require(maxRndSupply >= tokenIssuedRnd.add(tokens));
        
        balances[_to] = balances[_to].add(tokens);
        
        totalTokenSupply = totalTokenSupply.add(tokens);
        tokenIssuedRnd = tokenIssuedRnd.add(tokens);
        
        emit RndIssue(_to, tokens);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
    
    function reserveIssue(address _to, uint _value) onlyIssuer public
    {
        uint tokens = _value * E18;
        require(maxReserveSupply >= tokenIssuedReserve.add(tokens));
        
        balances[_to] = balances[_to].add(tokens);
        
        totalTokenSupply = totalTokenSupply.add(tokens);
        tokenIssuedReserve = tokenIssuedReserve.add(tokens);
        
        emit ReserveIssue(_to, tokens);
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
    
    // ----
    
    // Vesting Issue Function -----
    
    function teamIssueVesting(address _to, uint _time) onlyIssuer public
    {
        require(saleTime == false);
        require(teamVestingTime >= _time);
        
        uint time = now;
        require( ( ( endSaleTime + (_time * teamVestingDate) ) < time ) && ( teamVestingTimeAtSupply[_time] > 0 ) );
        
        uint tokens = teamVestingTimeAtSupply[_time];

        require(maxTeamSupply >= tokenIssuedTeam.add(tokens));
        
        balances[_to] = balances[_to].add(tokens);
        teamVestingTimeAtSupply[_time] = 0;
        
        totalTokenSupply = totalTokenSupply.add(tokens);
        tokenIssuedTeam = tokenIssuedTeam.add(tokens);
        
        emit TeamIssue(_to, tokens);
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    
    function advisorIssueVesting(address _to, uint _time) onlyIssuer public
    {
        require(saleTime == false);
        require(advisorVestingTime >= _time);
        
        uint time = now;
        require( ( ( endSaleTime + (_time * advisorVestingDate) ) < time ) && ( advisorVestingTimeAtSupply[_time] > 0 ) );
        
        uint tokens = advisorVestingTimeAtSupply[_time];
        
        require(maxAdvisorSupply >= tokenIssuedAdvisor.add(tokens));
        
        balances[_to] = balances[_to].add(tokens);
        advisorVestingTimeAtSupply[_time] = 0;
        
        totalTokenSupply = totalTokenSupply.add(tokens);
        tokenIssuedAdvisor = tokenIssuedAdvisor.add(tokens);
        
        emit AdvisorIssue(_to, tokens);
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
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
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    
    function setTokenUnlock() onlyManager public
    {
        require(tokenLock == true);
        require(saleTime == false);
        
        tokenLock = false;
    }
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
    
    function setTokenLock() onlyManager public
    {
        require(tokenLock == false);
        
        tokenLock = true;
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
    
    function privateUnlock(address _to) onlyManager public
    {
        require(tokenLock == false);
        require(saleTime == false);
        
        uint time = now;
        uint unlockTokens = 0;

        if( (time >= endSaleTime.add(month)) && (privateFirstWallet[_to] > 0) )
        {
            balances[_to] = balances[_to].add(privateFirstWallet[_to]);
            unlockTokens = unlockTokens.add(privateFirstWallet[_to]);
            privateFirstWallet[_to] = 0;
        }
        
        if( (time >= endSaleTime.add(month * 2)) && (privateSecondWallet[_to] > 0) )
        {
            balances[_to] = balances[_to].add(privateSecondWallet[_to]);
            unlockTokens = unlockTokens.add(privateSecondWallet[_to]);
            privateSecondWallet[_to] = 0;
        }
        
        emit TokenUnLock(_to, unlockTokens);
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
    
    // -----
    
    // ETC / Burn Function -----
    
    function () payable external
    {
        revert();
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
    
    function endSale() onlyManager public
    {
        require(saleTime == true);
        
        saleTime = false;
        
        uint time = now;
        
        endSaleTime = time;
        
        for(uint i = 1; i <= teamVestingTime; i++)
        {
            teamVestingTimeAtSupply[i] = teamVestingTimeAtSupply[i].add(teamVestingSupplyPerTime);
        }
        
        for(uint i = 1; i <= advisorVestingTime; i++)
        {
            advisorVestingTimeAtSupply[i] = advisorVestingTimeAtSupply[i].add(advisorVestingSupplyPerTime);
        }
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
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
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
    
    function burnToken(uint _value) onlyManager public
    {
        uint tokens = _value * E18;
        
        require(balances[msg.sender] >= tokens);
        
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        
        burnTokenSupply = burnTokenSupply.add(tokens);
        totalTokenSupply = totalTokenSupply.sub(tokens);
        
        emit Burn(msg.sender, tokens);
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
    
    function close() onlyMaster public
    {
        selfdestruct(msg.sender);
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
    
    // -----
}