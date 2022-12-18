pragma solidity ^0.5.8;

library SafeMath {

    /**
    * @dev Multiplies two numbers, reverts on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
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

    /**
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address public owner;


  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owner = msg.sender;
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

}

contract IERC721 {
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) public view returns (uint256 balance);
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    function ownerOf(uint256 tokenId) public view returns (address owner);
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    function approve(address to, uint256 tokenId) public;
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function getApproved(uint256 tokenId) public view returns (address operator);
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    function setApprovalForAll(address operator, bool _approved) public;
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}

    function isApprovedForAll(address owner, address operator) public view returns (bool);
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

    function transferFrom(address from, address to, uint256 tokenId) public;
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

    function safeTransferFrom(address from, address to, uint256 tokenId) public;
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public;
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
}
/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20BasicInterface {
    function totalSupply() public view returns (uint256);
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

    function balanceOf(address who) public view returns (uint256);
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    function transfer(address to, uint256 value) public returns (bool);
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    function transferFrom(address from, address to, uint256 value) public returns (bool);
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Transfer(address indexed from, address indexed to, uint256 value);

    uint8 public decimals;
}

contract Bussiness is Ownable {

    using SafeMath for uint256;
    address public ceoAddress = address(0x2076A228E6eB670fd1C604DE574d555476520DB7);
    IERC721 public erc721Address = IERC721(0x5D00d312e171Be5342067c09BaE883f9Bcb2003B);
    ERC20BasicInterface public hbwalletToken = ERC20BasicInterface(0xEc7ba74789694d0d03D458965370Dc7cF2FE75Ba);
    uint256 public ETHFee = 0; // 25 = 2,5 %
    uint256 public Percen = 1000;
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  uint256 public HBWALLETExchange = 21;
    // cong thuc hbFee = ETHFee / Percen * HBWALLETExchange / 2
  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  uint256 public limitETHFee = 0;
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  uint256 public limitHBWALLETFee = 0;
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public hightLightFee = 30000000000000000;
    constructor() public {}
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
    struct Price {
        address payable tokenOwner;
        uint256 price;
        uint256 fee;
        uint256 hbfee;
        bool isHightlight;
    }

  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint256[] public arrayTokenIdSale;
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  mapping(uint256 => Price) public prices;

    /**
     * @dev Throws if called by any account other than the ceo address.
     */
    modifier onlyCeoAddress() {
        require(msg.sender == ceoAddress);
        _;
    }
    modifier isOwnerOf(uint256 _tokenId) {
        require(erc721Address.ownerOf(_tokenId) == msg.sender);
        _;
    }
    // Move the last element to the deleted spot.
    // Delete the last element, then correct the length.
    function _burnArrayTokenIdSale(uint8 index)  internal {
        if (index >= arrayTokenIdSale.length) return;

        for (uint i = index; i<arrayTokenIdSale.length-1; i++){
            arrayTokenIdSale[i] = arrayTokenIdSale[i+1];
        }
        delete arrayTokenIdSale[arrayTokenIdSale.length-1];
        arrayTokenIdSale.length--;
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function _burnArrayTokenIdSaleByArr(uint8[] memory arr) internal {
        for(uint8 i; i<arr.length; i++){
            _burnArrayTokenIdSale(i);
        }

    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    function ownerOf(uint256 _tokenId) public view returns (address){
        return erc721Address.ownerOf(_tokenId);
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function balanceOf() public view returns (uint256){
        return address(this).balance;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    function getApproved(uint256 _tokenId) public view returns (address){
        return erc721Address.getApproved(_tokenId);
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function setPrice(uint256 _tokenId, uint256 _ethPrice, uint256 _ethfee, uint _hbfee, bool _isHightLight) internal {
        prices[_tokenId] = Price(msg.sender, _ethPrice, _ethfee, _hbfee, _isHightLight);
        arrayTokenIdSale.push(_tokenId);
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    function calPriceFeeEth(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns(uint256, uint256) {
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        uint256 ethNeed;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || !prices[_tokenId].isHightlight)) {
            _hightLightFee = hightLightFee;
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.sub(prices[_tokenId].price).mul(ETHFee).div(Percen);
            if(prices[_tokenId].price == 0) {
                if (ethfee >= limitETHFee) {
                    ethNeed = ethfee.add(_hightLightFee);
                } else {
                    ethNeed = limitETHFee.add(_hightLightFee);
                }
            }

        }
        return (ethNeed, _hightLightFee);
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function setPriceFeeEth(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public payable isOwnerOf(_tokenId) {
        require(prices[_tokenId].price != _ethPrice);
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || !prices[_tokenId].isHightlight)) {
            _hightLightFee = hightLightFee;
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.sub(prices[_tokenId].price).mul(ETHFee).div(Percen);
            if(prices[_tokenId].price == 0) {
                if (ethfee >= limitETHFee) {
                    require(msg.value == ethfee.add(_hightLightFee));
                } else {
                    require(msg.value == limitETHFee.add(_hightLightFee));
                    ethfee = limitETHFee;
                }
            }
            ethfee = ethfee.add(prices[_tokenId].fee);
        } else ethfee = _ethPrice.mul(ETHFee).div(Percen);

        setPrice(_tokenId, _ethPrice, ethfee, 0, _isHightLight == 1);
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function calPriceFeeHBWALLET(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns (uint256){
        uint fee;
        uint256 ethfee;
        uint _hightLightFee = 0;
        uint hbNeed;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || !prices[_tokenId].isHightlight)) {
            // _hightLightFee = hightLightFee * HBWALLETExchange / 2 / (10 ** 16);
            _hightLightFee = hightLightFee.mul(HBWALLETExchange).div(2).div(10 ** 16);
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.sub(prices[_tokenId].price).mul(ETHFee).div(Percen);
            fee = ethfee.mul(HBWALLETExchange).div(2).div(10 ** 16);
            // ethfee * HBWALLETExchange / 2 * (10 ** 2) / (10 ** 18)
            if(prices[_tokenId].price == 0) {
                if (fee >= limitHBWALLETFee) {
                    hbNeed = fee.add(_hightLightFee);
                } else {
                    hbNeed = limitHBWALLETFee.add(_hightLightFee);
                }
            }
        }
        return hbNeed;
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function setPriceFeeHBWALLET(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public isOwnerOf(_tokenId) {
        require(prices[_tokenId].price != _ethPrice);
        uint fee;
        uint256 ethfee;
        uint _hightLightFee = 0;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || !prices[_tokenId].isHightlight)) {
            _hightLightFee = hightLightFee.mul(HBWALLETExchange).div(2).div(10 ** 16);
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.sub(prices[_tokenId].price).mul(ETHFee).div(Percen);
            fee = ethfee.mul(HBWALLETExchange).div(2).div(10 ** 16);
            // ethfee * HBWALLETExchange / 2 * (10 ** 2) / (10 ** 18)
            if(prices[_tokenId].price == 0) {
                if (fee >= limitHBWALLETFee) {
                    require(hbwalletToken.transferFrom(msg.sender, address(this), fee.add(_hightLightFee)));
                } else {
                    require(hbwalletToken.transferFrom(msg.sender, address(this), limitHBWALLETFee.add(_hightLightFee)));
                    fee = limitHBWALLETFee;
                }
            }
            fee = fee.add(prices[_tokenId].hbfee);
        } else {
            ethfee = _ethPrice.mul(ETHFee).div(Percen);
            fee = ethfee.mul(HBWALLETExchange).div(2).div(10 ** 16);
        }

        setPrice(_tokenId, _ethPrice, 0, fee, _isHightLight == 1);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function removePrice(uint256 _tokenId) public isOwnerOf(_tokenId) returns (uint256){
        if (prices[_tokenId].fee > 0) msg.sender.transfer(prices[_tokenId].fee);
        else if (prices[_tokenId].hbfee > 0) hbwalletToken.transfer(msg.sender, prices[_tokenId].hbfee);
        resetPrice(_tokenId);
        return prices[_tokenId].price;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    function setFee(uint256 _ethFee, uint _HBWALLETExchange, uint256 _hightLightFee) public onlyOwner returns (uint256, uint, uint256){
        require(_ethFee >= 0 && _HBWALLETExchange >= 1 && _hightLightFee >= 0);
        ETHFee = _ethFee;
        HBWALLETExchange = _HBWALLETExchange;
        hightLightFee = _hightLightFee;
        return (ETHFee, HBWALLETExchange, hightLightFee);
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function setLimitFee(uint256 _ethlimitFee, uint _hbWalletlimitFee) public onlyOwner returns (uint256, uint){
        require(_ethlimitFee >= 0 && _hbWalletlimitFee >= 0);
        limitETHFee = _ethlimitFee;
        limitHBWALLETFee = _hbWalletlimitFee;
        return (limitETHFee, limitHBWALLETFee);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function _withdraw(uint256 amount, uint256 _amountHB) internal {
        require(address(this).balance >= amount && hbwalletToken.balanceOf(address(this)) >= _amountHB);
        if(amount > 0) {
            msg.sender.transfer(amount);
        }
        if(_amountHB > 0) {
            hbwalletToken.transfer(msg.sender, _amountHB);
        }
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function withdraw(uint256 amount, uint8 _amountHB) public onlyCeoAddress {
        _withdraw(amount, _amountHB);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    function cancelBussiness() public onlyCeoAddress {
        uint256[] memory arr = arrayTokenIdSale;
        uint length = arrayTokenIdSale.length;
        for (uint i = 0; i < length; i++) {
            if (prices[arr[i]].tokenOwner == erc721Address.ownerOf(arr[i])) {
                if (prices[arr[i]].fee > 0) {
                    uint256 eth = prices[arr[i]].fee;
                    if(prices[arr[i]].isHightlight) eth = eth.add(hightLightFee);
                    if(address(this).balance >= eth) {
                        prices[arr[i]].tokenOwner.transfer(eth);
                    }
                }
                else if (prices[arr[i]].hbfee > 0) {
                    uint hb = prices[arr[i]].hbfee;
                    if(prices[arr[i]].isHightlight) hb = hb.add(hightLightFee.mul(HBWALLETExchange).div(2).div(10 ** 16));
                    if(hbwalletToken.balanceOf(address(this)) >= hb) {
                        hbwalletToken.transfer(prices[arr[i]].tokenOwner, hb);
                    }
                }
                resetPrice(arr[i]);
            }
        }
        _withdraw(address(this).balance, hbwalletToken.balanceOf(address(this)));
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function revenue() public view returns (uint256, uint){
        uint256 ethfee = 0;
        uint256 hbfee = 0;
        for (uint i = 0; i < arrayTokenIdSale.length; i++) {
            if (prices[arrayTokenIdSale[i]].tokenOwner == erc721Address.ownerOf(arrayTokenIdSale[i])) {
                if (prices[arrayTokenIdSale[i]].fee > 0) {
                    ethfee = ethfee.add(prices[arrayTokenIdSale[i]].fee);
                }
                else if (prices[arrayTokenIdSale[i]].hbfee > 0) {
                    hbfee = hbfee.add(prices[arrayTokenIdSale[i]].hbfee);
                }
            }
        }
        uint256 eth = address(this).balance.sub(ethfee);
        uint256 hb = hbwalletToken.balanceOf(address(this)).sub(hbfee);
        return (eth, hb);
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function changeCeo(address _address) public onlyCeoAddress {
        require(_address != address(0));
        ceoAddress = _address;

    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function buy(uint256 tokenId) public payable {
        require(getApproved(tokenId) == address(this));
        require(prices[tokenId].price > 0 && prices[tokenId].price == msg.value);
        erc721Address.transferFrom(prices[tokenId].tokenOwner, msg.sender, tokenId);
        prices[tokenId].tokenOwner.transfer(msg.value);
        resetPrice(tokenId);
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function buyWithoutCheckApproved(uint256 tokenId) public payable {
        require(prices[tokenId].price > 0 && prices[tokenId].price == msg.value);
        erc721Address.transferFrom(prices[tokenId].tokenOwner, msg.sender, tokenId);
        prices[tokenId].tokenOwner.transfer(msg.value);
        resetPrice(tokenId);
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function resetPrice(uint256 tokenId) private {
        prices[tokenId] = Price(address(0), 0, 0, 0, false);
        for (uint8 i = 0; i < arrayTokenIdSale.length; i++) {
            if (arrayTokenIdSale[i] == tokenId) {
                _burnArrayTokenIdSale(i);
            }
        }
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
}