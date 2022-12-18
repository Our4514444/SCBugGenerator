                                                                 

pragma solidity 0.5.17;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

                                                                         
library Math {
                                                               
    function MAX864(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN745(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE676(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD787(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB836(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB836(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB836(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL663(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV986(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV986(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV986(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD664(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD664(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD664(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER117() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA957() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED312(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER117();
        emit OWNERSHIPTRANSFERRED312(address(0), _owner);
    }

                                                                     
    function OWNER731() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER253() {	//inject NONSTANDARD NAMING
        require(ISOWNER820(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER820() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER117() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP991() public ONLYOWNER253 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED312(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP352(address newOwner) public ONLYOWNER253 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP296(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP296(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED312(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY781() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF984(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER894(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE336(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE730(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM593(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER989(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL98(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT28(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

                                                                                                                                                                                                          
    function TOPAYABLE377(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE292(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER156(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN356(token, abi.encodeWithSelector(token.TRANSFER894.selector, to, value));
    }

    function SAFETRANSFERFROM426(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN356(token, abi.encodeWithSelector(token.TRANSFERFROM593.selector, from, to, value));
    }

    function SAFEAPPROVE438(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE336(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN356(token, abi.encodeWithSelector(token.APPROVE730.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE895(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE336(address(this), spender).ADD787(value);
        CALLOPTIONALRETURN356(token, abi.encodeWithSelector(token.APPROVE730.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE889(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE336(address(this), spender).SUB836(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN356(token, abi.encodeWithSelector(token.APPROVE730.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN356(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT28(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


contract IRewardDistributionRecipient is Ownable {
    address public rewardDistribution;

    function NOTIFYREWARDAMOUNT697(uint256 reward, uint256 _duration) external;	//inject NONSTANDARD NAMING

    modifier ONLYREWARDDISTRIBUTION413() {	//inject NONSTANDARD NAMING
        require(_MSGSENDER117() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function SETREWARDDISTRIBUTION50(address _rewardDistribution) external ONLYOWNER253 {	//inject NONSTANDARD NAMING
        rewardDistribution = _rewardDistribution;
    }
}


contract LPTokenWrapper {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public lpToken;

    uint256 internal _totalSupply;
    mapping(address => uint256) internal _balances;

    constructor(address _lpToken) internal {
        lpToken = IERC20(_lpToken);
    }

    function TOTALSUPPLY781() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF984(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE657(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD787(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD787(amount);
        lpToken.SAFETRANSFERFROM426(msg.sender, address(this), amount);
    }

    function WITHDRAW935(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB836(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB836(amount);
        lpToken.SAFETRANSFER156(msg.sender, amount);
    }
}

contract BATTLEPool is LPTokenWrapper, IRewardDistributionRecipient {
    IERC20 public constant war947 = IERC20(0xf4A81C18816C9B0AB98FAC51B36Dcb63b0E58Fde);	//inject NONSTANDARD NAMING

    string public desc;

    uint256 public starttime;
    uint256 public endtime;

    uint256 public lastUpdateTime;

    mapping(address => uint256) public rewards;
    uint256 public penalties;

    event REWARDADDED681(uint256 reward);	//inject NONSTANDARD NAMING
    event STAKED898(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event WITHDRAWN214(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event REWARDPAID436(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING

    constructor(address _lpToken, string memory _desc, uint256 _starttime, uint256 _endtime) public LPTokenWrapper(_lpToken) {
        rewardDistribution = msg.sender;
        desc = _desc;
        starttime = _starttime;
        endtime = _endtime;
    }

    function UPDATETIMES822(uint256 _starttime, uint256 _endtime) external ONLYOWNER253 {	//inject NONSTANDARD NAMING
        require(block.timestamp < starttime, "started");
        require(_starttime < _endtime, "end before start");
        starttime = _starttime;
        endtime = _endtime;
    }

    modifier CHECKSTART815(){	//inject NONSTANDARD NAMING
        require(block.timestamp >= starttime, "not started");
        _;
    }

    function EARNED382(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return rewards[account];
    }

    function STAKE657(uint256 amount) public CHECKSTART815 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot stake 0");
        super.STAKE657(amount);
        emit STAKED898(msg.sender, amount);
    }

    function WITHDRAW935(uint256 amount) public CHECKSTART815 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot withdraw 0");

        uint256 transferAmount = amount;
        if (BATTLEDAY611() != 0) {
            // 1.5% penalty for withdrawal before the war ends
            uint256 penalty = transferAmount.MUL663(1.5e18).DIV986(1e20);
            penalties += penalty;
            transferAmount -= penalty;
        }

        _totalSupply = _totalSupply.SUB836(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB836(amount);
        emit WITHDRAWN214(msg.sender, amount);

        lpToken.SAFETRANSFER156(msg.sender, transferAmount);
    }

    function BATTLEDAY611() public view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 _starttime = starttime;
        if (block.timestamp < _starttime || block.timestamp >= endtime) {
            return 0;
        }
        return (block.timestamp - _starttime) / 1 days + 1;
    }

    function GETREWARD92() public CHECKSTART815 {	//inject NONSTANDARD NAMING
        uint256 reward = EARNED382(msg.sender);
        if (reward != 0) {
            rewards[msg.sender] = 0;
            war947.SAFETRANSFER156(msg.sender, reward);
            emit REWARDPAID436(msg.sender, reward);
        }
    }

    function ADDREWARDS944(address[] calldata accounts, uint256[] calldata amounts) external ONLYREWARDDISTRIBUTION413 returns (uint256 total) {	//inject NONSTANDARD NAMING
        require(accounts.length == amounts.length, "arrays must match");
        for (uint256 i = 0; i < accounts.length; i++) {
            total = total.ADD787(amounts[i]);
            rewards[accounts[i]] = rewards[accounts[i]].ADD787(amounts[i]);
        }
        if (total != 0) {
            war947.SAFETRANSFERFROM426(msg.sender, address(this), total);
        }
        lastUpdateTime = block.timestamp;
    }

    function DISTRIBUTEPENALTIES637(address[] calldata accounts, uint256[] calldata fractions) external ONLYREWARDDISTRIBUTION413 returns (uint256 total) {	//inject NONSTANDARD NAMING
        require(accounts.length == fractions.length, "arrays must match");
        if (penalties != 0) {
            for (uint256 i = 0; i < accounts.length; i++) {
                uint256 fraction = penalties.MUL663(fractions[i]).DIV986(1e20);
                rewards[accounts[i]] = rewards[accounts[i]].ADD787(fraction);
                total = total.ADD787(fraction);
            }
            if (total != 0) {
                require(penalties >= total, "fractions over 1e20");
                penalties -= total;
            }
        }
        lastUpdateTime = block.timestamp;
    }

    // unused
    function NOTIFYREWARDAMOUNT697(uint256 reward, uint256 _duration) external { return; }	//inject NONSTANDARD NAMING
}