pragma solidity 0.5.9;


library SafeMath {
    function MUL671(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV499(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB728(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD251(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

                                                                            

contract Ownable {
    address payable public owner;
    event OWNERSHIPTRANSFERRED694(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () public {
        owner = msg.sender;
    }

                                                                                 
    modifier ONLYOWNER559() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                     
    function TRANSFEROWNERSHIP329(address payable _newOwner) external ONLYOWNER559 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0));
        owner = _newOwner;
        emit OWNERSHIPTRANSFERRED694(owner, _newOwner);
    }
}

contract ApproveAndCallFallBack {
    function RECEIVEAPPROVAL382(address from, uint256 _amount, address _token, bytes calldata  _data) external;	//inject NONSTANDARD NAMING
}

                                                                       
contract WINSToken is Ownable {

    string public name;                //The Token's name: e.g. DigixDAO Tokens
    uint8 public decimals;             //Number of decimals of the smallest unit
    string public symbol;              //An identifier: e.g. REP

                                                                            
                                                                                
              
    struct  Checkpoint {

        // `fromBlock` is the block number that the value was generated from
        uint128 fromBlock;

        // `value` is the amount of tokens at a specific block number
        uint128 value;
    }

    // `creationBlock` is the block number that the Clone Token was created
    uint public creationBlock;

    // Flag that determines if the token is transferable or not.
    bool public transfersEnabled;

    // `balances` is the map that tracks the balance of each address, in this
    //  contract when the balance changes the block number that the change
    //  occurred is also included in the map
    mapping (address => Checkpoint[]) balances;

    // `allowed` tracks any extra transfer rights as in all ERC20 tokens
    mapping (address => mapping (address => uint256)) allowed;

    // Tracks the history of the `totalSupply` of the token
    Checkpoint[] totalSupplyHistory;
    Checkpoint[] totalSupplyHolders;
    mapping (address => bool) public holders;
    uint public minHolderAmount = 20000 ether;

                    
    // Events
                    
    event CLAIMEDTOKENS913(address indexed _token, address indexed _owner, uint _amount);	//inject NONSTANDARD NAMING
    event TRANSFER678(address indexed _from, address indexed _to, uint256 _amount);	//inject NONSTANDARD NAMING
    event APPROVAL103(address indexed _owner, address indexed _spender, uint256 _amount);	//inject NONSTANDARD NAMING


    modifier WHENTRANSFERSENABLED745() {	//inject NONSTANDARD NAMING
        require(transfersEnabled);
        _;
    }

                    
    // Constructor
                    


    constructor () public {
        name = "WINS LIVE";
        symbol = "WNL";
        decimals = 18;
        creationBlock = block.number;
        transfersEnabled = true;

        //initial emission
        uint _amount = 77777777 * (10 ** uint256(decimals));
        UPDATEVALUEATNOW772(totalSupplyHistory, _amount);
        UPDATEVALUEATNOW772(balances[msg.sender], _amount);

        holders[msg.sender] = true;
        UPDATEVALUEATNOW772(totalSupplyHolders, _amount);
        emit TRANSFER678(address(0), msg.sender, _amount);
    }


                                     
    function () external payable {}

                       
    // ERC20 Methods
                       

                                                                
                                               
                                                             
                                                          
    function TRANSFER832(address _to, uint256 _amount) WHENTRANSFERSENABLED745 external returns (bool) {	//inject NONSTANDARD NAMING
        DOTRANSFER357(msg.sender, _to, _amount);
        return true;
    }

                                                                               
                               
                                                                     
                                               
                                                             
                                                   
    function TRANSFERFROM17(address _from, address _to, uint256 _amount) WHENTRANSFERSENABLED745 external returns (bool) {	//inject NONSTANDARD NAMING
        // The standard ERC 20 transferFrom functionality
        require(allowed[_from][msg.sender] >= _amount);
        allowed[_from][msg.sender] -= _amount;
        DOTRANSFER357(_from, _to, _amount);
        return true;
    }

                                                                               
                                                            
                                                                     
                                               
                                                             
                                                   
    function DOTRANSFER357(address _from, address _to, uint _amount) internal {	//inject NONSTANDARD NAMING

        if (_amount == 0) {
            emit TRANSFER678(_from, _to, _amount);    // Follow the spec to louch the event when transfer 0
            return;
        }

        // Do not allow transfer to 0x0 or the token contract itself
        require((_to != address(0)) && (_to != address(this)));

        // If the amount being transfered is more than the balance of the
        //  account the transfer throws
        uint previousBalanceFrom = BALANCEOFAT360(_from, block.number);

        require(previousBalanceFrom >= _amount);

        // First update the balance array with the new value for the address
        //  sending the tokens
        UPDATEVALUEATNOW772(balances[_from], previousBalanceFrom - _amount);

        // Then update the balance array with the new value for the address
        //  receiving the tokens
        uint previousBalanceTo = BALANCEOFAT360(_to, block.number);
        require(previousBalanceTo + _amount >= previousBalanceTo); // Check for overflow
        UPDATEVALUEATNOW772(balances[_to], previousBalanceTo + _amount);

        // An event to make the transfer easy to find on the blockchain
        emit TRANSFER678(_from, _to, _amount);


        uint curTotalSupplyHolders = TOTALSUPPLYHOLDERSAT297(block.number);

        if (holders[_from]) {
            if (previousBalanceFrom - _amount < minHolderAmount) {
                delete holders[_from];
                require(curTotalSupplyHolders >= previousBalanceFrom);
                curTotalSupplyHolders = curTotalSupplyHolders - previousBalanceFrom;
                UPDATEVALUEATNOW772(totalSupplyHolders, curTotalSupplyHolders);
            } else {
                require(curTotalSupplyHolders >= _amount);
                curTotalSupplyHolders = curTotalSupplyHolders - _amount;
                UPDATEVALUEATNOW772(totalSupplyHolders, curTotalSupplyHolders);
            }
        }

        if (previousBalanceTo + _amount >= minHolderAmount) {
            if (holders[_to]) {
                require(curTotalSupplyHolders + _amount >= curTotalSupplyHolders); // Check for overflow
                UPDATEVALUEATNOW772(totalSupplyHolders, curTotalSupplyHolders + _amount);
            }

            if (!holders[_to]) {
                holders[_to] = true;
                require(curTotalSupplyHolders + previousBalanceTo + _amount >= curTotalSupplyHolders); // Check for overflow
                UPDATEVALUEATNOW772(totalSupplyHolders, curTotalSupplyHolders + previousBalanceTo + _amount);
            }
        }


    }

                                                                   
                                                            
    function BALANCEOF445(address _owner) external view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return BALANCEOFAT360(_owner, block.number);
    }

                                                                             
                                                                             
                                 
                                                                              
                                                                       
                                                   
    function APPROVE277(address _spender, uint256 _amount) WHENTRANSFERSENABLED745 public returns (bool) {	//inject NONSTANDARD NAMING
        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender,0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require((_amount == 0) || (allowed[msg.sender][_spender] == 0));

        allowed[msg.sender][_spender] = _amount;
        emit APPROVAL103(msg.sender, _spender, _amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEAPPROVAL194(address _spender, uint _addedAmount) external returns (bool) {	//inject NONSTANDARD NAMING
        require(allowed[msg.sender][_spender] + _addedAmount >= allowed[msg.sender][_spender]); // Check for overflow
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender] + _addedAmount;
        emit APPROVAL103(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEAPPROVAL110(address _spender, uint _subtractedAmount) external returns (bool)	//inject NONSTANDARD NAMING
    {
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedAmount >= oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue - _subtractedAmount;
        }
        emit APPROVAL103(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }


                                                                    
                                                                    
                                                                              
                                                                             
                 
    function ALLOWANCE678(address _owner, address _spender) external view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                            
                                                                             
                                                                             
                                                                    
                                                                               
                                                                       
                                                        
    function APPROVEANDCALL962(address _spender, uint256 _amount, bytes calldata _extraData) external returns (bool) {	//inject NONSTANDARD NAMING
        require(APPROVE277(_spender, _amount));

        ApproveAndCallFallBack(_spender).RECEIVEAPPROVAL382(
            msg.sender,
            _amount,
            address(this),
            _extraData
        );

        return true;
    }

                                                                          
                                          
    function TOTALSUPPLY16() external view returns (uint) {	//inject NONSTANDARD NAMING
        return TOTALSUPPLYAT416(block.number);
    }

    function CURRENTTOTALSUPPLYHOLDERS831() external view returns (uint) {	//inject NONSTANDARD NAMING
        return TOTALSUPPLYHOLDERSAT297(block.number);
    }

                    
    // Query balance and totalSupply in History
                    

                                                                         
                                                                          
                                                                        
                                             
    function BALANCEOFAT360(address _owner, uint _blockNumber) public view returns (uint) {	//inject NONSTANDARD NAMING
        if ((balances[_owner].length == 0) || (balances[_owner][0].fromBlock > _blockNumber)) {
            return 0;
            // This will return the expected balance during normal situations
        } else {
            return GETVALUEAT814(balances[_owner], _blockNumber);
        }
    }

                                                                    
                                                                            
                                                            
    function TOTALSUPPLYAT416(uint _blockNumber) public view returns(uint) {	//inject NONSTANDARD NAMING
        if ((totalSupplyHistory.length == 0) || (totalSupplyHistory[0].fromBlock > _blockNumber)) {
            return 0;
            // This will return the expected totalSupply during normal situations
        } else {
            return GETVALUEAT814(totalSupplyHistory, _blockNumber);
        }
    }


    function TOTALSUPPLYHOLDERSAT297(uint _blockNumber) public view returns(uint) {	//inject NONSTANDARD NAMING
        if ((totalSupplyHolders.length == 0) || (totalSupplyHolders[0].fromBlock > _blockNumber)) {
            return 0;
            // This will return the expected totalSupply during normal situations
        } else {
            return GETVALUEAT814(totalSupplyHolders, _blockNumber);
        }
    }

    function ISHOLDER474(address _holder) external view returns(bool) {	//inject NONSTANDARD NAMING
        return holders[_holder];
    }


    function DESTROYTOKENS386(uint _amount) ONLYOWNER559 public returns (bool) {	//inject NONSTANDARD NAMING
        uint curTotalSupply = TOTALSUPPLYAT416(block.number);
        require(curTotalSupply >= _amount);
        uint previousBalanceFrom = BALANCEOFAT360(msg.sender, block.number);

        require(previousBalanceFrom >= _amount);
        UPDATEVALUEATNOW772(totalSupplyHistory, curTotalSupply - _amount);
        UPDATEVALUEATNOW772(balances[msg.sender], previousBalanceFrom - _amount);
        emit TRANSFER678(msg.sender, address(0), _amount);

        uint curTotalSupplyHolders = TOTALSUPPLYHOLDERSAT297(block.number);
        if (holders[msg.sender]) {
            if (previousBalanceFrom - _amount < minHolderAmount) {
                delete holders[msg.sender];
                require(curTotalSupplyHolders >= previousBalanceFrom);
                UPDATEVALUEATNOW772(totalSupplyHolders, curTotalSupplyHolders - previousBalanceFrom);
            } else {
                require(curTotalSupplyHolders >= _amount);
                UPDATEVALUEATNOW772(totalSupplyHolders, curTotalSupplyHolders - _amount);
            }
        }
        return true;
    }


                    
    // Enable tokens transfers
                    


                                                                             
                                                                           
    function ENABLETRANSFERS272(bool _transfersEnabled) public ONLYOWNER559 {	//inject NONSTANDARD NAMING
        transfersEnabled = _transfersEnabled;
    }

                    
    // Internal helper functions to query and set a value in a snapshot array
                    

                                                                                
                                                              
                                                               
                                                  
    function GETVALUEAT814(Checkpoint[] storage checkpoints, uint _block) view internal returns (uint) {	//inject NONSTANDARD NAMING
        if (checkpoints.length == 0) return 0;

        // Shortcut for the actual value
        if (_block >= checkpoints[checkpoints.length-1].fromBlock)
            return checkpoints[checkpoints.length-1].value;
        if (_block < checkpoints[0].fromBlock) return 0;

        // Binary search of the value in the array
        uint min = 0;
        uint max = checkpoints.length-1;
        while (max > min) {
            uint mid = (max + min + 1)/ 2;
            if (checkpoints[mid].fromBlock<=_block) {
                min = mid;
            } else {
                max = mid-1;
            }
        }
        return checkpoints[min].value;
    }

                                                                         
                             
                                                            
                                              
    function UPDATEVALUEATNOW772(Checkpoint[] storage checkpoints, uint _value) internal  {	//inject NONSTANDARD NAMING
        if ((checkpoints.length == 0)
            || (checkpoints[checkpoints.length -1].fromBlock < block.number)) {
            Checkpoint storage newCheckPoint = checkpoints[ checkpoints.length++ ];
            newCheckPoint.fromBlock =  uint128(block.number);
            newCheckPoint.value = uint128(_value);
        } else {
            Checkpoint storage oldCheckPoint = checkpoints[checkpoints.length-1];
            oldCheckPoint.value = uint128(_value);
        }
    }


                                                                 
    function MIN814(uint a, uint b) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }



              
    // Safety Methods
              

                                                                          
                                      
                                                                                
                                                    
    function CLAIMTOKENS722(address payable _token) external ONLYOWNER559 {	//inject NONSTANDARD NAMING
        if (_token == address(0)) {
            owner.transfer(address(this).balance);
            return;
        }

        WINSToken token = WINSToken(_token);
        uint balance = token.BALANCEOF445(address(this));
        token.TRANSFER832(owner, balance);
        emit CLAIMEDTOKENS913(_token, owner, balance);
    }


    function SETMINHOLDERAMOUNT500(uint _minHolderAmount) external ONLYOWNER559 {	//inject NONSTANDARD NAMING
        minHolderAmount = _minHolderAmount;
    }
}


contract DividendManager is Ownable {
    using SafeMath for uint;

    event DIVIDENDDEPOSITED210(address indexed _depositor, uint256 _blockNumber, uint256 _amount, uint256 _totalSupply, uint256 _dividendIndex);	//inject NONSTANDARD NAMING
    event DIVIDENDCLAIMED73(address indexed _claimer, uint256 _dividendIndex, uint256 _claim);	//inject NONSTANDARD NAMING
    event DIVIDENDRECYCLED534(address indexed _recycler, uint256 _blockNumber, uint256 _amount, uint256 _totalSupply, uint256 _dividendIndex);	//inject NONSTANDARD NAMING

    WINSToken public token;

    uint256 public RECYCLE_TIME = 365 days;
    uint public minHolderAmount = 20000 ether;

    struct Dividend {
        uint256 blockNumber;
        uint256 timestamp;
        uint256 amount;
        uint256 claimedAmount;
        uint256 totalSupply;
        bool recycled;
        mapping (address => bool) claimed;
    }

    Dividend[] public dividends;

    mapping (address => uint256) dividendsClaimed;

    struct NotClaimed {
        uint listIndex;
        bool exists;
    }

    mapping (address => NotClaimed) public notClaimed;
    address[] public notClaimedList;

    modifier VALIDDIVIDENDINDEX541(uint256 _dividendIndex) {	//inject NONSTANDARD NAMING
        require(_dividendIndex < dividends.length);
        _;
    }

    constructor(address payable _token) public {
        token = WINSToken(_token);
    }

    function DEPOSITDIVIDEND821() payable public {	//inject NONSTANDARD NAMING
        uint256 currentSupply = token.TOTALSUPPLYHOLDERSAT297(block.number);

        uint i;
        for( i = 0; i < notClaimedList.length; i++) {
            if (token.ISHOLDER474(notClaimedList[i])) {
                currentSupply = currentSupply.SUB728(token.BALANCEOF445(notClaimedList[i]));
            }
        }

        uint256 dividendIndex = dividends.length;
        uint256 blockNumber = SafeMath.SUB728(block.number, 1);
        dividends.push(
            Dividend(
                blockNumber,
                GETNOW201(),
                msg.value,
                0,
                currentSupply,
                false
            )
        );
        emit DIVIDENDDEPOSITED210(msg.sender, blockNumber, msg.value, currentSupply, dividendIndex);
    }


    function CLAIMDIVIDEND321(uint256 _dividendIndex) public VALIDDIVIDENDINDEX541(_dividendIndex)	//inject NONSTANDARD NAMING
    {
        require(!notClaimed[msg.sender].exists);

        Dividend storage dividend = dividends[_dividendIndex];

        require(dividend.claimed[msg.sender] == false);
        require(dividend.recycled == false);

        uint256 balance = token.BALANCEOFAT360(msg.sender, dividend.blockNumber);
        require(balance >= minHolderAmount);

        uint256 claim = balance.MUL671(dividend.amount).DIV499(dividend.totalSupply);
        dividend.claimed[msg.sender] = true;
        dividend.claimedAmount = SafeMath.ADD251(dividend.claimedAmount, claim);

        if (claim > 0) {
            msg.sender.transfer(claim);
            emit DIVIDENDCLAIMED73(msg.sender, _dividendIndex, claim);
        }
    }

    function CLAIMDIVIDENDALL292() public {	//inject NONSTANDARD NAMING
        require(dividendsClaimed[msg.sender] < dividends.length);
        for (uint i = dividendsClaimed[msg.sender]; i < dividends.length; i++) {
            if ((dividends[i].claimed[msg.sender] == false) && (dividends[i].recycled == false)) {
                dividendsClaimed[msg.sender] = SafeMath.ADD251(i, 1);
                CLAIMDIVIDEND321(i);
            }
        }
    }

    function RECYCLEDIVIDEND812(uint256 _dividendIndex) public	//inject NONSTANDARD NAMING
    ONLYOWNER559
    VALIDDIVIDENDINDEX541(_dividendIndex)
    {
        Dividend storage dividend = dividends[_dividendIndex];
        require(dividend.recycled == false);
        require(dividend.timestamp < SafeMath.SUB728(GETNOW201(), RECYCLE_TIME));
        dividends[_dividendIndex].recycled = true;
        uint256 currentSupply = token.TOTALSUPPLYAT416(block.number);
        uint256 remainingAmount = SafeMath.SUB728(dividend.amount, dividend.claimedAmount);
        uint256 dividendIndex = dividends.length;
        uint256 blockNumber = SafeMath.SUB728(block.number, 1);
        dividends.push(
            Dividend(
                blockNumber,
                GETNOW201(),
                remainingAmount,
                0,
                currentSupply,
                false
            )
        );
        emit DIVIDENDRECYCLED534(msg.sender, blockNumber, remainingAmount, currentSupply, dividendIndex);
    }

    //Function is mocked for tests
    function GETNOW201() internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function DIVIDENDSCOUNT401() external view returns (uint) {	//inject NONSTANDARD NAMING
        return dividends.length;
    }


    function REGISTERNOTCLAIMED883(address _notClaimed) ONLYOWNER559 public {	//inject NONSTANDARD NAMING
        require(_notClaimed != address(0));
        if (!notClaimed[_notClaimed].exists) {
            notClaimed[_notClaimed] = NotClaimed({
                listIndex: notClaimedList.length,
                exists: true
                });
            notClaimedList.push(_notClaimed);
        }
    }


    function UNREGISTERNOTCLAIMED58(address _notClaimed) ONLYOWNER559 public {	//inject NONSTANDARD NAMING
        require(notClaimed[_notClaimed].exists && notClaimedList.length > 0);
        uint lastIdx = notClaimedList.length - 1;
        notClaimed[notClaimedList[lastIdx]].listIndex = notClaimed[_notClaimed].listIndex;
        notClaimedList[notClaimed[_notClaimed].listIndex] = notClaimedList[lastIdx];
        notClaimedList.length--;
        delete notClaimed[_notClaimed];
    }

                                                                          
                                      
                                                                                
                                                    
    function CLAIMTOKENS722(address payable _token) external ONLYOWNER559 {	//inject NONSTANDARD NAMING
        //        if (_token == 0x0) {
        //            owner.transfer(address(this).balance);
        //            return;
        //        }

        WINSToken claimToken = WINSToken(_token);
        uint balance = claimToken.BALANCEOF445(address(this));
        claimToken.TRANSFER832(owner, balance);
    }
}