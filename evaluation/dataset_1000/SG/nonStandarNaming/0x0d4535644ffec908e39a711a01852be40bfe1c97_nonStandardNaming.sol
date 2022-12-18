pragma solidity 0.5.4;

library SafeMath {
                                                                                  
    function MUL532(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV516(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB204(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD444(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD61(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

interface IERC20 {
    function TRANSFER722(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE957(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM769(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY362() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF597(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE817(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER513(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL610(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER222(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN619(token, abi.encodeWithSelector(token.TRANSFER722.selector, to, value));
    }

    function SAFETRANSFERFROM739(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN619(token, abi.encodeWithSelector(token.TRANSFERFROM769.selector, from, to, value));
    }

    function SAFEAPPROVE634(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require((value == 0) || (token.ALLOWANCE817(address(this), spender) == 0));
        CALLOPTIONALRETURN619(token, abi.encodeWithSelector(token.APPROVE957.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE876(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE817(address(this), spender).ADD444(value);
        CALLOPTIONALRETURN619(token, abi.encodeWithSelector(token.APPROVE957.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE898(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE817(address(this), spender).SUB204(value);
        CALLOPTIONALRETURN619(token, abi.encodeWithSelector(token.APPROVE957.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                      
    function CALLOPTIONALRETURN619(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.

        require(address(token).ISCONTRACT966());

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success);

        if (returndata.length > 0) { // Return data is optional
            require(abi.decode(returndata, (bool)));
        }
    }
}

library Address {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT966(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

contract ReentrancyGuard {
                                                                       
    uint256 private _guardCounter;

    constructor () internal {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT809() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter);
    }
}

contract KyberNetworkProxyInterface {
  function GETEXPECTEDRATE868(IERC20 src, IERC20 dest, uint256 srcQty) public view returns (uint256 expectedRate, uint256 slippageRate);	//inject NONSTANDARD NAMING
  function TRADE866(IERC20 src, uint256 srcAmount, IERC20 dest, address destAddress, uint256 maxDestAmount, uint256 minConversionRate, address walletId) public payable returns(uint256);	//inject NONSTANDARD NAMING
}

contract LandRegistryProxyInterface {
  function OWNER372() public view returns (address);	//inject NONSTANDARD NAMING
}

contract PaymentsLayer is ReentrancyGuard {
  using SafeERC20 for IERC20;
  using SafeMath for uint256;

  address public constant eth_token_address651 = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;	//inject NONSTANDARD NAMING
  KyberNetworkProxyInterface public constant kyber_network_proxy21 = KyberNetworkProxyInterface(0x818E6FECD516Ecc3849DAf6845e3EC868087B755);	//inject NONSTANDARD NAMING
  LandRegistryProxyInterface public constant land_registry_proxy748 = LandRegistryProxyInterface(0xe72AD2A335AE18e6C7cdb6dAEB64b0330883CD56);  // 0x0f5Ea0A652E851678Ebf77B69484bFcD31F9459B;	//inject NONSTANDARD NAMING

  event PAYMENTFORWARDED491(IERC20 indexed src, uint256 srcAmount, IERC20 indexed dest, address indexed destAddress, uint256 destAmount);	//inject NONSTANDARD NAMING

  function FORWARDPAYMENT637(IERC20 src, uint256 srcAmount, IERC20 dest, address destAddress, uint256 minConversionRate, uint256 minDestAmount, bytes memory encodedFunctionCall) public NONREENTRANT809 payable returns(uint256) {	//inject NONSTANDARD NAMING
    if (address(src) != eth_token_address651) {
      require(msg.value == 0);
      src.SAFETRANSFERFROM739(msg.sender, address(this), srcAmount);
      src.SAFEAPPROVE634(address(kyber_network_proxy21), srcAmount);
    }

    uint256 destAmount = kyber_network_proxy21.TRADE866.value((address(src) == eth_token_address651) ? srcAmount : 0)(src, srcAmount, dest, address(this), ~uint256(0), minConversionRate, land_registry_proxy748.OWNER372());
    require(destAmount >= minDestAmount);
    if (address(dest) != eth_token_address651)
      dest.SAFEAPPROVE634(destAddress, destAmount);

    (bool success, ) = destAddress.call.value((address(dest) == eth_token_address651) ? destAmount : 0)(encodedFunctionCall);
    require(success, "dest call failed");

    emit PAYMENTFORWARDED491(src, srcAmount, dest, destAddress, destAmount);
    return destAmount;
  }
}