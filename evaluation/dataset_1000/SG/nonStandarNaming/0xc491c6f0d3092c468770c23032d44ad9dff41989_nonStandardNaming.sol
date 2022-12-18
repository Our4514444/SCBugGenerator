                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY697() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF92(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER790(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE477(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE552(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM791(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER492(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL295(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD519(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB607(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB607(a, b, "SafeMath: subtraction overflow");
    }
    function SUB607(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL902(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV320(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV320(a, b, "SafeMath: division by zero");
    }
    function DIV320(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD396(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD396(a, b, "SafeMath: modulo by zero");
    }
    function MOD396(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT754(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE110(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE929(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER388(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN511(token, abi.encodeWithSelector(token.TRANSFER790.selector, to, value));
    }

    function SAFETRANSFERFROM524(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN511(token, abi.encodeWithSelector(token.TRANSFERFROM791.selector, from, to, value));
    }

    function SAFEAPPROVE300(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE477(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN511(token, abi.encodeWithSelector(token.APPROVE552.selector, spender, value));
    }
    function CALLOPTIONALRETURN511(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT754(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface VestingEscrow {
    function CLAIM705(address) external;	//inject NONSTANDARD NAMING
}

interface VestingStrategy {
    function WITHDRAW53(address) external;	//inject NONSTANDARD NAMING
}

contract VestingVault {
    using SafeERC20 for IERC20;
    
    VestingEscrow public constant escrow360 = VestingEscrow(0x575CCD8e2D300e2377B43478339E364000318E2c);	//inject NONSTANDARD NAMING
    address public constant crv974 = address(0xD533a949740bb3306d119CC777fa900bA034cd52);	//inject NONSTANDARD NAMING
    address public constant crvvault228 = address(0xF147b8125d2ef93FB6965Db97D6746952a133934);	//inject NONSTANDARD NAMING
    address[] public vaults = [0x8816B2Fb982281c36E6c535B9e56B7a4417e68cF,
                                0xBE197E668D13746BB92E675dEa2868FF14dA0b73,
                                0x2De055fec2b826ed4A7478CeDDBefF82C1EdFA70];
    
    function CLAIM705() public {	//inject NONSTANDARD NAMING
        for(uint i = 0; i < vaults.length; i++) {
            escrow360.CLAIM705(vaults[0]);
            VestingStrategy(vaults[0]).WITHDRAW53(crv974);
        }
        uint _balance = IERC20(crv974).BALANCEOF92(address(this));
        IERC20(crv974).SAFETRANSFER388(crvvault228, _balance);
    }
    
    constructor() public {}
}