                                                                 

pragma solidity 0.5.16;

                                                                                                                                                                                                                                                                                                                                                                       
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED964(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED964(address(0), _owner);
    }

                                                                     
    function OWNER981() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                  
    modifier ONLYOWNER179() {	//inject NONSTANDARD NAMING
        require(ISOWNER608(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER608() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP376() public ONLYOWNER179 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED964(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP121(address newOwner) public ONLYOWNER179 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP499(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP499(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED964(_owner, newOwner);
        _owner = newOwner;
    }
}

contract FlashExchange is Ownable {
 
 using SafeMath for uint256;
 
 
 uint256 constant flashloan_lp_yield485 = 18; //18 bps flashloan yield	//inject NONSTANDARD NAMING
 uint256 constant flashloan_lp_yield_base563 = 1000; //basis points	//inject NONSTANDARD NAMING
 
 mapping(address => bool) flashboys;
 
 mapping(address => uint256) assetsMaxYield;
 
 
 modifier ONLYFLASHBOYS138 {	//inject NONSTANDARD NAMING
     require(flashboys[msg.sender], "Only flashboys can call this function");
     _;
 }
 
 function ADDFLASHBOYS844(address [] memory _flashboys) public ONLYOWNER179 {	//inject NONSTANDARD NAMING
 
    for(uint256 i=0; i< _flashboys.length; i++){
        flashboys[_flashboys[i]] = true;
    }
 }
 
 function ADDASSET255(address _asset, uint256 _maxYield) public ONLYOWNER179 {	//inject NONSTANDARD NAMING
    assetsMaxYield[_asset] = _maxYield;
 }
 
 
 
 function EXCHANGE441(address _asset, uint256 _amount) public payable ONLYFLASHBOYS138{	//inject NONSTANDARD NAMING
     
     uint256 yield = _amount.MUL663(flashloan_lp_yield485).DIV191(flashloan_lp_yield_base563);

    require(yield <= assetsMaxYield[_asset], "Flashloan is too big");

    if(_asset == EthAddressLib.ETHADDRESS919()){
        require(msg.value == _amount, "The value sent is not enough");
        msg.sender.transfer(_amount.ADD818(yield));
    } else {
              //simulating exchange pulling funds from the wallet
            require(IERC20(_asset).TRANSFERFROM421(msg.sender, address(this), _amount));
      
        require(IERC20(_asset).TRANSFER826(msg.sender, _amount.ADD818(yield)));
    }    
}

    function () external payable{

    }
    
    
    function WITHDRAW166(address _asset) public ONLYOWNER179 {	//inject NONSTANDARD NAMING
        if (_asset == EthAddressLib.ETHADDRESS919()) {
            msg.sender.transfer(address(this).balance);
        } else {
            //simulating exchange pulling funds from the wallet
            require(
                IERC20(_asset).TRANSFER826(
                    msg.sender,
                    IERC20(_asset).BALANCEOF662(address(this))
                )
            );
        }
    }
}

library EthAddressLib {

                                                                                                                                 
    function ETHADDRESS919() internal pure returns(address) {	//inject NONSTANDARD NAMING
        return 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD818(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB397(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL663(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV191(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD773(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY804() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF662(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER826(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE104(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE825(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM421(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER797(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL401(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}