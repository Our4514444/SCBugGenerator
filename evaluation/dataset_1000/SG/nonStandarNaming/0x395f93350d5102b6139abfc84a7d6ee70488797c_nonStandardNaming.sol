                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY200() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF361(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER661(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE718(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS33() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE66(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM112(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER69(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL621(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD110(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB268(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB268(a, b, "SafeMath: subtraction overflow");
    }
    function SUB268(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL766(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV718(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV718(a, b, "SafeMath: division by zero");
    }
    function DIV718(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD946(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD946(a, b, "SafeMath: modulo by zero");
    }
    function MOD946(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT745(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE350(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE501(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER634(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN687(token, abi.encodeWithSelector(token.TRANSFER661.selector, to, value));
    }

    function SAFETRANSFERFROM904(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN687(token, abi.encodeWithSelector(token.TRANSFERFROM112.selector, from, to, value));
    }

    function SAFEAPPROVE121(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE718(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN687(token, abi.encodeWithSelector(token.APPROVE66.selector, spender, value));
    }
    function CALLOPTIONALRETURN687(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT745(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface Controller {
    function VAULTS194(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS611() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface Governance {
    function WITHDRAW847(uint) external;	//inject NONSTANDARD NAMING
    function GETREWARD482() external;	//inject NONSTANDARD NAMING
    function STAKE154(uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF361(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EXIT757() external;	//inject NONSTANDARD NAMING
    function VOTEFOR459(uint) external;	//inject NONSTANDARD NAMING
    function VOTEAGAINST486(uint) external;	//inject NONSTANDARD NAMING
}

interface yERC20 {
  function DEPOSIT916(uint256 _amount) external;	//inject NONSTANDARD NAMING
  function WITHDRAW847(uint256 _amount) external;	//inject NONSTANDARD NAMING
}


interface Uni {
    function SWAPEXACTTOKENSFORTOKENS538(uint, uint, address[] calldata, address, uint) external;	//inject NONSTANDARD NAMING
}


interface ICurveFi {
  function GET_VIRTUAL_PRICE220() external view returns (uint);	//inject NONSTANDARD NAMING
  function ADD_LIQUIDITY122(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function REMOVE_LIQUIDITY_IMBALANCE146(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 max_burn_amount
  ) external;
  function REMOVE_LIQUIDITY28(	//inject NONSTANDARD NAMING
    uint256 _amount,
    uint256[4] calldata amounts
  ) external;
  function EXCHANGE968(	//inject NONSTANDARD NAMING
    int128 from, int128 to, uint256 _from_amount, uint256 _min_to_amount
  ) external;
}

interface Zap {
    function REMOVE_LIQUIDITY_ONE_COIN901(uint, int128, uint) external;	//inject NONSTANDARD NAMING
}

contract StrategyYFIGovernance {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want126 = address(0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e);	//inject NONSTANDARD NAMING
    address constant public gov437 = address(0xBa37B002AbaFDd8E89a1995dA52740bbC013D992);	//inject NONSTANDARD NAMING
    address constant public curve803 = address(0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51);	//inject NONSTANDARD NAMING
    address constant public zap562 = address(0xbBC81d23Ea2c3ec7e56D39296F0cbB648873a5d3);	//inject NONSTANDARD NAMING
    
    address constant public reward89 = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);	//inject NONSTANDARD NAMING
    address constant public usdt596 = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);	//inject NONSTANDARD NAMING
    
    address constant public uni94 = address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING
    address constant public weth951 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); // used for crv <> weth <> dai route	//inject NONSTANDARD NAMING
    
    uint public fee = 500;
    uint constant public max705 = 10000;	//inject NONSTANDARD NAMING
    
    address public governance;
    address public controller;
    address public strategist;
    
    constructor(address _controller) public {
        governance = msg.sender;
        strategist = msg.sender;
        controller = _controller;
    }
    
    function SETFEE576(uint _fee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        fee = _fee;
    }
    
    function SETSTRATEGIST718(address _strategist) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        strategist = _strategist;
    }
    
    function DEPOSIT916() public {	//inject NONSTANDARD NAMING
        IERC20(want126).SAFEAPPROVE121(gov437, 0);
        IERC20(want126).SAFEAPPROVE121(gov437, IERC20(want126).BALANCEOF361(address(this)));
        Governance(gov437).STAKE154(IERC20(want126).BALANCEOF361(address(this)));
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW847(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want126 != address(_asset), "want");
        balance = _asset.BALANCEOF361(address(this));
        _asset.SAFETRANSFER634(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW847(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want126).BALANCEOF361(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME67(_amount.SUB268(_balance));
            _amount = _amount.ADD110(_balance);
        }
        
        uint _fee = _amount.MUL766(fee).DIV718(max705);
        IERC20(want126).SAFETRANSFER634(Controller(controller).REWARDS611(), _fee);
        address _vault = Controller(controller).VAULTS194(address(want126));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        
        IERC20(want126).SAFETRANSFER634(_vault, _amount.SUB268(_fee));
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL961() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL232();
        balance = IERC20(want126).BALANCEOF361(address(this));
        
        address _vault = Controller(controller).VAULTS194(address(want126));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want126).SAFETRANSFER634(_vault, balance);
    }
    
    function _WITHDRAWALL232() internal {	//inject NONSTANDARD NAMING
        Governance(gov437).EXIT757();
    }
    
    function HARVEST735() public {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == governance || msg.sender == tx.origin, "!authorized");
        Governance(gov437).GETREWARD482();
        uint _balance = IERC20(reward89).BALANCEOF361(address(this));
        if (_balance > 0) {
            IERC20(reward89).SAFEAPPROVE121(zap562, 0);
            IERC20(reward89).SAFEAPPROVE121(zap562, _balance);
            Zap(zap562).REMOVE_LIQUIDITY_ONE_COIN901(_balance, 2, 0);
        }
        _balance = IERC20(usdt596).BALANCEOF361(address(this));
        if (_balance > 0) {
            IERC20(usdt596).SAFEAPPROVE121(uni94, 0);
            IERC20(usdt596).SAFEAPPROVE121(uni94, _balance);
            
            address[] memory path = new address[](3);
            path[0] = usdt596;
            path[1] = weth951;
            path[2] = want126;
            
            Uni(uni94).SWAPEXACTTOKENSFORTOKENS538(_balance, uint(0), path, address(this), now.ADD110(1800));
        }
        if (IERC20(want126).BALANCEOF361(address(this)) > 0) {
            DEPOSIT916();
        }
        
    }
    
    function _WITHDRAWSOME67(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        Governance(gov437).WITHDRAW847(_amount);
        return _amount;
    }
    
    function BALANCEOFWANT261() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want126).BALANCEOF361(address(this));
    }
    
    function BALANCEOFYGOV186() public view returns (uint) {	//inject NONSTANDARD NAMING
        return Governance(gov437).BALANCEOF361(address(this));
    }
    
    function BALANCEOF361() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT261()
               .ADD110(BALANCEOFYGOV186());
    }
    
    function VOTEFOR459(uint _proposal) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        Governance(gov437).VOTEFOR459(_proposal);
    }
    
    function VOTEAGAINST486(uint _proposal) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        Governance(gov437).VOTEAGAINST486(_proposal);
    }
    
    function SETGOVERNANCE495(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER785(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}