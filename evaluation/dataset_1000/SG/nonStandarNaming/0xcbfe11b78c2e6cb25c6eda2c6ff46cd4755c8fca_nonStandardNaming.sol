pragma solidity 0.5.2;

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED932(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED932(address(0), _owner);
    }

                                                        
    function OWNER722() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER418() {	//inject NONSTANDARD NAMING
        require(ISOWNER374());
        _;
    }

                                                                                 
    function ISOWNER374() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP908() public ONLYOWNER418 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED932(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP31(address newOwner) public ONLYOWNER418 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP615(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP615(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED932(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

                                                                                                   
library SafeMath {
                                                                                
    function MUL478(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV707(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB157(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD255(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD883(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

                                                                                        
interface IERC20 {
    function TRANSFER131(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE256(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM225(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY689() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF297(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE764(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER507(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL911(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol

                                                                                                                                                                                                                                                                            
library SafeERC20 {
    using SafeMath for uint256;

    function SAFETRANSFER174(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(token.TRANSFER131(to, value));
    }

    function SAFETRANSFERFROM346(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(token.TRANSFERFROM225(from, to, value));
    }

    function SAFEAPPROVE186(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require((value == 0) || (token.ALLOWANCE764(msg.sender, spender) == 0));
        require(token.APPROVE256(spender, value));
    }

    function SAFEINCREASEALLOWANCE973(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE764(address(this), spender).ADD255(value);
        require(token.APPROVE256(spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE643(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE764(address(this), spender).SUB157(value);
        require(token.APPROVE256(spender, newAllowance));
    }
}

// File: contracts/MaticTokenVesting.sol

                                                                                                                                                                                                                    
contract MaticTokenVesting is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 private maticToken;
    uint256 private tokensToVest = 0;
    uint256 private vestingId = 0;

    string private constant insufficient_balance785 = "Insufficient balance";	//inject NONSTANDARD NAMING
    string private constant invalid_vesting_id495 = "Invalid vesting id";	//inject NONSTANDARD NAMING
    string private constant vesting_already_released226 = "Vesting already released";	//inject NONSTANDARD NAMING
    string private constant invalid_beneficiary977 = "Invalid beneficiary address";	//inject NONSTANDARD NAMING
    string private constant not_vested734 = "Tokens have not vested yet";	//inject NONSTANDARD NAMING

    struct Vesting {
        uint256 releaseTime;
        uint256 amount;
        address beneficiary;
        bool released;
    }
    mapping(uint256 => Vesting) public vestings;

    event TOKENVESTINGRELEASED571(uint256 indexed vestingId, address indexed beneficiary, uint256 amount);	//inject NONSTANDARD NAMING
    event TOKENVESTINGADDED526(uint256 indexed vestingId, address indexed beneficiary, uint256 amount);	//inject NONSTANDARD NAMING
    event TOKENVESTINGREMOVED345(uint256 indexed vestingId, address indexed beneficiary, uint256 amount);	//inject NONSTANDARD NAMING

    constructor(IERC20 _token) public {
        require(address(_token) != address(0x0), "Matic token address is not valid");
        maticToken = _token;

        uint256 SCALING_FACTOR = 10 ** 18;
        uint256 day = 1 days;

        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 0, 3230085552 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 30 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 61 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 91 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 122 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 153 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 183 * day, 1088418885 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 214 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 244 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 275 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 306 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 335 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 366 * day, 1218304816 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 396 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 427 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 457 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 488 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 519 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 549 * day, 1218304816 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 580 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 610 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 641 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 672 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 700 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 731 * day, 1084971483 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 761 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 792 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 822 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 853 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 884 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 914 * day, 618304816 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 945 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 975 * day, 25000000 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 1096 * day, 593304816 * SCALING_FACTOR);
        ADDVESTING495(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 1279 * day, 273304816 * SCALING_FACTOR);
    }

    function TOKEN559() public view returns (IERC20) {	//inject NONSTANDARD NAMING
        return maticToken;
    }

    function BENEFICIARY257(uint256 _vestingId) public view returns (address) {	//inject NONSTANDARD NAMING
        return vestings[_vestingId].beneficiary;
    }

    function RELEASETIME46(uint256 _vestingId) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return vestings[_vestingId].releaseTime;
    }

    function VESTINGAMOUNT39(uint256 _vestingId) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return vestings[_vestingId].amount;
    }

    function REMOVEVESTING699(uint256 _vestingId) public ONLYOWNER418 {	//inject NONSTANDARD NAMING
        Vesting storage vesting = vestings[_vestingId];
        require(vesting.beneficiary != address(0x0), invalid_vesting_id495);
        require(!vesting.released , vesting_already_released226);
        vesting.released = true;
        tokensToVest = tokensToVest.SUB157(vesting.amount);
        emit TOKENVESTINGREMOVED345(_vestingId, vesting.beneficiary, vesting.amount);
    }

    function ADDVESTING495(address _beneficiary, uint256 _releaseTime, uint256 _amount) public ONLYOWNER418 {	//inject NONSTANDARD NAMING
        require(_beneficiary != address(0x0), invalid_beneficiary977);
        tokensToVest = tokensToVest.ADD255(_amount);
        vestingId = vestingId.ADD255(1);
        vestings[vestingId] = Vesting({
            beneficiary: _beneficiary,
            releaseTime: _releaseTime,
            amount: _amount,
            released: false
        });
        emit TOKENVESTINGADDED526(vestingId, _beneficiary, _amount);
    }

    function RELEASE282(uint256 _vestingId) public {	//inject NONSTANDARD NAMING
        Vesting storage vesting = vestings[_vestingId];
        require(vesting.beneficiary != address(0x0), invalid_vesting_id495);
        require(!vesting.released , vesting_already_released226);
        // solhint-disable-next-line not-rely-on-time
        require(block.timestamp >= vesting.releaseTime, not_vested734);

        require(maticToken.BALANCEOF297(address(this)) >= vesting.amount, insufficient_balance785);
        vesting.released = true;
        tokensToVest = tokensToVest.SUB157(vesting.amount);
        maticToken.SAFETRANSFER174(vesting.beneficiary, vesting.amount);
        emit TOKENVESTINGRELEASED571(_vestingId, vesting.beneficiary, vesting.amount);
    }

    function RETRIEVEEXCESSTOKENS988(uint256 _amount) public ONLYOWNER418 {	//inject NONSTANDARD NAMING
        require(_amount <= maticToken.BALANCEOF297(address(this)).SUB157(tokensToVest), insufficient_balance785);
        maticToken.SAFETRANSFER174(OWNER722(), _amount);
    }
}