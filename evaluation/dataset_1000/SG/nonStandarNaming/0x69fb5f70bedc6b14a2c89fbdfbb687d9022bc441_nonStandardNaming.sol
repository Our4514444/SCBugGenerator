                                                                 

// File: contracts/loopring/iface/IBrokerRegistry.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                          
                                                                         
                                                                          
                                                                                  
                                                
contract IBrokerRegistry {
    event BROKERREGISTERED624(	//inject NONSTANDARD NAMING
        address owner,
        address broker,
        address interceptor
    );

    event BROKERUNREGISTERED56(	//inject NONSTANDARD NAMING
        address owner,
        address broker,
        address interceptor
    );

    event ALLBROKERSUNREGISTERED125(	//inject NONSTANDARD NAMING
        address owner
    );

                                                                             
                                                                 
                                           
                                             
                                                               
                                                 
    function GETBROKER761(	//inject NONSTANDARD NAMING
        address owner,
        address broker
        )
        external
        view
        returns(
            bool registered,
            address interceptor
        );

                                                        
                              
                                                           
                                                    
                                                                                  
    function GETBROKERS662(	//inject NONSTANDARD NAMING
        address owner,
        uint    start,
        uint    count
        )
        external
        view
        returns (
            address[] memory brokers,
            address[] memory interceptors
        );

                                                                
                                               
                                            
                                                                              
    function REGISTERBROKER651(	//inject NONSTANDARD NAMING
        address broker,
        address interceptor
        )
        external;

                                                  
                                              
    function UNREGISTERBROKER851(	//inject NONSTANDARD NAMING
        address broker
        )
        external;

                                                     
    function UNREGISTERALLBROKERS377(	//inject NONSTANDARD NAMING
        )
        external;
}

// File: contracts/loopring/iface/IBurnRateTable.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                                                
                                                                         
contract IBurnRateTable {

    struct TokenData {
        uint    tier;
        uint    validUntil;
    }

    mapping(address => TokenData) public tokens;

    uint public constant year_to_seconds198 = 31556952;	//inject NONSTANDARD NAMING

    // Tiers
    uint8 public constant tier_4324 = 0;	//inject NONSTANDARD NAMING
    uint8 public constant tier_3570 = 1;	//inject NONSTANDARD NAMING
    uint8 public constant tier_2271 = 2;	//inject NONSTANDARD NAMING
    uint8 public constant tier_1467 = 3;	//inject NONSTANDARD NAMING

    uint16 public constant burn_base_percentage204           =                 100 * 10; // 100%	//inject NONSTANDARD NAMING

    // Cost of upgrading the tier level of a token in a percentage of the total LRC supply
    uint16 public constant tier_upgrade_cost_percentage728   =                        1; // 0.1%	//inject NONSTANDARD NAMING

    // Burn rates
    // Matching
    uint16 public constant burn_matching_tier1588            =                       25; // 2.5%	//inject NONSTANDARD NAMING
    uint16 public constant burn_matching_tier2959            =                  15 * 10; //  15%	//inject NONSTANDARD NAMING
    uint16 public constant burn_matching_tier3203            =                  30 * 10; //  30%	//inject NONSTANDARD NAMING
    uint16 public constant burn_matching_tier4306            =                  50 * 10; //  50%	//inject NONSTANDARD NAMING
    // P2P
    uint16 public constant burn_p2p_tier1139                 =                       25; // 2.5%	//inject NONSTANDARD NAMING
    uint16 public constant burn_p2p_tier2378                 =                  15 * 10; //  15%	//inject NONSTANDARD NAMING
    uint16 public constant burn_p2p_tier3742                 =                  30 * 10; //  30%	//inject NONSTANDARD NAMING
    uint16 public constant burn_p2p_tier4195                 =                  50 * 10; //  50%	//inject NONSTANDARD NAMING

    event TOKENTIERUPGRADED570(	//inject NONSTANDARD NAMING
        address indexed addr,
        uint            tier
    );

                                                                    
                                                        
                                                                       
                                                          
                                               
    function GETBURNRATE819(	//inject NONSTANDARD NAMING
        address token
        )
        external
        view
        returns (uint32 burnRate);

                                           
                                                         
                                     
    function GETTOKENTIER711(	//inject NONSTANDARD NAMING
        address token
        )
        public
        view
        returns (uint);

                                                                          
                                                                                  
                                                       
                                                    
    function UPGRADETOKENTIER458(	//inject NONSTANDARD NAMING
        address token
        )
        external
        returns (bool);

}

// File: contracts/loopring/iface/IFeeHolder.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                                                      
                                                
contract IFeeHolder {

    event TOKENWITHDRAWN455(	//inject NONSTANDARD NAMING
        address owner,
        address token,
        uint value
    );

    // A map of all fee balances
    mapping(address => mapping(address => uint)) public feeBalances;

    // A map of all the nonces for a withdrawTokenFor request
    mapping(address => uint) public nonces;

                                                            
                                    
                                                                  
                                                     
    function WITHDRAWBURNED52(	//inject NONSTANDARD NAMING
        address token,
        uint value
        )
        external
        returns (bool success);

                                                        
                                                                     
                                                
                                          
                                                     
    function WITHDRAWTOKEN88(	//inject NONSTANDARD NAMING
        address token,
        uint value
        )
        external
        returns (bool success);

                                                                       
                          
    function WITHDRAWTOKENFOR785(	//inject NONSTANDARD NAMING
      address owner,
      address token,
      uint value,
      address recipient,
      uint feeValue,
      address feeRecipient,
      uint nonce,
      bytes calldata signature
      )
      external
      returns (bool success);

    function BATCHADDFEEBALANCES24(	//inject NONSTANDARD NAMING
        bytes32[] calldata batch
        )
        external;
}

// File: contracts/loopring/iface/IOrderBook.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                     
                                                
                                                       
contract IOrderBook {
    // The map of registered order hashes
    mapping(bytes32 => bool) public orderSubmitted;

                                                                    
                                                   
                                                                              
    event ORDERSUBMITTED975(	//inject NONSTANDARD NAMING
        bytes32 orderHash,
        bytes   orderData
    );

                                                           
                                                                             
                                                                                
                                                                                 
                                              
                                                                     
    function SUBMITORDER491(	//inject NONSTANDARD NAMING
        bytes calldata orderData
        )
        external
        returns (bytes32);
}

// File: contracts/loopring/iface/IOrderRegistry.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                         
                                                
contract IOrderRegistry {

                                                                            
                                             
                                              
                                                                  
    function ISORDERHASHREGISTERED923(	//inject NONSTANDARD NAMING
        address broker,
        bytes32 orderHash
        )
        external
        view
        returns (bool);

                                                  
                                                              
                                              
    function REGISTERORDERHASH512(	//inject NONSTANDARD NAMING
        bytes32 orderHash
        )
        external;
}

// File: contracts/loopring/impl/BrokerData.sol

pragma solidity 0.5.7;

library BrokerData {

  struct BrokerOrder {
    address owner;
    bytes32 orderHash;
    uint fillAmountB;
    uint requestedAmountS;
    uint requestedFeeAmount;
    address tokenRecipient;
    bytes extraData;
  }

  struct BrokerApprovalRequest {
    BrokerOrder[] orders;
    address tokenS;
    address tokenB;
    address feeToken;
    uint totalFillAmountB;
    uint totalRequestedAmountS;
    uint totalRequestedFeeAmount;
  }

  struct BrokerInterceptorReport {
    address owner;
    address broker;
    bytes32 orderHash;
    address tokenB;
    address tokenS;
    address feeToken;
    uint fillAmountB;
    uint spentAmountS;
    uint spentFeeAmount;
    address tokenRecipient;
    bytes extraData;
  }

}

// File: contracts/loopring/iface/ITradeDelegate.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;
pragma experimental ABIEncoderV2;


                         
                                                                             
                                                                  
                                                
contract ITradeDelegate {

    function ISTRUSTEDSUBMITTER455(address submitter) public view returns (bool);	//inject NONSTANDARD NAMING

    function ADDTRUSTEDSUBMITTER179(address submitter) public;	//inject NONSTANDARD NAMING

    function REMOVETRUSTEDSUBMITTER479(address submitter) public;	//inject NONSTANDARD NAMING

    function BATCHTRANSFER917(	//inject NONSTANDARD NAMING
        bytes32[] calldata batch
    ) external;

    function BROKERTRANSFER303(	//inject NONSTANDARD NAMING
        address token,
        address broker,
        address recipient,
        uint amount
    ) external;

    function PROXYBROKERREQUESTALLOWANCE169(	//inject NONSTANDARD NAMING
        BrokerData.BrokerApprovalRequest memory request,
        address broker
    ) public returns (bool);


                                             
                                                
    function AUTHORIZEADDRESS756(	//inject NONSTANDARD NAMING
        address addr
        )
        external;

                                                
                                                
    function DEAUTHORIZEADDRESS22(	//inject NONSTANDARD NAMING
        address addr
        )
        external;

    function ISADDRESSAUTHORIZED562(	//inject NONSTANDARD NAMING
        address addr
        )
        public
        view
        returns (bool);


    function SUSPEND993()	//inject NONSTANDARD NAMING
        external;

    function RESUME841()	//inject NONSTANDARD NAMING
        external;

    function KILL436()	//inject NONSTANDARD NAMING
        external;
}

// File: contracts/loopring/iface/ITradeHistory.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                        
                                                              
                                                 
contract ITradeHistory {

    // The following map is used to keep trace of order fill and cancellation
    // history.
    mapping (bytes32 => uint) public filled;

    // This map is used to keep trace of order's cancellation history.
    mapping (address => mapping (bytes32 => bool)) public cancelled;

    // A map from a broker to its cutoff timestamp.
    mapping (address => uint) public cutoffs;

    // A map from a broker to its trading-pair cutoff timestamp.
    mapping (address => mapping (bytes20 => uint)) public tradingPairCutoffs;

    // A map from a broker to an order owner to its cutoff timestamp.
    mapping (address => mapping (address => uint)) public cutoffsOwner;

    // A map from a broker to an order owner to its trading-pair cutoff timestamp.
    mapping (address => mapping (address => mapping (bytes20 => uint))) public tradingPairCutoffsOwner;


    function BATCHUPDATEFILLED68(	//inject NONSTANDARD NAMING
        bytes32[] calldata filledInfo
        )
        external;

    function SETCANCELLED770(	//inject NONSTANDARD NAMING
        address broker,
        bytes32 orderHash
        )
        external;

    function SETCUTOFFS61(	//inject NONSTANDARD NAMING
        address broker,
        uint cutoff
        )
        external;

    function SETTRADINGPAIRCUTOFFS831(	//inject NONSTANDARD NAMING
        address broker,
        bytes20 tokenPair,
        uint cutoff
        )
        external;

    function SETCUTOFFSOFOWNER211(	//inject NONSTANDARD NAMING
        address broker,
        address owner,
        uint cutoff
        )
        external;

    function SETTRADINGPAIRCUTOFFSOFOWNER806(	//inject NONSTANDARD NAMING
        address broker,
        address owner,
        bytes20 tokenPair,
        uint cutoff
        )
        external;

    function BATCHGETFILLEDANDCHECKCANCELLED248(	//inject NONSTANDARD NAMING
        bytes32[] calldata orderInfo
        )
        external
        view
        returns (uint[] memory fills);


                                             
                                                
    function AUTHORIZEADDRESS756(	//inject NONSTANDARD NAMING
        address addr
        )
        external;

                                                
                                                
    function DEAUTHORIZEADDRESS22(	//inject NONSTANDARD NAMING
        address addr
        )
        external;

    function ISADDRESSAUTHORIZED562(	//inject NONSTANDARD NAMING
        address addr
        )
        public
        view
        returns (bool);


    function SUSPEND993()	//inject NONSTANDARD NAMING
        external;

    function RESUME841()	//inject NONSTANDARD NAMING
        external;

    function KILL436()	//inject NONSTANDARD NAMING
        external;
}

// File: contracts/loopring/impl/Data.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;









library Data {

    enum TokenType { ERC20 }

    struct Header {
        uint version;
        uint numOrders;
        uint numRings;
        uint numSpendables;
    }

    struct BrokerAction {
        bytes32 hash;
        address broker;
        uint[] orderIndices;
        uint numOrders;
        uint[] transferIndices;
        uint numTransfers;
        address tokenS;
        address tokenB;
        address feeToken;
        address delegate;
    }

    struct BrokerTransfer {
        bytes32 hash;
        address token;
        uint amount;
        address recipient;
    }

    struct Context {
        address lrcTokenAddress;
        ITradeDelegate  delegate;
        ITradeHistory   tradeHistory;
        IBrokerRegistry orderBrokerRegistry;
        IOrderRegistry  orderRegistry;
        IFeeHolder feeHolder;
        IOrderBook orderBook;
        IBurnRateTable burnRateTable;
        uint64 ringIndex;
        uint feePercentageBase;
        bytes32[] tokenBurnRates;
        uint feeData;
        uint feePtr;
        uint transferData;
        uint transferPtr;
        BrokerData.BrokerOrder[] brokerOrders;
        BrokerAction[] brokerActions;
        BrokerTransfer[] brokerTransfers;
        uint numBrokerOrders;
        uint numBrokerActions;
        uint numBrokerTransfers;
    }

    struct Mining {
        // required fields
        address feeRecipient;

        // optional fields
        address miner;
        bytes   sig;

        // computed fields
        bytes32 hash;
        address interceptor;
    }

    struct Spendable {
        bool initialized;
        uint amount;
        uint reserved;
    }

    struct Order {
        uint      version;

        // required fields
        address   owner;
        address   tokenS;
        address   tokenB;
        uint      amountS;
        uint      amountB;
        uint      validSince;
        Spendable tokenSpendableS;
        Spendable tokenSpendableFee;

        // optional fields
        address   dualAuthAddr;
        address   broker;
        Spendable brokerSpendableS;
        Spendable brokerSpendableFee;
        address   orderInterceptor;
        address   wallet;
        uint      validUntil;
        bytes     sig;
        bytes     dualAuthSig;
        bool      allOrNone;
        address   feeToken;
        uint      feeAmount;
        int16     waiveFeePercentage;
        uint16    tokenSFeePercentage;    // Pre-trading
        uint16    tokenBFeePercentage;   // Post-trading
        address   tokenRecipient;
        uint16    walletSplitPercentage;

        // computed fields
        bool    P2P;
        bytes32 hash;
        address brokerInterceptor;
        uint    filledAmountS;
        uint    initialFilledAmountS;
        bool    valid;

        TokenType tokenTypeS;
        TokenType tokenTypeB;
        TokenType tokenTypeFee;
        bytes32 trancheS;
        bytes32 trancheB;
        uint    maxPrimaryFillAmount;
        bool    transferFirstAsMaker;
        bytes   transferDataS;
    }

    struct Participation {
        // required fields
        Order order;

        // computed fields
        uint splitS;
        uint feeAmount;
        uint feeAmountS;
        uint feeAmountB;
        uint rebateFee;
        uint rebateS;
        uint rebateB;
        uint fillAmountS;
        uint fillAmountB;
    }

    struct Ring {
        uint size;
        Participation[] participations;
        bytes32 hash;
        uint minerFeesToOrdersPercentage;
        bool valid;
    }

    struct RingIndices {
        uint index0;
        uint index1;
    }

    struct FeeContext {
        Data.Ring ring;
        Data.Context ctx;
        address feeRecipient;
        uint walletPercentage;
        int16 waiveFeePercentage;
        address owner;
        address wallet;
        bool P2P;
    }

//    struct SubmitRingsRequest {
//        Data.Mining  mining;
//        Data.Order[] orders;
//        Data.RingIndices[]  ringIndices;
//    }

}

// File: contracts/dydx/protocol/lib/Monetary.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity 0.5.7;


                                                                                  
library Monetary {

                                                           
    struct Price {
        uint256 value;
    }

                                                                                           
    struct Value {
        uint256 value;
    }
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                   
library SafeMath {
                                                                                
    function MUL7(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV930(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB280(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD423(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD910(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: contracts/dydx/protocol/lib/Require.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity 0.5.7;


                                                                                                                                             
library Require {

    // ============ Constants ============

    uint256 constant ascii_zero656 = 48; // '0'	//inject NONSTANDARD NAMING
    uint256 constant ascii_relative_zero251 = 87; // 'a' - 10	//inject NONSTANDARD NAMING
    uint256 constant ascii_lower_ex584 = 120; // 'x'	//inject NONSTANDARD NAMING
    bytes2 constant colon208 = 0x3a20; // ': '	//inject NONSTANDARD NAMING
    bytes2 constant comma559 = 0x2c20; // ', '	//inject NONSTANDARD NAMING
    bytes2 constant lparen256 = 0x203c; // ' <'	//inject NONSTANDARD NAMING
    byte constant rparen596 = 0x3e; // '>'	//inject NONSTANDARD NAMING
    uint256 constant four_bit_mask996 = 0xf;	//inject NONSTANDARD NAMING

    // ============ Library Functions ============

    function THAT299(	//inject NONSTANDARD NAMING
        bool must,
        bytes32 file,
        bytes32 reason
    )
        internal
        pure
    {
        if (!must) {
            revert(
                string(
                    abi.encodePacked(
                        STRINGIFY389(file),
                        colon208,
                        STRINGIFY389(reason)
                    )
                )
            );
        }
    }

    function THAT299(	//inject NONSTANDARD NAMING
        bool must,
        bytes32 file,
        bytes32 reason,
        uint256 payloadA
    )
        internal
        pure
    {
        if (!must) {
            revert(
                string(
                    abi.encodePacked(
                        STRINGIFY389(file),
                        colon208,
                        STRINGIFY389(reason),
                        lparen256,
                        STRINGIFY389(payloadA),
                        rparen596
                    )
                )
            );
        }
    }

    function THAT299(	//inject NONSTANDARD NAMING
        bool must,
        bytes32 file,
        bytes32 reason,
        uint256 payloadA,
        uint256 payloadB
    )
        internal
        pure
    {
        if (!must) {
            revert(
                string(
                    abi.encodePacked(
                        STRINGIFY389(file),
                        colon208,
                        STRINGIFY389(reason),
                        lparen256,
                        STRINGIFY389(payloadA),
                        comma559,
                        STRINGIFY389(payloadB),
                        rparen596
                    )
                )
            );
        }
    }

    function THAT299(	//inject NONSTANDARD NAMING
        bool must,
        bytes32 file,
        bytes32 reason,
        address payloadA
    )
        internal
        pure
    {
        if (!must) {
            revert(
                string(
                    abi.encodePacked(
                        STRINGIFY389(file),
                        colon208,
                        STRINGIFY389(reason),
                        lparen256,
                        STRINGIFY389(payloadA),
                        rparen596
                    )
                )
            );
        }
    }

    function THAT299(	//inject NONSTANDARD NAMING
        bool must,
        bytes32 file,
        bytes32 reason,
        address payloadA,
        uint256 payloadB
    )
        internal
        pure
    {
        if (!must) {
            revert(
                string(
                    abi.encodePacked(
                        STRINGIFY389(file),
                        colon208,
                        STRINGIFY389(reason),
                        lparen256,
                        STRINGIFY389(payloadA),
                        comma559,
                        STRINGIFY389(payloadB),
                        rparen596
                    )
                )
            );
        }
    }

    function THAT299(	//inject NONSTANDARD NAMING
        bool must,
        bytes32 file,
        bytes32 reason,
        address payloadA,
        uint256 payloadB,
        uint256 payloadC
    )
        internal
        pure
    {
        if (!must) {
            revert(
                string(
                    abi.encodePacked(
                        STRINGIFY389(file),
                        colon208,
                        STRINGIFY389(reason),
                        lparen256,
                        STRINGIFY389(payloadA),
                        comma559,
                        STRINGIFY389(payloadB),
                        comma559,
                        STRINGIFY389(payloadC),
                        rparen596
                    )
                )
            );
        }
    }

    // ============ Private Functions ============

    function STRINGIFY389(	//inject NONSTANDARD NAMING
        bytes32 input
    )
        private
        pure
        returns (bytes memory)
    {
        // put the input bytes into the result
        bytes memory result = abi.encodePacked(input);

        // determine the length of the input by finding the location of the last non-zero byte
        for (uint256 i = 32; i > 0; ) {
            // reverse-for-loops with unsigned integer
                                                                          
            i--;

            // find the last non-zero byte in order to determine the length
            if (result[i] != 0) {
                uint256 length = i + 1;

                                                                          
                assembly {
                    mstore(result, length) // r.length = length;
                }

                return result;
            }
        }

        // all bytes are zero
        return new bytes(0);
    }

    function STRINGIFY389(	//inject NONSTANDARD NAMING
        uint256 input
    )
        private
        pure
        returns (bytes memory)
    {
        if (input == 0) {
            return "0";
        }

        // get the final string length
        uint256 j = input;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }

        // allocate the string
        bytes memory bstr = new bytes(length);

        // populate the string starting with the least-significant character
        j = input;
        for (uint256 i = length; i > 0; ) {
            // reverse-for-loops with unsigned integer
                                                                          
            i--;

            // take last decimal digit
            bstr[i] = byte(uint8(ascii_zero656 + (j % 10)));

            // remove the last decimal digit
            j /= 10;
        }

        return bstr;
    }

    function STRINGIFY389(	//inject NONSTANDARD NAMING
        address input
    )
        private
        pure
        returns (bytes memory)
    {
        uint256 z = uint256(input);

        // addresses are "0x" followed by 20 bytes of data which take up 2 characters each
        bytes memory result = new bytes(42);

        // populate the result with "0x"
        result[0] = byte(uint8(ascii_zero656));
        result[1] = byte(uint8(ascii_lower_ex584));

        // for each byte (starting from the lowest byte), populate the result with two characters
        for (uint256 i = 0; i < 20; i++) {
            // each byte takes two characters
            uint256 shift = i * 2;

            // populate the least-significant character
            result[41 - shift] = CHAR617(z & four_bit_mask996);
            z = z >> 4;

            // populate the most-significant character
            result[40 - shift] = CHAR617(z & four_bit_mask996);
            z = z >> 4;
        }

        return result;
    }

    function CHAR617(	//inject NONSTANDARD NAMING
        uint256 input
    )
        private
        pure
        returns (byte)
    {
        // return ASCII digit (0-9)
        if (input < 10) {
            return byte(uint8(input + ascii_zero656));
        }

        // return ASCII letter (a-f)
        return byte(uint8(input + ascii_relative_zero251));
    }
}

// File: contracts/dydx/protocol/lib/Math.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity 0.5.7;




                                                                                    
library Math {
    using SafeMath for uint256;

    // ============ Constants ============

    bytes32 constant file245 = "Math";	//inject NONSTANDARD NAMING

    // ============ Library Functions ============

                                                                
    function GETPARTIAL880(	//inject NONSTANDARD NAMING
        uint256 target,
        uint256 numerator,
        uint256 denominator
    )
        internal
        pure
        returns (uint256)
    {
        return target.MUL7(numerator).DIV930(denominator);
    }

                                                                                
    function GETPARTIALROUNDUP773(	//inject NONSTANDARD NAMING
        uint256 target,
        uint256 numerator,
        uint256 denominator
    )
        internal
        pure
        returns (uint256)
    {
        if (target == 0 || numerator == 0) {
            // SafeMath will check for zero denominator
            return SafeMath.DIV930(0, denominator);
        }
        return target.MUL7(numerator).SUB280(1).DIV930(denominator).ADD423(1);
    }

    function TO128783(	//inject NONSTANDARD NAMING
        uint256 number
    )
        internal
        pure
        returns (uint128)
    {
        uint128 result = uint128(number);
        Require.THAT299(
            result == number,
            file245,
            "Unsafe cast to uint128"
        );
        return result;
    }

    function TO96435(	//inject NONSTANDARD NAMING
        uint256 number
    )
        internal
        pure
        returns (uint96)
    {
        uint96 result = uint96(number);
        Require.THAT299(
            result == number,
            file245,
            "Unsafe cast to uint96"
        );
        return result;
    }

    function TO32831(	//inject NONSTANDARD NAMING
        uint256 number
    )
        internal
        pure
        returns (uint32)
    {
        uint32 result = uint32(number);
        Require.THAT299(
            result == number,
            file245,
            "Unsafe cast to uint32"
        );
        return result;
    }

    function MIN996(	//inject NONSTANDARD NAMING
        uint256 a,
        uint256 b
    )
        internal
        pure
        returns (uint256)
    {
        return a < b ? a : b;
    }

    function MAX64(	//inject NONSTANDARD NAMING
        uint256 a,
        uint256 b
    )
        internal
        pure
        returns (uint256)
    {
        return a > b ? a : b;
    }
}

// File: contracts/dydx/protocol/lib/Types.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity 0.5.7;




                                                                                                         
library Types {
    using Math for uint256;

    // ============ AssetAmount ============

    enum AssetDenomination {
        Wei, // the amount is denominated in wei
        Par  // the amount is denominated in par
    }

    enum AssetReference {
        Delta, // the amount is given as a delta from the current value
        Target // the amount is given as an exact number to end up at
    }

    struct AssetAmount {
        bool sign; // true if positive
        AssetDenomination denomination;
        AssetReference ref;
        uint256 value;
    }

    // ============ Par (Principal Amount) ============

    // Total borrow and supply values for a market
    struct TotalPar {
        uint128 borrow;
        uint128 supply;
    }

    // Individual principal amount for an account
    struct Par {
        bool sign; // true if positive
        uint128 value;
    }

    function ZEROPAR644()	//inject NONSTANDARD NAMING
        internal
        pure
        returns (Par memory)
    {
        return Par({
            sign: false,
            value: 0
        });
    }

    function SUB280(	//inject NONSTANDARD NAMING
        Par memory a,
        Par memory b
    )
        internal
        pure
        returns (Par memory)
    {
        return ADD423(a, NEGATIVE261(b));
    }

    function ADD423(	//inject NONSTANDARD NAMING
        Par memory a,
        Par memory b
    )
        internal
        pure
        returns (Par memory)
    {
        Par memory result;
        if (a.sign == b.sign) {
            result.sign = a.sign;
            result.value = SafeMath.ADD423(a.value, b.value).TO128783();
        } else {
            if (a.value >= b.value) {
                result.sign = a.sign;
                result.value = SafeMath.SUB280(a.value, b.value).TO128783();
            } else {
                result.sign = b.sign;
                result.value = SafeMath.SUB280(b.value, a.value).TO128783();
            }
        }
        return result;
    }

    function EQUALS362(	//inject NONSTANDARD NAMING
        Par memory a,
        Par memory b
    )
        internal
        pure
        returns (bool)
    {
        if (a.value == b.value) {
            if (a.value == 0) {
                return true;
            }
            return a.sign == b.sign;
        }
        return false;
    }

    function NEGATIVE261(	//inject NONSTANDARD NAMING
        Par memory a
    )
        internal
        pure
        returns (Par memory)
    {
        return Par({
            sign: !a.sign,
            value: a.value
        });
    }

    function ISNEGATIVE486(	//inject NONSTANDARD NAMING
        Par memory a
    )
        internal
        pure
        returns (bool)
    {
        return !a.sign && a.value > 0;
    }

    function ISPOSITIVE337(	//inject NONSTANDARD NAMING
        Par memory a
    )
        internal
        pure
        returns (bool)
    {
        return a.sign && a.value > 0;
    }

    function ISZERO433(	//inject NONSTANDARD NAMING
        Par memory a
    )
        internal
        pure
        returns (bool)
    {
        return a.value == 0;
    }

    // ============ Wei (Token Amount) ============

    // Individual token amount for an account
    struct Wei {
        bool sign; // true if positive
        uint256 value;
    }

    function ZEROWEI227()	//inject NONSTANDARD NAMING
        internal
        pure
        returns (Wei memory)
    {
        return Wei({
            sign: false,
            value: 0
        });
    }

    function SUB280(	//inject NONSTANDARD NAMING
        Wei memory a,
        Wei memory b
    )
        internal
        pure
        returns (Wei memory)
    {
        return ADD423(a, NEGATIVE261(b));
    }

    function ADD423(	//inject NONSTANDARD NAMING
        Wei memory a,
        Wei memory b
    )
        internal
        pure
        returns (Wei memory)
    {
        Wei memory result;
        if (a.sign == b.sign) {
            result.sign = a.sign;
            result.value = SafeMath.ADD423(a.value, b.value);
        } else {
            if (a.value >= b.value) {
                result.sign = a.sign;
                result.value = SafeMath.SUB280(a.value, b.value);
            } else {
                result.sign = b.sign;
                result.value = SafeMath.SUB280(b.value, a.value);
            }
        }
        return result;
    }

    function EQUALS362(	//inject NONSTANDARD NAMING
        Wei memory a,
        Wei memory b
    )
        internal
        pure
        returns (bool)
    {
        if (a.value == b.value) {
            if (a.value == 0) {
                return true;
            }
            return a.sign == b.sign;
        }
        return false;
    }

    function NEGATIVE261(	//inject NONSTANDARD NAMING
        Wei memory a
    )
        internal
        pure
        returns (Wei memory)
    {
        return Wei({
            sign: !a.sign,
            value: a.value
        });
    }

    function ISNEGATIVE486(	//inject NONSTANDARD NAMING
        Wei memory a
    )
        internal
        pure
        returns (bool)
    {
        return !a.sign && a.value > 0;
    }

    function ISPOSITIVE337(	//inject NONSTANDARD NAMING
        Wei memory a
    )
        internal
        pure
        returns (bool)
    {
        return a.sign && a.value > 0;
    }

    function ISZERO433(	//inject NONSTANDARD NAMING
        Wei memory a
    )
        internal
        pure
        returns (bool)
    {
        return a.value == 0;
    }
}

// File: contracts/dydx/protocol/lib/Account.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity 0.5.7;



                                                                                                          
library Account {
    // ============ Enums ============

                                                                                                                                                                                                                                                                                                                                                                                                       
    enum Status {
        Normal,
        Liquid,
        Vapor
    }

    // ============ Structs ============

    // Represents the unique key that specifies an account
    struct Info {
        address owner;  // The address that owns the account
        uint256 number; // A nonce that allows a single address to control many accounts
    }

    // The complete storage for any account
    struct Storage {
        mapping (uint256 => Types.Par) balances; // Mapping from marketId to principal
        Status status;
    }

    // ============ Library Functions ============

    function EQUALS362(	//inject NONSTANDARD NAMING
        Info memory a,
        Info memory b
    )
        internal
        pure
        returns (bool)
    {
        return a.owner == b.owner && a.number == b.number;
    }
}

// File: contracts/dolomite-margin-protocol/external/ExternalDefinitions.sol

pragma solidity 0.5.7;




//interface ERC20 {
//  event Transfer(address indexed from, address indexed to, uint256 value);
//  event Approval(address indexed owner, address indexed spender, uint256 value);
//
//  function totalSupply() external view returns (uint256);
//  function decimals() external view returns (uint8);
//
//  function balanceOf(address who) external view returns (uint256);
//  function allowance(address owner, address spender) external view returns (uint256);
//
//  function transfer(address to, uint256 value) external;
//  function transferFrom(address from, address to, uint256 value) external;
//  function approve(address spender, uint256 value) external;
//}

// ---------------------------------
// Dolomite Direct Includes

interface IDepositContractRegistry {
  function DEPOSITADDRESSOF939(address owner) external view returns (address payable);	//inject NONSTANDARD NAMING
  function OPERATOROF8(address owner, address operator) external returns (bool);	//inject NONSTANDARD NAMING
}

// ---------------------------------
// Dydx Includes

library DydxTypes {
  enum AssetDenomination { Wei, Par }
  enum AssetReference { Delta, Target }

  struct AssetAmount {
    bool sign;
    AssetDenomination denomination;
    AssetReference ref;
    uint256 value;
  }
}

library DydxPosition {
  struct Info {
    address owner;
    uint256 number;
  }
}

library DydxActions {
  enum ActionType { Deposit, Withdraw, Transfer, Buy, Sell,
    Trade, Liquidate, Vaporize, Call }

  struct ActionArgs {
    ActionType actionType;
    uint256 accountId;
    DydxTypes.AssetAmount amount;
    uint256 primaryMarketId;
    uint256 secondaryMarketId;
    address otherAddress;
    uint256 otherAccountId;
    bytes data;
  }
}

interface IDydxExchangeWrapper {
  function EXCHANGE345(	//inject NONSTANDARD NAMING
    address tradeOriginator,
    address receiver,
    address makerToken,
    address takerToken,
    uint256 requestedFillAmount,
    bytes calldata orderData
  ) external returns (uint256);

  // Unused by our contract, does not need to be implemented
  // function getExchangeCost(
  //   address makerToken,
  //   address takerToken,
  //   uint256 desiredMakerToken,
  //   bytes calldata orderData
  // ) external view returns (uint256);
}

interface IDydxCallee {
  function CALLFUNCTION751(address sender, DydxPosition.Info calldata accountInfo, bytes calldata data) external;	//inject NONSTANDARD NAMING
}

contract IDydxProtocol {
  struct OperatorArg {
    address operator;
    bool trusted;
  }

  function OPERATE938(	//inject NONSTANDARD NAMING
      DydxPosition.Info[] calldata accounts,
      DydxActions.ActionArgs[] calldata actions
  ) external;

  function GETNUMMARKETS339() public view returns (uint256);	//inject NONSTANDARD NAMING
  function GETMARKETTOKENADDRESS199(uint256 marketId) external view returns (address);	//inject NONSTANDARD NAMING
  function GETMARKETPRICE451(uint256 marketId) external view returns (Monetary.Price memory);	//inject NONSTANDARD NAMING
  function GETACCOUNTWEI85(Account.Info calldata account, uint256 marketId) external view returns (Types.Wei memory);	//inject NONSTANDARD NAMING
}

// ---------------------------------
// Loopring Includes

library LoopringTypes {
  struct BrokerApprovalRequest {
    BrokerOrder[] orders;
    address tokenS;
    address tokenB;
    address feeToken;
    uint totalFillAmountB;
    uint totalRequestedAmountS;
    uint totalRequestedFeeAmount;
  }

  struct BrokerOrder {
    address owner;
    bytes32 orderHash;
    uint fillAmountB;
    uint requestedAmountS;
    uint requestedFeeAmount;
    address tokenRecipient;
    bytes extraData;
  }

  struct BrokerInterceptorReport {
    address owner;
    address broker;
    bytes32 orderHash;
    address tokenB;
    address tokenS;
    address feeToken;
    uint fillAmountB;
    uint spentAmountS;
    uint spentFeeAmount;
    address tokenRecipient;
    bytes extraData;
  }
}

interface ILoopringTradeDelegate {
  function BATCHTRANSFER917(bytes32[] calldata batch) external;	//inject NONSTANDARD NAMING
}

interface ILoopringBrokerDelegate {
  function BROKERREQUESTALLOWANCE941(LoopringTypes.BrokerApprovalRequest calldata request) external returns (bool);	//inject NONSTANDARD NAMING
  function BROKERBALANCEOF735(address owner, address token) external view returns (uint);	//inject NONSTANDARD NAMING

  // Unused by our contract, does not need to be implemented
  // function onOrderFillReport(LoopringTypes.BrokerInterceptorReport calldata fillReport) external;
}

interface ILoopringProtocol {
  function SUBMITRINGS514(bytes calldata data) external;	//inject NONSTANDARD NAMING
//  function submitRings(Data.SubmitRingsRequest calldata request) external;
  function DELEGATEADDRESS554() external returns (address);	//inject NONSTANDARD NAMING
}

// File: contracts/dolomite-margin-protocol/external/ExternalHelpers.sol

pragma solidity 0.5.7;


library Logger {
  function REVERTADDRESS210(address addr) internal pure {	//inject NONSTANDARD NAMING
    revert(_ADDRESSTOSTRING608(addr));
  }

  function REVERTUINT27(uint num) internal pure {	//inject NONSTANDARD NAMING
    revert(_UINTTOSTRING430(num));
  }

  // -----------------------------

  function _ADDRESSTOSTRING608(address _addr) private pure returns (string memory) {	//inject NONSTANDARD NAMING
    bytes32 value = bytes32(uint256(_addr));
    bytes memory alphabet = "0123456789abcdef";

    bytes memory str = new bytes(51);
    str[0] = '0';
    str[1] = 'x';
    for (uint i = 0; i < 20; i++) {
      str[2 + i * 2] = alphabet[uint(uint8(value[i + 12] >> 4))];
      str[3 + i * 2] = alphabet[uint(uint8(value[i + 12] & 0x0f))];
    }
    return string(str);
  }

  function _UINTTOSTRING430(uint num) internal pure returns (string memory) {	//inject NONSTANDARD NAMING
    if (num == 0) {
      return "0";
    }
    uint j = num;
    uint len;
    while (j != 0) {
      len++;
      j /= 10;
    }
    bytes memory bstr = new bytes(len);
    uint k = len - 1;
    while (num != 0) {
      bstr[k--] = byte(uint8(48 + num % 10));
      num /= 10;
    }
    return string(bstr);
  }

}

library LoopringTradeDelegateHelper {
  function TRANSFERTOKENFROM498(	//inject NONSTANDARD NAMING
    ILoopringTradeDelegate self,
    address token,
    address from,
    address to,
    uint256 amount
  ) internal {
    bytes32[] memory transferData = new bytes32[](4);
    transferData[0] = ADDRESSTOBYTES32909(token);
    transferData[1] = ADDRESSTOBYTES32909(from);
    transferData[2] = ADDRESSTOBYTES32909(to);
    transferData[3] = bytes32(amount);

    self.BATCHTRANSFER917(transferData);
  }

  function ADDRESSTOBYTES32909(address addr) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return bytes32(uint256(addr));
  }
}

library DydxActionBuilder {

  function DEPOSIT716(uint positionIndex, uint marketId, uint amount, address from)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (DydxActions.ActionArgs memory depositAction)
  {
    depositAction.actionType = DydxActions.ActionType.Deposit;
    depositAction.accountId = positionIndex;
    depositAction.primaryMarketId = marketId;
    depositAction.otherAddress = from;
    depositAction.amount = DydxTypes.AssetAmount({
      sign: true,
      denomination: DydxTypes.AssetDenomination.Wei,
      ref: DydxTypes.AssetReference.Delta,
      value: amount
    });
  }

  // The only way to deposit a variable amount into dYdX during the execution of an "operate" call is
  // to perform a "sell" action sending 1 wei (burned) and then the implementor of IExchangeWrapper
  // returns the amount that will be deposited. The 1 wei is an unfortunate side effect, however it is 
  // a very negligible amount. If in a future version of dYdX selling 0 of a token is enabled, or even better
  // a DepositAll action is added, this would remove the need for this token transfer and burn. 
  function DEPOSITALL419(uint positionIndex, uint marketId, uint burnMarketId, address controller, bytes32 orderHash)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (DydxActions.ActionArgs memory action)
  {
    action.actionType = DydxActions.ActionType.Sell;
    action.accountId = positionIndex;
    action.otherAddress = controller;
    action.data = abi.encode(orderHash);
    action.primaryMarketId = burnMarketId;
    action.secondaryMarketId = marketId;
    action.amount = DydxTypes.AssetAmount({
      sign: false,
      denomination: DydxTypes.AssetDenomination.Wei,
      ref: DydxTypes.AssetReference.Delta,
      value: 1
    });
  }

  // ---------------------------------

  function WITHDRAW648(uint positionIndex, uint marketId, uint amount, address to)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (DydxActions.ActionArgs memory withdrawAction)
  {
    withdrawAction.actionType = DydxActions.ActionType.Withdraw;
    withdrawAction.accountId = positionIndex;
    withdrawAction.primaryMarketId = marketId;
    withdrawAction.otherAddress = to;
    withdrawAction.amount = DydxTypes.AssetAmount({
      sign: false,
      denomination: DydxTypes.AssetDenomination.Wei,
      ref: DydxTypes.AssetReference.Delta,
      value: amount
    });
  }

  function WITHDRAWALL494(uint positionIndex, uint marketId, address to)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (DydxActions.ActionArgs memory withdrawAction)
  {
    withdrawAction.actionType = DydxActions.ActionType.Withdraw;
    withdrawAction.accountId = positionIndex;
    withdrawAction.primaryMarketId = marketId;
    withdrawAction.otherAddress = to;
    withdrawAction.amount = DydxTypes.AssetAmount({
      sign: true,
      denomination: DydxTypes.AssetDenomination.Wei,
      ref: DydxTypes.AssetReference.Target,
      value: 0
    });
  }

  // ---------------------------------

  // function Liquidation() {

  // }

  // ---------------------------------

  function SETEXPIRY307(uint positionIndex, address expiry, uint marketId, uint expiryTime)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (DydxActions.ActionArgs memory)
  {
    return EXTERNALCALL683({
      positionIndex: positionIndex,
      callee: expiry,
      data: abi.encode(marketId, expiryTime)
    });
  }

  function LOOPRINGSETTLEMENT973(	//inject NONSTANDARD NAMING
    bytes memory settlementData,
    address settlementCaller,
    uint positionIndex
  )
    internal
    pure
    returns (DydxActions.ActionArgs memory)
  {
    return EXTERNALCALL683({
      positionIndex: positionIndex,
      callee: settlementCaller,
      data: settlementData
    });
  }

  function EXTERNALCALL683(uint positionIndex, address callee, bytes memory data)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (DydxActions.ActionArgs memory callAction)
  {
    callAction.actionType = DydxActions.ActionType.Call;
    callAction.accountId = positionIndex;
    callAction.otherAddress = callee;
    callAction.data = data;
  }
}

library LoopringOrderDecoder {

  function DECODELOOPRINGORDERS994(bytes memory ringData, uint[] memory indices) internal pure returns (Data.Order[] memory orders) {	//inject NONSTANDARD NAMING
    uint numOrders = BYTESTOUINT16729(ringData, 2);
    uint numRings = BYTESTOUINT16729(ringData, 4);
    uint numSpendables = BYTESTOUINT16729(ringData, 6);

    uint dataPtr;
    assembly { dataPtr := ringData }
    uint orderDataPtr = (dataPtr + 8) + 3 * 2;
    uint ringDataPtr = orderDataPtr + (32 * numOrders) * 2;
    uint dataBlobPtr = ringDataPtr + (numRings * 9) + 32;

//    orders = new LoopringOrder[](indices.length);
    orders = new Data.Order[](indices.length);

    for (uint i = 0; i < indices.length; i++) {
      orders[i] = _DECODELOOPRINGORDERATINDEX203(dataBlobPtr, orderDataPtr + 2, numSpendables, indices[i]);
    }
  }

  // ----------------------------

  function _DECODELOOPRINGORDERATINDEX203(uint data, uint tablesPtr, uint numSpendables, uint orderIndex) private pure returns (Data.Order memory order) {	//inject NONSTANDARD NAMING
    tablesPtr += 64 * orderIndex;

    uint offset;
    bytes memory emptyBytes = new bytes(0);
    address lrcTokenAddress = address(0);
    Data.Spendable[] memory spendableList = new Data.Spendable[](numSpendables);
    uint orderStructSize = 40 * 32;

    assembly {
      order := mload(0x40)
      mstore(0x40, add(order, orderStructSize)) // Reserve memory for the order struct

      // order.version
      offset := and(mload(add(tablesPtr,  0)), 0xFFFF)
      mstore(
      add(order,   0),
      offset
      )

    // order.owner
      offset := mul(and(mload(add(tablesPtr,  2)), 0xFFFF), 4)
      mstore(
      add(order,  32),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // order.tokenS
      offset := mul(and(mload(add(tablesPtr,  4)), 0xFFFF), 4)
      mstore(
      add(order,  64),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // order.tokenB
      offset := mul(and(mload(add(tablesPtr,  6)), 0xFFFF), 4)
      mstore(
      add(order,  96),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // order.amountS
      offset := mul(and(mload(add(tablesPtr,  8)), 0xFFFF), 4)
      mstore(
      add(order, 128),
      mload(add(add(data, 32), offset))
      )

    // order.amountB
      offset := mul(and(mload(add(tablesPtr, 10)), 0xFFFF), 4)
      mstore(
      add(order, 160),
      mload(add(add(data, 32), offset))
      )

    // order.validSince
      offset := mul(and(mload(add(tablesPtr, 12)), 0xFFFF), 4)
      mstore(
      add(order, 192),
      and(mload(add(add(data, 4), offset)), 0xFFFFFFFF)
      )

    // order.tokenSpendableS
      offset := and(mload(add(tablesPtr, 14)), 0xFFFF)
    // Force the spendable index to 0 if it's invalid
      offset := mul(offset, lt(offset, numSpendables))
      mstore(
      add(order, 224),
      mload(add(spendableList, mul(add(offset, 1), 32)))
      )

    // order.tokenSpendableFee
      offset := and(mload(add(tablesPtr, 16)), 0xFFFF)
    // Force the spendable index to 0 if it's invalid
      offset := mul(offset, lt(offset, numSpendables))
      mstore(
      add(order, 256),
      mload(add(spendableList, mul(add(offset, 1), 32)))
      )

    // order.dualAuthAddr
      offset := mul(and(mload(add(tablesPtr, 18)), 0xFFFF), 4)
      mstore(
      add(order, 288),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // order.broker
      offset := mul(and(mload(add(tablesPtr, 20)), 0xFFFF), 4)
      mstore(
      add(order, 320),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // order.orderInterceptor
      offset := mul(and(mload(add(tablesPtr, 22)), 0xFFFF), 4)
      mstore(
      add(order, 416),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // order.wallet
      offset := mul(and(mload(add(tablesPtr, 24)), 0xFFFF), 4)
      mstore(
      add(order, 448),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // order.validUntil
      offset := mul(and(mload(add(tablesPtr, 26)), 0xFFFF), 4)
      mstore(
      add(order, 480),
      and(mload(add(add(data,  4), offset)), 0xFFFFFFFF)
      )

    // Default to empty bytes array for value sig and dualAuthSig
      mstore(add(data, 32), emptyBytes)

    // order.sig
      offset := mul(and(mload(add(tablesPtr, 28)), 0xFFFF), 4)
      mstore(
      add(order, 512),
      add(data, add(offset, 32))
      )

    // order.dualAuthSig
      offset := mul(and(mload(add(tablesPtr, 30)), 0xFFFF), 4)
      mstore(
      add(order, 544),
      add(data, add(offset, 32))
      )

    // Restore default to 0
      mstore(add(data, 32), 0)

    // order.allOrNone
      offset := and(mload(add(tablesPtr, 32)), 0xFFFF)
      mstore(
      add(order, 576),
      gt(offset, 0)
      )

    // lrcTokenAddress is the default value for feeToken
      mstore(add(data, 20), lrcTokenAddress)

    // order.feeToken
      offset := mul(and(mload(add(tablesPtr, 34)), 0xFFFF), 4)
      mstore(
      add(order, 608),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // Restore default to 0
      mstore(add(data, 20), 0)

    // order.feeAmount
      offset := mul(and(mload(add(tablesPtr, 36)), 0xFFFF), 4)
      mstore(
      add(order, 640),
      mload(add(add(data, 32), offset))
      )

    // order.waiveFeePercentage
      offset := and(mload(add(tablesPtr, 38)), 0xFFFF)
      mstore(
      add(order, 672),
      offset
      )

    // order.tokenSFeePercentage
      offset := and(mload(add(tablesPtr, 40)), 0xFFFF)
      mstore(
      add(order, 704),
      offset
      )

    // order.tokenBFeePercentage
      offset := and(mload(add(tablesPtr, 42)), 0xFFFF)
      mstore(
      add(order, 736),
      offset
      )

    // The owner is the default value of tokenRecipient
      mstore(add(data, 20), mload(add(order, 32)))                // order.owner

    // order.tokenRecipient
      offset := mul(and(mload(add(tablesPtr, 44)), 0xFFFF), 4)
      mstore(
      add(order, 768),
      and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      )

    // Restore default to 0
      mstore(add(data, 20), 0)

    // order.walletSplitPercentage
      offset := and(mload(add(tablesPtr, 46)), 0xFFFF)
      mstore(
      add(order, 800),
      offset
      )

    // order.tokenTypeS
      offset := and(mload(add(tablesPtr, 48)), 0xFFFF)
      mstore(
      add(order, 1024),
      offset
      )

    // order.tokenTypeB
      offset := and(mload(add(tablesPtr, 50)), 0xFFFF)
      mstore(
      add(order, 1056),
      offset
      )

    // order.tokenTypeFee
      offset := and(mload(add(tablesPtr, 52)), 0xFFFF)
      mstore(
      add(order, 1088),
      offset
      )

    // order.trancheS
      offset := mul(and(mload(add(tablesPtr, 54)), 0xFFFF), 4)
      mstore(
      add(order, 1120),
      mload(add(add(data, 32), offset))
      )

    // order.trancheB
      offset := mul(and(mload(add(tablesPtr, 56)), 0xFFFF), 4)
      mstore(
      add(order, 1152),
      mload(add(add(data, 32), offset))
      )

    // Restore default to 0
      mstore(add(data, 20), 0)

    // order.maxPrimaryFillAmount
      offset := mul(and(mload(add(tablesPtr, 58)), 0xFFFF), 4)
      mstore(
      add(order, 1184),
      mload(add(add(data, 32), offset))
      )

    // order.allOrNone
      offset := and(mload(add(tablesPtr, 60)), 0xFFFF)
      mstore(
      add(order, 1216),
      gt(offset, 0)
      )

    // Default to empty bytes array for transferDataS
      mstore(add(data, 32), emptyBytes)

    // order.transferDataS
      offset := mul(and(mload(add(tablesPtr, 62)), 0xFFFF), 4)
      mstore(
      add(order, 1248),
      add(data, add(offset, 32))
      )

    // Restore default to 0
      mstore(add(data, 32), 0)

    // Set default  values
      mstore(add(order, 832), 0)         // order.P2P
      mstore(add(order, 864), 0)         // order.hash
      mstore(add(order, 896), 0)         // order.brokerInterceptor
      mstore(add(order, 928), 0)         // order.filledAmountS
      mstore(add(order, 960), 0)         // order.initialFilledAmountS
      mstore(add(order, 992), 1)         // order.valid

    }
  }

  function BYTESTOUINTX725(bytes memory b, uint offset, uint numBytes) private pure returns (uint data) {	//inject NONSTANDARD NAMING
    require(b.length >= offset + numBytes, "INVALID_SIZE");
    assembly { data := mload(add(add(b, numBytes), offset)) }
  }

  function BYTESTOUINT16729(bytes memory b, uint offset) private pure returns (uint16) {	//inject NONSTANDARD NAMING
    return uint16(BYTESTOUINTX725(b, offset, 2) & 0xFFFF);
  }
}

// File: contracts/loopring/lib/ERC20.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                                
                                                       
                                               
contract ERC20 {
    function TOTALSUPPLY112()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256);

    function BALANCEOF168(	//inject NONSTANDARD NAMING
        address who
        )
        public
        view
        returns (uint256);

    function ALLOWANCE557(	//inject NONSTANDARD NAMING
        address owner,
        address spender
        )
        public
        view
        returns (uint256);

    function TRANSFER126(	//inject NONSTANDARD NAMING
        address to,
        uint256 value
        )
        public
        returns (bool);

    function TRANSFERFROM718(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256 value
        )
        public
        returns (bool);

    function APPROVE107(	//inject NONSTANDARD NAMING
        address spender,
        uint256 value
        )
        public
        returns (bool);
}

// File: contracts/loopring/lib/MathUint.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                                     
                                               
library MathUint {

    function MUL7(	//inject NONSTANDARD NAMING
        uint a,
        uint b
        )
        internal
        pure
        returns (uint c)
    {
        c = a * b;
        require(a == 0 || c / a == b, "INVALID_VALUE_MULTIPLY");
    }

    function SUB280(	//inject NONSTANDARD NAMING
        uint a,
        uint b
        )
        internal
        pure
        returns (uint)
    {
        require(b <= a, "INVALID_VALUE_SUB");
        return a - b;
    }

    function ADD423(	//inject NONSTANDARD NAMING
        uint a,
        uint b
        )
        internal
        pure
        returns (uint c)
    {
        c = a + b;
        require(c >= a, "INVALID_VALUE_ADD");
    }

    function HASROUNDINGERROR812(	//inject NONSTANDARD NAMING
        uint value,
        uint numerator,
        uint denominator
        )
        internal
        pure
        returns (bool)
    {
        uint multiplied = MUL7(value, numerator);
        uint remainder = multiplied % denominator;
        // Return true if the rounding error is larger than 1%
        return MUL7(remainder, 100) > multiplied;
    }
}

// File: contracts/loopring/lib/BytesUtil.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;


                                      
                                               
library BytesUtil {
    function BYTESTOBYTES32699(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint offset
        )
        internal
        pure
        returns (bytes32)
    {
        return bytes32(BYTESTOUINTX725(b, offset, 32));
    }

    function BYTESTOUINT77(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint offset
        )
        internal
        pure
        returns (uint)
    {
        return BYTESTOUINTX725(b, offset, 32);
    }

    function BYTESTOADDRESS987(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint offset
        )
        internal
        pure
        returns (address)
    {
        return address(BYTESTOUINTX725(b, offset, 20) & 0x00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    }

    function BYTESTOUINT16729(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint offset
        )
        internal
        pure
        returns (uint16)
    {
        return uint16(BYTESTOUINTX725(b, offset, 2) & 0xFFFF);
    }

    function BYTESTOUINTX725(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint offset,
        uint numBytes
        )
        private
        pure
        returns (uint data)
    {
        require(b.length >= offset + numBytes, "INVALID_SIZE");
        assembly {
            data := mload(add(add(b, numBytes), offset))
        }
    }

    function SUBBYTES477(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint offset
        )
        internal
        pure
        returns (bytes memory data)
    {
        require(b.length >= offset + 32, "INVALID_SIZE");
        assembly {
            data := add(add(b, 32), offset)
        }
    }
}

// File: contracts/loopring/lib/MultihashUtil.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;



                                                                 
                                               
                         
                                                              
                                                 
                                                    
library MultihashUtil {

    enum HashAlgorithm { Ethereum, EIP712 }

    string public constant sig_prefix945 = "\x19Ethereum Signed Message:\n32";	//inject NONSTANDARD NAMING

    function VERIFYSIGNATURE765(	//inject NONSTANDARD NAMING
        address signer,
        bytes32 plaintext,
        bytes memory multihash
        )
        internal
        pure
        returns (bool)
    {
        uint length = multihash.length;
        require(length >= 2, "invalid multihash format");
        uint8 algorithm;
        uint8 size;
        assembly {
            algorithm := mload(add(multihash, 1))
            size := mload(add(multihash, 2))
        }
        require(length == (2 + size), "bad multihash size");

        if (algorithm == uint8(HashAlgorithm.Ethereum)) {
            require(signer != address(0x0), "invalid signer address");
            require(size == 65, "bad Ethereum multihash size");
            bytes32 hash;
            uint8 v;
            bytes32 r;
            bytes32 s;
            assembly {
                let data := mload(0x40)
                mstore(data, 0x19457468657265756d205369676e6564204d6573736167653a0a333200000000) // SIG_PREFIX
                mstore(add(data, 28), plaintext)                                                 // plaintext
                hash := keccak256(data, 60)                                                      // 28 + 32
                // Extract v, r and s from the multihash data
                v := mload(add(multihash, 3))
                r := mload(add(multihash, 35))
                s := mload(add(multihash, 67))
            }
            return signer == ecrecover(
                hash,
                v,
                r,
                s
            );
        } else if (algorithm == uint8(HashAlgorithm.EIP712)) {
            require(signer != address(0x0), "invalid signer address");
            require(size == 65, "bad EIP712 multihash size");
            uint8 v;
            bytes32 r;
            bytes32 s;
            assembly {
                // Extract v, r and s from the multihash data
                v := mload(add(multihash, 3))
                r := mload(add(multihash, 35))
                s := mload(add(multihash, 67))
            }
            return signer == ecrecover(
                plaintext,
                v,
                r,
                s
            );
        } else {
            return false;
        }
    }
}

// File: contracts/loopring/iface/IBrokerDelegate.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity 0.5.7;


                                                            
interface IBrokerDelegate {

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function BROKERREQUESTALLOWANCE941(BrokerData.BrokerApprovalRequest calldata request) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function ONORDERFILLREPORT273(BrokerData.BrokerInterceptorReport calldata fillReport) external;	//inject NONSTANDARD NAMING

                                                                                                        
  function BROKERBALANCEOF735(address owner, address token) external view returns (uint);	//inject NONSTANDARD NAMING
}

// File: contracts/loopring/helper/OrderHelper.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;






                      
                                                
library OrderHelper {
    using MathUint      for uint;

    string constant internal eip191_header954 = "\x19\x01";	//inject NONSTANDARD NAMING
    string constant internal eip712_domain_name3 = "Loopring Protocol";	//inject NONSTANDARD NAMING
    string constant internal eip712_domain_version298 = "2";	//inject NONSTANDARD NAMING
    bytes32 constant internal eip712_domain_separator_schema_hash387 = keccak256(	//inject NONSTANDARD NAMING
        abi.encodePacked(
            "EIP712Domain(",
            "string name,",
            "string version",
            ")"
        )
    );
    bytes32 constant internal eip712_order_schema_hash959 = keccak256(	//inject NONSTANDARD NAMING
        abi.encodePacked(
            "Order(",
            "uint amountS,",
            "uint amountB,",
            "uint feeAmount,",
            "uint validSince,",
            "uint validUntil,",
            "address owner,",
            "address tokenS,",
            "address tokenB,",
            "address dualAuthAddr,",
            "address broker,",
            "address orderInterceptor,",
            "address wallet,",
            "address tokenRecipient,",
            "address feeToken,",
            "uint16 walletSplitPercentage,",
            "uint16 tokenSFeePercentage,",
            "uint16 tokenBFeePercentage,",
            "bool allOrNone,",
            "uint8 tokenTypeS,",
            "uint8 tokenTypeB,",
            "uint8 tokenTypeFee,",
            "bytes32 trancheS,",
            "bytes32 trancheB,",
            "bytes transferDataS",
            ")"
        )
    );
    bytes32 constant internal eip712_domain_hash608 = keccak256(	//inject NONSTANDARD NAMING
        abi.encodePacked(
            eip712_domain_separator_schema_hash387,
            keccak256(bytes(eip712_domain_name3)),
            keccak256(bytes(eip712_domain_version298))
        )
    );

    function UPDATEHASH428(Data.Order memory order)	//inject NONSTANDARD NAMING
        internal
        pure
    {
        // Pre-calculated EIP712_ORDER_SCHEMA_HASH amd EIP712_DOMAIN_HASH because
        // the solidity compiler doesn't correctly pre-calculate them for us.
        bytes32 _EIP712_ORDER_SCHEMA_HASH = 0x40b942178d2a51f1f61934268590778feb8114db632db7d88537c98d2b05c5f2;
        bytes32 _EIP712_DOMAIN_HASH = 0xaea25658c273c666156bd427f83a666135fcde6887a6c25fc1cd1562bc4f3f34;

//         bytes32 message = keccak256(
//             abi.encode(
//                 EIP712_ORDER_SCHEMA_HASH,
//                 order.amountS,
//                 order.amountB,
//                 order.feeAmount,
//                 order.validSince,
//                 order.validUntil,
//                 order.owner,
//                 order.tokenS,
//                 order.tokenB,
//                 order.dualAuthAddr,
//                 order.broker,
//                 order.orderInterceptor,
//                 order.wallet,
//                 order.tokenRecipient,
//                 order.feeToken,
//                 order.walletSplitPercentage,
//                 order.tokenSFeePercentage,
//                 order.tokenBFeePercentage,
//                 order.allOrNone,
//                 order.tokenTypeS,
//                 order.tokenTypeB,
//                 order.tokenTypeFee,
//                 order.trancheS,
//                 order.trancheB,
//                 order.transferDataS
//             )
//         );
//         order.hash = keccak256(
//            abi.encodePacked(
//                EIP191_HEADER,
//                EIP712_DOMAIN_HASH,
//                message
//            )
//        );

        bytes32 hash;
        assembly {
            // Calculate the hash for transferDataS separately
            let transferDataS := mload(add(order, 1248))         // order.transferDataS
            let transferDataSHash := keccak256(add(transferDataS, 32), mload(transferDataS))

            let ptr := mload(64)
            mstore(add(ptr,   0), _EIP712_ORDER_SCHEMA_HASH)     // EIP712_ORDER_SCHEMA_HASH
            mstore(add(ptr,  32), mload(add(order, 128)))        // order.amountS
            mstore(add(ptr,  64), mload(add(order, 160)))        // order.amountB
            mstore(add(ptr,  96), mload(add(order, 640)))        // order.feeAmount
            mstore(add(ptr, 128), mload(add(order, 192)))        // order.validSince
            mstore(add(ptr, 160), mload(add(order, 480)))        // order.validUntil
            mstore(add(ptr, 192), mload(add(order,  32)))        // order.owner
            mstore(add(ptr, 224), mload(add(order,  64)))        // order.tokenS
            mstore(add(ptr, 256), mload(add(order,  96)))        // order.tokenB
            mstore(add(ptr, 288), mload(add(order, 288)))        // order.dualAuthAddr
            mstore(add(ptr, 320), mload(add(order, 320)))        // order.broker
            mstore(add(ptr, 352), mload(add(order, 416)))        // order.orderInterceptor
            mstore(add(ptr, 384), mload(add(order, 448)))        // order.wallet
            mstore(add(ptr, 416), mload(add(order, 768)))        // order.tokenRecipient
            mstore(add(ptr, 448), mload(add(order, 608)))        // order.feeToken
            mstore(add(ptr, 480), mload(add(order, 800)))        // order.walletSplitPercentage
            mstore(add(ptr, 512), mload(add(order, 704)))        // order.tokenSFeePercentage
            mstore(add(ptr, 544), mload(add(order, 736)))        // order.tokenBFeePercentage
            mstore(add(ptr, 576), mload(add(order, 576)))        // order.allOrNone
            mstore(add(ptr, 608), mload(add(order, 1024)))       // order.tokenTypeS
            mstore(add(ptr, 640), mload(add(order, 1056)))       // order.tokenTypeB
            mstore(add(ptr, 672), mload(add(order, 1088)))       // order.tokenTypeFee
            mstore(add(ptr, 704), mload(add(order, 1120)))       // order.trancheS
            mstore(add(ptr, 736), mload(add(order, 1152)))       // order.trancheB
            mstore(add(ptr, 768), transferDataSHash)             // keccak256(order.transferDataS)
            let message := keccak256(ptr, 800)                   // 25 * 32

            mstore(add(ptr,  0), 0x1901)                         // EIP191_HEADER
            mstore(add(ptr, 32), _EIP712_DOMAIN_HASH)            // EIP712_DOMAIN_HASH
            mstore(add(ptr, 64), message)                        // message
            hash := keccak256(add(ptr, 30), 66)                  // 2 + 32 + 32
        }

        order.hash = hash;
    }

    function CHECK962(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        Data.Context memory ctx
        )
        internal
        view
    {
        // If the order was already partially filled
        // we don't have to check all of the infos and the signature again
        if(order.filledAmountS == 0) {
            VALIDATEALLINFO28(order, ctx);
            CHECKOWNERSIGNATURE274(order, ctx);
        } else {
            VALIDATEUNSTABLEINFO513(order, ctx);
        }

        order.P2P = (order.tokenSFeePercentage > 0 || order.tokenBFeePercentage > 0);
    }

    function VALIDATEALLINFO28(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        Data.Context memory ctx
        )
        internal
        view
    {
        bool valid = true;
        valid = valid && (order.version == 0); // unsupported order version
        valid = valid && (order.owner != address(0x0)); // invalid order owner
        valid = valid && (order.tokenS != address(0x0)); // invalid order tokenS
        valid = valid && (order.tokenB != address(0x0)); // invalid order tokenB
        valid = valid && (order.amountS != 0); // invalid order amountS
        valid = valid && (order.amountB != 0); // invalid order amountB
        valid = valid && (order.feeToken != address(0x0)); // invalid fee token

        valid = valid && (order.tokenSFeePercentage < ctx.feePercentageBase); // invalid tokenS percentage
        valid = valid && (order.tokenBFeePercentage < ctx.feePercentageBase); // invalid tokenB percentage
        valid = valid && (order.walletSplitPercentage <= 100); // invalid wallet split percentage

        // We only support ERC20 for now
        valid = valid && (order.tokenTypeS == Data.TokenType.ERC20 && order.trancheS == 0x0);
        valid = valid && (order.tokenTypeFee == Data.TokenType.ERC20);

        // NOTICE: replaced to allow orders to specify market's primary token (to denote order side)
        // valid = valid && (order.tokenTypeB == Data.TokenType.ERC20 && order.trancheB == 0x0);
        valid = valid && (order.tokenTypeB == Data.TokenType.ERC20) && (
            BYTES32TOADDRESS476(order.trancheB) == order.tokenB ||
            BYTES32TOADDRESS476(order.trancheB) == order.tokenS
        );

        // NOTICE: commented to allow order.transferDataS to be used for dApps building on Loopring
        // valid = valid && (order.transferDataS.length == 0);

        valid = valid && (order.validSince <= (now + 300)); // order is too early to match

        valid = valid && (!order.allOrNone); // We don't support allOrNone

        require(valid, "INVALID_STABLE_DATA");

        order.valid = order.valid && valid;

        VALIDATEUNSTABLEINFO513(order, ctx);
    }


    function VALIDATEUNSTABLEINFO513(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        Data.Context memory ctx
        )
        internal
        view
    {
        bool valid = true;
        valid = valid && (order.validUntil == 0 || order.validUntil > now - 300);  // order is expired
        valid = valid && (order.waiveFeePercentage <= int16(ctx.feePercentageBase)); // invalid waive percentage
        valid = valid && (order.waiveFeePercentage >= -int16(ctx.feePercentageBase)); // invalid waive percentage
        if (order.dualAuthAddr != address(0x0)) {
            // if dualAuthAddr exists, dualAuthSig must be exist.
            require(order.dualAuthSig.length > 0, "MISSING_DUAL_AUTH_SIGNATURE");
        }
        require(valid, "INVALID_UNSTABLE_DATA");
        order.valid = order.valid && valid;
    }


    function ISBUY429(Data.Order memory order) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return BYTES32TOADDRESS476(order.trancheB) == order.tokenB;
    }

    function CHECKOWNERSIGNATURE274(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        Data.Context memory ctx
        )
        internal
        view
    {
        if (order.sig.length == 0) {
            bool registered = ctx.orderRegistry.ISORDERHASHREGISTERED923(
                order.owner,
                order.hash
            );

            if (!registered) {
                order.valid = order.valid && ctx.orderBook.orderSubmitted(order.hash);
            }
        } else {
            require(order.valid, "INVALID_ORDER_DATA");
            order.valid = order.valid && MultihashUtil.VERIFYSIGNATURE765(
                order.owner,
                order.hash,
                order.sig
            );
            require(order.valid, "INVALID_SIGNATURE");
        }
    }

    function CHECKDUALAUTHSIGNATURE412(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        bytes32 miningHash
        )
        internal
        pure
    {
        if (order.dualAuthSig.length != 0) {
            order.valid = order.valid && MultihashUtil.VERIFYSIGNATURE765(
                order.dualAuthAddr,
                miningHash,
                order.dualAuthSig
            );
            require(order.valid, 'INVALID_DUAL_AUTH_SIGNATURE');
        }
    }

    function GETBROKERHASH807(Data.Order memory order) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encodePacked(order.broker, order.tokenS, order.tokenB, order.feeToken));
    }

    function GETSPENDABLES596(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        Data.Context memory ctx
        )
        internal
        view
        returns (uint)
    {
        return GETSPENDABLE745(
            order,
            ctx.delegate,
            order.tokenS,
            order.owner,
            order.tokenSpendableS
        );
    }

    function GETSPENDABLEFEE527(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        Data.Context memory ctx
        )
        internal
        view
        returns (uint)
    {
        return GETSPENDABLE745(
            order,
            ctx.delegate,
            order.feeToken,
            order.owner,
            order.tokenSpendableFee
        );
    }

    function RESERVEAMOUNTS545(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        uint amount
        )
        internal
        pure
    {
        order.tokenSpendableS.reserved += amount;
    }

    function RESERVEAMOUNTFEE593(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        uint amount
        )
        internal
        pure
    {
        order.tokenSpendableFee.reserved += amount;
    }

    function RESETRESERVATIONS559(	//inject NONSTANDARD NAMING
        Data.Order memory order
        )
        internal
        pure
    {
        order.tokenSpendableS.reserved = 0;
        order.tokenSpendableFee.reserved = 0;
    }

                                                                         
    function GETERC20SPENDABLE789(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        ITradeDelegate delegate,
        address tokenAddress,
        address owner
        )
        private
        view
        returns (uint spendable)
    {
        if (order.broker == address(0x0)) {
            ERC20 token = ERC20(tokenAddress);
            spendable = token.ALLOWANCE557(
                owner,
                address(delegate)
            );
            if (spendable != 0) {
                uint balance = token.BALANCEOF168(owner);
                spendable = (balance < spendable) ? balance : spendable;
            }
        } else {
            IBrokerDelegate broker = IBrokerDelegate(order.broker);
            spendable = broker.BROKERBALANCEOF735(owner, tokenAddress);
        }
    }

    function GETSPENDABLE745(	//inject NONSTANDARD NAMING
        Data.Order memory order,
        ITradeDelegate delegate,
        address tokenAddress,
        address owner,
        Data.Spendable memory tokenSpendable
        )
        private
        view
        returns (uint spendable)
    {
        if (!tokenSpendable.initialized) {
            tokenSpendable.amount = GETERC20SPENDABLE789(
                order,
                delegate,
                tokenAddress,
                owner
            );
            tokenSpendable.initialized = true;
        }
        spendable = tokenSpendable.amount.SUB280(tokenSpendable.reserved);
    }

    function BYTES32TOADDRESS476(bytes32 data) private pure returns (address) {	//inject NONSTANDARD NAMING
        return address(uint160(uint256(data)));
    }
}

// File: contracts/loopring/impl/ExchangeDeserializer.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity 0.5.7;




                                                      
                                                
library ExchangeDeserializer {
    using BytesUtil     for bytes;

    function DESERIALIZERINGINDICES41(	//inject NONSTANDARD NAMING
        Data.Order[] memory orders,
        Data.RingIndices[] memory ringIndices
    ) internal
        view returns (
            Data.Ring[] memory rings
        ) {
        rings = new Data.Ring[](ringIndices.length);
        for (uint i = 0; i < ringIndices.length; i++) {
            rings[i].size = 2;
            rings[i].participations = new Data.Participation[](2);

            rings[i].participations[0] = Data.Participation({
                order: orders[ringIndices[i].index0],
                splitS: uint(0),
                feeAmount: uint(0),
                feeAmountS: uint(0),
                feeAmountB: uint(0),
                rebateFee: uint(0),
                rebateS: uint(0),
                rebateB: uint(0),
                fillAmountS: uint(0),
                fillAmountB: uint(0)
            });

            rings[i].participations[1] = Data.Participation({
                order: orders[ringIndices[i].index1],
                splitS: uint(0),
                feeAmount: uint(0),
                feeAmountS: uint(0),
                feeAmountB: uint(0),
                rebateFee: uint(0),
                rebateS: uint(0),
                rebateB: uint(0),
                fillAmountS: uint(0),
                fillAmountB: uint(0)
            });

            rings[i].hash = bytes32(0);
            rings[i].minerFeesToOrdersPercentage = uint(0);
            rings[i].valid = true;
        }
    }

    function DESERIALIZE920(	//inject NONSTANDARD NAMING
        address lrcTokenAddress,
        bytes memory data
        )
        internal
        view
        returns (
            Data.Mining memory mining,
            Data.Order[] memory orders,
            Data.Ring[] memory rings
        )
    {
        // Read the header
        Data.Header memory header;
        header.version = data.BYTESTOUINT16729(0);
        header.numOrders = data.BYTESTOUINT16729(2);
        header.numRings = data.BYTESTOUINT16729(4);
        header.numSpendables = data.BYTESTOUINT16729(6);

        // Validation
        require(header.version == 0, "Unsupported serialization format");
        require(header.numOrders > 0, "Invalid number of orders");
        require(header.numRings > 0, "Invalid number of rings");
        require(header.numSpendables > 0, "Invalid number of spendables");

        // Calculate data pointers
        uint dataPtr;
        assembly {
            dataPtr := data
        }
        uint miningDataPtr = dataPtr + 8;
        uint orderDataPtr = miningDataPtr + 3 * 2;
        uint ringDataPtr = orderDataPtr + (32 * header.numOrders) * 2;
        uint dataBlobPtr = ringDataPtr + (header.numRings * 9) + 32;

        // The data stream needs to be at least large enough for the
        // header/mining/orders/rings data + 64 bytes of zeros in the data blob.
        require(data.length >= (dataBlobPtr - dataPtr) + 32, "Invalid input data");

        // Setup the rings
        mining = SETUPMININGDATA731(dataBlobPtr, miningDataPtr + 2);
        orders = SETUPORDERS860(dataBlobPtr, orderDataPtr + 2, header.numOrders, header.numSpendables, lrcTokenAddress);
        rings = ASSEMBLERINGS112(ringDataPtr + 1, header.numRings, orders);
    }

    function SETUPMININGDATA731(	//inject NONSTANDARD NAMING
        uint data,
        uint tablesPtr
        )
        internal
        view
        returns (Data.Mining memory mining)
    {
        bytes memory emptyBytes = new bytes(0);
        uint offset;

        assembly {
            // Default to transaction origin for feeRecipient
            mstore(add(data, 20), origin)

            // mining.feeRecipient
            offset := mul(and(mload(add(tablesPtr,  0)), 0xFFFF), 4)
            mstore(
                add(mining,   0),
                mload(add(add(data, 20), offset))
            )

            // Restore default to 0
            mstore(add(data, 20), 0)

            // mining.miner
            offset := mul(and(mload(add(tablesPtr,  2)), 0xFFFF), 4)
            mstore(
                add(mining,  32),
                mload(add(add(data, 20), offset))
            )

            // Default to empty bytes array
            mstore(add(data, 32), emptyBytes)

            // mining.sig
            offset := mul(and(mload(add(tablesPtr,  4)), 0xFFFF), 4)
            mstore(
                add(mining, 64),
                add(data, add(offset, 32))
            )

            // Restore default to 0
            mstore(add(data, 32), 0)
        }
    }

    function SETUPORDERS860(	//inject NONSTANDARD NAMING
        uint data,
        uint tablesPtr,
        uint numOrders,
        uint numSpendables,
        address lrcTokenAddress
        )
        internal
        pure
        returns (Data.Order[] memory orders)
    {
        bytes memory emptyBytes = new bytes(0);
        uint orderStructSize = 40 * 32;
        // Memory for orders length + numOrders order pointers
        uint arrayDataSize = (1 + numOrders) * 32;
        Data.Spendable[] memory spendableList = new Data.Spendable[](numSpendables);
        uint offset;

        assembly {
            // Allocate memory for all orders
            orders := mload(0x40)
            mstore(add(orders, 0), numOrders)                       // orders.length
            // Reserve the memory for the orders array
            mstore(0x40, add(orders, add(arrayDataSize, mul(orderStructSize, numOrders))))

            for { let i := 0 } lt(i, numOrders) { i := add(i, 1) } {
                let order := add(orders, add(arrayDataSize, mul(orderStructSize, i)))

                // Store the memory location of this order in the orders array
                mstore(add(orders, mul(add(1, i), 32)), order)

                // order.version
                offset := and(mload(add(tablesPtr,  0)), 0xFFFF)
                mstore(
                    add(order,   0),
                    offset
                )

                // order.owner
                offset := mul(and(mload(add(tablesPtr,  2)), 0xFFFF), 4)
                mstore(
                    add(order,  32),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // order.tokenS
                offset := mul(and(mload(add(tablesPtr,  4)), 0xFFFF), 4)
                mstore(
                    add(order,  64),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // order.tokenB
                offset := mul(and(mload(add(tablesPtr,  6)), 0xFFFF), 4)
                mstore(
                    add(order,  96),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // order.amountS
                offset := mul(and(mload(add(tablesPtr,  8)), 0xFFFF), 4)
                mstore(
                    add(order, 128),
                    mload(add(add(data, 32), offset))
                )

                // order.amountB
                offset := mul(and(mload(add(tablesPtr, 10)), 0xFFFF), 4)
                mstore(
                    add(order, 160),
                    mload(add(add(data, 32), offset))
                )

                // order.validSince
                offset := mul(and(mload(add(tablesPtr, 12)), 0xFFFF), 4)
                mstore(
                    add(order, 192),
                    and(mload(add(add(data, 4), offset)), 0xFFFFFFFF)
                )

                // order.tokenSpendableS
                offset := and(mload(add(tablesPtr, 14)), 0xFFFF)
                // Force the spendable index to 0 if it's invalid
                offset := mul(offset, lt(offset, numSpendables))
                mstore(
                    add(order, 224),
                    mload(add(spendableList, mul(add(offset, 1), 32)))
                )

                // order.tokenSpendableFee
                offset := and(mload(add(tablesPtr, 16)), 0xFFFF)
                // Force the spendable index to 0 if it's invalid
                offset := mul(offset, lt(offset, numSpendables))
                mstore(
                    add(order, 256),
                    mload(add(spendableList, mul(add(offset, 1), 32)))
                )

                // order.dualAuthAddr
                offset := mul(and(mload(add(tablesPtr, 18)), 0xFFFF), 4)
                mstore(
                    add(order, 288),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // order.broker
                offset := mul(and(mload(add(tablesPtr, 20)), 0xFFFF), 4)
                mstore(
                    add(order, 320),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // order.orderInterceptor
                offset := mul(and(mload(add(tablesPtr, 22)), 0xFFFF), 4)
                mstore(
                    add(order, 416),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // order.wallet
                offset := mul(and(mload(add(tablesPtr, 24)), 0xFFFF), 4)
                mstore(
                    add(order, 448),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // order.validUntil
                offset := mul(and(mload(add(tablesPtr, 26)), 0xFFFF), 4)
                mstore(
                    add(order, 480),
                    and(mload(add(add(data,  4), offset)), 0xFFFFFFFF)
                )

                // Default to empty bytes array for value sig and dualAuthSig
                mstore(add(data, 32), emptyBytes)

                // order.sig
                offset := mul(and(mload(add(tablesPtr, 28)), 0xFFFF), 4)
                mstore(
                    add(order, 512),
                    add(data, add(offset, 32))
                )

                // order.dualAuthSig
                offset := mul(and(mload(add(tablesPtr, 30)), 0xFFFF), 4)
                mstore(
                    add(order, 544),
                    add(data, add(offset, 32))
                )

                // Restore default to 0
                mstore(add(data, 32), 0)

                // order.allOrNone
                offset := and(mload(add(tablesPtr, 32)), 0xFFFF)
                mstore(
                    add(order, 576),
                    gt(offset, 0)
                )

                // lrcTokenAddress is the default value for feeToken
                mstore(add(data, 20), lrcTokenAddress)

                // order.feeToken
                offset := mul(and(mload(add(tablesPtr, 34)), 0xFFFF), 4)
                mstore(
                    add(order, 608),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // Restore default to 0
                mstore(add(data, 20), 0)

                // order.feeAmount
                offset := mul(and(mload(add(tablesPtr, 36)), 0xFFFF), 4)
                mstore(
                    add(order, 640),
                    mload(add(add(data, 32), offset))
                )

                // order.waiveFeePercentage
                offset := and(mload(add(tablesPtr, 38)), 0xFFFF)
                mstore(
                    add(order, 672),
                    offset
                )

                // order.tokenSFeePercentage
                offset := and(mload(add(tablesPtr, 40)), 0xFFFF)
                mstore(
                    add(order, 704),
                    offset
                )

                // order.tokenBFeePercentage
                offset := and(mload(add(tablesPtr, 42)), 0xFFFF)
                mstore(
                    add(order, 736),
                    offset
                )

                // The owner is the default value of tokenRecipient
                mstore(add(data, 20), mload(add(order, 32)))                // order.owner

                // order.tokenRecipient
                offset := mul(and(mload(add(tablesPtr, 44)), 0xFFFF), 4)
                mstore(
                    add(order, 768),
                    and(mload(add(add(data, 20), offset)), 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )

                // Restore default to 0
                mstore(add(data, 20), 0)

                // order.walletSplitPercentage
                offset := and(mload(add(tablesPtr, 46)), 0xFFFF)
                mstore(
                    add(order, 800),
                    offset
                )

                // order.tokenTypeS
                offset := and(mload(add(tablesPtr, 48)), 0xFFFF)
                mstore(
                    add(order, 1024),
                    offset
                )

                // order.tokenTypeB
                offset := and(mload(add(tablesPtr, 50)), 0xFFFF)
                mstore(
                    add(order, 1056),
                    offset
                )

                // order.tokenTypeFee
                offset := and(mload(add(tablesPtr, 52)), 0xFFFF)
                mstore(
                    add(order, 1088),
                    offset
                )

                // order.trancheS
                offset := mul(and(mload(add(tablesPtr, 54)), 0xFFFF), 4)
                mstore(
                    add(order, 1120),
                    mload(add(add(data, 32), offset))
                )

                // order.trancheB
                offset := mul(and(mload(add(tablesPtr, 56)), 0xFFFF), 4)
                mstore(
                    add(order, 1152),
                    mload(add(add(data, 32), offset))
                )

                // Restore default to 0
                mstore(add(data, 20), 0)

                // order.maxPrimaryFillAmount
                offset := mul(and(mload(add(tablesPtr, 58)), 0xFFFF), 4)
                mstore(
                    add(order, 1184),
                    mload(add(add(data, 32), offset))
                )

                // order.allOrNone
                offset := and(mload(add(tablesPtr, 60)), 0xFFFF)
                mstore(
                    add(order, 1216),
                    gt(offset, 0)
                )

                // Default to empty bytes array for transferDataS
                mstore(add(data, 32), emptyBytes)

                // order.transferDataS
                offset := mul(and(mload(add(tablesPtr, 62)), 0xFFFF), 4)
                mstore(
                    add(order, 1248),
                    add(data, add(offset, 32))
                )

                // Restore default to 0
                mstore(add(data, 32), 0)

                // Set default  values
                mstore(add(order, 832), 0)         // order.P2P
                mstore(add(order, 864), 0)         // order.hash
                mstore(add(order, 896), 0)         // order.brokerInterceptor
                mstore(add(order, 928), 0)         // order.filledAmountS
                mstore(add(order, 960), 0)         // order.initialFilledAmountS
                mstore(add(order, 992), 1)         // order.valid

                // Advance to the next order
                tablesPtr := add(tablesPtr, 64)
            }
        }
    }

    function ASSEMBLERINGS112(	//inject NONSTANDARD NAMING
        uint data,
        uint numRings,
        Data.Order[] memory orders
        )
        internal
        pure
        returns (Data.Ring[] memory rings)
    {
        uint ringsArrayDataSize = (1 + numRings) * 32;
        uint ringStructSize = 5 * 32;
        uint participationStructSize = 10 * 32;

        assembly {
            // Allocate memory for all rings
            rings := mload(0x40)
            mstore(add(rings, 0), numRings)                      // rings.length
            // Reserve the memory for the rings array
            mstore(0x40, add(rings, add(ringsArrayDataSize, mul(ringStructSize, numRings))))

            for { let r := 0 } lt(r, numRings) { r := add(r, 1) } {
                let ring := add(rings, add(ringsArrayDataSize, mul(ringStructSize, r)))

                // Store the memory location of this ring in the rings array
                mstore(add(rings, mul(add(r, 1), 32)), ring)

                // Get the ring size
                let ringSize := and(mload(data), 0xFF)
                data := add(data, 1)

                // require(ringsSize <= 8)
                if gt(ringSize, 8) {
                    revert(0, 0)
                }

                // Allocate memory for all participations
                let participations := mload(0x40)
                mstore(add(participations, 0), ringSize)         // participations.length
                // Memory for participations length + ringSize participation pointers
                let participationsData := add(participations, mul(add(1, ringSize), 32))
                // Reserve the memory for the participations
                mstore(0x40, add(participationsData, mul(participationStructSize, ringSize)))

                // Initialize ring properties
                mstore(add(ring,   0), ringSize)                 // ring.size
                mstore(add(ring,  32), participations)           // ring.participations
                mstore(add(ring,  64), 0)                        // ring.hash
                mstore(add(ring,  96), 0)                        // ring.minerFeesToOrdersPercentage
                mstore(add(ring, 128), 1)                        // ring.valid

                for { let i := 0 } lt(i, ringSize) { i := add(i, 1) } {
                    let participation := add(participationsData, mul(participationStructSize, i))

                    // Store the memory location of this participation in the participations array
                    mstore(add(participations, mul(add(i, 1), 32)), participation)

                    // Get the order index
                    let orderIndex := and(mload(data), 0xFF)
                    // require(orderIndex < orders.length)
                    if iszero(lt(orderIndex, mload(orders))) {
                        revert(0, 0)
                    }
                    data := add(data, 1)

                    // participation.order
                    mstore(
                        add(participation,   0),
                        mload(add(orders, mul(add(orderIndex, 1), 32)))
                    )

                    // Set default values
                    mstore(add(participation,  32), 0)          // participation.splitS
                    mstore(add(participation,  64), 0)          // participation.feeAmount
                    mstore(add(participation,  96), 0)          // participation.feeAmountS
                    mstore(add(participation, 128), 0)          // participation.feeAmountB
                    mstore(add(participation, 160), 0)          // participation.rebateFee
                    mstore(add(participation, 192), 0)          // participation.rebateS
                    mstore(add(participation, 224), 0)          // participation.rebateB
                    mstore(add(participation, 256), 0)          // participation.fillAmountS
                    mstore(add(participation, 288), 0)          // participation.fillAmountB
                }

                // Advance to the next ring
                data := add(data, sub(8, ringSize))
            }
        }
    }
}

// File: contracts/dolomite-margin-protocol/DolomiteMarginProtocol.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity 0.5.7;

// =================================
// External Contract Interfaces/Structs/Etc.


// =================================
// External Helpers


// =================================
// Loopring Codebase




// =================================
// Dolomite Margin Trading Protocol

library RunTime {
  struct OutgoingAllowanceTrigger {
    address signer;
    uint marketId;
    uint amount;
  }

  struct TokenTransfer {
    address from;
    address to;
    address token;
    uint amount;
  }

  struct Context {
    address self;
    IDepositContractRegistry depositContractRegistry;
    address dydxExpiryContractAddress;
    Order.Info[] orders;
    address[] marketTokenAddress;
            
    bytes32[] depositFlagTriggers;
    TokenTransfer[] tokenTransfers;
    OutgoingAllowanceTrigger[] setOutgoingAllowanceTriggers;
    DydxPosition.Info[] dydxPositions;
    DydxActions.ActionArgs[] dydxBeforeActions;
    DydxActions.ActionArgs[] dydxAfterActions;
    uint numDepositFlagTriggers;
    uint numTokenTransfers;
    uint numSetOutgoingAllowanceTriggers;
    uint numDydxPositions;
    uint numDydxBeforeActions;
    uint numDydxAfterActions;
  }

  // ---------------------------------

  function SETDEPOSITFLAG14(Context memory ctx, bytes32 orderHash) internal pure {	//inject NONSTANDARD NAMING
    ctx.depositFlagTriggers[ctx.numDepositFlagTriggers] = orderHash;
    ctx.numDepositFlagTriggers += 1;
  }

  function REQUIRETOKENTRANSFER839(	//inject NONSTANDARD NAMING
    Context memory ctx,
    address from,
    address to,
    address token,
    uint amount
  ) internal pure {
    for (uint i = 0; i < ctx.numTokenTransfers; i++) {
      TokenTransfer memory transfer = ctx.tokenTransfers[i];
      if (transfer.from == from && transfer.to == to && transfer.token == token) {
        transfer.amount += amount;
        return;
      }
    }

    ctx.tokenTransfers[ctx.numTokenTransfers] = TokenTransfer(from, to, token, amount);
    ctx.numTokenTransfers += 1;
  }

  function REGISTERPOSITION584(	//inject NONSTANDARD NAMING
    Context memory ctx,
    address trader,
    uint positionId
  ) internal pure returns (uint) {
    for (uint i = 0; i < ctx.numDydxPositions; i++) {
      if (ctx.dydxPositions[i].owner == trader && ctx.dydxPositions[i].number == positionId) {
        return i;
      }
    }

    ctx.dydxPositions[ctx.numDydxPositions] = DydxPosition.Info(trader, positionId);
    ctx.numDydxPositions += 1;
    return ctx.numDydxPositions - 1;
  }

  function ADDBEFOREACTION898(Context memory ctx, DydxActions.ActionArgs memory action) internal pure {	//inject NONSTANDARD NAMING
    ctx.dydxBeforeActions[ctx.numDydxBeforeActions] = action;
    ctx.numDydxBeforeActions += 1;
  }

  function ADDAFTERACTION978(Context memory ctx, DydxActions.ActionArgs memory action) internal pure {	//inject NONSTANDARD NAMING
    ctx.dydxAfterActions[ctx.numDydxAfterActions] = action;
    ctx.numDydxAfterActions += 1;
  }
}

library Order {

  using OrderHelper for Data.Order;

  struct Info {
    address signer;
    address tokenS;
    address tokenB;
    bytes32 orderHash;
    bytes extraData;
  }

  struct TradeInfo {
    bool usingDepositContract;
    uint positionId;
    uint expirationDays;
    uint depositMarketId;
    uint depositAmount;
            
    address trader;
  }

  function TRADEINFO296(Order.Info memory order, RunTime.Context memory ctx) internal view returns (Order.TradeInfo memory info) {	//inject NONSTANDARD NAMING
    (
      info.usingDepositContract,
      info.positionId,
      info.expirationDays,
      info.depositMarketId,
      info.depositAmount
    ) = abi.decode(order.extraData, (bool, uint, uint, uint, uint));

    info.trader = info.usingDepositContract
      ? ctx.depositContractRegistry.DEPOSITADDRESSOF939(order.signer)
      : info.trader = order.signer;

    return info;
  }

  function DECODERAWORDERS16(bytes memory ringData, uint[] memory relevantOrderIndices)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (Order.Info[] memory orders)
  {
    orders = new Order.Info[](relevantOrderIndices.length);
    Data.Order[] memory rawOrders = LoopringOrderDecoder.DECODELOOPRINGORDERS994(ringData, relevantOrderIndices);

    bytes memory emptyBytes = new bytes(0);
    for (uint i = 0; i < orders.length; i++) {
      rawOrders[i].UPDATEHASH428();
      orders[i] = Order.Info({
        signer: rawOrders[i].owner,
        tokenS: rawOrders[i].tokenS,
        tokenB: rawOrders[i].tokenB,
        orderHash: rawOrders[i].hash,
        extraData: rawOrders[i].transferDataS
      });
    }
  }
}

library Activity {
  using RunTime for RunTime.Context;
  using Order for Order.Info;
  using Activity for *;

  enum Type { Trade, Loan, Liquidation }
  enum TradeMovementType { None, DepositAll, WithdrawAll }

  struct Trade {
    uint orderIndex;
    uint marketIdS;
    uint marketIdB;
    uint fillAmountS;
    TradeMovementType movementType;
  }

  struct Loan {
    // TODO
    uint orderIndex;
  }

  struct Liquidation {
    // TODO
    bool isSafe;
  }

  function REGISTERACTIVITY194(RunTime.Context memory ctx, Activity.Type activityType, bytes memory encodedFields) internal view {	//inject NONSTANDARD NAMING
    if (activityType == Type.Trade) encodedFields._DECODETRADEACTIVITY565()._GENERATETRADEACTIONS828(ctx);
    else if (activityType == Type.Loan) encodedFields._DECODELOANACTIVITY762()._GENERATELOANACTIONS131(ctx);
    else if (activityType == Type.Liquidation) encodedFields._DECODELIQUIDATIONACTIVITY18()._GENERATELIQUIDATIONACTIONS13(ctx);
  }

  // ---------------------------------

  function _DECODETRADEACTIVITY565(bytes memory encoded) internal pure returns (Activity.Trade memory trade) {	//inject NONSTANDARD NAMING
    return abi.decode(encoded, (Activity.Trade));
  }

  function _DECODELOANACTIVITY762(bytes memory encoded) internal pure returns (Activity.Loan memory loan) {	//inject NONSTANDARD NAMING
    revert("NOT_IMPLEMENTED: Activity.Type.Loan is not yet supported");
  }

  function _DECODELIQUIDATIONACTIVITY18(bytes memory encoded) internal pure returns (Activity.Liquidation memory liquidation) {	//inject NONSTANDARD NAMING
    revert("NOT_IMPLEMENTED: Activity.Type.Liquidation is not yet supported");
  }

  // ---------------------------------

  function _GENERATETRADEACTIONS828(Activity.Trade memory trade, RunTime.Context memory ctx) internal view {	//inject NONSTANDARD NAMING
    Order.Info memory order = ctx.orders[trade.orderIndex];
    Order.TradeInfo memory tradeInfo = order.TRADEINFO296(ctx);

    uint positionIndex = ctx.REGISTERPOSITION584(tradeInfo.trader, tradeInfo.positionId);

    // Requirements for deposit of trader's collateral
    if (trade.movementType == Activity.TradeMovementType.DepositAll) {
      address depositToken = ctx.marketTokenAddress[tradeInfo.depositMarketId];
      ctx.REQUIRETOKENTRANSFER839(tradeInfo.trader, ctx.self, depositToken, tradeInfo.depositAmount);
      ctx.ADDBEFOREACTION898(DydxActionBuilder.DEPOSIT716(positionIndex, tradeInfo.depositMarketId, tradeInfo.depositAmount, ctx.self));
      ctx.SETDEPOSITFLAG14(order.orderHash);
    }

    // Actions for borrowing tokens to exchange and depositing what was received
    ctx.ADDBEFOREACTION898(DydxActionBuilder.WITHDRAW648(positionIndex, trade.marketIdS, trade.fillAmountS, ctx.self));
    ctx.ADDAFTERACTION978(DydxActionBuilder.DEPOSITALL419({
      positionIndex: positionIndex,
      marketId: trade.marketIdB,
      burnMarketId: trade.marketIdS,
      controller: ctx.self,
      orderHash: order.orderHash
    }));

    // Actions to withdraw the position's balances to the trader
    if (trade.movementType == Activity.TradeMovementType.WithdrawAll) {
      ctx.ADDAFTERACTION978(DydxActionBuilder.WITHDRAWALL494(positionIndex, trade.marketIdS, tradeInfo.trader));
      ctx.ADDAFTERACTION978(DydxActionBuilder.WITHDRAWALL494(positionIndex, trade.marketIdB, tradeInfo.trader));
    }

    // Action for setting the expiration timestamp of the position
    if (trade.movementType == Activity.TradeMovementType.DepositAll && tradeInfo.expirationDays > 0) {
      uint expirationTime = block.timestamp + (tradeInfo.expirationDays * 60 * 60 * 24);
      ctx.ADDAFTERACTION978(DydxActionBuilder.SETEXPIRY307(positionIndex, ctx.dydxExpiryContractAddress, trade.marketIdS, expirationTime));
    }
  }

  function _GENERATELOANACTIONS131(Activity.Loan memory trade, RunTime.Context memory ctx) internal pure {            }	//inject NONSTANDARD NAMING

  function _GENERATELIQUIDATIONACTIONS13(Activity.Liquidation memory trade, RunTime.Context memory ctx) internal pure {            }	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
contract DolomiteMarginProtocol is IDydxCallee, ILoopringBrokerDelegate, IDydxExchangeWrapper {
  using Order for *;
  using Activity for *;
  using LoopringTradeDelegateHelper for ILoopringTradeDelegate;
  using SafeMath for *;

  struct ActivityArg {
    Activity.Type activityType;
    bytes encodedFields;
  }

  struct RelayParams {
    uint[] relevantOrderIndices;
    uint[] relevantMarketIds;
    ActivityArg[] activityArgs;
    address dustCollector;
  }

  address public DYDX_EXPIRY_ADDRESS;
  IDydxProtocol public DYDX_PROTOCOL;
  ILoopringProtocol public LOOPRING_PROTOCOL;
  IDepositContractRegistry public DEPOSIT_CONTRACT_REGISTRY;
  ILoopringTradeDelegate public TRADE_DELEGATE;

  address owner;

  constructor(
    address dydxProtocol,
    address payable loopringProtocol,
    address dydxExpiry,
    address depositContractRegistry
  ) public {
    DYDX_PROTOCOL = IDydxProtocol(dydxProtocol);
    LOOPRING_PROTOCOL = ILoopringProtocol(loopringProtocol);
    TRADE_DELEGATE = ILoopringTradeDelegate(LOOPRING_PROTOCOL.DELEGATEADDRESS554());
    DEPOSIT_CONTRACT_REGISTRY = IDepositContractRegistry(depositContractRegistry);
    DYDX_EXPIRY_ADDRESS = dydxExpiry;

    owner = msg.sender;
  }

  // =================================

  uint256 private _guardCounter;

  // Functions with this modifer can not be re-entered
  // (sets counter to odd number when executing, even when finished)
  modifier SINGLEENTRY156 {	//inject NONSTANDARD NAMING
    _guardCounter += 1;
    uint current = _guardCounter;
    _;
    require(current == _guardCounter, "NO_ENTRY: Cannot re-enter contract");
    _guardCounter += 1;
  }

  // Functions with this modifier can only be called after entering a singleEntry function
  modifier NOENTRY782 {	//inject NONSTANDARD NAMING
    require(_guardCounter % 2 == 1, "NO_ENTRY: Cannot enter a noEntry function"); // counter must be odd number
    _;
  }

  modifier ONLYOWNER157 {	//inject NONSTANDARD NAMING
    require(msg.sender == owner, "UNAUTHORIZED");
    _;
  }

  // =================================

  mapping(bytes32 => bool) private orderHasDeposited;
  mapping(bytes32 => mapping(address => uint)) private runtimeIncomingAmount;

  function SETNEWOWNER288(address newOwner) public ONLYOWNER157 {	//inject NONSTANDARD NAMING
    owner = newOwner;
  }

  function WITHDRAWDUST302(address token) public ONLYOWNER157 {	//inject NONSTANDARD NAMING
    ERC20(token).TRANSFER126(owner, ERC20(token).BALANCEOF168(address(this)));
  }

                                                                                                                                                                                                                                                                                                                                              
  function SUBMITRINGSTHROUGHDYDX809(	//inject NONSTANDARD NAMING
    bytes memory ringData,
    RelayParams memory params
  ) public SINGLEENTRY156 {
    Order.Info[] memory orders = ringData.DECODERAWORDERS16(params.relevantOrderIndices);
    SUBMITRINGSTHROUGHDYDX809(ringData, params, orders,                  false);
  }

                                                                                                                                                                                                                                                                                                                                              
  function SUBMITRINGSTHROUGHDYDX809(	//inject NONSTANDARD NAMING
    bytes memory ringData,
    RelayParams memory params,
    Order.Info[] memory orders,
    bool isTypeSafe
  ) internal {
    RunTime.Context memory ctx = _CREATERUNTIMECONTEXT8(orders, params);
    _REGISTERACTIVITIES164(ctx, params.activityArgs);
    _RESOLVEDEPOSITFLAGTRIGGERS64(ctx);
    _PERFORMTOKENTRANSFERS154(ctx);

    (
      DydxPosition.Info[] memory positions,
      DydxActions.ActionArgs[] memory actions
    ) = _GENERATEDYDXPERFORMPARAMS782(ctx, ringData, isTypeSafe);

    DYDX_PROTOCOL.OPERATE938(positions, actions);

     _CLEARRUNTIME891(ctx);
  }

  function _CREATERUNTIMECONTEXT8(Order.Info[] memory orders, RelayParams memory params)	//inject NONSTANDARD NAMING
    internal
    view
    returns (RunTime.Context memory ctx)
  {
    uint numActivities = params.activityArgs.length;

    uint totalNumMarkets = DYDX_PROTOCOL.GETNUMMARKETS339();
    ctx.marketTokenAddress = new address[](totalNumMarkets);
    for (uint i = 0; i < params.relevantMarketIds.length; i++) {
      ctx.marketTokenAddress[params.relevantMarketIds[i]] = DYDX_PROTOCOL.GETMARKETTOKENADDRESS199(params.relevantMarketIds[i]);
    }

    ctx.self = address(this);
    ctx.orders = orders;
    ctx.depositContractRegistry = DEPOSIT_CONTRACT_REGISTRY;
    ctx.dydxExpiryContractAddress = DYDX_EXPIRY_ADDRESS;
    ctx.depositFlagTriggers = new bytes32[](numActivities);
    ctx.tokenTransfers = new RunTime.TokenTransfer[](numActivities);
    ctx.dydxPositions = new DydxPosition.Info[](numActivities);
    ctx.dydxBeforeActions = new DydxActions.ActionArgs[](numActivities * 3);
    ctx.dydxAfterActions = new DydxActions.ActionArgs[](numActivities * 3);

    return ctx;
  }

  function _REGISTERACTIVITIES164(RunTime.Context memory ctx, ActivityArg[] memory activityArgs) internal view {	//inject NONSTANDARD NAMING
    for (uint i = 0; i < activityArgs.length; i++) {
      ActivityArg memory arg = activityArgs[i];
      ctx.REGISTERACTIVITY194(arg.activityType, arg.encodedFields);
    }
  }

  function _RESOLVEDEPOSITFLAGTRIGGERS64(RunTime.Context memory ctx) internal {	//inject NONSTANDARD NAMING
    for (uint i = 0; i < ctx.numDepositFlagTriggers; i++) {
      bytes32 orderHash = ctx.depositFlagTriggers[i];
      require(orderHasDeposited[orderHash] == false, "ORDER_DEPOSIT_REJECTED: deposit already performed");
      orderHasDeposited[orderHash] = true;
    }
  }

  function _PERFORMTOKENTRANSFERS154(RunTime.Context memory ctx) internal {	//inject NONSTANDARD NAMING
    for (uint i = 0; i < ctx.numTokenTransfers; i++) {
      RunTime.TokenTransfer memory transfer = ctx.tokenTransfers[i];
      TRADE_DELEGATE.TRANSFERTOKENFROM498(
        transfer.token,
        transfer.from,
        transfer.to,
        transfer.amount
      );
    }
  }

  function _GENERATEDYDXPERFORMPARAMS782(RunTime.Context memory ctx, bytes memory ringData, bool isTypeSafe)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (DydxPosition.Info[] memory positions, DydxActions.ActionArgs[] memory actions)
  {
    positions = new DydxPosition.Info[](ctx.numDydxPositions + 1);
    actions = new DydxActions.ActionArgs[](ctx.numDydxBeforeActions + ctx.numDydxAfterActions + 1);

    // Trim positions array & insert before actions to beginning of actions array
    for (uint i = 0; i < ctx.numDydxPositions; i++) positions[i] = ctx.dydxPositions[i];
    for (uint j = 0; j < ctx.numDydxBeforeActions; j++) actions[j] = ctx.dydxBeforeActions[j];

    // Insert Loopring settlement action after the before actions
    positions[ctx.numDydxPositions] = DydxPosition.Info(ctx.self, 123456789);
    actions[ctx.numDydxBeforeActions] = DydxActionBuilder.LOOPRINGSETTLEMENT973({
      settlementData: abi.encode(isTypeSafe, ringData),
      settlementCaller: ctx.self,
      positionIndex: ctx.numDydxPositions
    });

    // Insert all of the after actions after Loopring settlement is to take place
    for (uint k = 0; k < ctx.numDydxAfterActions; k++)
      actions[k + ctx.numDydxBeforeActions + 1] = ctx.dydxAfterActions[k];
  }

   function _CLEARRUNTIME891(RunTime.Context memory ctx) internal {	//inject NONSTANDARD NAMING
     for (uint i = 0; i < ctx.orders.length; i++) {
       bytes32 orderHash = ctx.orders[i].orderHash;
       for (uint j = 0; j < ctx.marketTokenAddress.length; j++) {
         runtimeIncomingAmount[orderHash][ctx.marketTokenAddress[j]] = 0;
       }
     }
   }

  // =================================
  // Loopring Settlement & dYdX Action Callbacks

                                                                                                                                                                                                                                                                                                                                         
  function CALLFUNCTION751(	//inject NONSTANDARD NAMING
    address sender,
    DydxPosition.Info memory accountInfo,
    bytes memory data
  ) public NOENTRY782 {
    require(msg.sender == address(DYDX_PROTOCOL), "INVALID_CALLER: IDyDxCallee caller must be dYdX protocol");
    (bool isTypeSafe, bytes memory ringData) = abi.decode(data, (bool, bytes));
    if(isTypeSafe) {
      revert("Submitting rings with type safety is not enabled!");
//      LOOPRING_PROTOCOL.submitRings(abi.decode(ringData, (Data.SubmitRingsRequest)));
    } else {
      LOOPRING_PROTOCOL.SUBMITRINGS514(ringData);
    }
  }

                                                                                                                                                                                                                                                                  
  function BROKERBALANCEOF735(address owner, address token) public view NOENTRY782 returns (uint) {	//inject NONSTANDARD NAMING
    require(msg.sender == address(LOOPRING_PROTOCOL));
    return 10**70;
  }

                                                                                                                                                                                                                                                                                                                                                                                      
  function BROKERREQUESTALLOWANCE941(LoopringTypes.BrokerApprovalRequest memory request) public NOENTRY782 returns (bool) {	//inject NONSTANDARD NAMING
    require(msg.sender == address(TRADE_DELEGATE), "INVALID_CALLER: Caller of broker impl must be Loopring Delegate");

    for (uint i = 0; i < request.orders.length; i++) {
      LoopringTypes.BrokerOrder memory order = request.orders[i];

      require(order.tokenRecipient == address(this), "INVALID_RECIPIENT: Token recipient must be set to margin protocol");
      require(order.requestedFeeAmount == 0, "INVALID_ORDER_FEE: FeeToken must be in tokenB of Loopring order");

      runtimeIncomingAmount[order.orderHash][request.tokenB] = order.fillAmountB;
    }

    return false;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function EXCHANGE345(	//inject NONSTANDARD NAMING
    address tradeOriginator,
    address receiver,
    address makerToken,
    address takerToken,
    uint256 requestedFillAmount,
    bytes memory orderData
  ) public NOENTRY782 returns (uint256) {
    require(msg.sender == address(DYDX_PROTOCOL), "INVALID_EXCHANGE_CALLER");
    bytes32 orderHash = abi.decode(orderData, (bytes32));
    return runtimeIncomingAmount[orderHash][makerToken];
  }

  // =================================
  // Administrative

  function ENABLETOKEN205(address tokenAddress) public {	//inject NONSTANDARD NAMING
    ERC20(tokenAddress).APPROVE107(address(TRADE_DELEGATE), 10**70);
    ERC20(tokenAddress).APPROVE107(address(DYDX_PROTOCOL), 10**70);
  }
}