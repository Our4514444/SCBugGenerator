pragma solidity ^0.5.4;

////////////////////////////////////////////////////////////////////////////////
contract SafeMath 
{
    function safeMul(uint a, uint b) internal pure returns (uint) 
    {
        uint c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    //--------------------------------------------------------------------------
    function safeSub(uint a, uint b) internal pure returns (uint) 
    {
        assert(b <= a);
        return a - b;
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
    //--------------------------------------------------------------------------
    function safeAdd(uint a, uint b) internal pure returns (uint) 
    {
        uint c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
}
////////////////////////////////////////////////////////////////////////////////
contract    ERC20   is SafeMath
{
    mapping(address => uint256)                         balances;
    mapping(address => mapping (address => uint256))    allowances;

    uint256 public  totalSupply;
    uint    public  decimals;
    
    string  public  name;

  address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
  event Transfer(address indexed _from,  address indexed _to,      uint256 _value);
  function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    //--------------------------------------------------------------------------
    constructor()   public 
    {
    }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    //--------------------------------------------------------------------------
    function        transfer(address toAddr, uint256 amountInWei)  public   returns (bool)
    {
        uint256         baseAmount;
        uint256         finalAmount;

        require(toAddr!=address(0x0) && toAddr!=msg.sender 
                                     && amountInWei!=0
                                     && amountInWei<=balances[msg.sender]);
        //-----

        baseAmount  = balances[msg.sender];
        finalAmount = baseAmount - amountInWei;
        
        assert(finalAmount <= baseAmount);
        
        balances[msg.sender] = finalAmount;

        //-----
       
        baseAmount  = balances[toAddr];
        finalAmount = baseAmount + amountInWei;

        assert(finalAmount >= baseAmount);
        
        balances[toAddr] = finalAmount;
        
        emit Transfer(msg.sender, toAddr, amountInWei);

        return true;
    }
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
    //--------------------------------------------------------------------------
    function transferFrom(address fromAddr, address toAddr, uint256 amountInWei)  public  returns (bool) 
    {
        require(amountInWei!=0                                   &&
                balances[fromAddr]               >= amountInWei  &&
                allowances[fromAddr][msg.sender] >= amountInWei);

                //-----

        uint256 baseAmount  = balances[fromAddr];
        uint256 finalAmount = baseAmount - amountInWei;
        
        assert(finalAmount <= baseAmount);
        
        balances[fromAddr] = finalAmount;
        
                //-----
                
        baseAmount  = balances[toAddr];
        finalAmount = baseAmount + amountInWei;
        
        assert(finalAmount >= baseAmount);
        
        balances[toAddr] = finalAmount;
        
                //-----
                
        baseAmount  = allowances[fromAddr][msg.sender];
        finalAmount = baseAmount - amountInWei;
        
        assert(finalAmount <= baseAmount);
        
        allowances[fromAddr][msg.sender] = finalAmount;
        
        //-----           
        
        emit Transfer(fromAddr, toAddr, amountInWei);
        return true;
    }
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
     //--------------------------------------------------------------------------
    function balanceOf(address _owner) public view returns (uint256 balance) 
    {
        return balances[_owner];
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
    //--------------------------------------------------------------------------
    function approve(address _spender, uint256 _value) public returns (bool success) 
    {
        allowances[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    //--------------------------------------------------------------------------
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) 
    {
        return allowances[_owner][_spender];
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}
////////////////////////////////////////////////////////////////////////////////
contract    ReserveToken    is ERC20
{
  address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
  address public minter;
  
    modifier onlyMinter()            { require(msg.sender==minter);   _; }
    //--------------------------------------------------------------------------
    constructor()   public 
    {
        minter = msg.sender;
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
    //--------------------------------------------------------------------------
    function    create(address account, uint amount)    onlyMinter  public
    {
        balances[account] = safeAdd(balances[account], amount);
        totalSupply       = safeAdd(totalSupply, amount);
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
    //--------------------------------------------------------------------------
    function    destroy(address account, uint amount)   onlyMinter  public
    {
        require(balances[account]>=amount);

        balances[account] = safeSub(balances[account], amount);
        totalSupply       = safeSub(totalSupply, amount);
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
}
////////////////////////////////////////////////////////////////////////////////
contract EtherDelta is SafeMath 
{
  address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
  address public  admin;              // the admin address
  function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public  feeAccount;         // the account that will receive fees

  function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint public     feeTake;            // percentage times (1 ether)

    address         etherAddress = address(0x0);
  
  address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
  mapping (address => mapping (address => uint)) public tokens;       //mapping of token addresses to mapping of account balances (token=0 means Ether)
  function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (address => mapping (bytes32 => bool)) public orders;       //mapping of user accounts to mapping of order hashes to booleans (true = submitted by user, equivalent to offchain signature)
  address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}
  mapping (address => mapping (bytes32 => uint)) public orderFills;   //mapping of user accounts to mapping of order hashes to uints (amount of order that has been filled)

  address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  event   Order(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user);
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  event   Cancel(  address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user, uint8 v, bytes32 r, bytes32 s);
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event   Trade(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, address get,     address give);
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event   Deposit( address token,    address user,      uint    amount,    uint balance);
  uint256 bugv_tmstmp4 = block.timestamp;
  event   Withdraw(address token,    address user,      uint    amount,    uint balance);
    
  uint256 bugv_tmstmp5 = block.timestamp;
  event   OnFeeAccountChanged(address oldWallet, address newWallet);
  uint256 bugv_tmstmp2 = block.timestamp;
  event   OnChangeAdmin(     address oldAmin,    address newAdmin);
  uint256 bugv_tmstmp3 = block.timestamp;
  event   OnchangeFee(uint256 oldFee, uint256 newFee);
  uint256 bugv_tmstmp1 = block.timestamp;
  event   OnTradeTested(uint256 status);

    modifier onlyAdmin()            { require(msg.sender==admin);   _; }
    //--------------------------------------------------------------------------
    constructor()   public 
    {
        admin      = msg.sender;
        
        feeTake    = 3000000000000000;
        feeAccount = 0x88df955fc88f253e21beECcfdD81f01D141219c9;
    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
    //--------------------------------------------------------------------------
    function() external
    {
        assert(true==false);
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
    //--------------------------------------------------------------------------
    function changeAdmin(address newAdmin)    onlyAdmin    public
    {
        emit OnChangeAdmin(admin, newAdmin);
        
        admin = newAdmin;
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
    //--------------------------------------------------------------------------
    function changeFeeAccount(address newWallet) onlyAdmin     public
    {
        emit OnFeeAccountChanged(feeAccount, newWallet);
        
        feeAccount = newWallet;
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    //--------------------------------------------------------------------------
    function changeFeeTake(uint newFee)    onlyAdmin           public
    {
        require(newFee<30000000000000000000);   // don't allow change if above 3%
    
        emit OnchangeFee(feeTake, newFee);
    
        feeTake = newFee;
    }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
    //--------------------------------------------------------------------------
    function deposit() payable                          public
    {
        tokens[etherAddress][msg.sender] = safeAdd(tokens[etherAddress][msg.sender], msg.value);
        
        emit Deposit(etherAddress, msg.sender, msg.value, tokens[etherAddress][msg.sender]);
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
    //--------------------------------------------------------------------------
    function withdraw(uint amount)                      public
    {
        require(tokens[etherAddress][msg.sender]>=amount);
    
        tokens[etherAddress][msg.sender] = safeSub(tokens[etherAddress][msg.sender], amount);
    
        msg.sender.transfer(amount);
    
        emit Withdraw(etherAddress, msg.sender, amount, tokens[etherAddress][msg.sender]);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
    //--------------------------------------------------------------------------
    function depositToken(address token, uint amount)   public
    {
        //!!!!!!! Remember to call Token(address).approve(this, amount) 
        //!!!!!!! or this contract will not be able to do the transfer on your behalf.
        
        require(token!=address(0x0));
        
        //if (!ERC20(token).transferFrom(msg.sender, this, amount))
        if (!ERC20(token).transferFrom(msg.sender, address(this), amount)) 
        {
            assert(true==false);
        }
        
        tokens[token][msg.sender] = safeAdd(tokens[token][msg.sender], amount);
        
        emit Deposit(token, msg.sender, amount, tokens[token][msg.sender]);
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
    //--------------------------------------------------------------------------
    function withdrawToken(address token, uint amount)  public
    {
        require(token!=address(0x0));
        
        if (tokens[token][msg.sender] < amount)     assert(true==false);
        
        tokens[token][msg.sender] = safeSub(tokens[token][msg.sender], amount);
    
        if (!ERC20(token).transfer(msg.sender, amount)) assert(true==false);
    
        emit Withdraw(token, msg.sender, amount, tokens[token][msg.sender]);
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    //--------------------------------------------------------------------------
    function balanceOf(address token, address user)     public view returns (uint) 
    {
        return tokens[token][user];
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    //--------------------------------------------------------------------------
    function    generateHash(   address tokenGet, 
                                uint    amountGet,  
                                address tokenGive, 
                                uint    amountGive, 
                                uint    expires, 
                                uint    nonce)     private view returns(bytes32)
    {
        return sha256(abi.encodePacked(this, tokenGet, amountGet, tokenGive, amountGive, expires, nonce));
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
    //--------------------------------------------------------------------------
    function    order(  address tokenGet, 
                        uint    amountGet,  
                        address tokenGive, 
                        uint    amountGive, 
                        uint    expires, 
                        uint    nonce)     public 
    {
        bytes32 hash = generateHash(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);
    
        orders[msg.sender][hash] = true;
    
        emit Order(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, msg.sender);
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    //--------------------------------------------------------------------------
    function    trade(address tokenGet, uint    amountGet, 
                                        address tokenGive, 
                                        uint    amountGive, 
                                        uint    expires, 
                                        uint    nonce, 
                                        address user, 
                                        uint8   v, 
                                        bytes32 r, 
                                        bytes32 s, 
                                        uint    amount)   public
    {
        bytes32 hash = sha256(abi.encodePacked(this, tokenGet, amountGet, tokenGive, amountGive, expires, nonce));

        require
        (
            (orders[user][hash]                                                                             ||
             ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)),v,r,s)==user
            )                                                                                               &&
             block.number <= expires                                                                        &&
             safeAdd(orderFills[user][hash], amount) <= amountGet
        );

        tradeBalances(tokenGet, amountGet, tokenGive, amountGive, user, amount);
        
        orderFills[user][hash] = safeAdd(orderFills[user][hash], amount);
    
        emit Trade(tokenGet, amount, tokenGive, amountGive * amount / amountGet, user, msg.sender);
    }
    //--------------------------------------------------------------------------
    function    tradeBalances(address tokenGet, uint    amountGet, 
                                                address tokenGive, 
                                                uint    amountGive, 
                                                address user,
                                                uint    amount) private 
    {
        uint feeTakeXfer   = safeMul(amount, feeTake) / (1 ether);

        tokens[tokenGet][msg.sender]  = safeSub(tokens[tokenGet][msg.sender],  safeAdd(amount, feeTakeXfer));
        tokens[tokenGet][user]        = safeAdd(tokens[tokenGet][user],        amount);
        tokens[tokenGet][feeAccount]  = safeAdd(tokens[tokenGet][feeAccount],  feeTakeXfer);
        tokens[tokenGive][user]       = safeSub(tokens[tokenGive][user],       safeMul(amountGive, amount) / amountGet);
        tokens[tokenGive][msg.sender] = safeAdd(tokens[tokenGive][msg.sender], safeMul(amountGive, amount) / amountGet);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    //--------------------------------------------------------------------------
    function    testTrade(address tokenGet, uint amountGet, 
                                            address tokenGive, 
                                            uint amountGive, 
                                            uint expires, 
                                            uint nonce, 
                                            address user, 
                                            uint8 v, 
                                            bytes32 r, 
                                            bytes32 s, 
                                            uint amount, 
                                            address sender) public /*view*/  returns(bool) 
    {
        if (!(tokens[tokenGet][sender] >= amount &&
            availableVolume(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, user, v, r, s) >= amount)) 
        {
            emit OnTradeTested(0);
            return false;
        }

        emit OnTradeTested(1);
        return true;
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
    //--------------------------------------------------------------------------
    function    availableVolume(address tokenGet,   uint    amountGet, 
                                                    address tokenGive, 
                                                    uint    amountGive, 
                                                    uint    expires, 
                                                    uint    nonce, 
                                                    address user, 
                                                    uint8   v, 
                                                    bytes32 r, 
                                                    bytes32 s)  public  view returns(uint) 
    {
        bytes32 hash = generateHash(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);

        if
        (!(
            (orders[user][hash]                                                                             ||
             ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)),v,r,s)==user)  &&
             block.number <= expires
        ))
        {
            return 0;
        }

        uint available1 = safeSub(amountGet, orderFills[user][hash]);
        uint available2 = safeMul(tokens[tokenGive][user], amountGet) / amountGive;
        
        if (available1<available2) return available1;
        
        return available2;
    }
    //--------------------------------------------------------------------------
    function amountFilled(address tokenGet, uint    amountGet, 
                                            address tokenGive, 
                                            uint    amountGive, 
                                            uint    expires, 
                                            uint    nonce, 
                                            address user, 
                                            uint8   v, 
                                            bytes32 r, 
                                            bytes32 s) public  returns(uint) 
    {
        bytes32 hash = generateHash(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);
        
        return orderFills[user][hash];
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
    //--------------------------------------------------------------------------
    function cancelOrder(address tokenGet,  uint    amountGet, 
                                            address tokenGive, 
                                            uint    amountGive, 
                                            uint    expires, 
                                            uint    nonce, 
                                            uint8   v, 
                                            bytes32 r, 
                                            bytes32 s)  public
    {
        bytes32 hash = generateHash(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);

        require
        (
             orders[msg.sender][hash]     ||
             ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)),v,r,s)==msg.sender
        );

        orderFills[msg.sender][hash] = amountGet;
    
        emit Cancel(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, msg.sender, v, r, s);
    }
}