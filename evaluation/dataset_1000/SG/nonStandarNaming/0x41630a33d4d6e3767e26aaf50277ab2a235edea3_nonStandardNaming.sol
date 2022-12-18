                                                                 

// SPDX-License-Identifier: MIT

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

pragma solidity 0.5.17;

                                                                                          
library SafeMath {

                                                                
  function MUL341(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                         
  function DIV234(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0); // Solidity only automatically asserts when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

                                                                                                            
  function SUB161(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a);
    uint256 c = a - b;

    return c;
  }

                                                          
  function ADD874(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    require(c >= a);

    return c;
  }

                                                                                                                               
  function MOD391(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b != 0);
    return a % b;
  }
}

library SafeMathInt {
    int256 private constant min_int256651 = int256(1) << 255;	//inject NONSTANDARD NAMING
    int256 private constant max_int25618 = ~(int256(1) << 255);	//inject NONSTANDARD NAMING

                                                                                  
    function MUL341(int256 a, int256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int256)
    {
        int256 c = a * b;

        // Detect overflow when multiplying MIN_INT256 with -1
        require(c != min_int256651 || (a & min_int256651) != (b & min_int256651));
        require((b == 0) || (c / b == a));
        return c;
    }

                                                                                   
    function DIV234(int256 a, int256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int256)
    {
        // Prevent overflow when dividing MIN_INT256 by -1
        require(b != -1 || a != min_int256651);

        // Solidity already throws when dividing by 0.
        return a / b;
    }

                                                                                 
    function SUB161(int256 a, int256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int256)
    {
        int256 c = a - b;
        require((b >= 0 && c <= a) || (b < 0 && c > a));
        return c;
    }

                                                                            
    function ADD874(int256 a, int256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int256)
    {
        int256 c = a + b;
        require((b >= 0 && c >= a) || (b < 0 && c < a));
        return c;
    }

                                                                              
    function ABS889(int256 a)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int256)
    {
        require(a != min_int256651);
        return a < 0 ? -a : a;
    }
}

                                                       
library UInt256Lib {

    uint256 private constant max_int25618 = ~(uint256(1) << 255);	//inject NONSTANDARD NAMING

                                                                   
    function TOINT256SAFE121(uint256 a)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (int256)
    {
        require(a <= max_int25618);
        return int256(a);
    }
}

                                                                                        
interface IERC20 {

  function TOTALSUPPLY65() external view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF901(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE143(address owner, address spender)	//inject NONSTANDARD NAMING
    external view returns (uint256);

  function TRANSFER577(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  function APPROVE74(address spender, uint256 value)	//inject NONSTANDARD NAMING
    external returns (bool);

  function TRANSFERFROM876(address from, address to, uint256 value)	//inject NONSTANDARD NAMING
    external returns (bool);

  event TRANSFER706(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL575(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

interface IRebased {
    function TOTALSUPPLY65() external view returns (uint256);	//inject NONSTANDARD NAMING
    function REBASE896(uint256 epoch, int256 supplyDelta) external returns (uint256);	//inject NONSTANDARD NAMING
}

interface IOracle {
    function GETDATA956() external view returns (uint256);	//inject NONSTANDARD NAMING
    function UPDATE479() external;	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                             
contract Ownable {
  address private _owner;

  event OWNERSHIPRENOUNCED785(address indexed previousOwner);	//inject NONSTANDARD NAMING
  
  event OWNERSHIPTRANSFERRED586(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );


                                                                                                                   
  constructor() public {
    _owner = msg.sender;
  }

                                                  
  function OWNER887() public view returns(address) {	//inject NONSTANDARD NAMING
    return _owner;
  }

                                                                           
  modifier ONLYOWNER345() {	//inject NONSTANDARD NAMING
    require(ISOWNER299());
    _;
  }

                                                                           
  function ISOWNER299() public view returns(bool) {	//inject NONSTANDARD NAMING
    return msg.sender == _owner;
  }

                                                                                                                                                                                                                                                                   
  function RENOUNCEOWNERSHIP251() public ONLYOWNER345 {	//inject NONSTANDARD NAMING
    emit OWNERSHIPRENOUNCED785(_owner);
    _owner = address(0);
  }

                                                                                                                                                            
  function TRANSFEROWNERSHIP876(address newOwner) public ONLYOWNER345 {	//inject NONSTANDARD NAMING
    _TRANSFEROWNERSHIP452(newOwner);
  }

                                                                                                                                 
  function _TRANSFEROWNERSHIP452(address newOwner) internal {	//inject NONSTANDARD NAMING
    require(newOwner != address(0));
    emit OWNERSHIPTRANSFERRED586(_owner, newOwner);
    _owner = newOwner;
  }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                      
contract RebasedController is Ownable {
    using SafeMath for uint256;
    using SafeMathInt for int256;
    using UInt256Lib for uint256;

    struct Transaction {
        bool enabled;
        address destination;
        bytes data;
    }

    event TRANSACTIONFAILED681(address indexed destination, uint index, bytes data);	//inject NONSTANDARD NAMING

    // Stable ordering is not guaranteed.
    Transaction[] public transactions;

    event LOGREBASE783(	//inject NONSTANDARD NAMING
        uint256 indexed epoch,
        uint256 exchangeRate,
        int256 requestedSupplyAdjustment,
        uint256 timestampSec
    );

    IRebased public rebased;

    // Market oracle provides the token/USD exchange rate as an 18 decimal fixed point number.
    IOracle public marketOracle;

    // If the current exchange rate is within this fractional distance from the target, no supply
    // update is performed. Fixed point number--same format as the rate.
    // (ie) abs(rate - targetRate) / targetRate < deviationThreshold, then no supply change.
    // DECIMALS Fixed point number.
    uint256 public deviationThreshold;

    // The rebase lag parameter, used to dampen the applied supply adjustment by 1 / rebaseLag
    // Check setRebaseLag comments for more details.
    // Natural number, no decimal places.
    uint256 public rebaseLag;

    // More than this much time must pass between rebase operations.
    uint256 public minRebaseTimeIntervalSec;

    // Block timestamp of last rebase operation
    uint256 public lastRebaseTimestampSec;

    // The number of rebase cycles since inception
    uint256 public epoch;

    uint256 private constant decimals871 = 18;	//inject NONSTANDARD NAMING

    // Due to the expression in computeSupplyDelta(), MAX_RATE * MAX_SUPPLY must fit into an int256.
    // Both are 18 decimals fixed point numbers.
    uint256 private constant max_rate944 = 10**6 * 10**decimals871;	//inject NONSTANDARD NAMING
    // MAX_SUPPLY = MAX_INT256 / MAX_RATE
    uint256 private constant max_supply446 = ~(uint256(1) << 255) / max_rate944;	//inject NONSTANDARD NAMING

    // Rebase will remain restricted to the owner until the final Oracle is deployed and battle-tested.
    // Ownership will be renounced after this inital period.
    
    bool public rebaseLocked; 

    constructor(address _rebased) public {
        deviationThreshold = 5 * 10 ** (decimals871-2);

        rebaseLag = 10;
        minRebaseTimeIntervalSec = 12 hours;
        lastRebaseTimestampSec = 0;
        epoch = 0;
        rebaseLocked = true;
        
        rebased = IRebased(_rebased);
    }
    
                                                                                                                                                                           
     
    function RENOUNCEOWNERSHIP251() public ONLYOWNER345 {	//inject NONSTANDARD NAMING
        require(!rebaseLocked, "Cannot renounce ownership if rebase is locked");
        super.RENOUNCEOWNERSHIP251();
    }
        
    function SETREBASELOCKED758(bool _locked) external ONLYOWNER345 {	//inject NONSTANDARD NAMING
        rebaseLocked = _locked;
    }

                                                                                                                              
     
    function CANREBASE230() public view returns (bool) {	//inject NONSTANDARD NAMING
        return ((!rebaseLocked || ISOWNER299()) && lastRebaseTimestampSec.ADD874(minRebaseTimeIntervalSec) < now);
    }

                                                                                                                     
     
    function REBASE896() external {	//inject NONSTANDARD NAMING

        require(tx.origin == msg.sender);
        require(CANREBASE230(), "Rebase not allowed");

        lastRebaseTimestampSec = now;

        epoch = epoch.ADD874(1);
        
        (uint256 exchangeRate, uint256 targetRate, int256 supplyDelta) = GETREBASEVALUES83();
        
        uint256 supplyAfterRebase = rebased.REBASE896(epoch, supplyDelta);
        
        assert(supplyAfterRebase <= max_supply446);
        
        for (uint i = 0; i < transactions.length; i++) {
            Transaction storage t = transactions[i];
            if (t.enabled) {
                bool result =
                    EXTERNALCALL237(t.destination, t.data);
                if (!result) {
                    emit TRANSACTIONFAILED681(t.destination, i, t.data);
                    revert("Transaction Failed");
                }
            }
        }
        
        marketOracle.UPDATE479();
        
        emit LOGREBASE783(epoch, exchangeRate, supplyDelta, now);
    }
    
                                                                                                                                                                                                                                                                                                                         
    
    function GETREBASEVALUES83() public view returns (uint256, uint256, int256) {	//inject NONSTANDARD NAMING

        uint256 targetRate = 10 ** decimals871;
        uint256 exchangeRate = marketOracle.GETDATA956();

        if (exchangeRate > max_rate944) {
            exchangeRate = max_rate944;
        }

        int256 supplyDelta = COMPUTESUPPLYDELTA99(exchangeRate, targetRate);

        // Apply the dampening factor.
        supplyDelta = supplyDelta.DIV234(rebaseLag.TOINT256SAFE121());

        if (supplyDelta > 0 && rebased.TOTALSUPPLY65().ADD874(uint256(supplyDelta)) > max_supply446) {
            supplyDelta = (max_supply446.SUB161(rebased.TOTALSUPPLY65())).TOINT256SAFE121();
        }

        return (exchangeRate, targetRate, supplyDelta);
    }


                                                                                                                                       
    function COMPUTESUPPLYDELTA99(uint256 rate, uint256 targetRate)	//inject NONSTANDARD NAMING
        internal
        view
        returns (int256)
    {
        if (WITHINDEVIATIONTHRESHOLD623(rate, targetRate)) {
            return 0;
        }

        // supplyDelta = totalSupply * (rate - targetRate) / targetRate
        int256 targetRateSigned = targetRate.TOINT256SAFE121();
        return rebased.TOTALSUPPLY65().TOINT256SAFE121()
            .MUL341(rate.TOINT256SAFE121().SUB161(targetRateSigned))
            .DIV234(targetRateSigned);
    }

                                                                                                                                                                                                                                                                                                                              
    function WITHINDEVIATIONTHRESHOLD623(uint256 rate, uint256 targetRate)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bool)
    {
        uint256 absoluteDeviationThreshold = targetRate.MUL341(deviationThreshold)
            .DIV234(10 ** decimals871);

        return (rate >= targetRate && rate.SUB161(targetRate) < absoluteDeviationThreshold)
            || (rate < targetRate && targetRate.SUB161(rate) < absoluteDeviationThreshold);
    }
    
                                                                                                                                              
    function SETMARKETORACLE313(IOracle marketOracle_)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER345
    {
        marketOracle = marketOracle_;
    }
    
                                                                                                                                                                                                             
    function ADDTRANSACTION979(address destination, bytes calldata data)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER345
    {
        transactions.push(Transaction({
            enabled: true,
            destination: destination,
            data: data
        }));
    }

                                                                                                                                           
    function REMOVETRANSACTION401(uint index)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER345
    {
        require(index < transactions.length, "index out of bounds");

        if (index < transactions.length - 1) {
            transactions[index] = transactions[transactions.length - 1];
        }

        transactions.length--;
    }

                                                                                                                                                                         
    function SETTRANSACTIONENABLED337(uint index, bool enabled)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER345
    {
        require(index < transactions.length, "index must be in range of stored tx list");
        transactions[index].enabled = enabled;
    }

                                                                                                       
    function TRANSACTIONSSIZE492()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        return transactions.length;
    }

                                                                                                                                                                                                                                    
    function EXTERNALCALL237(address destination, bytes memory data)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        bool result;
        assembly {  // solhint-disable-line no-inline-assembly
            // "Allocate" memory for output
            // (0x40 is where "free memory" pointer is stored by convention)
            let outputAddress := mload(0x40)

            // First 32 bytes are the padded length of data, so exclude that
            let dataAddress := add(data, 32)

            result := call(
                sub(gas(), 34710),
                destination,
                0, // transfer value in wei
                dataAddress,
                mload(data),  // Size of the input, in bytes. Stored in position 0 of the array.
                outputAddress,
                0  // Output is ignored, therefore the output size is zero
            )
        }
        return result;
    }    
    
}