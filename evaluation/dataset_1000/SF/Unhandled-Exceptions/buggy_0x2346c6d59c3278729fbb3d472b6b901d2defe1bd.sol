pragma solidity ^0.5.2;

contract ProxyData {
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  address internal proxied;
}

contract Proxy is ProxyData {
    constructor(address _proxied) public {
        proxied = _proxied;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
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
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
}

contract UniswapFactoryInterface {
    // Public Variables
  function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  address public exchangeTemplate;
  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 public tokenCount;
    // Create Exchange
    function createExchange(address token) external returns (address exchange);
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    // Get Exchange and Token Info
    function getExchange(address token) external view returns (address exchange);
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    function getToken(address exchange) external view returns (address token);
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    function getTokenWithId(uint256 tokenId) external view returns (address token);
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
    // Never use
    function initializeFactory(address template) external;
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
}

contract FundHeader {
    address constant internal cEth = address(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);
    UniswapFactoryInterface constant internal uniswapFactory = UniswapFactoryInterface(0xc0a47dFe034B400B47bDaD5FecDa2621de6c4d95);
}

contract FundDataInternal is ProxyData, FundHeader {
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  address internal collateralOwner;
  function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  address internal interestWithdrawer;
    // cTokenAddress -> sum deposits denominated in underlying
  function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  mapping(address => uint) internal initialDepositCollateral;
    // cTokenAddresses
  function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  address[] internal markets;
}

contract CERC20NoBorrowInterface {
    function mint(uint mintAmount) external returns (uint);
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
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
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}