                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY707() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF235(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER105(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE361(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE871(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM395(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER575(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL674(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD558(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB520(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB520(a, b, "SafeMath: subtraction overflow");
    }
    function SUB520(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL168(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV233(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV233(a, b, "SafeMath: division by zero");
    }
    function DIV233(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD294(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD294(a, b, "SafeMath: modulo by zero");
    }
    function MOD294(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT513(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE682(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE564(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER274(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN149(token, abi.encodeWithSelector(token.TRANSFER105.selector, to, value));
    }

    function SAFETRANSFERFROM214(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN149(token, abi.encodeWithSelector(token.TRANSFERFROM395.selector, from, to, value));
    }

    function SAFEAPPROVE653(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE361(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN149(token, abi.encodeWithSelector(token.APPROVE871.selector, spender, value));
    }
    function CALLOPTIONALRETURN149(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT513(), "SafeERC20: call to non-contract");

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
    function WANT495() external view returns (address);	//inject NONSTANDARD NAMING
    function DEPOSIT95() external;	//inject NONSTANDARD NAMING
    function WITHDRAW860(address) external;	//inject NONSTANDARD NAMING
    function WITHDRAW860(uint) external;	//inject NONSTANDARD NAMING
    function WITHDRAWALL341() external returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF235() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface Converter {
    function CONVERT224(address) external returns (uint);	//inject NONSTANDARD NAMING
}

interface OneSplitAudit {
    function SWAP459(	//inject NONSTANDARD NAMING
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
    
    function GETEXPECTEDRETURN535(	//inject NONSTANDARD NAMING
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

contract Controller {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address public governance;
    address public onesplit;
    address public rewards;
    address public factory;
    mapping(address => address) public vaults;
    mapping(address => address) public strategies;
    mapping(address => mapping(address => address)) public converters;
    
    uint public split = 5000;
    uint public constant max572 = 10000;	//inject NONSTANDARD NAMING
    
    constructor(address _rewards) public {
        governance = msg.sender;
        onesplit = address(0x50FDA034C0Ce7a8f7EFDAebDA7Aa7cA21CC1267e);
        rewards = _rewards;
    }
    
    function SETFACTORY188(address _factory) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        factory = _factory;
    }
    
    function SETSPLIT711(uint _split) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        split = _split;
    }
    
    function SETONESPLIT440(address _onesplit) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        onesplit = _onesplit;
    }
    
    function SETGOVERNANCE592(address _governance) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETVAULT277(address _token, address _vault) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        vaults[_token] = _vault;
    }
    
    function SETCONVERTER752(address _input, address _output, address _converter) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        converters[_input][_output] = _converter;
    }
    
    function SETSTRATEGY778(address _token, address _strategy) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        address _current = strategies[_token];
        if (_current != address(0)) {
           Strategy(_current).WITHDRAWALL341();
        }
        strategies[_token] = _strategy;
    }
    
    function EARN529(address _token, uint _amount) public {	//inject NONSTANDARD NAMING
        address _strategy = strategies[_token];
        address _want = Strategy(_strategy).WANT495();
        if (_want != _token) {
            address converter = converters[_token][_want];
            IERC20(_token).SAFETRANSFER274(converter, _amount);
            _amount = Converter(converter).CONVERT224(_strategy);
            IERC20(_want).SAFETRANSFER274(_strategy, _amount);
        } else {
            IERC20(_token).SAFETRANSFER274(_strategy, _amount);
        }
        Strategy(_strategy).DEPOSIT95();
    }
    
    function BALANCEOF235(address _token) external view returns (uint) {	//inject NONSTANDARD NAMING
        return Strategy(strategies[_token]).BALANCEOF235();
    }
    
    function WITHDRAWALL341(address _token) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        Strategy(strategies[_token]).WITHDRAWALL341();
    }
    
    function INCASETOKENSGETSTUCK927(address _token, uint _amount) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        IERC20(_token).SAFETRANSFER274(governance, _amount);
    }
    
    function GETEXPECTEDRETURN535(address _strategy, address _token, uint parts) public view returns (uint expected) {	//inject NONSTANDARD NAMING
        uint _balance = IERC20(_token).BALANCEOF235(_strategy);
        address _want = Strategy(_strategy).WANT495();
        (expected,) = OneSplitAudit(onesplit).GETEXPECTEDRETURN535(_token, _want, _balance, parts, 0);
    }
    
    // Only allows to withdraw non-core strategy tokens ~ this is over and above normal yield
    function YEARN211(address _strategy, address _token, uint parts) public {	//inject NONSTANDARD NAMING
        // This contract should never have value in it, but just incase since this is a public call
        uint _before = IERC20(_token).BALANCEOF235(address(this));
        Strategy(_strategy).WITHDRAW860(_token);
        uint _after =  IERC20(_token).BALANCEOF235(address(this));
        if (_after > _before) {
            uint _amount = _after.SUB520(_before);
            address _want = Strategy(_strategy).WANT495();
            uint[] memory _distribution;
            uint _expected;
            _before = IERC20(_want).BALANCEOF235(address(this));
            IERC20(_token).SAFEAPPROVE653(onesplit, 0);
            IERC20(_token).SAFEAPPROVE653(onesplit, _amount);
            (_expected, _distribution) = OneSplitAudit(onesplit).GETEXPECTEDRETURN535(_token, _want, _amount, parts, 0);
            OneSplitAudit(onesplit).SWAP459(_token, _want, _amount, _expected, _distribution, 0);
            _after = IERC20(_want).BALANCEOF235(address(this));
            if (_after > _before) {
                _amount = _after.SUB520(_before);
                uint _reward = _amount.MUL168(split).DIV233(max572);
                EARN529(_want, _amount.SUB520(_reward));
                IERC20(_want).SAFETRANSFER274(rewards, _reward);
            }
        }
    }
    
    function WITHDRAW860(address _token, uint _amount) public {	//inject NONSTANDARD NAMING
        require(msg.sender == vaults[_token], "!vault");
        Strategy(strategies[_token]).WITHDRAW860(_amount);
    }
}