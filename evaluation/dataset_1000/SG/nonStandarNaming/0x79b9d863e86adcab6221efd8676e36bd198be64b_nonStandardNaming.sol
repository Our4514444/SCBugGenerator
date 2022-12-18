pragma solidity ^0.5.8;

library SafeMath {

                                                                      
    function MUL862(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                               
    function DIV441(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB73(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD799(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD862(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}
                                                                                                                                                                                             
contract Ownable {
    address public owner;


    event OWNERSHIPTRANSFERRED275(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING


                                                                                                                           
    constructor() public {
        owner = msg.sender;
    }

                                                                                 
    modifier ONLYOWNER242() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP743(address newOwner) public ONLYOWNER242 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED275(owner, newOwner);
        owner = newOwner;
    }

}

contract IERC721 {
    event TRANSFER923(address indexed from, address indexed to, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL389(address indexed owner, address indexed approved, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVALFORALL2(address indexed owner, address indexed operator, bool approved);	//inject NONSTANDARD NAMING

    function BALANCEOF47(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

    function OWNEROF604(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

    function APPROVE561(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function GETAPPROVED318(uint256 tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL258(address operator, bool _approved) public;	//inject NONSTANDARD NAMING

    function ISAPPROVEDFORALL680(address owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM479(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM865(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM865(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING
}
                                                                                                                               
contract ERC20BasicInterface {
    function TOTALSUPPLY839() public view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF47(address who) public view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER247(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM479(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER923(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

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
    struct Price {
        address payable tokenOwner;
        uint256 price;
        uint256 fee;
        uint256 hbfee;
        bool isHightlight;
    }

    uint256[] public arrayTokenIdSale;
    mapping(uint256 => Price) public prices;

                                                                                       
    modifier ONLYCEOADDRESS500() {	//inject NONSTANDARD NAMING
        require(msg.sender == ceoAddress);
        _;
    }
    modifier ISOWNEROF843(uint256 _tokenId) {	//inject NONSTANDARD NAMING
        require(erc721Address.OWNEROF604(_tokenId) == msg.sender);
        _;
    }
    // Move the last element to the deleted spot.
    // Delete the last element, then correct the length.
    function _BURNARRAYTOKENIDSALE960(uint8 index)  internal {	//inject NONSTANDARD NAMING
        if (index >= arrayTokenIdSale.length) return;

        for (uint i = index; i<arrayTokenIdSale.length-1; i++){
            arrayTokenIdSale[i] = arrayTokenIdSale[i+1];
        }
        delete arrayTokenIdSale[arrayTokenIdSale.length-1];
        arrayTokenIdSale.length--;
    }

    function _BURNARRAYTOKENIDSALEBYARR839(uint8[] memory arr) internal {	//inject NONSTANDARD NAMING
        for(uint8 i; i<arr.length; i++){
            _BURNARRAYTOKENIDSALE960(i);
        }

    }
    function OWNEROF604(uint256 _tokenId) public view returns (address){	//inject NONSTANDARD NAMING
        return erc721Address.OWNEROF604(_tokenId);
    }

    function BALANCEOF47() public view returns (uint256){	//inject NONSTANDARD NAMING
        return address(this).balance;
    }

    function GETAPPROVED318(uint256 _tokenId) public view returns (address){	//inject NONSTANDARD NAMING
        return erc721Address.GETAPPROVED318(_tokenId);
    }

    function SETPRICE6(uint256 _tokenId, uint256 _ethPrice, uint256 _ethfee, uint _hbfee, bool _isHightLight) internal {	//inject NONSTANDARD NAMING
        prices[_tokenId] = Price(msg.sender, _ethPrice, _ethfee, _hbfee, _isHightLight);
        arrayTokenIdSale.push(_tokenId);
    }

    function CALPRICEFEEETH966(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns(uint256, uint256) {	//inject NONSTANDARD NAMING
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        uint256 ethNeed;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || !prices[_tokenId].isHightlight)) {
            _hightLightFee = hightLightFee;
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.SUB73(prices[_tokenId].price).MUL862(ETHFee).DIV441(Percen);
            if(prices[_tokenId].price == 0) {
                if (ethfee >= limitETHFee) {
                    ethNeed = ethfee.ADD799(_hightLightFee);
                } else {
                    ethNeed = limitETHFee.ADD799(_hightLightFee);
                }
            }

        }
        return (ethNeed, _hightLightFee);
    }
    function SETPRICEFEEETH187(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public payable ISOWNEROF843(_tokenId) {	//inject NONSTANDARD NAMING
        require(prices[_tokenId].price != _ethPrice);
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || !prices[_tokenId].isHightlight)) {
            _hightLightFee = hightLightFee;
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.SUB73(prices[_tokenId].price).MUL862(ETHFee).DIV441(Percen);
            if(prices[_tokenId].price == 0) {
                if (ethfee >= limitETHFee) {
                    require(msg.value == ethfee.ADD799(_hightLightFee));
                } else {
                    require(msg.value == limitETHFee.ADD799(_hightLightFee));
                    ethfee = limitETHFee;
                }
            }
            ethfee = ethfee.ADD799(prices[_tokenId].fee);
        } else ethfee = _ethPrice.MUL862(ETHFee).DIV441(Percen);

        SETPRICE6(_tokenId, _ethPrice, ethfee, 0, _isHightLight == 1);
    }
    function CALPRICEFEEHBWALLET744(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns (uint256){	//inject NONSTANDARD NAMING
        uint fee;
        uint256 ethfee;
        uint _hightLightFee = 0;
        uint hbNeed;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || !prices[_tokenId].isHightlight)) {
            // _hightLightFee = hightLightFee * HBWALLETExchange / 2 / (10 ** 16);
            _hightLightFee = hightLightFee.MUL862(HBWALLETExchange).DIV441(2).DIV441(10 ** 16);
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.SUB73(prices[_tokenId].price).MUL862(ETHFee).DIV441(Percen);
            fee = ethfee.MUL862(HBWALLETExchange).DIV441(2).DIV441(10 ** 16);
            // ethfee * HBWALLETExchange / 2 * (10 ** 2) / (10 ** 18)
            if(prices[_tokenId].price == 0) {
                if (fee >= limitHBWALLETFee) {
                    hbNeed = fee.ADD799(_hightLightFee);
                } else {
                    hbNeed = limitHBWALLETFee.ADD799(_hightLightFee);
                }
            }
        }
        return hbNeed;
    }
    function SETPRICEFEEHBWALLET656(uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public ISOWNEROF843(_tokenId) {	//inject NONSTANDARD NAMING
        require(prices[_tokenId].price != _ethPrice);
        uint fee;
        uint256 ethfee;
        uint _hightLightFee = 0;
        if (_isHightLight == 1 && (prices[_tokenId].price == 0 || !prices[_tokenId].isHightlight)) {
            _hightLightFee = hightLightFee.MUL862(HBWALLETExchange).DIV441(2).DIV441(10 ** 16);
        }
        if (prices[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.SUB73(prices[_tokenId].price).MUL862(ETHFee).DIV441(Percen);
            fee = ethfee.MUL862(HBWALLETExchange).DIV441(2).DIV441(10 ** 16);
            // ethfee * HBWALLETExchange / 2 * (10 ** 2) / (10 ** 18)
            if(prices[_tokenId].price == 0) {
                if (fee >= limitHBWALLETFee) {
                    require(hbwalletToken.TRANSFERFROM479(msg.sender, address(this), fee.ADD799(_hightLightFee)));
                } else {
                    require(hbwalletToken.TRANSFERFROM479(msg.sender, address(this), limitHBWALLETFee.ADD799(_hightLightFee)));
                    fee = limitHBWALLETFee;
                }
            }
            fee = fee.ADD799(prices[_tokenId].hbfee);
        } else {
            ethfee = _ethPrice.MUL862(ETHFee).DIV441(Percen);
            fee = ethfee.MUL862(HBWALLETExchange).DIV441(2).DIV441(10 ** 16);
        }

        SETPRICE6(_tokenId, _ethPrice, 0, fee, _isHightLight == 1);
    }

    function REMOVEPRICE959(uint256 _tokenId) public ISOWNEROF843(_tokenId) returns (uint256){	//inject NONSTANDARD NAMING
        if (prices[_tokenId].fee > 0) msg.sender.transfer(prices[_tokenId].fee);
        else if (prices[_tokenId].hbfee > 0) hbwalletToken.TRANSFER247(msg.sender, prices[_tokenId].hbfee);
        RESETPRICE351(_tokenId);
        return prices[_tokenId].price;
    }

    function SETFEE331(uint256 _ethFee, uint _HBWALLETExchange, uint256 _hightLightFee) public ONLYOWNER242 returns (uint256, uint, uint256){	//inject NONSTANDARD NAMING
        require(_ethFee >= 0 && _HBWALLETExchange >= 1 && _hightLightFee >= 0);
        ETHFee = _ethFee;
        HBWALLETExchange = _HBWALLETExchange;
        hightLightFee = _hightLightFee;
        return (ETHFee, HBWALLETExchange, hightLightFee);
    }

    function SETLIMITFEE975(uint256 _ethlimitFee, uint _hbWalletlimitFee) public ONLYOWNER242 returns (uint256, uint){	//inject NONSTANDARD NAMING
        require(_ethlimitFee >= 0 && _hbWalletlimitFee >= 0);
        limitETHFee = _ethlimitFee;
        limitHBWALLETFee = _hbWalletlimitFee;
        return (limitETHFee, limitHBWALLETFee);
    }

    function _WITHDRAW865(uint256 amount, uint256 _amountHB) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount && hbwalletToken.BALANCEOF47(address(this)) >= _amountHB);
        if(amount > 0) {
            msg.sender.transfer(amount);
        }
        if(_amountHB > 0) {
            hbwalletToken.TRANSFER247(msg.sender, _amountHB);
        }
    }
    function WITHDRAW366(uint256 amount, uint8 _amountHB) public ONLYCEOADDRESS500 {	//inject NONSTANDARD NAMING
        _WITHDRAW865(amount, _amountHB);
    }
    function CANCELBUSSINESS743() public ONLYCEOADDRESS500 {	//inject NONSTANDARD NAMING
        uint256[] memory arr = arrayTokenIdSale;
        uint length = arrayTokenIdSale.length;
        for (uint i = 0; i < length; i++) {
            if (prices[arr[i]].tokenOwner == erc721Address.OWNEROF604(arr[i])) {
                if (prices[arr[i]].fee > 0) {
                    uint256 eth = prices[arr[i]].fee;
                    if(prices[arr[i]].isHightlight) eth = eth.ADD799(hightLightFee);
                    if(address(this).balance >= eth) {
                        prices[arr[i]].tokenOwner.transfer(eth);
                    }
                }
                else if (prices[arr[i]].hbfee > 0) {
                    uint hb = prices[arr[i]].hbfee;
                    if(prices[arr[i]].isHightlight) hb = hb.ADD799(hightLightFee.MUL862(HBWALLETExchange).DIV441(2).DIV441(10 ** 16));
                    if(hbwalletToken.BALANCEOF47(address(this)) >= hb) {
                        hbwalletToken.TRANSFER247(prices[arr[i]].tokenOwner, hb);
                    }
                }
                RESETPRICE351(arr[i]);
            }
        }
        _WITHDRAW865(address(this).balance, hbwalletToken.BALANCEOF47(address(this)));
    }

    function REVENUE404() public view returns (uint256, uint){	//inject NONSTANDARD NAMING
        uint256 ethfee = 0;
        uint256 hbfee = 0;
        for (uint i = 0; i < arrayTokenIdSale.length; i++) {
            if (prices[arrayTokenIdSale[i]].tokenOwner == erc721Address.OWNEROF604(arrayTokenIdSale[i])) {
                if (prices[arrayTokenIdSale[i]].fee > 0) {
                    ethfee = ethfee.ADD799(prices[arrayTokenIdSale[i]].fee);
                }
                else if (prices[arrayTokenIdSale[i]].hbfee > 0) {
                    hbfee = hbfee.ADD799(prices[arrayTokenIdSale[i]].hbfee);
                }
            }
        }
        uint256 eth = address(this).balance.SUB73(ethfee);
        uint256 hb = hbwalletToken.BALANCEOF47(address(this)).SUB73(hbfee);
        return (eth, hb);
    }

    function CHANGECEO503(address _address) public ONLYCEOADDRESS500 {	//inject NONSTANDARD NAMING
        require(_address != address(0));
        ceoAddress = _address;

    }

    function BUY453(uint256 tokenId) public payable {	//inject NONSTANDARD NAMING
        require(GETAPPROVED318(tokenId) == address(this));
        require(prices[tokenId].price > 0 && prices[tokenId].price == msg.value);
        erc721Address.TRANSFERFROM479(prices[tokenId].tokenOwner, msg.sender, tokenId);
        prices[tokenId].tokenOwner.transfer(msg.value);
        RESETPRICE351(tokenId);
    }

    function BUYWITHOUTCHECKAPPROVED246(uint256 tokenId) public payable {	//inject NONSTANDARD NAMING
        require(prices[tokenId].price > 0 && prices[tokenId].price == msg.value);
        erc721Address.TRANSFERFROM479(prices[tokenId].tokenOwner, msg.sender, tokenId);
        prices[tokenId].tokenOwner.transfer(msg.value);
        RESETPRICE351(tokenId);
    }

    function RESETPRICE351(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        prices[tokenId] = Price(address(0), 0, 0, 0, false);
        for (uint8 i = 0; i < arrayTokenIdSale.length; i++) {
            if (arrayTokenIdSale[i] == tokenId) {
                _BURNARRAYTOKENIDSALE960(i);
            }
        }
    }
}