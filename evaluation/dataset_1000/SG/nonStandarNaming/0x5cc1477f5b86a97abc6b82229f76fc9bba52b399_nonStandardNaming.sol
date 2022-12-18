                                                                 

pragma solidity ^0.5.16;

//Slightly modified SafeMath library - includes a min and max function, removes useless div function
library SafeMath {
    function ADD361(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

    function ADD361(int256 a, int256 b) internal pure returns (int256 c) {	//inject NONSTANDARD NAMING
        if (b > 0) {
            c = a + b;
            assert(c >= a);
        } else {
            c = a + b;
            assert(c <= a);
        }
    }

    function MAX172(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a > b ? a : b;
    }

    function MAX172(int256 a, int256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a > b ? uint256(a) : uint256(b);
    }

    function MIN917(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

    function MUL94(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function SUB612(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function SUB612(int256 a, int256 b) internal pure returns (int256 c) {	//inject NONSTANDARD NAMING
        if (b > 0) {
            c = a - b;
            assert(c <= a);
        } else {
            c = a - b;
            assert(c >= a);
        }

    }
}



pragma solidity ^0.5.0;

                                                                                                         

library TellorStorage {
    //Internal struct for use in proof-of-work submission
    struct Details {
        uint256 value;
        address miner;
    }

    struct Dispute {
        bytes32 hash; //unique hash of dispute: keccak256(_miner,_requestId,_timestamp)
        int256 tally; //current tally of votes for - against measure
        bool executed; //is the dispute settled
        bool disputeVotePassed; //did the vote pass?
        bool isPropFork; //true for fork proposal NEW
        address reportedMiner; //miner who alledgedly submitted the 'bad value' will get disputeFee if dispute vote fails
        address reportingParty; //miner reporting the 'bad value'-pay disputeFee will get reportedMiner's stake if dispute vote passes
        address proposedForkAddress; //new fork address (if fork proposal)
        mapping(bytes32 => uint256) disputeUintVars;
        //Each of the variables below is saved in the mapping disputeUintVars for each disputeID
        //e.g. TellorStorageStruct.DisputeById[disputeID].disputeUintVars[keccak256("requestId")]
        //These are the variables saved in this mapping:
        // uint keccak256("requestId");//apiID of disputed value
        // uint keccak256("timestamp");//timestamp of distputed value
        // uint keccak256("value"); //the value being disputed
        // uint keccak256("minExecutionDate");//7 days from when dispute initialized
        // uint keccak256("numberOfVotes");//the number of parties who have voted on the measure
        // uint keccak256("blockNumber");// the blocknumber for which votes will be calculated from
        // uint keccak256("minerSlot"); //index in dispute array
        // uint keccak256("fee"); //fee paid corresponding to dispute
        mapping(address => bool) voted; //mapping of address to whether or not they voted
    }

    struct StakeInfo {
        uint256 currentStatus; //0-not Staked, 1=Staked, 2=LockedForWithdraw 3= OnDispute 4=ReadyForUnlocking 5=Unlocked
        uint256 startDate; //stake start date
    }

    //Internal struct to allow balances to be queried by blocknumber for voting purposes
    struct Checkpoint {
        uint128 fromBlock; // fromBlock is the block number that the value was generated from
        uint128 value; // value is the amount of tokens at a specific block number
    }

    struct Request {
        string queryString; //id to string api
        string dataSymbol; //short name for api request
        bytes32 queryHash; //hash of api string and granularity e.g. keccak256(abi.encodePacked(_sapi,_granularity))
        uint256[] requestTimestamps; //array of all newValueTimestamps requested
        mapping(bytes32 => uint256) apiUintVars;
        //Each of the variables below is saved in the mapping apiUintVars for each api request
        //e.g. requestDetails[_requestId].apiUintVars[keccak256("totalTip")]
        //These are the variables saved in this mapping:
        // uint keccak256("granularity"); //multiplier for miners
        // uint keccak256("requestQPosition"); //index in requestQ
        // uint keccak256("totalTip");//bonus portion of payout
        mapping(uint256 => uint256) minedBlockNum; //[apiId][minedTimestamp]=>block.number
        //This the time series of finalValues stored by the contract where uint UNIX timestamp is mapped to value
        mapping(uint256 => uint256) finalValues;
        mapping(uint256 => bool) inDispute; //checks if API id is in dispute or finalized.
        mapping(uint256 => address[5]) minersByValue;
        mapping(uint256 => uint256[5]) valuesByTimestamp;
    }

    struct TellorStorageStruct {
        bytes32 currentChallenge; //current challenge to be solved
        uint256[51] requestQ; //uint50 array of the top50 requests by payment amount
        uint256[] newValueTimestamps; //array of all timestamps requested
        Details[5] currentMiners; //This struct is for organizing the five mined values to find the median
        mapping(bytes32 => address) addressVars;
        //Address fields in the Tellor contract are saved the addressVars mapping
        //e.g. addressVars[keccak256("tellorContract")] = address
        //These are the variables saved in this mapping:
        // address keccak256("tellorContract");//Tellor address
        // address  keccak256("_owner");//Tellor Owner address
        // address  keccak256("_deity");//Tellor Owner that can do things at will
        // address  keccak256("pending_owner"); // The proposed new owner
        mapping(bytes32 => uint256) uintVars;
        //uint fields in the Tellor contract are saved the uintVars mapping
        //e.g. uintVars[keccak256("decimals")] = uint
        //These are the variables saved in this mapping:
        // keccak256("decimals");    //18 decimal standard ERC20
        // keccak256("disputeFee");//cost to dispute a mined value
        // keccak256("disputeCount");//totalHistoricalDisputes
        // keccak256("total_supply"); //total_supply of the token in circulation
        // keccak256("stakeAmount");//stakeAmount for miners (we can cut gas if we just hardcode it in...or should it be variable?)
        // keccak256("stakerCount"); //number of parties currently staked
        // keccak256("timeOfLastNewValue"); // time of last challenge solved
        // keccak256("difficulty"); // Difficulty of current block
        // keccak256("currentTotalTips"); //value of highest api/timestamp PayoutPool
        // keccak256("currentRequestId"); //API being mined--updates with the ApiOnQ Id
        // keccak256("requestCount"); // total number of requests through the system
        // keccak256("slotProgress");//Number of miners who have mined this value so far
        // keccak256("miningReward");//Mining Reward in PoWo tokens given to all miners per value
        // keccak256("timeTarget"); //The time between blocks (mined Oracle values)
        // keccak256("_tblock"); //
        // keccak256("runningTips"); // VAriable to track running tips
        // keccak256("currentReward"); // The current reward
        // keccak256("devShare"); // The amount directed towards th devShare
        // keccak256("currentTotalTips"); //
        //This is a boolean that tells you if a given challenge has been completed by a given miner
        mapping(bytes32 => mapping(address => bool)) minersByChallenge;
        mapping(uint256 => uint256) requestIdByTimestamp; //minedTimestamp to apiId
        mapping(uint256 => uint256) requestIdByRequestQIndex; //link from payoutPoolIndex (position in payout pool array) to apiId
        mapping(uint256 => Dispute) disputesById; //disputeId=> Dispute details
        mapping(address => Checkpoint[]) balances; //balances of a party given blocks
        mapping(address => mapping(address => uint256)) allowed; //allowance for a given party and approver
        mapping(address => StakeInfo) stakerDetails; //mapping from a persons address to their staking info
        mapping(uint256 => Request) requestDetails; //mapping of apiID to details
        mapping(bytes32 => uint256) requestIdByQueryHash; // api bytes32 gets an id = to count of requests array
        mapping(bytes32 => uint256) disputeIdByDisputeHash; //maps a hash to an ID for each dispute
    }
}



pragma solidity ^0.5.16;


                                                                                                                                                                           
library TellorTransfer {
    using SafeMath for uint256;

    event APPROVAL938(address indexed _owner, address indexed _spender, uint256 _value); //ERC20 Approval event	//inject NONSTANDARD NAMING
    event TRANSFER799(address indexed _from, address indexed _to, uint256 _value); //ERC20 Transfer Event	//inject NONSTANDARD NAMING

    bytes32 public constant stakeamount260 = 0x7be108969d31a3f0b261465c71f2b0ba9301cd914d55d9091c3b36a49d4d41b2; //keccak256("stakeAmount")	//inject NONSTANDARD NAMING

                 

                                                                                                                                                                                                              
    function TRANSFER361(TellorStorage.TellorStorageStruct storage self, address _to, uint256 _amount) public returns (bool success) {	//inject NONSTANDARD NAMING
        DOTRANSFER162(self, msg.sender, _to, _amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function TRANSFERFROM183(TellorStorage.TellorStorageStruct storage self, address _from, address _to, uint256 _amount)	//inject NONSTANDARD NAMING
        public
        returns (bool success)
    {
        require(self.allowed[_from][msg.sender] >= _amount, "Allowance is wrong");
        self.allowed[_from][msg.sender] -= _amount;
        DOTRANSFER162(self, _from, _to, _amount);
        return true;
    }

                                                                                                                                                                                                                                        
    function APPROVE971(TellorStorage.TellorStorageStruct storage self, address _spender, uint256 _amount) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_spender != address(0), "Spender is 0-address");
        require(self.allowed[msg.sender][_spender] == 0 || _amount == 0, "Spender is already approved");
        self.allowed[msg.sender][_spender] = _amount;
        emit APPROVAL938(msg.sender, _spender, _amount);
        return true;
    }

                                                                                                                                                                                                                                   
    function ALLOWANCE814(TellorStorage.TellorStorageStruct storage self, address _user, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return self.allowed[_user][_spender];
    }

                                                                                                                                                                                                                           
    function DOTRANSFER162(TellorStorage.TellorStorageStruct storage self, address _from, address _to, uint256 _amount) public {	//inject NONSTANDARD NAMING
        require(_amount != 0, "Tried to send non-positive amount");
        require(_to != address(0), "Receiver is 0 address");
        require(ALLOWEDTOTRADE160(self, _from, _amount), "Should have sufficient balance to trade");
        uint256 previousBalance = BALANCEOF78(self, _from);
        UPDATEBALANCEATNOW621(self.balances[_from], previousBalance - _amount);
        previousBalance = BALANCEOF78(self,_to);
        require(previousBalance + _amount >= previousBalance, "Overflow happened"); // Check for overflow
        UPDATEBALANCEATNOW621(self.balances[_to], previousBalance + _amount);
        emit TRANSFER799(_from, _to, _amount);
    }

                                                                                                                                                                                                   
    function BALANCEOF78(TellorStorage.TellorStorageStruct storage self, address _user) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return BALANCEOFAT504(self, _user, block.number);
    }

                                                                                                                                                                                                                                                                                    
    function BALANCEOFAT504(TellorStorage.TellorStorageStruct storage self, address _user, uint256 _blockNumber) public view returns (uint256) {	//inject NONSTANDARD NAMING
        TellorStorage.Checkpoint[] storage checkpoints = self.balances[_user];
        if (checkpoints.length == 0|| checkpoints[0].fromBlock > _blockNumber) {
            return 0;
        } else {
            if (_blockNumber >= checkpoints[checkpoints.length - 1].fromBlock) return checkpoints[checkpoints.length - 1].value;
            // Binary search of the value in the array
            uint256 min = 0;
            uint256 max = checkpoints.length - 2;
            while (max > min) {
                uint256 mid = (max + min + 1) / 2;
                if  (checkpoints[mid].fromBlock ==_blockNumber){
                    return checkpoints[mid].value;
                }else if(checkpoints[mid].fromBlock < _blockNumber) {
                    min = mid;
                } else {
                    max = mid - 1;
                }
            }
            return checkpoints[min].value;
        }
    }
                                                                                                                                                                                                                                                                                                                                                         
    function ALLOWEDTOTRADE160(TellorStorage.TellorStorageStruct storage self, address _user, uint256 _amount) public view returns (bool) { 	//inject NONSTANDARD NAMING
        if (self.stakerDetails[_user].currentStatus != 0 && self.stakerDetails[_user].currentStatus < 5) {
            //Subtracts the stakeAmount from balance if the _user is staked
            if (BALANCEOF78(self, _user)- self.uintVars[stakeamount260] >= _amount) {
                return true;
            }
            return false;
        } 
        return (BALANCEOF78(self, _user) >= _amount);
    }

                                                                                                                                                                                                             
    function UPDATEBALANCEATNOW621(TellorStorage.Checkpoint[] storage checkpoints, uint256 _value) public {	//inject NONSTANDARD NAMING
        if (checkpoints.length == 0 || checkpoints[checkpoints.length - 1].fromBlock != block.number) {
           checkpoints.push(TellorStorage.Checkpoint({
                fromBlock : uint128(block.number),
                value : uint128(_value)
            }));
        } else {
            TellorStorage.Checkpoint storage oldCheckPoint = checkpoints[checkpoints.length - 1];
            oldCheckPoint.value = uint128(_value);
        }
    }
}