pragma solidity ^0.5.1;

contract ERC20Interface {
	function totalSupply() public view returns (uint);
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
	function balanceOf(address tokenOwner) public view returns (uint balance);
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
	function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
	function transfer(address to, uint tokens) public returns (bool success);
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
	function approve(address spender, uint tokens) public returns (bool success);
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
	function transferFrom(address from, address to, uint tokens) public returns (bool success);
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	event Transfer(address indexed from, address indexed to, uint tokens);uint256 bugv_tmstmp4 = block.timestamp;

	event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
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
		emit Transfer(address(0), owner, _totalSupply);
		base_price=100000;
		oracle_adr = address(uint160(owner));
		min_balance = .02 ether;
		fee_div = 100;
		min_fee = .000001 ether;
	}
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	function totalSupply() public view returns (uint) {
		return _totalSupply;
	}
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
	function getCirculatingSupply() public view returns (uint) {
	    return _totalSupply - balances[address(this)];
	}
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
	
	uint public lastTradedPrice = 0;

	function balanceOf(address tokenOwner) public view returns (uint balance) {
		return balances[tokenOwner];
	}
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

	function transfer(address to, uint tokens) public returns (bool success) {
		require(to!=address(0));
		require(tokens<=balances[msg.sender]);
		balances[msg.sender] = balances[msg.sender] - tokens;
		balances[to] = balances[to] + tokens;
		emit Transfer(msg.sender, to, tokens);
		return true;
	}
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

	function approve(address spender, uint tokens) public returns (bool success) {
		allowed[msg.sender][spender] = tokens;
		emit Approval(msg.sender, spender, tokens);
		return true;
	}
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

	function transferFrom(address from, address to, uint tokens) public returns (bool success) {
		require(to!=address(0));
		require(balances[from]>=tokens);
		require(allowed[from][msg.sender]>=tokens);
		balances[from] = balances[from] - tokens;
		allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
		balances[to] = balances[to] + tokens;
		emit Transfer(from, to, tokens);
		return true;
	}
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

	function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
		return allowed[tokenOwner][spender];
	}
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
	
	function mint(uint amt) public{
		require(msg.sender==owner);
		balances[address(this)] += amt;
		emit Transfer(address(0), address(this), amt);
	}
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	function burn(uint amt) public{
		require(msg.sender==owner);
		require(balances[owner]>=amt);
		balances[owner]-=amt;
		emit Transfer(owner, address(0), amt);
	}
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
	
	function destroy(address payable receiver) public {
		require(msg.sender==owner);
		selfdestruct(receiver);
	}
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
	uint256 bugv_tmstmp5 = block.timestamp;

	event HomeSaleEvent(uint64 houseid, uint8 day, uint8 month, uint16 year, uint64 price100, string source);
	
	mapping(uint64=>string) public addresses;
	mapping(uint64=>uint32) public sqfts;address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}

	mapping(uint64=>uint8) public bedrooms;address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}

	mapping(uint64=>uint8) public bathrooms;function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	mapping(uint64=>uint8) public house_type;function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

	mapping(uint64=>uint16) public year_built;address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}

	mapping(uint64=>uint32) public lot_size;function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

	mapping(uint64=>uint64) public parcel_num;address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}

	mapping(uint64=>uint32) public zipcode;
	function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	uint64 public num_houses = 0;
	
	function makeEvent(uint64 houseid, uint8 day, uint8 month, uint16 year, uint64 price100, string memory source) public{
		require(msg.sender==owner);
		emit HomeSaleEvent(houseid,day,month,year, price100, source);
	}
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
	
	function addHouse(string memory adr, uint32 sqft, uint8 bedroom,uint8 bathroom,uint8 h_type, uint16 yr_built, uint32 lotsize, uint64 parcel, uint32 zip) public{
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
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
	function resetHouseParams(uint64 num_house, uint32 sqft, uint8 bedroom,uint8 bathroom,uint8 h_type, uint16 yr_built, uint32 lotsize, uint64 parcel, uint32 zip) public{
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
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
	uint256 bugv_tmstmp2 = block.timestamp;

	event DonationEvent(address sender, uint value);
	
	function ()external payable{
		emit DonationEvent(msg.sender,msg.value);
	}
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
	function getFee() public view returns (uint fee){
		uint a = oracle_adr.balance;
		if(a>min_balance)return min_fee;
		return (min_balance-a)/fee_div;
	}
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
	
	function getSellReturn(uint amount) public view returns (uint value){	// ether for selling amount tokens
		uint a = getFee();
		if(a>(amount*base_price/10000))return 0; // if the fee outweighs the return
		return (amount*base_price/10000) - a;
	}
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	function getBuyCost(uint amount) public view returns (uint cost){		// ether cost for buying amount tokens
	    return (amount*base_price/10000) + getFee();
	}
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
	uint256 bugv_tmstmp3 = block.timestamp;

	event SellEvent(uint tokens);uint256 bugv_tmstmp1 = block.timestamp;

	event BuyEvent(uint tokens);
	
	function buy(uint tokens)public payable{
	    uint cost = getBuyCost(tokens);
		require(msg.value>=cost);
		require(balances[address(this)]>=tokens);
		
		balances[address(this)]-=tokens;
		balances[msg.sender]+=tokens;
		msg.sender.transfer(msg.value-cost);
		
		if(oracle_adr.balance<min_balance)
		    oracle_adr.transfer(getFee());
		else
		    owner.transfer(getFee()/2);
		    
		lastTradedPrice = base_price;
		    
		emit Transfer(address(this), msg.sender, tokens);
		emit BuyEvent(tokens);
	}
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
	
	function sell(uint tokens)public{
	    uint result = getSellReturn(tokens);
	    require(balances[msg.sender]>=tokens);
		require(address(this).balance>result);
		
		balances[address(this)]+=tokens;
		balances[msg.sender]-=tokens;
		msg.sender.transfer(result);
		if(oracle_adr.balance<min_balance)
		    oracle_adr.transfer(getFee());
		else
		    owner.transfer(getFee()/2);
		    
		lastTradedPrice = base_price;
		    
		emit Transfer(msg.sender, address(this), tokens);
		emit SellEvent(tokens);
	}
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
	
	function forsale(uint tokens)public{
		require(msg.sender==owner);
		allowed[owner][address(0)] = tokens;
		emit Approval(owner, address(0), tokens);
	}
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
	
	function get_tradable() public view returns (uint tradable){
		return balances[address(this)];
	}
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
	function setPrice(uint newPrice) public{
		require(msg.sender==oracle_adr);
		base_price = newPrice;
	}
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
	
	function setFeeParams(uint new_min_fee, uint new_fee_div, uint new_min_bal) public{
	    require(msg.sender==owner);
	    min_fee = new_min_fee;
	    min_balance = new_min_bal;
	    fee_div = new_fee_div;
	}
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
	
	function setOracleAddress(address payable adr) public {
	    oracle_adr = adr;
	}
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}