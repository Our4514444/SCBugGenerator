pragma solidity ^0.5.7;


// Send more than WEI_MIN (init = 1 ETH) for 1002 Wesions, and get unused ETH refund automatically.
//   Use the current Wesion price of Wesion Public-Sale.
//
// Conditions:
//   1. You have no Wesion yet.
//   2. You are not in the whitelist yet.
//   3. Send more than 1 ETH (for balance verification).
//

                                                                                                                
library SafeMath256 {
                                                                            
    function ADD666(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        assert(c >= a);
        return c;
    }

                                                                                                                              
    function SUB644(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

                                                                                  
    function MUL881(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

                                                                                                                                  
    function DIV388(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
    }

                                                                                                                                                    
    function MOD442(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                         
contract Ownable {
    address private _owner;
    address payable internal _receiver;

    event OWNERSHIPTRANSFERRED21(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    event RECEIVERCHANGED790(address indexed previousReceiver, address indexed newReceiver);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        _receiver = msg.sender;
    }

                                                        
    function OWNER64() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER391() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP380(address newOwner) external ONLYOWNER391 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        address __previousOwner = _owner;
        _owner = newOwner;
        emit OWNERSHIPTRANSFERRED21(__previousOwner, newOwner);
    }

                                            
    function CHANGERECEIVER73(address payable newReceiver) external ONLYOWNER391 {	//inject NONSTANDARD NAMING
        require(newReceiver != address(0));
        address __previousReceiver = _receiver;
        _receiver = newReceiver;
        emit RECEIVERCHANGED790(__previousReceiver, newReceiver);
    }

                                                                                                                                                                                                                      
    function RESCUETOKENS248(address tokenAddr, address receiver, uint256 amount) external ONLYOWNER391 {	//inject NONSTANDARD NAMING
        IERC20 _token = IERC20(tokenAddr);
        require(receiver != address(0));
        uint256 balance = _token.BALANCEOF759(address(this));
        require(balance >= amount);

        assert(_token.TRANSFER344(receiver, amount));
    }

                                          
    function WITHDRAWETHER150(address payable to, uint256 amount) external ONLYOWNER391 {	//inject NONSTANDARD NAMING
        require(to != address(0));
        uint256 balance = address(this).balance;
        require(balance >= amount);

        to.transfer(amount);
    }
}


                                                                                                                
contract Pausable is Ownable {
    bool private _paused;

    event PAUSED981(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED325(address account);	//inject NONSTANDARD NAMING

    constructor () internal {
        _paused = false;
    }

                                                                                       
    function PAUSED980() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED273() {	//inject NONSTANDARD NAMING
        require(!_paused, "Paused.");
        _;
    }

                                                                                
    function SETPAUSED310(bool state) external ONLYOWNER391 {	//inject NONSTANDARD NAMING
        if (_paused && !state) {
            _paused = false;
            emit UNPAUSED325(msg.sender);
        } else if (!_paused && state) {
            _paused = true;
            emit PAUSED981(msg.sender);
        }
    }
}


                                                                                   
interface IERC20 {
    function BALANCEOF759(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER344(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
}


                                  
interface IWesion {
    function BALANCEOF759(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER344(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function INWHITELIST926(address account) external view returns (bool);	//inject NONSTANDARD NAMING
}


                                              
interface IWesionPublicSale {
    function STATUS724() external view returns (uint256 auditEtherPrice,	//inject NONSTANDARD NAMING
                                             uint16 stage,
                                             uint16 season,
                                             uint256 WesionUsdPrice,
                                             uint256 currentTopSalesRatio,
                                             uint256 txs,
                                             uint256 WesionTxs,
                                             uint256 WesionBonusTxs,
                                             uint256 WesionWhitelistTxs,
                                             uint256 WesionIssued,
                                             uint256 WesionBonus,
                                             uint256 WesionWhitelist);
}


                                 
contract Get1002Wesion is Ownable, Pausable {
    using SafeMath256 for uint256;

    IWesion public Wesion = IWesion(0x2c1564A74F07757765642ACef62a583B38d5A213);
    IWesionPublicSale public Wesion_PUBLIC_SALE;

    uint256 public WEI_MIN = 1 ether;
    uint256 private Wesion_PER_TXN = 1002000000; // 1002.000000 Wesion

    uint256 private _txs;

    mapping (address => bool) _alreadyGot;

    event TX220(uint256 etherPrice, uint256 vokdnUsdPrice, uint256 weiUsed);	//inject NONSTANDARD NAMING

                                               
    function TXS734() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _txs;
    }

    function SETWEIMIN707(uint256 weiMin) public ONLYOWNER391 {	//inject NONSTANDARD NAMING
        WEI_MIN = weiMin;
    }

                                                           
    function () external payable WHENNOTPAUSED273 {
        require(msg.value >= WEI_MIN);
        require(Wesion.BALANCEOF759(address(this)) >= Wesion_PER_TXN);
        require(Wesion.BALANCEOF759(msg.sender) == 0);
        require(!Wesion.INWHITELIST926(msg.sender));
        require(!_alreadyGot[msg.sender]);

        uint256 __etherPrice;
        uint256 __WesionUsdPrice;
        (__etherPrice, , , __WesionUsdPrice, , , , , , , ,) = Wesion_PUBLIC_SALE.STATUS724();

        require(__etherPrice > 0);

        uint256 __usd = Wesion_PER_TXN.MUL881(__WesionUsdPrice).DIV388(1000000);
        uint256 __wei = __usd.MUL881(1 ether).DIV388(__etherPrice);

        require(msg.value >= __wei);

        if (msg.value > __wei) {
            msg.sender.transfer(msg.value.SUB644(__wei));
            _receiver.transfer(__wei);
        }

        _txs = _txs.ADD666(1);
        _alreadyGot[msg.sender] = true;
        emit TX220(__etherPrice, __WesionUsdPrice, __wei);

        assert(Wesion.TRANSFER344(msg.sender, Wesion_PER_TXN));
    }

                                                   
    function SETPUBLICSALEADDRESS547(address _pubSaleAddr) public ONLYOWNER391 {	//inject NONSTANDARD NAMING
        Wesion_PUBLIC_SALE = IWesionPublicSale(_pubSaleAddr);
    }

                                              
    function SETWESIONADDRESS158(address _WesionAddr) public ONLYOWNER391 {	//inject NONSTANDARD NAMING
        Wesion = IWesion(_WesionAddr);
    }

}