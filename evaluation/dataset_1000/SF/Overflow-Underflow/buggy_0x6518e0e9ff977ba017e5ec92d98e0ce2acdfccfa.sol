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
  function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address private _owner;

  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
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
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

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
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
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

	// Keep track of the parent master contract - cannot be changed once setfunction bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

	PaymentMaster public master;

	/**
	 * General constructor called by the master
	 */
	constructor(PaymentMaster _master) public {
		master = _master;
	}
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	/**
	 * Helper function to return the parent master's address
	 */
	function getMasterAddress() public view returns (address) {
		return address(master);
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
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

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
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }

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
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  address[] public handlerList;

	// A mapping of handler addresses for lookupsfunction bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}

	mapping(address => bool) public handlerMap;

	// Events triggered for listenersmapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }

	event HandlerCreated(address indexed _addr);mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }

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
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }

	/**
	 * This is a convenience method to allow watchers to get the entire list
	 */
	function getHandlerList() public view returns (address[] memory) {
			// Return the entire list
      return handlerList;
  }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	/**
	 * Allows caller to determine how long the handler list is for convenience
	 */
	function getHandlerListLength() public view returns (uint) {
		return handlerList.length;
	}
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

	/**
	 * This function is called by handlers when they receive ETH payments.
	 */
	function firePaymentReceivedEvent(address to, address from, uint256 amount) public {
		// Verify the call is coming from a handler
		require(handlerMap[msg.sender], "Only payment handlers are allowed to trigger payment events.");

		// Emit the event
		emit EthPaymentReceived(to, from, amount);
	}
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
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
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
}