pragma solidity ^0.5.4;

                                                                                
contract SafeMath 
{
    function SAFEMUL415(uint a, uint b) internal pure returns (uint) 	//inject NONSTANDARD NAMING
    {
        uint c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }
    //--------------------------------------------------------------------------
    function SAFESUB949(uint a, uint b) internal pure returns (uint) 	//inject NONSTANDARD NAMING
    {
        assert(b <= a);
        return a - b;
    }
    //--------------------------------------------------------------------------
    function SAFEADD566(uint a, uint b) internal pure returns (uint) 	//inject NONSTANDARD NAMING
    {
        uint c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
}
                                                                                
contract    ERC20   is SafeMath
{
    mapping(address => uint256)                         balances;
    mapping(address => mapping (address => uint256))    allowances;

    uint256 public  totalSupply;
    uint    public  decimals;
    
    string  public  name;

    event TRANSFER284(address indexed _from,  address indexed _to,      uint256 _value);	//inject NONSTANDARD NAMING
    event APPROVAL581(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

    //--------------------------------------------------------------------------
    constructor()   public 
    {
    }
    //--------------------------------------------------------------------------
    function        TRANSFER556(address toAddr, uint256 amountInWei)  public   returns (bool)	//inject NONSTANDARD NAMING
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
        
        emit TRANSFER284(msg.sender, toAddr, amountInWei);

        return true;
    }
    //--------------------------------------------------------------------------
    function TRANSFERFROM306(address fromAddr, address toAddr, uint256 amountInWei)  public  returns (bool) 	//inject NONSTANDARD NAMING
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
        
        emit TRANSFER284(fromAddr, toAddr, amountInWei);
        return true;
    }
     //--------------------------------------------------------------------------
    function BALANCEOF297(address _owner) public view returns (uint256 balance) 	//inject NONSTANDARD NAMING
    {
        return balances[_owner];
    }
    //--------------------------------------------------------------------------
    function APPROVE369(address _spender, uint256 _value) public returns (bool success) 	//inject NONSTANDARD NAMING
    {
        allowances[msg.sender][_spender] = _value;
        
        emit APPROVAL581(msg.sender, _spender, _value);
        return true;
    }
    //--------------------------------------------------------------------------
    function ALLOWANCE336(address _owner, address _spender) public view returns (uint256 remaining) 	//inject NONSTANDARD NAMING
    {
        return allowances[_owner][_spender];
    }
}
                                                                                
contract    ReserveToken    is ERC20
{
    address public minter;
  
    modifier ONLYMINTER386()            { require(msg.sender==minter);   _; }	//inject NONSTANDARD NAMING
    //--------------------------------------------------------------------------
    constructor()   public 
    {
        minter = msg.sender;
    }
    //--------------------------------------------------------------------------
    function    CREATE766(address account, uint amount)    ONLYMINTER386  public	//inject NONSTANDARD NAMING
    {
        balances[account] = SAFEADD566(balances[account], amount);
        totalSupply       = SAFEADD566(totalSupply, amount);
    }
    //--------------------------------------------------------------------------
    function    DESTROY280(address account, uint amount)   ONLYMINTER386  public	//inject NONSTANDARD NAMING
    {
        require(balances[account]>=amount);

        balances[account] = SAFESUB949(balances[account], amount);
        totalSupply       = SAFESUB949(totalSupply, amount);
    }
}
                                                                                
contract EtherDelta is SafeMath 
{
    address public  admin;              // the admin address
    address public  feeAccount;         // the account that will receive fees

    uint public     feeTake;            // percentage times (1 ether)

    address         etherAddress = address(0x0);
  
    mapping (address => mapping (address => uint)) public tokens;       //mapping of token addresses to mapping of account balances (token=0 means Ether)
    mapping (address => mapping (bytes32 => bool)) public orders;       //mapping of user accounts to mapping of order hashes to booleans (true = submitted by user, equivalent to offchain signature)
    mapping (address => mapping (bytes32 => uint)) public orderFills;   //mapping of user accounts to mapping of order hashes to uints (amount of order that has been filled)

    event   ORDER814(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user);	//inject NONSTANDARD NAMING
    event   CANCEL527(  address tokenGet, uint    amountGet, address tokenGive, uint amountGive, uint    expires, uint    nonce, address user, uint8 v, bytes32 r, bytes32 s);	//inject NONSTANDARD NAMING
    event   TRADE181(   address tokenGet, uint    amountGet, address tokenGive, uint amountGive, address get,     address give);	//inject NONSTANDARD NAMING
    event   DEPOSIT611( address token,    address user,      uint    amount,    uint balance);	//inject NONSTANDARD NAMING
    event   WITHDRAW294(address token,    address user,      uint    amount,    uint balance);	//inject NONSTANDARD NAMING
    
    event   ONFEEACCOUNTCHANGED105(address oldWallet, address newWallet);	//inject NONSTANDARD NAMING
    event   ONCHANGEADMIN192(     address oldAmin,    address newAdmin);	//inject NONSTANDARD NAMING
    event   ONCHANGEFEE729(uint256 oldFee, uint256 newFee);	//inject NONSTANDARD NAMING
    event   ONTRADETESTED289(uint256 status);	//inject NONSTANDARD NAMING

    modifier ONLYADMIN21()            { require(msg.sender==admin);   _; }	//inject NONSTANDARD NAMING
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
    function CHANGEADMIN355(address newAdmin)    ONLYADMIN21    public	//inject NONSTANDARD NAMING
    {
        emit ONCHANGEADMIN192(admin, newAdmin);
        
        admin = newAdmin;
    }
    //--------------------------------------------------------------------------
    function CHANGEFEEACCOUNT77(address newWallet) ONLYADMIN21     public	//inject NONSTANDARD NAMING
    {
        emit ONFEEACCOUNTCHANGED105(feeAccount, newWallet);
        
        feeAccount = newWallet;
    }
    //--------------------------------------------------------------------------
    function CHANGEFEETAKE490(uint newFee)    ONLYADMIN21           public	//inject NONSTANDARD NAMING
    {
        require(newFee<30000000000000000000);   // don't allow change if above 3%
    
        emit ONCHANGEFEE729(feeTake, newFee);
    
        feeTake = newFee;
    }
    //--------------------------------------------------------------------------
    function DEPOSIT383() payable                          public	//inject NONSTANDARD NAMING
    {
        tokens[etherAddress][msg.sender] = SAFEADD566(tokens[etherAddress][msg.sender], msg.value);
        
        emit DEPOSIT611(etherAddress, msg.sender, msg.value, tokens[etherAddress][msg.sender]);
    }
    //--------------------------------------------------------------------------
    function WITHDRAW907(uint amount)                      public	//inject NONSTANDARD NAMING
    {
        require(tokens[etherAddress][msg.sender]>=amount);
    
        tokens[etherAddress][msg.sender] = SAFESUB949(tokens[etherAddress][msg.sender], amount);
    
        msg.sender.transfer(amount);
    
        emit WITHDRAW294(etherAddress, msg.sender, amount, tokens[etherAddress][msg.sender]);
    }
    //--------------------------------------------------------------------------
    function DEPOSITTOKEN960(address token, uint amount)   public	//inject NONSTANDARD NAMING
    {
        //!!!!!!! Remember to call Token(address).approve(this, amount) 
        //!!!!!!! or this contract will not be able to do the transfer on your behalf.
        
        require(token!=address(0x0));
        
        //if (!ERC20(token).transferFrom(msg.sender, this, amount))
        if (!ERC20(token).TRANSFERFROM306(msg.sender, address(this), amount)) 
        {
            assert(true==false);
        }
        
        tokens[token][msg.sender] = SAFEADD566(tokens[token][msg.sender], amount);
        
        emit DEPOSIT611(token, msg.sender, amount, tokens[token][msg.sender]);
    }
    //--------------------------------------------------------------------------
    function WITHDRAWTOKEN557(address token, uint amount)  public	//inject NONSTANDARD NAMING
    {
        require(token!=address(0x0));
        
        if (tokens[token][msg.sender] < amount)     assert(true==false);
        
        tokens[token][msg.sender] = SAFESUB949(tokens[token][msg.sender], amount);
    
        if (!ERC20(token).TRANSFER556(msg.sender, amount)) assert(true==false);
    
        emit WITHDRAW294(token, msg.sender, amount, tokens[token][msg.sender]);
    }
    //--------------------------------------------------------------------------
    function BALANCEOF297(address token, address user)     public view returns (uint) 	//inject NONSTANDARD NAMING
    {
        return tokens[token][user];
    }
    //--------------------------------------------------------------------------
    function    GENERATEHASH453(   address tokenGet, 	//inject NONSTANDARD NAMING
                                uint    amountGet,  
                                address tokenGive, 
                                uint    amountGive, 
                                uint    expires, 
                                uint    nonce)     private view returns(bytes32)
    {
        return sha256(abi.encodePacked(this, tokenGet, amountGet, tokenGive, amountGive, expires, nonce));
    }
    //--------------------------------------------------------------------------
    function    ORDER30(  address tokenGet, 	//inject NONSTANDARD NAMING
                        uint    amountGet,  
                        address tokenGive, 
                        uint    amountGive, 
                        uint    expires, 
                        uint    nonce)     public 
    {
        bytes32 hash = GENERATEHASH453(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);
    
        orders[msg.sender][hash] = true;
    
        emit ORDER814(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, msg.sender);
    }
    //--------------------------------------------------------------------------
    function    TRADE613(address tokenGet, uint    amountGet, 	//inject NONSTANDARD NAMING
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
             SAFEADD566(orderFills[user][hash], amount) <= amountGet
        );

        TRADEBALANCES201(tokenGet, amountGet, tokenGive, amountGive, user, amount);
        
        orderFills[user][hash] = SAFEADD566(orderFills[user][hash], amount);
    
        emit TRADE181(tokenGet, amount, tokenGive, amountGive * amount / amountGet, user, msg.sender);
    }
    //--------------------------------------------------------------------------
    function    TRADEBALANCES201(address tokenGet, uint    amountGet, 	//inject NONSTANDARD NAMING
                                                address tokenGive, 
                                                uint    amountGive, 
                                                address user,
                                                uint    amount) private 
    {
        uint feeTakeXfer   = SAFEMUL415(amount, feeTake) / (1 ether);

        tokens[tokenGet][msg.sender]  = SAFESUB949(tokens[tokenGet][msg.sender],  SAFEADD566(amount, feeTakeXfer));
        tokens[tokenGet][user]        = SAFEADD566(tokens[tokenGet][user],        amount);
        tokens[tokenGet][feeAccount]  = SAFEADD566(tokens[tokenGet][feeAccount],  feeTakeXfer);
        tokens[tokenGive][user]       = SAFESUB949(tokens[tokenGive][user],       SAFEMUL415(amountGive, amount) / amountGet);
        tokens[tokenGive][msg.sender] = SAFEADD566(tokens[tokenGive][msg.sender], SAFEMUL415(amountGive, amount) / amountGet);
    }
    //--------------------------------------------------------------------------
    function    TESTTRADE107(address tokenGet, uint amountGet, 	//inject NONSTANDARD NAMING
                                            address tokenGive, 
                                            uint amountGive, 
                                            uint expires, 
                                            uint nonce, 
                                            address user, 
                                            uint8 v, 
                                            bytes32 r, 
                                            bytes32 s, 
                                            uint amount, 
                                            address sender) public           returns(bool) 
    {
        if (!(tokens[tokenGet][sender] >= amount &&
            AVAILABLEVOLUME767(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, user, v, r, s) >= amount)) 
        {
            emit ONTRADETESTED289(0);
            return false;
        }

        emit ONTRADETESTED289(1);
        return true;
    }
    //--------------------------------------------------------------------------
    function    AVAILABLEVOLUME767(address tokenGet,   uint    amountGet, 	//inject NONSTANDARD NAMING
                                                    address tokenGive, 
                                                    uint    amountGive, 
                                                    uint    expires, 
                                                    uint    nonce, 
                                                    address user, 
                                                    uint8   v, 
                                                    bytes32 r, 
                                                    bytes32 s)  public  view returns(uint) 
    {
        bytes32 hash = GENERATEHASH453(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);

        if
        (!(
            (orders[user][hash]                                                                             ||
             ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)),v,r,s)==user)  &&
             block.number <= expires
        ))
        {
            return 0;
        }

        uint available1 = SAFESUB949(amountGet, orderFills[user][hash]);
        uint available2 = SAFEMUL415(tokens[tokenGive][user], amountGet) / amountGive;
        
        if (available1<available2) return available1;
        
        return available2;
    }
    //--------------------------------------------------------------------------
    function AMOUNTFILLED57(address tokenGet, uint    amountGet, 	//inject NONSTANDARD NAMING
                                            address tokenGive, 
                                            uint    amountGive, 
                                            uint    expires, 
                                            uint    nonce, 
                                            address user, 
                                            uint8   v, 
                                            bytes32 r, 
                                            bytes32 s) public  returns(uint) 
    {
        bytes32 hash = GENERATEHASH453(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);
        
        return orderFills[user][hash];
    }
    //--------------------------------------------------------------------------
    function CANCELORDER314(address tokenGet,  uint    amountGet, 	//inject NONSTANDARD NAMING
                                            address tokenGive, 
                                            uint    amountGive, 
                                            uint    expires, 
                                            uint    nonce, 
                                            uint8   v, 
                                            bytes32 r, 
                                            bytes32 s)  public
    {
        bytes32 hash = GENERATEHASH453(tokenGet, amountGet, tokenGive, amountGive, expires, nonce);

        require
        (
             orders[msg.sender][hash]     ||
             ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash)),v,r,s)==msg.sender
        );

        orderFills[msg.sender][hash] = amountGet;
    
        emit CANCEL527(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, msg.sender, v, r, s);
    }
}