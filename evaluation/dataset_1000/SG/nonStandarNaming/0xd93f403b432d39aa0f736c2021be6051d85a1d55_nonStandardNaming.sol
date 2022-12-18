                                                                 

pragma solidity 0.5.15;
pragma experimental ABIEncoderV2;

// YAM rebaser V2 - Uses sushiswap for rebase sales, purchases ETH, uses two hop oracle pricing

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD228(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB219(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB219(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB219(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL882(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV440(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV440(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV440(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD880(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD880(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD880(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY584() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF498(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER636(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE784(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE524(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM443(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER872(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL111(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT186(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function SENDVALUE392(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function FUNCTIONCALL553(address target, bytes memory data) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
      return FUNCTIONCALL553(target, data, "Address: low-level call failed");
    }

                                                                                                                                                                                                                       
    function FUNCTIONCALL553(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _FUNCTIONCALLWITHVALUE725(target, data, 0, errorMessage);
    }

                                                                                                                                                                                                                                                                                                                                                                   
    function FUNCTIONCALLWITHVALUE49(address target, bytes memory data, uint256 value) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        return FUNCTIONCALLWITHVALUE49(target, data, value, "Address: low-level call with value failed");
    }

                                                                                                                                                                                                                                                 
    function FUNCTIONCALLWITHVALUE49(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _FUNCTIONCALLWITHVALUE725(target, data, value, errorMessage);
    }

    function _FUNCTIONCALLWITHVALUE725(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(ISCONTRACT186(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call.value(weiValue)(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER759(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        _CALLOPTIONALRETURN50(token, abi.encodeWithSelector(token.TRANSFER636.selector, to, value));
    }

    function SAFETRANSFERFROM661(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        _CALLOPTIONALRETURN50(token, abi.encodeWithSelector(token.TRANSFERFROM443.selector, from, to, value));
    }

                                                                                                                                                                                                                                                             
    function SAFEAPPROVE99(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE784(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _CALLOPTIONALRETURN50(token, abi.encodeWithSelector(token.APPROVE524.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE609(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE784(address(this), spender).ADD228(value);
        _CALLOPTIONALRETURN50(token, abi.encodeWithSelector(token.APPROVE524.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE196(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE784(address(this), spender).SUB219(value, "SafeERC20: decreased allowance below zero");
        _CALLOPTIONALRETURN50(token, abi.encodeWithSelector(token.APPROVE524.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function _CALLOPTIONALRETURN50(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).FUNCTIONCALL553(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface UniswapPair {
    event APPROVAL111(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
    event TRANSFER872(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING

    function NAME448() external pure returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL40() external pure returns (string memory);	//inject NONSTANDARD NAMING
    function DECIMALS42() external pure returns (uint8);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY584() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF498(address owner) external view returns (uint);	//inject NONSTANDARD NAMING
    function ALLOWANCE784(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING

    function APPROVE524(address spender, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER636(address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM443(address from, address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING

    function DOMAIN_SEPARATOR938() external view returns (bytes32);	//inject NONSTANDARD NAMING
    function PERMIT_TYPEHASH161() external pure returns (bytes32);	//inject NONSTANDARD NAMING
    function NONCES241(address owner) external view returns (uint);	//inject NONSTANDARD NAMING

    function PERMIT532(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;	//inject NONSTANDARD NAMING

    event MINT127(address indexed sender, uint amount0, uint amount1);	//inject NONSTANDARD NAMING
    event BURN864(address indexed sender, uint amount0, uint amount1, address indexed to);	//inject NONSTANDARD NAMING
    event SWAP582(	//inject NONSTANDARD NAMING
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event SYNC590(uint112 reserve0, uint112 reserve1);	//inject NONSTANDARD NAMING

    function MINIMUM_LIQUIDITY153() external pure returns (uint);	//inject NONSTANDARD NAMING
    function FACTORY206() external view returns (address);	//inject NONSTANDARD NAMING
    function TOKEN0522() external view returns (address);	//inject NONSTANDARD NAMING
    function TOKEN1882() external view returns (address);	//inject NONSTANDARD NAMING
    function GETRESERVES698() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);	//inject NONSTANDARD NAMING
    function PRICE0CUMULATIVELAST249() external view returns (uint);	//inject NONSTANDARD NAMING
    function PRICE1CUMULATIVELAST493() external view returns (uint);	//inject NONSTANDARD NAMING
    function KLAST773() external view returns (uint);	//inject NONSTANDARD NAMING

    function MINT84(address to) external returns (uint liquidity);	//inject NONSTANDARD NAMING
    function BURN810(address to) external returns (uint amount0, uint amount1);	//inject NONSTANDARD NAMING
    function SWAP739(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;	//inject NONSTANDARD NAMING
    function SKIM450(address to) external;	//inject NONSTANDARD NAMING
    function SYNC705() external;	//inject NONSTANDARD NAMING

    function INITIALIZE367(address, address) external;	//inject NONSTANDARD NAMING
}

// computes square roots using the babylonian method
// https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method
library Babylonian {
    function SQRT237(uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        // else z = 0
    }
}

// a library for handling binary fixed point numbers (https://en.wikipedia.org/wiki/Q_(number_format))
library FixedPoint {
    // range: [0, 2**112 - 1]
    // resolution: 1 / 2**112
    struct uq112x112 {
        uint224 _x;
    }

    // range: [0, 2**144 - 1]
    // resolution: 1 / 2**112
    struct uq144x112 {
        uint _x;
    }

    uint8 private constant resolution339 = 112;	//inject NONSTANDARD NAMING
    uint private constant q112224 = uint(1) << resolution339;	//inject NONSTANDARD NAMING
    uint private constant q224165 = q112224 << resolution339;	//inject NONSTANDARD NAMING

    // encode a uint112 as a UQ112x112
    function ENCODE801(uint112 x) internal pure returns (uq112x112 memory) {	//inject NONSTANDARD NAMING
        return uq112x112(uint224(x) << resolution339);
    }

    // encodes a uint144 as a UQ144x112
    function ENCODE144140(uint144 x) internal pure returns (uq144x112 memory) {	//inject NONSTANDARD NAMING
        return uq144x112(uint256(x) << resolution339);
    }

    // divide a UQ112x112 by a uint112, returning a UQ112x112
    function DIV440(uq112x112 memory self, uint112 x) internal pure returns (uq112x112 memory) {	//inject NONSTANDARD NAMING
        require(x != 0, 'FixedPoint: DIV_BY_ZERO');
        return uq112x112(self._x / uint224(x));
    }

    // multiply a UQ112x112 by a uint, returning a UQ144x112
    // reverts on overflow
    function MUL882(uq112x112 memory self, uint y) internal pure returns (uq144x112 memory) {	//inject NONSTANDARD NAMING
        uint z;
        require(y == 0 || (z = uint(self._x) * y) / y == uint(self._x), "FixedPoint: MULTIPLICATION_OVERFLOW");
        return uq144x112(z);
    }

    // returns a UQ112x112 which represents the ratio of the numerator to the denominator
    // equivalent to encode(numerator).div(denominator)
    function FRACTION590(uint112 numerator, uint112 denominator) internal pure returns (uq112x112 memory) {	//inject NONSTANDARD NAMING
        require(denominator > 0, "FixedPoint: DIV_BY_ZERO");
        return uq112x112((uint224(numerator) << resolution339) / denominator);
    }

    // decode a UQ112x112 into a uint112 by truncating after the radix point
    function DECODE399(uq112x112 memory self) internal pure returns (uint112) {	//inject NONSTANDARD NAMING
        return uint112(self._x >> resolution339);
    }

    // decode a UQ144x112 into a uint144 by truncating after the radix point
    function DECODE144171(uq144x112 memory self) internal pure returns (uint144) {	//inject NONSTANDARD NAMING
        return uint144(self._x >> resolution339);
    }

    // take the reciprocal of a UQ112x112
    function RECIPROCAL906(uq112x112 memory self) internal pure returns (uq112x112 memory) {	//inject NONSTANDARD NAMING
        require(self._x != 0, 'FixedPoint: ZERO_RECIPROCAL');
        return uq112x112(uint224(q224165 / self._x));
    }

    // square root of a UQ112x112
    function SQRT237(uq112x112 memory self) internal pure returns (uq112x112 memory) {	//inject NONSTANDARD NAMING
        return uq112x112(uint224(Babylonian.SQRT237(uint256(self._x)) << 56));
    }
}

// library with helper methods for oracles that are concerned with computing average prices
library UniswapV2OracleLibrary {
    using FixedPoint for *;

    // helper function that returns the current block timestamp within the range of uint32, i.e. [0, 2**32 - 1]
    function CURRENTBLOCKTIMESTAMP264() internal view returns (uint32) {	//inject NONSTANDARD NAMING
        return uint32(block.timestamp % 2 ** 32);
    }

    // produces the cumulative price using counterfactuals to save gas and avoid a call to sync.
    function CURRENTCUMULATIVEPRICES778(	//inject NONSTANDARD NAMING
        address pair,
        bool isToken0
    ) internal view returns (uint priceCumulative, uint32 blockTimestamp) {
        blockTimestamp = CURRENTBLOCKTIMESTAMP264();
        (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) = UniswapPair(pair).GETRESERVES698();
        if (isToken0) {
          priceCumulative = UniswapPair(pair).PRICE0CUMULATIVELAST249();

          // if time has elapsed since the last update on the pair, mock the accumulated price values
          if (blockTimestampLast != blockTimestamp) {
              // subtraction overflow is desired
              uint32 timeElapsed = blockTimestamp - blockTimestampLast;
              // addition overflow is desired
              // counterfactual
              priceCumulative += uint(FixedPoint.FRACTION590(reserve1, reserve0)._x) * timeElapsed;
          }
        } else {
          priceCumulative = UniswapPair(pair).PRICE1CUMULATIVELAST493();
          // if time has elapsed since the last update on the pair, mock the accumulated price values
          if (blockTimestampLast != blockTimestamp) {
              // subtraction overflow is desired
              uint32 timeElapsed = blockTimestamp - blockTimestampLast;
              // addition overflow is desired
              // counterfactual
              priceCumulative += uint(FixedPoint.FRACTION590(reserve0, reserve1)._x) * timeElapsed;
          }
        }

    }
}

// Storage for a YAM token
contract YAMTokenStorage {

    using SafeMath for uint256;

                                                                                     
    bool internal _notEntered;

                                                               
    string public name;

                                                                 
    string public symbol;

                                                                   
    uint8 public decimals;

                                                         
    address public gov;

                                                                   
    address public pendingGov;

                                                                 
    address public rebaser;

                                                                  
    address public migrator;

                                                                   
    address public incentivizer;

                                                   
    uint256 public totalSupply;

                                                                              
    uint256 public constant internaldecimals139 = 10**24;	//inject NONSTANDARD NAMING

                                                        
    uint256 public constant base691 = 10**18;	//inject NONSTANDARD NAMING

                                                                              
    uint256 public yamsScalingFactor;

    mapping (address => uint256) internal _yamBalances;

    mapping (address => mapping (address => uint256)) internal _allowedFragments;

    uint256 public initSupply;


    // keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");
    bytes32 public constant permit_typehash949 = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;	//inject NONSTANDARD NAMING
    bytes32 public DOMAIN_SEPARATOR;
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             


contract YAMGovernanceStorage {
                                                  
    mapping (address => address) internal _delegates;

                                                                           
    struct Checkpoint {
        uint32 fromBlock;
        uint256 votes;
    }

                                                                        
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;

                                                          
    mapping (address => uint32) public numCheckpoints;

                                                              
    bytes32 public constant domain_typehash824 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                                   
    bytes32 public constant delegation_typehash870 = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");	//inject NONSTANDARD NAMING

                                                                      
    mapping (address => uint) public nonces;
}


contract YAMTokenInterface is YAMTokenStorage, YAMGovernanceStorage {

                                                                           
    event DELEGATECHANGED158(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	//inject NONSTANDARD NAMING

                                                                                     
    event DELEGATEVOTESCHANGED698(address indexed delegate, uint previousBalance, uint newBalance);	//inject NONSTANDARD NAMING

                                                                    
    event REBASE887(uint256 epoch, uint256 prevYamsScalingFactor, uint256 newYamsScalingFactor);	//inject NONSTANDARD NAMING

                        

                                                                       
    event NEWPENDINGGOV210(address oldPendingGov, address newPendingGov);	//inject NONSTANDARD NAMING

                                                                
    event NEWGOV782(address oldGov, address newGov);	//inject NONSTANDARD NAMING

                                                        
    event NEWREBASER361(address oldRebaser, address newRebaser);	//inject NONSTANDARD NAMING

                                                         
    event NEWMIGRATOR303(address oldMigrator, address newMigrator);	//inject NONSTANDARD NAMING

                                                             
    event NEWINCENTIVIZER425(address oldIncentivizer, address newIncentivizer);	//inject NONSTANDARD NAMING

                          

                                                   
    event TRANSFER872(address indexed from, address indexed to, uint amount);	//inject NONSTANDARD NAMING

                                                   
    event APPROVAL111(address indexed owner, address indexed spender, uint amount);	//inject NONSTANDARD NAMING

                          
                                                  
    event MINT127(address to, uint256 amount);	//inject NONSTANDARD NAMING

    // Public functions
    function TRANSFER636(address to, uint256 value) external returns(bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM443(address from, address to, uint256 value) external returns(bool);	//inject NONSTANDARD NAMING
    function BALANCEOF498(address who) external view returns(uint256);	//inject NONSTANDARD NAMING
    function BALANCEOFUNDERLYING811(address who) external view returns(uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE784(address owner_, address spender) external view returns(uint256);	//inject NONSTANDARD NAMING
    function APPROVE524(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function INCREASEALLOWANCE108(address spender, uint256 addedValue) external returns (bool);	//inject NONSTANDARD NAMING
    function DECREASEALLOWANCE413(address spender, uint256 subtractedValue) external returns (bool);	//inject NONSTANDARD NAMING
    function MAXSCALINGFACTOR246() external view returns (uint256);	//inject NONSTANDARD NAMING
    function YAMTOFRAGMENT357(uint256 yam) external view returns (uint256);	//inject NONSTANDARD NAMING
    function FRAGMENTTOYAM248(uint256 value) external view returns (uint256);	//inject NONSTANDARD NAMING

                                  
    function GETPRIORVOTES52(address account, uint blockNumber) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DELEGATEBYSIG200(address delegatee, uint nonce, uint expiry, uint8 v, bytes32 r, bytes32 s) external;	//inject NONSTANDARD NAMING
    function DELEGATE163(address delegatee) external;	//inject NONSTANDARD NAMING
    function DELEGATES81(address delegator) external view returns (address);	//inject NONSTANDARD NAMING
    function GETCURRENTVOTES995(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                               
    function MINT84(address to, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function REBASE408(uint256 epoch, uint256 indexDelta, bool positive) external returns (uint256);	//inject NONSTANDARD NAMING
    function _SETREBASER938(address rebaser_) external;	//inject NONSTANDARD NAMING
    function _SETINCENTIVIZER976(address incentivizer_) external;	//inject NONSTANDARD NAMING
    function _SETPENDINGGOV471(address pendingGov_) external;	//inject NONSTANDARD NAMING
    function _ACCEPTGOV581() external;	//inject NONSTANDARD NAMING
}
interface BAL {
  function GULP583(address token) external;	//inject NONSTANDARD NAMING
}

contract YAMRebaser2 {

    using SafeMath for uint256;

    modifier ONLYGOV315() {	//inject NONSTANDARD NAMING
        require(msg.sender == gov);
        _;
    }

    struct Transaction {
        bool enabled;
        address destination;
        bytes data;
    }

    struct UniVars {
      uint256 yamsToUni;
      uint256 amountFromReserves;
      uint256 mintToReserves;
    }

                                                         
    event TRANSACTIONFAILED642(address indexed destination, uint index, bytes data);	//inject NONSTANDARD NAMING

                                                                  
    event NEWMAXSLIPPAGEFACTOR564(uint256 oldSlippageFactor, uint256 newSlippageFactor);	//inject NONSTANDARD NAMING

                                                                   
    event NEWDEVIATIONTHRESHOLD769(uint256 oldDeviationThreshold, uint256 newDeviationThreshold);	//inject NONSTANDARD NAMING

                                                                          
    event MINTAMOUNT488(uint256 mintAmount);	//inject NONSTANDARD NAMING

                                                                          
    event NEWREBASEMINTPERCENT133(uint256 oldRebaseMintPerc, uint256 newRebaseMintPerc);	//inject NONSTANDARD NAMING


                                                        
    event NEWRESERVECONTRACT196(address oldReserveContract, address newReserveContract);	//inject NONSTANDARD NAMING

                                                        
    event TREASURYINCREASED116(uint256 reservesAdded, uint256 yamsSold, uint256 yamsFromReserves, uint256 yamsToReserves);	//inject NONSTANDARD NAMING


                                                                       
    event NEWPENDINGGOV210(address oldPendingGov, address newPendingGov);	//inject NONSTANDARD NAMING

                                                                
    event NEWGOV782(address oldGov, address newGov);	//inject NONSTANDARD NAMING

    // Stable ordering is not guaranteed.
    Transaction[] public transactions;


                                  
    address public gov;

                                          
    address public pendingGov;

                                                       
    uint256 public rebaseLag;

                          
    uint256 public targetRate;

                                                                            
    uint256 public rebaseMintPerc;

    // If the current exchange rate is within this fractional distance from the target, no supply
    // update is performed. Fixed point number--same format as the rate.
    // (ie) abs(rate - targetRate) / targetRate < deviationThreshold, then no supply change.
    uint256 public deviationThreshold;

                                                                             
    uint256 public minRebaseTimeIntervalSec;

                                                        
    uint256 public lastRebaseTimestampSec;

                                                                                                 
    // For example if minRebaseTimeInterval is 24hrs, it represents the time of day in seconds.
    uint256 public rebaseWindowOffsetSec;

                                                                                                         
    uint256 public rebaseWindowLengthSec;

                                                           
    uint256 public epoch;

    // rebasing is not active initially. It can be activated at T+12 hours from
    // deployment time
                                                       
    bool public rebasingActive;

                                                                  
    uint256 public constant rebasedelay0 = 12 hours;	//inject NONSTANDARD NAMING

                                           
    uint256 public timeOfTWAPInit;

                                 
    address public yamAddress;

                             
    address public reserveToken;

                                       
    address public reservesContract;

                                            
    address public trade_pair;

                                            
    address public eth_usdc_pair;

                                             
    address[] public uniSyncPairs;

                                              
    address[] public balGulpPairs;

                                     
    uint32 public blockTimestampLast;

                                           
    uint256 public priceCumulativeLastYAMETH;

                                           
    uint256 public priceCumulativeLastETHUSDC;


                                                   
    address public public_goods;

                                                                      
    uint256 public public_goods_perc;

    // Max slippage factor when buying reserve token. Magic number based on
    // the fact that uniswap is a constant product. Therefore,
    // targeting a % max slippage can be achieved by using a single precomputed
    // number. i.e. 2.5% slippage is always equal to some f(maxSlippageFactor, reserves)
                                                                     
    uint256 public maxSlippageFactor;

                                                                               
    bool public isToken0;


    uint256 public constant base691 = 10**18;	//inject NONSTANDARD NAMING

    uint256 public constant max_slippage_param720 = 1180339 * 10**11; // max ~20% market impact	//inject NONSTANDARD NAMING

    uint256 public constant max_mint_perc_param712 = 25 * 10**16; // max 25% of rebase can go to treasury	//inject NONSTANDARD NAMING

    constructor(
        address yamAddress_,
        address reserveToken_,
        address factory,
        address reservesContract_,
        address public_goods_,
        uint256 public_goods_perc_
    )
        public
    {
          minRebaseTimeIntervalSec = 12 hours;
          rebaseWindowOffsetSec = 28800; // 8am/8pm UTC rebases

          (address token0, address token1) = SORTTOKENS588(yamAddress_, reserveToken_);

          // used for interacting with uniswap
          if (token0 == yamAddress_) {
              isToken0 = true;
          } else {
              isToken0 = false;
          }
          // uniswap YAM<>Reserve pair
          trade_pair = PAIRFORSUSHI823(factory, token0, token1);


          // get eth_usdc piar
          address USDC = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);

          // USDC < WETH address, so USDC is token0
          eth_usdc_pair = PAIRFORSUSHI823(factory, USDC, reserveToken_);

          // Reserves contract is mutable
          reservesContract = reservesContract_;

          // Reserve token is not mutable. Must deploy a new rebaser to update it
          reserveToken = reserveToken_;

          yamAddress = yamAddress_;

          public_goods = public_goods_;
          public_goods_perc = public_goods_perc_;

          // target 5% slippage
          // ~2.6%
          maxSlippageFactor = 2597836 * 10**10; //5409258 * 10**10;

          // $1
          targetRate = base691;

          // twice daily rebase, with targeting reaching peg in 10 days
          rebaseLag = 20;

          // 10%
          rebaseMintPerc = 10**17;

          // 5%
          deviationThreshold = 5 * 10**16;

          // 60 minutes
          rebaseWindowLengthSec = 60 * 60;

          // Changed in deployment scripts to facilitate protocol initiation
          gov = msg.sender;

    }


    function REMOVEUNIPAIR169(uint256 index) public ONLYGOV315 {	//inject NONSTANDARD NAMING
        if (index >= uniSyncPairs.length) return;

        for (uint i = index; i < uniSyncPairs.length-1; i++){
            uniSyncPairs[i] = uniSyncPairs[i+1];
        }
        uniSyncPairs.length--;
    }

    function REMOVEBALPAIR760(uint256 index) public ONLYGOV315 {	//inject NONSTANDARD NAMING
        if (index >= balGulpPairs.length) return;

        for (uint i = index; i < balGulpPairs.length-1; i++){
            balGulpPairs[i] = balGulpPairs[i+1];
        }
        balGulpPairs.length--;
    }

                                                   
    function ADDSYNCPAIRS638(address[] memory uniSyncPairs_, address[] memory balGulpPairs_)	//inject NONSTANDARD NAMING
        public
        ONLYGOV315
    {
        for (uint256 i = 0; i < uniSyncPairs_.length; i++) {
            uniSyncPairs.push(uniSyncPairs_[i]);
        }

        for (uint256 i = 0; i < balGulpPairs_.length; i++) {
            balGulpPairs.push(balGulpPairs_[i]);
        }
    }

                                                     
    function GETUNISYNCPAIRS775()	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory)
    {
        address[] memory pairs = uniSyncPairs;
        return pairs;
    }

                                                     
    function GETBALGULPPAIRS292()	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory)
    {
        address[] memory pairs = balGulpPairs;
        return pairs;
    }



                                                                                                              
    function SETMAXSLIPPAGEFACTOR157(uint256 maxSlippageFactor_)	//inject NONSTANDARD NAMING
        public
        ONLYGOV315
    {
        require(maxSlippageFactor_ < max_slippage_param720);
        uint256 oldSlippageFactor = maxSlippageFactor;
        maxSlippageFactor = maxSlippageFactor_;
        emit NEWMAXSLIPPAGEFACTOR564(oldSlippageFactor, maxSlippageFactor_);
    }

                                                                                                                         
    function SETREBASEMINTPERC666(uint256 rebaseMintPerc_)	//inject NONSTANDARD NAMING
        public
        ONLYGOV315
    {
        require(rebaseMintPerc_ < max_mint_perc_param712);
        uint256 oldPerc = rebaseMintPerc;
        rebaseMintPerc = rebaseMintPerc_;
        emit NEWREBASEMINTPERCENT133(oldPerc, rebaseMintPerc_);
    }


                                                                                                               
    function SETRESERVECONTRACT593(address reservesContract_)	//inject NONSTANDARD NAMING
        public
        ONLYGOV315
    {
        address oldReservesContract = reservesContract;
        reservesContract = reservesContract_;
        emit NEWRESERVECONTRACT196(oldReservesContract, reservesContract_);
    }


                                                                                                                                    
    function _SETPENDINGGOV471(address pendingGov_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV315
    {
        address oldPendingGov = pendingGov;
        pendingGov = pendingGov_;
        emit NEWPENDINGGOV210(oldPendingGov, pendingGov_);
    }

                                                                
    function _ACCEPTGOV581()	//inject NONSTANDARD NAMING
        external
    {
        require(msg.sender == pendingGov, "!pending");
        address oldGov = gov;
        gov = pendingGov;
        pendingGov = address(0);
        emit NEWGOV782(oldGov, gov);
    }

                                                                                           
    function INIT_TWAP314()	//inject NONSTANDARD NAMING
        public
    {
        require(timeOfTWAPInit == 0, "already activated");
        (uint priceCumulative, uint32 blockTimestamp) =
           UniswapV2OracleLibrary.CURRENTCUMULATIVEPRICES778(trade_pair, isToken0);

       (uint priceCumulativeUSDC, ) =
          UniswapV2OracleLibrary.CURRENTCUMULATIVEPRICES778(eth_usdc_pair, false);

        require(blockTimestamp > 0, "no trades");
        blockTimestampLast = blockTimestamp;
        priceCumulativeLastYAMETH = priceCumulative;
        priceCumulativeLastETHUSDC = priceCumulativeUSDC;
        timeOfTWAPInit = blockTimestamp;
    }

                                                                                                             
    function ACTIVATE_REBASING697()	//inject NONSTANDARD NAMING
        public
    {
        require(timeOfTWAPInit > 0, "twap wasnt intitiated, call init_twap()");
        // cannot enable prior to end of rebaseDelay
        require(now >= timeOfTWAPInit + rebasedelay0, "!end_delay");

        rebasingActive = true;
    }

                                                                                                                                                                                                                                                                                                                                                
    function REBASE408()	//inject NONSTANDARD NAMING
        public
    {
        // EOA only or gov
        require(msg.sender == tx.origin, "!EOA");
        // ensure rebasing at correct time
        _INREBASEWINDOW467();

        // This comparison also ensures there is no reentrancy.
        require(lastRebaseTimestampSec.ADD228(minRebaseTimeIntervalSec) < now);

        // Snap the rebase time to the start of this window.
        lastRebaseTimestampSec = now.SUB219(
            now.MOD880(minRebaseTimeIntervalSec)).ADD228(rebaseWindowOffsetSec);

        epoch = epoch.ADD228(1);

        // get twap from uniswap v2;
        uint256 exchangeRate = GETTWAP56();

        // calculates % change to supply
        (uint256 offPegPerc, bool positive) = COMPUTEOFFPEGPERC635(exchangeRate);

        uint256 indexDelta = offPegPerc;

        // Apply the Dampening factor.
        indexDelta = indexDelta.DIV440(rebaseLag);

        YAMTokenInterface yam = YAMTokenInterface(yamAddress);

        if (positive) {
            require(yam.yamsScalingFactor().MUL882(base691.ADD228(indexDelta)).DIV440(base691) < yam.MAXSCALINGFACTOR246(), "new scaling factor will be too big");
        }


        uint256 currSupply = yam.totalSupply();

        uint256 mintAmount;
        // reduce indexDelta to account for minting
        if (positive) {
            uint256 mintPerc = indexDelta.MUL882(rebaseMintPerc).DIV440(base691);
            indexDelta = indexDelta.SUB219(mintPerc);
            mintAmount = currSupply.MUL882(mintPerc).DIV440(base691);
        }

        // rebase
        // ignore returned var
        yam.REBASE408(epoch, indexDelta, positive);

        // perform actions after rebase
        emit MINTAMOUNT488(mintAmount);
        AFTERREBASE634(mintAmount, offPegPerc);
    }


    function UNISWAPV2CALL967(	//inject NONSTANDARD NAMING
        address sender,
        uint256 amount0,
        uint256 amount1,
        bytes memory data
    )
        public
    {
        // enforce that it is coming from uniswap
        require(msg.sender == trade_pair, "bad msg.sender");
        // enforce that this contract called uniswap
        require(sender == address(this), "bad origin");
        (UniVars memory uniVars) = abi.decode(data, (UniVars));

        YAMTokenInterface yam = YAMTokenInterface(yamAddress);

        if (uniVars.amountFromReserves > 0) {
            // transfer from reserves and mint to uniswap
            yam.TRANSFERFROM443(reservesContract, trade_pair, uniVars.amountFromReserves);
            if (uniVars.amountFromReserves < uniVars.yamsToUni) {
                // if the amount from reserves > yamsToUni, we have fully paid for the yCRV tokens
                // thus this number would be 0 so no need to mint
                yam.MINT84(trade_pair, uniVars.yamsToUni.SUB219(uniVars.amountFromReserves));
            }
        } else {
            // mint to uniswap
            yam.MINT84(trade_pair, uniVars.yamsToUni);
        }

        // mint unsold to mintAmount
        if (uniVars.mintToReserves > 0) {
            yam.MINT84(reservesContract, uniVars.mintToReserves);
        }

        // transfer reserve token to reserves
        if (isToken0) {
            if (public_goods != address(0) && public_goods_perc > 0) {
                uint256 amount_to_public_goods = amount1.MUL882(public_goods_perc).DIV440(base691);
                SafeERC20.SAFETRANSFER759(IERC20(reserveToken), reservesContract, amount1.SUB219(amount_to_public_goods));
                SafeERC20.SAFETRANSFER759(IERC20(reserveToken), public_goods, amount_to_public_goods);
                emit TREASURYINCREASED116(
                    amount1.SUB219(amount_to_public_goods),
                    uniVars.yamsToUni,
                    uniVars.amountFromReserves,
                    uniVars.mintToReserves
                );
            } else {
                SafeERC20.SAFETRANSFER759(IERC20(reserveToken), reservesContract, amount1);
                emit TREASURYINCREASED116(
                    amount1,
                    uniVars.yamsToUni,
                    uniVars.amountFromReserves,
                    uniVars.mintToReserves
                );
            }
        } else {
          if (public_goods != address(0) && public_goods_perc > 0) {
              uint256 amount_to_public_goods = amount0.MUL882(public_goods_perc).DIV440(base691);
              SafeERC20.SAFETRANSFER759(IERC20(reserveToken), reservesContract, amount0.SUB219(amount_to_public_goods));
              SafeERC20.SAFETRANSFER759(IERC20(reserveToken), public_goods, amount_to_public_goods);
              emit TREASURYINCREASED116(
                  amount0.SUB219(amount_to_public_goods),
                  uniVars.yamsToUni,
                  uniVars.amountFromReserves,
                  uniVars.mintToReserves
              );
          } else {
              SafeERC20.SAFETRANSFER759(IERC20(reserveToken), reservesContract, amount0);
              emit TREASURYINCREASED116(
                  amount0,
                  uniVars.yamsToUni,
                  uniVars.amountFromReserves,
                  uniVars.mintToReserves
              );
          }
        }
    }

    function BUYRESERVEANDTRANSFER378(	//inject NONSTANDARD NAMING
        uint256 mintAmount,
        uint256 offPegPerc
    )
        internal
    {
        UniswapPair pair = UniswapPair(trade_pair);

        YAMTokenInterface yam = YAMTokenInterface(yamAddress);

        // get reserves
        (uint256 token0Reserves, uint256 token1Reserves, ) = pair.GETRESERVES698();

        // check if protocol has excess yam in the reserve
        uint256 excess = yam.BALANCEOF498(reservesContract);


        uint256 tokens_to_max_slippage = UNISWAPMAXSLIPPAGE635(token0Reserves, token1Reserves, offPegPerc);

        UniVars memory uniVars = UniVars({
          yamsToUni: tokens_to_max_slippage, // how many yams uniswap needs
          amountFromReserves: excess, // how much of yamsToUni comes from reserves
          mintToReserves: 0 // how much yams protocol mints to reserves
        });

        // tries to sell all mint + excess
        // falls back to selling some of mint and all of excess
        // if all else fails, sells portion of excess
        // upon pair.swap, `uniswapV2Call` is called by the uniswap pair contract
        if (isToken0) {
            if (tokens_to_max_slippage > mintAmount.ADD228(excess)) {
                // we already have performed a safemath check on mintAmount+excess
                // so we dont need to continue using it in this code path

                // can handle selling all of reserves and mint
                uint256 buyTokens = GETAMOUNTOUT625(mintAmount + excess, token0Reserves, token1Reserves);
                uniVars.yamsToUni = mintAmount + excess;
                uniVars.amountFromReserves = excess;
                // call swap using entire mint amount and excess; mint 0 to reserves
                pair.SWAP739(0, buyTokens, address(this), abi.encode(uniVars));
            } else {
                if (tokens_to_max_slippage > excess) {
                    // uniswap can handle entire reserves
                    uint256 buyTokens = GETAMOUNTOUT625(tokens_to_max_slippage, token0Reserves, token1Reserves);

                    // swap up to slippage limit, taking entire yam reserves, and minting part of total
                    uniVars.mintToReserves = mintAmount.SUB219((tokens_to_max_slippage - excess));
                    pair.SWAP739(0, buyTokens, address(this), abi.encode(uniVars));
                } else {
                    // uniswap cant handle all of excess
                    uint256 buyTokens = GETAMOUNTOUT625(tokens_to_max_slippage, token0Reserves, token1Reserves);
                    uniVars.amountFromReserves = tokens_to_max_slippage;
                    uniVars.mintToReserves = mintAmount;
                    // swap up to slippage limit, taking excess - remainingExcess from reserves, and minting full amount
                    // to reserves
                    pair.SWAP739(0, buyTokens, address(this), abi.encode(uniVars));
                }
            }
        } else {
            if (tokens_to_max_slippage > mintAmount.ADD228(excess)) {
                // can handle all of reserves and mint
                uint256 buyTokens = GETAMOUNTOUT625(mintAmount + excess, token1Reserves, token0Reserves);
                uniVars.yamsToUni = mintAmount + excess;
                uniVars.amountFromReserves = excess;
                // call swap using entire mint amount and excess; mint 0 to reserves
                pair.SWAP739(buyTokens, 0, address(this), abi.encode(uniVars));
            } else {
                if (tokens_to_max_slippage > excess) {
                    // uniswap can handle entire reserves
                    uint256 buyTokens = GETAMOUNTOUT625(tokens_to_max_slippage, token1Reserves, token0Reserves);

                    // swap up to slippage limit, taking entire yam reserves, and minting part of total
                    uniVars.mintToReserves = mintAmount.SUB219( (tokens_to_max_slippage - excess) );
                    pair.SWAP739(buyTokens, 0, address(this), abi.encode(uniVars));
                } else {
                    // uniswap cant handle all of excess
                    uint256 buyTokens = GETAMOUNTOUT625(tokens_to_max_slippage, token1Reserves, token0Reserves);
                    uniVars.amountFromReserves = tokens_to_max_slippage;
                    uniVars.mintToReserves = mintAmount;
                    // swap up to slippage limit, taking excess - remainingExcess from reserves, and minting full amount
                    // to reserves
                    pair.SWAP739(buyTokens, 0, address(this), abi.encode(uniVars));
                }
            }
        }
    }

    function UNISWAPMAXSLIPPAGE635(	//inject NONSTANDARD NAMING
        uint256 token0,
        uint256 token1,
        uint256 offPegPerc
    )
      internal
      view
      returns (uint256)
    {
        if (isToken0) {
          if (offPegPerc >= 10**17) {
              // cap slippage
              return token0.MUL882(maxSlippageFactor).DIV440(base691);
          } else {
              // in the 5-10% off peg range, slippage is essentially 2*x (where x is percentage of pool to buy).
              // all we care about is not pushing below the peg, so underestimate
              // the amount we can sell by dividing by 3. resulting price impact
              // should be ~= offPegPerc * 2 / 3, which will keep us above the peg
              //
              // this is a conservative heuristic
              return token0.MUL882(offPegPerc).DIV440(3 * base691);
          }
        } else {
            if (offPegPerc >= 10**17) {
                return token1.MUL882(maxSlippageFactor).DIV440(base691);
            } else {
                return token1.MUL882(offPegPerc).DIV440(3 * base691);
            }
        }
    }

                                                                                                                                                                                                                                                                                                                        

   function GETAMOUNTOUT625(	//inject NONSTANDARD NAMING
        uint amountIn,
        uint reserveIn,
        uint reserveOut
    )
        internal
        pure
        returns (uint amountOut)
    {
       require(amountIn > 0, 'UniswapV2Library: INSUFFICIENT_INPUT_AMOUNT');
       require(reserveIn > 0 && reserveOut > 0, 'UniswapV2Library: INSUFFICIENT_LIQUIDITY');
       uint amountInWithFee = amountIn.MUL882(997);
       uint numerator = amountInWithFee.MUL882(reserveOut);
       uint denominator = reserveIn.MUL882(1000).ADD228(amountInWithFee);
       amountOut = numerator / denominator;
   }


    function AFTERREBASE634(	//inject NONSTANDARD NAMING
        uint256 mintAmount,
        uint256 offPegPerc
    )
        internal
    {
        // update uniswap pairs
        for (uint256 i = 0; i < uniSyncPairs.length; i++) {
            UniswapPair(uniSyncPairs[i]).SYNC705();
        }

        // update balancer pairs
        for (uint256 i = 0; i < balGulpPairs.length; i++) {
            BAL(balGulpPairs[i]).GULP583(yamAddress);
        }


        if (mintAmount > 0) {
            BUYRESERVEANDTRANSFER378(
                mintAmount,
                offPegPerc
            );
        }

        // call any extra functions
        for (uint i = 0; i < transactions.length; i++) {
            Transaction storage t = transactions[i];
            if (t.enabled) {
                bool result =
                    EXTERNALCALL900(t.destination, t.data);
                if (!result) {
                    emit TRANSACTIONFAILED642(t.destination, i, t.data);
                    revert("Transaction Failed");
                }
            }
        }
    }


                                                                                                                                                                                                                                                                                                                                                                                                                             
    function GETTWAP56()	//inject NONSTANDARD NAMING
        internal
        returns (uint256)
    {
        (uint priceCumulative, uint32 blockTimestamp) =
            UniswapV2OracleLibrary.CURRENTCUMULATIVEPRICES778(trade_pair, isToken0);
        (uint priceCumulativeETH, ) =
            UniswapV2OracleLibrary.CURRENTCUMULATIVEPRICES778(eth_usdc_pair, false);
        uint32 timeElapsed = blockTimestamp - blockTimestampLast; // overflow is desired

        // no period check as is done in isRebaseWindow


        // overflow is desired
        uint256 priceAverageYAMETH = uint256(uint224((priceCumulative - priceCumulativeLastYAMETH) / timeElapsed));
        uint256 priceAverageETHUSDC = uint256(uint224((priceCumulativeETH - priceCumulativeLastETHUSDC) / timeElapsed));

        priceCumulativeLastYAMETH = priceCumulative;
        priceCumulativeLastETHUSDC = priceCumulativeETH;
        blockTimestampLast = blockTimestamp;

        // BASE is on order of 1e18, which takes 2^60 bits
        // multiplication will revert if priceAverage > 2^196
        // (which it can because it overflows intentially)
        uint256 YAMETHprice;
        uint256 ETHprice;
        if (priceAverageYAMETH > uint192(-1)) {
           // eat loss of precision
           // effectively: (x / 2**112) * 1e18
           YAMETHprice = (priceAverageYAMETH >> 112) * base691;
        } else {
            // cant overflow
            // effectively: (x * 1e18 / 2**112)
            YAMETHprice = (priceAverageYAMETH * base691) >> 112;
        }


        if (priceAverageETHUSDC > uint192(-1)) {
            ETHprice = (priceAverageETHUSDC >> 112) * base691;
        } else {
            ETHprice = (priceAverageETHUSDC * base691) >> 112;
        }


        return YAMETHprice.MUL882(ETHprice).DIV440(10**6);
    }

                                                                          
    function GETCURRENTTWAP763()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256)
    {
        (uint priceCumulative, uint32 blockTimestamp) =
           UniswapV2OracleLibrary.CURRENTCUMULATIVEPRICES778(trade_pair, isToken0);
        (uint priceCumulativeETH, ) =
           UniswapV2OracleLibrary.CURRENTCUMULATIVEPRICES778(eth_usdc_pair, false);

        uint32 timeElapsed = blockTimestamp - blockTimestampLast; // overflow is desired

       // no period check as is done in isRebaseWindow

       uint256 priceAverageYAMETH = uint256(uint224((priceCumulative - priceCumulativeLastYAMETH) / timeElapsed));
       uint256 priceAverageETHUSDC = uint256(uint224((priceCumulativeETH - priceCumulativeLastETHUSDC) / timeElapsed));

       // BASE is on order of 1e18, which takes 2^60 bits
       // multiplication will revert if priceAverage > 2^196
       // (which it can because it overflows intentially)
       uint256 YAMETHprice;
       uint256 ETHprice;
       if (priceAverageYAMETH > uint192(-1)) {
          // eat loss of precision
          // effectively: (x / 2**112) * 1e18
          YAMETHprice = (priceAverageYAMETH >> 112) * base691;
       } else {
         // cant overflow
         // effectively: (x * 1e18 / 2**112)
         YAMETHprice = (priceAverageYAMETH * base691) >> 112;
       }


       if (priceAverageETHUSDC > uint192(-1)) {
          ETHprice = (priceAverageETHUSDC >> 112) * base691;
       } else {
          ETHprice = (priceAverageETHUSDC * base691) >> 112;
       }


       return YAMETHprice.MUL882(ETHprice).DIV440(10**6);
    }

                                                                                                                                                                                                                                                                                                                              
    function SETDEVIATIONTHRESHOLD676(uint256 deviationThreshold_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV315
    {
        require(deviationThreshold > 0);
        uint256 oldDeviationThreshold = deviationThreshold;
        deviationThreshold = deviationThreshold_;
        emit NEWDEVIATIONTHRESHOLD769(oldDeviationThreshold, deviationThreshold_);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function SETREBASELAG267(uint256 rebaseLag_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV315
    {
        require(rebaseLag_ > 0);
        rebaseLag = rebaseLag_;
    }

                                                                                                                      
    function SETTARGETRATE456(uint256 targetRate_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV315
    {
        require(targetRate_ > 0);
        targetRate = targetRate_;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function SETREBASETIMINGPARAMETERS938(	//inject NONSTANDARD NAMING
        uint256 minRebaseTimeIntervalSec_,
        uint256 rebaseWindowOffsetSec_,
        uint256 rebaseWindowLengthSec_)
        external
        ONLYGOV315
    {
        require(minRebaseTimeIntervalSec_ > 0);
        require(rebaseWindowOffsetSec_ < minRebaseTimeIntervalSec_);
        require(rebaseWindowOffsetSec_ + rebaseWindowLengthSec_ < minRebaseTimeIntervalSec_);
        minRebaseTimeIntervalSec = minRebaseTimeIntervalSec_;
        rebaseWindowOffsetSec = rebaseWindowOffsetSec_;
        rebaseWindowLengthSec = rebaseWindowLengthSec_;
    }

                                                                                                                                                        
    function INREBASEWINDOW676() public view returns (bool) {	//inject NONSTANDARD NAMING

        // rebasing is delayed until there is a liquid market
        _INREBASEWINDOW467();
        return true;
    }

    function _INREBASEWINDOW467() internal view {	//inject NONSTANDARD NAMING

        // rebasing is delayed until there is a liquid market
        require(rebasingActive, "rebasing not active");

        require(now.MOD880(minRebaseTimeIntervalSec) >= rebaseWindowOffsetSec, "too early");
        require(now.MOD880(minRebaseTimeIntervalSec) < (rebaseWindowOffsetSec.ADD228(rebaseWindowLengthSec)), "too late");
    }

                                                                           
    function COMPUTEOFFPEGPERC635(uint256 rate)	//inject NONSTANDARD NAMING
        private
        view
        returns (uint256, bool)
    {
        if (WITHINDEVIATIONTHRESHOLD540(rate)) {
            return (0, false);
        }

        // indexDelta =  (rate - targetRate) / targetRate
        if (rate > targetRate) {
            return (rate.SUB219(targetRate).MUL882(base691).DIV440(targetRate), true);
        } else {
            return (targetRate.SUB219(rate).MUL882(base691).DIV440(targetRate), false);
        }
    }

                                                                                                                                                                                                                                         
    function WITHINDEVIATIONTHRESHOLD540(uint256 rate)	//inject NONSTANDARD NAMING
        private
        view
        returns (bool)
    {
        uint256 absoluteDeviationThreshold = targetRate.MUL882(deviationThreshold)
            .DIV440(10 ** 18);

        return (rate >= targetRate && rate.SUB219(targetRate) < absoluteDeviationThreshold)
            || (rate < targetRate && targetRate.SUB219(rate) < absoluteDeviationThreshold);
    }

                                 

    // calculates the CREATE2 address for a pair without making any external calls
    function PAIRFOR448(	//inject NONSTANDARD NAMING
        address factory,
        address token0,
        address token1
    )
        internal
        pure
        returns (address pair)
    {
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f' // init code hash
            ))));
    }

    function PAIRFORSUSHI823(	//inject NONSTANDARD NAMING
        address factory,
        address tokenA,
        address tokenB
    )
        internal
        pure
        returns (address pair)
    {
        (address token0, address token1) = SORTTOKENS588(tokenA, tokenB);
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'e18a34eb0e04b04f7a0ac29a6e80748dca96319b42c54d679cb821dca90c6303' // init code hash
            ))));
    }

    // returns sorted token addresses, used to handle return values from pairs sorted in this order
    function SORTTOKENS588(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB
    )
        internal
        pure
        returns (address token0, address token1)
    {
        require(tokenA != tokenB, 'UniswapV2Library: IDENTICAL_ADDRESSES');
        (token0, token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'UniswapV2Library: ZERO_ADDRESS');
    }

                              

                                                                                                                                                                                                             
    function ADDTRANSACTION491(address destination, bytes calldata data)	//inject NONSTANDARD NAMING
        external
        ONLYGOV315
    {
        transactions.push(Transaction({
            enabled: true,
            destination: destination,
            data: data
        }));
    }


                                                                                                                                           
    function REMOVETRANSACTION355(uint index)	//inject NONSTANDARD NAMING
        external
        ONLYGOV315
    {
        require(index < transactions.length, "index out of bounds");

        if (index < transactions.length - 1) {
            transactions[index] = transactions[transactions.length - 1];
        }

        transactions.length--;
    }

                                                                                                                                                                         
    function SETTRANSACTIONENABLED340(uint index, bool enabled)	//inject NONSTANDARD NAMING
        external
        ONLYGOV315
    {
        require(index < transactions.length, "index must be in range of stored tx list");
        transactions[index].enabled = enabled;
    }

                                                                                                                                                                                                                                    
    function EXTERNALCALL900(address destination, bytes memory data)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        bool result;
        assembly {  // solhint-disable-line no-inline-assembly
            // "Allocate" memory for output
            // (0x40 is where "free memory" pointer is stored by convention)
            let outputAddress := mload(0x40)

            // First 32 bytes are the padded length of data, so exclude that
            let dataAddress := add(data, 32)

            result := call(
                // 34710 is the value that solidity is currently emitting
                // It includes callGas (700) + callVeryLow (3, to pay for SUB)
                // + callValueTransferGas (9000) + callNewAccountGas
                // (25000, in case the destination address does not exist and needs creating)
                sub(gas, 34710),


                destination,
                0, // transfer value in wei
                dataAddress,
                mload(data),  // Size of the input, in bytes. Stored in position 0 of the array.
                outputAddress,
                0  // Output is ignored, therefore the output size is zero
            )
        }
        return result;
    }


    // Rescue tokens
    function RESCUETOKENS268(	//inject NONSTANDARD NAMING
        address token,
        address to,
        uint256 amount
    )
        external
        ONLYGOV315
        returns (bool)
    {
        // transfer to
        SafeERC20.SAFETRANSFER759(IERC20(token), to, amount);
    }
}