pragma solidity ^0.5.8;

library SafeMath {

                                                                      
    function MUL265(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                               
    function DIV213(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB575(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD458(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD467(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}
                                                                                                                                                                                             
contract Ownable {
    address public owner;


    event OWNERSHIPTRANSFERRED993(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING


                                                                                                                           
    constructor() public {
        owner = msg.sender;
    }

                                                                                 
    modifier ONLYOWNER601() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP794(address newOwner) public ONLYOWNER601 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED993(owner, newOwner);
        owner = newOwner;
    }

}

contract IERC721 {
    event TRANSFER564(address indexed from, address indexed to, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL975(address indexed owner, address indexed approved, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVALFORALL169(address indexed owner, address indexed operator, bool approved);	//inject NONSTANDARD NAMING

    function BALANCEOF207(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

    function OWNEROF863(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

    function APPROVE306(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function GETAPPROVED483(uint256 tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL540(address operator, bool _approved) public;	//inject NONSTANDARD NAMING

    function ISAPPROVEDFORALL868(address owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM806(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM452(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM452(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING
}
                                                                                                                               
contract ERC20BasicInterface {
    function TOTALSUPPLY290() public view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF207(address who) public view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER921(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM806(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER564(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    uint8 public decimals;
}

contract Bussiness is Ownable {

    using SafeMath for uint256;
    address public ceoAddress = address(0xFce92D4163AA532AA096DE8a3C4fEf9f875Bc55F);
    ERC20BasicInterface public hbwalletToken = ERC20BasicInterface(0xEc7ba74789694d0d03D458965370Dc7cF2FE75Ba);
    uint256 public Percen = 1000;
    uint256 public HBWALLETExchange = 21;
    // cong thuc hbFee = ETHFee / Percen * HBWALLETExchange / 2
    // uint256 public hightLightFee = 30000000000000000;

    struct Price {
        address payable tokenOwner;
        uint256 price;
        uint256 fee;
        uint256 hbfee;
        uint isHightlight;
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
    address[] arrGames;
    constructor() public {
        Games[address(0x5D00d312e171Be5342067c09BaE883f9Bcb2003B)].ETHFee = 0;
        Games[address(0x5D00d312e171Be5342067c09BaE883f9Bcb2003B)].limitETHFee = 0;
        Games[address(0x5D00d312e171Be5342067c09BaE883f9Bcb2003B)].limitHBWALLETFee = 0;
        Games[address(0x5D00d312e171Be5342067c09BaE883f9Bcb2003B)].hightLightFee = 30000000000000000;
        arrGames.push(address(0x5D00d312e171Be5342067c09BaE883f9Bcb2003B));

        Games[address(0xdceaf1652a131F32a821468Dc03A92df0edd86Ea)].ETHFee = 0;
        Games[address(0xdceaf1652a131F32a821468Dc03A92df0edd86Ea)].limitETHFee = 0;
        Games[address(0xdceaf1652a131F32a821468Dc03A92df0edd86Ea)].limitHBWALLETFee = 0;
        Games[address(0xdceaf1652a131F32a821468Dc03A92df0edd86Ea)].hightLightFee = 30000000000000000;
        arrGames.push(address(0xdceaf1652a131F32a821468Dc03A92df0edd86Ea));

        Games[address(0x273f7F8E6489682Df756151F5525576E322d51A3)].ETHFee = 0;
        Games[address(0x273f7F8E6489682Df756151F5525576E322d51A3)].limitETHFee = 0;
        Games[address(0x273f7F8E6489682Df756151F5525576E322d51A3)].limitHBWALLETFee = 0;
        Games[address(0x273f7F8E6489682Df756151F5525576E322d51A3)].hightLightFee = 30000000000000000;
        arrGames.push(address(0x273f7F8E6489682Df756151F5525576E322d51A3));

        Games[address(0x06012c8cf97BEaD5deAe237070F9587f8E7A266d)].ETHFee = 0;
        Games[address(0x06012c8cf97BEaD5deAe237070F9587f8E7A266d)].limitETHFee = 0;
        Games[address(0x06012c8cf97BEaD5deAe237070F9587f8E7A266d)].limitHBWALLETFee = 0;
        Games[address(0x06012c8cf97BEaD5deAe237070F9587f8E7A266d)].hightLightFee = 30000000000000000;
        arrGames.push(address(0x06012c8cf97BEaD5deAe237070F9587f8E7A266d));

        Games[address(0x1276dce965ADA590E42d62B3953dDc1DDCeB0392)].ETHFee = 0;
        Games[address(0x1276dce965ADA590E42d62B3953dDc1DDCeB0392)].limitETHFee = 0;
        Games[address(0x1276dce965ADA590E42d62B3953dDc1DDCeB0392)].limitHBWALLETFee = 0;
        Games[address(0x1276dce965ADA590E42d62B3953dDc1DDCeB0392)].hightLightFee = 30000000000000000;
        arrGames.push(address(0x1276dce965ADA590E42d62B3953dDc1DDCeB0392));

        Games[address(0xE60D2325f996e197EEdDed8964227a0c6CA82D0f)].ETHFee = 0;
        Games[address(0xE60D2325f996e197EEdDed8964227a0c6CA82D0f)].limitETHFee = 0;
        Games[address(0xE60D2325f996e197EEdDed8964227a0c6CA82D0f)].limitHBWALLETFee = 0;
        Games[address(0xE60D2325f996e197EEdDed8964227a0c6CA82D0f)].hightLightFee = 30000000000000000;
        arrGames.push(address(0xE60D2325f996e197EEdDed8964227a0c6CA82D0f));

        Games[address(0x617913Dd43dbDf4236B85Ec7BdF9aDFD7E35b340)].ETHFee = 0;
        Games[address(0x617913Dd43dbDf4236B85Ec7BdF9aDFD7E35b340)].limitETHFee = 0;
        Games[address(0x617913Dd43dbDf4236B85Ec7BdF9aDFD7E35b340)].limitHBWALLETFee = 0;
        Games[address(0x617913Dd43dbDf4236B85Ec7BdF9aDFD7E35b340)].hightLightFee = 30000000000000000;
        arrGames.push(address(0x617913Dd43dbDf4236B85Ec7BdF9aDFD7E35b340));

        Games[address(0xECd6b4A2f82b0c9FB283A4a8a1ef5ADf555f794b)].ETHFee = 0;
        Games[address(0xECd6b4A2f82b0c9FB283A4a8a1ef5ADf555f794b)].limitETHFee = 0;
        Games[address(0xECd6b4A2f82b0c9FB283A4a8a1ef5ADf555f794b)].limitHBWALLETFee = 0;
        Games[address(0xECd6b4A2f82b0c9FB283A4a8a1ef5ADf555f794b)].hightLightFee = 30000000000000000;
        arrGames.push(address(0xECd6b4A2f82b0c9FB283A4a8a1ef5ADf555f794b));

        Games[address(0xf26A23019b4699068bb54457f32dAFCF22A9D371)].ETHFee = 0;
        Games[address(0xf26A23019b4699068bb54457f32dAFCF22A9D371)].limitETHFee = 0;
        Games[address(0xf26A23019b4699068bb54457f32dAFCF22A9D371)].limitHBWALLETFee = 0;
        Games[address(0xf26A23019b4699068bb54457f32dAFCF22A9D371)].hightLightFee = 30000000000000000;
        arrGames.push(address(0xf26A23019b4699068bb54457f32dAFCF22A9D371));

        Games[address(0x8c9b261Faef3b3C2e64ab5E58e04615F8c788099)].ETHFee = 0;
        Games[address(0x8c9b261Faef3b3C2e64ab5E58e04615F8c788099)].limitETHFee = 0;
        Games[address(0x8c9b261Faef3b3C2e64ab5E58e04615F8c788099)].limitHBWALLETFee = 0;
        Games[address(0x8c9b261Faef3b3C2e64ab5E58e04615F8c788099)].hightLightFee = 30000000000000000;
        arrGames.push(address(0x8c9b261Faef3b3C2e64ab5E58e04615F8c788099));
        
        // Games[address(0xac9D8D6dB95828259069226456DDe98d8E296c5f)].ETHFee = 0;
        // Games[address(0xac9D8D6dB95828259069226456DDe98d8E296c5f)].limitETHFee = 0;
        // Games[address(0xac9D8D6dB95828259069226456DDe98d8E296c5f)].limitHBWALLETFee = 0;
        // Games[address(0xac9D8D6dB95828259069226456DDe98d8E296c5f)].hightLightFee = 30000000000000000;
        // arrGames.push(address(0xac9D8D6dB95828259069226456DDe98d8E296c5f));
    }
    
    function GETTOKENPRICE80(address _game, uint256 _tokenId) public view returns (address, uint256, uint256, uint256, uint) {	//inject NONSTANDARD NAMING
        return (Games[_game].tokenPrice[_tokenId].tokenOwner, Games[_game].tokenPrice[_tokenId].price, Games[_game].tokenPrice[_tokenId].fee, Games[_game].tokenPrice[_tokenId].hbfee, Games[_game].tokenPrice[_tokenId].isHightlight);
    }
    // new code =======================
                                                                                       
    modifier ONLYCEOADDRESS813() {	//inject NONSTANDARD NAMING
        require(msg.sender == ceoAddress);
        _;
    }
    modifier ISOWNEROF128(address _game, uint256 _tokenId) {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        require(erc721Address.OWNEROF863(_tokenId) == msg.sender);
        _;
    }
    
    function OWNEROF863(address _game, uint256 _tokenId) public view returns (address){	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        return erc721Address.OWNEROF863(_tokenId);
    }

    function BALANCEOF207() public view returns (uint256){	//inject NONSTANDARD NAMING
        return address(this).balance;
    }

    function GETAPPROVED483(address _game, uint256 _tokenId) public view returns (address){	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        return erc721Address.GETAPPROVED483(_tokenId);
    }

    function SETPRICE472(address _game, uint256 _tokenId, uint256 _ethPrice, uint256 _ethfee, uint _hbfee, uint _isHightLight) internal {	//inject NONSTANDARD NAMING
        Games[_game].tokenPrice[_tokenId] = Price(msg.sender, _ethPrice, _ethfee, _hbfee, _isHightLight);
        Games[_game].tokenIdSale.push(_tokenId);
        bool flag = false;
        for(uint i = 0; i< arrGames.length; i++) {
            if(arrGames[i] == address(0x8c9b261Faef3b3C2e64ab5E58e04615F8c788099)) flag = true;
        }
        if(!flag) arrGames.push(address(0x8c9b261Faef3b3C2e64ab5E58e04615F8c788099));
    }

    function CALPRICEFEEETH277(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns(uint256, uint256) {	//inject NONSTANDARD NAMING
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        uint256 ethNeed;
        if (_isHightLight == 1 && (Games[_game].tokenPrice[_tokenId].price == 0 || Games[_game].tokenPrice[_tokenId].isHightlight != 1)) {
            _hightLightFee = Games[_game].hightLightFee;
        }
        if (Games[_game].tokenPrice[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.SUB575(Games[_game].tokenPrice[_tokenId].price).MUL265(Games[_game].ETHFee).DIV213(Percen);
            if(Games[_game].tokenPrice[_tokenId].price == 0) {
                if (ethfee >= Games[_game].limitETHFee) {
                    ethNeed = ethfee.ADD458(_hightLightFee);
                } else {
                    ethNeed = Games[_game].limitETHFee.ADD458(_hightLightFee);
                }
            }

        }
        return (ethNeed, _hightLightFee);
    }
    function SETPRICEFEEETH603(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public payable ISOWNEROF128(_game, _tokenId) {	//inject NONSTANDARD NAMING
        require(Games[_game].tokenPrice[_tokenId].price != _ethPrice);
        uint256 ethfee;
        uint256 _hightLightFee = 0;
        if (_isHightLight == 1 && (Games[_game].tokenPrice[_tokenId].price == 0 || Games[_game].tokenPrice[_tokenId].isHightlight != 1)) {
            _hightLightFee = Games[_game].hightLightFee;
        }
        if (Games[_game].tokenPrice[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.SUB575(Games[_game].tokenPrice[_tokenId].price).MUL265(Games[_game].ETHFee).DIV213(Percen);
            if(Games[_game].tokenPrice[_tokenId].price == 0) {
                if (ethfee >= Games[_game].limitETHFee) {
                    require(msg.value == ethfee.ADD458(_hightLightFee));
                } else {
                    require(msg.value == Games[_game].limitETHFee.ADD458(_hightLightFee));
                    ethfee = Games[_game].limitETHFee;
                }
            }
            ethfee = ethfee.ADD458(Games[_game].tokenPrice[_tokenId].fee);
        } else ethfee = _ethPrice.MUL265(Games[_game].ETHFee).DIV213(Percen);

        SETPRICE472(_game, _tokenId, _ethPrice, ethfee, 0, _isHightLight);
    }
    function CALPRICEFEEHBWALLET170(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public view returns (uint256){	//inject NONSTANDARD NAMING
        uint fee;
        uint256 ethfee;
        uint _hightLightFee = 0;
        uint hbNeed;
        address local_game = _game;
        if (_isHightLight == 1 && (Games[_game].tokenPrice[_tokenId].price == 0 || Games[_game].tokenPrice[_tokenId].isHightlight != 1)) {
            // _hightLightFee = hightLightFee * HBWALLETExchange / 2 / (10 ** 16);
            _hightLightFee = Games[local_game].hightLightFee.MUL265(HBWALLETExchange).DIV213(2).DIV213(10 ** 16);
        }
        if (Games[_game].tokenPrice[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.SUB575(Games[local_game].tokenPrice[_tokenId].price).MUL265(Games[_game].ETHFee).DIV213(Percen);
            fee = ethfee.MUL265(HBWALLETExchange).DIV213(2).DIV213(10 ** 16);
            // ethfee * HBWALLETExchange / 2 * (10 ** 2) / (10 ** 18)
            if(Games[_game].tokenPrice[_tokenId].price == 0) {
                if (fee >= Games[_game].limitHBWALLETFee) {
                    hbNeed = fee.ADD458(_hightLightFee);
                } else {
                    hbNeed = Games[_game].limitHBWALLETFee.ADD458(_hightLightFee);
                }
            }
        }
        return hbNeed;
    }
    function SETPRICEFEEHBWALLET422(address _game, uint256 _tokenId, uint256 _ethPrice, uint _isHightLight) public ISOWNEROF128(_game, _tokenId) {	//inject NONSTANDARD NAMING
        require(Games[_game].tokenPrice[_tokenId].price != _ethPrice);
        uint fee;
        uint256 ethfee;
        uint _hightLightFee = 0;
        address local_game = _game;
        uint256 local_tokenId = _tokenId;
        if (_isHightLight == 1 && (Games[_game].tokenPrice[_tokenId].price == 0 || Games[_game].tokenPrice[_tokenId].isHightlight != 1)) {
            _hightLightFee = Games[local_game].hightLightFee.MUL265(HBWALLETExchange).DIV213(2).DIV213(10 ** 16);
        }
        if (Games[_game].tokenPrice[_tokenId].price < _ethPrice) {
            ethfee = _ethPrice.SUB575(Games[local_game].tokenPrice[local_tokenId].price).MUL265(Games[local_game].ETHFee).DIV213(Percen);
            fee = ethfee.MUL265(HBWALLETExchange).DIV213(2).DIV213(10 ** 16);
            // ethfee * HBWALLETExchange / 2 * (10 ** 2) / (10 ** 18)
            if(Games[_game].tokenPrice[_tokenId].price == 0) {
                if (fee >= Games[_game].limitHBWALLETFee) {
                    require(hbwalletToken.TRANSFERFROM806(msg.sender, address(this), fee.ADD458(_hightLightFee)));
                } else {
                    require(hbwalletToken.TRANSFERFROM806(msg.sender, address(this), Games[local_game].limitHBWALLETFee.ADD458(_hightLightFee)));
                    fee = Games[_game].limitHBWALLETFee;
                }
            }
            fee = fee.ADD458(Games[_game].tokenPrice[_tokenId].hbfee);
        } else {
            ethfee = _ethPrice.MUL265(Games[local_game].ETHFee).DIV213(Percen);
            fee = ethfee.MUL265(HBWALLETExchange).DIV213(2).DIV213(10 ** 16);
        }

        SETPRICE472(_game, _tokenId, _ethPrice, 0, fee, _isHightLight);
    }

    function REMOVEPRICE182(address _game, uint256 _tokenId) public ISOWNEROF128(_game, _tokenId) returns (uint256){	//inject NONSTANDARD NAMING
        if (Games[_game].tokenPrice[_tokenId].fee > 0) msg.sender.transfer(Games[_game].tokenPrice[_tokenId].fee);
        else if (Games[_game].tokenPrice[_tokenId].hbfee > 0) hbwalletToken.TRANSFER921(msg.sender, Games[_game].tokenPrice[_tokenId].hbfee);
        RESETPRICE393(_game, _tokenId);
        return Games[_game].tokenPrice[_tokenId].price;
    }

    function SETHBWALLETEXCHANGE66(uint _HBWALLETExchange) public ONLYOWNER601 returns (uint){	//inject NONSTANDARD NAMING
        require(_HBWALLETExchange >= 1);

        HBWALLETExchange = _HBWALLETExchange;

        return (HBWALLETExchange);
    }

    function SETLIMITFEE814(address _game, uint256 _ethFee, uint256 _ethlimitFee, uint _hbWalletlimitFee, uint256 _hightLightFee) public ONLYOWNER601 returns (uint256, uint256, uint256, uint256){	//inject NONSTANDARD NAMING
        require(_ethFee >= 0 && _ethlimitFee >= 0 && _hbWalletlimitFee >= 0 && _hightLightFee >= 0);
        Games[_game].ETHFee = _ethFee;
        Games[_game].limitETHFee = _ethlimitFee;
        Games[_game].limitHBWALLETFee = _hbWalletlimitFee;
        Games[_game].hightLightFee = _hightLightFee;
        return (Games[_game].ETHFee, Games[_game].limitETHFee, Games[_game].limitHBWALLETFee, Games[_game].hightLightFee);
    }

    function _WITHDRAW650(uint256 amount, uint256 _amountHB) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount && hbwalletToken.BALANCEOF207(address(this)) >= _amountHB);
        if(amount > 0) {
            msg.sender.transfer(amount);
        }
        if(_amountHB > 0) {
            hbwalletToken.TRANSFER921(msg.sender, _amountHB);
        }
    }
    function WITHDRAW223(uint256 amount, uint8 _amountHB) public ONLYCEOADDRESS813 {	//inject NONSTANDARD NAMING
        _WITHDRAW650(amount, _amountHB);
    }
    function CANCELBUSSINESSBYGAMEID242(address _game, uint256 _tokenId) private {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        if (Games[_game].tokenPrice[_tokenId].tokenOwner == erc721Address.OWNEROF863(_tokenId)) {
            if (Games[_game].tokenPrice[_tokenId].fee >= 0) {
                uint256 eth = Games[_game].tokenPrice[_tokenId].fee;
                if(Games[_game].tokenPrice[_tokenId].isHightlight == 1) eth = eth.ADD458(Games[_game].hightLightFee);
                if(address(this).balance >= eth) {
                    Games[_game].tokenPrice[_tokenId].tokenOwner.transfer(eth);
                }
            }
            else if (Games[_game].tokenPrice[_tokenId].hbfee >= 0) {
                uint256 hb = Games[_game].tokenPrice[_tokenId].hbfee;
                if(Games[_game].tokenPrice[_tokenId].isHightlight == 1) hb = hb.ADD458(Games[_game].hightLightFee.MUL265(HBWALLETExchange).DIV213(2).DIV213(10 ** 16));
                if(hbwalletToken.BALANCEOF207(address(this)) >= hb) {
                    hbwalletToken.TRANSFER921(Games[_game].tokenPrice[_tokenId].tokenOwner, hb);
                }
            }
        }
    }
    function CANCELBUSSINESSBYGAME574(address _game) private ONLYCEOADDRESS813 {	//inject NONSTANDARD NAMING
        for (uint i = 0; i < Games[_game].tokenIdSale.length; i++) {
            CANCELBUSSINESSBYGAMEID242(_game, Games[_game].tokenIdSale[i]);
        }
        RESETPRICEBYARR480(_game, Games[_game].tokenIdSale);
            
    }
    function CANCELBUSSINESS502() public ONLYCEOADDRESS813 {	//inject NONSTANDARD NAMING
        for(uint j = 0; j< arrGames.length; j++) {
            address _game = arrGames[j];
            CANCELBUSSINESSBYGAME574(_game);
        }
        _WITHDRAW650(address(this).balance, hbwalletToken.BALANCEOF207(address(this)));
    }
    // function testrevenue(address _game) public view returns (uint256, bool, bool, uint256){
    //     uint256 ethfee;
    //     uint256 hbfee;
    //     address local_game = _game;
        
    //     IERC721 erc721Address = IERC721(_game);
    //     for (uint i = 0; i < Games[_game].tokenIdSale.length; i++) {
    //         uint256 _tokenId = Games[_game].tokenIdSale[i];
    //         if (Games[local_game].tokenPrice[_tokenId].tokenOwner == erc721Address.ownerOf(_tokenId)) {
    //             if (Games[local_game].tokenPrice[_tokenId].fee >= 0) {
    //                 ethfee = ethfee.add(Games[local_game].tokenPrice[_tokenId].fee);
    //                 if(Games[local_game].tokenPrice[_tokenId].isHightlight == 1) ethfee = ethfee.add(Games[local_game].hightLightFee);
    //             }
    //             else if (Games[local_game].tokenPrice[_tokenId].hbfee >= 0) {
    //                 hbfee = hbfee.add(Games[local_game].tokenPrice[_tokenId].hbfee);
    //                 if(Games[local_game].tokenPrice[_tokenId].isHightlight == 1) hbfee = hbfee.add(Games[local_game].hightLightFee.mul(HBWALLETExchange).div(2).div(10 ** 16));
    //             }
    //         }
    //         if(i== Games[local_game].tokenIdSale.length-1) {
    //             uint256 eth = address(this).balance;
    //             uint256 hb = hbwalletToken.balanceOf(address(this));
    //             return (ethfee, Games[local_game].tokenPrice[_tokenId].tokenOwner == erc721Address.ownerOf(_tokenId), 
    //             Games[local_game].tokenPrice[_tokenId].fee >= 0, ethfee.add(Games[local_game].hightLightFee));
    //         }
    //     }
        
    // }
    function REVENUE343() public view returns (uint256, uint){	//inject NONSTANDARD NAMING

        uint256 ethfee;
        uint256 hbfee;
        for(uint j = 0; j< arrGames.length; j++) {

            address _game = arrGames[j];
            IERC721 erc721Address = IERC721(arrGames[j]);
            for (uint i = 0; i < Games[_game].tokenIdSale.length; i++) {
                uint256 _tokenId = Games[_game].tokenIdSale[i];
                if (Games[_game].tokenPrice[_tokenId].tokenOwner == erc721Address.OWNEROF863(_tokenId)) {
                    if (Games[_game].tokenPrice[_tokenId].fee >= 0) {
                        ethfee = ethfee.ADD458(Games[_game].tokenPrice[_tokenId].fee);
                        if(Games[_game].tokenPrice[_tokenId].isHightlight == 1) ethfee = ethfee.ADD458(Games[_game].hightLightFee);
                    }
                    else if (Games[_game].tokenPrice[_tokenId].hbfee >= 0) {
                        hbfee = hbfee.ADD458(Games[_game].tokenPrice[_tokenId].hbfee);
                        if(Games[_game].tokenPrice[_tokenId].isHightlight == 1) hbfee = hbfee.ADD458(Games[_game].hightLightFee.MUL265(HBWALLETExchange).DIV213(2).DIV213(10 ** 16));
                    }
                }
            }
        }

        uint256 eth = address(this).balance.SUB575(ethfee);
        uint256 hb = hbwalletToken.BALANCEOF207(address(this)).SUB575(hbfee);
        return (eth, hb);
    }

    function CHANGECEO130(address _address) public ONLYCEOADDRESS813 {	//inject NONSTANDARD NAMING
        require(_address != address(0));
        ceoAddress = _address;

    }

    function BUY629(address _game, uint256 tokenId) public payable {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        require(GETAPPROVED483(_game, tokenId) == address(this));
        require(Games[_game].tokenPrice[tokenId].price > 0 && Games[_game].tokenPrice[tokenId].price == msg.value);
        erc721Address.TRANSFERFROM806(Games[_game].tokenPrice[tokenId].tokenOwner, msg.sender, tokenId);
        Games[_game].tokenPrice[tokenId].tokenOwner.transfer(msg.value);
        RESETPRICE393(_game, tokenId);
    }

    function BUYWITHOUTCHECKAPPROVED562(address _game, uint256 tokenId) public payable {	//inject NONSTANDARD NAMING
        IERC721 erc721Address = IERC721(_game);
        require(Games[_game].tokenPrice[tokenId].price > 0 && Games[_game].tokenPrice[tokenId].price == msg.value);
        erc721Address.TRANSFERFROM806(Games[_game].tokenPrice[tokenId].tokenOwner, msg.sender, tokenId);
        Games[_game].tokenPrice[tokenId].tokenOwner.transfer(msg.value);
        RESETPRICE393(_game, tokenId);
    }
    // Move the last element to the deleted spot.
    // Delete the last element, then correct the length.
    function _BURNARRAYTOKENIDSALE324(address _game, uint8 index)  internal {	//inject NONSTANDARD NAMING
        if (index >= Games[_game].tokenIdSale.length) return;

        for (uint i = index; i<Games[_game].tokenIdSale.length-1; i++){
            Games[_game].tokenIdSale[i] = Games[_game].tokenIdSale[i+1];
        }
        delete Games[_game].tokenIdSale[Games[_game].tokenIdSale.length-1];
        Games[_game].tokenIdSale.length--;
    }
    function RESETPRICEBYARR480(address _game, uint256[] memory _arrTokenId) private {	//inject NONSTANDARD NAMING
        for (uint8 i = 0; i < _arrTokenId.length; i++) {
            Games[_game].tokenPrice[_arrTokenId[i]] = Price(address(0), 0, 0, 0, 0);
            if (Games[_game].tokenIdSale[i] == _arrTokenId[i]) {
                _BURNARRAYTOKENIDSALE324(_game, i);
            }
        }
    }
    function RESETPRICE393(address _game, uint256 _tokenId) private {	//inject NONSTANDARD NAMING
        Games[_game].tokenPrice[_tokenId] = Price(address(0), 0, 0, 0, 0);
        for (uint8 i = 0; i < Games[_game].tokenIdSale.length; i++) {
            if (Games[_game].tokenIdSale[i] == _tokenId) {
                _BURNARRAYTOKENIDSALE324(_game, i);
            }
        }
    }
}