/**
 *Submitted for verification at Etherscan.io on 2020-11-12
*/

pragma solidity ^0.5.16;

/**
  * @title ArtDeco Finance
  *
  * @notice Contract: a ARTD FundPool to storein NFT 
  * 
  */
interface Artd {
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

interface Nftfactory {
    function currentStore( uint256 nftId ) external view returns (uint256);
}

interface Validfactory {
    function isValidfactory( address _factory ) external returns (bool);
}


contract Governance {

  address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
  address public _governance;

    constructor() public {
        _governance = tx.origin;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

  uint256 bugv_tmstmp2 = block.timestamp;
  event GovernanceTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyGovernance {
        require(msg.sender == _governance, "not governance");
        _;
    }
uint256 bugv_tmstmp5 = block.timestamp;

    function setGovernance(address governance)  public  onlyGovernance
    {
        require(governance != address(0), "new governance the zero address");
        emit GovernanceTransferred(_governance, governance);
        _governance = governance;
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

}


/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {
    int256 constant private INT256_MIN = -2**255;

    /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
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

    /**
    * @dev Multiplies two signed integers, reverts on overflow.
    */
    function mul(int256 a, int256 b) internal pure returns (int256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        require(!(a == -1 && b == INT256_MIN)); // This is the only case of overflow not detected by the check below

        int256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Integer division of two signed integers truncating the quotient, reverts on division by zero.
    */
    function div(int256 a, int256 b) internal pure returns (int256) {
        require(b != 0); // Solidity only automatically asserts when dividing by 0
        require(!(b == -1 && a == INT256_MIN)); // This is the only case of overflow

        int256 c = a / b;

        return c;
    }

    /**
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Subtracts two signed integers, reverts on overflow.
    */
    function sub(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a - b;
        require((b >= 0 && c <= a) || (b < 0 && c > a));

        return c;
    }

    /**
    * @dev Adds two unsigned integers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Adds two signed integers, reverts on overflow.
    */
    function add(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a + b;
        require((b >= 0 && c >= a) || (b < 0 && c < a));

        return c;
    }

    /**
    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

/**
 * Utility library of inline functions on addresses
 */
library Address {
    /**
     * Returns whether the target address is a contract
     * @dev This function will return false if invoked during the constructor of a contract,
     * as the code is not actually created until after the constructor finishes.
     * @param account address of the account to check
     * @return whether the target address is a contract
     */
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solium-disable-next-line security/no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}


contract ARTDfundpool is Governance{
    using SafeMath for uint256;
    using Address for address;

    address public ARTDaddress =  address(0xA23F8462d90dbc60a06B9226206bFACdEAD2A26F);
    address public valider = address(0x58F62d9B184BE5D7eE6881854DD16898Afe0cf90);
    address private _factory = address(0);
    
  uint256 bugv_tmstmp3 = block.timestamp;
  event Approve(address newfactory, uint256 amount);
  uint256 bugv_tmstmp1 = block.timestamp;
  event Newfactory(address newfactory);
      
    constructor() public {}
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function newfactory(address factory) public onlyGovernance
    {
        Validfactory _valid = Validfactory(valider);
        require( _valid.isValidfactory(factory), "Invalid factory");
        
        _factory = factory;
        
        emit Newfactory(factory);
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

    function approve(address factory, uint256 amount) public 
    {
        Validfactory _valid = Validfactory(valider);
        require( _valid.isValidfactory(factory), "Invalid factory");

        Artd _artd =  Artd( ARTDaddress );
        _artd.approve( factory, amount );
        
        emit Approve(factory, amount);
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    
    function factory() external view returns (address) 
    {
        return _factory;   
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  } 
    
    /**
    * @dev Gets the stored amount of the specified NFT ID.
    */
    function storeOf(uint256 nftId) external view returns (uint256) 
    {
        Nftfactory factory_x =  Nftfactory( _factory );
        return factory_x.currentStore(nftId);
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /**
    * @dev return the total balances of this address
    */
    function totalBalance() external view returns (uint256) 
    {
        Artd _artd =  Artd( ARTDaddress );
        return _artd.balanceOf(address(this));
    }
uint256 bugv_tmstmp4 = block.timestamp;
    
}