pragma solidity "0.5.1";

                                                                                                              
// ----------------------------------------------------------------------------
// 'eden.best' token contract
//
// Symbol      : EDE
// Name        : eden.best
// Total supply: 450000000
// Decimals    : 0
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
library SafeMath {
    function ADD653(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SUB696(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a);
        c = a - b;
    }
    function MUL840(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function DIV204(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

    event OWNERSHIPTRANSFERRED134(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

    modifier ONLYOWNER959 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP822(address _newOwner) public ONLYOWNER959 {	//inject NONSTANDARD NAMING
        newOwner = _newOwner;
    }
    function ACCEPTOWNERSHIP225() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner);
        emit OWNERSHIPTRANSFERRED134(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function TOTALSUPPLY778() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF305(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE269(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER448(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE565(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM545(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    event TRANSFER941(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL931(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and assisted
// token transfers
// ----------------------------------------------------------------------------
contract EDE is ERC20Interface, Owned {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;
    uint private _teamsTokens;
    uint private _reserveTokens;
    uint256 public fundsRaised;
    uint private maximumCap;
    address payable wallet;
    address [] holders;

    uint256 private presaleopeningtime;
    uint256 private firstsaleopeningtime;
    uint256 private secondsaleopeningtime;
    uint256 private secondsaleclosingtime;

	string public HardCap;
	string public SoftCap;


    mapping(address => uint) balances;
    mapping(address => bool) whitelist;
    mapping(address => mapping(address => uint)) allowed;

    event TOKENPURCHASE811(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);	//inject NONSTANDARD NAMING

    modifier ONLYWHILEOPEN419 {	//inject NONSTANDARD NAMING
        require((now >= presaleopeningtime && now <= secondsaleclosingtime) && fundsRaised != maximumCap); // should be open
        _;
    }

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor() public {
        symbol = "EDE";
        name = "eden.best";
        decimals = 0;
        _totalSupply = 45e7;
        balances[address(this)] = 3375e5 * 10**uint(decimals); // 75% to ICO
        emit TRANSFER941(address(0),address(this), 3375e5 * 10**uint(decimals));
        balances[address(0x687abe81c44c982394EED1b0Fc6911e5338A6421)] = 66150000 * 10**uint(decimals); // 14,7% to reserve
        emit TRANSFER941(address(0),address(0x687abe81c44c982394EED1b0Fc6911e5338A6421), 66150000 * 10**uint(decimals));
        balances[address(0xd903846cF43aC9046CAE50C36ac1Aa18e630A1bB)] = 45000000 * 10**uint(decimals); // 10% to Team
        emit TRANSFER941(address(0),address(0xd903846cF43aC9046CAE50C36ac1Aa18e630A1bB), 45000000 * 10**uint(decimals));
        balances[address(0x7341459eCdABC42C7493D923F5bb0992616d30A7)] = 1350000 * 10**uint(decimals); // 0,3% to airdrop
        emit TRANSFER941(address(0),address(0x7341459eCdABC42C7493D923F5bb0992616d30A7), 1350000 * 10**uint(decimals));
        owner = address(0xEfA2CcE041aEB143678F8f310F3977F3EB61251E);
        wallet = address(0xEfA2CcE041aEB143678F8f310F3977F3EB61251E);
		    HardCap = "16875 ETH";
        SoftCap = "300 ETH";
        maximumCap = 16875000000000000000000; // 16875 eth, written in wei here
        presaleopeningtime = 1554120000; // 1st april 2019, 12pm
        firstsaleopeningtime = 1555329601; // 15 april 2019, 12:00:01pm
        secondsaleopeningtime = 1559304001; // 31 may 2019, 12:00:01pm
        secondsaleclosingtime = 1561896001; // 30 june 2019, 12:00:01pm
    }

    // ------------------------------------------------------------------------
    // Accepts ETH
    // ------------------------------------------------------------------------
    function () external payable {
        BUYTOKENS10(msg.sender);
    }

    function BUYTOKENS10(address _beneficiary) public payable ONLYWHILEOPEN419 {	//inject NONSTANDARD NAMING
        _PREVALIDATEPURCHASE642(_beneficiary, msg.value);
        _CONTINUETOKENPURCHASE702(_beneficiary, msg.value);
    }

    function _PREVALIDATEPURCHASE642(address _beneficiary, uint256 _weiAmount) internal view{	//inject NONSTANDARD NAMING
        require(_beneficiary != address(0));
        require(_weiAmount != 0);
        require(_weiAmount >= 50000000000000000 && _weiAmount <= 1000000000000000000000); // min 0.05 ETH, max 1000 ETH
        require(whitelist[_beneficiary]);
    }

    function _INSERTWHITELIST169(address[] memory _beneficiary) public ONLYOWNER959{	//inject NONSTANDARD NAMING
        for(uint256 i = 0; i< _beneficiary.length; i++)
        {
            if(whitelist[_beneficiary[i]] == false)
                whitelist[_beneficiary[i]] = true;
        }
    }

    function _CONTINUETOKENPURCHASE702(address _beneficiary, uint256 _weiAmount) internal{	//inject NONSTANDARD NAMING
        uint256 _tokens = _GETTOKENAMOUNT702(_weiAmount).DIV204(1e18);
        uint256 bonus = _CALCULATEBONUS936();
        _tokens = _tokens.ADD653((_tokens.MUL840(bonus.MUL840(100))).DIV204(10000));

        fundsRaised = fundsRaised.ADD653(_weiAmount);

        _PROCESSPURCHASE78(_beneficiary, _tokens);

        wallet.transfer(_weiAmount);
        emit TOKENPURCHASE811(address(this), _beneficiary, _weiAmount, _tokens);
    }

    function _GETTOKENAMOUNT702(uint256 _weiAmount) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 rate = 2e4; // 1 eth = 20,000T
        return _weiAmount.MUL840(rate);
    }

    function _CALCULATEBONUS936() internal view returns (uint256){	//inject NONSTANDARD NAMING
        if(now >= presaleopeningtime && now < firstsaleopeningtime){
            return 30;
        } else if(now >=firstsaleopeningtime && now <secondsaleopeningtime){
            return 20;
        } else if(now >= secondsaleopeningtime && now <secondsaleclosingtime){
            return 0;
        }
    }

    function _PROCESSPURCHASE78(address _beneficiary, uint256 _tokenAmount) internal {	//inject NONSTANDARD NAMING
        _DELIVERTOKENS481(_beneficiary, _tokenAmount);
    }

    function _DELIVERTOKENS481(address _beneficiary, uint256 _tokenAmount) internal {	//inject NONSTANDARD NAMING
        _TRANSFER550(_beneficiary, _tokenAmount);
    }

                                                                   

    function TOTALSUPPLY778() public view returns (uint){	//inject NONSTANDARD NAMING
       return _totalSupply* 10**uint(decimals);
    }
    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function BALANCEOF305(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[tokenOwner];
    }

    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function TRANSFER448(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        // prevent transfer to 0x0, use burn instead
        require(to != address(0));
        require(whitelist[to]);
        require(balances[msg.sender] >= tokens );
        require(balances[to] + tokens >= balances[to]);
        balances[msg.sender] = balances[msg.sender].SUB696(tokens);
        if(balances[to] == 0)
            holders.push(to);
        balances[to] = balances[to].ADD653(tokens);
        emit TRANSFER941(msg.sender,to,tokens);
        return true;
    }

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    // ------------------------------------------------------------------------
    function APPROVE565(address spender, uint tokens) public returns (bool success){	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL931(msg.sender,spender,tokens);
        return true;
    }

    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function TRANSFERFROM545(address from, address to, uint tokens) public returns (bool success){	//inject NONSTANDARD NAMING
        require(tokens <= allowed[from][msg.sender]); //check allowance
        require(balances[from] >= tokens);
        require(whitelist[to]);
        balances[from] = balances[from].SUB696(tokens);
        if(balances[to] == 0)
            holders.push(to);
        balances[to] = balances[to].ADD653(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].SUB696(tokens);
        emit TRANSFER941(from,to,tokens);
        return true;
    }
    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function ALLOWANCE269(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[tokenOwner][spender];
    }

    function _TRANSFER550(address to, uint tokens) internal returns (bool success) {	//inject NONSTANDARD NAMING
        // prevent transfer to 0x0, use burn instead
        require(to != address(0));
        require(balances[address(this)] >= tokens );
        require(balances[to] + tokens >= balances[to]);
        balances[address(this)] = balances[address(this)].SUB696(tokens);
        if(balances[to] == 0)
            holders.push(to);
        balances[to] = balances[to].ADD653(tokens);
        emit TRANSFER941(address(this),to,tokens);
        return true;
    }

    function _HARDCAPNOTREACHED171() external ONLYOWNER959 {	//inject NONSTANDARD NAMING
        uint eightyPercent = (balances[address(this)].MUL840(80)).DIV204(100); // 80% of remaining tokens
        uint twentyPercent = balances[address(this)].SUB696(eightyPercent); // 20% of remaining tokens
        uint share = eightyPercent.DIV204(holders.length);

        for(uint i = 0; i<holders.length; i++ ){
            address holder = holders[i];
            balances[holder] = balances[holder].ADD653(share);
            emit TRANSFER941(address(this),holder,share);
        }

        balances[address(0x687abe81c44c982394EED1b0Fc6911e5338A6421)] = twentyPercent;
        emit TRANSFER941(address(this),address(0x687abe81c44c982394EED1b0Fc6911e5338A6421),twentyPercent);

        balances[address(this)] = 0;



    }
}