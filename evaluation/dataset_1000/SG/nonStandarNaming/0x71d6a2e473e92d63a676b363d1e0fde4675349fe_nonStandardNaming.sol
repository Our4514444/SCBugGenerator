pragma solidity ^0.5.7;


// Send more than 1 ETH for 1002 Vokens, and get unused ETH refund automatically.
//   Use the current voken price of Voken Public-Sale.
//
// Conditions:
//   1. You have no Voken yet.
//   2. You are not in the whitelist yet.
//   3. Send more than 1 ETH (for balance verification).
//
// More info:
//   https://vision.network
//   https://voken.io
//
// Contact us:
//   support@vision.network
//   support@voken.io


                                                                                                                
library SafeMath256 {
                                                                            
    function ADD547(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        assert(c >= a);
        return c;
    }

                                                                                                                              
    function SUB447(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

                                                                                  
    function MUL242(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

                                                                                                                                  
    function DIV835(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
    }

                                                                                                                                                    
    function MOD914(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                         
contract Ownable {
    address private _owner;
    address payable internal _receiver;

    event OWNERSHIPTRANSFERRED759(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    event RECEIVERCHANGED23(address indexed previousReceiver, address indexed newReceiver);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        _receiver = msg.sender;
    }

                                                        
    function OWNER882() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER900() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP919(address newOwner) external ONLYOWNER900 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        address __previousOwner = _owner;
        _owner = newOwner;
        emit OWNERSHIPTRANSFERRED759(__previousOwner, newOwner);
    }

                                            
    function CHANGERECEIVER101(address payable newReceiver) external ONLYOWNER900 {	//inject NONSTANDARD NAMING
        require(newReceiver != address(0));
        address __previousReceiver = _receiver;
        _receiver = newReceiver;
        emit RECEIVERCHANGED23(__previousReceiver, newReceiver);
    }

                                                                                                                                                                                                                      
    function RESCUETOKENS903(address tokenAddr, address receiver, uint256 amount) external ONLYOWNER900 {	//inject NONSTANDARD NAMING
        IERC20 _token = IERC20(tokenAddr);
        require(receiver != address(0));
        uint256 balance = _token.BALANCEOF743(address(this));
        require(balance >= amount);

        assert(_token.TRANSFER882(receiver, amount));
    }

                                          
    function WITHDRAWETHER708(address payable to, uint256 amount) external ONLYOWNER900 {	//inject NONSTANDARD NAMING
        require(to != address(0));
        uint256 balance = address(this).balance;
        require(balance >= amount);

        to.transfer(amount);
    }
}


                                                                                                                
contract Pausable is Ownable {
    bool private _paused;

    event PAUSED209(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED281(address account);	//inject NONSTANDARD NAMING

    constructor () internal {
        _paused = false;
    }

                                                                                       
    function PAUSED730() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED339() {	//inject NONSTANDARD NAMING
        require(!_paused, "Paused.");
        _;
    }

                                                                                
    function SETPAUSED902(bool state) external ONLYOWNER900 {	//inject NONSTANDARD NAMING
        if (_paused && !state) {
            _paused = false;
            emit UNPAUSED281(msg.sender);
        } else if (!_paused && state) {
            _paused = true;
            emit PAUSED209(msg.sender);
        }
    }
}


                                                                                   
interface IERC20 {
    function BALANCEOF743(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER882(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
}


                                 
interface IVoken {
    function BALANCEOF743(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER882(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function INWHITELIST190(address account) external view returns (bool);	//inject NONSTANDARD NAMING
}


                                             
interface IVokenPublicSale {
    function STATUS629() external view returns (uint256 auditEtherPrice,	//inject NONSTANDARD NAMING
                                             uint16 stage,
                                             uint16 season,
                                             uint256 vokenUsdPrice,
                                             uint256 currentTopSalesRatio,
                                             uint256 txs,
                                             uint256 vokenTxs,
                                             uint256 vokenBonusTxs,
                                             uint256 vokenWhitelistTxs,
                                             uint256 vokenIssued,
                                             uint256 vokenBonus,
                                             uint256 vokenWhitelist);
}


                                
contract Get1002Voken is Ownable, Pausable {
    using SafeMath256 for uint256;

    IVoken public VOKEN = IVoken(0x82070415FEe803f94Ce5617Be1878503e58F0a6a);
    IVokenPublicSale public VOKEN_PUBLIC_SALE = IVokenPublicSale(0xAC873993E43A5AF7B39aB4A5a50ce1FbDb7191D3);

    uint256 private WEI_MIN = 1 ether;
    uint256 private VOKEN_PER_TXN = 1002000000; // 1002.000000 Voken

    uint256 private _txs;
    
    mapping (address => bool) _alreadyGot;

    event TX203(uint256 etherPrice, uint256 vokdnUsdPrice, uint256 weiUsed);	//inject NONSTANDARD NAMING

                                               
    function TXS751() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _txs;
    }

                                                          
    function () external payable WHENNOTPAUSED339 {
        require(msg.value >= WEI_MIN);
        require(VOKEN.BALANCEOF743(address(this)) >= VOKEN_PER_TXN);
        require(VOKEN.BALANCEOF743(msg.sender) == 0);
        require(!VOKEN.INWHITELIST190(msg.sender));
        require(!_alreadyGot[msg.sender]);

        uint256 __etherPrice;
        uint256 __vokenUsdPrice;
        (__etherPrice, , , __vokenUsdPrice, , , , , , , ,) = VOKEN_PUBLIC_SALE.STATUS629();

        require(__etherPrice > 0);

        uint256 __usd = VOKEN_PER_TXN.MUL242(__vokenUsdPrice).DIV835(1000000);
        uint256 __wei = __usd.MUL242(1 ether).DIV835(__etherPrice);

        require(msg.value >= __wei);

        if (msg.value > __wei) {
            msg.sender.transfer(msg.value.SUB447(__wei));
            _receiver.transfer(__wei);
        }

        _txs = _txs.ADD547(1);
        _alreadyGot[msg.sender] = true;
        emit TX203(__etherPrice, __vokenUsdPrice, __wei);

        assert(VOKEN.TRANSFER882(msg.sender, VOKEN_PER_TXN));
    }
}