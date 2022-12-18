pragma solidity ^0.5.1;

contract ERC20Interface {
	function TOTALSUPPLY103() public view returns (uint);	//inject NONSTANDARD NAMING
	function BALANCEOF758(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
	function ALLOWANCE775(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
	function TRANSFER669(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
	function APPROVE615(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
	function TRANSFERFROM141(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

	event TRANSFER747(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
	event APPROVAL772(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

contract HomesCoin is ERC20Interface {

	string public symbol;
	string public  name;
	uint8 public decimals;
	uint _totalSupply;
	
	uint public base_price;			// base price in 1/10000 ether
	uint public min_fee;			// min fee for trades
	uint public fee_div;			// divisor for the fee
	uint public min_balance;		// minimum balance for the fee acceptor account
	
	address payable public oracle_adr;	// address to send fees to
	
	address payable public owner;

	mapping(address => uint) public balances;
	mapping(address => mapping(address => uint)) allowed;

	// ------------------------------------------------------------------------
	// Constructor
	// ------------------------------------------------------------------------
	constructor() public {
		symbol = "HOM";
		name = "HOM Coin";
		decimals = 18;
		_totalSupply = 10000000 * 10**uint(decimals);
		owner = msg.sender;
		balances[address(this)] = _totalSupply;
		emit TRANSFER747(address(0), owner, _totalSupply);
		base_price=100000;
		oracle_adr = address(uint160(owner));
		min_balance = .02 ether;
		fee_div = 100;
		min_fee = .000001 ether;
	}

	function TOTALSUPPLY103() public view returns (uint) {	//inject NONSTANDARD NAMING
		return _totalSupply;
	}
	
	function GETCIRCULATINGSUPPLY590() public view returns (uint) {	//inject NONSTANDARD NAMING
	    return _totalSupply - balances[address(this)];
	}
	
	uint public lastTradedPrice = 0;

	function BALANCEOF758(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
		return balances[tokenOwner];
	}

	function TRANSFER669(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(to!=address(0));
		require(tokens<=balances[msg.sender]);
		balances[msg.sender] = balances[msg.sender] - tokens;
		balances[to] = balances[to] + tokens;
		emit TRANSFER747(msg.sender, to, tokens);
		return true;
	}

	function APPROVE615(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
		allowed[msg.sender][spender] = tokens;
		emit APPROVAL772(msg.sender, spender, tokens);
		return true;
	}

	function TRANSFERFROM141(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(to!=address(0));
		require(balances[from]>=tokens);
		require(allowed[from][msg.sender]>=tokens);
		balances[from] = balances[from] - tokens;
		allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
		balances[to] = balances[to] + tokens;
		emit TRANSFER747(from, to, tokens);
		return true;
	}

	function ALLOWANCE775(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
		return allowed[tokenOwner][spender];
	}
	
	function MINT917(uint amt) public{	//inject NONSTANDARD NAMING
		require(msg.sender==owner);
		balances[address(this)] += amt;
		emit TRANSFER747(address(0), address(this), amt);
	}
	function BURN707(uint amt) public{	//inject NONSTANDARD NAMING
		require(msg.sender==owner);
		require(balances[owner]>=amt);
		balances[owner]-=amt;
		emit TRANSFER747(owner, address(0), amt);
	}
	
	function DESTROY998(address payable receiver) public {	//inject NONSTANDARD NAMING
		require(msg.sender==owner);
		selfdestruct(receiver);
	}
	
	event HOMESALEEVENT968(uint64 houseid, uint8 day, uint8 month, uint16 year, uint64 price100, string source);	//inject NONSTANDARD NAMING
	
	mapping(uint64=>string) public addresses;
	mapping(uint64=>uint32) public sqfts;
	mapping(uint64=>uint8) public bedrooms;
	mapping(uint64=>uint8) public bathrooms;
	mapping(uint64=>uint8) public house_type;
	mapping(uint64=>uint16) public year_built;
	mapping(uint64=>uint32) public lot_size;
	mapping(uint64=>uint64) public parcel_num;
	mapping(uint64=>uint32) public zipcode;
	
	uint64 public num_houses = 0;
	
	function MAKEEVENT476(uint64 houseid, uint8 day, uint8 month, uint16 year, uint64 price100, string memory source) public{	//inject NONSTANDARD NAMING
		require(msg.sender==owner);
		emit HOMESALEEVENT968(houseid,day,month,year, price100, source);
	}
	
	function ADDHOUSE15(string memory adr, uint32 sqft, uint8 bedroom,uint8 bathroom,uint8 h_type, uint16 yr_built, uint32 lotsize, uint64 parcel, uint32 zip) public{	//inject NONSTANDARD NAMING
		require(msg.sender==owner);
		require(bytes(adr).length<128);
		addresses[num_houses] = adr;
		sqfts[num_houses]=sqft;
		bedrooms[num_houses]=bedroom;
		bathrooms[num_houses]=bathroom;
		house_type[num_houses]=h_type;
		year_built[num_houses]=yr_built;
		lot_size[num_houses] = lotsize;
		parcel_num[num_houses] = parcel;
		zipcode[num_houses] = zip;
		num_houses++;
	}
	function RESETHOUSEPARAMS214(uint64 num_house, uint32 sqft, uint8 bedroom,uint8 bathroom,uint8 h_type, uint16 yr_built, uint32 lotsize, uint64 parcel, uint32 zip) public{	//inject NONSTANDARD NAMING
		require(msg.sender==owner);
		sqfts[num_house]=sqft;
		bedrooms[num_house]=bedroom;
		bathrooms[num_house]=bathroom;
		house_type[num_house]=h_type;
		year_built[num_house]=yr_built;
		lot_size[num_house] = lotsize;
		parcel_num[num_house] = parcel;
		zipcode[num_house] = zip;
	}
	
	event DONATIONEVENT383(address sender, uint value);	//inject NONSTANDARD NAMING
	
	function ()external payable{
		emit DONATIONEVENT383(msg.sender,msg.value);
	}
	
	function GETFEE674() public view returns (uint fee){	//inject NONSTANDARD NAMING
		uint a = oracle_adr.balance;
		if(a>min_balance)return min_fee;
		return (min_balance-a)/fee_div;
	}
	
	function GETSELLRETURN755(uint amount) public view returns (uint value){	// ether for selling amount tokens	//inject NONSTANDARD NAMING
		uint a = GETFEE674();
		if(a>(amount*base_price/10000))return 0; // if the fee outweighs the return
		return (amount*base_price/10000) - a;
	}
	function GETBUYCOST875(uint amount) public view returns (uint cost){		// ether cost for buying amount tokens	//inject NONSTANDARD NAMING
	    return (amount*base_price/10000) + GETFEE674();
	}
	
	event SELLEVENT762(uint tokens);	//inject NONSTANDARD NAMING
	event BUYEVENT16(uint tokens);	//inject NONSTANDARD NAMING
	
	function BUY582(uint tokens)public payable{	//inject NONSTANDARD NAMING
	    uint cost = GETBUYCOST875(tokens);
		require(msg.value>=cost);
		require(balances[address(this)]>=tokens);
		
		balances[address(this)]-=tokens;
		balances[msg.sender]+=tokens;
		msg.sender.transfer(msg.value-cost);
		
		if(oracle_adr.balance<min_balance)
		    oracle_adr.transfer(GETFEE674());
		else
		    owner.transfer(GETFEE674()/2);
		    
		lastTradedPrice = base_price;
		    
		emit TRANSFER747(address(this), msg.sender, tokens);
		emit BUYEVENT16(tokens);
	}
	
	function SELL515(uint tokens)public{	//inject NONSTANDARD NAMING
	    uint result = GETSELLRETURN755(tokens);
	    require(balances[msg.sender]>=tokens);
		require(address(this).balance>result);
		
		balances[address(this)]+=tokens;
		balances[msg.sender]-=tokens;
		msg.sender.transfer(result);
		if(oracle_adr.balance<min_balance)
		    oracle_adr.transfer(GETFEE674());
		else
		    owner.transfer(GETFEE674()/2);
		    
		lastTradedPrice = base_price;
		    
		emit TRANSFER747(msg.sender, address(this), tokens);
		emit SELLEVENT762(tokens);
	}
	
	function FORSALE849(uint tokens)public{	//inject NONSTANDARD NAMING
		require(msg.sender==owner);
		allowed[owner][address(0)] = tokens;
		emit APPROVAL772(owner, address(0), tokens);
	}
	
	function GET_TRADABLE718() public view returns (uint tradable){	//inject NONSTANDARD NAMING
		return balances[address(this)];
	}
	
	function SETPRICE211(uint newPrice) public{	//inject NONSTANDARD NAMING
		require(msg.sender==oracle_adr);
		base_price = newPrice;
	}
	
	function SETFEEPARAMS125(uint new_min_fee, uint new_fee_div, uint new_min_bal) public{	//inject NONSTANDARD NAMING
	    require(msg.sender==owner);
	    min_fee = new_min_fee;
	    min_balance = new_min_bal;
	    fee_div = new_fee_div;
	}
	
	function SETORACLEADDRESS586(address payable adr) public {	//inject NONSTANDARD NAMING
	    oracle_adr = adr;
	}
}