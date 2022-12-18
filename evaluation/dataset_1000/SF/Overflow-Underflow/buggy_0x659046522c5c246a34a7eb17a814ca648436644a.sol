/**
 *Submitted for verification at Etherscan.io on 2020-01-24
*/

pragma solidity ^0.5.8;

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}


/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
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
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

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
    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}


/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
 * Originally based on code by FirstBlood:
 * https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 *
 * This implementation emits additional Approval events, allowing applications to reconstruct the allowance status for
 * all accounts just by listening to said events. Note that this isn't required by the specification, and other
 * compliant implementations may not do it.
 */
contract ERC20 is IERC20 {
    using SafeMath for uint256;

  function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
  mapping (address => uint256) private _balances;

  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  mapping (address => mapping (address => uint256)) private _allowed;

  function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
  uint256 private _totalSupply;

    /**
    * @dev Total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param owner The address to query the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param owner address The address which owns the funds.
     * @param spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
    * @dev Transfer token for a specified address
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     */
    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }

    /**
     * @dev Transfer tokens from one address to another.
     * Note that while this function emits an Approval event, this is not required as per the specification,
     * and other compliant implementations may not emit the event.
     * @param from address The address which you want to send tokens from
     * @param to address The address which you want to transfer to
     * @param value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _transfer(from, to, value);
        emit Approval(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}

    /**
     * @dev Increase the amount of tokens that an owner allowed to a spender.
     * approve should be called when allowed_[_spender] == 0. To increment
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * Emits an Approval event.
     * @param spender The address which will spend the funds.
     * @param addedValue The amount of tokens to increase the allowance by.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].add(addedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}

    /**
     * @dev Decrease the amount of tokens that an owner allowed to a spender.
     * approve should be called when allowed_[_spender] == 0. To decrement
     * allowed value is better to use this function to avoid 2 calls (and wait until
     * the first transaction is mined)
     * From MonolithDAO Token.sol
     * Emits an Approval event.
     * @param spender The address which will spend the funds.
     * @param subtractedValue The amount of tokens to decrease the allowance by.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].sub(subtractedValue);
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }

    /**
    * @dev Transfer token for a specified addresses
    * @param from The address to transfer from.
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Internal function that mints an amount of the token and assigns it to
     * an account. This encapsulates the modification of balances such that the
     * proper events are emitted.
     * @param account The account that will receive the created tokens.
     * @param value The amount that will be created.
     */
    function _mint(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}

    /**
     * @dev Internal function that burns an amount of the token of a given
     * account.
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burn(address account, uint256 value) internal {
        require(account != address(0));

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Internal function that burns an amount of the token of a given
     * account, deducting from the sender's allowance for said account. Uses the
     * internal burn function.
     * Emits an Approval event (reflecting the reduced allowance).
     * @param account The account whose tokens will be burnt.
     * @param value The amount that will be burnt.
     */
    function _burnFrom(address account, uint256 value) internal {
        _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(value);
        _burn(account, value);
        emit Approval(account, msg.sender, _allowed[account][msg.sender]);
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
}


/**
 * @title Helps contracts guard against reentrancy attacks.
 * @author Remco Bloemen <remco@2π.com>, Eenae <alexey@mixbytes.io>
 * @dev If you mark a function `nonReentrant`, you should also
 * mark it `external`.
 */
contract ReentrancyGuard {
    /// @dev counter to allow mutex lock with only one SSTORE operation
  mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }
  uint256 private _guardCounter;

    constructor() public {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter);
    }
}


/// @title Main contract for WrappedChainFaces. This contract converts ChainFaces between the ERC721 standard and the
///  ERC20 standard by locking ChainFaces into the contract and minting 1:1 backed ERC20 tokens, that
///  can then be redeemed for ChainFaces when desired.
/// @notice When wrapping a ChainFace, you get a generic WCF token. Since the WCF token is generic, it has no
///  no information about what ChainFace you submitted, so you will most likely not receive the same ChainFace
///  back when redeeming the token unless you specify that ChainFace's ID. The token only entitles you to receive 
///  *a* ChainFace in return, not necessarily the *same* ChainFace in return. A different user can submit
///  their own WCF tokens to the contract and withdraw the ChainFace that you originally deposited. WCF tokens have
///  no information about which ChainFace was originally deposited to mint WCF - this is due to the very nature of 
///  the ERC20 standard being fungible, and the ERC721 standard being nonfungible.
contract WrappedCF is ERC20, ReentrancyGuard {

    // OpenZeppelin's SafeMath library is used for all arithmetic operations to avoid overflows/underflows.
    using SafeMath for uint256;

    /* ****** */
    /* EVENTS */
    /* ****** */

    /// @dev This event is fired when a user deposits ChainFaces into the contract in exchange
    ///  for an equal number of WCF ERC20 tokens.
    /// @param chainFaceId  The ChainFace id of the ChainFace that was deposited into the contract.
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event DepositChainFaceAndMintToken(
        uint256 chainFaceId
    );

    /// @dev This event is fired when a user deposits WCF ERC20 tokens into the contract in exchange
    ///  for an equal number of locked ChainFaces.
    /// @param chainFaceId  The ChainFace id of the ChainFace that was withdrawn from the contract.
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event BurnTokenAndWithdrawChainFace(
        uint256 chainFaceId
    );

    /* ******* */
    /* STORAGE */
    /* ******* */

    /// @dev An Array containing all of the ChainFaces that are locked in the contract, backing
    ///  WCF ERC20 tokens 1:1
    /// @notice Some of the ChainFaces in this array were indeed deposited to the contract, but they
    ///  are no longer held by the contract. This is because withdrawSpecificChainFace() allows a 
    ///  user to withdraw a ChainFace "out of order". Since it would be prohibitively expensive to 
    ///  shift the entire array once we've withdrawn a single element, we instead maintain this 
    ///  mapping to determine whether an element is still contained in the contract or not. 
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  uint256[] private depositedChainFacesArray;

    /// @dev A mapping keeping track of which ChainFaceIDs are currently contained within the contract.
    /// @notice We cannot rely on depositedChainFacesArray as the source of truth as to which ChainFaces are
    ///  deposited in the contract. This is because burnTokensAndWithdrawChainFaces() allows a user to 
    ///  withdraw a ChainFace "out of order" of the order that they are stored in the array. Since it 
    ///  would be prohibitively expensive to shift the entire array once we've withdrawn a single 
    ///  element, we instead maintain this mapping to determine whether an element is still contained 
    ///  in the contract or not. 
  function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (uint256 => bool) private chainFaceIsDepositedInContract;

    /* ********* */
    /* CONSTANTS */
    /* ********* */

    /// @dev The metadata details about the "Wrapped ChainFaces" WCF ERC20 token.
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint8 constant public decimals = 18;
  function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
  string constant public name = "Wrapped ChainFaces";
  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
  string constant public symbol = "WCF";

    /// @dev The address of official ChainFaces contract that stores the metadata about each ChainFace.
    /// @notice The owner is not capable of changing the address of the ChainFaces Core contract
    ///  once the contract has been deployed.
  mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
  address public chainFaceCoreAddress = 0x91047Abf3cAb8da5A9515c8750Ab33B4f1560a7A;
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  ChainFaceCore chainFaceCore;

    /* ********* */
    /* FUNCTIONS */
    /* ********* */

    /// @notice Allows a user to lock ChainFaces in the contract in exchange for an equal number
    ///  of WCF ERC20 tokens.
    /// @param _chainFaceIds  The ids of the ChainFaces that will be locked into the contract.
    /// @notice The user must first call approveForAll() in the ChainFaces Core contract.
    function depositChainFacesAndMintTokens(uint256[] calldata _chainFaceIds) external nonReentrant {
        require(_chainFaceIds.length > 0, 'you must submit an array with at least one element');
        for(uint i = 0; i < _chainFaceIds.length; i++){
            uint256 chainFaceToDeposit = _chainFaceIds[i];
            require(msg.sender == chainFaceCore.ownerOf(chainFaceToDeposit), 'you do not own this ChainFace');
            require(chainFaceCore.isApprovedForAll(msg.sender, address(this)), 'you must approveForAll() this contract to give it permission to withdraw this ChainFace before you can deposit a ChainFace');
            chainFaceCore.transferFrom(msg.sender, address(this), chainFaceToDeposit);
            _pushChainFace(chainFaceToDeposit);
            emit DepositChainFaceAndMintToken(chainFaceToDeposit);
        }
        _mint(msg.sender, (_chainFaceIds.length).mul(10**18));
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }

    /// @notice Allows a user to burn WCF ERC20 tokens in exchange for an equal number of locked 
    ///  ChainFaces.
    /// @param _chainFaceIds  The IDs of the ChainFaces that the user wishes to withdraw. If the user submits 0 
    ///  as the ID for any ChainFace, the contract uses the last ChainFace in the array for that ChainFace.
    /// @param _destinationAddresses  The addresses that the withdrawn ChainFaces will be sent to (this allows 
    ///  anyone to "airdrop" ChainFaces to addresses that they do not own in a single transaction).
    function burnTokensAndWithdrawChainFaces(uint256[] calldata _chainFaceIds, address[] calldata _destinationAddresses) external nonReentrant {
        require(_chainFaceIds.length == _destinationAddresses.length, 'you did not provide a destination address for each of the ChainFaces you wish to withdraw');
        require(_chainFaceIds.length > 0, 'you must submit an array with at least one element');

        uint256 numTokensToBurn = _chainFaceIds.length;
        require(balanceOf(msg.sender) >= numTokensToBurn.mul(10**18), 'you do not own enough tokens to withdraw this many ERC721 ChainFaces');
        _burn(msg.sender, numTokensToBurn.mul(10**18));
        
        for(uint i = 0; i < numTokensToBurn; i++){
            uint256 chainFaceToWithdraw = _chainFaceIds[i];
            if(chainFaceToWithdraw == 0){
                chainFaceToWithdraw = _popChainFace();
            } else {
                require(chainFaceIsDepositedInContract[chainFaceToWithdraw] == true, 'this chainFace has already been withdrawn');
                require(address(this) == chainFaceCore.ownerOf(chainFaceToWithdraw), 'the contract does not own this ChainFace');
                chainFaceIsDepositedInContract[chainFaceToWithdraw] = false;
            }
            chainFaceCore.transferFrom(address(this), _destinationAddresses[i], chainFaceToWithdraw);
            emit BurnTokenAndWithdrawChainFace(chainFaceToWithdraw);
        }
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

    /// @notice Adds a locked ChainFace to the end of the array
    /// @param _chainFaceIds  The id of the ChainFace that will be locked into the contract.
    function _pushChainFace(uint256 _chainFaceIds) internal {
        depositedChainFacesArray.push(_chainFaceIds);
        chainFaceIsDepositedInContract[_chainFaceIds] = true;
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }

    /// @notice Removes an unlocked ChainFace from the end of the array
    /// @notice The reason that this function must check if the chainFaceIsDepositedInContract
    ///  is that the withdrawSpecificChainFace() function allows a user to withdraw a ChainFace
    ///  from the array out of order.
    /// @return  The id of the ChainFace that will be unlocked from the contract.
    function _popChainFace() internal returns(uint256){
        require(depositedChainFacesArray.length > 0, 'there are no ChainFaces in the array');
        uint256 chainFaceId = depositedChainFacesArray[depositedChainFacesArray.length - 1];
        depositedChainFacesArray.length--;
        while(chainFaceIsDepositedInContract[chainFaceId] == false){
            chainFaceId = depositedChainFacesArray[depositedChainFacesArray.length - 1];
            depositedChainFacesArray.length--;
        }
        chainFaceIsDepositedInContract[chainFaceId] = false;
        return chainFaceId;
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }

    /// @notice Removes any ChainFaces that exist in the array but are no longer held in the
    ///  contract, which happens if the first few ChainFaces have previously been withdrawn 
    ///  out of order using the withdrawSpecificChainFace() function.
    /// @notice This function exists to prevent a griefing attack where a malicious attacker
    ///  could call withdrawSpecificChainFace() on a large number of ChainFaces at the front of the
    ///  array, causing the while-loop in _popChainFace to always run out of gas.
    /// @param _numSlotsToCheck  The number of slots to check in the array.
    function batchRemoveWithdrawnChainFacesFromStorage(uint256 _numSlotsToCheck) external {
        require(_numSlotsToCheck <= depositedChainFacesArray.length, 'you are trying to batch remove more slots than exist in the array');
        uint256 arrayIndex = depositedChainFacesArray.length;
        for(uint i = 0; i < _numSlotsToCheck; i++){
            arrayIndex = arrayIndex.sub(1);
            uint256 chainFaceId = depositedChainFacesArray[arrayIndex];
            if(chainFaceIsDepositedInContract[chainFaceId] == false){
                depositedChainFacesArray.length--;
            } else {
                return;
            }
        }
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    /// @notice The owner is not capable of changing the address of the ChainFaces Core
    ///  contract once the contract has been deployed.
    constructor() public {
        chainFaceCore = ChainFaceCore(chainFaceCoreAddress);
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

    /// @dev We leave the fallback function payable in case the current State Rent proposals require
    ///  us to send funds to this contract to keep it alive on mainnet.
    /// @notice There is no function that allows the contract creator to withdraw any funds sent
    ///  to this contract, so any funds sent directly to the fallback function that are not used for 
    ///  State Rent are lost forever.
    function() external payable {}
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

/// @title Interface for interacting with the ChainFaces Core contract created by some scammer.
contract ChainFaceCore {
    function ownerOf(uint256 _tokenId) public view returns (address owner);
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
    function transferFrom(address _from, address _to, uint256 _tokenId) external;
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
    function isApprovedForAll(address _owner, address _operator) public view returns (bool _bool);
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  mapping (uint256 => address) public chainFaceIndexToApproved;
}