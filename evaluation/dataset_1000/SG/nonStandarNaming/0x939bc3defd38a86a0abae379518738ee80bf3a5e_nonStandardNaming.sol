pragma solidity ^0.5.7;
pragma experimental ABIEncoderV2;

// File: contracts/lib/ERC20SafeTransfer.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

                              
                                                   
                                                
library ERC20SafeTransfer {

    function SAFETRANSFER964(	//inject NONSTANDARD NAMING
        address token,
        address to,
        uint256 value)
    internal
    returns (bool success)
    {
        // A transfer is successful when 'call' is successful and depending on the token:
        // - No value is returned: we assume a revert when the transfer failed (i.e. 'call' returns false)
        // - A single boolean is returned: this boolean needs to be true (non-zero)

        // bytes4(keccak256("transfer(address,uint256)")) = 0xa9059cbb
        bytes memory callData = abi.encodeWithSelector(
            bytes4(0xa9059cbb),
            to,
            value
        );
        (success, ) = token.call(callData);
        return CHECKRETURNVALUE853(success);
    }

    function SAFETRANSFERFROM134(	//inject NONSTANDARD NAMING
        address token,
        address from,
        address to,
        uint256 value)
    internal
    returns (bool success)
    {
        // A transferFrom is successful when 'call' is successful and depending on the token:
        // - No value is returned: we assume a revert when the transfer failed (i.e. 'call' returns false)
        // - A single boolean is returned: this boolean needs to be true (non-zero)

        // bytes4(keccak256("transferFrom(address,address,uint256)")) = 0x23b872dd
        bytes memory callData = abi.encodeWithSelector(
            bytes4(0x23b872dd),
            from,
            to,
            value
        );
        (success, ) = token.call(callData);
        return CHECKRETURNVALUE853(success);
    }

    function CHECKRETURNVALUE853(	//inject NONSTANDARD NAMING
        bool success
    )
    internal
    pure
    returns (bool)
    {
        // A transfer/transferFrom is successful when 'call' is successful and depending on the token:
        // - No value is returned: we assume a revert when the transfer failed (i.e. 'call' returns false)
        // - A single boolean is returned: this boolean needs to be true (non-zero)
        if (success) {
            assembly {
                switch returndatasize()
                // Non-standard ERC20: nothing is returned so if 'call' was successful we assume the transfer succeeded
                case 0 {
                    success := 1
                }
                // Standard ERC20: a single boolean value is returned which needs to be true
                case 32 {
                    returndatacopy(0, 0, 32)
                    success := mload(0)
                }
                // None of the above: not successful
                default {
                    success := 0
                }
            }
        }
        return success;
    }

}

// File: contracts/lib/LibBytes.sol

// Modified from 0x LibBytes
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
library LibBytes {

    using LibBytes for bytes;

                                                                      
                                          
                                                                               
    function CONTENTADDRESS807(bytes memory input)	//inject NONSTANDARD NAMING
    internal
    pure
    returns (uint256 memoryAddress)
    {
        assembly {
            memoryAddress := add(input, 32)
        }
        return memoryAddress;
    }

                                                                           
                                                    
                                                        
                                              
    function MEMCOPY781(	//inject NONSTANDARD NAMING
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

                                                
                                                     
                                                                 
                                                            
                                                                       
    function SLICE34(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 from,
        uint256 to
    )
    internal
    pure
    returns (bytes memory result)
    {
        if (from > to || to > b.length) {
            return "";
        }

        // Create a new bytes structure and copy contents
        result = new bytes(to - from);
        MEMCOPY781(
            result.CONTENTADDRESS807(),
            b.CONTENTADDRESS807() + from,
            result.length
        );
        return result;
    }

                                                              
                                                  
                                                    
                                        
    function READADDRESS368(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
    internal
    pure
    returns (address result)
    {
        require(
            b.length >= index + 20,  // 20 is length of address
            "GREATER_OR_EQUAL_TO_20_LENGTH_REQUIRED"
        );

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

                                                                   
                                                       
                                                          
                                              
    function READBYTES32143(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
    internal
    pure
    returns (bytes32 result)
    {
        require(
            b.length >= index + 32,
            "GREATER_OR_EQUAL_TO_32_LENGTH_REQUIRED"
        );

        // Arrays are prefixed by a 256 bit length parameter
        index += 32;

        // Read the bytes32 from array memory
        assembly {
            result := mload(add(b, index))
        }
        return result;
    }

                                                                   
                                                       
                                                          
                                              
    function READUINT256124(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
    internal
    pure
    returns (uint256 result)
    {
        result = uint256(READBYTES32143(b, index));
        return result;
    }

                                                                            
                                                      
                                                         
                                             
    function READBYTES4730(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
    internal
    pure
    returns (bytes4 result)
    {
        require(
            b.length >= index + 4,
            "GREATER_OR_EQUAL_TO_4_LENGTH_REQUIRED"
        );

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
}

// File: contracts/lib/LibMath.sol

contract LibMath {
    // Copied from openzeppelin Math
                                                             
    function MAX349(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                              
    function MIN285(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                                                                                                          
    function AVERAGE86(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }

    // Modified from openzeppelin SafeMath
                                                                                
    function MUL363(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV681(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB51(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD926(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD131(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }

    // Copied from 0x LibMath
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
                                                                                     
                                                 
                                   
                                       
                                                    
                                                     
    function SAFEGETPARTIALAMOUNTFLOOR397(	//inject NONSTANDARD NAMING
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
    internal
    pure
    returns (uint256 partialAmount)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );

        require(
            !ISROUNDINGERRORFLOOR898(
            numerator,
            denominator,
            target
        ),
            "ROUNDING_ERROR"
        );

        partialAmount = DIV681(
            MUL363(numerator, target),
            denominator
        );
        return partialAmount;
    }

                                                                                     
                                                 
                                   
                                       
                                                    
                                                   
    function SAFEGETPARTIALAMOUNTCEIL13(	//inject NONSTANDARD NAMING
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
    internal
    pure
    returns (uint256 partialAmount)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );

        require(
            !ISROUNDINGERRORCEIL78(
            numerator,
            denominator,
            target
        ),
            "ROUNDING_ERROR"
        );

        partialAmount = DIV681(
            ADD926(
                MUL363(numerator, target),
                SUB51(denominator, 1)
            ),
            denominator
        );
        return partialAmount;
    }

                                                                                     
                                   
                                       
                                                    
                                                     
    function GETPARTIALAMOUNTFLOOR650(	//inject NONSTANDARD NAMING
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
    internal
    pure
    returns (uint256 partialAmount)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );

        partialAmount = DIV681(
            MUL363(numerator, target),
            denominator
        );
        return partialAmount;
    }

                                                                                     
                                   
                                       
                                                    
                                                   
    function GETPARTIALAMOUNTCEIL652(	//inject NONSTANDARD NAMING
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
    internal
    pure
    returns (uint256 partialAmount)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );

        partialAmount = DIV681(
            ADD926(
                MUL363(numerator, target),
                SUB51(denominator, 1)
            ),
            denominator
        );
        return partialAmount;
    }

                                                                 
                                   
                                       
                                                                   
                                          
    function ISROUNDINGERRORFLOOR898(	//inject NONSTANDARD NAMING
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
    internal
    pure
    returns (bool isError)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );

        // The absolute rounding error is the difference between the rounded
        // value and the ideal value. The relative rounding error is the
        // absolute rounding error divided by the absolute value of the
        // ideal value. This is undefined when the ideal value is zero.
        //
        // The ideal value is `numerator * target / denominator`.
        // Let's call `numerator * target % denominator` the remainder.
        // The absolute error is `remainder / denominator`.
        //
        // When the ideal value is zero, we require the absolute error to
        // be zero. Fortunately, this is always the case. The ideal value is
        // zero iff `numerator == 0` and/or `target == 0`. In this case the
        // remainder and absolute error are also zero.
        if (target == 0 || numerator == 0) {
            return false;
        }

        // Otherwise, we want the relative rounding error to be strictly
        // less than 0.1%.
        // The relative error is `remainder / (numerator * target)`.
        // We want the relative error less than 1 / 1000:
        //        remainder / (numerator * denominator)  <  1 / 1000
        // or equivalently:
        //        1000 * remainder  <  numerator * target
        // so we have a rounding error iff:
        //        1000 * remainder  >=  numerator * target
        uint256 remainder = mulmod(
            target,
            numerator,
            denominator
        );
        isError = MUL363(1000, remainder) >= MUL363(numerator, target);
        return isError;
    }

                                                               
                                   
                                       
                                                                   
                                          
    function ISROUNDINGERRORCEIL78(	//inject NONSTANDARD NAMING
        uint256 numerator,
        uint256 denominator,
        uint256 target
    )
    internal
    pure
    returns (bool isError)
    {
        require(
            denominator > 0,
            "DIVISION_BY_ZERO"
        );

        // See the comments in `isRoundingError`.
        if (target == 0 || numerator == 0) {
            // When either is zero, the ideal value and rounded value are zero
            // and there is no rounding error. (Although the relative error
            // is undefined.)
            return false;
        }
        // Compute remainder as before
        uint256 remainder = mulmod(
            target,
            numerator,
            denominator
        );
        remainder = SUB51(denominator, remainder) % denominator;
        isError = MUL363(1000, remainder) >= MUL363(numerator, target);
        return isError;
    }
}

// File: contracts/lib/Ownable.sol

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED632(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED632(address(0), _owner);
    }

                                                        
    function OWNER983() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER11() {	//inject NONSTANDARD NAMING
        require(ISOWNER253());
        _;
    }

                                                                                 
    function ISOWNER253() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP316() public ONLYOWNER11 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED632(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP981(address newOwner) public ONLYOWNER11 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP767(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP767(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED632(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/router/IExchangeHandler.sol

                                  
interface IExchangeHandler {

                                                                               
                                       
                                                             
                                                      
    function GETAVAILABLETOFILL539(	//inject NONSTANDARD NAMING
        bytes calldata data
    )
    external
    view
    returns (uint256 availableToFill, uint256 feePercentage);

                                              
                                                                                                                       
                                       
                                                                                         
                                                               
    function FILLORDER598(	//inject NONSTANDARD NAMING
        bytes calldata data,
        uint256 takerAmountToFill
    )
    external
    payable
    returns (uint256 makerAmountReceived);
}

// File: contracts/router/RouterCommon.sol

contract RouterCommon {
    struct GeneralOrder {
        address handler;
        address makerToken;
        address takerToken;
        uint256 makerAmount;
        uint256 takerAmount;
        bytes data;
    }

    struct FillResults {
        uint256 makerAmountReceived;
        uint256 takerAmountSpentOnOrder;
        uint256 takerAmountSpentOnFee;
    }
}

// File: contracts/router/EtherDeltaHandler.sol

                                          
interface IEtherDelta {
    function FEETAKE467() external view returns (uint256);	//inject NONSTANDARD NAMING
    function DEPOSIT900() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW856(uint256 amount) external;	//inject NONSTANDARD NAMING
    function DEPOSITTOKEN219(address token, uint256 amount) external;	//inject NONSTANDARD NAMING
    function WITHDRAWTOKEN936(address token, uint256 amount) external;	//inject NONSTANDARD NAMING
    function TRADE63(address tokenGet, uint256 amountGet, address tokenGive, uint256 amountGive, uint256 expires, uint256 nonce, address user, uint8 v, bytes32 r, bytes32 s, uint256 amount) external;	//inject NONSTANDARD NAMING
    function AVAILABLEVOLUME574(address tokenGet, uint256 amountGet, address tokenGive, uint256 amountGive, uint256 expires, uint256 nonce, address user, uint8 v, bytes32 r, bytes32 s) external view returns (uint256);	//inject NONSTANDARD NAMING
}

// Interface of ERC20 approve function.
interface IERC20 {
    function APPROVE885(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
}

                                                  
contract EtherDeltaHandler is IExchangeHandler, LibMath, Ownable {

    using LibBytes for bytes;

    IEtherDelta constant public exchange607 = IEtherDelta(0x8d12A197cB00D4747a1fe03395095ce2A5CC6819);	//inject NONSTANDARD NAMING
    address public ROUTER;
    address payable public FEE_ACCOUNT;
    uint256 public PROCESSING_FEE_PERCENTAGE;

    struct Order {
        address tokenGet;
        uint256 amountGet;
        address tokenGive;
        uint256 amountGive;
        uint256 expires;
        uint256 nonce;
        address user;
        uint8 v;
        bytes32 r;
        bytes32 s;
    }

    constructor(
        address router,
        address payable feeAccount,
        uint256 processingFeePercentage
    )
    public
    {
        ROUTER = router;
        FEE_ACCOUNT = feeAccount;
        PROCESSING_FEE_PERCENTAGE = processingFeePercentage;
    }

                                         
    function() external payable {}

                                                                     
                                              
    function SETFEEACCOUNT808(	//inject NONSTANDARD NAMING
        address payable feeAccount
    )
    external
    ONLYOWNER11
    {
        FEE_ACCOUNT = feeAccount;
    }

                                                                               
                                       
                                                             
                                                      
    function GETAVAILABLETOFILL539(	//inject NONSTANDARD NAMING
        bytes calldata data
    )
    external
    view
    returns (uint256 availableToFill, uint256 feePercentage)
    {
        Order memory order = GETORDER27(data);
        availableToFill = exchange607.AVAILABLEVOLUME574(
            order.tokenGet,
            order.amountGet,
            order.tokenGive,
            order.amountGive,
            order.expires,
            order.nonce,
            order.user,
            order.v,
            order.r,
            order.s
        );
        feePercentage = ADD926(exchange607.FEETAKE467(), PROCESSING_FEE_PERCENTAGE);
    }

                                              
                                                                                                                       
                                       
                                                                                         
                                                               
    function FILLORDER598(	//inject NONSTANDARD NAMING
        bytes calldata data,
        uint256 takerAmountToFill
    )
    external
    payable
    returns (uint256 makerAmountReceived)
    {
        require(msg.sender == ROUTER, "SENDER_NOT_ROUTER");
        Order memory order = GETORDER27(data);
        uint256 exchangeFeePercentage = exchange607.FEETAKE467();
        uint256 exchangeFee = MUL363(takerAmountToFill, exchangeFeePercentage) / (1 ether);
        uint256 processingFee = SUB51(
            MUL363(takerAmountToFill, ADD926(exchangeFeePercentage, PROCESSING_FEE_PERCENTAGE)) / (1 ether),
            exchangeFee
        );
        uint256 depositAmount = ADD926(takerAmountToFill, exchangeFee);
        makerAmountReceived = GETPARTIALAMOUNTFLOOR650(order.amountGive, order.amountGet, takerAmountToFill);

        // Makes deposit on exchange and pays processing fee using taker token in this contract.
        if (order.tokenGet == address(0)) {
            exchange607.DEPOSIT900.value(depositAmount)();
            if (processingFee > 0) {
                require(FEE_ACCOUNT.send(processingFee), "FAILED_SEND_ETH_TO_FEE_ACCOUNT");
            }
        } else {
            require(IERC20(order.tokenGet).APPROVE885(address(exchange607), depositAmount));
            exchange607.DEPOSITTOKEN219(order.tokenGet, depositAmount);
            if (processingFee > 0) {
                require(ERC20SafeTransfer.SAFETRANSFER964(order.tokenGet, FEE_ACCOUNT, processingFee), "FAILED_SEND_ERC20_TO_FEE_ACCOUNT");
            }
        }

        // Trades on exchange.
        TRADE63(order, takerAmountToFill);

        // Withdraws maker tokens to this contract, then sends back to router.
        if (order.tokenGive == address(0)) {
            exchange607.WITHDRAW856(makerAmountReceived);
            require(msg.sender.send(makerAmountReceived), "FAILED_SEND_ETH_TO_ROUTER");
        } else {
            exchange607.WITHDRAWTOKEN936(order.tokenGive, makerAmountReceived);
            require(ERC20SafeTransfer.SAFETRANSFER964(order.tokenGive, msg.sender, makerAmountReceived), "FAILED_SEND_ERC20_TO_ROUTER");
        }
    }

                                     
                                                       
    function TRADE63(	//inject NONSTANDARD NAMING
        Order memory order,
        uint256 takerAmountToFill
    )
    internal
    {
        exchange607.TRADE63(
            order.tokenGet,
            order.amountGet,
            order.tokenGive,
            order.amountGive,
            order.expires,
            order.nonce,
            order.user,
            order.v,
            order.r,
            order.s,
            takerAmountToFill
        );
    }

                                                    
                                       
                                                        
    function GETORDER27(	//inject NONSTANDARD NAMING
        bytes memory data
    )
    internal
    pure
    returns (Order memory order)
    {
        order.tokenGet = data.READADDRESS368(12);
        order.amountGet = data.READUINT256124(32);
        order.tokenGive = data.READADDRESS368(76);
        order.amountGive = data.READUINT256124(96);
        order.expires = data.READUINT256124(128);
        order.nonce = data.READUINT256124(160);
        order.user = data.READADDRESS368(204);
        order.v = uint8(data.READUINT256124(224));
        order.r = data.READBYTES32143(256);
        order.s = data.READBYTES32143(288);
    }
}