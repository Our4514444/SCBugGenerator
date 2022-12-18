/**
 *Submitted for verification at Etherscan.io on 2020-08-20
*/

// File: contracts/src/common/lifecycle/Killable.sol

pragma solidity ^0.5.0;

/**
 * A module that allows contracts to self-destruct.
 */
contract Killable {
	address payable public _owner;

	/**
	 * Initialized with the deployer as the owner.
	 */
	constructor() internal {
		_owner = msg.sender;
	}

	/**
	 * Self-destruct the contract.
	 * This function can only be executed by the owner.
	 */
	function kill() public {
		require(msg.sender == _owner, "only owner method");
		selfdestruct(_owner);
	}
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity ^0.5.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
	// Empty internal constructor, to prevent people from mistakenly deploying
	// an instance of this contract, which should be used via inheritance.
	constructor() internal {}

	// solhint-disable-previous-line no-empty-blocks

	function _msgSender() internal view returns (address payable) {
		return msg.sender;
	}

	function _msgData() internal view returns (bytes memory) {
		this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
		return msg.data;
	}
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

pragma solidity ^0.5.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
	address private _owner;
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}

	event OwnershipTransferred(
		address indexed previousOwner,
		address indexed newOwner
	);

	/**
	 * @dev Initializes the contract setting the deployer as the initial owner.
	 */
	constructor() internal {
		address msgSender = _msgSender();
		_owner = msgSender;
		emit OwnershipTransferred(address(0), msgSender);
	}

	/**
	 * @dev Returns the address of the current owner.
	 */
	function owner() public view returns (address) {
		return _owner;
	}

	/**
	 * @dev Throws if called by any account other than the owner.
	 */
	modifier onlyOwner() {
		require(isOwner(), "Ownable: caller is not the owner");
		_;
	}

	/**
	 * @dev Returns true if the caller is the current owner.
	 */
	function isOwner() public view returns (bool) {
		return _msgSender() == _owner;
	}

	/**
	 * @dev Leaves the contract without owner. It will not be possible to call
	 * `onlyOwner` functions anymore. Can only be called by the current owner.
	 *
	 * NOTE: Renouncing ownership will leave the contract without an owner,
	 * thereby removing any functionality that is only available to the owner.
	 */
	function renounceOwnership() public onlyOwner {
		emit OwnershipTransferred(_owner, address(0));
		_owner = address(0);
	}

	/**
	 * @dev Transfers ownership of the contract to a new account (`newOwner`).
	 * Can only be called by the current owner.
	 */
	function transferOwnership(address newOwner) public onlyOwner {
		_transferOwnership(newOwner);
	}

	/**
	 * @dev Transfers ownership of the contract to a new account (`newOwner`).
	 */
	function _transferOwnership(address newOwner) internal {
		require(
			newOwner != address(0),
			"Ownable: new owner is the zero address"
		);
		emit OwnershipTransferred(_owner, newOwner);
		_owner = newOwner;
	}
}

// File: contracts/src/common/interface/IGroup.sol

pragma solidity ^0.5.0;

contract IGroup {
	function isGroup(address _addr) public view returns (bool);

	function addGroup(address _addr) external;

	function getGroupKey(address _addr) internal pure returns (bytes32) {
		return keccak256(abi.encodePacked("_group", _addr));
	}
}

// File: contracts/src/common/validate/AddressValidator.sol

pragma solidity ^0.5.0;

/**
 * A module that provides common validations patterns.
 */
contract AddressValidator {
	string constant errorMessage = "this is illegal address";

	/**
	 * Validates passed address is not a zero address.
	 */
	function validateIllegalAddress(address _addr) external pure {
		require(_addr != address(0), errorMessage);
	}

	/**
	 * Validates passed address is included in an address set.
	 */
	function validateGroup(address _addr, address _groupAddr) external view {
		require(IGroup(_groupAddr).isGroup(_addr), errorMessage);
	}

	/**
	 * Validates passed address is included in two address sets.
	 */
	function validateGroups(
		address _addr,
		address _groupAddr1,
		address _groupAddr2
	) external view {
		if (IGroup(_groupAddr1).isGroup(_addr)) {
			return;
		}
		require(IGroup(_groupAddr2).isGroup(_addr), errorMessage);
	}

	/**
	 * Validates that the address of the first argument is equal to the address of the second argument.
	 */
	function validateAddress(address _addr, address _target) external pure {
		require(_addr == _target, errorMessage);
	}

	/**
	 * Validates passed address equals to the two addresses.
	 */
	function validateAddresses(
		address _addr,
		address _target1,
		address _target2
	) external pure {
		if (_addr == _target1) {
			return;
		}
		require(_addr == _target2, errorMessage);
	}

	/**
	 * Validates passed address equals to the three addresses.
	 */
	function validate3Addresses(
		address _addr,
		address _target1,
		address _target2,
		address _target3
	) external pure {
		if (_addr == _target1) {
			return;
		}
		if (_addr == _target2) {
			return;
		}
		require(_addr == _target3, errorMessage);
	}
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
}

// File: contracts/src/common/validate/UsingValidator.sol

pragma solidity ^0.5.0;

// prettier-ignore

/**
 * Module for contrast handling AddressValidator.
 */
contract UsingValidator {
	AddressValidator private _validator;

	/**
	 * Create a new AddressValidator contract when initialize.
	 */
	constructor() public {
		_validator = new AddressValidator();
	}
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }

	/**
	 * Returns the set AddressValidator address.
	 */
	function addressValidator() internal view returns (AddressValidator) {
		return _validator;
	}
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
}

// File: contracts/src/common/config/AddressConfig.sol

pragma solidity ^0.5.0;

/**
 * A registry contract to hold the latest contract addresses.
 * Dev Protocol will be upgradeable by this contract.
 */
contract AddressConfig is Ownable, UsingValidator, Killable {
	address public token = 0x98626E2C9231f03504273d55f397409deFD4a093;
	address public allocator;
	address public allocatorStorage;
	address public withdraw;
	address public withdrawStorage;
	address public marketFactory;
	address public marketGroup;
	address public propertyFactory;
	address public propertyGroup;
	address public metricsGroup;
	address public metricsFactory;
	address public policy;
	address public policyFactory;
	address public policySet;
	address public policyGroup;
	address public lockup;
	address public lockupStorage;
	address public voteTimes;
	address public voteTimesStorage;
	address public voteCounter;
	address public voteCounterStorage;

	/**
	 * Set the latest Allocator contract address.
	 * Only the owner can execute this function.
	 */
	function setAllocator(address _addr) external onlyOwner {
		allocator = _addr;
	}
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

	/**
	 * Set the latest AllocatorStorage contract address.
	 * Only the owner can execute this function.
	 * NOTE: But currently, the AllocatorStorage contract is not used.
	 */
	function setAllocatorStorage(address _addr) external onlyOwner {
		allocatorStorage = _addr;
	}
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }

	/**
	 * Set the latest Withdraw contract address.
	 * Only the owner can execute this function.
	 */
	function setWithdraw(address _addr) external onlyOwner {
		withdraw = _addr;
	}
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

	/**
	 * Set the latest WithdrawStorage contract address.
	 * Only the owner can execute this function.
	 */
	function setWithdrawStorage(address _addr) external onlyOwner {
		withdrawStorage = _addr;
	}
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

	/**
	 * Set the latest MarketFactory contract address.
	 * Only the owner can execute this function.
	 */
	function setMarketFactory(address _addr) external onlyOwner {
		marketFactory = _addr;
	}
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

	/**
	 * Set the latest MarketGroup contract address.
	 * Only the owner can execute this function.
	 */
	function setMarketGroup(address _addr) external onlyOwner {
		marketGroup = _addr;
	}
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

	/**
	 * Set the latest PropertyFactory contract address.
	 * Only the owner can execute this function.
	 */
	function setPropertyFactory(address _addr) external onlyOwner {
		propertyFactory = _addr;
	}
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

	/**
	 * Set the latest PropertyGroup contract address.
	 * Only the owner can execute this function.
	 */
	function setPropertyGroup(address _addr) external onlyOwner {
		propertyGroup = _addr;
	}
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

	/**
	 * Set the latest MetricsFactory contract address.
	 * Only the owner can execute this function.
	 */
	function setMetricsFactory(address _addr) external onlyOwner {
		metricsFactory = _addr;
	}
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }

	/**
	 * Set the latest MetricsGroup contract address.
	 * Only the owner can execute this function.
	 */
	function setMetricsGroup(address _addr) external onlyOwner {
		metricsGroup = _addr;
	}
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }

	/**
	 * Set the latest PolicyFactory contract address.
	 * Only the owner can execute this function.
	 */
	function setPolicyFactory(address _addr) external onlyOwner {
		policyFactory = _addr;
	}
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

	/**
	 * Set the latest PolicyGroup contract address.
	 * Only the owner can execute this function.
	 */
	function setPolicyGroup(address _addr) external onlyOwner {
		policyGroup = _addr;
	}
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

	/**
	 * Set the latest PolicySet contract address.
	 * Only the owner can execute this function.
	 */
	function setPolicySet(address _addr) external onlyOwner {
		policySet = _addr;
	}
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

	/**
	 * Set the latest Policy contract address.
	 * Only the latest PolicyFactory contract can execute this function.
	 */
	function setPolicy(address _addr) external {
		addressValidator().validateAddress(msg.sender, policyFactory);
		policy = _addr;
	}
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

	/**
	 * Set the latest Dev contract address.
	 * Only the owner can execute this function.
	 */
	function setToken(address _addr) external onlyOwner {
		token = _addr;
	}
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

	/**
	 * Set the latest Lockup contract address.
	 * Only the owner can execute this function.
	 */
	function setLockup(address _addr) external onlyOwner {
		lockup = _addr;
	}
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }

	/**
	 * Set the latest LockupStorage contract address.
	 * Only the owner can execute this function.
	 * NOTE: But currently, the LockupStorage contract is not used as a stand-alone because it is inherited from the Lockup contract.
	 */
	function setLockupStorage(address _addr) external onlyOwner {
		lockupStorage = _addr;
	}
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}

	/**
	 * Set the latest VoteTimes contract address.
	 * Only the owner can execute this function.
	 * NOTE: But currently, the VoteTimes contract is not used.
	 */
	function setVoteTimes(address _addr) external onlyOwner {
		voteTimes = _addr;
	}
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }

	/**
	 * Set the latest VoteTimesStorage contract address.
	 * Only the owner can execute this function.
	 * NOTE: But currently, the VoteTimesStorage contract is not used.
	 */
	function setVoteTimesStorage(address _addr) external onlyOwner {
		voteTimesStorage = _addr;
	}
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }

	/**
	 * Set the latest VoteCounter contract address.
	 * Only the owner can execute this function.
	 */
	function setVoteCounter(address _addr) external onlyOwner {
		voteCounter = _addr;
	}
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

	/**
	 * Set the latest VoteCounterStorage contract address.
	 * Only the owner can execute this function.
	 * NOTE: But currently, the VoteCounterStorage contract is not used as a stand-alone because it is inherited from the VoteCounter contract.
	 */
	function setVoteCounterStorage(address _addr) external onlyOwner {
		voteCounterStorage = _addr;
	}
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
}

// File: contracts/src/common/config/UsingConfig.sol

pragma solidity ^0.5.0;

/**
 * Module for using AddressConfig contracts.
 */
contract UsingConfig {
	AddressConfig private _config;

	/**
	 * Initialize the argument as AddressConfig address.
	 */
	constructor(address _addressConfig) public {
		_config = AddressConfig(_addressConfig);
	}
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }

	/**
	 * Returns the latest AddressConfig instance.
	 */
	function config() internal view returns (AddressConfig) {
		return _config;
	}
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}

	/**
	 * Returns the latest AddressConfig address.
	 */
	function configAddress() external view returns (address) {
		return address(_config);
	}
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
}

// File: contracts/src/metrics/IMetrics.sol

pragma solidity ^0.5.0;

contract IMetrics {
	address public market;
	address public property;
}

// File: contracts/src/metrics/Metrics.sol

pragma solidity ^0.5.0;

/**
 * A contract for associating a Property and an asset authenticated by a Market.
 */
contract Metrics is IMetrics {
	address public market;
	address public property;

	constructor(address _market, address _property) public {
		//Do not validate because there is no AddressConfig
		market = _market;
		property = _property;
	}
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
}

// File: contracts/src/metrics/IMetricsGroup.sol

pragma solidity ^0.5.0;

contract IMetricsGroup is IGroup {
	function removeGroup(address _addr) external;
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

	function totalIssuedMetrics() external view returns (uint256);
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

	function getMetricsCountPerProperty(address _property)
		public
		view
		returns (uint256);
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

	function hasAssets(address _property) public view returns (bool);
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
}

// File: contracts/src/metrics/IMetricsFactory.sol

pragma solidity ^0.5.0;

contract IMetricsFactory {
	function create(address _property) external returns (address);
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

	function destroy(address _metrics) external;
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
}

// File: contracts/src/metrics/MetricsFactory.sol

pragma solidity ^0.5.0;

/**
 * A factory contract for creating new Metrics contracts and logical deletion of Metrics contracts.
 */
contract MetricsFactory is UsingConfig, UsingValidator, IMetricsFactory {function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

	event Create(address indexed _from, address _metrics);function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}

	event Destroy(address indexed _from, address _metrics);

	/**
	 * Initialize the passed address as AddressConfig address.
	 */
	// solium-disable-next-line no-empty-blocks
	constructor(address _config) public UsingConfig(_config) {}
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

	/**
	 * Creates a new Metrics contract.
	 */
	function create(address _property) external returns (address) {
		/**
		 * Validates the sender is included in the Market address set.
		 */
		addressValidator().validateGroup(msg.sender, config().marketGroup());

		/**
		 * Creates a new Metrics contract.
		 */
		Metrics metrics = new Metrics(msg.sender, _property);

		/**
		 *  Adds the new Metrics contract to the Metrics address set.
		 */
		IMetricsGroup metricsGroup = IMetricsGroup(config().metricsGroup());
		address metricsAddress = address(metrics);
		metricsGroup.addGroup(metricsAddress);

		emit Create(msg.sender, metricsAddress);
		return metricsAddress;
	}
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

	/**
	 * Logical deletions a Metrics contract.
	 */
	function destroy(address _metrics) external {
		/**
		 * Validates the passed address is included in the Metrics address set.
		 */
		IMetricsGroup metricsGroup = IMetricsGroup(config().metricsGroup());
		require(metricsGroup.isGroup(_metrics), "address is not metrics");

		/**
		 * Validates the sender is included in the Market address set.
		 */
		addressValidator().validateGroup(msg.sender, config().marketGroup());

		/**
		 *  Validates the sender is the Market contract associated with the passed Metrics.
		 */
		Metrics metrics = Metrics(_metrics);
		addressValidator().validateAddress(msg.sender, metrics.market());

		/**
		 * Logical deletions a Metrics contract.
		 */
		IMetricsGroup(config().metricsGroup()).removeGroup(_metrics);
		emit Destroy(msg.sender, _metrics);
	}
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
}