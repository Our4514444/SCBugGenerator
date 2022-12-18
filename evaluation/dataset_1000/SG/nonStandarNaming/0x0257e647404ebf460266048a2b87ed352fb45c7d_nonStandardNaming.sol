pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL283(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV603(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB558(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD183(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD51(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED369(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED369(address(0), _owner);
    }

                                                        
    function OWNER687() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER945() {	//inject NONSTANDARD NAMING
        require(ISOWNER560());
        _;
    }

                                                                                 
    function ISOWNER560() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP465() public ONLYOWNER945 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED369(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP142(address newOwner) public ONLYOWNER945 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP588(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP588(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED369(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                   
interface IERC20 {
    function TRANSFER652(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE468(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM599(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY819() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF311(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE234(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER378(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL19(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract TokenSwap is Ownable {
    using SafeMath for uint256;

    IERC20 private _fromToken;
    IERC20 private _toToken;
    uint256 private _rate;

    event SWAP766(address indexed sender, uint256 indexed fromTokenAmount, uint256 indexed toTokenAmount);	//inject NONSTANDARD NAMING
    event DEACTIVATE67(uint256 indexed amount);	//inject NONSTANDARD NAMING

    constructor(
        address fromToken,
        address toToken,
        uint256 rate
    ) Ownable() public {
        require(fromToken != address(0x0) && toToken != address(0x0), "token address can not be 0.");
        require(rate > 0, "swap rate can not be 0.");

        _fromToken = IERC20(fromToken);
        _toToken = IERC20(toToken);
        _rate = rate;
    }

    function SWAP353() external returns (bool) {	//inject NONSTANDARD NAMING
        uint256 allowance = _fromToken.ALLOWANCE234(msg.sender, address(this));
        require(allowance > 0, "sender need to approve token to swap contract.");

        if (_fromToken.TRANSFERFROM599(msg.sender, address(0x0), allowance)) {
            // It only works correctly when the rate is 1000. 
            uint256 swappedValue = allowance.ADD183(999);
            swappedValue = swappedValue.DIV603(_rate);

            require(_toToken.TRANSFERFROM599(Ownable.OWNER687(), msg.sender, swappedValue));

            emit SWAP766(msg.sender, allowance, swappedValue);
        }

        return true;
    }

    function DEACTIVATE690() external ONLYOWNER945 {	//inject NONSTANDARD NAMING
        uint256 reserve = _fromToken.BALANCEOF311(address(this));
        require(_fromToken.TRANSFER652(address(0x0), reserve));

        emit DEACTIVATE67(reserve);
    }
}