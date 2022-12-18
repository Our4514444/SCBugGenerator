pragma solidity ^0.5.2;

contract ProxyData {
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  address internal proxied;
}

contract Proxy is ProxyData {
    constructor(address _proxied) public {
        proxied = _proxied;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}

contract UniswapFactoryInterface {
    // Public Variables
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  address public exchangeTemplate;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public tokenCount;
    // Create Exchange
    function createExchange(address token) external returns (address exchange);
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    // Get Exchange and Token Info
    function getExchange(address token) external view returns (address exchange);
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    function getToken(address exchange) external view returns (address token);
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function getTokenWithId(uint256 tokenId) external view returns (address token);
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    // Never use
    function initializeFactory(address template) external;
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}

contract FundHeader {
    address constant internal cEth = address(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);
    UniswapFactoryInterface constant internal uniswapFactory = UniswapFactoryInterface(0xc0a47dFe034B400B47bDaD5FecDa2621de6c4d95);
}

contract FundDataInternal is ProxyData, FundHeader {
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  address internal collateralOwner;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  address internal interestWithdrawer;
    // cTokenAddress -> sum deposits denominated in underlying
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint) internal initialDepositCollateral;
    // cTokenAddresses
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  address[] internal markets;
}

contract CERC20NoBorrowInterface {
    function mint(uint mintAmount) external returns (uint);
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}