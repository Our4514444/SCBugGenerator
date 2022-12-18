                                                                 

pragma solidity 0.5.12;

                  
                                                                           
contract Ownable {

    // Ethereum address of current owner
    address public owner;

    // Ethereum address of the next owner
    // (has to claim ownership first to become effective owner)
    address public newOwner;

    // @dev Log event on ownership transferred
    // @param previousOwner Ethereum address of previous owner
    // @param newOwner Ethereum address of new owner
    event OWNERSHIPTRANSFERRED685(	//inject NONSTANDARD NAMING
        address indexed previousOwner,
        address indexed newOwner
    );

                                            
    modifier ONLYOWNER978() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Restricted to owner");
        _;
    }

                                                   
    constructor() public {
        owner = msg.sender;
    }

                                                                        
                                                                                       
                                                                   
    function TRANSFEROWNERSHIP444(address _newOwner) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0x0), "New owner is zero");

        newOwner = _newOwner;
    }

                                                                          
                                                                                           
                                                                                           
                                                                   
    function TRANSFEROWNERSHIPUNSAFE622(address _newOwner) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0x0), "New owner is zero");

        _TRANSFEROWNERSHIP271(_newOwner);
    }

                                                                        
    function CLAIMOWNERSHIP165() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner, "Restricted to new owner");

        _TRANSFEROWNERSHIP271(msg.sender);
    }

                                                  
                                                                   
    function _TRANSFEROWNERSHIP271(address _newOwner) private {	//inject NONSTANDARD NAMING
        if (_newOwner != owner) {
            emit OWNERSHIPTRANSFERRED685(owner, _newOwner);

            owner = _newOwner;
        }
        newOwner = address(0x0);
    }

}

// File: contracts/whitelist/Whitelist.sol

pragma solidity 0.5.12;



                    
                 
contract Whitelist is Ownable {

    // Set of admins
    mapping(address => bool) public admins;

    // Set of Whitelisted addresses
    mapping(address => bool) public isWhitelisted;

                                            
                                        
    event ADMINADDED650(address indexed admin);	//inject NONSTANDARD NAMING

                                                
                                        
    event ADMINREMOVED213(address indexed admin);	//inject NONSTANDARD NAMING

                                            
                                        
                                           
    event INVESTORADDED986(address indexed admin, address indexed investor);	//inject NONSTANDARD NAMING

                                                   
                                        
                                           
    event INVESTORREMOVED292(address indexed admin, address indexed investor);	//inject NONSTANDARD NAMING

                       
    modifier ONLYADMIN259() {	//inject NONSTANDARD NAMING
        require(admins[msg.sender], "Restricted to whitelist admin");
        _;
    }

                             
                                         
    function ADDADMIN619(address _admin) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(_admin != address(0x0), "Whitelist admin is zero");

        if (!admins[_admin]) {
            admins[_admin] = true;

            emit ADMINADDED650(_admin);
        }
    }

                                  
                                         
    function REMOVEADMIN523(address _admin) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(_admin != address(0x0), "Whitelist admin is zero");  // Necessary?

        if (admins[_admin]) {
            admins[_admin] = false;

            emit ADMINREMOVED213(_admin);
        }
    }

                                                         
                                                                        
    function ADDTOWHITELIST242(address[] calldata _investors) external ONLYADMIN259 {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < _investors.length; i++) {
            if (!isWhitelisted[_investors[i]]) {
                isWhitelisted[_investors[i]] = true;

                emit INVESTORADDED986(msg.sender, _investors[i]);
            }
        }
    }

                                                              
                                                                        
    function REMOVEFROMWHITELIST510(address[] calldata _investors) external ONLYADMIN259 {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < _investors.length; i++) {
            if (isWhitelisted[_investors[i]]) {
                isWhitelisted[_investors[i]] = false;

                emit INVESTORREMOVED292(msg.sender, _investors[i]);
            }
        }
    }

}

// File: contracts/whitelist/Whitelisted.sol

pragma solidity 0.5.12;




                      
                 
contract Whitelisted is Ownable {

    Whitelist public whitelist;

                                                                
                                                               
                                                          
    event WHITELISTCHANGE229(address indexed previous, address indexed current);	//inject NONSTANDARD NAMING

                                                       
    modifier ONLYWHITELISTED996(address _address) {	//inject NONSTANDARD NAMING
        require(whitelist.isWhitelisted(_address), "Address is not whitelisted");
        _;
    }

                        
                                                       
    constructor(Whitelist _whitelist) public {
        SETWHITELIST359(_whitelist);
    }

                                         
                                                
    function SETWHITELIST359(Whitelist _newWhitelist) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(address(_newWhitelist) != address(0x0), "Whitelist address is zero");

        if (address(_newWhitelist) != address(whitelist)) {
            emit WHITELISTCHANGE229(address(whitelist), address(_newWhitelist));

            whitelist = Whitelist(_newWhitelist);
        }
    }

}

// File: contracts/token/TokenRecoverable.sol

pragma solidity 0.5.12;



                           
                 
contract TokenRecoverable is Ownable {

    // Address that can do the TokenRecovery
    address public tokenRecoverer;

                                                           
                                                                     
                                                                
    event TOKENRECOVERERCHANGE824(address indexed previous, address indexed current);	//inject NONSTANDARD NAMING

                                                     
                                                         
                                                         
    event TOKENRECOVERY47(address indexed oldAddress, address indexed newAddress);	//inject NONSTANDARD NAMING

                                                  
    modifier ONLYTOKENRECOVERER419() {	//inject NONSTANDARD NAMING
        require(msg.sender == tokenRecoverer, "Restricted to token recoverer");
        _;
    }

                        
                                                                  
    constructor(address _tokenRecoverer) public {
        SETTOKENRECOVERER473(_tokenRecoverer);
    }

                                
                                                                         
    function SETTOKENRECOVERER473(address _newTokenRecoverer) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(_newTokenRecoverer != address(0x0), "New token recoverer is zero");

        if (_newTokenRecoverer != tokenRecoverer) {
            emit TOKENRECOVERERCHANGE824(tokenRecoverer, _newTokenRecoverer);

            tokenRecoverer = _newTokenRecoverer;
        }
    }

                          
                                  
                                  
    function RECOVERTOKEN262(address _oldAddress, address _newAddress) public;	//inject NONSTANDARD NAMING

}

// File: contracts/token/ERC20.sol

pragma solidity 0.5.12;


                          
                                                       
interface ERC20 {

    event TRANSFER632(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL658(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY596() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF268(address _owner) external view returns (uint);	//inject NONSTANDARD NAMING
    function ALLOWANCE699(address _owner, address _spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE781(address _spender, uint _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER612(address _to, uint _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM258(address _from, address _to, uint _value) external returns (bool);	//inject NONSTANDARD NAMING

}

// File: contracts/math/SafeMath.sol

pragma solidity 0.5.12;


                   
                                                               
library SafeMath {

                             
    function ADD69(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;

        assert(c >= a);

        return c;
    }

                                  
    function SUB652(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        assert(b <= a);

        return a - b;
    }

                                  
    function MUL316(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;

        assert(c / a == b);

        return c;
    }

                                      
    function DIV724(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return a / b;
    }

}

// File: contracts/token/ProfitSharing.sol

pragma solidity 0.5.12;




                        
                 
contract ProfitSharing is Ownable {

    using SafeMath for uint;


    // An InvestorAccount object keeps track of the investor's
    // - balance: amount of tokens he/she holds (always up-to-date)
    // - profitShare: amount of wei this token owed him/her at the last update
    // - lastTotalProfits: determines when his/her profitShare was updated
    // Note, this construction requires:
    // - totalProfits to never decrease
    // - totalSupply to be fixed
    // - profitShare of all involved parties to get updated prior to any token transfer
    // - lastTotalProfits to be set to current totalProfits upon profitShare update
    struct InvestorAccount {
        uint balance;           // token balance
        uint lastTotalProfits;  // totalProfits [wei] at the time of last profit share update
        uint profitShare;       // profit share [wei] of last update
    }


    // Investor account database
    mapping(address => InvestorAccount) public accounts;

    // Authority who is allowed to deposit profits [wei] on this
    address public profitDepositor;

    // Authority who is allowed to distribute profit shares [wei] to investors
    // (so, that they don't need to withdraw it by themselves)
    address public profitDistributor;

    // Amount of total profits [wei] stored to this token
    // In contrast to the wei balance (which may be reduced due to profit share withdrawal)
    // this value will never decrease
    uint public totalProfits;

    // As long as the total supply isn't fixed, i.e. new tokens can appear out of thin air,
    // the investors' profit shares aren't determined
    bool public totalSupplyIsFixed;

    // Total amount of tokens
    uint internal totalSupply_;


                                                             
                                                                      
                                                                 
    event PROFITDEPOSITORCHANGE851(	//inject NONSTANDARD NAMING
        address indexed previous,
        address indexed current
    );

                                                                  
                                                                        
                                                                   
    event PROFITDISTRIBUTORCHANGE371(	//inject NONSTANDARD NAMING
        address indexed previous,
        address indexed current
    );

                                        
                                                   
                                              
    event PROFITDEPOSIT738(	//inject NONSTANDARD NAMING
        address indexed depositor,
        uint amount
    );

                                             
                                          
                                                                
    event PROFITSHAREUPDATE625(	//inject NONSTANDARD NAMING
        address indexed investor,
        uint amount
    );

                                           
                                          
                                                                      
    event PROFITSHAREWITHDRAWAL729(	//inject NONSTANDARD NAMING
        address indexed investor,
        address indexed beneficiary,
        uint amount
    );


                                                                
    modifier ONLYPROFITDEPOSITOR363() {	//inject NONSTANDARD NAMING
        require(msg.sender == profitDepositor, "Restricted to profit depositor");
        _;
    }

                                                                     
    modifier ONLYPROFITDISTRIBUTOR18() {	//inject NONSTANDARD NAMING
        require(msg.sender == profitDistributor, "Restricted to profit distributor");
        _;
    }

                                                                           
    modifier ONLYWHENTOTALSUPPLYISFIXED769() {	//inject NONSTANDARD NAMING
        require(totalSupplyIsFixed, "Total supply may change");
        _;
    }

                        
                                                        
    constructor(address _profitDepositor, address _profitDistributor) public {
        SETPROFITDEPOSITOR392(_profitDepositor);
        SETPROFITDISTRIBUTOR130(_profitDistributor);
    }

                                                             
    function () external payable {
        require(msg.data.length == 0, "Fallback call with data");

        DEPOSITPROFIT330();
    }

                                    
                                                      
    function SETPROFITDEPOSITOR392(address _newProfitDepositor) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(_newProfitDepositor != address(0x0), "New profit depositor is zero");

        if (_newProfitDepositor != profitDepositor) {
            emit PROFITDEPOSITORCHANGE851(profitDepositor, _newProfitDepositor);

            profitDepositor = _newProfitDepositor;
        }
    }

                                      
                                                        
    function SETPROFITDISTRIBUTOR130(address _newProfitDistributor) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(_newProfitDistributor != address(0x0), "New profit distributor is zero");

        if (_newProfitDistributor != profitDistributor) {
            emit PROFITDISTRIBUTORCHANGE371(profitDistributor, _newProfitDistributor);

            profitDistributor = _newProfitDistributor;
        }
    }

                           
    function DEPOSITPROFIT330() public payable ONLYPROFITDEPOSITOR363 ONLYWHENTOTALSUPPLYISFIXED769 {	//inject NONSTANDARD NAMING
        require(totalSupply_ > 0, "Total supply is zero");

        totalProfits = totalProfits.ADD69(msg.value);

        emit PROFITDEPOSIT738(msg.sender, msg.value);
    }

                               
                                            
                                 
    function PROFITSHAREOWING827(address _investor) public view returns (uint) {	//inject NONSTANDARD NAMING
        if (!totalSupplyIsFixed || totalSupply_ == 0) {
            return 0;
        }

        InvestorAccount memory account = accounts[_investor];

        return totalProfits.SUB652(account.lastTotalProfits)
                           .MUL316(account.balance)
                           .DIV724(totalSupply_)
                           .ADD69(account.profitShare);
    }

                                
                                            
    function UPDATEPROFITSHARE455(address _investor) public ONLYWHENTOTALSUPPLYISFIXED769 {	//inject NONSTANDARD NAMING
        uint newProfitShare = PROFITSHAREOWING827(_investor);

        accounts[_investor].lastTotalProfits = totalProfits;
        accounts[_investor].profitShare = newProfitShare;

        emit PROFITSHAREUPDATE625(_investor, newProfitShare);
    }

                                  
    function WITHDRAWPROFITSHARE419() public {	//inject NONSTANDARD NAMING
        _WITHDRAWPROFITSHARE473(msg.sender, msg.sender);
    }

    function WITHDRAWPROFITSHARETO766(address payable _beneficiary) public {	//inject NONSTANDARD NAMING
        _WITHDRAWPROFITSHARE473(msg.sender, _beneficiary);
    }

                                  
    function WITHDRAWPROFITSHARES802(address payable[] calldata _investors)	//inject NONSTANDARD NAMING
        external
        ONLYPROFITDISTRIBUTOR18
    {
        for (uint i = 0; i < _investors.length; ++i) {
            _WITHDRAWPROFITSHARE473(_investors[i], _investors[i]);
        }
    }

                                  
    function _WITHDRAWPROFITSHARE473(address _investor, address payable _beneficiary) internal {	//inject NONSTANDARD NAMING
        UPDATEPROFITSHARE455(_investor);

        uint withdrawnProfitShare = accounts[_investor].profitShare;

        accounts[_investor].profitShare = 0;
        _beneficiary.transfer(withdrawnProfitShare);

        emit PROFITSHAREWITHDRAWAL729(_investor, _beneficiary, withdrawnProfitShare);
    }

}

// File: contracts/token/MintableToken.sol

pragma solidity 0.5.12;





                        
                 
                                                             
                                                             
                                                           
contract MintableToken is ERC20, ProfitSharing, Whitelisted {

    address public minter;
    uint public numberOfInvestors = 0;

                              
                                                                  
                                                      
    event MINTED689(address indexed to, uint amount);	//inject NONSTANDARD NAMING

                                       
    event MINTFINISHED777();	//inject NONSTANDARD NAMING

                                                                    
    modifier ONLYMINTER287() {	//inject NONSTANDARD NAMING
        require(msg.sender == minter, "Restricted to minter");
        _;
    }

                                                                                       
    modifier CANMINT673() {	//inject NONSTANDARD NAMING
        require(!totalSupplyIsFixed, "Total supply has been fixed");
        _;
    }

                                 
                                                           
    function SETMINTER797(address _minter) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(minter == address(0x0), "Minter has already been set");
        require(_minter != address(0x0), "Minter is zero");

        minter = _minter;
    }

                                                            
                                                                       
                                                       
    function MINT931(address _to, uint _amount) public ONLYMINTER287 CANMINT673 ONLYWHITELISTED996(_to) {	//inject NONSTANDARD NAMING
        if (accounts[_to].balance == 0) {
            numberOfInvestors++;
        }

        totalSupply_ = totalSupply_.ADD69(_amount);
        accounts[_to].balance = accounts[_to].balance.ADD69(_amount);

        emit MINTED689(_to, _amount);
        emit TRANSFER632(address(0x0), _to, _amount);
    }

                                                          
    function FINISHMINTING958() public ONLYMINTER287 CANMINT673 {	//inject NONSTANDARD NAMING
        totalSupplyIsFixed = true;

        emit MINTFINISHED777();
    }

}

// File: contracts/token/StokrToken.sol

pragma solidity 0.5.12;





                     
                 
contract StokrToken is MintableToken, TokenRecoverable {

    string public name;
    string public symbol;
    uint8 public constant decimals325 = 18;	//inject NONSTANDARD NAMING

    mapping(address => mapping(address => uint)) internal allowance_;

                                                       
    event TOKENDESTROYED243();	//inject NONSTANDARD NAMING

                        
                                                                      
                                                                   
    constructor(
        string memory _name,
        string memory _symbol,
        Whitelist _whitelist,
        address _profitDepositor,
        address _profitDistributor,
        address _tokenRecoverer
    )
        public
        Whitelisted(_whitelist)
        ProfitSharing(_profitDepositor, _profitDistributor)
        TokenRecoverable(_tokenRecoverer)
    {
        name = _name;
        symbol = _symbol;
    }

                                                                                                    
    function DESTRUCT705() public ONLYMINTER287 {	//inject NONSTANDARD NAMING
        emit TOKENDESTROYED243();
        selfdestruct(address(uint160(owner)));
    }

                          
                                                  
                                                  
    function RECOVERTOKEN262(address _oldAddress, address _newAddress)	//inject NONSTANDARD NAMING
        public
        ONLYTOKENRECOVERER419
        ONLYWHITELISTED996(_newAddress)
    {
        // Ensure that new address is *not* an existing account.
        // Check for account.profitShare is not needed because of following implication:
        //   (account.lastTotalProfits == 0) ==> (account.profitShare == 0)
        require(accounts[_newAddress].balance == 0 && accounts[_newAddress].lastTotalProfits == 0,
                "New address exists already");

        UPDATEPROFITSHARE455(_oldAddress);

        accounts[_newAddress] = accounts[_oldAddress];
        delete accounts[_oldAddress];

        emit TOKENRECOVERY47(_oldAddress, _newAddress);
        emit TRANSFER632(_oldAddress, _newAddress, accounts[_newAddress].balance);
    }

                                        
                             
    function TOTALSUPPLY596() public view returns (uint) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

                           
                                                          
                                      
    function BALANCEOF268(address _investor) public view returns (uint) {	//inject NONSTANDARD NAMING
        return accounts[_investor].balance;
    }

                                                                     
                                                          
                                                         
                                              
    function ALLOWANCE699(address _investor, address _spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return allowance_[_investor][_spender];
    }

                                                              
                                                                                  
                                                        
                                                                                
                                    
    function APPROVE781(address _spender, uint _value) public returns (bool) {	//inject NONSTANDARD NAMING
        return _APPROVE247(msg.sender, _spender, _value);
    }

                                                                              
                                                                                  
                                                        
                                                                                   
                                    
    function INCREASEALLOWANCE53(address _spender, uint _amount) public returns (bool) {	//inject NONSTANDARD NAMING
        require(allowance_[msg.sender][_spender] + _amount >= _amount, "Allowance overflow");

        return _APPROVE247(msg.sender, _spender, allowance_[msg.sender][_spender].ADD69(_amount));
    }

                                                                              
                                                                                  
                                                        
                                                                                
                                    
    function DECREASEALLOWANCE546(address _spender, uint _amount) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_amount <= allowance_[msg.sender][_spender], "Amount exceeds allowance");

        return _APPROVE247(msg.sender, _spender, allowance_[msg.sender][_spender].SUB652(_amount));
    }

                                                   
                                                       
                                                          
                                               
                                                                             
    function CANTRANSFER888(address _from, address _to, uint _value)	//inject NONSTANDARD NAMING
        public view returns (bool)
    {
        return totalSupplyIsFixed
            && _from != address(0x0)
            && _to != address(0x0)
            && _value <= accounts[_from].balance
            && whitelist.isWhitelisted(_from)
            && whitelist.isWhitelisted(_to);
    }

                                                                  
                                                                
                                                         
                                                            
                                                 
                                                                               
    function CANTRANSFERFROM594(address _spender, address _from, address _to, uint _value)	//inject NONSTANDARD NAMING
        public view returns (bool)
    {
        return CANTRANSFER888(_from, _to, _value) && _value <= allowance_[_from][_spender];
    }

                            
                                                                                  
                                                          
                                               
                                  
    function TRANSFER612(address _to, uint _value) public returns (bool) {	//inject NONSTANDARD NAMING
        return _TRANSFER163(msg.sender, _to, _value);
    }

                                             
                                                                                  
                                                       
                                                          
                                               
                                  
    function TRANSFERFROM258(address _from, address _to, uint _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_value <= allowance_[_from][msg.sender], "Amount exceeds allowance");

        return _APPROVE247(_from, msg.sender, allowance_[_from][msg.sender].SUB652(_value))
            && _TRANSFER163(_from, _to, _value);
    }

                                                                                        
                                                         
                                                        
                                                                                
                                    
    function _APPROVE247(address _from, address _spender, uint _value)	//inject NONSTANDARD NAMING
        internal
        ONLYWHITELISTED996(_from)
        ONLYWHENTOTALSUPPLYISFIXED769
        returns (bool)
    {
        allowance_[_from][_spender] = _value;

        emit APPROVAL658(_from, _spender, _value);

        return true;
    }

                                                      
                                                       
                                                          
                                               
                                  
    function _TRANSFER163(address _from, address _to, uint _value)	//inject NONSTANDARD NAMING
        internal
        ONLYWHITELISTED996(_from)
        ONLYWHITELISTED996(_to)
        ONLYWHENTOTALSUPPLYISFIXED769
        returns (bool)
    {
        require(_to != address(0x0), "Recipient is zero");
        require(_value <= accounts[_from].balance, "Amount exceeds balance");

        UPDATEPROFITSHARE455(_from);
        UPDATEPROFITSHARE455(_to);

        accounts[_from].balance = accounts[_from].balance.SUB652(_value);
        accounts[_to].balance = accounts[_to].balance.ADD69(_value);

        emit TRANSFER632(_from, _to, _value);

        return true;
    }

}

// File: contracts/crowdsale/RateSourceInterface.sol

pragma solidity 0.5.12;


                     
                 
interface RateSource {

                                                       
                                  
    function ETHERRATE441() external view returns (uint);	//inject NONSTANDARD NAMING

}

// File: contracts/crowdsale/MintingCrowdsale.sol

pragma solidity 0.5.12;






                           
                 
contract MintingCrowdsale is Ownable {
    using SafeMath for uint;

    // Maximum Time of offering period after extension
    uint constant maxofferingperiod541 = 80 days;	//inject NONSTANDARD NAMING

    // Ether rate oracle contract providing the price of an Ether in EUR cents
    RateSource public rateSource;

    // The token to be sold
    // In the following, the term "token unit" always refers to the smallest
    // and non-divisible quantum. Thus, token unit amounts are always integers.
    // One token is expected to consist of 10^18 token units.
    MintableToken public token;

    // Token amounts in token units
    // The public and the private sale are both capped (i.e. two distinct token pools)
    // The tokenRemaining variables keep track of how many token units are available
    // for the respective type of sale
    uint public tokenCapOfPublicSale;
    uint public tokenCapOfPrivateSale;
    uint public tokenRemainingForPublicSale;
    uint public tokenRemainingForPrivateSale;

    // Prices are in Euro cents (i.e. 1/100 EUR)
    uint public tokenPrice;

    // The minimum amount of tokens a purchaser has to buy via one transaction
    uint public tokenPurchaseMinimum;

    // The maximum total amount of tokens a purchaser may buy during start phase
    uint public tokenPurchaseLimit;

    // Total token purchased by investor (while purchase amount is limited)
    mapping(address => uint) public tokenPurchased;

    // Public sale period
    uint public openingTime;
    uint public closingTime;
    uint public limitEndTime;

    // Ethereum address where invested funds will be transferred to
    address payable public companyWallet;

    // Amount and receiver of reserved tokens
    uint public tokenReservePerMill;
    address public reserveAccount;

    // Wether this crowdsale was finalized or not
    bool public isFinalized = false;


                                                    
                                                              
                                           
                                                                        
    event TOKENDISTRIBUTION57(address indexed beneficiary, uint amount, bool isPublicSale);	//inject NONSTANDARD NAMING

                                                
                                                        
                                                           
                                           
    event TOKENPURCHASE616(address indexed buyer, uint value, uint amount);	//inject NONSTANDARD NAMING

                                             
                                                     
                                                   
    event CLOSINGTIMECHANGE573(uint previous, uint current);	//inject NONSTANDARD NAMING

                                              
    event FINALIZATION861();	//inject NONSTANDARD NAMING


                        
                                                     
                                          
                                                                                         
                                                                                           
                                                                                            
                                                                                                  
                                                       
                                                                       
                                                                       
                                                                                     
                                                                          
                                                                                              
                                                                           
    constructor(
        RateSource _rateSource,
        MintableToken _token,
        uint _tokenCapOfPublicSale,
        uint _tokenCapOfPrivateSale,
        uint _tokenPurchaseMinimum,
        uint _tokenPurchaseLimit,
        uint _tokenReservePerMill,
        uint _tokenPrice,
        uint _openingTime,
        uint _closingTime,
        uint _limitEndTime,
        address payable _companyWallet,
        address _reserveAccount
    )
        public
    {
        require(address(_rateSource) != address(0x0), "Rate source is zero");
        require(address(_token) != address(0x0), "Token address is zero");
        require(_token.minter() == address(0x0), "Token has another minter");
        require(_tokenCapOfPublicSale > 0, "Cap of public sale is zero");
        require(_tokenCapOfPrivateSale > 0, "Cap of private sale is zero");
        require(_tokenPurchaseMinimum <= _tokenCapOfPublicSale
                && _tokenPurchaseMinimum <= _tokenCapOfPrivateSale,
                "Purchase minimum exceeds cap");
        require(_tokenPrice > 0, "Token price is zero");
        require(_openingTime >= now, "Opening lies in the past");
        require(_closingTime >= _openingTime, "Closing lies before opening");
        require(_companyWallet != address(0x0), "Company wallet is zero");
        require(_reserveAccount != address(0x0), "Reserve account is zero");


        // Note: There are no time related requirements regarding limitEndTime.
        //       If it's below openingTime, token purchases will never be limited.
        //       If it's above closingTime, token purchases will always be limited.
        if (_limitEndTime > _openingTime) {
            // But, if there's a purchase limitation phase, the limit must be at
            // least the purchase minimum or above to make purchases possible.
            require(_tokenPurchaseLimit >= _tokenPurchaseMinimum,
                    "Purchase limit is below minimum");
        }

        // Utilize safe math to ensure the sum of three token pools does't overflow
        _tokenCapOfPublicSale.ADD69(_tokenCapOfPrivateSale).MUL316(_tokenReservePerMill);

        rateSource = _rateSource;
        token = _token;
        tokenCapOfPublicSale = _tokenCapOfPublicSale;
        tokenCapOfPrivateSale = _tokenCapOfPrivateSale;
        tokenPurchaseMinimum = _tokenPurchaseMinimum;
        tokenPurchaseLimit= _tokenPurchaseLimit;
        tokenReservePerMill = _tokenReservePerMill;
        tokenPrice = _tokenPrice;
        openingTime = _openingTime;
        closingTime = _closingTime;
        limitEndTime = _limitEndTime;
        companyWallet = _companyWallet;
        reserveAccount = _reserveAccount;

        tokenRemainingForPublicSale = _tokenCapOfPublicSale;
        tokenRemainingForPrivateSale = _tokenCapOfPrivateSale;
    }



                                           
    function () external payable {
        require(msg.data.length == 0, "Fallback call with data");

        BUYTOKENS50();
    }

                                                                  
                                                                             
                                                                   
                                                                      
    function DISTRIBUTETOKENSVIAPUBLICSALE589(	//inject NONSTANDARD NAMING
        address[] memory beneficiaries,
        uint[] memory amounts
    )
        public
    {
        tokenRemainingForPublicSale =
            DISTRIBUTETOKENS792(tokenRemainingForPublicSale, beneficiaries, amounts, true);
    }

                                                                   
                                                                             
                                                                   
                                                                      
    function DISTRIBUTETOKENSVIAPRIVATESALE974(	//inject NONSTANDARD NAMING
        address[] memory beneficiaries,
        uint[] memory amounts
    )
        public
    {
        tokenRemainingForPrivateSale =
            DISTRIBUTETOKENS792(tokenRemainingForPrivateSale, beneficiaries, amounts, false);
    }

                                              
                                                     
    function HASCLOSED900() public view returns (bool) {	//inject NONSTANDARD NAMING
        return now >= closingTime;
    }

                                          
                                                                                
    function ISOPEN621() public view returns (bool) {	//inject NONSTANDARD NAMING
        return now >= openingTime && !HASCLOSED900();
    }

                                                      
                                                                               
    function TIMEREMAINING132() public view returns (uint) {	//inject NONSTANDARD NAMING
        if (HASCLOSED900()) {
            return 0;
        }

        return closingTime - now;
    }

                                                                         
                                  
    function TOKENSOLD993() public view returns (uint) {	//inject NONSTANDARD NAMING
        return (tokenCapOfPublicSale - tokenRemainingForPublicSale)
             + (tokenCapOfPrivateSale - tokenRemainingForPrivateSale);
    }

                            
    function BUYTOKENS50() public payable {	//inject NONSTANDARD NAMING
        require(ISOPEN621(), "Sale is not open");

        uint etherRate = rateSource.ETHERRATE441();

        require(etherRate > 0, "Ether rate is zero");

        // Units:  [1e-18*ether] * [cent/ether] / [cent/token] => [1e-18*token]
        uint amount = msg.value.MUL316(etherRate).DIV724(tokenPrice);

        require(amount <= tokenRemainingForPublicSale, "Not enough tokens available");
        require(amount >= tokenPurchaseMinimum, "Investment is too low");

        // Is the total amount an investor can purchase with Ether limited?
        if (now < limitEndTime) {
            uint purchased = tokenPurchased[msg.sender].ADD69(amount);

            require(purchased <= tokenPurchaseLimit, "Purchase limit reached");

            tokenPurchased[msg.sender] = purchased;
        }

        tokenRemainingForPublicSale = tokenRemainingForPublicSale.SUB652(amount);

        token.MINT931(msg.sender, amount);
        FORWARDFUNDS655();

        emit TOKENPURCHASE616(msg.sender, msg.value, amount);
    }

                                                          
                                                               
    function CHANGECLOSINGTIME570(uint _newClosingTime) public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(!HASCLOSED900(), "Sale has already ended");
        require(_newClosingTime > now, "ClosingTime not in the future");
        require(_newClosingTime > openingTime, "New offering is zero");
        require(_newClosingTime - openingTime <= maxofferingperiod541, "New offering too long");

        emit CLOSINGTIMECHANGE573(closingTime, _newClosingTime);

        closingTime = _newClosingTime;
    }

                                                                              
    function FINALIZE433() public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        require(!isFinalized, "Sale has already been finalized");
        require(HASCLOSED900(), "Sale has not closed");

        if (tokenReservePerMill > 0) {
            token.MINT931(reserveAccount, TOKENSOLD993().MUL316(tokenReservePerMill).DIV724(1000));
        }
        token.FINISHMINTING958();
        isFinalized = true;

        emit FINALIZATION861();
    }

                                                                         
                                                            
                                                             
                                                                     
                                                                 
    function DISTRIBUTETOKENS792(	//inject NONSTANDARD NAMING
        uint tokenRemaining,
        address[] memory beneficiaries,
        uint[] memory amounts,
        bool isPublicSale
    )
        internal
        ONLYOWNER978
        returns (uint)
    {
        require(!isFinalized, "Sale has been finalized");
        require(beneficiaries.length == amounts.length, "Lengths are different");

        for (uint i = 0; i < beneficiaries.length; ++i) {
            address beneficiary = beneficiaries[i];
            uint amount = amounts[i];

            require(amount <= tokenRemaining, "Not enough tokens available");

            tokenRemaining = tokenRemaining.SUB652(amount);
            token.MINT931(beneficiary, amount);

            emit TOKENDISTRIBUTION57(beneficiary, amount, isPublicSale);
        }

        return tokenRemaining;
    }

                                                     
    function FORWARDFUNDS655() internal {	//inject NONSTANDARD NAMING
        companyWallet.transfer(address(this).balance);
    }

}

// File: contracts/crowdsale/StokrCrowdsale.sol

pragma solidity 0.5.12;




                         
                 
contract StokrCrowdsale is MintingCrowdsale {

    // Soft cap in token units
    uint public tokenGoal;

    // As long as the goal is not reached funds of purchases are held back
    // and investments are assigned to investors here to enable a refunding
    // if the goal is missed upon finalization
    mapping(address => uint) public investments;


    // Log entry upon investor refund event
    event INVESTORREFUND882(address indexed investor, uint value);	//inject NONSTANDARD NAMING


                        
                               
                                                                          
                                                                            
                                                                             
                                                                                            
                                                                                                  
                                                                                        
                                                       
                                                                           
                                                                       
                                                                       
                                                                                     
                                                                          
                                         
    constructor(
        RateSource _rateSource,
        StokrToken _token,
        uint _tokenCapOfPublicSale,
        uint _tokenCapOfPrivateSale,
        uint _tokenGoal,
        uint _tokenPurchaseMinimum,
        uint _tokenPurchaseLimit,
        uint _tokenReservePerMill,
        uint _tokenPrice,
        uint _openingTime,
        uint _closingTime,
        uint _limitEndTime,
        address payable _companyWallet,
        address _reserveAccount
    )
        public
        MintingCrowdsale(
            _rateSource,
            _token,
            _tokenCapOfPublicSale,
            _tokenCapOfPrivateSale,
            _tokenPurchaseMinimum,
            _tokenPurchaseLimit,
            _tokenReservePerMill,
            _tokenPrice,
            _openingTime,
            _closingTime,
            _limitEndTime,
            _companyWallet,
            _reserveAccount
        )
    {
        require(
            _tokenGoal <= _tokenCapOfPublicSale + _tokenCapOfPrivateSale,
            "Goal is not attainable"
        );

        tokenGoal = _tokenGoal;
    }

                                                              
                                                             
    function GOALREACHED500() public view returns (bool) {	//inject NONSTANDARD NAMING
        return TOKENSOLD993() >= tokenGoal;
    }

                                                                           
    function DISTRIBUTEREFUNDS5(address payable[] calldata _investors) external {	//inject NONSTANDARD NAMING
        for (uint i = 0; i < _investors.length; ++i) {
            REFUNDINVESTOR900(_investors[i]);
        }
    }

                                                                           
    function CLAIMREFUND325() public {	//inject NONSTANDARD NAMING
        REFUNDINVESTOR900(msg.sender);
    }

                                                           
    function FINALIZE433() public ONLYOWNER978 {	//inject NONSTANDARD NAMING
        super.FINALIZE433();

        if (!GOALREACHED500()) {
            StokrToken(address(token)).DESTRUCT705();
        }
    }

    function DISTRIBUTETOKENSVIAPUBLICSALE589(	//inject NONSTANDARD NAMING
        address[] memory beneficiaries,
        uint[] memory amounts
    )
        public
    {
        super.DISTRIBUTETOKENSVIAPUBLICSALE589(beneficiaries, amounts);
        // The goal may get reached due to token distribution,
        // so forward any accumulated funds to the company wallet.
        FORWARDFUNDS655();
    }

    function DISTRIBUTETOKENSVIAPRIVATESALE974(	//inject NONSTANDARD NAMING
        address[] memory beneficiaries,
        uint[] memory amounts
    )
        public
    {
        super.DISTRIBUTETOKENSVIAPRIVATESALE974(beneficiaries, amounts);
        // The goal may get reached due to token distribution,
        // so forward any accumulated funds to the company wallet.
        FORWARDFUNDS655();
    }

                                                                    
    function FORWARDFUNDS655() internal {	//inject NONSTANDARD NAMING
        if (GOALREACHED500()) {
            super.FORWARDFUNDS655();
        }
        else {
            investments[msg.sender] = investments[msg.sender].ADD69(msg.value);
        }
    }

                                                              
                                                     
    function REFUNDINVESTOR900(address payable _investor) internal {	//inject NONSTANDARD NAMING
        require(isFinalized, "Sale has not been finalized");
        require(!GOALREACHED500(), "Goal was reached");

        uint investment = investments[_investor];

        if (investment > 0) {
            investments[_investor] = 0;
            _investor.transfer(investment);

            emit INVESTORREFUND882(_investor, investment);
        }
    }

}

// File: contracts/crowdsale/StokrCrowdsaleFactory.sol

pragma solidity 0.5.12;




// Helper contract to deploy a new StokrCrowdsale contract

contract StokrCrowdsaleFactory {

    function CREATENEWCROWDSALE168(	//inject NONSTANDARD NAMING
        StokrToken token,
        uint tokenPrice,
        uint[6] calldata amounts,    // [tokenCapOfPublicSale, tokenCapOfPrivateSale, tokenGoal,
                                     //  tokenPurchaseMinimum, tokenPurchaseLimit,
                                     //  tokenReservePerMill]
        uint[3] calldata period,     // [openingTime, closingTime, limitEndTime]
        address[2] calldata wallets  // [companyWallet, reserveAccount]
    )
        external
        returns (StokrCrowdsale)
    {
        StokrCrowdsale crowdsale = new StokrCrowdsale(
            RateSource(msg.sender),         // rateSource
            token,
            amounts[0],                     // tokenCapOfPublicSale
            amounts[1],                     // tokenCapOfPrivateSale
            amounts[2],                     // tokenGoal
            amounts[3],                     // tokenPurchaseMinimum
            amounts[4],                     // tokenPurchaseLimit
            amounts[5],                     // tokenReservePerMill
            tokenPrice,                     // tokenPrice
            period[0],                      // openingTime
            period[1],                      // closingTime
            period[2],                      // limitEndTime
            address(uint160(wallets[0])),   // companyWallet
            wallets[1]);                    // reserveAccount

        crowdsale.TRANSFEROWNERSHIPUNSAFE622(msg.sender);

        return crowdsale;
    }

}