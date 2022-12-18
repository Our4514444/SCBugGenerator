                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY218() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF659(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER586(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE18(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE918(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM422(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER981(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL906(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD297(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB907(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB907(a, b, "SafeMath: subtraction overflow");
    }
    function SUB907(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL780(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV301(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV301(a, b, "SafeMath: division by zero");
    }
    function DIV301(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD425(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD425(a, b, "SafeMath: modulo by zero");
    }
    function MOD425(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT602(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE302(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE262(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER594(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN231(token, abi.encodeWithSelector(token.TRANSFER586.selector, to, value));
    }

    function SAFETRANSFERFROM4(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN231(token, abi.encodeWithSelector(token.TRANSFERFROM422.selector, from, to, value));
    }

    function SAFEAPPROVE812(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE18(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN231(token, abi.encodeWithSelector(token.APPROVE918.selector, spender, value));
    }
    function CALLOPTIONALRETURN231(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT602(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface Strategy {
    function WANT416() external view returns (address);	//inject NONSTANDARD NAMING
    function DEPOSIT204() external;	//inject NONSTANDARD NAMING
    function WITHDRAW634(address) external;	//inject NONSTANDARD NAMING
    function SKIM929(address) external;	//inject NONSTANDARD NAMING
    function WITHDRAW634(uint) external;	//inject NONSTANDARD NAMING
    function WITHDRAWALL580() external returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF659() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface Vault {
    function TOKEN790() external view returns (address);	//inject NONSTANDARD NAMING
}

interface Converter {
    function CONVERT581(address) external returns (uint);	//inject NONSTANDARD NAMING
}

interface OneSplitAudit {
    function SWAP488(	//inject NONSTANDARD NAMING
        address fromToken,
        address destToken,
        uint256 amount,
        uint256 minReturn,
        uint256[] calldata distribution,
        uint256 flags
    )
        external
        payable
        returns(uint256 returnAmount);
    
    function GETEXPECTEDRETURN297(	//inject NONSTANDARD NAMING
        address fromToken,
        address destToken,
        uint256 amount,
        uint256 parts,
        uint256 flags // See constants in IOneSplit.sol
    )
        external
        view
        returns(
            uint256 returnAmount,
            uint256[] memory distribution
        );
}

contract StrategyControllerV2 {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address public governance;
    address public onesplit;
    address public rewards;
    
    // Vault to strategy mapping
    mapping(address => address) public vaults;
    // Strategy to vault mapping
    mapping(address => address) public strategies;
    
    mapping(address => mapping(address => address)) public converters;
    
    uint public split = 500;
    uint public constant max506 = 10000;	//inject NONSTANDARD NAMING
    
    constructor(address _rewards) public {
        governance = msg.sender;
        onesplit = address(0x50FDA034C0Ce7a8f7EFDAebDA7Aa7cA21CC1267e);
        rewards = _rewards;
    }
    
    function SETSPLIT983(uint _split) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        split = _split;
    }
    
    function SETONESPLIT446(address _onesplit) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        onesplit = _onesplit;
    }
    
    function SETGOVERNANCE552(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONVERTER727(address _input, address _output, address _converter) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        converters[_input][_output] = _converter;
    }
    
    function SETSTRATEGY687(address _vault, address _strategy) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        address _current = strategies[_vault];
        if (_current != address(0)) {
           Strategy(_current).WITHDRAWALL580();
        }
        strategies[_vault] = _strategy;
        vaults[_strategy] = _vault;
    }
    
    function WANT416(address _vault) external view returns (address) {	//inject NONSTANDARD NAMING
        return Strategy(strategies[_vault]).WANT416();
    }
    
    function EARN872(address _vault, uint _amount) public {	//inject NONSTANDARD NAMING
        address _strategy = strategies[_vault];
        address _want = Strategy(_strategy).WANT416();
        IERC20(_want).SAFETRANSFER594(_strategy, _amount);
        Strategy(_strategy).DEPOSIT204();
    }
    
    function BALANCEOF659(address _token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return Strategy(strategies[_token]).BALANCEOF659();
    }
    
    function WITHDRAWALL580(address _strategy) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        // WithdrawAll sends 'want' to 'vault'
        Strategy(_strategy).WITHDRAWALL580();
    }
    
    function INCASETOKENSGETSTUCK787(address _token, uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        IERC20(_token).SAFETRANSFER594(governance, _amount);
    }
    
    function INCASESTRATEGYGETSTRUCK133(address _strategy, address _token) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        Strategy(_strategy).WITHDRAW634(_token);
        IERC20(_token).SAFETRANSFER594(governance, IERC20(_token).BALANCEOF659(address(this)));
    }
    
    function GETEXPECTEDRETURN297(address _strategy, address _token, uint parts) external view returns (uint expected) {	//inject NONSTANDARD NAMING
        uint _balance = IERC20(_token).BALANCEOF659(_strategy);
        address _want = Strategy(_strategy).WANT416();
        (expected,) = OneSplitAudit(onesplit).GETEXPECTEDRETURN297(_token, _want, _balance, parts, 0);
    }
    
    // Only allows to withdraw non-core strategy tokens ~ this is over and above normal yield
    function DELEGATEDHARVEST253(address _strategy, address _token, uint parts) external {	//inject NONSTANDARD NAMING
        // This contract should never have value in it, but just incase since this is a public call
        uint _before = IERC20(_token).BALANCEOF659(address(this));
        Strategy(_strategy).SKIM929(_token);
        uint _after =  IERC20(_token).BALANCEOF659(address(this));
        if (_after > _before) {
            uint _amount = _after.SUB907(_before);
            address _want = Vault(vaults[_strategy]).TOKEN790();
            uint[] memory _distribution;
            uint _expected;
            _before = IERC20(_want).BALANCEOF659(address(this));
            IERC20(_token).SAFEAPPROVE812(onesplit, 0);
            IERC20(_token).SAFEAPPROVE812(onesplit, _amount);
            (_expected, _distribution) = OneSplitAudit(onesplit).GETEXPECTEDRETURN297(_token, _want, _amount, parts, 0);
            OneSplitAudit(onesplit).SWAP488(_token, _want, _amount, _expected, _distribution, 0);
            _after = IERC20(_want).BALANCEOF659(address(this));
            if (_after > _before) {
                _amount = _after.SUB907(_before);
                uint _reward = _amount.MUL780(split).DIV301(max506);
                IERC20(_want).SAFETRANSFER594(vaults[_strategy], _amount.SUB907(_reward));
                IERC20(_want).SAFETRANSFER594(rewards, _reward);
            }
        }
    }
    
    // Only allows to withdraw non-core strategy tokens ~ this is over and above normal yield
    function HARVEST498(address _strategy, address _token, uint parts) external {	//inject NONSTANDARD NAMING
        // This contract should never have value in it, but just incase since this is a public call
        uint _before = IERC20(_token).BALANCEOF659(address(this));
        Strategy(_strategy).WITHDRAW634(_token);
        uint _after =  IERC20(_token).BALANCEOF659(address(this));
        if (_after > _before) {
            uint _amount = _after.SUB907(_before);
            address _want = Strategy(_strategy).WANT416();
            uint[] memory _distribution;
            uint _expected;
            _before = IERC20(_want).BALANCEOF659(address(this));
            IERC20(_token).SAFEAPPROVE812(onesplit, 0);
            IERC20(_token).SAFEAPPROVE812(onesplit, _amount);
            (_expected, _distribution) = OneSplitAudit(onesplit).GETEXPECTEDRETURN297(_token, _want, _amount, parts, 0);
            OneSplitAudit(onesplit).SWAP488(_token, _want, _amount, _expected, _distribution, 0);
            _after = IERC20(_want).BALANCEOF659(address(this));
            if (_after > _before) {
                _amount = _after.SUB907(_before);
                uint _reward = _amount.MUL780(split).DIV301(max506);
                EARN872(_want, _amount.SUB907(_reward));
                IERC20(_want).SAFETRANSFER594(rewards, _reward);
            }
        }
    }
    
    function WITHDRAW634(address _token, uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == vaults[_token], "!vault");
        Strategy(strategies[_token]).WITHDRAW634(_amount);
    }
}