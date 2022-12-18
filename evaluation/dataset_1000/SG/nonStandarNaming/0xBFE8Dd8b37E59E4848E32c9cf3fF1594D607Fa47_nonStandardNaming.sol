                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;


                                                                                                                                                                                                                 
interface ICore {
                                                                                                              
    function TRANSFERPROXY93()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                              
    function VAULT388()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                                                                                                                                     
    function EXCHANGEIDS223(	//inject NONSTANDARD NAMING
        uint8 _exchangeId
    )
        external
        view
        returns (address);

                                                                                                                                       
    function VALIDSETS497(address)	//inject NONSTANDARD NAMING
        external
        view
        returns (bool);

                                                                                                           
    function VALIDMODULES684(address)	//inject NONSTANDARD NAMING
        external
        view
        returns (bool);

                                                                                                                                                                                                                                        
    function VALIDPRICELIBRARIES129(	//inject NONSTANDARD NAMING
        address _priceLibrary
    )
        external
        view
        returns (bool);

                                                                                                                                                                            
    function ISSUE909(	//inject NONSTANDARD NAMING
        address _set,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                               
    function ISSUETO269(	//inject NONSTANDARD NAMING
        address _recipient,
        address _set,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                               
    function ISSUEINVAULT243(	//inject NONSTANDARD NAMING
        address _set,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                
    function REDEEM919(	//inject NONSTANDARD NAMING
        address _set,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                        
    function REDEEMTO429(	//inject NONSTANDARD NAMING
        address _recipient,
        address _set,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                              
    function REDEEMINVAULT13(	//inject NONSTANDARD NAMING
        address _set,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function REDEEMANDWITHDRAWTO650(	//inject NONSTANDARD NAMING
        address _set,
        address _to,
        uint256 _quantity,
        uint256 _toExclude
    )
        external;

                                                                                                                                                                                                                                                                                                                  
    function BATCHDEPOSIT311(	//inject NONSTANDARD NAMING
        address[] calldata _tokens,
        uint256[] calldata _quantities
    )
        external;

                                                                                                                                                                                                                                                                                                                        
    function BATCHWITHDRAW899(	//inject NONSTANDARD NAMING
        address[] calldata _tokens,
        uint256[] calldata _quantities
    )
        external;

                                                                                                                                                                                                           
    function DEPOSIT609(	//inject NONSTANDARD NAMING
        address _token,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                           
    function WITHDRAW467(	//inject NONSTANDARD NAMING
        address _token,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                                             
    function INTERNALTRANSFER907(	//inject NONSTANDARD NAMING
        address _token,
        address _to,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function CREATESET502(	//inject NONSTANDARD NAMING
        address _factory,
        address[] calldata _components,
        uint256[] calldata _units,
        uint256 _naturalUnit,
        bytes32 _name,
        bytes32 _symbol,
        bytes calldata _callData
    )
        external
        returns (address);

                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DEPOSITMODULE706(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        address _token,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function WITHDRAWMODULE723(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        address _token,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function BATCHDEPOSITMODULE648(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        address[] calldata _tokens,
        uint256[] calldata _quantities
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function BATCHWITHDRAWMODULE152(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        address[] calldata _tokens,
        uint256[] calldata _quantities
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                           
    function ISSUEMODULE661(	//inject NONSTANDARD NAMING
        address _owner,
        address _recipient,
        address _set,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                          
    function REDEEMMODULE60(	//inject NONSTANDARD NAMING
        address _burnAddress,
        address _incrementAddress,
        address _set,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                                                
    function BATCHINCREMENTTOKENOWNERMODULE908(	//inject NONSTANDARD NAMING
        address[] calldata _tokens,
        address _owner,
        uint256[] calldata _quantities
    )
        external;

                                                                                                                                                                                                                                                                                                                                                    
    function BATCHDECREMENTTOKENOWNERMODULE994(	//inject NONSTANDARD NAMING
        address[] calldata _tokens,
        address _owner,
        uint256[] calldata _quantities
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                               
    function BATCHTRANSFERBALANCEMODULE665(	//inject NONSTANDARD NAMING
        address[] calldata _tokens,
        address _from,
        address _to,
        uint256[] calldata _quantities
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                
    function TRANSFERMODULE62(	//inject NONSTANDARD NAMING
        address _token,
        uint256 _quantity,
        address _from,
        address _to
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                           
    function BATCHTRANSFERMODULE819(	//inject NONSTANDARD NAMING
        address[] calldata _tokens,
        uint256[] calldata _quantities,
        address _from,
        address _to
    )
        external;
}

// File: set-protocol-contracts/contracts/core/lib/RebalancingLibrary.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;


                                                                                                                                                                                                                             
library RebalancingLibrary {

                                         

    enum State { Default, Proposal, Rebalance, Drawdown }

                                           

    struct AuctionPriceParameters {
        uint256 auctionStartTime;
        uint256 auctionTimeToPivot;
        uint256 auctionStartPrice;
        uint256 auctionPivotPrice;
    }

    struct BiddingParameters {
        uint256 minimumBid;
        uint256 remainingCurrentSets;
        uint256[] combinedCurrentUnits;
        uint256[] combinedNextSetUnits;
        address[] combinedTokenArray;
    }
}

// File: set-protocol-contracts/contracts/core/interfaces/IFeeCalculator.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;

                                                           
interface IFeeCalculator {

                                                      

    function INITIALIZE259(	//inject NONSTANDARD NAMING
        bytes calldata _feeCalculatorData
    )
        external;

    function GETFEE250()	//inject NONSTANDARD NAMING
        external
        view
        returns(uint256);

    function UPDATEANDGETFEE773()	//inject NONSTANDARD NAMING
        external
        returns(uint256);

    function ADJUSTFEE987(	//inject NONSTANDARD NAMING
        bytes calldata _newFeeData
    )
        external;
}

// File: set-protocol-contracts/contracts/core/interfaces/ISetToken.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;

                                                                                                                                                                                          
interface ISetToken {

                                                      

                                                                                                      
    function NATURALUNIT32()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                          
    function GETCOMPONENTS154()	//inject NONSTANDARD NAMING
        external
        view
        returns (address[] memory);

                                                                                                                
    function GETUNITS907()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256[] memory);

                                                                                                                                                                                                             
    function TOKENISCOMPONENT177(	//inject NONSTANDARD NAMING
        address _tokenAddress
    )
        external
        view
        returns (bool);

                                                                                                                                                                                                                                                      
    function MINT498(	//inject NONSTANDARD NAMING
        address _issuer,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                     
    function BURN503(	//inject NONSTANDARD NAMING
        address _from,
        uint256 _quantity
    )
        external;

                                                                                                                                                              
    function TRANSFER953(	//inject NONSTANDARD NAMING
        address to,
        uint256 value
    )
        external;
}

// File: set-protocol-contracts/contracts/core/interfaces/IRebalancingSetToken.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;


                                                                                                                                                                                                                           

interface IRebalancingSetToken {

                                                                                                                                                                              
    function AUCTIONLIBRARY348()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                           
    function TOTALSUPPLY240()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                       
    function PROPOSALSTARTTIME755()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                 
    function LASTREBALANCETIMESTAMP193()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                       
    function REBALANCEINTERVAL874()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                
    function REBALANCESTATE416()	//inject NONSTANDARD NAMING
        external
        view
        returns (RebalancingLibrary.State);

                                                                                                                               
    function STARTINGCURRENTSETAMOUNT983()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                                                                              
    function BALANCEOF457(	//inject NONSTANDARD NAMING
        address owner
    )
        external
        view
        returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function PROPOSE927(	//inject NONSTANDARD NAMING
        address _nextSet,
        address _auctionLibrary,
        uint256 _auctionTimeToPivot,
        uint256 _auctionStartPrice,
        uint256 _auctionPivotPrice
    )
        external;

                                                                                                      
    function NATURALUNIT32()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                            
    function CURRENTSET255()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                                                                                                              
    function NEXTSET414()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                                                                    
    function UNITSHARES314()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                                                                                                       
    function BURN503(	//inject NONSTANDARD NAMING
        address _from,
        uint256 _quantity
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function PLACEBID890(	//inject NONSTANDARD NAMING
        uint256 _quantity
    )
        external
        returns (address[] memory, uint256[] memory, uint256[] memory);

                                                                                                         
    function GETCOMBINEDTOKENARRAYLENGTH352()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                         
    function GETCOMBINEDTOKENARRAY393()	//inject NONSTANDARD NAMING
        external
        view
        returns (address[] memory);

                                                                                                                                   
    function GETFAILEDAUCTIONWITHDRAWCOMPONENTS185()	//inject NONSTANDARD NAMING
        external
        view
        returns (address[] memory);

                                                                                                                                                             
    function GETAUCTIONPRICEPARAMETERS214()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256[] memory);

                                                                                                                                                   
    function GETBIDDINGPARAMETERS714()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256[] memory);

                                                                                                                                                                                                                                                                                                                                                                                                                        
    function GETBIDPRICE761(	//inject NONSTANDARD NAMING
        uint256 _quantity
    )
        external
        view
        returns (uint256[] memory, uint256[] memory);

}

// File: set-protocol-contracts/contracts/core/lib/Rebalance.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;



                                                                                                         
library Rebalance {

    struct TokenFlow {
        address[] addresses;
        uint256[] inflow;
        uint256[] outflow;
    }

    function COMPOSETOKENFLOW690(	//inject NONSTANDARD NAMING
        address[] memory _addresses,
        uint256[] memory _inflow,
        uint256[] memory _outflow
    )
        internal
        pure
        returns(TokenFlow memory)
    {
        return TokenFlow({addresses: _addresses, inflow: _inflow, outflow: _outflow });
    }

    function DECOMPOSETOKENFLOW434(TokenFlow memory _tokenFlow)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (address[] memory, uint256[] memory, uint256[] memory)
    {
        return (_tokenFlow.addresses, _tokenFlow.inflow, _tokenFlow.outflow);
    }

    function DECOMPOSETOKENFLOWTOBIDPRICE881(TokenFlow memory _tokenFlow)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256[] memory, uint256[] memory)
    {
        return (_tokenFlow.inflow, _tokenFlow.outflow);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function GETTOKENFLOWS957(	//inject NONSTANDARD NAMING
        IRebalancingSetToken _rebalancingSetToken,
        uint256 _quantity
    )
        internal
        view
        returns (address[] memory, uint256[] memory, uint256[] memory)
    {
        // Get token addresses
        address[] memory combinedTokenArray = _rebalancingSetToken.GETCOMBINEDTOKENARRAY393();

        // Get inflow and outflow arrays for the given bid quantity
        (
            uint256[] memory inflowArray,
            uint256[] memory outflowArray
        ) = _rebalancingSetToken.GETBIDPRICE761(_quantity);

        return (combinedTokenArray, inflowArray, outflowArray);
    }
}

// File: set-protocol-contracts/contracts/core/interfaces/ILiquidator.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;




                                                        
interface ILiquidator {

                                                      

    function STARTREBALANCE919(	//inject NONSTANDARD NAMING
        ISetToken _currentSet,
        ISetToken _nextSet,
        uint256 _startingCurrentSetQuantity,
        bytes calldata _liquidatorData
    )
        external;

    function GETBIDPRICE761(	//inject NONSTANDARD NAMING
        address _set,
        uint256 _quantity
    )
        external
        view
        returns (Rebalance.TokenFlow memory);

    function PLACEBID890(	//inject NONSTANDARD NAMING
        uint256 _quantity
    )
        external
        returns (Rebalance.TokenFlow memory);


    function SETTLEREBALANCE972()	//inject NONSTANDARD NAMING
        external;

    function ENDFAILEDREBALANCE188() external;	//inject NONSTANDARD NAMING

    // ----------------------------------------------------------------------
    // Auction Price
    // ----------------------------------------------------------------------

    function AUCTIONPRICEPARAMETERS440(address _set)	//inject NONSTANDARD NAMING
        external
        view
        returns (RebalancingLibrary.AuctionPriceParameters memory);

    // ----------------------------------------------------------------------
    // Auction
    // ----------------------------------------------------------------------

    function HASREBALANCEFAILED410(address _set) external view returns (bool);	//inject NONSTANDARD NAMING
    function MINIMUMBID690(address _set) external view returns (uint256);	//inject NONSTANDARD NAMING
    function STARTINGCURRENTSETS200(address _set) external view returns (uint256);	//inject NONSTANDARD NAMING
    function REMAININGCURRENTSETS720(address _set) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETCOMBINEDCURRENTSETUNITS509(address _set) external view returns (uint256[] memory);	//inject NONSTANDARD NAMING
    function GETCOMBINEDNEXTSETUNITS441(address _set) external view returns (uint256[] memory);	//inject NONSTANDARD NAMING
    function GETCOMBINEDTOKENARRAY393(address _set) external view returns (address[] memory);	//inject NONSTANDARD NAMING
}

// File: set-protocol-contracts/contracts/core/interfaces/IRebalancingSetTokenV2.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;





                                                                                                                                                                                                                                 

interface IRebalancingSetTokenV2 {

                                                                                           
    function TOTALSUPPLY240()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                            
    function LIQUIDATOR70()	//inject NONSTANDARD NAMING
        external
        view
        returns (ILiquidator);

                                                                                                                 
    function LASTREBALANCETIMESTAMP193()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                         
    function REBALANCESTARTTIME245()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                               
    function STARTINGCURRENTSETAMOUNT983()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                       
    function REBALANCEINTERVAL874()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                      
    function GETAUCTIONPRICEPARAMETERS214() external view returns (uint256[] memory);	//inject NONSTANDARD NAMING

                                                                                                                     
    function GETBIDDINGPARAMETERS714() external view returns (uint256[] memory);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    function REBALANCESTATE416()	//inject NONSTANDARD NAMING
        external
        view
        returns (RebalancingLibrary.State);

                                                                                                                                                                                                                              
    function BALANCEOF457(	//inject NONSTANDARD NAMING
        address owner
    )
        external
        view
        returns (uint256);

                                                                                   
    function MANAGER356()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                             
    function FEERECIPIENT759()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                     
    function ENTRYFEE904()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                    
    function REBALANCEFEE110()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                          
    function REBALANCEFEECALCULATOR903()	//inject NONSTANDARD NAMING
        external
        view
        returns (IFeeCalculator);

                                                                                                          
    function INITIALIZE259(	//inject NONSTANDARD NAMING
        bytes calldata _rebalanceFeeCalldata
    )
        external;

                                                                                       
    function SETLIQUIDATOR129(	//inject NONSTANDARD NAMING
        ILiquidator _newLiquidator
    )
        external;

                                                    
    function SETFEERECIPIENT48(	//inject NONSTANDARD NAMING
        address _newFeeRecipient
    )
        external;

                                            
    function SETENTRYFEE472(	//inject NONSTANDARD NAMING
        uint256 _newEntryFee
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function STARTREBALANCE919(	//inject NONSTANDARD NAMING
        address _nextSet,
        bytes calldata _liquidatorData

    )
        external;

                                                                                                                                                                                                                                                                                                       
    function SETTLEREBALANCE972()	//inject NONSTANDARD NAMING
        external;

                                                                                                      
    function NATURALUNIT32()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                            
    function CURRENTSET255()	//inject NONSTANDARD NAMING
        external
        view
        returns (ISetToken);

                                                                                                                                                                              
    function NEXTSET414()	//inject NONSTANDARD NAMING
        external
        view
        returns (ISetToken);

                                                                                                                                    
    function UNITSHARES314()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function PLACEBID890(	//inject NONSTANDARD NAMING
        uint256 _quantity
    )
        external
        returns (address[] memory, uint256[] memory, uint256[] memory);

                                                                                                                                                                                                                                                                                                                                                                                                                        
    function GETBIDPRICE761(	//inject NONSTANDARD NAMING
        uint256 _quantity
    )
        external
        view
        returns (uint256[] memory, uint256[] memory);

                                                                             
    function NAME543()	//inject NONSTANDARD NAMING
        external
        view
        returns (string memory);

                                                                                 
    function SYMBOL180()	//inject NONSTANDARD NAMING
        external
        view
        returns (string memory);
}

// File: set-protocol-contracts/contracts/core/interfaces/IRebalancingSetTokenV3.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;





                                                                                                                                                                                                                                 

interface IRebalancingSetTokenV3 {

                                                                                           
    function TOTALSUPPLY240()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                            
    function LIQUIDATOR70()	//inject NONSTANDARD NAMING
        external
        view
        returns (ILiquidator);

                                                                                                                 
    function LASTREBALANCETIMESTAMP193()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                         
    function REBALANCESTARTTIME245()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                               
    function STARTINGCURRENTSETAMOUNT983()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                       
    function REBALANCEINTERVAL874()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                      
    function GETAUCTIONPRICEPARAMETERS214() external view returns (uint256[] memory);	//inject NONSTANDARD NAMING

                                                                                                                     
    function GETBIDDINGPARAMETERS714() external view returns (uint256[] memory);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    function REBALANCESTATE416()	//inject NONSTANDARD NAMING
        external
        view
        returns (RebalancingLibrary.State);

                                                                                                                                                                                                                              
    function BALANCEOF457(	//inject NONSTANDARD NAMING
        address owner
    )
        external
        view
        returns (uint256);

                                                                                   
    function MANAGER356()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                             
    function FEERECIPIENT759()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                     
    function ENTRYFEE904()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                    
    function REBALANCEFEE110()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                          
    function REBALANCEFEECALCULATOR903()	//inject NONSTANDARD NAMING
        external
        view
        returns (IFeeCalculator);

                                                                                                          
    function INITIALIZE259(	//inject NONSTANDARD NAMING
        bytes calldata _rebalanceFeeCalldata
    )
        external;

                                                                                       
    function SETLIQUIDATOR129(	//inject NONSTANDARD NAMING
        ILiquidator _newLiquidator
    )
        external;

                                                    
    function SETFEERECIPIENT48(	//inject NONSTANDARD NAMING
        address _newFeeRecipient
    )
        external;

                                            
    function SETENTRYFEE472(	//inject NONSTANDARD NAMING
        uint256 _newEntryFee
    )
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function STARTREBALANCE919(	//inject NONSTANDARD NAMING
        address _nextSet,
        bytes calldata _liquidatorData

    )
        external;

                                                                                                                                                                                                                                                                                                       
    function SETTLEREBALANCE972()	//inject NONSTANDARD NAMING
        external;

                                                                                                                                                                                                                                                                                                                                                     
    function ACTUALIZEFEE688()	//inject NONSTANDARD NAMING
        external;

                                                                                                                                                  
    function ADJUSTFEE987(	//inject NONSTANDARD NAMING
        bytes calldata _newFeeData
    )
        external;

                                                                                                      
    function NATURALUNIT32()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                            
    function CURRENTSET255()	//inject NONSTANDARD NAMING
        external
        view
        returns (ISetToken);

                                                                                                                                                                              
    function NEXTSET414()	//inject NONSTANDARD NAMING
        external
        view
        returns (ISetToken);

                                                                                                                                    
    function UNITSHARES314()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function PLACEBID890(	//inject NONSTANDARD NAMING
        uint256 _quantity
    )
        external
        returns (address[] memory, uint256[] memory, uint256[] memory);

                                                                                                                                                                                                                                                                                                                                                                                                                        
    function GETBIDPRICE761(	//inject NONSTANDARD NAMING
        uint256 _quantity
    )
        external
        view
        returns (uint256[] memory, uint256[] memory);

                                                                             
    function NAME543()	//inject NONSTANDARD NAMING
        external
        view
        returns (string memory);

                                                                                 
    function SYMBOL180()	//inject NONSTANDARD NAMING
        external
        view
        returns (string memory);
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL386(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV881(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB21(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD181(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD955(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED279(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED279(address(0), _owner);
    }

                                                        
    function OWNER369() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER343() {	//inject NONSTANDARD NAMING
        require(ISOWNER702());
        _;
    }

                                                                                 
    function ISOWNER702() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP435() public ONLYOWNER343 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED279(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP579(address newOwner) public ONLYOWNER343 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP869(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP869(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED279(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: set-protocol-contracts/contracts/lib/TimeLockUpgrade.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;




                                                                                                                                                         
contract TimeLockUpgrade is
    Ownable
{
    using SafeMath for uint256;

                                                   

    // Timelock Upgrade Period in seconds
    uint256 public timeLockPeriod;

    // Mapping of upgradable units and initialized timelock
    mapping(bytes32 => uint256) public timeLockedUpgrades;

                                          

    event UPGRADEREGISTERED557(	//inject NONSTANDARD NAMING
        bytes32 _upgradeHash,
        uint256 _timestamp
    );

                                             

    modifier TIMELOCKUPGRADE565() {	//inject NONSTANDARD NAMING
        // If the time lock period is 0, then allow non-timebound upgrades.
        // This is useful for initialization of the protocol and for testing.
        if (timeLockPeriod == 0) {
            _;

            return;
        }

        // The upgrade hash is defined by the hash of the transaction call data,
        // which uniquely identifies the function as well as the passed in arguments.
        bytes32 upgradeHash = keccak256(
            abi.encodePacked(
                msg.data
            )
        );

        uint256 registrationTime = timeLockedUpgrades[upgradeHash];

        // If the upgrade hasn't been registered, register with the current time.
        if (registrationTime == 0) {
            timeLockedUpgrades[upgradeHash] = block.timestamp;

            emit UPGRADEREGISTERED557(
                upgradeHash,
                block.timestamp
            );

            return;
        }

        require(
            block.timestamp >= registrationTime.ADD181(timeLockPeriod),
            "TimeLockUpgrade: Time lock period must have elapsed."
        );

        // Reset the timestamp to 0
        timeLockedUpgrades[upgradeHash] = 0;

        // Run the rest of the upgrades
        _;
    }

                                            

                                                                                                                                                                                                                            
    function SETTIMELOCKPERIOD346(	//inject NONSTANDARD NAMING
        uint256 _timeLockPeriod
    )
        external
        ONLYOWNER343
    {
        // Only allow setting of the timeLockPeriod if the period is greater than the existing
        require(
            _timeLockPeriod > timeLockPeriod,
            "TimeLockUpgrade: New period must be greater than existing"
        );

        timeLockPeriod = _timeLockPeriod;
    }
}

// File: set-protocol-contracts/contracts/lib/UnrestrictedTimeLockUpgrade.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;




                                                                                                                                                                                                                                                                                                                                                                                                                              

contract UnrestrictedTimeLockUpgrade is
    TimeLockUpgrade
{
                                          

    event REMOVEREGISTEREDUPGRADE340(	//inject NONSTANDARD NAMING
        bytes32 indexed _upgradeHash
    );

                                                     

                                                                                                                                                                
    function REMOVEREGISTEREDUPGRADEINTERNAL451(	//inject NONSTANDARD NAMING
        bytes32 _upgradeHash
    )
        internal
    {
        require(
            timeLockedUpgrades[_upgradeHash] != 0,
            "TimeLockUpgradeV2.removeRegisteredUpgrade: Upgrade hash must be registered"
        );

        // Reset the timestamp to 0
        timeLockedUpgrades[_upgradeHash] = 0;

        emit REMOVEREGISTEREDUPGRADE340(
            _upgradeHash
        );
    }
}

// File: set-protocol-contracts/contracts/lib/LimitOneUpgrade.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;



                                                                                                                                                                                                                                         

contract LimitOneUpgrade is
    UnrestrictedTimeLockUpgrade
{
                                                   

    mapping(address => bytes32) public upgradeIdentifier;

                                            

                                                                                                                                                                                                   
    modifier LIMITONEUPGRADE700(address _upgradeAddress) {	//inject NONSTANDARD NAMING
        if (timeLockPeriod > 0) {
            // Get upgradeHash
            bytes32 upgradeHash = keccak256(msg.data);

            if (upgradeIdentifier[_upgradeAddress] != 0) {
                // If upgrade hash has no record then revert since must be second upgrade
                require(
                    upgradeIdentifier[_upgradeAddress] == upgradeHash,
                    "Another update already in progress."
                );

                upgradeIdentifier[_upgradeAddress] = 0;

            } else {
                upgradeIdentifier[_upgradeAddress] = upgradeHash;
            }
        }
        _;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                            
    function REMOVEREGISTEREDUPGRADEINTERNAL451(	//inject NONSTANDARD NAMING
        address _upgradeAddress,
        bytes32 _upgradeHash
    )
        internal
    {
        require(
            upgradeIdentifier[_upgradeAddress] == _upgradeHash,
            "Passed upgrade hash does not match upgrade address."
        );

        UnrestrictedTimeLockUpgrade.REMOVEREGISTEREDUPGRADEINTERNAL451(_upgradeHash);

        upgradeIdentifier[_upgradeAddress] = 0;
    }
}

// File: set-protocol-contracts/contracts/lib/AddressArrayUtils.sol

// Pulled in from Cryptofin Solidity package in order to control Solidity compiler version
// https://github.com/cryptofinlabs/cryptofin-solidity/blob/master/contracts/array-utils/AddressArrayUtils.sol

pragma solidity 0.5.7;


library AddressArrayUtils {

                                                                                                                                                                                                                                                       
    function INDEXOF850(address[] memory A, address a) internal pure returns (uint256, bool) {	//inject NONSTANDARD NAMING
        uint256 length = A.length;
        for (uint256 i = 0; i < length; i++) {
            if (A[i] == a) {
                return (i, true);
            }
        }
        return (0, false);
    }

                                                                                                                                                                                                                                                   
    function CONTAINS659(address[] memory A, address a) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        bool isIn;
        (, isIn) = INDEXOF850(A, a);
        return isIn;
    }

                                                                                                                                                                        
    function EXTEND777(address[] memory A, address[] memory B) internal pure returns (address[] memory) {	//inject NONSTANDARD NAMING
        uint256 aLength = A.length;
        uint256 bLength = B.length;
        address[] memory newAddresses = new address[](aLength + bLength);
        for (uint256 i = 0; i < aLength; i++) {
            newAddresses[i] = A[i];
        }
        for (uint256 j = 0; j < bLength; j++) {
            newAddresses[aLength + j] = B[j];
        }
        return newAddresses;
    }

                                                                                                                                                                         
    function APPEND659(address[] memory A, address a) internal pure returns (address[] memory) {	//inject NONSTANDARD NAMING
        address[] memory newAddresses = new address[](A.length + 1);
        for (uint256 i = 0; i < A.length; i++) {
            newAddresses[i] = A[i];
        }
        newAddresses[A.length] = a;
        return newAddresses;
    }

                                                                                                                                                                                                                                            
    function INTERSECT220(address[] memory A, address[] memory B) internal pure returns (address[] memory) {	//inject NONSTANDARD NAMING
        uint256 length = A.length;
        bool[] memory includeMap = new bool[](length);
        uint256 newLength = 0;
        for (uint256 i = 0; i < length; i++) {
            if (CONTAINS659(B, A[i])) {
                includeMap[i] = true;
                newLength++;
            }
        }
        address[] memory newAddresses = new address[](newLength);
        uint256 j = 0;
        for (uint256 k = 0; k < length; k++) {
            if (includeMap[k]) {
                newAddresses[j] = A[k];
                j++;
            }
        }
        return newAddresses;
    }

                                                                                                                                                                                                
    function UNION428(address[] memory A, address[] memory B) internal pure returns (address[] memory) {	//inject NONSTANDARD NAMING
        address[] memory leftDifference = DIFFERENCE410(A, B);
        address[] memory rightDifference = DIFFERENCE410(B, A);
        address[] memory intersection = INTERSECT220(A, B);
        return EXTEND777(leftDifference, EXTEND777(intersection, rightDifference));
    }

                                                                                                                                                                                                               
    function DIFFERENCE410(address[] memory A, address[] memory B) internal pure returns (address[] memory) {	//inject NONSTANDARD NAMING
        uint256 length = A.length;
        bool[] memory includeMap = new bool[](length);
        uint256 count = 0;
        // First count the new length because can't push for in-memory arrays
        for (uint256 i = 0; i < length; i++) {
            address e = A[i];
            if (!CONTAINS659(B, e)) {
                includeMap[i] = true;
                count++;
            }
        }
        address[] memory newAddresses = new address[](count);
        uint256 j = 0;
        for (uint256 k = 0; k < length; k++) {
            if (includeMap[k]) {
                newAddresses[j] = A[k];
                j++;
            }
        }
        return newAddresses;
    }

                                                                                                                                                            
    function POP672(address[] memory A, uint256 index)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (address[] memory, address)
    {
        uint256 length = A.length;
        address[] memory newAddresses = new address[](length - 1);
        for (uint256 i = 0; i < index; i++) {
            newAddresses[i] = A[i];
        }
        for (uint256 j = index + 1; j < length; j++) {
            newAddresses[j - 1] = A[j];
        }
        return (newAddresses, A[index]);
    }

                                                    
    function REMOVE547(address[] memory A, address a)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (address[] memory)
    {
        (uint256 index, bool isIn) = INDEXOF850(A, a);
        if (!isIn) {
            revert();
        } else {
            (address[] memory _A,) = POP672(A, index);
            return _A;
        }
    }

                                                                                                                                                                            
    function HASDUPLICATE442(address[] memory A) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        if (A.length == 0) {
            return false;
        }
        for (uint256 i = 0; i < A.length - 1; i++) {
            for (uint256 j = i + 1; j < A.length; j++) {
                if (A[i] == A[j]) {
                    return true;
                }
            }
        }
        return false;
    }

                                                                                                                                                                                            
    function ISEQUAL475(address[] memory A, address[] memory B) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        if (A.length != B.length) {
            return false;
        }
        for (uint256 i = 0; i < A.length; i++) {
            if (A[i] != B[i]) {
                return false;
            }
        }
        return true;
    }
}

// File: set-protocol-contracts/contracts/lib/WhiteList.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;





                                                                                         
contract WhiteList is
    Ownable,
    TimeLockUpgrade
{
    using AddressArrayUtils for address[];

                                                   

    address[] public addresses;
    mapping(address => bool) public whiteList;

                                          

    event ADDRESSADDED34(	//inject NONSTANDARD NAMING
        address _address
    );

    event ADDRESSREMOVED168(	//inject NONSTANDARD NAMING
        address _address
    );

                                               

                                                                                                                                                                                                                                                   
    constructor(
        address[] memory _initialAddresses
    )
        public
    {
        // Add each of initial addresses to state
        for (uint256 i = 0; i < _initialAddresses.length; i++) {
            address addressToAdd = _initialAddresses[i];

            addresses.push(addressToAdd);
            whiteList[addressToAdd] = true;
        }
    }

                                                      

                                                                                                                       
    function ADDADDRESS213(	//inject NONSTANDARD NAMING
        address _address
    )
        external
        ONLYOWNER343
        TIMELOCKUPGRADE565
    {
        require(
            !whiteList[_address],
            "WhiteList.addAddress: Address has already been whitelisted."
        );

        addresses.push(_address);

        whiteList[_address] = true;

        emit ADDRESSADDED34(
            _address
        );
    }

                                                                                                                                 
    function REMOVEADDRESS202(	//inject NONSTANDARD NAMING
        address _address
    )
        external
        ONLYOWNER343
    {
        require(
            whiteList[_address],
            "WhiteList.removeAddress: Address is not current whitelisted."
        );

        addresses = addresses.REMOVE547(_address);

        whiteList[_address] = false;

        emit ADDRESSREMOVED168(
            _address
        );
    }

                                                                                                                        
    function VALIDADDRESSES175()	//inject NONSTANDARD NAMING
        external
        view
        returns (address[] memory)
    {
        return addresses;
    }

                                                                                                                                                                                                                           
    function AREVALIDADDRESSES730(	//inject NONSTANDARD NAMING
        address[] calldata _addresses
    )
        external
        view
        returns (bool)
    {
        for (uint256 i = 0; i < _addresses.length; i++) {
            if (!whiteList[_addresses[i]]) {
                return false;
            }
        }

        return true;
    }
}

// File: contracts/managers/allocators/ISocialAllocator.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;


                                                                                                                         
interface ISocialAllocator {

                                                                                                                                                                                                                                                     
    function DETERMINENEWALLOCATION771(	//inject NONSTANDARD NAMING
        uint256 _targetBaseAssetAllocation
    )
        external
        returns (ISetToken);

                                                                                                                                                                                                                                    
    function CALCULATECOLLATERALSETVALUE294(	//inject NONSTANDARD NAMING
        ISetToken _collateralSet
    )
        external
        view
        returns(uint256);
}

// File: contracts/managers/lib/SocialTradingLibrary.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;



                                                                                                             
library SocialTradingLibrary {

                                           
    struct PoolInfo {
        address trader;                 // Address allowed to make admin and allocation decisions
        ISocialAllocator allocator;     // Allocator used to make collateral Sets, defines asset pair being used
        uint256 currentAllocation;      // Current base asset allocation of tradingPool
        uint256 newEntryFee;            // New fee percentage to change to after time lock passes, defaults to 0
        uint256 feeUpdateTimestamp;     // Timestamp when fee update process can be finalized, defaults to maxUint256
    }
}

// File: contracts/managers/SocialTradingManager.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;











                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
contract SocialTradingManager is
    WhiteList
{
    using SafeMath for uint256;

                                          

    event TRADINGPOOLCREATED618(	//inject NONSTANDARD NAMING
        address indexed trader,
        ISocialAllocator indexed allocator,
        address indexed tradingPool,
        uint256 startingAllocation
    );

    event ALLOCATIONUPDATE354(	//inject NONSTANDARD NAMING
        address indexed tradingPool,
        uint256 oldAllocation,
        uint256 newAllocation
    );

    event NEWTRADER792(	//inject NONSTANDARD NAMING
        address indexed tradingPool,
        address indexed oldTrader,
        address indexed newTrader
    );

                                            

    modifier ONLYTRADER95(IRebalancingSetTokenV2 _tradingPool) {	//inject NONSTANDARD NAMING
        require(
            msg.sender == TRADER608(_tradingPool),
            "Sender must be trader"
        );
        _;
    }

                                             

    uint256 public constant rebalancing_set_natural_unit725 = 1e8;	//inject NONSTANDARD NAMING
    uint public constant one_percent684 = 1e16;	//inject NONSTANDARD NAMING
    uint256 constant public maximum_allocation907 = 1e18;	//inject NONSTANDARD NAMING

                                                   

    ICore public core;
    address public factory;
    mapping(address => SocialTradingLibrary.PoolInfo) public pools;

    uint256 public maxEntryFee;
    uint256 public feeUpdateTimelock;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    constructor(
        ICore _core,
        address _factory,
        address[] memory _whiteListedAllocators,
        uint256 _maxEntryFee,
        uint256 _feeUpdateTimelock
    )
        public
        WhiteList(_whiteListedAllocators)
    {
        core = _core;
        factory = _factory;

        maxEntryFee = _maxEntryFee;
        feeUpdateTimelock = _feeUpdateTimelock;
    }

                                            

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function CREATETRADINGPOOL898(	//inject NONSTANDARD NAMING
        ISocialAllocator _tradingPairAllocator,
        uint256 _startingBaseAssetAllocation,
        uint256 _startingUSDValue,
        bytes32 _name,
        bytes32 _symbol,
        bytes calldata _rebalancingSetCallData
    )
        external
    {
        // Validate relevant params
        VALIDATECREATETRADINGPOOL686(_tradingPairAllocator, _startingBaseAssetAllocation, _rebalancingSetCallData);

        // Get collateral Set
        ISetToken collateralSet = _tradingPairAllocator.DETERMINENEWALLOCATION771(
            _startingBaseAssetAllocation
        );

        uint256[] memory unitShares = new uint256[](1);

        // Value collateral
        uint256 collateralValue = _tradingPairAllocator.CALCULATECOLLATERALSETVALUE294(
            collateralSet
        );

        // unitShares is equal to _startingUSDValue divided by colalteral Value
        unitShares[0] = _startingUSDValue.MUL386(rebalancing_set_natural_unit725).DIV881(collateralValue);

        address[] memory components = new address[](1);
        components[0] = address(collateralSet);

        // Create tradingPool
        address tradingPool = core.CREATESET502(
            factory,
            components,
            unitShares,
            rebalancing_set_natural_unit725,
            _name,
            _symbol,
            _rebalancingSetCallData
        );

        pools[tradingPool].trader = msg.sender;
        pools[tradingPool].allocator = _tradingPairAllocator;
        pools[tradingPool].currentAllocation = _startingBaseAssetAllocation;
        pools[tradingPool].feeUpdateTimestamp = 0;

        emit TRADINGPOOLCREATED618(
            msg.sender,
            _tradingPairAllocator,
            tradingPool,
            _startingBaseAssetAllocation
        );
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function UPDATEALLOCATION987(	//inject NONSTANDARD NAMING
        IRebalancingSetTokenV2 _tradingPool,
        uint256 _newAllocation,
        bytes calldata _liquidatorData
    )
        external
        ONLYTRADER95(_tradingPool)
    {
        // Validate updateAllocation params
        VALIDATEALLOCATIONUPDATE319(_tradingPool, _newAllocation);

        // Create nextSet collateral
        ISetToken nextSet = ALLOCATOR140(_tradingPool).DETERMINENEWALLOCATION771(
            _newAllocation
        );

        // Trigger start rebalance on RebalancingSetTokenV2
        _tradingPool.STARTREBALANCE919(address(nextSet), _liquidatorData);

        emit ALLOCATIONUPDATE354(
            address(_tradingPool),
            CURRENTALLOCATION847(_tradingPool),
            _newAllocation
        );

        // Save new allocation
        pools[address(_tradingPool)].currentAllocation = _newAllocation;
    }

                                                                                                                                                                                                                                                                                                                                  
    function INITIATEENTRYFEECHANGE831(	//inject NONSTANDARD NAMING
        IRebalancingSetTokenV2 _tradingPool,
        uint256 _newEntryFee
    )
        external
        ONLYTRADER95(_tradingPool)
    {
        // Validate new entry fee doesn't exceed max
        VALIDATENEWENTRYFEE68(_newEntryFee);

        // Log new entryFee and timestamp to start timelock from
        pools[address(_tradingPool)].feeUpdateTimestamp = block.timestamp.ADD181(feeUpdateTimelock);
        pools[address(_tradingPool)].newEntryFee = _newEntryFee;
    }

                                                                                                                                                                                                      
    function FINALIZEENTRYFEECHANGE595(	//inject NONSTANDARD NAMING
        IRebalancingSetTokenV2 _tradingPool
    )
        external
        ONLYTRADER95(_tradingPool)
    {
        // If feeUpdateTimestamp is equal to 0 indicates initiate wasn't called
        require(
            FEEUPDATETIMESTAMP840(_tradingPool) != 0,
            "SocialTradingManager.finalizeSetFeeRecipient: Must initiate fee change first."
        );

        // Current block timestamp must exceed feeUpdateTimestamp
        require(
            block.timestamp >= FEEUPDATETIMESTAMP840(_tradingPool),
            "SocialTradingManager.finalizeSetFeeRecipient: Time lock period must elapse to update fees."
        );

        // Reset timestamp to avoid reentrancy
        pools[address(_tradingPool)].feeUpdateTimestamp = 0;

        // Update fee on RebalancingSetTokenV2
        _tradingPool.SETENTRYFEE472(NEWENTRYFEE124(_tradingPool));

        // Reset newEntryFee
        pools[address(_tradingPool)].newEntryFee = 0;
    }

                                                                                                                                                                                                                   
    function SETTRADER827(	//inject NONSTANDARD NAMING
        IRebalancingSetTokenV2 _tradingPool,
        address _newTrader
    )
        external
        ONLYTRADER95(_tradingPool)
    {
        emit NEWTRADER792(
            address(_tradingPool),
            TRADER608(_tradingPool),
            _newTrader
        );

        pools[address(_tradingPool)].trader = _newTrader;
    }

                                                                                                                                                                                                               
    function SETLIQUIDATOR129(	//inject NONSTANDARD NAMING
        IRebalancingSetTokenV2 _tradingPool,
        ILiquidator _newLiquidator
    )
        external
        ONLYTRADER95(_tradingPool)
    {
        _tradingPool.SETLIQUIDATOR129(_newLiquidator);
    }

                                                                                                                                                                                                                    
    function SETFEERECIPIENT48(	//inject NONSTANDARD NAMING
        IRebalancingSetTokenV2 _tradingPool,
        address _newFeeRecipient
    )
        external
        ONLYTRADER95(_tradingPool)
    {
        _tradingPool.SETFEERECIPIENT48(_newFeeRecipient);
    }

                                            

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function VALIDATECREATETRADINGPOOL686(	//inject NONSTANDARD NAMING
        ISocialAllocator _tradingPairAllocator,
        uint256 _startingBaseAssetAllocation,
        bytes memory _rebalancingSetCallData
    )
        internal
        view
    {
        VALIDATEALLOCATIONAMOUNT660(_startingBaseAssetAllocation);

        VALIDATEMANAGERADDRESS487(_rebalancingSetCallData);

        require(
            whiteList[address(_tradingPairAllocator)],
            "SocialTradingManager.validateCreateTradingPool: Passed allocator is not valid."
        );
    }

                                                                                                                                                                                                                                                                                                                                                                                                     
    function VALIDATEALLOCATIONUPDATE319(	//inject NONSTANDARD NAMING
        IRebalancingSetTokenV2 _tradingPool,
        uint256 _newAllocation
    )
        internal
        view
    {
        VALIDATEALLOCATIONAMOUNT660(_newAllocation);

        // If current allocation is 0/100%, cannot be the same allocation
        uint256 currentAllocationValue = CURRENTALLOCATION847(_tradingPool);
        require(
            !(currentAllocationValue == maximum_allocation907 && _newAllocation == maximum_allocation907) &&
            !(currentAllocationValue == 0 && _newAllocation == 0),
            "SocialTradingManager.validateAllocationUpdate: Invalid allocation"
        );

        // Require that enough time has passed from last rebalance
        uint256 lastRebalanceTimestamp = _tradingPool.LASTREBALANCETIMESTAMP193();
        uint256 rebalanceInterval = _tradingPool.REBALANCEINTERVAL874();
        require(
            block.timestamp >= lastRebalanceTimestamp.ADD181(rebalanceInterval),
            "SocialTradingManager.validateAllocationUpdate: Rebalance interval not elapsed"
        );

        // Require that Rebalancing Set Token is in Default state, won't allow for re-proposals
        // because malicious actor could prevent token from ever rebalancing
        require(
            _tradingPool.REBALANCESTATE416() == RebalancingLibrary.State.Default,
            "SocialTradingManager.validateAllocationUpdate: State must be in Default"
        );
    }

                                                                                                                                                                                                                                
    function VALIDATEALLOCATIONAMOUNT660(	//inject NONSTANDARD NAMING
        uint256 _allocation
    )
        internal
        view
    {
        require(
            _allocation <= maximum_allocation907,
            "Passed allocation must not exceed 100%."
        );

        require(
            _allocation.MOD955(one_percent684) == 0,
            "Passed allocation must be multiple of 1%."
        );
    }

                                                                                                                                                                                       
    function VALIDATENEWENTRYFEE68(	//inject NONSTANDARD NAMING
        uint256 _entryFee
    )
        internal
        view
    {
        require(
            _entryFee <= maxEntryFee,
            "SocialTradingManager.validateNewEntryFee: Passed entry fee must not exceed maxEntryFee."
        );
    }

                                                                                                                                                                                                                    
    function VALIDATEMANAGERADDRESS487(	//inject NONSTANDARD NAMING
        bytes memory _rebalancingSetCallData
    )
        internal
        view
    {
        address manager;

        assembly {
            manager := mload(add(_rebalancingSetCallData, 32))   // manager slot
        }

        require(
            manager == address(this),
            "SocialTradingManager.validateCallDataArgs: Passed manager address is not this address."
        );
    }

    function ALLOCATOR140(IRebalancingSetTokenV2 _tradingPool) internal view returns (ISocialAllocator) {	//inject NONSTANDARD NAMING
        return pools[address(_tradingPool)].allocator;
    }

    function TRADER608(IRebalancingSetTokenV2 _tradingPool) internal view returns (address) {	//inject NONSTANDARD NAMING
        return pools[address(_tradingPool)].trader;
    }

    function CURRENTALLOCATION847(IRebalancingSetTokenV2 _tradingPool) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return pools[address(_tradingPool)].currentAllocation;
    }

    function FEEUPDATETIMESTAMP840(IRebalancingSetTokenV2 _tradingPool) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return pools[address(_tradingPool)].feeUpdateTimestamp;
    }

    function NEWENTRYFEE124(IRebalancingSetTokenV2 _tradingPool) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return pools[address(_tradingPool)].newEntryFee;
    }
}

// File: contracts/managers/SocialTradingManagerV2.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;
pragma experimental "ABIEncoderV2";







                                                                                                                                                                                                                                                      
contract SocialTradingManagerV2 is
    SocialTradingManager,
    LimitOneUpgrade
{
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    constructor(
        ICore _core,
        address _factory,
        address[] memory _whiteListedAllocators,
        uint256 _maxEntryFee,
        uint256 _feeUpdateTimelock
    )
        public
        SocialTradingManager(
            _core,
            _factory,
            _whiteListedAllocators,
            _maxEntryFee,
            _feeUpdateTimelock
        )
    {}

                                            

                                                                                                                                                                                                                                                                                                         
    function ADJUSTFEE987(	//inject NONSTANDARD NAMING
        address _tradingPool,
        bytes calldata _newFeeCallData
    )
        external
        ONLYTRADER95(IRebalancingSetTokenV2(_tradingPool))
        LIMITONEUPGRADE700(_tradingPool)
        TIMELOCKUPGRADE565
    {
        IRebalancingSetTokenV3(_tradingPool).ADJUSTFEE987(_newFeeCallData);
    }

                                                                                                                                                                                                                                                                                                    
    function REMOVEREGISTEREDUPGRADE375(	//inject NONSTANDARD NAMING
        address _tradingPool,
        bytes32 _upgradeHash
    )
        external
        ONLYTRADER95(IRebalancingSetTokenV2(_tradingPool))
    {
        LimitOneUpgrade.REMOVEREGISTEREDUPGRADEINTERNAL451(_tradingPool, _upgradeHash);
    }
}