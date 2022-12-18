pragma solidity >=0.5.4 <0.6.0;

interface tokenRecipient { function RECEIVEAPPROVAL642(address _from, uint256 _value, address _token, bytes calldata _extraData) external; }	//inject NONSTANDARD NAMING


                                                                                         
library SafeMath {

	                                                             
	function MUL582(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
		// Gas optimization: this is cheaper than asserting 'a' not being zero, but the
		// benefit is lost if 'b' is also tested.
		// See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
		if (a == 0) {
			return 0;
		}

		c = a * b;
		assert(c / a == b);
		return c;
	}

	                                                                           
	function DIV898(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		// assert(b > 0); // Solidity automatically throws when dividing by 0
		// uint256 c = a / b;
		// assert(a == b * c + a % b); // There is no case in which this doesn't hold
		return a / b;
	}

	                                                                                                         
	function SUB968(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		assert(b <= a);
		return a - b;
	}

	                                                       
	function ADD400(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
		c = a + b;
		assert(c >= a);
		return c;
	}
}


interface INameTAOPosition {
	function SENDERISADVOCATE537(address _sender, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function SENDERISLISTENER733(address _sender, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function SENDERISSPEAKER809(address _sender, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function SENDERISPOSITION472(address _sender, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function GETADVOCATE739(address _id) external view returns (address);	//inject NONSTANDARD NAMING
	function NAMEISADVOCATE68(address _nameId, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function NAMEISPOSITION674(address _nameId, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function INITIALIZE574(address _id, address _advocateId, address _listenerId, address _speakerId) external returns (bool);	//inject NONSTANDARD NAMING
	function DETERMINEPOSITION866(address _sender, address _id) external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface IAOSettingValue {
	function SETPENDINGVALUE853(uint256 _settingId, address _addressValue, bool _boolValue, bytes32 _bytesValue, string calldata _stringValue, uint256 _uintValue) external returns (bool);	//inject NONSTANDARD NAMING

	function MOVEPENDINGTOSETTING329(uint256 _settingId) external returns (bool);	//inject NONSTANDARD NAMING

	function SETTINGVALUE198(uint256 _settingId) external view returns (address, bool, bytes32, string memory, uint256);	//inject NONSTANDARD NAMING
}












contract TokenERC20 {
	// Public variables of the token
	string public name;
	string public symbol;
	uint8 public decimals = 18;
	// 18 decimals is the strongly suggested default, avoid changing it
	uint256 public totalSupply;

	// This creates an array with all balances
	mapping (address => uint256) public balanceOf;
	mapping (address => mapping (address => uint256)) public allowance;

	// This generates a public event on the blockchain that will notify clients
	event TRANSFER795(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

	// This generates a public event on the blockchain that will notify clients
	event APPROVAL398(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

	// This notifies clients about the amount burnt
	event BURN508(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

	                                                                                                                        
	constructor (uint256 initialSupply, string memory tokenName, string memory tokenSymbol) public {
		totalSupply = initialSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
		balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
		name = tokenName;                                   // Set the name for display purposes
		symbol = tokenSymbol;                               // Set the symbol for display purposes
	}

	                                                                   
	function _TRANSFER950(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
		// Prevent transfer to 0x0 address. Use burn() instead
		require(_to != address(0));
		// Check if the sender has enough
		require(balanceOf[_from] >= _value);
		// Check for overflows
		require(balanceOf[_to] + _value > balanceOf[_to]);
		// Save this for an assertion in the future
		uint previousBalances = balanceOf[_from] + balanceOf[_to];
		// Subtract from the sender
		balanceOf[_from] -= _value;
		// Add the same to the recipient
		balanceOf[_to] += _value;
		emit TRANSFER795(_from, _to, _value);
		// Asserts are used to use static analysis to find bugs in your code. They should never fail
		assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
	}

	                                                                                                                                                                         
	function TRANSFER456(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		_TRANSFER950(msg.sender, _to, _value);
		return true;
	}

	                                                                                                                                                                                                                                          
	function TRANSFERFROM918(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(_value <= allowance[_from][msg.sender]);     // Check allowance
		allowance[_from][msg.sender] -= _value;
		_TRANSFER950(_from, _to, _value);
		return true;
	}

	                                                                                                                                                                                                                                   
	function APPROVE906(address _spender, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		allowance[msg.sender][_spender] = _value;
		emit APPROVAL398(msg.sender, _spender, _value);
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                                 
	function APPROVEANDCALL369(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {	//inject NONSTANDARD NAMING
		tokenRecipient spender = tokenRecipient(_spender);
		if (APPROVE906(_spender, _value)) {
			spender.RECEIVEAPPROVAL642(msg.sender, _value, address(this), _extraData);
			return true;
		}
	}

	                                                                                                                                         
	function BURN404(uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
		balanceOf[msg.sender] -= _value;            // Subtract from the sender
		totalSupply -= _value;                      // Updates totalSupply
		emit BURN508(msg.sender, _value);
		return true;
	}

	                                                                                                                                                                                                                             
	function BURNFROM460(address _from, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
		require(_value <= allowance[_from][msg.sender]);    // Check allowance
		balanceOf[_from] -= _value;                         // Subtract from the targeted balance
		allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
		totalSupply -= _value;                              // Update totalSupply
		emit BURN508(_from, _value);
		return true;
	}
}


                     
contract TAO {
	using SafeMath for uint256;

	address public vaultAddress;
	string public name;				// the name for this TAO
	address public originId;		// the ID of the Name that created this TAO. If Name, it's the eth address

	// TAO's data
	string public datHash;
	string public database;
	string public keyValue;
	bytes32 public contentId;

	                                 
	uint8 public typeId;

	                                      
	constructor (string memory _name,
		address _originId,
		string memory _datHash,
		string memory _database,
		string memory _keyValue,
		bytes32 _contentId,
		address _vaultAddress
	) public {
		name = _name;
		originId = _originId;
		datHash = _datHash;
		database = _database;
		keyValue = _keyValue;
		contentId = _contentId;

		// Creating TAO
		typeId = 0;

		vaultAddress = _vaultAddress;
	}

	                                                             
	modifier ONLYVAULT682 {	//inject NONSTANDARD NAMING
		require (msg.sender == vaultAddress);
		_;
	}

	                                      
	function () external payable {
	}

	                                                                                                                                                                                                           
	function TRANSFERETH555(address payable _recipient, uint256 _amount) public ONLYVAULT682 returns (bool) {	//inject NONSTANDARD NAMING
		_recipient.transfer(_amount);
		return true;
	}

	                                                                                                                                                                                                                                                                            
	function TRANSFERERC20820(address _erc20TokenAddress, address _recipient, uint256 _amount) public ONLYVAULT682 returns (bool) {	//inject NONSTANDARD NAMING
		TokenERC20 _erc20 = TokenERC20(_erc20TokenAddress);
		_erc20.TRANSFER456(_recipient, _amount);
		return true;
	}
}




                      
contract Name is TAO {
	                                      
	constructor (string memory _name, address _originId, string memory _datHash, string memory _database, string memory _keyValue, bytes32 _contentId, address _vaultAddress)
		TAO (_name, _originId, _datHash, _database, _keyValue, _contentId, _vaultAddress) public {
		// Creating Name
		typeId = 1;
	}
}




                           
library AOLibrary {
	using SafeMath for uint256;

	uint256 constant private _multiplier_divisor390 = 10 ** 6; // 1000000 = 1	//inject NONSTANDARD NAMING
	uint256 constant private _percentage_divisor766 = 10 ** 6; // 100% = 1000000	//inject NONSTANDARD NAMING

	                                                                                                                                             
	function ISTAO415(address _taoId) public view returns (bool) {	//inject NONSTANDARD NAMING
		return (_taoId != address(0) && bytes(TAO(address(uint160(_taoId))).name()).length > 0 && TAO(address(uint160(_taoId))).originId() != address(0) && TAO(address(uint160(_taoId))).typeId() == 0);
	}

	                                                                                                                                                 
	function ISNAME432(address _nameId) public view returns (bool) {	//inject NONSTANDARD NAMING
		return (_nameId != address(0) && bytes(TAO(address(uint160(_nameId))).name()).length > 0 && Name(address(uint160(_nameId))).originId() != address(0) && Name(address(uint160(_nameId))).typeId() == 1);
	}

	                                                                                                                                   
	function ISVALIDERC20TOKENADDRESS211(address _tokenAddress) public view returns (bool) {	//inject NONSTANDARD NAMING
		if (_tokenAddress == address(0)) {
			return false;
		}
		TokenERC20 _erc20 = TokenERC20(_tokenAddress);
		return (_erc20.totalSupply() >= 0 && bytes(_erc20.name()).length > 0 && bytes(_erc20.symbol()).length > 0);
	}

	                                                                                                                                                                                                                                                                                                                                                 
	function ISTHEAO191(address _sender, address _theAO, address _nameTAOPositionAddress) public view returns (bool) {	//inject NONSTANDARD NAMING
		return (_sender == _theAO ||
			(
				(ISTAO415(_theAO) || ISNAME432(_theAO)) &&
				_nameTAOPositionAddress != address(0) &&
				INameTAOPosition(_nameTAOPositionAddress).SENDERISADVOCATE537(_sender, _theAO)
			)
		);
	}

	                                                                                                                                                                                       
	function PERCENTAGE_DIVISOR626() public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return _percentage_divisor766;
	}

	                                                                                                                                                                                        
	function MULTIPLIER_DIVISOR950() public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return _multiplier_divisor390;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                             
	function DEPLOYTAO680(string memory _name,	//inject NONSTANDARD NAMING
		address _originId,
		string memory _datHash,
		string memory _database,
		string memory _keyValue,
		bytes32 _contentId,
		address _nameTAOVaultAddress
		) public returns (TAO _tao) {
		_tao = new TAO(_name, _originId, _datHash, _database, _keyValue, _contentId, _nameTAOVaultAddress);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                       
	function DEPLOYNAME658(string memory _name,	//inject NONSTANDARD NAMING
		address _originId,
		string memory _datHash,
		string memory _database,
		string memory _keyValue,
		bytes32 _contentId,
		address _nameTAOVaultAddress
		) public returns (Name _myName) {
		_myName = new Name(_name, _originId, _datHash, _database, _keyValue, _contentId, _nameTAOVaultAddress);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	function CALCULATEWEIGHTEDMULTIPLIER935(uint256 _currentWeightedMultiplier, uint256 _currentPrimordialBalance, uint256 _additionalWeightedMultiplier, uint256 _additionalPrimordialAmount) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		if (_currentWeightedMultiplier > 0) {
			uint256 _totalWeightedIons = (_currentWeightedMultiplier.MUL582(_currentPrimordialBalance)).ADD400(_additionalWeightedMultiplier.MUL582(_additionalPrimordialAmount));
			uint256 _totalIons = _currentPrimordialBalance.ADD400(_additionalPrimordialAmount);
			return _totalWeightedIons.DIV898(_totalIons);
		} else {
			return _additionalWeightedMultiplier;
		}
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
	function CALCULATEPRIMORDIALMULTIPLIER427(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		if (_purchaseAmount > 0 && _purchaseAmount <= _totalPrimordialMintable.SUB968(_totalPrimordialMinted)) {
			                                                                                 
			uint256 temp = _totalPrimordialMinted.ADD400(_purchaseAmount.DIV898(2));

			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			uint256 multiplier = (_multiplier_divisor390.SUB968(_multiplier_divisor390.MUL582(temp).DIV898(_totalPrimordialMintable))).MUL582(_startingMultiplier.SUB968(_endingMultiplier));
			                                                                                                                                         
			return multiplier.DIV898(_multiplier_divisor390);
		} else {
			return 0;
		}
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	function CALCULATENETWORKBONUSPERCENTAGE277(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		if (_purchaseAmount > 0 && _purchaseAmount <= _totalPrimordialMintable.SUB968(_totalPrimordialMinted)) {
			                                                                           
			uint256 temp = _totalPrimordialMinted.ADD400(_purchaseAmount.DIV898(2));

			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
			uint256 bonusPercentage = (_percentage_divisor766.SUB968(_percentage_divisor766.MUL582(temp).DIV898(_totalPrimordialMintable))).MUL582(_startingMultiplier.SUB968(_endingMultiplier)).DIV898(_percentage_divisor766);
			return bonusPercentage;
		} else {
			return 0;
		}
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	function CALCULATENETWORKBONUSAMOUNT972(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 bonusPercentage = CALCULATENETWORKBONUSPERCENTAGE277(_purchaseAmount, _totalPrimordialMintable, _totalPrimordialMinted, _startingMultiplier, _endingMultiplier);
		                                                                                                                                                                    
		uint256 networkBonus = bonusPercentage.MUL582(_purchaseAmount).DIV898(_percentage_divisor766);
		return networkBonus;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	function CALCULATEMAXIMUMBURNAMOUNT331(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _maximumMultiplier) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return (_maximumMultiplier.MUL582(_primordialBalance).SUB968(_primordialBalance.MUL582(_currentWeightedMultiplier))).DIV898(_maximumMultiplier);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	function CALCULATEMULTIPLIERAFTERBURN415(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _amountToBurn) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return _primordialBalance.MUL582(_currentWeightedMultiplier).DIV898(_primordialBalance.SUB968(_amountToBurn));
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	function CALCULATEMULTIPLIERAFTERCONVERSION543(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _amountToConvert) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return _primordialBalance.MUL582(_currentWeightedMultiplier).DIV898(_primordialBalance.ADD400(_amountToConvert));
	}

	                                                                                                                            
	function NUMDIGITS252(uint256 number) public pure returns (uint8) {	//inject NONSTANDARD NAMING
		uint8 digits = 0;
		while(number != 0) {
			number = number.DIV898(10);
			digits++;
		}
		return digits;
	}
}



contract TheAO {
	address public theAO;
	address public nameTAOPositionAddress;

	// Check whether an address is whitelisted and granted access to transact
	// on behalf of others
	mapping (address => bool) public whitelist;

	constructor() public {
		theAO = msg.sender;
	}

	                                                       
	modifier INWHITELIST35() {	//inject NONSTANDARD NAMING
		require (whitelist[msg.sender] == true);
		_;
	}

	                                                                                                                 
	function TRANSFEROWNERSHIP634(address _theAO) public {	//inject NONSTANDARD NAMING
		require (msg.sender == theAO);
		require (_theAO != address(0));
		theAO = _theAO;
	}

	                                                                                                                                                                            
	function SETWHITELIST443(address _account, bool _whitelist) public {	//inject NONSTANDARD NAMING
		require (msg.sender == theAO);
		require (_account != address(0));
		whitelist[_account] = _whitelist;
	}
}



                                   
contract AOSettingValue is TheAO, IAOSettingValue {
	struct PendingValue {
		address addressValue;
		bool boolValue;
		bytes32 bytesValue;
		string stringValue;
		uint256 uintValue;
	}

	struct SettingValue {
		address addressValue;
		bool boolValue;
		bytes32 bytesValue;
		string stringValue;
		uint256 uintValue;
	}

	// Mapping from settingId to PendingValue
	mapping (uint256 => PendingValue) internal pendingValues;

	// Mapping from settingId to SettingValue
	mapping (uint256 => SettingValue) internal settingValues;

	                                      
	constructor(address _nameTAOPositionAddress) public {
		SETNAMETAOPOSITIONADDRESS385(_nameTAOPositionAddress);
	}

	                                                                                                                                                             
	modifier ONLYTHEAO756 {	//inject NONSTANDARD NAMING
		require (AOLibrary.ISTHEAO191(msg.sender, theAO, nameTAOPositionAddress));
		_;
	}

	                                 
	                                                                                                                 
	function TRANSFEROWNERSHIP634(address _theAO) public ONLYTHEAO756 {	//inject NONSTANDARD NAMING
		require (_theAO != address(0));
		theAO = _theAO;
	}

	                                                                                                                                                                            
	function SETWHITELIST443(address _account, bool _whitelist) public ONLYTHEAO756 {	//inject NONSTANDARD NAMING
		require (_account != address(0));
		whitelist[_account] = _whitelist;
	}

	                                                                                                                          
	function SETNAMETAOPOSITIONADDRESS385(address _nameTAOPositionAddress) public ONLYTHEAO756 {	//inject NONSTANDARD NAMING
		require (_nameTAOPositionAddress != address(0));
		nameTAOPositionAddress = _nameTAOPositionAddress;
	}

	                            
	                                                                                                                                                                                                                                                                                                                                                                       
	function SETPENDINGVALUE853(uint256 _settingId,	//inject NONSTANDARD NAMING
		address _addressValue,
		bool _boolValue,
		bytes32 _bytesValue,
		string calldata _stringValue,
		uint256 _uintValue) external INWHITELIST35 returns (bool) {
		PendingValue storage _pendingValue = pendingValues[_settingId];
		_pendingValue.addressValue = _addressValue;
		_pendingValue.boolValue = _boolValue;
		_pendingValue.bytesValue = _bytesValue;
		_pendingValue.stringValue = _stringValue;
		_pendingValue.uintValue = _uintValue;
		return true;
	}

	                                                                                                                            
	function MOVEPENDINGTOSETTING329(uint256 _settingId) external INWHITELIST35 returns (bool) {	//inject NONSTANDARD NAMING
		PendingValue memory _pendingValue = pendingValues[_settingId];
		SettingValue storage _settingValue = settingValues[_settingId];
		_settingValue.addressValue = _pendingValue.addressValue;
		_settingValue.boolValue = _pendingValue.boolValue;
		_settingValue.bytesValue = _pendingValue.bytesValue;
		_settingValue.stringValue = _pendingValue.stringValue;
		_settingValue.uintValue = _pendingValue.uintValue;
		delete pendingValues[_settingId];
		return true;
	}

	                                                                                                                                                                                                                                                
	function SETTINGVALUE198(uint256 _settingId) external view returns (address, bool, bytes32, string memory, uint256) {	//inject NONSTANDARD NAMING
		SettingValue memory _settingValue = settingValues[_settingId];
		return (
			_settingValue.addressValue,
			_settingValue.boolValue,
			_settingValue.bytesValue,
			_settingValue.stringValue,
			_settingValue.uintValue
		);
	}

	                                                                                                                                                                                                                                                
	function PENDINGVALUE788(uint256 _settingId) public view returns (address, bool, bytes32, string memory, uint256) {	//inject NONSTANDARD NAMING
		PendingValue memory _pendingValue = pendingValues[_settingId];
		return (
			_pendingValue.addressValue,
			_pendingValue.boolValue,
			_pendingValue.bytesValue,
			_pendingValue.stringValue,
			_pendingValue.uintValue
		);
	}
}