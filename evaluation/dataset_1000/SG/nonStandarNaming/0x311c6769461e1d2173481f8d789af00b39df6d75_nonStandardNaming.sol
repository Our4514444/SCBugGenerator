                                                                 

pragma solidity 0.5.16;

                                                                                                   
library SafeMath {
                                                                                
    function MUL998(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV123(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB859(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD63(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD305(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                        
interface IERC20 {
    function TRANSFER212(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE355(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM149(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY191() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF756(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE660(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER554(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL883(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                        
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME53() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL258() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS438() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract FreedomDividendCoin is IERC20,ERC20Detailed {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

    string private _name="Freedom Dividend Coin";

    string private _symbol="FDC";

    uint8 private _decimals=2;

                                                             
    function TOTALSUPPLY191() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF756(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE660(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE355(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL883(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE491(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD63(addedValue);
        emit APPROVAL883(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE325(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB859(subtractedValue);
        emit APPROVAL883(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER603(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB859(value);
        _balances[to] = _balances[to].ADD63(value);
        emit TRANSFER554(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT172(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD63(value);
        _balances[account] = _balances[account].ADD63(value);
        emit TRANSFER554(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN315(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB859(value);
        _balances[account] = _balances[account].SUB859(value);
        emit TRANSFER554(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM315(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB859(value);
        _BURN315(account, value);
        emit APPROVAL883(account, msg.sender, _allowed[account][msg.sender]);
    }

    address private DividendDistributor = 0xa100E22A959D869137827D963cED87d4B545ce45;
    uint256 private globalDistributionTimestamp;
    uint256 private balanceOfDividendDistributorAtDistributionTimestamp;

    struct DividendAddresses {
        address individualAddress;
        uint256 lastDistributionTimestamp;
    }

    mapping(address => DividendAddresses) private FreedomDividendAddresses;

    constructor ()
    ERC20Detailed(_name, _symbol, _decimals)
    public
    {
        _MINT172(msg.sender, 2500000000);
        TRANSFER212(DividendDistributor, 10000000);
        globalDistributionTimestamp = now;
        balanceOfDividendDistributorAtDistributionTimestamp = BALANCEOF756(DividendDistributor);
    }

    function TRANSFERCOIN297(address _from, address _to, uint256 _value) internal {	//inject NONSTANDARD NAMING
        uint256 transferRate = _value / 10;
        require(transferRate > 0, "Transfer Rate needs to be higher than the minimum");
        require(_value > transferRate, "Value sent needs to be higher than the Transfer Rate");
        uint256 sendValue = _value - transferRate;
        _TRANSFER603(_from, _to, sendValue);
        _TRANSFER603(_from, DividendDistributor, transferRate);
    }

    function TRANSFER212(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        TRANSFERCOIN297(msg.sender, to, value);
        return true;
    }

    function TRANSFERFROM149(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB859(value);
        TRANSFERCOIN297(from, to, value);
        emit APPROVAL883(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

    function COLLECTFREEDOMDIVIDENDFROMSENDER193() public returns (bool) {	//inject NONSTANDARD NAMING
        COLLECTFREEDOMDIVIDEND287(msg.sender);
        return true;
    }

    function COLLECTFREEDOMDIVIDENDWITHADDRESS576(address collectionAddress) public returns (bool) {	//inject NONSTANDARD NAMING
        COLLECTFREEDOMDIVIDEND287(collectionAddress);
        return true;
    }

    function COLLECTFREEDOMDIVIDEND287(address collectionAddress) internal {	//inject NONSTANDARD NAMING

        require(collectionAddress != address(0), "Need to use a valid Address");
        require(collectionAddress != DividendDistributor, "Dividend Distributor does not distribute a dividend to itself");

        if (FreedomDividendAddresses[collectionAddress].individualAddress != address(0)) {
            if ((now - globalDistributionTimestamp) >= 30 days) {
                require(BALANCEOF756(DividendDistributor) > 0, "Balance of Dividend Distributor needs to be greater than 0");
                globalDistributionTimestamp = now;
                balanceOfDividendDistributorAtDistributionTimestamp = BALANCEOF756(DividendDistributor);
            }
            
            if (FreedomDividendAddresses[collectionAddress].lastDistributionTimestamp > globalDistributionTimestamp) {
                require(1 == 0, "Freedom Dividend has already been collected in past 30 days or just signed up for Dividend and need to wait up to 30 days");
            } else if ((now - FreedomDividendAddresses[collectionAddress].lastDistributionTimestamp) >= 30 days) {
                require(BALANCEOF756(collectionAddress) > 0, "Balance of Collection Address needs to be greater than 0");
                uint256 percentageOfTotalSupply = BALANCEOF756(collectionAddress) * TOTALSUPPLY191() / 625000000;
                require(percentageOfTotalSupply > 0, "Percentage of Total Supply needs to be higher than the minimum");
                uint256 distributionAmount = balanceOfDividendDistributorAtDistributionTimestamp * percentageOfTotalSupply / 10000000000;
                require(distributionAmount > 0, "Distribution amount needs to be higher than 0");
                _TRANSFER603(DividendDistributor, collectionAddress, distributionAmount);
                FreedomDividendAddresses[collectionAddress].lastDistributionTimestamp = now;
            } else {
                require(1 == 0, "It has not been 30 days since last collection of the Freedom Dividend");
            }
        } else {
            DividendAddresses memory newDividendAddresses;
            newDividendAddresses.individualAddress = collectionAddress;
            newDividendAddresses.lastDistributionTimestamp = now;
            FreedomDividendAddresses[collectionAddress] = newDividendAddresses;
        }

    }

    function GETDIVIDENDADDRESS517() public view returns(address) {	//inject NONSTANDARD NAMING
        return FreedomDividendAddresses[msg.sender].individualAddress;
    }

    function GETDIVIDENDADDRESSWITHADDRESS417(address Address) public view returns(address) {	//inject NONSTANDARD NAMING
        return FreedomDividendAddresses[Address].individualAddress;
    }

    function GETLASTDISTRIBUTIONTIMESTAMP365() public view returns(uint256) {	//inject NONSTANDARD NAMING
        return FreedomDividendAddresses[msg.sender].lastDistributionTimestamp;
    }

    function GETLASTDISTRIBUTIONTIMESTAMPWITHADDRESS663(address Address) public view returns(uint256) {	//inject NONSTANDARD NAMING
        return FreedomDividendAddresses[Address].lastDistributionTimestamp;
    }

    function GETGLOBALDISTRIBUTIONTIMESTAMP683() public view returns(uint256) {	//inject NONSTANDARD NAMING
        return globalDistributionTimestamp;
    }

    function GETBALANCEOFDIVIDENDDISTRIBUTORATDISTRIBUTIONTIMESTAMP527() public view returns(uint256) {	//inject NONSTANDARD NAMING
        return balanceOfDividendDistributorAtDistributionTimestamp;
    }

}