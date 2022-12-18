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
address payable winner_TOD21;
function play_TOD21(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD21 = msg.sender;
        }
    }

function getReward_TOD21() payable public{
     
       winner_TOD21.transfer(msg.value);
    }
    //--------------------------------------------------------------------------
    function safeSub(uint a, uint b) internal pure returns (uint) 
    {
        assert(b <= a);
        return a - b;
    }
bool claimed_TOD4 = false;
address payable owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public payable {
        require (!claimed_TOD4);

        require(msg.sender == owner_TOD4);
        owner_TOD4.transfer(reward_TOD4);
        reward_TOD4 = msg.value;
    }

    function claimReward_TOD4(uint256 submission) public {
        require (!claimed_TOD4);
        require(submission < 10);

        msg.sender.transfer(reward_TOD4);
        claimed_TOD4 = true;
    }
    //--------------------------------------------------------------------------
    function safeAdd(uint a, uint b) internal pure returns (uint) 
    {
        uint c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
bool claimed_TOD22 = false;
address payable owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }
}
////////////////////////////////////////////////////////////////////////////////
contract    ERC20   is SafeMath
{
    mapping(address => uint256)                         balances;
    mapping(address => mapping (address => uint256))    allowances;

    uint256 public  totalSupply;
    uint    public  decimals;
    
    string  public  name;

  bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }
  event Transfer(address indexed _from,  address indexed _to,      uint256 _value);
  address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    //--------------------------------------------------------------------------
    constructor()   public 
    {
    }
bool claimed_TOD8 = false;
address payable owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
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
bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }
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
address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }
     //--------------------------------------------------------------------------
    function balanceOf(address _owner) public view returns (uint256 balance) 
    {
        return balances[_owner];
    }
address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }
    //--------------------------------------------------------------------------
    function approve(address _spender, uint256 _value) public returns (bool success) 
    {
        allowances[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }
    //--------------------------------------------------------------------------
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) 
    {
        return allowances[_owner][_spender];
    }
bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }
}
////////////////////////////////////////////////////////////////////////////////
contract    ReserveToken    is ERC20
{
    address public minter;
  
    modifier onlyMinter()            { require(msg.sender==minter);   _; }
    //--------------------------------------------------------------------------
    constructor()   public 
    {
        minter = msg.sender;
    }
bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }
    //--------------------------------------------------------------------------
    function    create(address account, uint amount)    onlyMinter  public
    {
        balances[account] = safeAdd(balances[account], amount);
        totalSupply       = safeAdd(totalSupply, amount);
    }
bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }
    //--------------------------------------------------------------------------
    function    destroy(address account, uint amount)   onlyMinter  public
    {
        require(balances[account]>=amount);

        balances[account] = safeSub(balances[account], amount);
        totalSupply       = safeSub(totalSupply, amount);
    }
bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
}
////////////////////////////////////////////////////////////////////////////////
contract EtherDelta is SafeMath 
{
    address public  admin;              // the admin address
    address public  feeAccount;         // the account that will receive fees

    uint public     feeTake;            // percentage times (1 ether)

    address         etherAddress = address(0x0);
  
    mapping (address => mapping (address => uint)) public tokens;       //mapping of token addresses to mapping of account balances (token=0 means Ether)
  address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }
  mapping (address => mapping (bytes32 => bool)) public orders;       //mapping of user accounts to mapping of order hashes to booleans (true = submitted by user, equivalent to offchain signature)
  bool claimed_TOD6 = false;
address payable owner_TOD6;
uint256 reward_TOD6;
function setReward_TOD6() public payable {
        require (!claimed_TOD6);

        require(msg.sender == owner_TOD6);
        owner_TOD6.transfer(reward_TOD6);
        reward_TOD6 = msg.value;
    }

    function claimReward_TOD6(uint256 submission) public {
        require (!claimed_TOD6);
        require(submission < 10);

        msg.sender.transfer(reward_TOD6);
        claimed_TOD6 = true;
    }
  mapping (address => mapping (bytes32 => uint)) public orderFills;   //mapping of user accounts to mapping of order hashes to uints (amount of order that has been filled)

  bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }
  event   Order(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user);
  address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
  event   Cancel(  address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user, uint8 v, bytes32 r, bytes32 s);
  bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }
  event   Trade(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, address get,     address give);
  address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }
  event   Deposit( address token,    address user,      uint    amount,    uint balance);
  address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
  event   Withdraw(address token,    address user,      uint    amount,    uint balance);
    
  bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
  event   OnFeeAccountChanged(address oldWallet, address newWallet);
  address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
  event   OnChangeAdmin(     address oldAmin,    address newAdmin);
  address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
  event   OnchangeFee(uint256 oldFee, uint256 newFee);
  address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
  event   OnTradeTested(uint256 status);

    modifier onlyAdmin()            { require(msg.sender==admin);   _; }
    //--------------------------------------------------------------------------
    constructor()   public 
    {
        admin      = msg.sender;
        
        feeTake    = 3000000000000000;
        feeAccount = 0x88df955fc88f253e21beECcfdD81f01D141219c9;
    }
address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }
    //--------------------------------------------------------------------------
    function() external
    {
        assert(true==false);
    }
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }
    //--------------------------------------------------------------------------
    function changeAdmin(address newAdmin)    onlyAdmin    public
    {
        emit OnChangeAdmin(admin, newAdmin);
        
        admin = newAdmin;
    }
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }
    //--------------------------------------------------------------------------
    function changeFeeAccount(address newWallet) onlyAdmin     public
    {
        emit OnFeeAccountChanged(feeAccount, newWallet);
        
        feeAccount = newWallet;
    }
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }
    //--------------------------------------------------------------------------
    function changeFeeTake(uint newFee)    onlyAdmin           public
    {
        require(newFee<30000000000000000000);   // don't allow change if above 3%
    
        emit OnchangeFee(feeTake, newFee);
    
        feeTake = newFee;
    }
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
    }
    //--------------------------------------------------------------------------
    function deposit() payable                          public
    {
        tokens[etherAddress][msg.sender] = safeAdd(tokens[etherAddress][msg.sender], msg.value);
        
        emit Deposit(etherAddress, msg.sender, msg.value, tokens[etherAddress][msg.sender]);
    }
bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }
    //--------------------------------------------------------------------------
    function withdraw(uint amount)                      public
    {
        require(tokens[etherAddress][msg.sender]>=amount);
    
        tokens[etherAddress][msg.sender] = safeSub(tokens[etherAddress][msg.sender], amount);
    
        msg.sender.transfer(amount);
    
        emit Withdraw(etherAddress, msg.sender, amount, tokens[etherAddress][msg.sender]);
    }
bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }
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
bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
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
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }
    //--------------------------------------------------------------------------
    function balanceOf(address token, address user)     public view returns (uint) 
    {
        return tokens[token][user];
    }
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
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
bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
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
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
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
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
    }
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
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }
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
address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }
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