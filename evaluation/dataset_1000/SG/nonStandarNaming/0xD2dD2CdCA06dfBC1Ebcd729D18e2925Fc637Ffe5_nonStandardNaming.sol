                                                                 

                                                                 

// File: contracts/external/Dydx/lib/Monetary.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

pragma solidity 0.5.7;
pragma experimental ABIEncoderV2;


                                                                                  
library Monetary {

                                                           
    struct Price {
        uint256 value;
    }

                                                                                           
    struct Value {
        uint256 value;
    }
}

// File: contracts/external/Dydx/interfaces/IDydxPriceOracle.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;


                                                                                                                                                
contract IDydxPriceOracle {
    function GETPRICE403(	//inject NONSTANDARD NAMING
        address token
    )
        public
        view
        returns (Monetary.Price memory);
}

// File: contracts/meta-oracles/proxies/DydxOracleAdapter.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

pragma solidity 0.5.7;




                                                                                                                                                          
contract DydxOracleAdapter {

                                                   
    IDydxPriceOracle public dYdXOracleInstance;
    address public erc20TokenAddress;

                                               
                                                                                                                                                                                                                                                                                                                                                       
    constructor(
        IDydxPriceOracle _dYdXOracleInstance,
        address _erc20TokenAddress
    )
        public
    {
        dYdXOracleInstance = _dYdXOracleInstance;
        erc20TokenAddress = _erc20TokenAddress;
    }

                                            

                                                                                                                                        
    function READ697()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        // Get struct and read value in uint256
        Monetary.Price memory price = dYdXOracleInstance.GETPRICE403(erc20TokenAddress);
        return price.value;
    }
}