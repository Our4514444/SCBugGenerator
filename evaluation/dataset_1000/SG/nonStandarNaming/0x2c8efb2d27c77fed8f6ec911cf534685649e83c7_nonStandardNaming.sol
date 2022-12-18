pragma solidity ^0.5.8;

                                                                                                                                                                                      
contract FactoryStorage {

    //TODO: add more events

    event NEWPOSITIONCONTRACT327(	//inject NONSTANDARD NAMING
        address userAddress,
        address newPositionContractAddress,
        address factoryLogicAddress
    );

    event NEWTOKENADDEDTOPOSITIONCONTRACT714(	//inject NONSTANDARD NAMING
        string ticker,
        address tokenAddr,
        address cTokenAddr,
        address exchangeAddr
    );

    event USERADDED741(	//inject NONSTANDARD NAMING
        address userAddr
    );

    event TICKERADDED733(	//inject NONSTANDARD NAMING
        string ticker
    );

    event FACTORYLOGICCHANGED456(	//inject NONSTANDARD NAMING
        address factoryLogicAddr
    );

    //maybe the name positionContractAddresses is better?!
    //ticker => userAddr => positionContractAddr
    //e.g. ticker = 'REP'
    mapping (string => mapping (address => address)) public positionContracts;

                                                                                                                                                                                                                                                                           
    mapping (string => address) public tokenAddresses;
    mapping (string => address) public ctokenAddresses;
    mapping (string => address) public exchangeAddresses;

    //TODO: think about - using CarefulMath for uint;

    address public factoryLogicAddress;

                                                                       
    address[3] public ownerAddresses;

                                                                   
    address[] public userAddresses;
    string[] public tickers;

                                                                                                                                      
    mapping (address => bool) public userAddressesSet;
    mapping (string => bool) public tickerSet;

                                                                                                                                                                           
    constructor(address owner1, address owner2) public {
        //TODO: deal with keys and ownership
        ownerAddresses[0] = msg.sender;
        ownerAddresses[1] = owner1;
        ownerAddresses[2] = owner2;

        tickers = ['DAI','ZRX','BAT','ETH'];
        tickerSet['DAI'] = true;
        tickerSet['ZRX'] = true;
        tickerSet['BAT'] = true;
        tickerSet['ETH'] = true;

        //TODO: ensure all the following are accurate for mainnet.
        tokenAddresses['DAI'] = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
        tokenAddresses['BAT'] = 0x0D8775F648430679A709E98d2b0Cb6250d2887EF;
        tokenAddresses['ZRX'] = 0xE41d2489571d322189246DaFA5ebDe1F4699F498;
        tokenAddresses['REP'] = 0x1985365e9f78359a9B6AD760e32412f4a445E862;

        ctokenAddresses['DAI'] = 0xF5DCe57282A584D2746FaF1593d3121Fcac444dC;
        ctokenAddresses['BAT'] = 0x6C8c6b02E7b2BE14d4fA6022Dfd6d75921D90E4E;
        ctokenAddresses['ZRX'] = 0xB3319f5D18Bc0D84dD1b4825Dcde5d5f7266d407;
        ctokenAddresses['REP'] = 0x158079Ee67Fce2f58472A96584A73C7Ab9AC95c1;
        ctokenAddresses['ETH'] = 0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5;

        exchangeAddresses['DAI'] = 0x09cabEC1eAd1c0Ba254B09efb3EE13841712bE14;
        exchangeAddresses['BAT'] = 0x2E642b8D59B45a1D8c5aEf716A84FF44ea665914;
        exchangeAddresses['ZRX'] = 0xaE76c84C9262Cdb9abc0C2c8888e62Db8E22A0bF;
        exchangeAddresses['REP'] = 0x48B04d2A05B6B604d8d5223Fd1984f191DED51af;
    }

                                                                                                                                                                                                                   
    function SETFACTORYLOGICADDRESS905(address newAddress) public {	//inject NONSTANDARD NAMING
        require(factoryLogicAddress == msg.sender|| ownerAddresses[0] == msg.sender || ownerAddresses[1] == msg.sender || ownerAddresses[2] == msg.sender);
        //TODO: better security practices required than the above
        factoryLogicAddress = newAddress;
        emit FACTORYLOGICCHANGED456(newAddress);
    }

                                                                                                                            
    function ADDUSER830(address newAddress) public {	//inject NONSTANDARD NAMING
        require(factoryLogicAddress == msg.sender|| ownerAddresses[0] == msg.sender || ownerAddresses[1] == msg.sender || ownerAddresses[2] == msg.sender);
        //TODO: ensure that this is how it works.
        if (!userAddressesSet[newAddress]) {
            userAddresses.push(newAddress);
            userAddressesSet[newAddress] = true;
            emit USERADDED741(newAddress);
        }
    }

                                                                                                                  
    function ADDTICKER880(string memory ticker) public {	//inject NONSTANDARD NAMING
        require(factoryLogicAddress == msg.sender|| ownerAddresses[0] == msg.sender || ownerAddresses[1] == msg.sender || ownerAddresses[2] == msg.sender);
        //TODO: ensure that this is how it works.
        if (!tickerSet[ticker]) {
            tickers.push(ticker);
            tickerSet[ticker] = true;
            emit TICKERADDED733(ticker);
        }
    }

                                                                                                                                                                                                                    
    function UPDATETOKENADDRESS665(string memory ticker, address newAddress) public {	//inject NONSTANDARD NAMING
        require(factoryLogicAddress == msg.sender|| ownerAddresses[0] == msg.sender || ownerAddresses[1] == msg.sender || ownerAddresses[2] == msg.sender);
        tokenAddresses[ticker] = newAddress;
    }

                                                                                                                                            
    function UPDATECTOKENADDRESS609(string memory ticker, address newAddress) public {	//inject NONSTANDARD NAMING
        require(factoryLogicAddress == msg.sender|| ownerAddresses[0] == msg.sender || ownerAddresses[1] == msg.sender || ownerAddresses[2] == msg.sender);
        ctokenAddresses[ticker] = newAddress;
    }

                                                                                                                                                                                               
    function UPDATEEXCHANGEADDRESS965(string memory ticker, address newAddress) public {	//inject NONSTANDARD NAMING
        require(factoryLogicAddress == msg.sender|| ownerAddresses[0] == msg.sender || ownerAddresses[1] == msg.sender || ownerAddresses[2] == msg.sender);
        exchangeAddresses[ticker] = newAddress;
    }

    //  TODO: proper solidity style for following function
                                                                                                                                                                                                                                                                                                                                                      
    function ADDNEWTOKENTOPOSITIONCONTRACTS386(string memory ticker, address tokenAddr, address cTokenAddr, address exchangeAddr) public {	//inject NONSTANDARD NAMING
        require(factoryLogicAddress == msg.sender|| ownerAddresses[0] == msg.sender || ownerAddresses[1] == msg.sender || ownerAddresses[2] == msg.sender);
        //TODO: do we want to first ensure ticker not already there?!
        tokenAddresses[ticker] = tokenAddr;
        ctokenAddresses[ticker] = cTokenAddr;
        exchangeAddresses[ticker] = exchangeAddr;
        emit NEWTOKENADDEDTOPOSITIONCONTRACT714(ticker, tokenAddr, cTokenAddr, exchangeAddr);
    }

                                                                                                                                                                                                                                                                                                                                                                   
    function ADDNEWPOSITIONCONTRACT726(string memory ticker, address userAddress, address newContractAddress) public {	//inject NONSTANDARD NAMING
        //TODO: ensure userAddress has been added and ticker is valid.
        require(factoryLogicAddress == msg.sender);
        positionContracts[ticker][userAddress] = newContractAddress;
        ADDUSER830(userAddress);
        //TODO: shouldn't the following event include the ticker?
        emit NEWPOSITIONCONTRACT327(userAddress, newContractAddress, msg.sender);
    }
    
    function UPDATEROOTADDR296(address newAddress) public{	//inject NONSTANDARD NAMING
        if(ownerAddresses[0] == msg.sender){
            ownerAddresses[0] = newAddress;
        } else if (ownerAddresses[1] == msg.sender) {
            ownerAddresses[1] = newAddress;
        } else if (ownerAddresses[2] == msg.sender) {
            ownerAddresses[2] = newAddress;
        }
    }
}