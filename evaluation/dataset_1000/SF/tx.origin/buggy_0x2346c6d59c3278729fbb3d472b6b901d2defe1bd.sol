pragma solidity ^0.5.2;

contract ProxyData {
  function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  address internal proxied;
}

contract Proxy is ProxyData {
    constructor(address _proxied) public {
        proxied = _proxied;
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
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
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
}

contract UniswapFactoryInterface {
    // Public Variables
  function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
  address public exchangeTemplate;
  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  uint256 public tokenCount;
    // Create Exchange
    function createExchange(address token) external returns (address exchange);
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
    // Get Exchange and Token Info
    function getExchange(address token) external view returns (address exchange);
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    function getToken(address exchange) external view returns (address token);
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
    function getTokenWithId(uint256 tokenId) external view returns (address token);
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
    // Never use
    function initializeFactory(address template) external;
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
}

contract FundHeader {
    address constant internal cEth = address(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);
    UniswapFactoryInterface constant internal uniswapFactory = UniswapFactoryInterface(0xc0a47dFe034B400B47bDaD5FecDa2621de6c4d95);
}

contract FundDataInternal is ProxyData, FundHeader {
  function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  address internal collateralOwner;
  function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  address internal interestWithdrawer;
    // cTokenAddress -> sum deposits denominated in underlying
  function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
  mapping(address => uint) internal initialDepositCollateral;
    // cTokenAddresses
  function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
  address[] internal markets;
}

contract CERC20NoBorrowInterface {
    function mint(uint mintAmount) external returns (uint);
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  address public underlying;
}

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
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
            if (_markets[i] == cEth) {
                continue;
            }
            address underlying = CERC20NoBorrowInterface(_markets[i]).underlying();
            require(IERC20(underlying).approve(_markets[i], uint(-1)));
            require(IERC20(underlying).approve(uniswapFactory.getExchange(underlying), uint(-1)));
        }
        collateralOwner = _collateralOwner;
        interestWithdrawer = _interestWithdrawer;
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}