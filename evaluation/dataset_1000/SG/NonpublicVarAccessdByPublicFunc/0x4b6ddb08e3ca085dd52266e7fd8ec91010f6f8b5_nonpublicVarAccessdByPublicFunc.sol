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
    //--------------------------------------------------------------------------
    function safeSub(uint a, uint b) internal pure returns (uint) 
    {
        assert(b <= a);
        return a - b;
    }
    //--------------------------------------------------------------------------
    function safeAdd(uint a, uint b) internal pure returns (uint) 
    {
        uint c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
}
////////////////////////////////////////////////////////////////////////////////
contract    ERC20   is SafeMath
{
    mapping(address => uint256)                         balances;
    mapping(address => mapping (address => uint256))    allowances;

    uint256 internal  totalSupply;
    uint    public  decimals;
    
    string  public  name;

    event Transfer(address indexed _from,  address indexed _to,      uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    //--------------------------------------------------------------------------
    constructor()   public 
    {
    }
    //--------------------------------------------------------------------------
    function        transfer(address toAddr, uint256 amountInWei)  public   returns (bool)
    {
        uint256         baseAmount;
        uint256         finalAmount;

        require(toAddr!=address(0x0) && toAddr!=msg.sender 
                                     && amountInWei!=0
                                     && amountInWei<=balances[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        //-----

        baseAmount  = balances[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        finalAmount = baseAmount - amountInWei;
        
        assert(finalAmount <= baseAmount);
        
        balances[msg.sender] = finalAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        //-----
       
        baseAmount  = balances[toAddr];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        finalAmount = baseAmount + amountInWei;

        assert(finalAmount >= baseAmount);
        
        balances[toAddr] = finalAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Transfer(msg.sender, toAddr, amountInWei);

        return true;
    }
    //--------------------------------------------------------------------------
    function transferFrom(address fromAddr, address toAddr, uint256 amountInWei)  public  returns (bool) 
    {
        require(amountInWei!=0                                   &&
                balances[fromAddr]               >= amountInWei  &&	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                allowances[fromAddr][msg.sender] >= amountInWei);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

                //-----

        uint256 baseAmount  = balances[fromAddr];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint256 finalAmount = baseAmount - amountInWei;
        
        assert(finalAmount <= baseAmount);
        
        balances[fromAddr] = finalAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
                //-----
                
        baseAmount  = balances[toAddr];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        finalAmount = baseAmount + amountInWei;
        
        assert(finalAmount >= baseAmount);
        
        balances[toAddr] = finalAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
                //-----
                
        baseAmount  = allowances[fromAddr][msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        finalAmount = baseAmount - amountInWei;
        
        assert(finalAmount <= baseAmount);
        
        allowances[fromAddr][msg.sender] = finalAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //-----           
        
        emit Transfer(fromAddr, toAddr, amountInWei);
        return true;
    }
     //--------------------------------------------------------------------------
    function balanceOf(address _owner) public view returns (uint256 balance) 
    {
        return balances[_owner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    //--------------------------------------------------------------------------
    function approve(address _spender, uint256 _value) public returns (bool success) 
    {
        allowances[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    //--------------------------------------------------------------------------
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) 
    {
        return allowances[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
    //--------------------------------------------------------------------------
    function    create(address account, uint amount)    onlyMinter  public
    {
        balances[account] = safeAdd(balances[account], amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply       = safeAdd(totalSupply, amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    //--------------------------------------------------------------------------
    function    destroy(address account, uint amount)   onlyMinter  public
    {
        require(balances[account]>=amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        balances[account] = safeSub(balances[account], amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply       = safeSub(totalSupply, amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}
////////////////////////////////////////////////////////////////////////////////
contract EtherDelta is SafeMath 
{
    address internal  admin;              // the admin address
    address internal  feeAccount;         // the account that will receive fees

    uint internal     feeTake;            // percentage times (1 ether)

    address         etherAddress = address(0x0);
  
    mapping (address => mapping (address => uint)) internal tokens;       //mapping of token addresses to mapping of account balances (token=0 means Ether)
    mapping (address => mapping (bytes32 => bool)) internal orders;       //mapping of user accounts to mapping of order hashes to booleans (true = submitted by user, equivalent to offchain signature)
    mapping (address => mapping (bytes32 => uint)) internal orderFills;   //mapping of user accounts to mapping of order hashes to uints (amount of order that has been filled)

    event   Order(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user);
    event   Cancel(  address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user, uint8 v, bytes32 r, bytes32 s);
    event   Trade(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, address get,     address give);
    event   Deposit( address token,    address user,      uint    amount,    uint balance);
    event   Withdraw(address token,    address user,      uint    amount,    uint balance);
    
    event   OnFeeAccountChanged(address oldWallet, address newWallet);
    event   OnChangeAdmin(     address oldAmin,    address newAdmin);
    event   OnchangeFee(uint256 oldFee, uint256 newFee);
    event   OnTradeTested(uint256 status);

    modifier onlyAdmin()            { require(msg.sender==admin);   _; }
    //--------------------------------------------------------------------------
    constructor()   public 
    {
        admin      = msg.sender;
        
        feeTake    = 3000000000000000;
        feeAccount = 0x88df955fc88f253e21beECcfdD81f01D141219c9;
    }
    //--------------------------------------------------------------------------
    function() external
    {
        assert(true==false);
    }
    //--------------------------------------------------------------------------
    function changeAdmin(address newAdmin)    onlyAdmin    public
    {
        emit OnChangeAdmin(admin, newAdmin);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        admin = newAdmin;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    //--------------------------------------------------------------------------
    function changeFeeAccount(address newWallet) onlyAdmin     public
    {
        emit OnFeeAccountChanged(feeAccount, newWallet);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        feeAccount = newWallet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    //--------------------------------------------------------------------------
    function changeFeeTake(uint newFee)    onlyAdmin           public
    {
        require(newFee<30000000000000000000);   // don't allow change if above 3%
    
        emit OnchangeFee(feeTake, newFee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
        feeTake = newFee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    //--------------------------------------------------------------------------
    function deposit() payable                          public
    {
        tokens[etherAddress][msg.sender] = safeAdd(tokens[etherAddress][msg.sender], msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Deposit(etherAddress, msg.sender, msg.value, tokens[etherAddress][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    //--------------------------------------------------------------------------
    function withdraw(uint amount)                      public
    {
        require(tokens[etherAddress][msg.sender]>=amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
        tokens[etherAddress][msg.sender] = safeSub(tokens[etherAddress][msg.sender], amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
        msg.sender.transfer(amount);
    
        emit Withdraw(etherAddress, msg.sender, amount, tokens[etherAddress][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
        
        tokens[token][msg.sender] = safeAdd(tokens[token][msg.sender], amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Deposit(token, msg.sender, amount, tokens[token][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    //--------------------------------------------------------------------------
    function withdrawToken(address token, uint amount)  public
    {
        require(token!=address(0x0));
        
        if (tokens[token][msg.sender] < amount)     assert(true==false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        tokens[token][msg.sender] = safeSub(tokens[token][msg.sender], amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
        if (!ERC20(token).transfer(msg.sender, amount)) assert(true==false);
    
        emit Withdraw(token, msg.sender, amount, tokens[token][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    //--------------------------------------------------------------------------
    function balanceOf(address token, address user)     public view returns (uint) 
    {
        return tokens[token][user];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
    //--------------------------------------------------------------------------
    function    order(  address tokenGet, 
                        uint    amountGet,  
                        address tokenGive, 
                        uint    amountGive, 
                        uint    expires, 
                        uint    nonce)     public 
    {
        bytes32 hash = generateHash(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);
    
        orders[msg.sender][hash] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
        emit Order(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, msg.sender);
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
            (orders[user][hash]                                                                             ||	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
             ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)),v,r,s)==user
            )                                                                                               &&
             block.number <= expires                                                                        &&
             safeAdd(orderFills[user][hash], amount) <= amountGet	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        );

        tradeBalances(tokenGet, amountGet, tokenGive, amountGive, user, amount);
        
        orderFills[user][hash] = safeAdd(orderFills[user][hash], amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
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
        if (!(tokens[tokenGet][sender] >= amount &&	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            availableVolume(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, user, v, r, s) >= amount)) 
        {
            emit OnTradeTested(0);
            return false;
        }

        emit OnTradeTested(1);
        return true;
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
            (orders[user][hash]                                                                             ||	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
             ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)),v,r,s)==user)  &&
             block.number <= expires
        ))
        {
            return 0;
        }

        uint available1 = safeSub(amountGet, orderFills[user][hash]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint available2 = safeMul(tokens[tokenGive][user], amountGet) / amountGive;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
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
        
        return orderFills[user][hash];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
             orders[msg.sender][hash]     ||	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
             ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)),v,r,s)==msg.sender
        );

        orderFills[msg.sender][hash] = amountGet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
        emit Cancel(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, msg.sender, v, r, s);
    }
}