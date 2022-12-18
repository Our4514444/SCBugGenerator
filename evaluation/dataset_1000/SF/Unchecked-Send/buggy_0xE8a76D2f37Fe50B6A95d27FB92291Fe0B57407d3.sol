/**
 *Submitted for verification at Etherscan.io on 2019-12-02
*/

pragma solidity ^0.5.4;

/**
 * ERC20 contract interface.
 */
contract ERC20 {
    function totalSupply() public view returns (uint);
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function decimals() public view returns (uint);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address tokenOwner) public view returns (uint balance);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
}

contract KyberNetwork {

    function getExpectedRate(
        ERC20 src,
        ERC20 dest,
        uint srcQty
    )
        public
        view
        returns (uint expectedRate, uint slippageRate);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function trade(
        ERC20 src,
        uint srcAmount,
        ERC20 dest,
        address payable destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
    )
        public
        payable
        returns(uint);
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

    /**
    * @dev Multiplies two numbers, reverts on overflow.
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
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }

    /**
    * @dev Returns ceil(a / b).
    */
    function ceil(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a / b;
        if(a % b == 0) {
            return c;
        }
        else {
            return c + 1;
        }
    }
}

/**
 * @title Owned
 * @dev Basic contract to define an owner.
 * @author Julien Niset - <julien@argent.im>
 */
contract Owned {

    // The owner
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event OwnerChanged(address indexed _newOwner);

    /**
     * @dev Throws if the sender is not the owner.
     */
    modifier onlyOwner {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Lets the owner transfer ownership of the contract to a new owner.
     * @param _newOwner The new owner.
     */
    function changeOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;
        emit OwnerChanged(_newOwner);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
}

/**
 * @title Managed
 * @dev Basic contract that defines a set of managers. Only the owner can add/remove managers.
 * @author Julien Niset - <julien@argent.im>
 */
contract Managed is Owned {

    // The managers
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public managers;

    /**
     * @dev Throws if the sender is not a manager.
     */
    modifier onlyManager {
        require(managers[msg.sender] == true, "M: Must be manager");
        _;
    }

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event ManagerAdded(address indexed _manager);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event ManagerRevoked(address indexed _manager);

    /**
    * @dev Adds a manager. 
    * @param _manager The address of the manager.
    */
    function addManager(address _manager) external onlyOwner {
        require(_manager != address(0), "M: Address must not be null");
        if(managers[_manager] == false) {
            managers[_manager] = true;
            emit ManagerAdded(_manager);
        }        
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Revokes a manager.
    * @param _manager The address of the manager.
    */
    function revokeManager(address _manager) external onlyOwner {
        require(managers[_manager] == true, "M: Target must be an existing manager");
        delete managers[_manager];
        emit ManagerRevoked(_manager);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
}

contract TokenPriceProvider is Managed {

    // Mock token address for ETH
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  address constant internal ETH_TOKEN_ADDRESS = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    using SafeMath for uint256;

  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public cachedPrices;

    // Address of the KyberNetwork contract
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  KyberNetwork public kyberNetwork;

    constructor(KyberNetwork _kyberNetwork) public {
        kyberNetwork = _kyberNetwork;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function setPrice(ERC20 _token, uint256 _price) public onlyManager {
        cachedPrices[address(_token)] = _price;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function setPriceForTokenList(ERC20[] calldata _tokens, uint256[] calldata _prices) external onlyManager {
        for(uint16 i = 0; i < _tokens.length; i++) {
            setPrice(_tokens[i], _prices[i]);
        }
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Converts the value of _amount tokens in ether.
     * @param _amount the amount of tokens to convert (in 'token wei' twei)
     * @param _token the ERC20 token contract
     * @return the ether value (in wei) of _amount tokens with contract _token
     */
    function getEtherValue(uint256 _amount, address _token) external view returns (uint256) {
        uint256 decimals = ERC20(_token).decimals();
        uint256 price = cachedPrices[_token];
        return price.mul(_amount).div(10**decimals);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    //
    // The following is added to be backward-compatible with Argent's old backend
    //

    function setKyberNetwork(KyberNetwork _kyberNetwork) external onlyManager {
        kyberNetwork = _kyberNetwork;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function syncPrice(ERC20 _token) external {
        require(address(kyberNetwork) != address(0), "Kyber sync is disabled");
        (uint256 expectedRate,) = kyberNetwork.getExpectedRate(_token, ERC20(ETH_TOKEN_ADDRESS), 10000);
        cachedPrices[address(_token)] = expectedRate;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function syncPriceForTokenList(ERC20[] calldata _tokens) external {
        require(address(kyberNetwork) != address(0), "Kyber sync is disabled");
        for(uint16 i = 0; i < _tokens.length; i++) {
            (uint256 expectedRate,) = kyberNetwork.getExpectedRate(_tokens[i], ERC20(ETH_TOKEN_ADDRESS), 10000);
            cachedPrices[address(_tokens[i])] = expectedRate;
        }
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}