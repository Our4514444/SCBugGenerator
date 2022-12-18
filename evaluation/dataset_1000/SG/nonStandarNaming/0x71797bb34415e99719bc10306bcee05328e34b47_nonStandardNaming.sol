                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY921() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF132(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER718(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE968(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE889(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM857(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER935(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL25(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD613(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB453(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB453(a, b, "SafeMath: subtraction overflow");
    }
    function SUB453(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL794(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV339(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV339(a, b, "SafeMath: division by zero");
    }
    function DIV339(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

interface UniswapRouter {
    function SWAPEXACTTOKENSFORTOKENS116(	//inject NONSTANDARD NAMING
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function SWAPTOKENSFOREXACTTOKENS917(	//inject NONSTANDARD NAMING
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function GETAMOUNTSOUT326(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
    function GETAMOUNTSIN592(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
    function FACTORY672() external view returns (address);	//inject NONSTANDARD NAMING
}

interface UniswapFactory {
    function GETPAIR529(address tokenA, address tokenB) external view returns (address pair);	//inject NONSTANDARD NAMING
}

interface StableCreditProtocol {
    function UTILIZATION8(address token) external view returns (uint);	//inject NONSTANDARD NAMING
    function BASE304() external view returns (uint);	//inject NONSTANDARD NAMING
    function MAX467() external view returns (uint);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY921() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF132(address owner) external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCES499(address owner, address token) external view returns (uint);	//inject NONSTANDARD NAMING
    function CREDIT730(address owner, address token) external view returns (uint);	//inject NONSTANDARD NAMING
}

contract StableCreditHelper {
    using SafeMath for uint;
    
    UniswapRouter public constant uni836 = UniswapRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING
    StableCreditProtocol public constant stable897 = StableCreditProtocol(0xB5a137bb2ab7e317756C399Fd94CA215CeCE81D6);	//inject NONSTANDARD NAMING
    
    constructor () public {}
    
    // How much system liquidity is provided by this asset
    function _UTILIZATION959(address token, uint amount) internal view returns (uint) {	//inject NONSTANDARD NAMING
        uint _max = stable897.MAX467();
        uint _base = stable897.BASE304();
        address _pair = UniswapFactory(uni836.FACTORY672()).GETPAIR529(token, address(stable897));
        uint _ratio = _base.SUB453(_base.MUL794(stable897.BALANCEOF132(_pair).ADD613(amount)).DIV339(stable897.TOTALSUPPLY921()));
        if (_ratio == 0) {
            return _max;
        }
        return  _ratio > _max ? _max : _ratio;
    }
    function CALCULATECOLLATERAL771(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAW547(token, uint(-1));
    }
    function CALCULATECOLLATERALOF277(address owner, address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAWOF44(owner, token, uint(-1));
    }
    function CALCULATEWITHDRAWMAX271(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAW547(token, stable897.BALANCEOF132(msg.sender));
    }
    function CALCULATEWITHDRAWMAXOF997(address owner, address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAWOF44(owner, token, stable897.BALANCEOF132(msg.sender));
    }
    function CALCULATEWITHDRAW547(address token, uint amount) public view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAWOF44(msg.sender, token, amount);
    }
    function CREDIT730(address owner, address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return stable897.CREDIT730(owner, token);
    }
    function CALCULATEWITHDRAWOF44(address owner, address token, uint amount) public view returns (uint output) {	//inject NONSTANDARD NAMING
        address _pair = UniswapFactory(uni836.FACTORY672()).GETPAIR529(token, address(stable897));
        uint _supply = IERC20(_pair).TOTALSUPPLY921();
        uint _balance = IERC20(token).BALANCEOF132(_pair);
        uint _share = stable897.BALANCES499(owner, token);
        output = _balance.MUL794(_share).DIV339(_supply);
        
        uint _credit = stable897.CREDIT730(owner, token);
        if (_credit < amount) {
            amount = _credit;
        }
        output = output.MUL794(amount).DIV339(_credit);
    }
    // Calculate maxium amount of credit a depositer will get for their token
    function CALCULATECREDITMAX564(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATECREDITMAXOF796(msg.sender, token);
    }
    function CALCULATECREDITMAXOF796(address owner, address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATECREDIT587(token, IERC20(token).BALANCEOF132(owner));
    }
    function CALCULATECREDIT587(address token, uint amount) public view returns (uint) {	//inject NONSTANDARD NAMING
        return amount.MUL794(_UTILIZATION959(token, amount)).DIV339(stable897.BASE304());
    }
    // Calculate how much USD required to borrow exact amount of output token
    function CALCULATEBORROWEXACTOUT46(address token, uint outExact) external view returns (uint) {	//inject NONSTANDARD NAMING
        address[] memory _path = new address[](2);
        _path[0] = address(stable897);
        _path[1] = token;
        return uni836.GETAMOUNTSIN592(outExact, _path)[0];
    }
    // Calculate maximum amount of output token given amount of USD owner by owner
    function CALCULATEBORROWMAX260(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEBORROWMAXOF855(msg.sender, token);
    }
    function CALCULATEBORROWMAXOF855(address owner, address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEBORROWEXACTIN451(token, stable897.BALANCEOF132(owner));
    }
    // Calculate amount of token received given exact amount of USD input
    function CALCULATEBORROWEXACTIN451(address token, uint inExact) public view returns (uint) {	//inject NONSTANDARD NAMING
        address[] memory _path = new address[](2);
        _path[0] = address(stable897);
        _path[1] = token;
        return uni836.GETAMOUNTSOUT326(inExact, _path)[1];
    }
    // Calculate amount of USD required to repay exact amount of token
    function CALCULATEREPAYEXACTOUT567(address token, uint outExact) external view returns (uint) {	//inject NONSTANDARD NAMING
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(stable897);
        return uni836.GETAMOUNTSIN592(outExact, _path)[0];
    }
    // calculate maximum amount of token repaid given USD input
    function CALCULATEREPAYMAX910(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEREPAYMAXOF595(msg.sender, token);
    }
    
    function CALCULATEREPAYMAXOF595(address owner, address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEREPAYEXACTIN474(token, IERC20(token).BALANCEOF132(owner));
    }
    
    // Calculate amount of token repaid given exact amount of USD input
    function CALCULATEREPAYEXACTIN474(address token, uint inExact) public view returns (uint) {	//inject NONSTANDARD NAMING
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(stable897);
        return uni836.GETAMOUNTSOUT326(inExact, _path)[1];
    }
}