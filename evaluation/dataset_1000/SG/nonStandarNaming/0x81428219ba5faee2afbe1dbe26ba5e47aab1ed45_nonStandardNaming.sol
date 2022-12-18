                                                                 

// File: contracts/LibBytesRichErrors.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

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
    bytes4 internal constant invalid_byte_operation_error_selector454 =	//inject NONSTANDARD NAMING
        0x28006595;

    // solhint-disable func-name-mixedcase
    function INVALIDBYTEOPERATIONERROR7(	//inject NONSTANDARD NAMING
        InvalidByteOperationErrorCodes errorCode,
        uint256 offset,
        uint256 required
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            invalid_byte_operation_error_selector454,
            errorCode,
            offset,
            required
        );
    }
}

// File: contracts/LibRichErrors.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;


library LibRichErrors {

    // bytes4(keccak256("Error(string)"))
    bytes4 internal constant standard_error_selector360 =	//inject NONSTANDARD NAMING
        0x08c379a0;

    // solhint-disable func-name-mixedcase
                                                                
                                                                                  
                                                                               
                                        
                                      
    function STANDARDERROR319(	//inject NONSTANDARD NAMING
        string memory message
    )
        internal
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(
            standard_error_selector360,
            bytes(message)
        );
    }
    // solhint-enable func-name-mixedcase

                                                               
                                                
    function RREVERT62(bytes memory errorData)	//inject NONSTANDARD NAMING
        internal
        pure
    {
        assembly {
            revert(add(errorData, 0x20), mload(errorData))
        }
    }
}

// File: contracts/LibBytes.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;




library LibBytes {

    using LibBytes for bytes;

                                                      
                                          
                                                                
                                                                     
                           
    function RAWADDRESS550(bytes memory input)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256 memoryAddress)
    {
        assembly {
            memoryAddress := input
        }
        return memoryAddress;
    }

                                                                      
                                          
                                                                               
    function CONTENTADDRESS990(bytes memory input)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256 memoryAddress)
    {
        assembly {
            memoryAddress := add(input, 32)
        }
        return memoryAddress;
    }

                                                                           
                                                    
                                                        
                                              
    function MEMCOPY345(	//inject NONSTANDARD NAMING
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

                                                
                                                     
                                                                 
                                                            
                                                                       
    function SLICE822(	//inject NONSTANDARD NAMING
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
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.FromLessThanOrEqualsToRequired,
                from,
                to
            ));
        }
        if (to > b.length) {
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.ToLessThanOrEqualsLengthRequired,
                to,
                b.length
            ));
        }

        // Create a new bytes structure and copy contents
        result = new bytes(to - from);
        MEMCOPY345(
            result.CONTENTADDRESS990(),
            b.CONTENTADDRESS990() + from,
            result.length
        );
        return result;
    }

                                                                            
                                                                                       
                                                                 
                                                            
                                                                       
                                                                                                                   
    function SLICEDESTRUCTIVE44(	//inject NONSTANDARD NAMING
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
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
                LibBytesRichErrors.InvalidByteOperationErrorCodes.FromLessThanOrEqualsToRequired,
                from,
                to
            ));
        }
        if (to > b.length) {
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
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

                                                                            
                                                  
                                             
    function POPLASTBYTE804(bytes memory b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (bytes1 result)
    {
        if (b.length == 0) {
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
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

                                               
                                               
                                                
                                                             
    function EQUALS251(	//inject NONSTANDARD NAMING
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

                                                              
                                                  
                                                    
                                        
    function READADDRESS257(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
        internal
        pure
        returns (address result)
    {
        if (b.length < index + 20) {
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
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

                                                                        
                                                   
                                                    
                                                    
    function WRITEADDRESS831(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index,
        address input
    )
        internal
        pure
    {
        if (b.length < index + 20) {
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
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

                                                                   
                                                       
                                                          
                                              
    function READBYTES32622(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
        internal
        pure
        returns (bytes32 result)
    {
        if (b.length < index + 32) {
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
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

                                                                       
                                                   
                                                    
                                                    
    function WRITEBYTES32988(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index,
        bytes32 input
    )
        internal
        pure
    {
        if (b.length < index + 32) {
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
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

                                                                   
                                                       
                                                          
                                              
    function READUINT256331(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
        internal
        pure
        returns (uint256 result)
    {
        result = uint256(READBYTES32622(b, index));
        return result;
    }

                                                                       
                                                   
                                                    
                                                    
    function WRITEUINT256327(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index,
        uint256 input
    )
        internal
        pure
    {
        WRITEBYTES32988(b, index, bytes32(input));
    }

                                                                            
                                                      
                                                         
                                             
    function READBYTES4896(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 index
    )
        internal
        pure
        returns (bytes4 result)
    {
        if (b.length < index + 4) {
            LibRichErrors.RREVERT62(LibBytesRichErrors.INVALIDBYTEOPERATIONERROR7(
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

                                                 
                                                                                                             
                                                                                                           
                                                    
                                               
    function WRITELENGTH704(bytes memory b, uint256 length)	//inject NONSTANDARD NAMING
        internal
        pure
    {
        assembly {
            mstore(b, length)
        }
    }
}

// File: contracts/IGodsUnchained.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;
pragma experimental ABIEncoderV2;


interface IGodsUnchained {

                                                                        
                                                    
                                                   
                                                    
    function GETBOARDLEVEL881(uint256 tokenId)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint8 level);
}

// File: contracts/IPropertyValidator.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;

interface IPropertyValidator {

                                                                                                 
                                                                                  
                                                                
                                                                                             
    function CHECKBROKERASSET172(	//inject NONSTANDARD NAMING
        uint256 tokenId,
        bytes calldata propertyData
    )
        external
        view;
}

// File: contracts/GodsUnchainedValidator.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

pragma solidity ^0.5.9;


contract GodsUnchainedValidator is
    IPropertyValidator
{
    IGodsUnchained internal GODS_UNCHAINED; // solhint-disable-line var-name-mixedcase

    using LibBytes for bytes;

    constructor(address _godsUnchained)
        public
    {
        GODS_UNCHAINED = IGodsUnchained(_godsUnchained);
    }

                                                                                                        
                                                                    
                                                                
                                                                             
    function CHECKBROKERASSET172(	//inject NONSTANDARD NAMING
        uint256 tokenId,
        bytes calldata propertyData
    )
        external
        view
    {
        (uint8 expectedLevel) = abi.decode(
            propertyData,
            (uint8)
        );

        // Validate card properties.
        (uint8 level) = GODS_UNCHAINED.GETBOARDLEVEL881(tokenId);
        require(level == expectedLevel, "GodsUnchainedValidator/LEVEL_MISMATCH");
    }
}