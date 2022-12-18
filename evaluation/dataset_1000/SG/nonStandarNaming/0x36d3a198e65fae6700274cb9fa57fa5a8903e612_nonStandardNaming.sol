                                                                 

pragma solidity 0.5.16;


                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY650() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF131(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER31(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE298(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE620(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM779(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER735(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL569(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER238() {	//inject NONSTANDARD NAMING
    require(initializing || ISCONSTRUCTOR412() || !initialized, "Contract instance has already been initialized");

    bool isTopLevelCall = !initializing;
    if (isTopLevelCall) {
      initializing = true;
      initialized = true;
    }

    _;

    if (isTopLevelCall) {
      initializing = false;
    }
  }

                                                                                 
  function ISCONSTRUCTOR412() private view returns (bool) {	//inject NONSTANDARD NAMING
    // extcodesize checks the size of the code stored in an address, and
    // address returns the current address. Since the code is still not
    // deployed when running a constructor, any checks on its code size will
    // yield zero, making it an effective way to detect if a contract is
    // under construction or not.
    address self = address(this);
    uint256 cs;
    assembly { cs := extcodesize(self) }
    return cs == 0;
  }

  // Reserved storage space to allow for layout changes in the future.
  uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD551(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB32(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB32(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB32(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL939(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV955(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV955(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV955(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD554(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD554(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD554(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context is Initializable {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER212() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA659() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


                                                                                                                                                                                                                                                                                                                                                                       
contract Ownable is Initializable, Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED832(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    function INITIALIZE258(address sender) public INITIALIZER238 {	//inject NONSTANDARD NAMING
        _owner = sender;
        emit OWNERSHIPTRANSFERRED832(address(0), _owner);
    }

                                                                     
    function OWNER762() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER600() {	//inject NONSTANDARD NAMING
        require(ISOWNER354(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER354() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER212() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP222() public ONLYOWNER600 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED832(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP798(address newOwner) public ONLYOWNER600 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP516(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP516(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED832(_owner, newOwner);
        _owner = newOwner;
    }

    uint256[50] private ______gap;
}


library BasisPoints {
    using SafeMath for uint;

    uint constant private basis_points978 = 10000;	//inject NONSTANDARD NAMING

    function MULBP54(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        return amt.MUL939(bp).DIV955(basis_points978);
    }

    function DIVBP44(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(bp > 0, "Cannot divide by zero.");
        if (amt == 0) return 0;
        return amt.MUL939(basis_points978).DIV955(bp);
    }

    function ADDBP711(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.ADD551(MULBP54(amt, bp));
    }

    function SUBBP469(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.SUB32(MULBP54(amt, bp));
    }
}


contract LidTimeLock is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint public releaseInterval;
    uint public releaseStart;
    uint public releaseBP;

    uint public startingTokens;
    uint public claimedTokens;

    IERC20 private token;

    address releaseWallet;

    modifier ONLYAFTERSTART678 {	//inject NONSTANDARD NAMING
        require(releaseStart != 0 && now > releaseStart, "Has not yet started.");
        _;
    }

    function INITIALIZE258(	//inject NONSTANDARD NAMING
        uint _releaseInterval,
        uint _releaseBP,
        address owner,
        IERC20 _token
    ) external INITIALIZER238 {
        releaseInterval = _releaseInterval;
        releaseBP = _releaseBP;
        token = _token;

        Ownable.INITIALIZE258(msg.sender);

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP516(owner);
    }

    function CLAIMTOKEN258() external ONLYAFTERSTART678 {	//inject NONSTANDARD NAMING
        require(releaseStart != 0, "Has not yet started.");
        uint cycle = GETCURRENTCYCLECOUNT694();
        uint totalClaimAmount = cycle.MUL939(startingTokens.MULBP54(releaseBP));
        uint toClaim = totalClaimAmount.SUB32(claimedTokens);
        if (token.BALANCEOF131(address(this)) < toClaim) toClaim = token.BALANCEOF131(address(this));
        claimedTokens = claimedTokens.ADD551(toClaim);
        token.TRANSFER31(releaseWallet, toClaim);
    }

    function STARTRELEASE942(address _releaseWallet) external ONLYOWNER600 {	//inject NONSTANDARD NAMING
        require(token.BALANCEOF131(address(this)) != 0, "Must have some lid deposited.");
        releaseWallet = _releaseWallet;
        startingTokens = token.BALANCEOF131(address(this));
        releaseStart = now;
    }

    function UPDATERELEASERATE462(uint _releaseBP, uint _releaseInterval) external ONLYOWNER600 {	//inject NONSTANDARD NAMING
        releaseInterval = _releaseInterval;
        releaseBP = _releaseBP;
    }

    function GETCURRENTCYCLECOUNT694() public view returns (uint) {	//inject NONSTANDARD NAMING
        if (now <= releaseStart) return 0;
        return now.SUB32(releaseStart).DIV955(releaseInterval).ADD551(1);
    }

}