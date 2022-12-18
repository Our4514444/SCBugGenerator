                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY345() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF483(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER777(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE770(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE759(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM703(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER858(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL151(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD59(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB747(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB747(a, b, "SafeMath: subtraction overflow");
    }
    function SUB747(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL71(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV294(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV294(a, b, "SafeMath: division by zero");
    }
    function DIV294(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

interface UniswapRouter {
    function SWAPEXACTTOKENSFORTOKENS171(	//inject NONSTANDARD NAMING
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function SWAPTOKENSFOREXACTTOKENS216(	//inject NONSTANDARD NAMING
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function GETAMOUNTSOUT212(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
    function GETAMOUNTSIN555(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
    function FACTORY959() external view returns (address);	//inject NONSTANDARD NAMING
}

interface UniswapFactory {
    function GETPAIR359(address tokenA, address tokenB) external view returns (address pair);	//inject NONSTANDARD NAMING
}

interface StableCreditProtocol {
    function UTILIZATION481(address token) external view returns (uint);	//inject NONSTANDARD NAMING
    function BASE870() external view returns (uint);	//inject NONSTANDARD NAMING
    function MAX844() external view returns (uint);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY345() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF483(address owner) external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCES837(address owner, address token) external view returns (uint);	//inject NONSTANDARD NAMING
    function CREDIT233(address owner, address token) external view returns (uint);	//inject NONSTANDARD NAMING
}

contract StableCreditHelper {
    using SafeMath for uint;
    
    UniswapRouter public constant uni309 = UniswapRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING
    StableCreditProtocol public constant stable201 = StableCreditProtocol(0x20D5BFBa0f5c726AAd09956FD7398Acdac048858);	//inject NONSTANDARD NAMING
    
    constructor () public {}
    
    // How much system liquidity is provided by this asset
    function _UTILIZATION162(address token, uint amount) internal view returns (uint) {	//inject NONSTANDARD NAMING
        uint _max = stable201.MAX844();
        uint _base = stable201.BASE870();
        address _pair = UniswapFactory(uni309.FACTORY959()).GETPAIR359(token, address(stable201));
        uint _ratio = _base.SUB747(_base.MUL71(stable201.BALANCEOF483(_pair).ADD59(amount)).DIV294(stable201.TOTALSUPPLY345()));
        if (_ratio == 0) {
            return _max;
        }
        return  _ratio > _max ? _max : _ratio;
    }
    function CALCULATECOLLATERAL622(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAW654(token, uint(-1));
    }
    function CALCULATECOLLATERALOF201(address owner, address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAWOF39(owner, token, uint(-1));
    }
    function CALCULATEWITHDRAWMAX371(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAW654(token, stable201.BALANCEOF483(msg.sender));
    }
    function CALCULATEWITHDRAWMAXOF908(address owner, address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAWOF39(owner, token, stable201.BALANCEOF483(msg.sender));
    }
    function CALCULATEWITHDRAW654(address token, uint amount) public view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEWITHDRAWOF39(msg.sender, token, amount);
    }
    function CREDIT233(address owner, address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return stable201.CREDIT233(owner, token);
    }
    function CALCULATEWITHDRAWOF39(address owner, address token, uint amount) public view returns (uint output) {	//inject NONSTANDARD NAMING
        address _pair = UniswapFactory(uni309.FACTORY959()).GETPAIR359(token, address(stable201));
        uint _supply = IERC20(_pair).TOTALSUPPLY345();
        uint _balance = IERC20(token).BALANCEOF483(_pair);
        uint _share = stable201.BALANCES837(owner, token);
        output = _balance.MUL71(_share).DIV294(_supply);
        
        uint _credit = stable201.CREDIT233(owner, token);
        if (_credit < amount) {
            amount = _credit;
        }
        output = output.MUL71(amount).DIV294(_credit);
    }
    // Calculate maxium amount of credit a depositer will get for their token
    function CALCULATECREDITMAX129(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATECREDITMAXOF771(msg.sender, token);
    }
    function CALCULATECREDITMAXOF771(address owner, address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATECREDIT931(token, IERC20(token).BALANCEOF483(owner));
    }
    function CALCULATECREDIT931(address token, uint amount) public view returns (uint) {	//inject NONSTANDARD NAMING
        return amount.MUL71(_UTILIZATION162(token, amount)).DIV294(stable201.BASE870());
    }
    // Calculate how much USD required to borrow exact amount of output token
    function CALCULATEBORROWEXACTOUT543(address token, uint outExact) external view returns (uint) {	//inject NONSTANDARD NAMING
        address[] memory _path = new address[](2);
        _path[0] = address(stable201);
        _path[1] = token;
        return uni309.GETAMOUNTSIN555(outExact, _path)[0];
    }
    // Calculate maximum amount of output token given amount of USD owner by owner
    function CALCULATEBORROWMAX88(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEBORROWMAXOF816(msg.sender, token);
    }
    function CALCULATEBORROWMAXOF816(address owner, address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEBORROWEXACTIN773(token, stable201.BALANCEOF483(owner));
    }
    // Calculate amount of token received given exact amount of USD input
    function CALCULATEBORROWEXACTIN773(address token, uint inExact) public view returns (uint) {	//inject NONSTANDARD NAMING
        address[] memory _path = new address[](2);
        _path[0] = address(stable201);
        _path[1] = token;
        return uni309.GETAMOUNTSOUT212(inExact, _path)[1];
    }
    // Calculate amount of USD required to repay exact amount of token
    function CALCULATEREPAYEXACTOUT491(address token, uint outExact) external view returns (uint) {	//inject NONSTANDARD NAMING
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(stable201);
        return uni309.GETAMOUNTSIN555(outExact, _path)[0];
    }
    // calculate maximum amount of token repaid given USD input
    function CALCULATEREPAYMAX514(address token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEREPAYMAXOF26(msg.sender, token);
    }
    
    function CALCULATEREPAYMAXOF26(address owner, address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return CALCULATEREPAYEXACTIN910(token, IERC20(token).BALANCEOF483(owner));
    }
    
    // Calculate amount of token repaid given exact amount of USD input
    function CALCULATEREPAYEXACTIN910(address token, uint inExact) public view returns (uint) {	//inject NONSTANDARD NAMING
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(stable201);
        return uni309.GETAMOUNTSOUT212(inExact, _path)[1];
    }
}