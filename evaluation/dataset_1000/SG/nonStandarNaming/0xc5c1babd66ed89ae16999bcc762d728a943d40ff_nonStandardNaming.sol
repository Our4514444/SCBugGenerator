                                                                 

// File: contracts/loopring/impl/BrokerData.sol

pragma solidity ^0.5.7;

library BrokerData {

  struct BrokerOrder {
    address owner;
    bytes32 orderHash;
    uint fillAmountB;
    uint requestedAmountS;
    uint requestedFeeAmount;
    address tokenRecipient;
    bytes extraData;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                               
  struct BrokerApprovalRequest {
    BrokerOrder[] orders;
    // The token output token for the broker at the end of #brokerRequestAllowance.
    address tokenS;
    // The token received by the broker at the start of #brokerRequestAllowance. This token must be internally traded
    // for tokenS.
    address tokenB;
    address feeToken;
    // The amount of tokens that the broker has at the start of the call to #brokerRequestAllowance. This amount needs
    // to be traded within the brokering contract for #totalRequestedAmountS
    uint totalFillAmountB;
    // The amount of tokens that needs be outputted by #brokerRequestAllowance (and therefore traded for INTERNALLY
    // within the contract)
    uint totalRequestedAmountS;
    uint totalRequestedFeeAmount;
  }

  struct BrokerInterceptorReport {
    address owner;
    address broker;
    bytes32 orderHash;
    address tokenB;
    address tokenS;
    address feeToken;
    uint fillAmountB;
    uint spentAmountS;
    uint spentFeeAmount;
    address tokenRecipient;
    bytes extraData;
  }

}

// File: contracts/market-making/sources/uniswap-v2/interfaces/IUniswapV2Router01.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity ^0.5.7;
pragma experimental ABIEncoderV2;


interface IUniswapV2Router01 {

    function SWAPEXACTTOKENSFORTOKENS512(	//inject NONSTANDARD NAMING
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

}

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.0;

                                                                                        
interface IERC20 {
    function TRANSFER75(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE143(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM900(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY496() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF690(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE314(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER184(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL552(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                   
library SafeMath {
                                                                                
    function MUL192(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV986(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB325(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD468(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD719(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.5.0;



                                                                                                                                                                                                                                                                            
library SafeERC20 {
    using SafeMath for uint256;

    function SAFETRANSFER611(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(token.TRANSFER75(to, value));
    }

    function SAFETRANSFERFROM119(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(token.TRANSFERFROM900(from, to, value));
    }

    function SAFEAPPROVE678(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require((value == 0) || (token.ALLOWANCE314(address(this), spender) == 0));
        require(token.APPROVE143(spender, value));
    }

    function SAFEINCREASEALLOWANCE823(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE314(address(this), spender).ADD468(value);
        require(token.APPROVE143(spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE626(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE314(address(this), spender).SUB325(value);
        require(token.APPROVE143(spender, newAllowance));
    }
}

// File: contracts/libs/SafeEther.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity ^0.5.0;

library SafeEther {

    function TOPAYABLE766(address _address) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(_address));
    }

    function SAFETRANSFERETHER935(address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        SAFETRANSFERETHER935(recipient, amount, "CANNOT_TRANSFER_ETHER");
    }

    function SAFETRANSFERETHER935(address recipient, uint amount, string memory errorMessage) internal {	//inject NONSTANDARD NAMING
        (bool success,) = address(uint160(recipient)).call.value(amount)("");
        require(success, errorMessage);
    }

}

// File: contracts/market-making/helper/MakerBrokerBase.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity ^0.5.7;




                                                                                                                                                                                                     
contract MakerBrokerBase {

    using SafeEther for address payable;
    using SafeERC20 for IERC20;

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER734() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "NOT_OWNER");
        _;
    }

    function TRANSFEROWNERSHIP924(address newOwner) public ONLYOWNER734 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0x0), "ZERO_ADDRESS");
        owner = newOwner;
    }

    function WITHDRAWDUST288(address token) external {	//inject NONSTANDARD NAMING
        _WITHDRAWDUST455(token, msg.sender);
    }

    function WITHDRAWDUST288(address token, address recipient) external {	//inject NONSTANDARD NAMING
        _WITHDRAWDUST455(token, recipient);
    }

    function WITHDRAWETHDUST685() external {	//inject NONSTANDARD NAMING
        _WITHDRAWETHDUST501(msg.sender);
    }

    function WITHDRAWETHDUST685(address payable recipient) external {	//inject NONSTANDARD NAMING
        _WITHDRAWETHDUST501(recipient);
    }

    function _WITHDRAWDUST455(address token, address recipient) internal {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "UNAUTHORIZED");
        IERC20(token).SAFETRANSFER611(
            recipient,
            IERC20(token).BALANCEOF690(address(this))
        );
    }

    function _WITHDRAWETHDUST501(address payable recipient) internal {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "UNAUTHORIZED");
        recipient.SAFETRANSFERETHER935(address(this).balance);
    }

}

// File: contracts/misc/interfaces/IWETH.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity ^0.5.7;

interface IWETH {
  event DEPOSIT246(address indexed src, uint wad);	//inject NONSTANDARD NAMING
  event WITHDRAW530(address indexed src, uint wad);	//inject NONSTANDARD NAMING

  function DEPOSIT381() external payable;	//inject NONSTANDARD NAMING
  function WITHDRAW905(uint wad) external;	//inject NONSTANDARD NAMING
}

// File: contracts/loopring/iface/IBrokerDelegate.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity ^0.5.7;


interface IBrokerDelegate {

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function BROKERREQUESTALLOWANCE541(BrokerData.BrokerApprovalRequest calldata request) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function ONORDERFILLREPORT615(BrokerData.BrokerInterceptorReport calldata fillReport) external;	//inject NONSTANDARD NAMING

                                                                                                        
  function BROKERBALANCEOF881(address owner, address token) external view returns (uint);	//inject NONSTANDARD NAMING
}

// File: contracts/market-making/UniswapRebalancerMakerBroker.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

pragma solidity ^0.5.7;






                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract UniswapRebalancerMakerBroker is MakerBrokerBase, IBrokerDelegate {

    address internal _wethTokenAddress;
    address internal _loopringDelegate;
    address internal _uniswapV2Router;
    uint8 internal _slippageFactor;

    mapping(address => address) public tokenToExchange;
    mapping(address => bool) public tokenToIsSetup;

    constructor(address loopringDelegate, address uniswapV2Router, address wethTokenAddress) public {
        _loopringDelegate = loopringDelegate;
        _wethTokenAddress = wethTokenAddress;
        _uniswapV2Router = uniswapV2Router;
        _slippageFactor = 4;
    }

    function SETUPTOKEN583(address token) public {	//inject NONSTANDARD NAMING
        IERC20(token).SAFEAPPROVE678(_loopringDelegate, uint(- 1));
        IERC20(token).SAFEAPPROVE678(_uniswapV2Router, uint(- 1));
        tokenToIsSetup[token] = true;
    }

    function SETUPTOKENS885(address[] calldata tokens) external {	//inject NONSTANDARD NAMING
        for (uint i = 0; i < tokens.length; i++) {
            SETUPTOKEN583(tokens[i]);
        }
    }

    function SETSLIPPAGEFACTOR481(uint8 slippageFactor) external ONLYOWNER734 {	//inject NONSTANDARD NAMING
        _slippageFactor = slippageFactor;
    }

    function GETSLIPPAGEFACTOR358() external view returns (uint8) {	//inject NONSTANDARD NAMING
        return _slippageFactor;
    }

    function() external payable {
        revert("UniswapRebalancerMakerBroker: NO_DEFAULT");
    }

    // --------------------------------
    // Loopring Broker Delegate

    function BROKERREQUESTALLOWANCE541(BrokerData.BrokerApprovalRequest memory request) public returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == _loopringDelegate, "UniswapRebalancerMakerBroker: UNAUTHORIZED");
        require(tokenToIsSetup[request.tokenS], "UniswapRebalancerMakerBroker: TOKEN_S_NOT_SETUP");

        for (uint i = 0; i < request.orders.length; i++) {
            require(request.orders[i].tokenRecipient == address(this), "UniswapRebalancerMakerBroker: INVALID_TOKEN_RECIPIENT");
            require(request.orders[i].owner == owner, "UniswapRebalancerMakerBroker: INVALID_ORDER_OWNER");
        }

        address[] memory intermediatePaths;
        if (request.orders[0].extraData.length == 0) {
            intermediatePaths = new address[](0);
        } else {
            intermediatePaths = abi.decode(request.orders[0].extraData, (address[]));
        }

        if (intermediatePaths.length == 0 || intermediatePaths[0] != address(0x0000000000000000000000000000000000000001)) {
            address[] memory path = new address[](intermediatePaths.length + 2);
            path[0] = request.tokenB;
            for (uint i = 0; i < intermediatePaths.length; i++) {
                path[i + 1] = intermediatePaths[i];
            }
            path[path.length - 1] = request.tokenS;

            // We don't need to do a "try-catch" here because UniswapV2 has sufficient error handling.
            IUniswapV2Router01(_uniswapV2Router).SWAPEXACTTOKENSFORTOKENS512(
                request.totalFillAmountB,
                request.totalRequestedAmountS / uint(_slippageFactor),
                path,
                address(this),
                block.timestamp
            );
        }

        // We don't need a fill report.
        return false;
    }

    function ONORDERFILLREPORT615(BrokerData.BrokerInterceptorReport memory fillReport) public {	//inject NONSTANDARD NAMING
        // No op
    }

                                                                                                                                                        
    function BROKERBALANCEOF881(address owner, address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return uint(- 1);
    }

    function BALANCEOF690(address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(token).BALANCEOF690(address(this));
    }

}