                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;


                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY543() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF308(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER552(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE314(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE172(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM947(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER957(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL838(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD934(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB559(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB559(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB559(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL804(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV382(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV382(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV382(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD338(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD338(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD338(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function ISCONTRACT938(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                          
    function TOPAYABLE435(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE596(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER34(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN381(token, abi.encodeWithSelector(token.TRANSFER552.selector, to, value));
    }

    function SAFETRANSFERFROM930(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN381(token, abi.encodeWithSelector(token.TRANSFERFROM947.selector, from, to, value));
    }

    function SAFEAPPROVE755(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE314(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN381(token, abi.encodeWithSelector(token.APPROVE172.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE524(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE314(address(this), spender).ADD934(value);
        CALLOPTIONALRETURN381(token, abi.encodeWithSelector(token.APPROVE172.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE751(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE314(address(this), spender).SUB559(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN381(token, abi.encodeWithSelector(token.APPROVE172.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN381(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT938(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// 
interface IController {
    function WITHDRAW120(address, uint256) external;	//inject NONSTANDARD NAMING

    function BALANCEOF308(address) external view returns (uint256);	//inject NONSTANDARD NAMING

    function EARN690(address, uint256) external;	//inject NONSTANDARD NAMING

    function WANT410(address) external view returns (address);	//inject NONSTANDARD NAMING

    function REWARDS992() external view returns (address);	//inject NONSTANDARD NAMING

    function VAULTS129(address) external view returns (address);	//inject NONSTANDARD NAMING

    function STRATEGIES484(address) external view returns (address);	//inject NONSTANDARD NAMING
}

// 
interface Gauge {
    function DEPOSIT558(uint256) external;	//inject NONSTANDARD NAMING

    function BALANCEOF308(address) external view returns (uint256);	//inject NONSTANDARD NAMING

    function WITHDRAW120(uint256) external;	//inject NONSTANDARD NAMING
}

// 
interface Mintr {
    function MINT593(address) external;	//inject NONSTANDARD NAMING
}

// 
interface Uni {
    function SWAPEXACTTOKENSFORTOKENS414(	//inject NONSTANDARD NAMING
        uint256,
        uint256,
        address[] calldata,
        address,
        uint256
    ) external;
}

// 
interface ICurveFi {
    function GET_VIRTUAL_PRICE90() external view returns (uint256);	//inject NONSTANDARD NAMING

    function ADD_LIQUIDITY114(	//inject NONSTANDARD NAMING
        // sBTC pool
        uint256[3] calldata amounts,
        uint256 min_mint_amount
    ) external;

    function ADD_LIQUIDITY114(	//inject NONSTANDARD NAMING
        // bUSD pool
        uint256[4] calldata amounts,
        uint256 min_mint_amount
    ) external;

    function REMOVE_LIQUIDITY_IMBALANCE6(uint256[4] calldata amounts, uint256 max_burn_amount) external;	//inject NONSTANDARD NAMING

    function REMOVE_LIQUIDITY283(uint256 _amount, uint256[4] calldata amounts) external;	//inject NONSTANDARD NAMING

    function EXCHANGE723(	//inject NONSTANDARD NAMING
        int128 from,
        int128 to,
        uint256 _from_amount,
        uint256 _min_to_amount
    ) external;
}

interface Zap {
    function REMOVE_LIQUIDITY_ONE_COIN148(	//inject NONSTANDARD NAMING
        uint256,
        int128,
        uint256
    ) external;
}

// 
// NOTE: Basically an alias for Vaults
interface yERC20 {
    function DEPOSIT558(uint256 _amount) external;	//inject NONSTANDARD NAMING

    function WITHDRAW120(uint256 _amount) external;	//inject NONSTANDARD NAMING

    function GETPRICEPERFULLSHARE897() external view returns (uint256);	//inject NONSTANDARD NAMING
}

// 
interface VoterProxy {
    function WITHDRAW120(	//inject NONSTANDARD NAMING
        address _gauge,
        address _token,
        uint256 _amount
    ) external returns (uint256);

    function BALANCEOF308(address _gauge) external view returns (uint256);	//inject NONSTANDARD NAMING

    function WITHDRAWALL620(address _gauge, address _token) external returns (uint256);	//inject NONSTANDARD NAMING

    function DEPOSIT558(address _gauge, address _token) external;	//inject NONSTANDARD NAMING

    function HARVEST455(address _gauge) external;	//inject NONSTANDARD NAMING

    function LOCK122() external;	//inject NONSTANDARD NAMING
}

// 
contract StrategyCurveBUSDVoterProxy {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    address public constant want30 = address(0x3B3Ac5386837Dc563660FB6a0937DFAa5924333B);	//inject NONSTANDARD NAMING
    address public constant crv469 = address(0xD533a949740bb3306d119CC777fa900bA034cd52);	//inject NONSTANDARD NAMING
    address public constant uni36 = address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING
    address public constant weth578 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); // used for crv <> weth <> dai route	//inject NONSTANDARD NAMING

    address public constant dai100 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address public constant ydai787 = address(0xC2cB1040220768554cf699b0d863A3cd4324ce32);	//inject NONSTANDARD NAMING
    address public constant curve693 = address(0x79a8C46DeA5aDa233ABaFFD40F3A0A2B1e5A4F27);	//inject NONSTANDARD NAMING

    address public constant gauge335 = address(0x69Fb7c45726cfE2baDeE8317005d3F94bE838840);	//inject NONSTANDARD NAMING
    address public constant voter414 = address(0xF147b8125d2ef93FB6965Db97D6746952a133934);	//inject NONSTANDARD NAMING

    uint256 public keepCRV = 1000;
    uint256 public constant keepcrvmax288 = 10000;	//inject NONSTANDARD NAMING

    uint256 public performanceFee = 500;
    uint256 public constant performancemax837 = 10000;	//inject NONSTANDARD NAMING

    uint256 public withdrawalFee = 50;
    uint256 public constant withdrawalmax247 = 10000;	//inject NONSTANDARD NAMING

    address public proxy;

    address public governance;
    address public controller;
    address public strategist;

    constructor(address _controller) public {
        governance = msg.sender;
        strategist = msg.sender;
        controller = _controller;
    }

    function GETNAME639() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyCurveBUSDVoterProxy";
    }

    function SETSTRATEGIST137(address _strategist) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        strategist = _strategist;
    }

    function SETKEEPCRV834(uint256 _keepCRV) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        keepCRV = _keepCRV;
    }

    function SETWITHDRAWALFEE46(uint256 _withdrawalFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        withdrawalFee = _withdrawalFee;
    }

    function SETPERFORMANCEFEE184(uint256 _performanceFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        performanceFee = _performanceFee;
    }

    function SETPROXY521(address _proxy) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        proxy = _proxy;
    }

    function DEPOSIT558() public {	//inject NONSTANDARD NAMING
        uint256 _want = IERC20(want30).BALANCEOF308(address(this));
        if (_want > 0) {
            IERC20(want30).SAFETRANSFER34(proxy, _want);
            VoterProxy(proxy).DEPOSIT558(gauge335, want30);
        }
    }

    // Controller only function for creating additional rewards from dust
    function WITHDRAW120(IERC20 _asset) external returns (uint256 balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want30 != address(_asset), "want");
        require(crv469 != address(_asset), "crv");
        require(ydai787 != address(_asset), "ydai");
        require(dai100 != address(_asset), "dai");
        balance = _asset.BALANCEOF308(address(this));
        _asset.SAFETRANSFER34(controller, balance);
    }

    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW120(uint256 _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint256 _balance = IERC20(want30).BALANCEOF308(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME143(_amount.SUB559(_balance));
            _amount = _amount.ADD934(_balance);
        }

        uint256 _fee = _amount.MUL804(withdrawalFee).DIV382(withdrawalmax247);

        IERC20(want30).SAFETRANSFER34(IController(controller).REWARDS992(), _fee);
        address _vault = IController(controller).VAULTS129(address(want30));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds

        IERC20(want30).SAFETRANSFER34(_vault, _amount.SUB559(_fee));
    }

    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL620() external returns (uint256 balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL502();

        balance = IERC20(want30).BALANCEOF308(address(this));

        address _vault = IController(controller).VAULTS129(address(want30));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want30).SAFETRANSFER34(_vault, balance);
    }

    function _WITHDRAWALL502() internal {	//inject NONSTANDARD NAMING
        VoterProxy(proxy).WITHDRAWALL620(gauge335, want30);
    }

    function HARVEST455() public {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == governance, "!authorized");
        VoterProxy(proxy).HARVEST455(gauge335);
        uint256 _crv = IERC20(crv469).BALANCEOF308(address(this));
        if (_crv > 0) {
            uint256 _keepCRV = _crv.MUL804(keepCRV).DIV382(keepcrvmax288);
            IERC20(crv469).SAFETRANSFER34(voter414, _keepCRV);
            _crv = _crv.SUB559(_keepCRV);

            IERC20(crv469).SAFEAPPROVE755(uni36, 0);
            IERC20(crv469).SAFEAPPROVE755(uni36, _crv);

            address[] memory path = new address[](3);
            path[0] = crv469;
            path[1] = weth578;
            path[2] = dai100;

            Uni(uni36).SWAPEXACTTOKENSFORTOKENS414(_crv, uint256(0), path, address(this), now.ADD934(1800));
        }
        uint256 _dai = IERC20(dai100).BALANCEOF308(address(this));
        if (_dai > 0) {
            IERC20(dai100).SAFEAPPROVE755(ydai787, 0);
            IERC20(dai100).SAFEAPPROVE755(ydai787, _dai);
            yERC20(ydai787).DEPOSIT558(_dai);
        }
        uint256 _ydai = IERC20(ydai787).BALANCEOF308(address(this));
        if (_ydai > 0) {
            IERC20(ydai787).SAFEAPPROVE755(curve693, 0);
            IERC20(ydai787).SAFEAPPROVE755(curve693, _ydai);
            ICurveFi(curve693).ADD_LIQUIDITY114([_ydai, 0, 0, 0], 0);
        }
        uint256 _want = IERC20(want30).BALANCEOF308(address(this));
        if (_want > 0) {
            uint256 _fee = _want.MUL804(performanceFee).DIV382(performancemax837);
            IERC20(want30).SAFETRANSFER34(IController(controller).REWARDS992(), _fee);
            DEPOSIT558();
        }
        VoterProxy(proxy).LOCK122();
    }

    function _WITHDRAWSOME143(uint256 _amount) internal returns (uint256) {	//inject NONSTANDARD NAMING
        return VoterProxy(proxy).WITHDRAW120(gauge335, want30, _amount);
    }

    function BALANCEOFWANT560() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return IERC20(want30).BALANCEOF308(address(this));
    }

    function BALANCEOFPOOL474() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return VoterProxy(proxy).BALANCEOF308(gauge335);
    }

    function BALANCEOF308() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT560().ADD934(BALANCEOFPOOL474());
    }

    function SETGOVERNANCE273(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    function SETCONTROLLER281(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}