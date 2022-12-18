                                                                 

// File: contracts/exchange/libs/LibEIP712.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity 0.5.16;


contract LibEIP712 {

    // EIP191 header for EIP712 prefix
    string constant internal eip191_header448 = "\x19\x01";	//inject NONSTANDARD NAMING

    // EIP712 Domain Name value
    string constant internal eip712_domain_name49 = "0x Protocol";	//inject NONSTANDARD NAMING

    // EIP712 Domain Version value
    string constant internal eip712_domain_version22 = "2";	//inject NONSTANDARD NAMING

    // Hash of the EIP712 Domain Separator Schema
    bytes32 constant internal eip712_domain_separator_schema_hash237 = keccak256(abi.encodePacked(	//inject NONSTANDARD NAMING
        "EIP712Domain(",
        "string name,",
        "string version,",
        "address verifyingContract",
        ")"
    ));

    // Hash of the EIP712 Domain Separator data
    // solhint-disable-next-line var-name-mixedcase
    bytes32 public EIP712_DOMAIN_HASH;

    constructor ()
        public
    {
        EIP712_DOMAIN_HASH = keccak256(abi.encodePacked(
            eip712_domain_separator_schema_hash237,
            keccak256(bytes(eip712_domain_name49)),
            keccak256(bytes(eip712_domain_version22)),
            uint256(address(this))
        ));
    }

                                                                                
                                                 
                                                          
    function HASHEIP712MESSAGE839(bytes32 hashStruct)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bytes32 result)
    {
        bytes32 eip712DomainHash = EIP712_DOMAIN_HASH;

        // Assembly for more efficient computing:
        // keccak256(abi.encodePacked(
        //     EIP191_HEADER,
        //     EIP712_DOMAIN_HASH,
        //     hashStruct    
        // ));

        assembly {
            // Load free memory pointer
            let memPtr := mload(64)

            mstore(memPtr, 0x1901000000000000000000000000000000000000000000000000000000000000)  // EIP191 header
            mstore(add(memPtr, 2), eip712DomainHash)                                            // EIP712 domain hash
            mstore(add(memPtr, 34), hashStruct)                                                 // Hash of struct

            // Compute hash
            result := keccak256(memPtr, 66)
        }
        return result;
    }
}

// File: contracts/exchange/libs/LibOrder.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity 0.5.16;



contract LibOrder is
    LibEIP712
{
    // Hash for the EIP712 Order Schema
    bytes32 constant internal eip712_order_schema_hash905 = keccak256(abi.encodePacked(	//inject NONSTANDARD NAMING
        "Order(",
        "address makerAddress,",
        "address takerAddress,",
        "address feeRecipientAddress,",
        "address senderAddress,",
        "uint256 makerAssetAmount,",
        "uint256 takerAssetAmount,",
        "uint256 makerFee,",
        "uint256 takerFee,",
        "uint256 expirationTimeSeconds,",
        "uint256 salt,",
        "bytes makerAssetData,",
        "bytes takerAssetData",
        ")"
    ));

    // A valid order remains fillable until it is expired, fully filled, or cancelled.
    // An order's state is unaffected by external factors, like account balances.
    enum OrderStatus {
        INVALID,                     // Default value
        INVALID_MAKER_ASSET_AMOUNT,  // Order does not have a valid maker asset amount
        INVALID_TAKER_ASSET_AMOUNT,  // Order does not have a valid taker asset amount
        FILLABLE,                    // Order is fillable
        EXPIRED,                     // Order has already expired
        FULLY_FILLED,                // Order is fully filled
        CANCELLED                    // Order has been cancelled
    }

    // solhint-disable max-line-length
    struct Order {
        address payable makerAddress;           // Address that created the order.      
        address payable takerAddress;           // Address that is allowed to fill the order. If set to 0, any address is allowed to fill the order.          
        address payable feeRecipientAddress;    // Address that will recieve fees when order is filled.      
        address senderAddress;          // Address that is allowed to call Exchange contract methods that affect this order. If set to 0, any address is allowed to call these methods.
        uint256 makerAssetAmount;       // Amount of makerAsset being offered by maker. Must be greater than 0.        
        uint256 takerAssetAmount;       // Amount of takerAsset being bid on by maker. Must be greater than 0.        
        uint256 makerFee;               // Amount of ZRX paid to feeRecipient by maker when order is filled. If set to 0, no transfer of ZRX from maker to feeRecipient will be attempted.
        uint256 takerFee;               // Amount of ZRX paid to feeRecipient by taker when order is filled. If set to 0, no transfer of ZRX from taker to feeRecipient will be attempted.
        uint256 expirationTimeSeconds;  // Timestamp in seconds at which order expires.          
        uint256 salt;                   // Arbitrary number to facilitate uniqueness of the order's hash.     
        bytes makerAssetData;           // Encoded data that can be decoded by a specified proxy contract when transferring makerAsset. The last byte references the id of this proxy.
        bytes takerAssetData;           // Encoded data that can be decoded by a specified proxy contract when transferring takerAsset. The last byte references the id of this proxy.
    }
    // solhint-enable max-line-length

    struct OrderInfo {
        uint8 orderStatus;                    // Status that describes order's validity and fillability.
        bytes32 orderHash;                    // EIP712 hash of the order (see LibOrder.getOrderHash).
        uint256 orderTakerAssetFilledAmount;  // Amount of order that has already been filled.
    }

                                                     
                                         
                                                    
    function GETORDERHASH679(Order memory order)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bytes32 orderHash)
    {
        orderHash = HASHEIP712MESSAGE839(HASHORDER135(order));
        return orderHash;
    }

                                                 
                                         
                                         
    function HASHORDER135(Order memory order)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (bytes32 result)
    {
        bytes32 schemaHash = eip712_order_schema_hash905;
        bytes32 makerAssetDataHash = keccak256(order.makerAssetData);
        bytes32 takerAssetDataHash = keccak256(order.takerAssetData);

        // Assembly for more efficiently computing:
        // keccak256(abi.encodePacked(
        //     EIP712_ORDER_SCHEMA_HASH,
        //     bytes32(order.makerAddress),
        //     bytes32(order.takerAddress),
        //     bytes32(order.feeRecipientAddress),
        //     bytes32(order.senderAddress),
        //     order.makerAssetAmount,
        //     order.takerAssetAmount,
        //     order.makerFee,
        //     order.takerFee,
        //     order.expirationTimeSeconds,
        //     order.salt,
        //     keccak256(order.makerAssetData),
        //     keccak256(order.takerAssetData)
        // ));

        assembly {
            // Calculate memory addresses that will be swapped out before hashing
            let pos1 := sub(order, 32)
            let pos2 := add(order, 320)
            let pos3 := add(order, 352)

            // Backup
            let temp1 := mload(pos1)
            let temp2 := mload(pos2)
            let temp3 := mload(pos3)
            
            // Hash in place
            mstore(pos1, schemaHash)
            mstore(pos2, makerAssetDataHash)
            mstore(pos3, takerAssetDataHash)
            result := keccak256(pos1, 416)
            
            // Restore
            mstore(pos1, temp1)
            mstore(pos2, temp2)
            mstore(pos3, temp3)
        }
        return result;
    }
}

// File: @0x/contracts-utils/contracts/src/LibRichErrors.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;


library LibRichErrors {

    // bytes4(keccak256("Error(string)"))
    bytes4 internal constant standard_error_selector658 =	//inject NONSTANDARD NAMING
        0x08c379a0;

    // solhint-disable func-name-mixedcase
                                                                
                                                                                  
                                                                               
                                        
                                      
    function STANDARDERROR322(	//inject NONSTANDARD NAMING
        string memory message
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            standard_error_selector658,
            bytes(message)
        );
    }
    // solhint-enable func-name-mixedcase

                                                               
                                                
    function RREVERT542(bytes memory errorData)	//inject NONSTANDARD NAMING
        internal
        pure
    {
        assembly {
            revert(add(errorData, 0x20), mload(errorData))
        }
    }
}

// File: @0x/contracts-utils/contracts/src/LibSafeMathRichErrors.sol

pragma solidity ^0.5.9;


library LibSafeMathRichErrors {

    // bytes4(keccak256("Uint256BinOpError(uint8,uint256,uint256)"))
    bytes4 internal constant uint256_binop_error_selector538 =	//inject NONSTANDARD NAMING
        0xe946c1bb;

    // bytes4(keccak256("Uint256DowncastError(uint8,uint256)"))
    bytes4 internal constant uint256_downcast_error_selector547 =	//inject NONSTANDARD NAMING
        0xc996af7b;

    enum BinOpErrorCodes {
        ADDITION_OVERFLOW,
        MULTIPLICATION_OVERFLOW,
        SUBTRACTION_UNDERFLOW,
        DIVISION_BY_ZERO
    }

    enum DowncastErrorCodes {
        VALUE_TOO_LARGE_TO_DOWNCAST_TO_UINT32,
        VALUE_TOO_LARGE_TO_DOWNCAST_TO_UINT64,
        VALUE_TOO_LARGE_TO_DOWNCAST_TO_UINT96
    }

    // solhint-disable func-name-mixedcase
    function UINT256BINOPERROR71(	//inject NONSTANDARD NAMING
        BinOpErrorCodes errorCode,
        uint256 a,
        uint256 b
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            uint256_binop_error_selector538,
            errorCode,
            a,
            b
        );
    }

    function UINT256DOWNCASTERROR843(	//inject NONSTANDARD NAMING
        DowncastErrorCodes errorCode,
        uint256 a
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            uint256_downcast_error_selector547,
            errorCode,
            a
        );
    }
}

// File: @0x/contracts-utils/contracts/src/LibSafeMath.sol

pragma solidity ^0.5.9;


library LibSafeMath {

    function SAFEMUL71(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        if (c / a != b) {
            LibRichErrors.RREVERT542(LibSafeMathRichErrors.UINT256BINOPERROR71(
                LibSafeMathRichErrors.BinOpErrorCodes.MULTIPLICATION_OVERFLOW,
                a,
                b
            ));
        }
        return c;
    }

    function SAFEDIV273(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        if (b == 0) {
            LibRichErrors.RREVERT542(LibSafeMathRichErrors.UINT256BINOPERROR71(
                LibSafeMathRichErrors.BinOpErrorCodes.DIVISION_BY_ZERO,
                a,
                b
            ));
        }
        uint256 c = a / b;
        return c;
    }

    function SAFESUB18(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        if (b > a) {
            LibRichErrors.RREVERT542(LibSafeMathRichErrors.UINT256BINOPERROR71(
                LibSafeMathRichErrors.BinOpErrorCodes.SUBTRACTION_UNDERFLOW,
                a,
                b
            ));
        }
        return a - b;
    }

    function SAFEADD714(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        uint256 c = a + b;
        if (c < a) {
            LibRichErrors.RREVERT542(LibSafeMathRichErrors.UINT256BINOPERROR71(
                LibSafeMathRichErrors.BinOpErrorCodes.ADDITION_OVERFLOW,
                a,
                b
            ));
        }
        return c;
    }

    function MAX256172(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return a >= b ? a : b;
    }

    function MIN256495(uint256 a, uint256 b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return a < b ? a : b;
    }
}

// File: contracts/exchange/libs/LibFillResults.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

pragma solidity 0.5.16;


contract LibFillResults {
    using LibSafeMath for uint256;

    struct FillResults {
        uint256 makerAssetFilledAmount;  // Total amount of makerAsset(s) filled.
        uint256 takerAssetFilledAmount;  // Total amount of takerAsset(s) filled.
        uint256 makerFeePaid;            // Total amount of ZRX paid by maker(s) to feeRecipient(s).
        uint256 takerFeePaid;            // Total amount of ZRX paid by taker to feeRecipients(s).
    }

    struct MatchedFillResults {
        FillResults left;                    // Amounts filled and fees paid of left order.
        FillResults right;                   // Amounts filled and fees paid of right order.
        uint256 leftMakerAssetSpreadAmount;  // Spread between price of left and right order, denominated in the left order's makerAsset, paid to taker.
    }

                                                           
                                                               
                                                                              
                                                                                              
    function ADDFILLRESULTS700(FillResults memory totalFillResults, FillResults memory singleFillResults)	//inject NONSTANDARD NAMING
        internal
        pure
    {
        totalFillResults.makerAssetFilledAmount = totalFillResults.makerAssetFilledAmount.SAFEADD714(singleFillResults.makerAssetFilledAmount);
        totalFillResults.takerAssetFilledAmount = totalFillResults.takerAssetFilledAmount.SAFEADD714(singleFillResults.takerAssetFilledAmount);
        totalFillResults.makerFeePaid = totalFillResults.makerFeePaid.SAFEADD714(singleFillResults.makerFeePaid);
        totalFillResults.takerFeePaid = totalFillResults.takerFeePaid.SAFEADD714(singleFillResults.takerFeePaid);
    }
}

// File: contracts/exchange/interfaces/IExchangeCore.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;


contract IExchangeCore {

                                                                                                              
                                                                                                   
                                                                                                         
    function CANCELORDERSUPTO116(uint256 targetOrderEpoch)	//inject NONSTANDARD NAMING
        external;

                                   
                                                                  
                                                                         
                                                                    
                                                                
    function FILLORDER165(	//inject NONSTANDARD NAMING
        LibOrder.Order memory order,
        uint256 takerAssetFillAmount,
        bytes memory signature
    )
        public
        payable
        returns (LibFillResults.FillResults memory fillResults);

                                                                
                                                                  
    function CANCELORDER914(LibOrder.Order memory order)	//inject NONSTANDARD NAMING
        public;

                                                                              
                                                    
                                                                    
                                                                            
    function GETORDERINFO345(LibOrder.Order memory order)	//inject NONSTANDARD NAMING
        public
        view
        returns (LibOrder.OrderInfo memory orderInfo);

                                                                                       
                                                      
                                               
                                                      
    function UPDATEORDER962(	//inject NONSTANDARD NAMING
        bytes32 newOrderHash,
        uint256 newOfferAmount,
        LibOrder.Order memory orderToBeCanceled
    )
        public
        payable;
}

// File: contracts/exchange/interfaces/IMatchOrders.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
pragma solidity 0.5.16;


contract IMatchOrders {

                                                                          
                                                                                                
                                                                                                     
                                                                                              
                                              
                                                
                                                                            
                                                                              
                                                                                                     
    function MATCHORDERS321(	//inject NONSTANDARD NAMING
        LibOrder.Order memory leftOrder,
        LibOrder.Order memory rightOrder,
        bytes memory leftSignature,
        bytes memory rightSignature
    )
        public
        returns (LibFillResults.MatchedFillResults memory matchedFillResults);
}

// File: contracts/exchange/interfaces/ISignatureValidator.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity 0.5.16;


contract ISignatureValidator {

                                                                     
                                                                                                            
                                                                            
                                                                       
    function PRESIGN903(	//inject NONSTANDARD NAMING
        bytes32 hash,
        address signerAddress,
        bytes calldata signature
    )
        external;
    
                                                                                               
                                                              
                                                                       
    function SETSIGNATUREVALIDATORAPPROVAL797(	//inject NONSTANDARD NAMING
        address validatorAddress,
        bool approval
    )
        external;

                                                
                                                
                                               
                                          
                                            
    function ISVALIDSIGNATURE925(	//inject NONSTANDARD NAMING
        bytes32 hash,
        address signerAddress,
        bytes memory signature
    )
        public
        view
        returns (bool isValid);
}

// File: contracts/exchange/interfaces/ITransactions.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
pragma solidity 0.5.16;


contract ITransactions {

                                                                       
                                                                              
                                                           
                                           
                                                               
    function EXECUTETRANSACTION627(	//inject NONSTANDARD NAMING
        uint256 salt,
        address payable signerAddress,
        bytes calldata data,
        bytes calldata signature
    )
        external;
}

// File: contracts/exchange/interfaces/IAssetProxyDispatcher.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity 0.5.16;


contract IAssetProxyDispatcher {

                                                            
                                                                          
                                                                 
    function REGISTERASSETPROXY408(address assetProxy)	//inject NONSTANDARD NAMING
        external;

                                 
                                                  
                                                                                                  
    function GETASSETPROXY451(bytes4 assetProxyId)	//inject NONSTANDARD NAMING
        external
        view
        returns (address);
}

// File: contracts/exchange/interfaces/IWrapperFunctions.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity 0.5.16;


contract IWrapperFunctions {
                                                                           
                                                    
    function BATCHCANCELORDERS642(LibOrder.Order[] memory orders)	//inject NONSTANDARD NAMING
        public;

                                                         
                                                    
                                                                           
    function GETORDERSINFO630(LibOrder.Order[] memory orders)	//inject NONSTANDARD NAMING
        public
        view
        returns (LibOrder.OrderInfo[] memory);
}

// File: contracts/exchange/interfaces/IExchange.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.16;


// solhint-disable no-empty-blocks
contract IExchange is
    IExchangeCore,
    IMatchOrders,
    ISignatureValidator,
    ITransactions,
    IAssetProxyDispatcher,
    IWrapperFunctions
{
    // miime: DepositManager Interface for Dutch Auction
    function DEPOSITBYOPERATOR296(bytes32 orderHash, address toAddress)	//inject NONSTANDARD NAMING
        public
        payable;
}

// File: @0x/contracts-erc20/contracts/src/interfaces/IERC20Token.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;


contract IERC20Token {

    // solhint-disable no-simple-event-func-name
    event TRANSFER662(	//inject NONSTANDARD NAMING
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event APPROVAL211(	//inject NONSTANDARD NAMING
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

                                                         
                                               
                                                           
                                               
    function TRANSFER253(address _to, uint256 _value)	//inject NONSTANDARD NAMING
        external
        returns (bool);

                                                                                             
                                              
                                               
                                                           
                                               
    function TRANSFERFROM499(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
        external
        returns (bool);

                                                                      
                                                                              
                                                                   
                                                                            
    function APPROVE578(address _spender, uint256 _value)	//inject NONSTANDARD NAMING
        external
        returns (bool);

                                        
                                     
    function TOTALSUPPLY659()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                          
                                
    function BALANCEOF716(address _owner)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                              
                                                                              
                                                           
    function ALLOWANCE920(address _owner, address _spender)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);
}

// File: @0x/contracts-utils/contracts/src/LibBytesRichErrors.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;


library LibBytesRichErrors {

    enum InvalidByteOperationErrorCodes {
        FromLessThanOrEqualsToRequired,
        ToLessThanOrEqualsLengthRequired,
        LengthGreaterThanZeroRequired,
        LengthGreaterThanOrEqualsFourRequired,
        LengthGreaterThanOrEqualsTwentyRequired,
        LengthGreaterThanOrEqualsThirtyTwoRequired,
        LengthGreaterThanOrEqualsNestedBytesLengthRequired,
        DestinationLengthGreaterThanOrEqualSourceLengthRequired
    }

    // bytes4(keccak256("InvalidByteOperationError(uint8,uint256,uint256)"))
    bytes4 internal constant invalid_byte_operation_error_selector313 =	//inject NONSTANDARD NAMING
        0x28006595;

    // solhint-disable func-name-mixedcase
    function INVALIDBYTEOPERATIONERROR177(	//inject NONSTANDARD NAMING
        InvalidByteOperationErrorCodes errorCode,
        uint256 offset,
        uint256 required
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            invalid_byte_operation_error_selector313,
            errorCode,
            offset,
            required
        );
    }
}

// File: @0x/contracts-utils/contracts/src/LibBytes.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;


library LibBytes {

    using LibBytes for bytes;

                                                      
                                          
                                                                
                                                                     
                           
    function RAWADDRESS754(bytes memory input)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256 memoryAddress)
    {
        assembly {
            memoryAddress := input
        }
        return memoryAddress;
    }

                                                                      
                                          
                                                                               
    function CONTENTADDRESS214(bytes memory input)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256 memoryAddress)
    {
        assembly {
            memoryAddress := add(input, 32)
        }
        return memoryAddress;
    }

                                                                           
                                                    
                                                        
                                              
    function MEMCOPY46(	//inject NONSTANDARD NAMING
        uint256 dest,
        uint256 source,
        uint256 length
    )
        internal
        pure
    {
        if (length < 32) {
            // Handle a partial word by reading destination and masking
            // off the bits we are interested in.
            // This correctly handles overlap, zero lengths and source == dest
            assembly {
                let mask := sub(exp(256, sub(32, length)), 1)
                let s := and(mload(source), not(mask))
                let d := and(mload(dest), mask)
                mstore(dest, or(s, d))
            }
        } else {
            // Skip the O(length) loop when source == dest.
            if (source == dest) {
                return;
            }

            // For large copies we copy whole words at a time. The final
            // word is aligned to the end of the range (instead of after the
            // previous) to handle partial words. So a copy will look like this:
            //
            //  ####
            //      ####
            //          ####
            //            ####
            //
            // We handle overlap in the source and destination range by
            // changing the copying direction. This prevents us from
            // overwriting parts of source that we still need to copy.
            //
            // This correctly handles source == dest
            //
            if (source > dest) {
                assembly {
                    // We subtract 32 from `sEnd` and `dEnd` because it
                    // is easier to compare with in the loop, and these
                    // are also the addresses we need for copying the
                    // last bytes.
                    length := sub(length, 32)
                    let sEnd := add(source, length)
                    let dEnd := add(dest, length)

                    // Remember the last 32 bytes of source
                    // This needs to be done here and not after the loop
                    // because we may have overwritten the last bytes in
                    // source already due to overlap.
                    let last := mload(sEnd)

                    // Copy whole words front to back
                    // Note: the first check is always true,
                    // this could have been a do-while loop.
                    // solhint-disable-next-line no-empty-blocks
                    for {} lt(source, sEnd) {} {
                        mstore(dest, mload(source))
                        source := add(source, 32)
                        dest := add(dest, 32)
                    }

                    // Write the last 32 bytes
                    mstore(dEnd, last)
                }
            } else {
                assembly {
                    // We subtract 32 from `sEnd` and `dEnd` because those
                    // are the starting points when copying a word at the end.
                    length := sub(length, 32)
                    let sEnd := add(source, length)
                    let dEnd := add(dest, length)

                    // Remember the first 32 bytes of source
                    // This needs to be done here and not after the loop
                    // because we may have overwritten the first bytes in
                    // source already due to overlap.
                    let first := mload(source)

                    // Copy whole words back to front
                    // We use a signed comparisson here to allow dEnd to become
                    // negative (happens when source and dest < 32). Valid
                    // addresses in local memory will never be larger than
                    // 2**255, so they can be safely re-interpreted as signed.
                    // Note: the first check is always true,
                    // this could have been a do-while loop.
                    // solhint-disable-next-line no-empty-blocks
                    for {} slt(dest, dEnd) {} {
                        mstore(dEnd, mload(sEnd))
                        sEnd := sub(sEnd, 32)
                        dEnd := sub(dEnd, 32)
                    }

                    // Write the first 32 bytes
                    mstore(dest, first)
                }
            }
        }
    }

                                                
                                                     
                                                                 
                                                            
                                                                       
    function SLICE436(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 from,
        uint256 to
    )
        internal
        pure
        returns (bytes memory result)
    {
        // Ensure that the from and to positions are valid positions for a slice within
        // the byte array that is being used.
        if (from > to) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.FromLessThanOrEqualsToRequired,
                from,
                to
            ));
        }
        if (to > b.length) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.ToLessThanOrEqualsLengthRequired,
                to,
                b.length
            ));
        }

        // Create a new bytes structure and copy contents
        result = new bytes(to - from);
        MEMCOPY46(
            result.CONTENTADDRESS214(),
            b.CONTENTADDRESS214() + from,
            result.length
        );
        return result;
    }

                                                                            
                                                                                       
                                                                 
                                                            
                                                                       
                                                                                                                   
    function SLICEDESTRUCTIVE149(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 from,
        uint256 to
    )
        internal
        pure
        returns (bytes memory result)
    {
        // Ensure that the from and to positions are valid positions for a slice within
        // the byte array that is being used.
        if (from > to) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.FromLessThanOrEqualsToRequired,
                from,
                to
            ));
        }
        if (to > b.length) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.ToLessThanOrEqualsLengthRequired,
                to,
                b.length
            ));
        }

        // Create a new bytes structure around [from, to) in-place.
        assembly {
            result := add(b, from)
            mstore(result, sub(to, from))
        }
        return result;
    }

                                                                            
                                                  
                                             
    function POPLASTBYTE433(bytes memory b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (bytes1 result)
    {
        if (b.length == 0) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.LengthGreaterThanZeroRequired,
                b.length,
                0
            ));
        }

        // Store last byte.
        result = b[b.length - 1];

        assembly {
            // Decrement length of byte array.
            let newLen := sub(mload(b), 1)
            mstore(b, newLen)
        }
        return result;
    }

                                               
                                               
                                                
                                                             
    function EQUALS277(	//inject NONSTANDARD NAMING
        bytes memory lhs,
        bytes memory rhs
    )
        internal
        pure
        returns (bool equal)
    {
        // Keccak gas cost is 30 + numWords * 6. This is a cheap way to compare.
        // We early exit on unequal lengths, but keccak would also correctly
        // handle this.
        return lhs.length == rhs.length && keccak256(lhs) == keccak256(rhs);
    }

                                                              
                                                  
                                                    
                                        
    function READADDRESS986(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
        internal
        pure
        returns (address result)
    {
        if (b.length < index + 20) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.LengthGreaterThanOrEqualsTwentyRequired,
                b.length,
                index + 20 // 20 is length of address
            ));
        }

        // Add offset to index:
        // 1. Arrays are prefixed by 32-byte length parameter (add 32 to index)
        // 2. Account for size difference between address length and 32-byte storage word (subtract 12 from index)
        index += 20;

        // Read address from array memory
        assembly {
            // 1. Add index to address of bytes array
            // 2. Load 32-byte word from memory
            // 3. Apply 20-byte mask to obtain address
            result := and(mload(add(b, index)), 0xffffffffffffffffffffffffffffffffffffffff)
        }
        return result;
    }

                                                                        
                                                   
                                                    
                                                    
    function WRITEADDRESS296(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index,
        address input
    )
        internal
        pure
    {
        if (b.length < index + 20) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.LengthGreaterThanOrEqualsTwentyRequired,
                b.length,
                index + 20 // 20 is length of address
            ));
        }

        // Add offset to index:
        // 1. Arrays are prefixed by 32-byte length parameter (add 32 to index)
        // 2. Account for size difference between address length and 32-byte storage word (subtract 12 from index)
        index += 20;

        // Store address into array memory
        assembly {
            // The address occupies 20 bytes and mstore stores 32 bytes.
            // First fetch the 32-byte word where we'll be storing the address, then
            // apply a mask so we have only the bytes in the word that the address will not occupy.
            // Then combine these bytes with the address and store the 32 bytes back to memory with mstore.

            // 1. Add index to address of bytes array
            // 2. Load 32-byte word from memory
            // 3. Apply 12-byte mask to obtain extra bytes occupying word of memory where we'll store the address
            let neighbors := and(
                mload(add(b, index)),
                0xffffffffffffffffffffffff0000000000000000000000000000000000000000
            )

            // Make sure input address is clean.
            // (Solidity does not guarantee this)
            input := and(input, 0xffffffffffffffffffffffffffffffffffffffff)

            // Store the neighbors and address into memory
            mstore(add(b, index), xor(input, neighbors))
        }
    }

                                                                   
                                                       
                                                          
                                              
    function READBYTES32974(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
        internal
        pure
        returns (bytes32 result)
    {
        if (b.length < index + 32) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.LengthGreaterThanOrEqualsThirtyTwoRequired,
                b.length,
                index + 32
            ));
        }

        // Arrays are prefixed by a 256 bit length parameter
        index += 32;

        // Read the bytes32 from array memory
        assembly {
            result := mload(add(b, index))
        }
        return result;
    }

                                                                       
                                                   
                                                    
                                                    
    function WRITEBYTES3283(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index,
        bytes32 input
    )
        internal
        pure
    {
        if (b.length < index + 32) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.LengthGreaterThanOrEqualsThirtyTwoRequired,
                b.length,
                index + 32
            ));
        }

        // Arrays are prefixed by a 256 bit length parameter
        index += 32;

        // Read the bytes32 from array memory
        assembly {
            mstore(add(b, index), input)
        }
    }

                                                                   
                                                       
                                                          
                                              
    function READUINT256606(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
        internal
        pure
        returns (uint256 result)
    {
        result = uint256(READBYTES32974(b, index));
        return result;
    }

                                                                       
                                                   
                                                    
                                                    
    function WRITEUINT256957(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index,
        uint256 input
    )
        internal
        pure
    {
        WRITEBYTES3283(b, index, bytes32(input));
    }

                                                                            
                                                      
                                                         
                                             
    function READBYTES486(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
        internal
        pure
        returns (bytes4 result)
    {
        if (b.length < index + 4) {
            LibRichErrors.RREVERT542(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR177(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.LengthGreaterThanOrEqualsFourRequired,
                b.length,
                index + 4
            ));
        }

        // Arrays are prefixed by a 32 byte length field
        index += 32;

        // Read the bytes4 from array memory
        assembly {
            result := mload(add(b, index))
            // Solidity does not require us to clean the trailing bytes.
            // We do it anyway
            result := and(result, 0xFFFFFFFF00000000000000000000000000000000000000000000000000000000)
        }
        return result;
    }

                                                 
                                                                                                             
                                                                                                           
                                                    
                                               
    function WRITELENGTH291(bytes memory b, uint256 length)	//inject NONSTANDARD NAMING
        internal
        pure
    {
        assembly {
            mstore(b, length)
        }
    }
}

// File: contracts/dutch-auction/DutchAuction.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.16;


contract DutchAuction {
    using LibBytes for bytes;
    using LibSafeMath for uint256;

    // solhint-disable var-name-mixedcase
    IExchange internal EXCHANGE;

    struct AuctionDetails {
        uint256 beginTimeSeconds;    // Auction begin unix timestamp: sellOrder.makerAssetData
        uint256 endTimeSeconds;      // Auction end unix timestamp: sellOrder.expiryTimeSeconds
        uint256 beginAmount;         // Auction begin amount: sellOrder.makerAssetData
        uint256 endAmount;           // Auction end amount: sellOrder.takerAssetAmount
        uint256 currentAmount;       // Calculated amount given block.timestamp
        uint256 currentTimeSeconds;  // block.timestamp
    }

    constructor (address _exchange)
        public
    {
        EXCHANGE = IExchange(_exchange);
    }

    // miime: ETH acceptable
    function () external payable {
    }

                                                                                                                  
                                                                                                       
                                                                                           
                                                                                                       
                                                                        
                                                                                                  
                                                                                                          
                                                                                                                           
                                                             
                                                              
                                                                                                               
                                                                                                         
                                                                                                                           
                                                                                                                 
                                                    
                                                                                                       
                                                                                                             
                                                                      
                                                                        
                                                                                                     
    function MATCHORDERS321(	//inject NONSTANDARD NAMING
        LibOrder.Order memory buyOrder,
        LibOrder.Order memory sellOrder,
        bytes memory buySignature,
        bytes memory sellSignature,
        bytes32 buyOrderHash
    )
        public
        payable
        returns (LibFillResults.MatchedFillResults memory matchedFillResults)
    {
        AuctionDetails memory auctionDetails = GETAUCTIONDETAILS652(sellOrder);
        // Ensure the auction has not yet started
        require(
            auctionDetails.currentTimeSeconds >= auctionDetails.beginTimeSeconds,
            "AUCTION_NOT_STARTED"
        );
        // Ensure the auction has not expired. This will fail later in 0x but we can save gas by failing early
        require(
            sellOrder.expirationTimeSeconds > auctionDetails.currentTimeSeconds,
            "AUCTION_EXPIRED"
        );
        // Validate the buyer amount is greater than the current auction amount
        require(
            buyOrder.makerAssetAmount >= auctionDetails.currentAmount,
            "INVALID_AMOUNT"
        );

        // miime: Deposit the sending ETH on auction buying
        if (msg.value > 0) {
            EXCHANGE.DEPOSITBYOPERATOR296.value(msg.value)(buyOrderHash, buyOrder.makerAddress);
        }

        // Match orders, maximally filling `buyOrder`
        matchedFillResults = EXCHANGE.MATCHORDERS321(
            buyOrder,
            sellOrder,
            buySignature,
            sellSignature
        );
        // The difference in sellOrder.takerAssetAmount and current amount is given as spread to the matcher
        // This may include additional spread from the buyOrder.makerAssetAmount and the currentAmount.
        // e.g currentAmount is 30, sellOrder.takerAssetAmount is 10 and buyOrder.makerAssetamount is 40.
        // 10 (40-30) is returned to the buyer, 20 (30-10) sent to the seller and 10 has previously
        // been transferred to the seller during matchOrders
        uint256 leftMakerAssetSpreadAmount = matchedFillResults.leftMakerAssetSpreadAmount;
        if (leftMakerAssetSpreadAmount > 0) {
            // ERC20 Asset data itself is encoded as follows:
            //
            // | Area     | Offset | Length  | Contents                            |
            // |----------|--------|---------|-------------------------------------|
            // | Header   | 0      | 4       | function selector                   |
            // | Params   |        | 1 * 32  | function parameters:                |
            // |          | 4      | 12      |   1. token address padding          |
            // |          | 16     | 20      |   2. token address                  |
            bytes memory assetData = sellOrder.takerAssetData;
            address token = assetData.READADDRESS986(16);
            // Calculate the excess from the buy order. This can occur if the buyer sends in a higher
            // amount than the calculated current amount
            uint256 buyerExcessAmount = buyOrder.makerAssetAmount.SAFESUB18(auctionDetails.currentAmount);
            uint256 sellerExcessAmount = leftMakerAssetSpreadAmount.SAFESUB18(buyerExcessAmount);
            // miime: Return the difference between auctionDetails.currentAmount and sellOrder.takerAssetAmount
            // and the difference between buyOrder.makerAssetAmount and auctionDetails.currentAmount to the seller
            uint256 excessAmount = buyerExcessAmount.SAFEADD714(sellerExcessAmount);
            if (excessAmount > 0) {
                if (token == address(0)) {
                    sellOrder.makerAddress.transfer(excessAmount);
                } else {
                    IERC20Token(token).TRANSFER253(sellOrder.makerAddress, excessAmount);
                }
            }
            // // Return the difference between auctionDetails.currentAmount and sellOrder.takerAssetAmount
            // // to the seller
            // if (sellerExcessAmount > 0) {
            //     IERC20Token(token).transfer(sellOrder.makerAddress, sellerExcessAmount);
            // }
            // // Return the difference between buyOrder.makerAssetAmount and auctionDetails.currentAmount
            // // to the buyer
            // if (buyerExcessAmount > 0) {
            //     IERC20Token(token).transfer(buyOrder.makerAddress, buyerExcessAmount);
            // }
        }
        return matchedFillResults;
    }

                                                               
                                   
                              
    function GETAUCTIONDETAILS652(LibOrder.Order memory order)	//inject NONSTANDARD NAMING
        public
        view
        returns (AuctionDetails memory auctionDetails)
    {
        uint256 makerAssetDataLength = order.makerAssetData.length;
        // It is unknown the encoded data of makerAssetData, we assume the last 64 bytes
        // are the Auction Details encoding.
        // Auction Details is encoded as follows:
        //
        // | Area     | Offset | Length  | Contents                            |
        // |----------|--------|---------|-------------------------------------|
        // | Params   |        | 2 * 32  | parameters:                         |
        // |          | -64    | 32      |   1. auction begin unix timestamp   |
        // |          | -32    | 32      |   2. auction begin begin amount     |
        // ERC20 asset data length is 4+32, 64 for auction details results in min length 100
        require(
            makerAssetDataLength >= 100,
            "INVALID_ASSET_DATA"
        );
        uint256 auctionBeginTimeSeconds = order.makerAssetData.READUINT256606(makerAssetDataLength - 64);
        uint256 auctionBeginAmount = order.makerAssetData.READUINT256606(makerAssetDataLength - 32);
        // Ensure the auction has a valid begin time
        require(
            order.expirationTimeSeconds > auctionBeginTimeSeconds,
            "INVALID_BEGIN_TIME"
        );
        uint256 auctionDurationSeconds = order.expirationTimeSeconds-auctionBeginTimeSeconds;
        // Ensure the auction goes from high to low
        uint256 minAmount = order.takerAssetAmount;
        require(
            auctionBeginAmount > minAmount,
            "INVALID_AMOUNT"
        );
        uint256 amountDelta = auctionBeginAmount-minAmount;
        // solhint-disable-next-line not-rely-on-time
        uint256 timestamp = block.timestamp;
        auctionDetails.beginTimeSeconds = auctionBeginTimeSeconds;
        auctionDetails.endTimeSeconds = order.expirationTimeSeconds;
        auctionDetails.beginAmount = auctionBeginAmount;
        auctionDetails.endAmount = minAmount;
        auctionDetails.currentTimeSeconds = timestamp;

        uint256 remainingDurationSeconds = order.expirationTimeSeconds-timestamp;
        if (timestamp < auctionBeginTimeSeconds) {
            // If the auction has not yet begun the current amount is the auctionBeginAmount
            auctionDetails.currentAmount = auctionBeginAmount;
        } else if (timestamp >= order.expirationTimeSeconds) {
            // If the auction has ended the current amount is the minAmount.
            // Auction end time is guaranteed by 0x Exchange due to the order expiration
            auctionDetails.currentAmount = minAmount;
        } else {
            auctionDetails.currentAmount = minAmount.SAFEADD714(
                remainingDurationSeconds.SAFEMUL71(amountDelta).SAFEDIV273(auctionDurationSeconds)
            );
        }
        return auctionDetails;
    }
}