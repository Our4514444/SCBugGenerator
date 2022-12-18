pragma solidity ^0.5.2;

contract ProxyData {
    address internal proxied;
}

contract Proxy is ProxyData {
    constructor(address _proxied) public {
        proxied = _proxied;
    }

    function () external payable {
        address addr = proxied;
        assembly {
            let freememstart := mload(0x40)
            calldatacopy(freememstart, 0, calldatasize())
            let success := delegatecall(not(0), addr, freememstart, calldatasize(), freememstart, 0)
            returndatacopy(freememstart, 0, returndatasize())
            switch success
                case 0 { revert(freememstart, returndatasize()) }
                default { return(freememstart, returndatasize()) }
        }
    }
}

contract UniswapFactoryInterface {
    // Public Variables
    address public exchangeTemplate;
    uint256 public tokenCount;
    // Create Exchange
    function CREATEEXCHANGE556(address token) external returns (address exchange);	//inject NONSTANDARD NAMING
    // Get Exchange and Token Info
    function GETEXCHANGE954(address token) external view returns (address exchange);	//inject NONSTANDARD NAMING
    function GETTOKEN105(address exchange) external view returns (address token);	//inject NONSTANDARD NAMING
    function GETTOKENWITHID958(uint256 tokenId) external view returns (address token);	//inject NONSTANDARD NAMING
    // Never use
    function INITIALIZEFACTORY7(address template) external;	//inject NONSTANDARD NAMING
}

contract FundHeader {
    address constant internal ceth804 = address(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);	//inject NONSTANDARD NAMING
    UniswapFactoryInterface constant internal uniswapfactory88 = UniswapFactoryInterface(0xc0a47dFe034B400B47bDaD5FecDa2621de6c4d95);	//inject NONSTANDARD NAMING
}

contract FundDataInternal is ProxyData, FundHeader {
    address internal collateralOwner;
    address internal interestWithdrawer;
    // cTokenAddress -> sum deposits denominated in underlying
    mapping(address => uint) internal initialDepositCollateral;
    // cTokenAddresses
    address[] internal markets;
}

contract CERC20NoBorrowInterface {
    function MINT494(uint mintAmount) external returns (uint);	//inject NONSTANDARD NAMING
    address public underlying;
}

interface IERC20 {
    function TRANSFER485(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE158(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM513(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY739() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF326(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE304(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    event TRANSFER21(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL656(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract FundProxy is Proxy, FundDataInternal {
    constructor(
        address proxied,
        address _collateralOwner,
        address _interestWithdrawer,
        address[] memory _markets)
            public
            Proxy(proxied)
    {
        for (uint i=0; i < _markets.length; i++) {
            markets.push(_markets[i]);
            if (_markets[i] == ceth804) {
                continue;
            }
            address underlying = CERC20NoBorrowInterface(_markets[i]).underlying();
            require(IERC20(underlying).APPROVE158(_markets[i], uint(-1)));
            require(IERC20(underlying).APPROVE158(uniswapfactory88.GETEXCHANGE954(underlying), uint(-1)));
        }
        collateralOwner = _collateralOwner;
        interestWithdrawer = _interestWithdrawer;
    }
}