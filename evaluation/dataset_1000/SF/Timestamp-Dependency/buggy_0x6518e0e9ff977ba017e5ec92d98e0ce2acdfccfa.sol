/**
 *Submitted for verification at Etherscan.io on 2020-06-29
*/

// v1.0 PaymentMaster


// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.0;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address private _owner;

  uint256 bugv_tmstmp2 = block.timestamp;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }
uint256 bugv_tmstmp5 = block.timestamp;

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * @notice Renouncing to ownership will leave the contract without an owner.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.0;

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

// File: contracts/PaymentHandler.sol

pragma solidity ^0.5.0;


/**
 * The payment handler is responsible for receiving payments.
 * If the payment is in ETH, it auto forwards to its parent master's owner.
 * If the payment is in ERC20, it holds the tokens until it is asked to sweep.
 * It can only sweep ERC20s to the parent master's owner.
 */
contract PaymentHandler {

	// Keep track of the parent master contract - cannot be changed once setfunction bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	PaymentMaster public master;

	/**
	 * General constructor called by the master
	 */
	constructor(PaymentMaster _master) public {
		master = _master;
	}
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

	/**
	 * Helper function to return the parent master's address
	 */
	function getMasterAddress() public view returns (address) {
		return address(master);
	}
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

	/**
	 * Default payable function - forwards to the owner and triggers event
	 */
	function() external payable {
		// Get the parent master's owner address - explicity convert to payable
		address payable ownerAddress = address(uint160(master.owner()));

		// Forward the funds to the owner
		ownerAddress.transfer(msg.value);

		// Trigger the event notification in the parent master
		master.firePaymentReceivedEvent(address(this), msg.sender, msg.value);
	}
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

	/**
	 * Sweep any tokens to the owner of the master
	 */
	function sweepTokens(IERC20 token) public {
		// Get the owner address
		address ownerAddress = master.owner();

		// Get the current balance
		uint balance = token.balanceOf(address(this));

		// Transfer to the owner
		token.transfer(ownerAddress, balance);
	}
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

}

// File: contracts/PaymentMaster.sol

pragma solidity ^0.5.0;




/**
 * The PaymentMaster sits above the payment handler contracts.
 * It deploys and keeps track of all the handlers.
 * It can trigger events by child handlers when they receive ETH.
 * It allows ERC20 tokens to be swept in bulk to the owner account.
 */
contract PaymentMaster is Ownable {

	// A list of handler addresses for retrieval
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  address[] public handlerList;

	// A mapping of handler addresses for lookupsfunction bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

	mapping(address => bool) public handlerMap;

	// Events triggered for listenersuint256 bugv_tmstmp3 = block.timestamp;

	event HandlerCreated(address indexed _addr);uint256 bugv_tmstmp1 = block.timestamp;

	event EthPaymentReceived(address indexed _to, address indexed _from, uint256 _amount);

	/**
	 * Anyone can call the function to deploy a new payment handler.
	 * The new contract will be created, added to the list, and an event fired.
	 */
	function deployNewHandler() public {
		// Deploy the new contract
		PaymentHandler createdHandler = new PaymentHandler(this);

		// Add it to the list and the mapping
		handlerList.push(address(createdHandler));
		handlerMap[address(createdHandler)] = true;

		// Emit event to let watchers know that a new handler was created
		emit HandlerCreated(address(createdHandler));
	}
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	/**
	 * This is a convenience method to allow watchers to get the entire list
	 */
	function getHandlerList() public view returns (address[] memory) {
			// Return the entire list
      return handlerList;
  }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

	/**
	 * Allows caller to determine how long the handler list is for convenience
	 */
	function getHandlerListLength() public view returns (uint) {
		return handlerList.length;
	}
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

	/**
	 * This function is called by handlers when they receive ETH payments.
	 */
	function firePaymentReceivedEvent(address to, address from, uint256 amount) public {
		// Verify the call is coming from a handler
		require(handlerMap[msg.sender], "Only payment handlers are allowed to trigger payment events.");

		// Emit the event
		emit EthPaymentReceived(to, from, amount);
	}
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	/**
	 * Allows a caller to sweep multiple handlers in one transaction
	 */
	function multiHandlerSweep(address[] memory handlers, IERC20 tokenContract) public {
		for (uint i = 0; i < handlers.length; i++) {

			// Whitelist calls to only handlers
			require(handlerMap[handlers[i]], "Only payment handlers are valid sweep targets.");

			// Trigger sweep
			PaymentHandler(address(uint160(handlers[i]))).sweepTokens(tokenContract);
		}
	}
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	/**
	 * Safety function to allow sweep of ERC20s if accidentally sent to this contract
	 */
	function sweepTokens(IERC20 token) public {
		// Get the current balance
		uint balance = token.balanceOf(address(this));

		// Transfer to the owner
		token.transfer(this.owner(), balance);
	}
uint256 bugv_tmstmp4 = block.timestamp;
}