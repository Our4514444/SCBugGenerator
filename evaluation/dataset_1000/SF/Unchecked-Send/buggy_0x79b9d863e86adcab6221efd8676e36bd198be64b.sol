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


  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owner = msg.sender;
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

}

contract IERC721 {
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) public view returns (uint256 balance);

    function ownerOf(uint256 tokenId) public view returns (address owner);

    function approve(address to, uint256 tokenId) public;

    function getApproved(uint256 tokenId) public view returns (address operator);

    function setApprovalForAll(address operator, bool _approved) public;

    function isApprovedForAll(address owner, address operator) public view returns (bool);

    function transferFrom(address from, address to, uint256 tokenId) public;

    function safeTransferFrom(address from, address to, uint256 tokenId) public;

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public;
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
}
/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20BasicInterface {
    function totalSupply() public view returns (uint256);
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address who) public view returns (uint256);
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address to, uint256 value) public returns (bool);
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address from, address to, uint256 value) public returns (bool);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
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
    uint256 public HBWALLETExchange = 21;
    // cong thuc hbFee = ETHFee / Percen * HBWALLETExchange / 2
    uint256 public limitETHFee = 0;
    uint256 public limitHBWALLETFee = 0;
    uint256 public hightLightFee = 30000000000000000;
    constructor() public {}
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    struct Price {
        address payable tokenOwner;
        uint256 price;
        uint256 fee;
        uint256 hbfee;
        bool isHightlight;
    }

    uint256[] public arrayTokenIdSale;
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
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function _burnArrayTokenIdSaleByArr(uint8[] memory arr) internal {
        for(uint8 i; i<arr.length; i++){
            _burnArrayTokenIdSale(i);
        }

    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function ownerOf(uint256 _tokenId) public view returns (address){
        return erc721Address.ownerOf(_tokenId);
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf() public view returns (uint256){
        return address(this).balance;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function getApproved(uint256 _tokenId) public view returns (address){
        return erc721Address.getApproved(_tokenId);
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function setPrice(uint256 _tokenId, uint256 _ethPrice, uint256 _ethfee, uint _hbfee, bool _isHightLight) internal {
        prices[_tokenId] = Price(msg.sender, _ethPrice, _ethfee, _hbfee, _isHightLight);
        arrayTokenIdSale.push(_tokenId);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function removePrice(uint256 _tokenId) public isOwnerOf(_tokenId) returns (uint256){
        if (prices[_tokenId].fee > 0) msg.sender.transfer(prices[_tokenId].fee);
        else if (prices[_tokenId].hbfee > 0) hbwalletToken.transfer(msg.sender, prices[_tokenId].hbfee);
        resetPrice(_tokenId);
        return prices[_tokenId].price;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function setFee(uint256 _ethFee, uint _HBWALLETExchange, uint256 _hightLightFee) public onlyOwner returns (uint256, uint, uint256){
        require(_ethFee >= 0 && _HBWALLETExchange >= 1 && _hightLightFee >= 0);
        ETHFee = _ethFee;
        HBWALLETExchange = _HBWALLETExchange;
        hightLightFee = _hightLightFee;
        return (ETHFee, HBWALLETExchange, hightLightFee);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    function setLimitFee(uint256 _ethlimitFee, uint _hbWalletlimitFee) public onlyOwner returns (uint256, uint){
        require(_ethlimitFee >= 0 && _hbWalletlimitFee >= 0);
        limitETHFee = _ethlimitFee;
        limitHBWALLETFee = _hbWalletlimitFee;
        return (limitETHFee, limitHBWALLETFee);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function _withdraw(uint256 amount, uint256 _amountHB) internal {
        require(address(this).balance >= amount && hbwalletToken.balanceOf(address(this)) >= _amountHB);
        if(amount > 0) {
            msg.sender.transfer(amount);
        }
        if(_amountHB > 0) {
            hbwalletToken.transfer(msg.sender, _amountHB);
        }
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function withdraw(uint256 amount, uint8 _amountHB) public onlyCeoAddress {
        _withdraw(amount, _amountHB);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function changeCeo(address _address) public onlyCeoAddress {
        require(_address != address(0));
        ceoAddress = _address;

    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function buy(uint256 tokenId) public payable {
        require(getApproved(tokenId) == address(this));
        require(prices[tokenId].price > 0 && prices[tokenId].price == msg.value);
        erc721Address.transferFrom(prices[tokenId].tokenOwner, msg.sender, tokenId);
        prices[tokenId].tokenOwner.transfer(msg.value);
        resetPrice(tokenId);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function buyWithoutCheckApproved(uint256 tokenId) public payable {
        require(prices[tokenId].price > 0 && prices[tokenId].price == msg.value);
        erc721Address.transferFrom(prices[tokenId].tokenOwner, msg.sender, tokenId);
        prices[tokenId].tokenOwner.transfer(msg.value);
        resetPrice(tokenId);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function resetPrice(uint256 tokenId) private {
        prices[tokenId] = Price(address(0), 0, 0, 0, false);
        for (uint8 i = 0; i < arrayTokenIdSale.length; i++) {
            if (arrayTokenIdSale[i] == tokenId) {
                _burnArrayTokenIdSale(i);
            }
        }
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}