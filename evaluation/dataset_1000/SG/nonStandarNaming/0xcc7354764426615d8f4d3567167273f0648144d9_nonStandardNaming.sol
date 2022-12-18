pragma solidity ^0.5.7;



library SafeMath256 {

    function ADD300(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        assert(c >= a);
        return c;
    }


    function SUB281(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function MUL493(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }


    function DIV838(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
    }


    function MOD927(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


contract Ownable {
    address private _owner;
    address payable internal _receiver;

    event OWNERSHIPTRANSFERRED53(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    event RECEIVERCHANGED183(address indexed previousReceiver, address indexed newReceiver);	//inject NONSTANDARD NAMING


    constructor () internal {
        _owner = msg.sender;
        _receiver = msg.sender;
    }


    function OWNER874() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }


    modifier ONLYOWNER134() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner);
        _;
    }


    function TRANSFEROWNERSHIP8(address newOwner) external ONLYOWNER134 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        address __previousOwner = _owner;
        _owner = newOwner;
        emit OWNERSHIPTRANSFERRED53(__previousOwner, newOwner);
    }


    function CHANGERECEIVER737(address payable newReceiver) external ONLYOWNER134 {	//inject NONSTANDARD NAMING
        require(newReceiver != address(0));
        address __previousReceiver = _receiver;
        _receiver = newReceiver;
        emit RECEIVERCHANGED183(__previousReceiver, newReceiver);
    }


    function RESCUETOKENS665(address tokenAddress, address receiver, uint256 amount) external ONLYOWNER134 {	//inject NONSTANDARD NAMING
        IERC20 _token = IERC20(tokenAddress);
        require(receiver != address(0));
        uint256 balance = _token.BALANCEOF846(address(this));
        require(balance >= amount);

        assert(_token.TRANSFER980(receiver, amount));
    }


    function WITHDRAWETHER453(address payable to, uint256 amount) external ONLYOWNER134 {	//inject NONSTANDARD NAMING
        require(to != address(0));
        uint256 balance = address(this).balance;
        require(balance >= amount);

        to.transfer(amount);
    }
}



contract Pausable is Ownable {
    bool private _paused;

    event PAUSED316(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED697(address account);	//inject NONSTANDARD NAMING

    constructor () internal {
        _paused = false;
    }


    function PAUSED447() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }


    modifier WHENNOTPAUSED686() {	//inject NONSTANDARD NAMING
        require(!_paused, "Paused.");
        _;
    }


    function SETPAUSED689(bool state) external ONLYOWNER134 {	//inject NONSTANDARD NAMING
        if (_paused && !state) {
            _paused = false;
            emit UNPAUSED697(msg.sender);
        } else if (!_paused && state) {
            _paused = true;
            emit PAUSED316(msg.sender);
        }
    }
}


interface IERC20 {
    function BALANCEOF846(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER980(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
}



interface IToken {
    function BALANCEOF846(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER980(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function INWHITELIST873(address account) external view returns (bool);	//inject NONSTANDARD NAMING
}



interface ITokenPublicSale {
    function STATUS945() external view returns (uint256 auditEtherPrice,	//inject NONSTANDARD NAMING
        uint16 stage,
        uint16 season,
        uint256 tokenUsdPrice,
        uint256 currentTopSalesRatio,
        uint256 txs,
        uint256 tokenTxs,
        uint256 tokenBonusTxs,
        uint256 tokenWhitelistTxs,
        uint256 tokenIssued,
        uint256 tokenBonus,
        uint256 tokenWhitelist);
}


contract Get102Token is Ownable, Pausable {
    using SafeMath256 for uint256;

    IToken           public TOKEN             = IToken(0xfaCe8492ce3EE56855827b5eC3f9Affd0a4c5E15);
    ITokenPublicSale public TOKEN_PUBLIC_SALE = ITokenPublicSale(0x2B4F291DAC3f50dF9f846901DD350a7Ff2357bd6);

    uint256 private WEI_MIN = 1 ether;
    uint256 private TOKEN_PER_TXN = 102000000; // 102.000000 Token

    uint256 private _txs;

    mapping (address => bool) _alreadyGot;

    event TX137(uint256 etherPrice, uint256 vokdnUsdPrice, uint256 weiUsed);	//inject NONSTANDARD NAMING


    function TXS92() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _txs;
    }


    function () external payable WHENNOTPAUSED686 {
        require(msg.value >= WEI_MIN);
        require(TOKEN.BALANCEOF846(address(this)) >= TOKEN_PER_TXN);
        require(TOKEN.BALANCEOF846(msg.sender) == 0);
        require(!TOKEN.INWHITELIST873(msg.sender));
        require(!_alreadyGot[msg.sender]);

        uint256 __etherPrice;
        uint256 __tokenUsdPrice;
        (__etherPrice, , , __tokenUsdPrice, , , , , , , ,) = TOKEN_PUBLIC_SALE.STATUS945();

        require(__etherPrice > 0);

        uint256 __usd = TOKEN_PER_TXN.MUL493(__tokenUsdPrice).DIV838(1000000);
        uint256 __wei = __usd.MUL493(1 ether).DIV838(__etherPrice);

        require(msg.value >= __wei);

        if (msg.value > __wei) {
            msg.sender.transfer(msg.value.SUB281(__wei));
            _receiver.transfer(__wei);
        }

        _txs = _txs.ADD300(1);
        _alreadyGot[msg.sender] = true;
        emit TX137(__etherPrice, __tokenUsdPrice, __wei);

        assert(TOKEN.TRANSFER980(msg.sender, TOKEN_PER_TXN));
    }
}