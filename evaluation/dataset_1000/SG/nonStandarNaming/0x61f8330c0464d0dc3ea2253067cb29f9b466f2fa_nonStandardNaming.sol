pragma solidity ^0.5.9;

library SafeMath {

                                                                      
    function MUL496(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                               
    function DIV130(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB264(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD838(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD53(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}
                                                                                                                                                                                             
contract Ownable {
    address public owner;


    event OWNERSHIPTRANSFERRED292(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING


                                                                                                                           
    constructor() public {
        owner = msg.sender;
    }

                                                                                 
    modifier ONLYOWNER143() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP530(address newOwner) public ONLYOWNER143 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED292(owner, newOwner);
        owner = newOwner;
    }

}

contract IERC721 {
    event TRANSFER44(address indexed from, address indexed to, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL469(address indexed owner, address indexed approved, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVALFORALL778(address indexed owner, address indexed operator, bool approved);	//inject NONSTANDARD NAMING

    function BALANCEOF302(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

    function OWNEROF751(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

    function APPROVE899(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function GETAPPROVED881(uint256 tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL2(address operator, bool _approved) public;	//inject NONSTANDARD NAMING

    function ISAPPROVEDFORALL895(address owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFER443(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function TRANSFERFROM703(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM435(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM435(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING
}
                                                                                                                               
contract ERC20BasicInterface {
    function TOTALSUPPLY727() public view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF302(address who) public view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER443(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM703(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER44(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    uint8 public decimals;
}

contract Bussiness is Ownable {

    using SafeMath for uint256;
    address public ceoAddress = address(0xFce92D4163AA532AA096DE8a3C4fEf9f875Bc55F);
    ERC20BasicInterface public hbwalletToken = ERC20BasicInterface(0xEc7ba74789694d0d03D458965370Dc7cF2FE75Ba);
    // address public ceoAddress = address(0xFce92D4163AA532AA096DE8a3C4fEf9f875Bc55F);
    // ERC20BasicInterface public hbwalletToken = ERC20BasicInterface(0x91013928b1C4dbd0D5cB21BA5b052BfD840A7a7F);
    uint256 public Percen = 1000;
    uint256 public HBWALLETExchange = 21;

    struct Price {
        address payable tokenOwner;
        uint256 price;
        uint256 fee;
        uint256 hbfee;
        uint isHightlight;
        uint isHightlightByHb;
    }
    // new code =======================
    struct Game {
        mapping(uint256 => Price) tokenPrice;
        uint[] tokenIdSale;
        uint256 ETHFee;
        uint256 limitETHFee;
        uint256 limitHBWALLETFee;
        uint256 hightLightFee;
    }

    mapping(address => Game) public Games;
    address[] public arrGames;
    constructor() public {
        arrGames = [
        0x5D00d312e171Be5342067c09BaE883f9Bcb2003B,
        0xdceaf1652a131F32a821468Dc03A92df0edd86Ea,
        0x273f7F8E6489682Df756151F5525576E322d51A3,
        0x06012c8cf97BEaD5deAe237070F9587f8E7A266d,
        0x1276dce965ADA590E42d62B3953dDc1DDCeB0392,
        0xE60D2325f996e197EEdDed8964227a0c6CA82D0f,
        0x617913Dd43dbDf4236B85Ec7BdF9aDFD7E35b340,
        0xECd6b4A2f82b0c9FB283A4a8a1ef5ADf555f794b,
        0xf26A23019b4699068bb54457f32dAFCF22A9D371,
        0x8c9b261Faef3b3C2e64ab5E58e04615F8c788099,
        0x6EbeAf8e8E946F0716E6533A6f2cefc83f60e8Ab,
        0x5D00d312e171Be5342067c09BaE883f9Bcb2003B,
        0xBfdE6246Df72d3ca86419628CaC46a9d2B60393C,
        0x71C118B00759B0851785642541Ceb0F4CEea0BD5,
        0xF5b0A3eFB8e8E4c201e2A935F110eAaF3FFEcb8d,
        0xbc5370374FE08d699cf7fcd2e625A93BF393cCC4,
        0x31AF195dB332bc9203d758C74dF5A5C5e597cDb7,
        0x1a94fce7ef36Bc90959E206bA569a12AFBC91ca1
        ];
        for(uint i = 0; i< arrGames.length; i++) {
            if(arrGames[i] == address(0xF5b0A3eFB8e8E4c201e2A935F110eAaF3FFEcb8d)
            || arrGames[i] == address(0xbc5370374FE08d699cf7fcd2e625A93BF393cCC4)) {
                Games[arrGames[i]].ETHFee = 10;
                Games[arrGames[i]].limitETHFee = 1000000000000000;
                Games[arrGames[i]].limitHBWALLETFee = 1;
                Games[arrGames[i]].hightLightFee = 100000000000000;
            } else {
                Games[arrGames[i]].ETHFee = 0;
                Games[arrGames[i]].limitETHFee = 0;
                Games[arrGames[i]].limitHBWALLETFee = 0;
                Games[arrGames[i]].hightLightFee = 30000000000000000;
            }

        }

        // Games[address(0xac9D8D6dB95828259069226456DDe98d8E296c5f)].ETHFee = 10;
        // Games[address(0xac9D8D6dB95828259069226456DDe98d8E296c5f)].limitETHFee = 1000000000000000;
        // Games[address(0xac9D8D6dB95828259069226456DDe98d8E296c5f)].limitHBWALLETFee = 1;
        // Games[address(0xac9D8D6dB95828259069226456DDe98d8E296c5f)].hightLightFee = 10000000000000000;
        // arrGames.push(address(0xac9D8D6dB95828259069226456DDe98d8E296c5f));
    }

    function GETTOKENPRICE132(address _game, uint256 _tokenId) public returns (address owner, uint256 price, uint256 fee, uint256 hbfee, uint isHightlight, uint isHBHightlight) {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        if(erc721Address.OWNEROF751(_tokenId) != Games[_game].tokenPrice[_tokenId].tokenOwner
        && erc721Address.OWNEROF751(_tokenId) != address(this)) RESETPRICE587(_game, _tokenId);
        return (Games[_game].tokenPrice[_tokenId].tokenOwner,
        Games[_game].tokenPrice[_tokenId].price, Games[_game].tokenPrice[_tokenId].fee,
        Games[_game].tokenPrice[_tokenId].hbfee, Games[_game].tokenPrice[_tokenId].isHightlight,
        Games[_game].tokenPrice[_tokenId].isHightlightByHb);
    }
    // new code =======================
                                                                                       
    modifier ONLYCEOADDRESS75() {	//inject NONSTANDARD NAMING
        require(msg.sender == ceoAddress);
        _;
    }
    modifier ISOWNEROF180(address _game, uint256 _tokenId) {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        require(erc721Address.OWNEROF751(_tokenId) == msg.sender);
        _;
    }
    event _SETPRICE819(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight, uint8 _type);	//inject NONSTANDARD NAMING
    event _RESETPRICE302(address _game, uint256 _tokenId);	//inject NONSTANDARD NAMING
    function OWNEROF751(address _game, uint256 _tokenId) public view returns (address){	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        return erc721Address.OWNEROF751(_tokenId);
    }

    function BALANCEOF302() public view returns (uint256){	//inject NONSTANDARD NAMING
        return address(this).balance;
    }

    function GETAPPROVED881(address _game, uint256 _tokenId) public view returns (address){	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        return erc721Address.GETAPPROVED881(_tokenId);
    }

    function SETPRICE978(address _game, uint256 _tokenId, uint256 _ethPrice, uint256 _ethfee, uint _hbfee, uint _isHightLight, uint _isHightLightByHb) internal {	//inject NONSTANDARD NAMING
        Games[_game].tokenPrice[_tokenId] = Price(msg.sender, _ethPrice, _ethfee, _hbfee, _isHightLight, _isHightLightByHb);
        Games[_game].tokenIdSale.push(_tokenId);
        bool flag = false;
        for(uint i = 0; i< arrGames.length; i++) {
            if(arrGames[i] == _game) flag = true;
        }
        if(!flag) arrGames.push(_game);
    }
    function CALFEEHB389(address _game, uint256 _ethPrice) public view returns (uint256){	//inject NONSTANDARD NAMING
        uint256 ethfee = _ethPrice.MUL496(Games[_game].ETHFee).DIV130(Percen);
        uint256 fee = ethfee.MUL496(HBWALLETExchange).DIV130(2).DIV130(10 ** 16);
        return fee;
    }
    function CALFEE57(address _game, uint256 _ethPrice) public view returns (uint256){	//inject NONSTANDARD NAMING
        return _ethPrice.MUL496(Games[_game].ETHFee).DIV130(Percen);
    }
    function CALPRICEFEEETH238(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view	//inject NONSTANDARD NAMING
    returns(uint256 _ethNeed, uint256 hightLightFee, uint256 _totalFee) {
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        uint256 ethNeed;
        uint256 totalFee;
        if (_isHightLight == 1 && (Games[_game].tokenPrice[_tokenId].price == 0 || Games[_game].tokenPrice[_tokenId].isHightlight != 1)) {
            _hightLightFee = Games[_game].hightLightFee;
        }
        if (Games[_game].tokenPrice[_tokenId].price < _ethPrice) {
            ethfee = CALFEE57(_game, _ethPrice.SUB264(Games[_game].tokenPrice[_tokenId].price));
            totalFee = CALFEE57(_game, _ethPrice);
            if(Games[_game].tokenPrice[_tokenId].price == 0 && ethfee < Games[_game].limitETHFee) {
                ethNeed = Games[_game].limitETHFee.ADD838(_hightLightFee);
            } else if(Games[_game].tokenPrice[_tokenId].price > 0 && totalFee < Games[_game].limitETHFee) {
                ethNeed = _hightLightFee;
            } else ethNeed = totalFee.ADD838(_hightLightFee).SUB264(Games[_game].tokenPrice[_tokenId].fee);

        } else {
            ethNeed = _hightLightFee;
        }
        return (ethNeed, _hightLightFee, totalFee);
    }
    function SETPRICEFEEETH722(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public payable ISOWNEROF180(_game, _tokenId) {	//inject NONSTANDARD NAMING
        require(Games[_game].tokenPrice[_tokenId].price != _ethPrice);
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        if (_isHightLight == 1 && (Games[_game].tokenPrice[_tokenId].price == 0 || Games[_game].tokenPrice[_tokenId].isHightlight != 1)) {
            _hightLightFee = Games[_game].hightLightFee;
        }
        if (Games[_game].tokenPrice[_tokenId].price < _ethPrice) {
            ethfee = CALFEE57(_game, _ethPrice.SUB264(Games[_game].tokenPrice[_tokenId].price));
            uint256 totalFee = CALFEE57(_game, _ethPrice);
            if(Games[_game].tokenPrice[_tokenId].price == 0 && ethfee < Games[_game].limitETHFee) {
                require(msg.value <= Games[_game].limitETHFee.ADD838(_hightLightFee));
                ethfee = Games[_game].limitETHFee;
            } else if(Games[_game].tokenPrice[_tokenId].price > 0 && totalFee < Games[_game].limitETHFee) {
                ethfee = _hightLightFee;
                require(msg.value <= ethfee);
            } else {
                ethfee = totalFee.SUB264(Games[_game].tokenPrice[_tokenId].fee);
                require(msg.value <= ethfee.ADD838(_hightLightFee));
            }
            ethfee = ethfee.ADD838(Games[_game].tokenPrice[_tokenId].fee);
        } else ethfee = Games[_game].tokenPrice[_tokenId].fee.ADD838(_hightLightFee);

        SETPRICE978(_game, _tokenId, _ethPrice, ethfee, 0, _isHightLight, 0);
        emit _SETPRICE819(_game, _tokenId, _ethPrice, _isHightLight, 1);
    }

    function CALPRICEFEEHBWALLET829(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns (uint256){	//inject NONSTANDARD NAMING
        uint256 fee;
        uint256 _hightLightFee = 0;
        uint256 hbNeed;
        address local_game = _game;
        uint256 local_tokenId = _tokenId;
        if (_isHightLight == 1 && (Games[_game].tokenPrice[_tokenId].price == 0 || Games[_game].tokenPrice[_tokenId].isHightlightByHb != 1)) {
            _hightLightFee = Games[local_game].hightLightFee.MUL496(HBWALLETExchange).DIV130(2).DIV130(10 ** 16);
        }
        if (Games[_game].tokenPrice[_tokenId].price < _ethPrice) {
            fee = CALFEEHB389(_game, _ethPrice.SUB264(Games[local_game].tokenPrice[local_tokenId].price));
            uint256 totalFeeHB = CALFEEHB389(_game, _ethPrice);
            if(fee < Games[local_game].limitHBWALLETFee && Games[local_game].tokenPrice[_tokenId].price == 0) {
                hbNeed = Games[local_game].limitHBWALLETFee.ADD838(_hightLightFee);
            } else if(Games[local_game].tokenPrice[_tokenId].price > 0 && totalFeeHB < Games[_game].limitHBWALLETFee) {
                hbNeed = _hightLightFee;
            } else hbNeed = totalFeeHB.ADD838(_hightLightFee).SUB264(Games[_game].tokenPrice[_tokenId].hbfee);
        } else {
            hbNeed = _hightLightFee;
        }
        return hbNeed;
    }

    function SETPRICEFEEHBWALLET343(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public ISOWNEROF180(_game, _tokenId) {	//inject NONSTANDARD NAMING
        require(Games[_game].tokenPrice[_tokenId].price != _ethPrice);
        uint fee;
        uint _hightLightFee = 0;
        address local_game = _game;
        uint256 local_tokenId = _tokenId;
        if (_isHightLight == 1 && (Games[_game].tokenPrice[_tokenId].price == 0 || Games[_game].tokenPrice[_tokenId].isHightlightByHb != 1)) {
            _hightLightFee = Games[local_game].hightLightFee.MUL496(HBWALLETExchange).DIV130(2).DIV130(10 ** 16);
        }
        if (Games[_game].tokenPrice[_tokenId].price < _ethPrice) {
            fee = CALFEEHB389(_game, _ethPrice.SUB264(Games[local_game].tokenPrice[local_tokenId].price));
            uint256 totalFeeHB = CALFEEHB389(_game, _ethPrice);
            if(fee < Games[local_game].limitHBWALLETFee && Games[local_game].tokenPrice[_tokenId].price == 0) {
                require(hbwalletToken.TRANSFERFROM703(msg.sender, address(this), Games[local_game].limitHBWALLETFee.ADD838(_hightLightFee)));
                fee = Games[_game].limitHBWALLETFee;
            } else if(Games[local_game].tokenPrice[_tokenId].price > 0 && totalFeeHB < Games[_game].limitHBWALLETFee) {
                fee = _hightLightFee;
                require(hbwalletToken.TRANSFERFROM703(msg.sender, address(this), fee));
            } else {
                fee = totalFeeHB.SUB264(Games[_game].tokenPrice[_tokenId].hbfee);
                require(hbwalletToken.TRANSFERFROM703(msg.sender, address(this), fee.ADD838(_hightLightFee)));
            }
            fee = fee.ADD838(Games[local_game].tokenPrice[_tokenId].hbfee);
        } else {
            fee = Games[_game].tokenPrice[_tokenId].hbfee.ADD838(_hightLightFee);
        }

        SETPRICE978(_game, _tokenId, _ethPrice, 0, fee, 0, _isHightLight);
        emit _SETPRICE819(_game, _tokenId, _ethPrice, _isHightLight, 2);
    }

    function REMOVEPRICE322(address _game, uint256 _tokenId) public ISOWNEROF180(_game, _tokenId){	//inject NONSTANDARD NAMING
        if (Games[_game].tokenPrice[_tokenId].fee > 0) msg.sender.transfer(Games[_game].tokenPrice[_tokenId].fee);
        else if (Games[_game].tokenPrice[_tokenId].hbfee > 0) hbwalletToken.TRANSFER443(msg.sender, Games[_game].tokenPrice[_tokenId].hbfee);
        if(Games[_game].tokenPrice[_tokenId].tokenOwner == address(this)) {
            IERC721 erc721Address = IERC721(_game);
            erc721Address.TRANSFER443(Games[_game].tokenPrice[_tokenId].tokenOwner, _tokenId);
        }
        RESETPRICE587(_game, _tokenId);
    }

    function SETHBWALLETEXCHANGE278(uint _HBWALLETExchange) public ONLYOWNER143{	//inject NONSTANDARD NAMING
        require(_HBWALLETExchange >= 1);

        HBWALLETExchange = _HBWALLETExchange;
    }

    function SETLIMITFEE870(address _game, uint256 _ethFee, uint256 _ethlimitFee, uint _hbWalletlimitFee, uint256 _hightLightFee) public ONLYOWNER143 {	//inject NONSTANDARD NAMING
        require(_ethFee >= 0 && _ethlimitFee >= 0 && _hbWalletlimitFee >= 0 && _hightLightFee >= 0);
        Games[_game].ETHFee = _ethFee;
        Games[_game].limitETHFee = _ethlimitFee;
        Games[_game].limitHBWALLETFee = _hbWalletlimitFee;
        Games[_game].hightLightFee = _hightLightFee;
    }

    function _WITHDRAW366(uint256 amount, uint256 _amountHB) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount && hbwalletToken.BALANCEOF302(address(this)) >= _amountHB);
        if(amount > 0) {
            msg.sender.transfer(amount);
        }
        if(_amountHB > 0) {
            hbwalletToken.TRANSFER443(msg.sender, _amountHB);
        }
    }
    function WITHDRAW361(uint256 amount, uint8 _amountHB) public ONLYCEOADDRESS75 {	//inject NONSTANDARD NAMING
        _WITHDRAW366(amount, _amountHB);
    }
    function CANCELBUSSINESSBYGAMEID322(address _game, uint256 _tokenId) private {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        if (Games[_game].tokenPrice[_tokenId].tokenOwner == erc721Address.OWNEROF751(_tokenId)
        || Games[_game].tokenPrice[_tokenId].tokenOwner == address(this)) {

            uint256 eth = Games[_game].tokenPrice[_tokenId].fee;
            if(Games[_game].tokenPrice[_tokenId].isHightlight == 1) eth = eth.ADD838(Games[_game].hightLightFee);
            if(eth > 0 && address(this).balance >= eth) {
                Games[_game].tokenPrice[_tokenId].tokenOwner.transfer(eth);
            }

            uint256 hb = Games[_game].tokenPrice[_tokenId].hbfee;
            if(Games[_game].tokenPrice[_tokenId].isHightlightByHb == 1) hb = hb.ADD838(Games[_game].hightLightFee.MUL496(HBWALLETExchange).DIV130(2).DIV130(10 ** 16));
            if(hb > 0 && hbwalletToken.BALANCEOF302(address(this)) >= hb) {
                hbwalletToken.TRANSFER443(Games[_game].tokenPrice[_tokenId].tokenOwner, hb);
            }
            if(Games[_game].tokenPrice[_tokenId].tokenOwner == address(this)) erc721Address.TRANSFER443(Games[_game].tokenPrice[_tokenId].tokenOwner, _tokenId);
            RESETPRICE587(_game, _tokenId);
        }
    }

    function CANCELBUSSINESSBYGAME569(address _game) private ONLYCEOADDRESS75 {	//inject NONSTANDARD NAMING
        uint256[] memory _arrTokenId = Games[_game].tokenIdSale;
        for (uint i = 0; i < _arrTokenId.length; i++) {
            CANCELBUSSINESSBYGAMEID322(_game, _arrTokenId[i]);
        }

    }
    function CANCELBUSSINESS79() public ONLYCEOADDRESS75 {	//inject NONSTANDARD NAMING
        for(uint j = 0; j< arrGames.length; j++) {
            address _game = arrGames[j];
            CANCELBUSSINESSBYGAME569(_game);
        }
        _WITHDRAW366(address(this).balance, hbwalletToken.BALANCEOF302(address(this)));
    }

    function REVENUE240() public view returns (uint256, uint){	//inject NONSTANDARD NAMING

        uint256 ethfee;
        uint256 hbfee;
        for(uint j = 0; j< arrGames.length; j++) {

            address _game = arrGames[j];
            IERC721 erc721Address = IERC721(arrGames[j]);
            for (uint i = 0; i < Games[_game].tokenIdSale.length; i++) {
                uint256 _tokenId = Games[_game].tokenIdSale[i];
                if (Games[_game].tokenPrice[_tokenId].tokenOwner == erc721Address.OWNEROF751(_tokenId)) {

                    ethfee = ethfee.ADD838(Games[_game].tokenPrice[_tokenId].fee);
                    if(Games[_game].tokenPrice[_tokenId].isHightlight == 1) ethfee = ethfee.ADD838(Games[_game].hightLightFee);

                    hbfee = hbfee.ADD838(Games[_game].tokenPrice[_tokenId].hbfee);
                    if(Games[_game].tokenPrice[_tokenId].isHightlightByHb == 1) hbfee = hbfee.ADD838(Games[_game].hightLightFee.MUL496(HBWALLETExchange).DIV130(2).DIV130(10 ** 16));

                }
            }
        }

        uint256 eth = address(this).balance.SUB264(ethfee);
        uint256 hb = hbwalletToken.BALANCEOF302(address(this)).SUB264(hbfee);
        return (eth, hb);
    }

    function CHANGECEO990(address _address) public ONLYCEOADDRESS75 {	//inject NONSTANDARD NAMING
        require(_address != address(0));
        ceoAddress = _address;

    }

    function BUY617(address _game, uint256 tokenId) public payable {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        require(GETAPPROVED881(_game, tokenId) == address(this));
        require(Games[_game].tokenPrice[tokenId].price > 0 && Games[_game].tokenPrice[tokenId].price == msg.value);
        erc721Address.TRANSFERFROM703(Games[_game].tokenPrice[tokenId].tokenOwner, msg.sender, tokenId);
        Games[_game].tokenPrice[tokenId].tokenOwner.transfer(msg.value);
        RESETPRICE587(_game, tokenId);
    }

    function BUYWITHOUTCHECKAPPROVED850(address _game, uint256 tokenId) public payable {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        require(Games[_game].tokenPrice[tokenId].price > 0 && Games[_game].tokenPrice[tokenId].price == msg.value);
        erc721Address.TRANSFERFROM703(Games[_game].tokenPrice[tokenId].tokenOwner, msg.sender, tokenId);
        Games[_game].tokenPrice[tokenId].tokenOwner.transfer(msg.value);
        RESETPRICE587(_game, tokenId);
    }

    // function buyFromSmartcontract(address _game, uint256 _tokenId) public payable {
    //     IERC721 erc721Address = IERC721(_game);
    //     require(Games[_game].tokenPrice[_tokenId].price == msg.value);
    //     require(erc721Address.ownerOf(_tokenId) == address(this));
    //     erc721Address.transfer(msg.sender, _tokenId);
    //     Games[_game].tokenPrice[_tokenId].tokenOwner.transfer(msg.value);
    //     resetPrice(_game, _tokenId);
    // }
    function BUYFROMSMARTCONTRACTVIATRANSFER127(address _game, uint256 _tokenId) public payable {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        require(Games[_game].tokenPrice[_tokenId].price == msg.value);
        require(erc721Address.OWNEROF751(_tokenId) == address(this));
        erc721Address.TRANSFER443(msg.sender, _tokenId);
        Games[_game].tokenPrice[_tokenId].tokenOwner.transfer(msg.value);
        RESETPRICE587(_game, _tokenId);
    }
    // Move the last element to the deleted spot.
    // Delete the last element, then correct the length.
    function _BURNARRAYTOKENIDSALE285(address _game, uint256 index)  internal {	//inject NONSTANDARD NAMING
        if (index >= Games[_game].tokenIdSale.length) return;

        for (uint i = index; i<Games[_game].tokenIdSale.length-1; i++){
            Games[_game].tokenIdSale[i] = Games[_game].tokenIdSale[i+1];
        }
        delete Games[_game].tokenIdSale[Games[_game].tokenIdSale.length-1];
        Games[_game].tokenIdSale.length--;
    }

    function RESETPRICE587(address _game, uint256 _tokenId) private {	//inject NONSTANDARD NAMING
        Games[_game].tokenPrice[_tokenId] = Price(address(0), 0, 0, 0, 0, 0);
        for (uint8 i = 0; i < Games[_game].tokenIdSale.length; i++) {
            if (Games[_game].tokenIdSale[i] == _tokenId) {
                _BURNARRAYTOKENIDSALE285(_game, i);
            }
        }
        emit _RESETPRICE302(_game, _tokenId);
    }
}