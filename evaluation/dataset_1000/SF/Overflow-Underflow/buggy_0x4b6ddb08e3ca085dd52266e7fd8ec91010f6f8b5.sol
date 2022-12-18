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
mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
    //--------------------------------------------------------------------------
    function safeSub(uint a, uint b) internal pure returns (uint) 
    {
        assert(b <= a);
        return a - b;
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
    //--------------------------------------------------------------------------
    function safeAdd(uint a, uint b) internal pure returns (uint) 
    {
        uint c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
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

  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
  event Transfer(address indexed _from,  address indexed _to,      uint256 _value);
  mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    //--------------------------------------------------------------------------
    constructor()   public 
    {
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
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
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
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
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
     //--------------------------------------------------------------------------
    function balanceOf(address _owner) public view returns (uint256 balance) 
    {
        return balances[_owner];
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    //--------------------------------------------------------------------------
    function approve(address _spender, uint256 _value) public returns (bool success) 
    {
        allowances[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    //--------------------------------------------------------------------------
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) 
    {
        return allowances[_owner][_spender];
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
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
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
    //--------------------------------------------------------------------------
    function    create(address account, uint amount)    onlyMinter  public
    {
        balances[account] = safeAdd(balances[account], amount);
        totalSupply       = safeAdd(totalSupply, amount);
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
    //--------------------------------------------------------------------------
    function    destroy(address account, uint amount)   onlyMinter  public
    {
        require(balances[account]>=amount);

        balances[account] = safeSub(balances[account], amount);
        totalSupply       = safeSub(totalSupply, amount);
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
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
  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => mapping (bytes32 => bool)) public orders;       //mapping of user accounts to mapping of order hashes to booleans (true = submitted by user, equivalent to offchain signature)
  mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }
  mapping (address => mapping (bytes32 => uint)) public orderFills;   //mapping of user accounts to mapping of order hashes to uints (amount of order that has been filled)

  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  event   Order(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user);
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event   Cancel(  address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user, uint8 v, bytes32 r, bytes32 s);
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
  event   Trade(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, address get,     address give);
  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event   Deposit( address token,    address user,      uint    amount,    uint balance);
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event   Withdraw(address token,    address user,      uint    amount,    uint balance);
    
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event   OnFeeAccountChanged(address oldWallet, address newWallet);
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event   OnChangeAdmin(     address oldAmin,    address newAdmin);
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event   OnchangeFee(uint256 oldFee, uint256 newFee);
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
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
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
    //--------------------------------------------------------------------------
    function() external
    {
        assert(true==false);
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
    //--------------------------------------------------------------------------
    function changeAdmin(address newAdmin)    onlyAdmin    public
    {
        emit OnChangeAdmin(admin, newAdmin);
        
        admin = newAdmin;
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
    //--------------------------------------------------------------------------
    function changeFeeAccount(address newWallet) onlyAdmin     public
    {
        emit OnFeeAccountChanged(feeAccount, newWallet);
        
        feeAccount = newWallet;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    //--------------------------------------------------------------------------
    function changeFeeTake(uint newFee)    onlyAdmin           public
    {
        require(newFee<30000000000000000000);   // don't allow change if above 3%
    
        emit OnchangeFee(feeTake, newFee);
    
        feeTake = newFee;
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
    //--------------------------------------------------------------------------
    function deposit() payable                          public
    {
        tokens[etherAddress][msg.sender] = safeAdd(tokens[etherAddress][msg.sender], msg.value);
        
        emit Deposit(etherAddress, msg.sender, msg.value, tokens[etherAddress][msg.sender]);
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
    //--------------------------------------------------------------------------
    function withdraw(uint amount)                      public
    {
        require(tokens[etherAddress][msg.sender]>=amount);
    
        tokens[etherAddress][msg.sender] = safeSub(tokens[etherAddress][msg.sender], amount);
    
        msg.sender.transfer(amount);
    
        emit Withdraw(etherAddress, msg.sender, amount, tokens[etherAddress][msg.sender]);
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
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
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
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
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
    //--------------------------------------------------------------------------
    function balanceOf(address token, address user)     public view returns (uint) 
    {
        return tokens[token][user];
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
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
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
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
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
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