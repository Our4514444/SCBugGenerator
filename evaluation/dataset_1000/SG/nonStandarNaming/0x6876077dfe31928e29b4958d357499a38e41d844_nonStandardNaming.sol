                                                                 

                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY663() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF881(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER498(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE709(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS679() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE47(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM165(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER344(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL605(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD857(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB42(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB42(a, b, "SafeMath: subtraction overflow");
    }
    function SUB42(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL8(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV386(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV386(a, b, "SafeMath: division by zero");
    }
    function DIV386(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD381(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD381(a, b, "SafeMath: modulo by zero");
    }
    function MOD381(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT830(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE505(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE352(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER152(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN794(token, abi.encodeWithSelector(token.TRANSFER498.selector, to, value));
    }

    function SAFETRANSFERFROM345(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN794(token, abi.encodeWithSelector(token.TRANSFERFROM165.selector, from, to, value));
    }

    function SAFEAPPROVE694(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE709(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN794(token, abi.encodeWithSelector(token.APPROVE47.selector, spender, value));
    }
    function CALLOPTIONALRETURN794(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT830(), "SafeERC20: call to non-contract");

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
    function VAULTS498(address) external view returns (address);	//inject NONSTANDARD NAMING
}

interface Vault {
    function DEPOSIT607(uint) external;	//inject NONSTANDARD NAMING
    function WITHDRAW41(uint) external;	//inject NONSTANDARD NAMING
    function GETPRICEPERFULLSHARE204() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface Aave {
    function BORROW94(address _reserve, uint _amount, uint _interestRateModel, uint16 _referralCode) external;	//inject NONSTANDARD NAMING
    function SETUSERUSERESERVEASCOLLATERAL643(address _reserve, bool _useAsCollateral) external;	//inject NONSTANDARD NAMING
    function REPAY762(address _reserve, uint _amount, address payable _onBehalfOf) external payable;	//inject NONSTANDARD NAMING
    function GETUSERACCOUNTDATA988(address _user)	//inject NONSTANDARD NAMING
        external
        view
        returns (
            uint totalLiquidityETH,
            uint totalCollateralETH,
            uint totalBorrowsETH,
            uint totalFeesETH,
            uint availableBorrowsETH,
            uint currentLiquidationThreshold,
            uint ltv,
            uint healthFactor
        );
    function GETUSERRESERVEDATA838(address _reserve, address _user)	//inject NONSTANDARD NAMING
        external
        view
        returns (
            uint currentATokenBalance,
            uint currentBorrowBalance,
            uint principalBorrowBalance,
            uint borrowRateMode,
            uint borrowRate,
            uint liquidityRate,
            uint originationFee,
            uint variableBorrowIndex,
            uint lastUpdateTimestamp,
            bool usageAsCollateralEnabled
        );
}

interface LendingPoolAddressesProvider {
    function GETLENDINGPOOL410() external view returns (address);	//inject NONSTANDARD NAMING
    function GETLENDINGPOOLCORE665() external view returns (address);	//inject NONSTANDARD NAMING
    function GETPRICEORACLE581() external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

contract StrategyVaultUSDC {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want690 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);	//inject NONSTANDARD NAMING
    address constant public vault58 = address(0x597aD1e0c13Bfe8025993D9e79C69E1c0233522e);	//inject NONSTANDARD NAMING
    
    address public constant aave522 = address(0x24a42fD28C976A61Df5D00D0599C34c4f90748c8);	//inject NONSTANDARD NAMING

    address public governance;
    address public controller;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function DEPOSIT607() external {	//inject NONSTANDARD NAMING
        uint _balance = IERC20(want690).BALANCEOF881(address(this));
        if (_balance > 0) {
            IERC20(want690).SAFEAPPROVE694(address(vault58), 0);
            IERC20(want690).SAFEAPPROVE694(address(vault58), _balance);
            Vault(vault58).DEPOSIT607(_balance);
        }
    }
    
    function GETAAVE700() public view returns (address) {	//inject NONSTANDARD NAMING
        return LendingPoolAddressesProvider(aave522).GETLENDINGPOOL410();
    }
    
    function GETNAME816() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyVaultUSDC";
    }
    
    function DEBT876() external view returns (uint) {	//inject NONSTANDARD NAMING
        (,uint currentBorrowBalance,,,,,,,,) = Aave(GETAAVE700()).GETUSERRESERVEDATA838(want690, Controller(controller).VAULTS498(address(this)));
        return currentBorrowBalance;
    }
    
    function HAVE86() public view returns (uint) {	//inject NONSTANDARD NAMING
        uint _have = BALANCEOF881();
        return _have;
    }
    
    function SKIMMABLE184() public view returns (uint) {	//inject NONSTANDARD NAMING
        (,uint currentBorrowBalance,,,,,,,,) = Aave(GETAAVE700()).GETUSERRESERVEDATA838(want690, Controller(controller).VAULTS498(address(this)));
        uint _have = HAVE86();
        if (_have > currentBorrowBalance) {
            return _have.SUB42(currentBorrowBalance);
        } else {
            return 0;
        }
    }
    
    function SKIM632() external {	//inject NONSTANDARD NAMING
        uint _balance = IERC20(want690).BALANCEOF881(address(this));
        uint _amount = SKIMMABLE184();
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME982(_amount.SUB42(_balance));
            _amount = _amount.ADD857(_balance);
        } 
        IERC20(want690).SAFETRANSFER152(controller, _amount);
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW41(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(address(_asset) != address(want690), "!want");
        balance = _asset.BALANCEOF881(address(this));
        _asset.SAFETRANSFER152(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW41(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want690).BALANCEOF881(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME982(_amount.SUB42(_balance));
            _amount = _amount.ADD857(_balance);
        }
        address _vault = Controller(controller).VAULTS498(address(this));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want690).SAFETRANSFER152(_vault, _amount);
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL549() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL250();
        balance = IERC20(want690).BALANCEOF881(address(this));
        address _vault = Controller(controller).VAULTS498(address(this));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want690).SAFETRANSFER152(_vault, balance);
    }
    
    function _WITHDRAWALL250() internal {	//inject NONSTANDARD NAMING
        Vault(vault58).WITHDRAW41(IERC20(vault58).BALANCEOF881(address(this)));
    }
    
    function _WITHDRAWSOME982(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _redeem = IERC20(vault58).BALANCEOF881(address(this)).MUL8(_amount).DIV386(BALANCESAVINGSINTOKEN25());
        uint _before = IERC20(want690).BALANCEOF881(address(this));
        Vault(vault58).WITHDRAW41(_redeem);
        uint _after = IERC20(want690).BALANCEOF881(address(this));
        return _after.SUB42(_before);
    }
    
    function BALANCEOF881() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want690).BALANCEOF881(address(this))
                .ADD857(BALANCESAVINGSINTOKEN25());
    }
    
    function BALANCESAVINGSINTOKEN25() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return IERC20(vault58).BALANCEOF881(address(this)).MUL8(Vault(vault58).GETPRICEPERFULLSHARE204()).DIV386(1e18);
    }
    
    function SETGOVERNANCE728(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER626(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}