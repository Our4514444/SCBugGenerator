pragma solidity >=0.5.4 <0.6.0;

interface tokenRecipient { function RECEIVEAPPROVAL411(address _from, uint256 _value, address _token, bytes calldata _extraData) external; }	//inject NONSTANDARD NAMING


contract TheAO {
	address public theAO;
	address public nameTAOPositionAddress;

	// Check whether an address is whitelisted and granted access to transact
	// on behalf of others
	mapping (address => bool) public whitelist;

	constructor() public {
		theAO = msg.sender;
	}

	                                                       
	modifier INWHITELIST936() {	//inject NONSTANDARD NAMING
		require (whitelist[msg.sender] == true);
		_;
	}

	                                                                                                                 
	function TRANSFEROWNERSHIP644(address _theAO) public {	//inject NONSTANDARD NAMING
		require (msg.sender == theAO);
		require (_theAO != address(0));
		theAO = _theAO;
	}

	                                                                                                                                                                            
	function SETWHITELIST171(address _account, bool _whitelist) public {	//inject NONSTANDARD NAMING
		require (msg.sender == theAO);
		require (_account != address(0));
		whitelist[_account] = _whitelist;
	}
}


                                                                                         
library SafeMath {

	                                                             
	function MUL886(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
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

	                                                                           
	function DIV243(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		// assert(b > 0); // Solidity automatically throws when dividing by 0
		// uint256 c = a / b;
		// assert(a == b * c + a % b); // There is no case in which this doesn't hold
		return a / b;
	}

	                                                                                                         
	function SUB542(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		assert(b <= a);
		return a - b;
	}

	                                                       
	function ADD927(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
		c = a + b;
		assert(c >= a);
		return c;
	}
}


interface INameAccountRecovery {
	function ISCOMPROMISED141(address _id) external view returns (bool);	//inject NONSTANDARD NAMING
}


interface INamePublicKey {
	function INITIALIZE254(address _id, address _defaultKey, address _writerKey) external returns (bool);	//inject NONSTANDARD NAMING

	function ISKEYEXIST939(address _id, address _key) external view returns (bool);	//inject NONSTANDARD NAMING

	function GETDEFAULTKEY207(address _id) external view returns (address);	//inject NONSTANDARD NAMING

	function WHITELISTADDKEY745(address _id, address _key) external returns (bool);	//inject NONSTANDARD NAMING
}


interface INameTAOPosition {
	function SENDERISADVOCATE705(address _sender, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function SENDERISLISTENER282(address _sender, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function SENDERISSPEAKER423(address _sender, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function SENDERISPOSITION396(address _sender, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function GETADVOCATE677(address _id) external view returns (address);	//inject NONSTANDARD NAMING
	function NAMEISADVOCATE623(address _nameId, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function NAMEISPOSITION235(address _nameId, address _id) external view returns (bool);	//inject NONSTANDARD NAMING
	function INITIALIZE254(address _id, address _advocateId, address _listenerId, address _speakerId) external returns (bool);	//inject NONSTANDARD NAMING
	function DETERMINEPOSITION742(address _sender, address _id) external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface IAOSetting {
	function GETSETTINGVALUESBYTAONAME827(address _taoId, string calldata _settingName) external view returns (uint256, bool, address, bytes32, string memory);	//inject NONSTANDARD NAMING
	function GETSETTINGTYPES357() external view returns (uint8, uint8, uint8, uint8, uint8);	//inject NONSTANDARD NAMING

	function SETTINGTYPELOOKUP987(uint256 _settingId) external view returns (uint8);	//inject NONSTANDARD NAMING
}


interface IAOIonLot {
	function CREATEPRIMORDIALLOT927(address _account, uint256 _primordialAmount, uint256 _multiplier, uint256 _networkBonusAmount) external returns (bytes32);	//inject NONSTANDARD NAMING

	function CREATEWEIGHTEDMULTIPLIERLOT236(address _account, uint256 _amount, uint256 _weightedMultiplier) external returns (bytes32);	//inject NONSTANDARD NAMING

	function LOTBYID192(bytes32 _lotId) external view returns (bytes32, address, uint256, uint256);	//inject NONSTANDARD NAMING

	function TOTALLOTSBYADDRESS489(address _lotOwner) external view returns (uint256);	//inject NONSTANDARD NAMING

	function CREATEBURNLOT932(address _account, uint256 _amount, uint256 _multiplierAfterBurn) external returns (bool);	//inject NONSTANDARD NAMING

	function CREATECONVERTLOT481(address _account, uint256 _amount, uint256 _multiplierAfterConversion) external returns (bool);	//inject NONSTANDARD NAMING
}


interface INameFactory {
	function NONCES560(address _nameId) external view returns (uint256);	//inject NONSTANDARD NAMING
	function INCREMENTNONCE743(address _nameId) external returns (uint256);	//inject NONSTANDARD NAMING
	function ETHADDRESSTONAMEID742(address _ethAddress) external view returns (address);	//inject NONSTANDARD NAMING
	function SETNAMENEWADDRESS869(address _id, address _newAddress) external returns (bool);	//inject NONSTANDARD NAMING
	function NAMEIDTOETHADDRESS934(address _nameId) external view returns (address);	//inject NONSTANDARD NAMING
}


interface IAOContent {
	function CREATE990(address _creator, string calldata _baseChallenge, uint256 _fileSize, bytes32 _contentUsageType, address _taoId) external returns (bytes32);	//inject NONSTANDARD NAMING

	function ISAOCONTENTUSAGETYPE884(bytes32 _contentId) external view returns (bool);	//inject NONSTANDARD NAMING

	function GETBYID713(bytes32 _contentId) external view returns (address, uint256, bytes32, address, bytes32, uint8, bytes32, bytes32, string memory);	//inject NONSTANDARD NAMING

	function GETBASECHALLENGE374(bytes32 _contentId) external view returns (string memory);	//inject NONSTANDARD NAMING
}


interface IAOTreasury {
	function TOBASE998(uint256 integerAmount, uint256 fractionAmount, bytes8 denominationName) external view returns (uint256);	//inject NONSTANDARD NAMING
	function ISDENOMINATIONEXIST355(bytes8 denominationName) external view returns (bool);	//inject NONSTANDARD NAMING
}


interface IAOStakedContent {
	function GETBYID713(bytes32 _stakedContentId) external view returns (bytes32, address, uint256, uint256, uint256, uint256, bool, uint256);	//inject NONSTANDARD NAMING

	function CREATE990(address _stakeOwner, bytes32 _contentId, uint256 _networkIntegerAmount, uint256 _networkFractionAmount, bytes8 _denomination, uint256 _primordialAmount, uint256 _profitPercentage) external returns (bytes32);	//inject NONSTANDARD NAMING

	function ISACTIVE109(bytes32 _stakedContentId) external view returns (bool);	//inject NONSTANDARD NAMING
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
	event TRANSFER767(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

	// This generates a public event on the blockchain that will notify clients
	event APPROVAL62(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

	// This notifies clients about the amount burnt
	event BURN755(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

	                                                                                                                        
	constructor (uint256 initialSupply, string memory tokenName, string memory tokenSymbol) public {
		totalSupply = initialSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
		balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
		name = tokenName;                                   // Set the name for display purposes
		symbol = tokenSymbol;                               // Set the symbol for display purposes
	}

	                                                                   
	function _TRANSFER699(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
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
		emit TRANSFER767(_from, _to, _value);
		// Asserts are used to use static analysis to find bugs in your code. They should never fail
		assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
	}

	                                                                                                                                                                         
	function TRANSFER800(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		_TRANSFER699(msg.sender, _to, _value);
		return true;
	}

	                                                                                                                                                                                                                                          
	function TRANSFERFROM752(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(_value <= allowance[_from][msg.sender]);     // Check allowance
		allowance[_from][msg.sender] -= _value;
		_TRANSFER699(_from, _to, _value);
		return true;
	}

	                                                                                                                                                                                                                                   
	function APPROVE634(address _spender, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		allowance[msg.sender][_spender] = _value;
		emit APPROVAL62(msg.sender, _spender, _value);
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                                 
	function APPROVEANDCALL505(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {	//inject NONSTANDARD NAMING
		tokenRecipient spender = tokenRecipient(_spender);
		if (APPROVE634(_spender, _value)) {
			spender.RECEIVEAPPROVAL411(msg.sender, _value, address(this), _extraData);
			return true;
		}
	}

	                                                                                                                                         
	function BURN398(uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
		balanceOf[msg.sender] -= _value;            // Subtract from the sender
		totalSupply -= _value;                      // Updates totalSupply
		emit BURN755(msg.sender, _value);
		return true;
	}

	                                                                                                                                                                                                                             
	function BURNFROM477(address _from, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
		require(_value <= allowance[_from][msg.sender]);    // Check allowance
		balanceOf[_from] -= _value;                         // Subtract from the targeted balance
		allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
		totalSupply -= _value;                              // Update totalSupply
		emit BURN755(_from, _value);
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

	                                                             
	modifier ONLYVAULT281 {	//inject NONSTANDARD NAMING
		require (msg.sender == vaultAddress);
		_;
	}

	                                      
	function () external payable {
	}

	                                                                                                                                                                                                           
	function TRANSFERETH628(address payable _recipient, uint256 _amount) public ONLYVAULT281 returns (bool) {	//inject NONSTANDARD NAMING
		_recipient.transfer(_amount);
		return true;
	}

	                                                                                                                                                                                                                                                                            
	function TRANSFERERC20604(address _erc20TokenAddress, address _recipient, uint256 _amount) public ONLYVAULT281 returns (bool) {	//inject NONSTANDARD NAMING
		TokenERC20 _erc20 = TokenERC20(_erc20TokenAddress);
		_erc20.TRANSFER800(_recipient, _amount);
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

	uint256 constant private _multiplier_divisor887 = 10 ** 6; // 1000000 = 1	//inject NONSTANDARD NAMING
	uint256 constant private _percentage_divisor72 = 10 ** 6; // 100% = 1000000	//inject NONSTANDARD NAMING

	                                                                                                                                             
	function ISTAO626(address _taoId) public view returns (bool) {	//inject NONSTANDARD NAMING
		return (_taoId != address(0) && bytes(TAO(address(uint160(_taoId))).name()).length > 0 && TAO(address(uint160(_taoId))).originId() != address(0) && TAO(address(uint160(_taoId))).typeId() == 0);
	}

	                                                                                                                                                 
	function ISNAME544(address _nameId) public view returns (bool) {	//inject NONSTANDARD NAMING
		return (_nameId != address(0) && bytes(TAO(address(uint160(_nameId))).name()).length > 0 && Name(address(uint160(_nameId))).originId() != address(0) && Name(address(uint160(_nameId))).typeId() == 1);
	}

	                                                                                                                                   
	function ISVALIDERC20TOKENADDRESS601(address _tokenAddress) public view returns (bool) {	//inject NONSTANDARD NAMING
		if (_tokenAddress == address(0)) {
			return false;
		}
		TokenERC20 _erc20 = TokenERC20(_tokenAddress);
		return (_erc20.totalSupply() >= 0 && bytes(_erc20.name()).length > 0 && bytes(_erc20.symbol()).length > 0);
	}

	                                                                                                                                                                                                                                                                                                                                                 
	function ISTHEAO807(address _sender, address _theAO, address _nameTAOPositionAddress) public view returns (bool) {	//inject NONSTANDARD NAMING
		return (_sender == _theAO ||
			(
				(ISTAO626(_theAO) || ISNAME544(_theAO)) &&
				_nameTAOPositionAddress != address(0) &&
				INameTAOPosition(_nameTAOPositionAddress).SENDERISADVOCATE705(_sender, _theAO)
			)
		);
	}

	                                                                                                                                                                                       
	function PERCENTAGE_DIVISOR950() public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return _percentage_divisor72;
	}

	                                                                                                                                                                                        
	function MULTIPLIER_DIVISOR873() public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return _multiplier_divisor887;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                             
	function DEPLOYTAO261(string memory _name,	//inject NONSTANDARD NAMING
		address _originId,
		string memory _datHash,
		string memory _database,
		string memory _keyValue,
		bytes32 _contentId,
		address _nameTAOVaultAddress
		) public returns (TAO _tao) {
		_tao = new TAO(_name, _originId, _datHash, _database, _keyValue, _contentId, _nameTAOVaultAddress);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                       
	function DEPLOYNAME741(string memory _name,	//inject NONSTANDARD NAMING
		address _originId,
		string memory _datHash,
		string memory _database,
		string memory _keyValue,
		bytes32 _contentId,
		address _nameTAOVaultAddress
		) public returns (Name _myName) {
		_myName = new Name(_name, _originId, _datHash, _database, _keyValue, _contentId, _nameTAOVaultAddress);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	function CALCULATEWEIGHTEDMULTIPLIER167(uint256 _currentWeightedMultiplier, uint256 _currentPrimordialBalance, uint256 _additionalWeightedMultiplier, uint256 _additionalPrimordialAmount) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		if (_currentWeightedMultiplier > 0) {
			uint256 _totalWeightedIons = (_currentWeightedMultiplier.MUL886(_currentPrimordialBalance)).ADD927(_additionalWeightedMultiplier.MUL886(_additionalPrimordialAmount));
			uint256 _totalIons = _currentPrimordialBalance.ADD927(_additionalPrimordialAmount);
			return _totalWeightedIons.DIV243(_totalIons);
		} else {
			return _additionalWeightedMultiplier;
		}
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
	function CALCULATEPRIMORDIALMULTIPLIER434(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		if (_purchaseAmount > 0 && _purchaseAmount <= _totalPrimordialMintable.SUB542(_totalPrimordialMinted)) {
			                                                                                 
			uint256 temp = _totalPrimordialMinted.ADD927(_purchaseAmount.DIV243(2));

			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			uint256 multiplier = (_multiplier_divisor887.SUB542(_multiplier_divisor887.MUL886(temp).DIV243(_totalPrimordialMintable))).MUL886(_startingMultiplier.SUB542(_endingMultiplier));
			                                                                                                                                         
			return multiplier.DIV243(_multiplier_divisor887);
		} else {
			return 0;
		}
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	function CALCULATENETWORKBONUSPERCENTAGE727(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		if (_purchaseAmount > 0 && _purchaseAmount <= _totalPrimordialMintable.SUB542(_totalPrimordialMinted)) {
			                                                                           
			uint256 temp = _totalPrimordialMinted.ADD927(_purchaseAmount.DIV243(2));

			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
			uint256 bonusPercentage = (_percentage_divisor72.SUB542(_percentage_divisor72.MUL886(temp).DIV243(_totalPrimordialMintable))).MUL886(_startingMultiplier.SUB542(_endingMultiplier)).DIV243(_percentage_divisor72);
			return bonusPercentage;
		} else {
			return 0;
		}
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	function CALCULATENETWORKBONUSAMOUNT610(uint256 _purchaseAmount, uint256 _totalPrimordialMintable, uint256 _totalPrimordialMinted, uint256 _startingMultiplier, uint256 _endingMultiplier) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 bonusPercentage = CALCULATENETWORKBONUSPERCENTAGE727(_purchaseAmount, _totalPrimordialMintable, _totalPrimordialMinted, _startingMultiplier, _endingMultiplier);
		                                                                                                                                                                    
		uint256 networkBonus = bonusPercentage.MUL886(_purchaseAmount).DIV243(_percentage_divisor72);
		return networkBonus;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	function CALCULATEMAXIMUMBURNAMOUNT363(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _maximumMultiplier) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return (_maximumMultiplier.MUL886(_primordialBalance).SUB542(_primordialBalance.MUL886(_currentWeightedMultiplier))).DIV243(_maximumMultiplier);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	function CALCULATEMULTIPLIERAFTERBURN577(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _amountToBurn) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return _primordialBalance.MUL886(_currentWeightedMultiplier).DIV243(_primordialBalance.SUB542(_amountToBurn));
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
	function CALCULATEMULTIPLIERAFTERCONVERSION718(uint256 _primordialBalance, uint256 _currentWeightedMultiplier, uint256 _amountToConvert) public pure returns (uint256) {	//inject NONSTANDARD NAMING
		return _primordialBalance.MUL886(_currentWeightedMultiplier).DIV243(_primordialBalance.ADD927(_amountToConvert));
	}

	                                                                                                                            
	function NUMDIGITS57(uint256 number) public pure returns (uint8) {	//inject NONSTANDARD NAMING
		uint8 digits = 0;
		while(number != 0) {
			number = number.DIV243(10);
			digits++;
		}
		return digits;
	}
}
















interface ionRecipient {
	function RECEIVEAPPROVAL411(address _from, uint256 _value, address _token, bytes calldata _extraData) external;	//inject NONSTANDARD NAMING
}

                                
contract AOIonInterface is TheAO {
	using SafeMath for uint256;

	address public namePublicKeyAddress;
	address public nameAccountRecoveryAddress;

	INameTAOPosition internal _nameTAOPosition;
	INamePublicKey internal _namePublicKey;
	INameAccountRecovery internal _nameAccountRecovery;

	// Public variables of the contract
	string public name;
	string public symbol;
	uint8 public decimals;
	uint256 public totalSupply;

	// To differentiate denomination of AO
	uint256 public powerOfTen;

	                                   
	uint256 public sellPrice;
	uint256 public buyPrice;

	// This creates an array with all balances
	mapping (address => uint256) public balanceOf;
	mapping (address => mapping (address => uint256)) public allowance;
	mapping (address => bool) public frozenAccount;
	mapping (address => uint256) public stakedBalance;
	mapping (address => uint256) public escrowedBalance;

	// This generates a public event on the blockchain that will notify clients
	event FROZENFUNDS586(address target, bool frozen);	//inject NONSTANDARD NAMING
	event STAKE738(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
	event UNSTAKE430(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
	event ESCROW654(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
	event UNESCROW761(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

	// This generates a public event on the blockchain that will notify clients
	event TRANSFER767(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

	// This generates a public event on the blockchain that will notify clients
	event APPROVAL62(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

	// This notifies clients about the amount burnt
	event BURN755(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

	                                      
	constructor(string memory _name, string memory _symbol, address _nameTAOPositionAddress, address _namePublicKeyAddress, address _nameAccountRecoveryAddress) public {
		SETNAMETAOPOSITIONADDRESS99(_nameTAOPositionAddress);
		SETNAMEPUBLICKEYADDRESS460(_namePublicKeyAddress);
		SETNAMEACCOUNTRECOVERYADDRESS475(_nameAccountRecoveryAddress);
		name = _name;           // Set the name for display purposes
		symbol = _symbol;       // Set the symbol for display purposes
		powerOfTen = 0;
		decimals = 0;
	}

	                                                                                                                                                             
	modifier ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (AOLibrary.ISTHEAO807(msg.sender, theAO, nameTAOPositionAddress));
		_;
	}

	                                 
	                                                                                                                 
	function TRANSFEROWNERSHIP644(address _theAO) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_theAO != address(0));
		theAO = _theAO;
	}

	                                                                                                                                                                            
	function SETWHITELIST171(address _account, bool _whitelist) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_account != address(0));
		whitelist[_account] = _whitelist;
	}

	                                                                                                                          
	function SETNAMETAOPOSITIONADDRESS99(address _nameTAOPositionAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_nameTAOPositionAddress != address(0));
		nameTAOPositionAddress = _nameTAOPositionAddress;
		_nameTAOPosition = INameTAOPosition(nameTAOPositionAddress);
	}

	                                                                                                                    
	function SETNAMEPUBLICKEYADDRESS460(address _namePublicKeyAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_namePublicKeyAddress != address(0));
		namePublicKeyAddress = _namePublicKeyAddress;
		_namePublicKey = INamePublicKey(namePublicKeyAddress);
	}

	                                                                                                                                      
	function SETNAMEACCOUNTRECOVERYADDRESS475(address _nameAccountRecoveryAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_nameAccountRecoveryAddress != address(0));
		nameAccountRecoveryAddress = _nameAccountRecoveryAddress;
		_nameAccountRecovery = INameAccountRecovery(nameAccountRecoveryAddress);
	}

	                                                                                                                                                                                   
	function TRANSFERETH628(address payable _recipient, uint256 _amount) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_recipient != address(0));
		_recipient.transfer(_amount);
	}

	                                                                                                                                                        
	function FREEZEACCOUNT676(address target, bool freeze) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		frozenAccount[target] = freeze;
		emit FROZENFUNDS586(target, freeze);
	}

	                                                                                                                                                                                                                              
	function SETPRICES369(uint256 newSellPrice, uint256 newBuyPrice) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		sellPrice = newSellPrice;
		buyPrice = newBuyPrice;
	}

	                                                          
	                                                                                                                                                                                                         
	function MINT177(address target, uint256 mintedAmount) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		_MINT136(target, mintedAmount);
		return true;
	}

	                                                                                                                                                                       
	function STAKEFROM761(address _from, uint256 _value) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		require (balanceOf[_from] >= _value);						// Check if the targeted balance is enough
		balanceOf[_from] = balanceOf[_from].SUB542(_value);			// Subtract from the targeted balance
		stakedBalance[_from] = stakedBalance[_from].ADD927(_value);	// Add to the targeted staked balance
		emit STAKE738(_from, _value);
		return true;
	}

	                                                                                                                                                                           
	function UNSTAKEFROM709(address _from, uint256 _value) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		require (stakedBalance[_from] >= _value);					// Check if the targeted staked balance is enough
		stakedBalance[_from] = stakedBalance[_from].SUB542(_value);	// Subtract from the targeted staked balance
		balanceOf[_from] = balanceOf[_from].ADD927(_value);			// Add to the targeted balance
		emit UNSTAKE430(_from, _value);
		return true;
	}

	                                                                                                                                                                                                                                                 
	function ESCROWFROM365(address _from, address _to, uint256 _value) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		require (balanceOf[_from] >= _value);						// Check if the targeted balance is enough
		balanceOf[_from] = balanceOf[_from].SUB542(_value);			// Subtract from the targeted balance
		escrowedBalance[_to] = escrowedBalance[_to].ADD927(_value);	// Add to the targeted escrowed balance
		emit ESCROW654(_from, _to, _value);
		return true;
	}

	                                                                                                                                                                                                  
	function MINTESCROW539(address target, uint256 mintedAmount) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		escrowedBalance[target] = escrowedBalance[target].ADD927(mintedAmount);
		totalSupply = totalSupply.ADD927(mintedAmount);
		emit ESCROW654(address(this), target, mintedAmount);
		return true;
	}

	                                                                                                                                                                                                    
	function UNESCROWFROM598(address _from, uint256 _value) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		require (escrowedBalance[_from] >= _value);						// Check if the targeted escrowed balance is enough
		escrowedBalance[_from] = escrowedBalance[_from].SUB542(_value);	// Subtract from the targeted escrowed balance
		balanceOf[_from] = balanceOf[_from].ADD927(_value);				// Add to the targeted balance
		emit UNESCROW761(_from, _value);
		return true;
	}

	                                                                                                                                                                                                              
	function WHITELISTBURNFROM776(address _from, uint256 _value) public INWHITELIST936 returns (bool success) {	//inject NONSTANDARD NAMING
		require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
		balanceOf[_from] = balanceOf[_from].SUB542(_value);    // Subtract from the targeted balance
		totalSupply = totalSupply.SUB542(_value);              // Update totalSupply
		emit BURN755(_from, _value);
		return true;
	}

	                                                                                                                                                                                                                                                               
	function WHITELISTTRANSFERFROM746(address _from, address _to, uint256 _value) public INWHITELIST936 returns (bool success) {	//inject NONSTANDARD NAMING
		_TRANSFER699(_from, _to, _value);
		return true;
	}

	                            
	                                                                                                                                                                     
	function TRANSFER800(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		_TRANSFER699(msg.sender, _to, _value);
		return true;
	}

	                                                                                                                                                                                                                                      
	function TRANSFERFROM752(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(_value <= allowance[_from][msg.sender]);     // Check allowance
		allowance[_from][msg.sender] -= _value;
		_TRANSFER699(_from, _to, _value);
		return true;
	}

	                                                                                                                                                                                                                                   
	function TRANSFERBETWEENPUBLICKEYS174(address _nameId, address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require (AOLibrary.ISNAME544(_nameId));
		require (_nameTAOPosition.SENDERISADVOCATE705(msg.sender, _nameId));
		require (!_nameAccountRecovery.ISCOMPROMISED141(_nameId));
		// Make sure _from exist in the Name's Public Keys
		require (_namePublicKey.ISKEYEXIST939(_nameId, _from));
		// Make sure _to exist in the Name's Public Keys
		require (_namePublicKey.ISKEYEXIST939(_nameId, _to));
		_TRANSFER699(_from, _to, _value);
		return true;
	}

	                                                                                                                                                                                                                                 
	function APPROVE634(address _spender, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		allowance[msg.sender][_spender] = _value;
		emit APPROVAL62(msg.sender, _spender, _value);
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                               
	function APPROVEANDCALL505(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {	//inject NONSTANDARD NAMING
		ionRecipient spender = ionRecipient(_spender);
		if (APPROVE634(_spender, _value)) {
			spender.RECEIVEAPPROVAL411(msg.sender, _value, address(this), _extraData);
			return true;
		}
	}

	                                                                                                                                     
	function BURN398(uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
		balanceOf[msg.sender] -= _value;            // Subtract from the sender
		totalSupply -= _value;                      // Updates totalSupply
		emit BURN755(msg.sender, _value);
		return true;
	}

	                                                                                                                                                                                                                         
	function BURNFROM477(address _from, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
		require(_value <= allowance[_from][msg.sender]);    // Check allowance
		balanceOf[_from] -= _value;                         // Subtract from the targeted balance
		allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
		totalSupply -= _value;                              // Update totalSupply
		emit BURN755(_from, _value);
		return true;
	}

	                                                         
	function BUY73() public payable {	//inject NONSTANDARD NAMING
		require (buyPrice > 0);
		uint256 amount = msg.value.DIV243(buyPrice);
		_TRANSFER699(address(this), msg.sender, amount);
	}

	                                                                                                
	function SELL994(uint256 amount) public {	//inject NONSTANDARD NAMING
		require (sellPrice > 0);
		address myAddress = address(this);
		require (myAddress.balance >= amount.MUL886(sellPrice));
		_TRANSFER699(msg.sender, address(this), amount);
		msg.sender.transfer(amount.MUL886(sellPrice));
	}

	                              
	                                                                                                                                                                                  
	function _TRANSFER699(address _from, address _to, uint256 _value) internal {	//inject NONSTANDARD NAMING
		require (_to != address(0));							// Prevent transfer to 0x0 address. Use burn() instead
		require (balanceOf[_from] >= _value);					// Check if the sender has enough
		require (balanceOf[_to].ADD927(_value) >= balanceOf[_to]); // Check for overflows
		require (!frozenAccount[_from]);						// Check if sender is frozen
		require (!frozenAccount[_to]);							// Check if recipient is frozen
		uint256 previousBalances = balanceOf[_from].ADD927(balanceOf[_to]);
		balanceOf[_from] = balanceOf[_from].SUB542(_value);        // Subtract from the sender
		balanceOf[_to] = balanceOf[_to].ADD927(_value);            // Add the same to the recipient
		emit TRANSFER767(_from, _to, _value);
		assert(balanceOf[_from].ADD927(balanceOf[_to]) == previousBalances);
	}

	                                                                                                                                                                             
	function _MINT136(address target, uint256 mintedAmount) internal {	//inject NONSTANDARD NAMING
		balanceOf[target] = balanceOf[target].ADD927(mintedAmount);
		totalSupply = totalSupply.ADD927(mintedAmount);
		emit TRANSFER767(address(0), address(this), mintedAmount);
		emit TRANSFER767(address(this), target, mintedAmount);
	}
}













                       
contract AOETH is TheAO, TokenERC20, tokenRecipient {
	using SafeMath for uint256;

	address public aoIonAddress;

	AOIon internal _aoIon;

	uint256 public totalERC20Tokens;
	uint256 public totalTokenExchanges;

	struct ERC20Token {
		address tokenAddress;
		uint256 price;			// price of this ERC20 Token to AOETH
		uint256 maxQuantity;	// To prevent too much exposure to a given asset
		uint256 exchangedQuantity;	// Running total (total AOETH exchanged from this specific ERC20 Token)
		bool active;
	}

	struct TokenExchange {
		bytes32 exchangeId;
		address buyer;			// The buyer address
		address tokenAddress;	// The address of ERC20 Token
		uint256 price;			// price of ERC20 Token to AOETH
		uint256 sentAmount;		// Amount of ERC20 Token sent
		uint256 receivedAmount;	// Amount of AOETH received
		bytes extraData; // Extra data
	}

	// Mapping from id to ERC20Token object
	mapping (uint256 => ERC20Token) internal erc20Tokens;
	mapping (address => uint256) internal erc20TokenIdLookup;

	// Mapping from id to TokenExchange object
	mapping (uint256 => TokenExchange) internal tokenExchanges;
	mapping (bytes32 => uint256) internal tokenExchangeIdLookup;
	mapping (address => uint256) public totalAddressTokenExchanges;

	// Event to be broadcasted to public when TheAO adds an ERC20 Token
	event ADDERC20TOKEN314(address indexed tokenAddress, uint256 price, uint256 maxQuantity);	//inject NONSTANDARD NAMING

	// Event to be broadcasted to public when TheAO sets price for ERC20 Token
	event SETPRICE734(address indexed tokenAddress, uint256 price);	//inject NONSTANDARD NAMING

	// Event to be broadcasted to public when TheAO sets max quantity for ERC20 Token
	event SETMAXQUANTITY253(address indexed tokenAddress, uint256 maxQuantity);	//inject NONSTANDARD NAMING

	// Event to be broadcasted to public when TheAO sets active status for ERC20 Token
	event SETACTIVE257(address indexed tokenAddress, bool active);	//inject NONSTANDARD NAMING

	// Event to be broadcasted to public when user exchanges ERC20 Token for AOETH
	event EXCHANGETOKEN410(bytes32 indexed exchangeId, address indexed from, address tokenAddress, string tokenName, string tokenSymbol, uint256 sentTokenAmount, uint256 receivedAOETHAmount, bytes extraData);	//inject NONSTANDARD NAMING

	                                      
	constructor(uint256 initialSupply, string memory tokenName, string memory tokenSymbol, address _aoIonAddress, address _nameTAOPositionAddress)
		TokenERC20(initialSupply, tokenName, tokenSymbol) public {
		SETAOIONADDRESS699(_aoIonAddress);
		SETNAMETAOPOSITIONADDRESS99(_nameTAOPositionAddress);
	}

	                                                                                                                                                             
	modifier ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (AOLibrary.ISTHEAO807(msg.sender, theAO, nameTAOPositionAddress));
		_;
	}

	                                 
	                                                                                                                 
	function TRANSFEROWNERSHIP644(address _theAO) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_theAO != address(0));
		theAO = _theAO;
	}

	                                                                                                                                                                            
	function SETWHITELIST171(address _account, bool _whitelist) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_account != address(0));
		whitelist[_account] = _whitelist;
	}

	                                                                                            
	function SETAOIONADDRESS699(address _aoIonAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_aoIonAddress != address(0));
		aoIonAddress = _aoIonAddress;
		_aoIon = AOIon(_aoIonAddress);
	}

	                                                                                                                          
	function SETNAMETAOPOSITIONADDRESS99(address _nameTAOPositionAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_nameTAOPositionAddress != address(0));
		nameTAOPositionAddress = _nameTAOPositionAddress;
	}

	                                                                                                                                                                                                                                                    
	function TRANSFERERC20604(address _erc20TokenAddress, address _recipient, uint256 _amount) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		TokenERC20 _erc20 = TokenERC20(_erc20TokenAddress);
		require (_erc20.TRANSFER800(_recipient, _amount));
	}

	                                                                                                                                                                                                                         
	function ADDERC20TOKEN128(address _tokenAddress, uint256 _price, uint256 _maxQuantity) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_tokenAddress != address(0) && _price > 0 && _maxQuantity > 0);
		require (AOLibrary.ISVALIDERC20TOKENADDRESS601(_tokenAddress));
		require (erc20TokenIdLookup[_tokenAddress] == 0);

		totalERC20Tokens++;
		erc20TokenIdLookup[_tokenAddress] = totalERC20Tokens;
		ERC20Token storage _erc20Token = erc20Tokens[totalERC20Tokens];
		_erc20Token.tokenAddress = _tokenAddress;
		_erc20Token.price = _price;
		_erc20Token.maxQuantity = _maxQuantity;
		_erc20Token.active = true;
		emit ADDERC20TOKEN314(_erc20Token.tokenAddress, _erc20Token.price, _erc20Token.maxQuantity);
	}

	                                                                                                                                                               
	function SETPRICE755(address _tokenAddress, uint256 _price) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (erc20TokenIdLookup[_tokenAddress] > 0);
		require (_price > 0);

		ERC20Token storage _erc20Token = erc20Tokens[erc20TokenIdLookup[_tokenAddress]];
		_erc20Token.price = _price;
		emit SETPRICE734(_erc20Token.tokenAddress, _erc20Token.price);
	}

	                                                                                                                                                                                    
	function SETMAXQUANTITY711(address _tokenAddress, uint256 _maxQuantity) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (erc20TokenIdLookup[_tokenAddress] > 0);

		ERC20Token storage _erc20Token = erc20Tokens[erc20TokenIdLookup[_tokenAddress]];
		require (_maxQuantity > _erc20Token.exchangedQuantity);
		_erc20Token.maxQuantity = _maxQuantity;
		emit SETMAXQUANTITY253(_erc20Token.tokenAddress, _erc20Token.maxQuantity);
	}

	                                                                                                                                                                        
	function SETACTIVE578(address _tokenAddress, bool _active) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (erc20TokenIdLookup[_tokenAddress] > 0);

		ERC20Token storage _erc20Token = erc20Tokens[erc20TokenIdLookup[_tokenAddress]];
		_erc20Token.active = _active;
		emit SETACTIVE257(_erc20Token.tokenAddress, _erc20Token.active);
	}

	                                                                                                                                                                                                                                                                   
	function WHITELISTTRANSFERFROM746(address _from, address _to, uint256 _value) public INWHITELIST936 returns (bool success) {	//inject NONSTANDARD NAMING
		_TRANSFER699(_from, _to, _value);
		return true;
	}

	                            
	                                                                                                                                                                                                                                                                                                                                                                                                          
	function GETBYID713(uint256 _id) public view returns (address, string memory, string memory, uint256, uint256, uint256, bool) {	//inject NONSTANDARD NAMING
		require (erc20Tokens[_id].tokenAddress != address(0));
		ERC20Token memory _erc20Token = erc20Tokens[_id];
		return (
			_erc20Token.tokenAddress,
			TokenERC20(_erc20Token.tokenAddress).name(),
			TokenERC20(_erc20Token.tokenAddress).symbol(),
			_erc20Token.price,
			_erc20Token.maxQuantity,
			_erc20Token.exchangedQuantity,
			_erc20Token.active
		);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                     
	function GETBYADDRESS48(address _tokenAddress) public view returns (address, string memory, string memory, uint256, uint256, uint256, bool) {	//inject NONSTANDARD NAMING
		require (erc20TokenIdLookup[_tokenAddress] > 0);
		return GETBYID713(erc20TokenIdLookup[_tokenAddress]);
	}

	                                                                                                                                                                                                                                                                                                                        
	function RECEIVEAPPROVAL411(address _from, uint256 _value, address _token, bytes calldata _extraData) external {	//inject NONSTANDARD NAMING
		require (_from != address(0));
		require (AOLibrary.ISVALIDERC20TOKENADDRESS601(_token));

		// Check if the token is supported
		require (erc20TokenIdLookup[_token] > 0);
		ERC20Token storage _erc20Token = erc20Tokens[erc20TokenIdLookup[_token]];
		require (_erc20Token.active && _erc20Token.price > 0 && _erc20Token.exchangedQuantity < _erc20Token.maxQuantity);

		uint256 amountToTransfer = _value.DIV243(_erc20Token.price);
		require (_erc20Token.maxQuantity.SUB542(_erc20Token.exchangedQuantity) >= amountToTransfer);
		require (_aoIon.AVAILABLEETH987() >= amountToTransfer);

		// Transfer the ERC20 Token from the `_from` address to here
		require (TokenERC20(_token).TRANSFERFROM752(_from, address(this), _value));

		_erc20Token.exchangedQuantity = _erc20Token.exchangedQuantity.ADD927(amountToTransfer);
		balanceOf[_from] = balanceOf[_from].ADD927(amountToTransfer);
		totalSupply = totalSupply.ADD927(amountToTransfer);

		// Store the TokenExchange information
		totalTokenExchanges++;
		totalAddressTokenExchanges[_from]++;
		bytes32 _exchangeId = keccak256(abi.encodePacked(this, _from, totalTokenExchanges));
		tokenExchangeIdLookup[_exchangeId] = totalTokenExchanges;

		TokenExchange storage _tokenExchange = tokenExchanges[totalTokenExchanges];
		_tokenExchange.exchangeId = _exchangeId;
		_tokenExchange.buyer = _from;
		_tokenExchange.tokenAddress = _token;
		_tokenExchange.price = _erc20Token.price;
		_tokenExchange.sentAmount = _value;
		_tokenExchange.receivedAmount = amountToTransfer;
		_tokenExchange.extraData = _extraData;

		emit EXCHANGETOKEN410(_tokenExchange.exchangeId, _tokenExchange.buyer, _tokenExchange.tokenAddress, TokenERC20(_token).name(), TokenERC20(_token).symbol(), _tokenExchange.sentAmount, _tokenExchange.receivedAmount, _tokenExchange.extraData);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                               
	function GETTOKENEXCHANGEBYID768(bytes32 _exchangeId) public view returns (address, address, string memory, string memory, uint256, uint256,  uint256, bytes memory) {	//inject NONSTANDARD NAMING
		require (tokenExchangeIdLookup[_exchangeId] > 0);
		TokenExchange memory _tokenExchange = tokenExchanges[tokenExchangeIdLookup[_exchangeId]];
		return (
			_tokenExchange.buyer,
			_tokenExchange.tokenAddress,
			TokenERC20(_tokenExchange.tokenAddress).name(),
			TokenERC20(_tokenExchange.tokenAddress).symbol(),
			_tokenExchange.price,
			_tokenExchange.sentAmount,
			_tokenExchange.receivedAmount,
			_tokenExchange.extraData
		);
	}
}


                       
contract AOIon is AOIonInterface {
	using SafeMath for uint256;

	address public aoIonLotAddress;
	address public settingTAOId;
	address public aoSettingAddress;
	address public aoethAddress;

	// AO Dev Team addresses to receive Primordial/Network Ions
	address public aoDevTeam1 = 0x146CbD9821e6A42c8ff6DC903fe91CB69625A105;
	address public aoDevTeam2 = 0x4810aF1dA3aC827259eEa72ef845F4206C703E8D;

	IAOIonLot internal _aoIonLot;
	IAOSetting internal _aoSetting;
	AOETH internal _aoeth;

	                                      
	uint256 public primordialTotalSupply;
	uint256 public primordialTotalBought;
	uint256 public primordialSellPrice;
	uint256 public primordialBuyPrice;
	uint256 public totalEthForPrimordial;	// Total ETH sent for Primordial AO+
	uint256 public totalRedeemedAOETH;		// Total AOETH redeemed for Primordial AO+

	// Total available primordial ion for sale 3,377,699,720,527,872 AO+
	uint256 constant public total_primordial_for_sale564 = 3377699720527872;	//inject NONSTANDARD NAMING

	mapping (address => uint256) public primordialBalanceOf;
	mapping (address => mapping (address => uint256)) public primordialAllowance;

	// Mapping from owner's lot weighted multiplier to the amount of staked ions
	mapping (address => mapping (uint256 => uint256)) public primordialStakedBalance;

	event PRIMORDIALTRANSFER219(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
	event PRIMORDIALAPPROVAL318(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
	event PRIMORDIALBURN501(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
	event PRIMORDIALSTAKE388(address indexed from, uint256 value, uint256 weightedMultiplier);	//inject NONSTANDARD NAMING
	event PRIMORDIALUNSTAKE25(address indexed from, uint256 value, uint256 weightedMultiplier);	//inject NONSTANDARD NAMING

	event NETWORKEXCHANGEENDED545();	//inject NONSTANDARD NAMING

	bool public networkExchangeEnded;

	// Mapping from owner to his/her current weighted multiplier
	mapping (address => uint256) internal ownerWeightedMultiplier;

	// Mapping from owner to his/her max multiplier (multiplier of account's first Lot)
	mapping (address => uint256) internal ownerMaxMultiplier;

	// Event to be broadcasted to public when user buys primordial ion
	// payWith 1 == with Ethereum
	// payWith 2 == with AOETH
	event BUYPRIMORDIAL490(address indexed lotOwner, bytes32 indexed lotId, uint8 payWith, uint256 sentAmount, uint256 refundedAmount);	//inject NONSTANDARD NAMING

	                                      
	constructor(string memory _name, string memory _symbol, address _settingTAOId, address _aoSettingAddress, address _nameTAOPositionAddress, address _namePublicKeyAddress, address _nameAccountRecoveryAddress)
		AOIonInterface(_name, _symbol, _nameTAOPositionAddress, _namePublicKeyAddress, _nameAccountRecoveryAddress) public {
		SETSETTINGTAOID202(_settingTAOId);
		SETAOSETTINGADDRESS516(_aoSettingAddress);

		powerOfTen = 0;
		decimals = 0;
		SETPRIMORDIALPRICES946(0, 10 ** 8); // Set Primordial buy price to 0.1 gwei/ion
	}

	                                                        
	modifier CANBUYPRIMORDIAL365(uint256 _sentAmount, bool _withETH) {	//inject NONSTANDARD NAMING
		require (networkExchangeEnded == false &&
			primordialTotalBought < total_primordial_for_sale564 &&
			primordialBuyPrice > 0 &&
			_sentAmount > 0 &&
			AVAILABLEPRIMORDIALFORSALEINETH722() > 0 &&
			(
				(_withETH && AVAILABLEETH987() > 0) ||
				(!_withETH && totalRedeemedAOETH < _aoeth.totalSupply())
			)
		);
		_;
	}

	                                 
	                                                                                                  
	function SETAOIONLOTADDRESS697(address _aoIonLotAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_aoIonLotAddress != address(0));
		aoIonLotAddress = _aoIonLotAddress;
		_aoIonLot = IAOIonLot(_aoIonLotAddress);
	}

	                                                                                                   
	function SETSETTINGTAOID202(address _settingTAOId) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (AOLibrary.ISTAO626(_settingTAOId));
		settingTAOId = _settingTAOId;
	}

	                                                                                                      
	function SETAOSETTINGADDRESS516(address _aoSettingAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_aoSettingAddress != address(0));
		aoSettingAddress = _aoSettingAddress;
		_aoSetting = IAOSetting(_aoSettingAddress);
	}

	                                                                                                                                                                                                                 
	function SETAODEVTEAMADDRESSES950(address _aoDevTeam1, address _aoDevTeam2) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		aoDevTeam1 = _aoDevTeam1;
		aoDevTeam2 = _aoDevTeam2;
	}

	                                                                                 
	function SETAOETHADDRESS115(address _aoethAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_aoethAddress != address(0));
		aoethAddress = _aoethAddress;
		_aoeth = AOETH(_aoethAddress);
	}

	                                                
	                                                                                                                                                                                                                                                                        
	function SETPRIMORDIALPRICES946(uint256 newPrimordialSellPrice, uint256 newPrimordialBuyPrice) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		primordialSellPrice = newPrimordialSellPrice;
		primordialBuyPrice = newPrimordialBuyPrice;
	}

	                                                            
	function ENDNETWORKEXCHANGE226() public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (!networkExchangeEnded);
		networkExchangeEnded = true;
		emit NETWORKEXCHANGEENDED545();
	}

	                                                             
	                                                                                                                                                                                                                                                                                                                        
	function STAKEPRIMORDIALFROM923(address _from, uint256 _value, uint256 _weightedMultiplier) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		// Check if the targeted balance is enough
		require (primordialBalanceOf[_from] >= _value);
		// Make sure the weighted multiplier is the same as account's current weighted multiplier
		require (_weightedMultiplier == ownerWeightedMultiplier[_from]);
		// Subtract from the targeted balance
		primordialBalanceOf[_from] = primordialBalanceOf[_from].SUB542(_value);
		// Add to the targeted staked balance
		primordialStakedBalance[_from][_weightedMultiplier] = primordialStakedBalance[_from][_weightedMultiplier].ADD927(_value);
		emit PRIMORDIALSTAKE388(_from, _value, _weightedMultiplier);
		return true;
	}

	                                                                                                                                                                                                                                                                                             
	function UNSTAKEPRIMORDIALFROM352(address _from, uint256 _value, uint256 _weightedMultiplier) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		// Check if the targeted staked balance is enough
		require (primordialStakedBalance[_from][_weightedMultiplier] >= _value);
		// Subtract from the targeted staked balance
		primordialStakedBalance[_from][_weightedMultiplier] = primordialStakedBalance[_from][_weightedMultiplier].SUB542(_value);
		// Add to the targeted balance
		primordialBalanceOf[_from] = primordialBalanceOf[_from].ADD927(_value);
		emit PRIMORDIALUNSTAKE25(_from, _value, _weightedMultiplier);
		return true;
	}

	                                                                                                                                                                                                                                     
	function WHITELISTTRANSFERPRIMORDIALFROM44(address _from, address _to, uint256 _value) public INWHITELIST936 returns (bool) {	//inject NONSTANDARD NAMING
		return _CREATELOTANDTRANSFERPRIMORDIAL488(_from, _to, _value);
	}

	                            
	                                           
	                                                                    
	function BUYPRIMORDIAL504() public payable CANBUYPRIMORDIAL365(msg.value, true) {	//inject NONSTANDARD NAMING
		(uint256 amount, uint256 remainderBudget, bool shouldEndNetworkExchange) = _CALCULATEAMOUNTANDREMAINDERBUDGET232(msg.value, true);
		require (amount > 0);

		// Ends network exchange if necessary
		if (shouldEndNetworkExchange) {
			networkExchangeEnded = true;
			emit NETWORKEXCHANGEENDED545();
		}

		// Update totalEthForPrimordial
		totalEthForPrimordial = totalEthForPrimordial.ADD927(msg.value.SUB542(remainderBudget));

		// Send the primordial ion to buyer and reward AO devs
		bytes32 _lotId = _SENDPRIMORDIALANDREWARDDEV801(amount, msg.sender);

		emit BUYPRIMORDIAL490(msg.sender, _lotId, 1, msg.value, remainderBudget);

		// Send remainder budget back to buyer if exist
		if (remainderBudget > 0) {
			msg.sender.transfer(remainderBudget);
		}
	}

	                                                                   
	function BUYPRIMORDIALWITHAOETH857(uint256 _aoethAmount) public CANBUYPRIMORDIAL365(_aoethAmount, false) {	//inject NONSTANDARD NAMING
		(uint256 amount, uint256 remainderBudget, bool shouldEndNetworkExchange) = _CALCULATEAMOUNTANDREMAINDERBUDGET232(_aoethAmount, false);
		require (amount > 0);

		// Ends network exchange if necessary
		if (shouldEndNetworkExchange) {
			networkExchangeEnded = true;
			emit NETWORKEXCHANGEENDED545();
		}

		// Calculate the actual AOETH that was charged for this transaction
		uint256 actualCharge = _aoethAmount.SUB542(remainderBudget);

		// Update totalRedeemedAOETH
		totalRedeemedAOETH = totalRedeemedAOETH.ADD927(actualCharge);

		// Transfer AOETH from buyer to here
		require (_aoeth.WHITELISTTRANSFERFROM746(msg.sender, address(this), actualCharge));

		// Send the primordial ion to buyer and reward AO devs
		bytes32 _lotId = _SENDPRIMORDIALANDREWARDDEV801(amount, msg.sender);

		emit BUYPRIMORDIAL490(msg.sender, _lotId, 2, _aoethAmount, remainderBudget);
	}

	                                                                                                                                                                                       
	function TRANSFERPRIMORDIAL207(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
		return _CREATELOTANDTRANSFERPRIMORDIAL488(msg.sender, _to, _value);
	}

	                                                                                                                                                                                                                             
	function TRANSFERPRIMORDIALFROM742(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
		require (_value <= primordialAllowance[_from][msg.sender]);
		primordialAllowance[_from][msg.sender] = primordialAllowance[_from][msg.sender].SUB542(_value);

		return _CREATELOTANDTRANSFERPRIMORDIAL488(_from, _to, _value);
	}

	                                                                                                                                                                                                                                              
	function TRANSFERPRIMORDIALBETWEENPUBLICKEYS965(address _nameId, address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
		require (AOLibrary.ISNAME544(_nameId));
		require (_nameTAOPosition.SENDERISADVOCATE705(msg.sender, _nameId));
		require (!_nameAccountRecovery.ISCOMPROMISED141(_nameId));
		// Make sure _from exist in the Name's Public Keys
		require (_namePublicKey.ISKEYEXIST939(_nameId, _from));
		// Make sure _to exist in the Name's Public Keys
		require (_namePublicKey.ISKEYEXIST939(_nameId, _to));
		return _CREATELOTANDTRANSFERPRIMORDIAL488(_from, _to, _value);
	}

	                                                                                                                                                                                                                                 
	function APPROVEPRIMORDIAL662(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
		primordialAllowance[msg.sender][_spender] = _value;
		emit PRIMORDIALAPPROVAL318(msg.sender, _spender, _value);
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                    
	function APPROVEPRIMORDIALANDCALL160(address _spender, uint256 _value, bytes memory _extraData) public returns (bool) {	//inject NONSTANDARD NAMING
		tokenRecipient spender = tokenRecipient(_spender);
		if (APPROVEPRIMORDIAL662(_spender, _value)) {
			spender.RECEIVEAPPROVAL411(msg.sender, _value, address(this), _extraData);
			return true;
		}
	}

	                                                                                                                                                                                                      
	function BURNPRIMORDIAL820(uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
		require (primordialBalanceOf[msg.sender] >= _value);
		require (CALCULATEMAXIMUMBURNAMOUNT363(msg.sender) >= _value);

		// Update the account's multiplier
		ownerWeightedMultiplier[msg.sender] = CALCULATEMULTIPLIERAFTERBURN577(msg.sender, _value);
		primordialBalanceOf[msg.sender] = primordialBalanceOf[msg.sender].SUB542(_value);
		primordialTotalSupply = primordialTotalSupply.SUB542(_value);

		// Store burn lot info
		require (_aoIonLot.CREATEBURNLOT932(msg.sender, _value, ownerWeightedMultiplier[msg.sender]));
		emit PRIMORDIALBURN501(msg.sender, _value);
		return true;
	}

	                                                                                                                                                                                                                                                              
	function BURNPRIMORDIALFROM645(address _from, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
		require (primordialBalanceOf[_from] >= _value);
		require (primordialAllowance[_from][msg.sender] >= _value);
		require (CALCULATEMAXIMUMBURNAMOUNT363(_from) >= _value);

		// Update `_from`'s multiplier
		ownerWeightedMultiplier[_from] = CALCULATEMULTIPLIERAFTERBURN577(_from, _value);
		primordialBalanceOf[_from] = primordialBalanceOf[_from].SUB542(_value);
		primordialAllowance[_from][msg.sender] = primordialAllowance[_from][msg.sender].SUB542(_value);
		primordialTotalSupply = primordialTotalSupply.SUB542(_value);

		// Store burn lot info
		require (_aoIonLot.CREATEBURNLOT932(_from, _value, ownerWeightedMultiplier[_from]));
		emit PRIMORDIALBURN501(_from, _value);
		return true;
	}

	                                                                                                                                                                                                          
	function WEIGHTEDMULTIPLIERBYADDRESS560(address _lotOwner) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return ownerWeightedMultiplier[_lotOwner];
	}

	                                                                                                                                                            
	function MAXMULTIPLIERBYADDRESS277(address _target) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return (_aoIonLot.TOTALLOTSBYADDRESS489(_target) > 0) ? ownerMaxMultiplier[_target] : 0;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                         
	function CALCULATEMULTIPLIERANDBONUS311(uint256 _purchaseAmount) public view returns (uint256, uint256, uint256) {	//inject NONSTANDARD NAMING
		(uint256 startingPrimordialMultiplier, uint256 endingPrimordialMultiplier, uint256 startingNetworkBonusMultiplier, uint256 endingNetworkBonusMultiplier) = _GETSETTINGVARIABLES594();
		return (
			AOLibrary.CALCULATEPRIMORDIALMULTIPLIER434(_purchaseAmount, total_primordial_for_sale564, primordialTotalBought, startingPrimordialMultiplier, endingPrimordialMultiplier),
			AOLibrary.CALCULATENETWORKBONUSPERCENTAGE727(_purchaseAmount, total_primordial_for_sale564, primordialTotalBought, startingNetworkBonusMultiplier, endingNetworkBonusMultiplier),
			AOLibrary.CALCULATENETWORKBONUSAMOUNT610(_purchaseAmount, total_primordial_for_sale564, primordialTotalBought, startingNetworkBonusMultiplier, endingNetworkBonusMultiplier)
		);
	}

	                                                                                                                                                                                     
	function CALCULATEMAXIMUMBURNAMOUNT363(address _account) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return AOLibrary.CALCULATEMAXIMUMBURNAMOUNT363(primordialBalanceOf[_account], ownerWeightedMultiplier[_account], ownerMaxMultiplier[_account]);
	}

	                                                                                                                                                                                                                                                        
	function CALCULATEMULTIPLIERAFTERBURN577(address _account, uint256 _amountToBurn) public view returns (uint256) {	//inject NONSTANDARD NAMING
		require (CALCULATEMAXIMUMBURNAMOUNT363(_account) >= _amountToBurn);
		return AOLibrary.CALCULATEMULTIPLIERAFTERBURN577(primordialBalanceOf[_account], ownerWeightedMultiplier[_account], _amountToBurn);
	}

	                                                                                                                                                                                                                                                                                 
	function CALCULATEMULTIPLIERAFTERCONVERSION718(address _account, uint256 _amountToConvert) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return AOLibrary.CALCULATEMULTIPLIERAFTERCONVERSION718(primordialBalanceOf[_account], ownerWeightedMultiplier[_account], _amountToConvert);
	}

	                                                                                                                                                                                                      
	function CONVERTTOPRIMORDIAL142(uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
		require (balanceOf[msg.sender] >= _value);

		// Update the account's multiplier
		ownerWeightedMultiplier[msg.sender] = CALCULATEMULTIPLIERAFTERCONVERSION718(msg.sender, _value);
		// Burn network ion
		BURN398(_value);
		// mint primordial ion
		_MINTPRIMORDIAL483(msg.sender, _value);

		require (_aoIonLot.CREATECONVERTLOT481(msg.sender, _value, ownerWeightedMultiplier[msg.sender]));
		return true;
	}

	                                                                                                                       
	function AVAILABLEPRIMORDIALFORSALE714() public view returns (uint256) {	//inject NONSTANDARD NAMING
		return total_primordial_for_sale564.SUB542(primordialTotalBought);
	}

	                                                                                                                                                                                                         
	function AVAILABLEPRIMORDIALFORSALEINETH722() public view returns (uint256) {	//inject NONSTANDARD NAMING
		return AVAILABLEPRIMORDIALFORSALE714().MUL886(primordialBuyPrice);
	}

	                                                                                                                                                     
	function AVAILABLEETH987() public view returns (uint256) {	//inject NONSTANDARD NAMING
		if (AVAILABLEPRIMORDIALFORSALEINETH722() > 0) {
			uint256 _availableETH = AVAILABLEPRIMORDIALFORSALEINETH722().SUB542(_aoeth.totalSupply().SUB542(totalRedeemedAOETH));
			if (AVAILABLEPRIMORDIALFORSALE714() == 1 && _availableETH < primordialBuyPrice) {
				return primordialBuyPrice;
			} else {
				return _availableETH;
			}
		} else {
			return 0;
		}
	}

	                              
	                                             
	                                                                                                                                                                                                                                                                                                                                                                                                                                      
	function _CALCULATEAMOUNTANDREMAINDERBUDGET232(uint256 _budget, bool _withETH) internal view returns (uint256, uint256, bool) {	//inject NONSTANDARD NAMING
		// Calculate the amount of ion
		uint256 amount = _budget.DIV243(primordialBuyPrice);

		// If we need to return ETH to the buyer, in the case
		// where the buyer sends more ETH than available primordial ion to be purchased
		uint256 remainderEth = _budget.SUB542(amount.MUL886(primordialBuyPrice));

		uint256 _availableETH = AVAILABLEETH987();
		// If paying with ETH, it can't exceed availableETH
		if (_withETH && _budget > AVAILABLEETH987()) {
			// Calculate the amount of ions
			amount = _availableETH.DIV243(primordialBuyPrice);
			remainderEth = _budget.SUB542(amount.MUL886(primordialBuyPrice));
		}

		// Make sure primordialTotalBought is not overflowing
		bool shouldEndNetworkExchange = false;
		if (primordialTotalBought.ADD927(amount) >= total_primordial_for_sale564) {
			amount = total_primordial_for_sale564.SUB542(primordialTotalBought);
			shouldEndNetworkExchange = true;
			remainderEth = _budget.SUB542(amount.MUL886(primordialBuyPrice));
		}
		return (amount, remainderEth, shouldEndNetworkExchange);
	}

	                                                                                                                                                                                                                                       
	function _SENDPRIMORDIALANDREWARDDEV801(uint256 amount, address to) internal returns (bytes32) {	//inject NONSTANDARD NAMING
		(uint256 startingPrimordialMultiplier,, uint256 startingNetworkBonusMultiplier, uint256 endingNetworkBonusMultiplier) = _GETSETTINGVARIABLES594();

		// Update primordialTotalBought
		(uint256 multiplier, uint256 networkBonusPercentage, uint256 networkBonusAmount) = CALCULATEMULTIPLIERANDBONUS311(amount);
		primordialTotalBought = primordialTotalBought.ADD927(amount);
		bytes32 _lotId = _CREATEPRIMORDIALLOT660(to, amount, multiplier, networkBonusAmount);

		// Calculate The AO and AO Dev Team's portion of Primordial and Network ion Bonus
		uint256 inverseMultiplier = startingPrimordialMultiplier.SUB542(multiplier); // Inverse of the buyer's multiplier
		uint256 theAONetworkBonusAmount = (startingNetworkBonusMultiplier.SUB542(networkBonusPercentage).ADD927(endingNetworkBonusMultiplier)).MUL886(amount).DIV243(AOLibrary.PERCENTAGE_DIVISOR950());
		if (aoDevTeam1 != address(0)) {
			_CREATEPRIMORDIALLOT660(aoDevTeam1, amount.DIV243(2), inverseMultiplier, theAONetworkBonusAmount.DIV243(2));
		}
		if (aoDevTeam2 != address(0)) {
			_CREATEPRIMORDIALLOT660(aoDevTeam2, amount.DIV243(2), inverseMultiplier, theAONetworkBonusAmount.DIV243(2));
		}
		_MINT136(theAO, theAONetworkBonusAmount);
		return _lotId;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	function _CREATEPRIMORDIALLOT660(address _account, uint256 _primordialAmount, uint256 _multiplier, uint256 _networkBonusAmount) internal returns (bytes32) {	//inject NONSTANDARD NAMING
		bytes32 lotId = _aoIonLot.CREATEPRIMORDIALLOT927(_account, _primordialAmount, _multiplier, _networkBonusAmount);

		ownerWeightedMultiplier[_account] = AOLibrary.CALCULATEWEIGHTEDMULTIPLIER167(ownerWeightedMultiplier[_account], primordialBalanceOf[_account], _multiplier, _primordialAmount);

		// If this is the first lot, set this as the max multiplier of the account
		if (_aoIonLot.TOTALLOTSBYADDRESS489(_account) == 1) {
			ownerMaxMultiplier[_account] = _multiplier;
		}
		_MINTPRIMORDIAL483(_account, _primordialAmount);
		_MINT136(_account, _networkBonusAmount);

		return lotId;
	}

	                                                                                                                                                                                                              
	function _MINTPRIMORDIAL483(address target, uint256 mintedAmount) internal {	//inject NONSTANDARD NAMING
		primordialBalanceOf[target] = primordialBalanceOf[target].ADD927(mintedAmount);
		primordialTotalSupply = primordialTotalSupply.ADD927(mintedAmount);
		emit PRIMORDIALTRANSFER219(address(0), address(this), mintedAmount);
		emit PRIMORDIALTRANSFER219(address(this), target, mintedAmount);
	}

	                                                                                                                                                                                                                                                                                         
	function _CREATEWEIGHTEDMULTIPLIERLOT285(address _account, uint256 _amount, uint256 _weightedMultiplier) internal returns (bytes32) {	//inject NONSTANDARD NAMING
		require (_account != address(0));
		require (_amount > 0);

		bytes32 lotId = _aoIonLot.CREATEWEIGHTEDMULTIPLIERLOT236(_account, _amount, _weightedMultiplier);
		// If this is the first lot, set this as the max multiplier of the account
		if (_aoIonLot.TOTALLOTSBYADDRESS489(_account) == 1) {
			ownerMaxMultiplier[_account] = _weightedMultiplier;
		}
		return lotId;
	}

	                                                                                                                                                                                                                                        
	function _CREATELOTANDTRANSFERPRIMORDIAL488(address _from, address _to, uint256 _value) internal returns (bool) {	//inject NONSTANDARD NAMING
		bytes32 _createdLotId = _CREATEWEIGHTEDMULTIPLIERLOT285(_to, _value, ownerWeightedMultiplier[_from]);
		(, address _lotOwner,,) = _aoIonLot.LOTBYID192(_createdLotId);

		// Make sure the new lot is created successfully
		require (_lotOwner == _to);

		// Update the weighted multiplier of the recipient
		ownerWeightedMultiplier[_to] = AOLibrary.CALCULATEWEIGHTEDMULTIPLIER167(ownerWeightedMultiplier[_to], primordialBalanceOf[_to], ownerWeightedMultiplier[_from], _value);

		// Transfer the Primordial ions
		require (_TRANSFERPRIMORDIAL272(_from, _to, _value));
		return true;
	}

	                                                                                                                                                                                             
	function _TRANSFERPRIMORDIAL272(address _from, address _to, uint256 _value) internal returns (bool) {	//inject NONSTANDARD NAMING
		require (_to != address(0));									// Prevent transfer to 0x0 address. Use burn() instead
		require (primordialBalanceOf[_from] >= _value);						// Check if the sender has enough
		require (primordialBalanceOf[_to].ADD927(_value) >= primordialBalanceOf[_to]);	// Check for overflows
		require (!frozenAccount[_from]);								// Check if sender is frozen
		require (!frozenAccount[_to]);									// Check if recipient is frozen
		uint256 previousBalances = primordialBalanceOf[_from].ADD927(primordialBalanceOf[_to]);
		primordialBalanceOf[_from] = primordialBalanceOf[_from].SUB542(_value);			// Subtract from the sender
		primordialBalanceOf[_to] = primordialBalanceOf[_to].ADD927(_value);				// Add the same to the recipient
		emit PRIMORDIALTRANSFER219(_from, _to, _value);
		assert(primordialBalanceOf[_from].ADD927(primordialBalanceOf[_to]) == previousBalances);
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	function _GETSETTINGVARIABLES594() internal view returns (uint256, uint256, uint256, uint256) {	//inject NONSTANDARD NAMING
		(uint256 startingPrimordialMultiplier,,,,) = _aoSetting.GETSETTINGVALUESBYTAONAME827(settingTAOId, 'startingPrimordialMultiplier');
		(uint256 endingPrimordialMultiplier,,,,) = _aoSetting.GETSETTINGVALUESBYTAONAME827(settingTAOId, 'endingPrimordialMultiplier');

		(uint256 startingNetworkBonusMultiplier,,,,) = _aoSetting.GETSETTINGVALUESBYTAONAME827(settingTAOId, 'startingNetworkBonusMultiplier');
		(uint256 endingNetworkBonusMultiplier,,,,) = _aoSetting.GETSETTINGVALUESBYTAONAME827(settingTAOId, 'endingNetworkBonusMultiplier');

		return (startingPrimordialMultiplier, endingPrimordialMultiplier, startingNetworkBonusMultiplier, endingNetworkBonusMultiplier);
	}
}






                                 
contract AOStakedContent is TheAO, IAOStakedContent {
	using SafeMath for uint256;

	uint256 public totalStakedContents;
	address public aoIonAddress;
	address public aoTreasuryAddress;
	address public aoContentAddress;
	address public nameFactoryAddress;
	address public namePublicKeyAddress;

	AOIon internal _aoIon;
	IAOTreasury internal _aoTreasury;
	IAOContent internal _aoContent;
	INameFactory internal _nameFactory;
	INamePublicKey internal _namePublicKey;

	struct StakedContent {
		bytes32 stakedContentId;
		bytes32 contentId;
		address stakeOwner;
		uint256 networkAmount;		// total network ion staked in base denomination
		uint256 primordialAmount;	// the amount of primordial AOIon to stake (always in base denomination)
		uint256 primordialWeightedMultiplier;
		uint256 profitPercentage;	// support up to 4 decimals, 100% = 1000000
		bool active;	// true if currently staked, false when unstaked
		uint256 createdOnTimestamp;
	}

	// Mapping from StakedContent index to the StakedContent object
	mapping (uint256 => StakedContent) internal stakedContents;

	// Mapping from StakedContent ID to index of the stakedContents list
	mapping (bytes32 => uint256) internal stakedContentIndex;

	// Event to be broadcasted to public when `stakeOwner` stakes a new content
	event STAKECONTENT791(	//inject NONSTANDARD NAMING
		address indexed stakeOwner,
		bytes32 indexed stakedContentId,
		bytes32 indexed contentId,
		uint256 baseNetworkAmount,
		uint256 primordialAmount,
		uint256 primordialWeightedMultiplier,
		uint256 profitPercentage,
		uint256 createdOnTimestamp
	);

	// Event to be broadcasted to public when `stakeOwner` updates the staked content's profit percentage
	event SETPROFITPERCENTAGE101(address indexed stakeOwner, bytes32 indexed stakedContentId, uint256 newProfitPercentage);	//inject NONSTANDARD NAMING

	// Event to be broadcasted to public when `stakeOwner` unstakes some network/primordial ion from an existing content
	event UNSTAKEPARTIALCONTENT485(	//inject NONSTANDARD NAMING
		address indexed stakeOwner,
		bytes32 indexed stakedContentId,
		bytes32 indexed contentId,
		uint256 remainingNetworkAmount,
		uint256 remainingPrimordialAmount,
		uint256 primordialWeightedMultiplier
	);

	// Event to be broadcasted to public when `stakeOwner` unstakes all ion amount on an existing content
	event UNSTAKECONTENT21(address indexed stakeOwner, bytes32 indexed stakedContentId);	//inject NONSTANDARD NAMING

	// Event to be broadcasted to public when `stakeOwner` re-stakes an existing content
	event STAKEEXISTINGCONTENT787(	//inject NONSTANDARD NAMING
		address indexed stakeOwner,
		bytes32 indexed stakedContentId,
		bytes32 indexed contentId,
		uint256 currentNetworkAmount,
		uint256 currentPrimordialAmount,
		uint256 currentPrimordialWeightedMultiplier
	);

	                                                                                                                                                                                                                                                                                                                                                                                            
	constructor(address _aoIonAddress, address _aoTreasuryAddress, address _aoContentAddress, address _nameFactoryAddress, address _namePublicKeyAddress, address _nameTAOPositionAddress) public {
		SETAOIONADDRESS699(_aoIonAddress);
		SETAOTREASURYADDRESS725(_aoTreasuryAddress);
		SETAOCONTENTADDRESS364(_aoContentAddress);
		SETNAMEFACTORYADDRESS426(_nameFactoryAddress);
		SETNAMEPUBLICKEYADDRESS460(_namePublicKeyAddress);
		SETNAMETAOPOSITIONADDRESS99(_nameTAOPositionAddress);
	}

	                                                                                                                                                             
	modifier ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (AOLibrary.ISTHEAO807(msg.sender, theAO, nameTAOPositionAddress));
		_;
	}

	                                 
	                                                                                                                 
	function TRANSFEROWNERSHIP644(address _theAO) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_theAO != address(0));
		theAO = _theAO;
	}

	                                                                                                                                                                            
	function SETWHITELIST171(address _account, bool _whitelist) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_account != address(0));
		whitelist[_account] = _whitelist;
	}

	                                                                                         
	function SETAOIONADDRESS699(address _aoIonAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_aoIonAddress != address(0));
		aoIonAddress = _aoIonAddress;
		_aoIon = AOIon(_aoIonAddress);
	}

	                                                                                                        
	function SETAOTREASURYADDRESS725(address _aoTreasuryAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_aoTreasuryAddress != address(0));
		aoTreasuryAddress = _aoTreasuryAddress;
		_aoTreasury = IAOTreasury(_aoTreasuryAddress);
	}

	                                                                                                      
	function SETAOCONTENTADDRESS364(address _aoContentAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_aoContentAddress != address(0));
		aoContentAddress = _aoContentAddress;
		_aoContent = IAOContent(_aoContentAddress);
	}

	                                                                                                           
	function SETNAMEFACTORYADDRESS426(address _nameFactoryAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_nameFactoryAddress != address(0));
		nameFactoryAddress = _nameFactoryAddress;
		_nameFactory = INameFactory(_nameFactoryAddress);
	}

	                                                                                                                 
	function SETNAMEPUBLICKEYADDRESS460(address _namePublicKeyAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_namePublicKeyAddress != address(0));
		namePublicKeyAddress = _namePublicKeyAddress;
		_namePublicKey = INamePublicKey(_namePublicKeyAddress);
	}

	                                                                                                                       
	function SETNAMETAOPOSITIONADDRESS99(address _nameTAOPositionAddress) public ONLYTHEAO881 {	//inject NONSTANDARD NAMING
		require (_nameTAOPositionAddress != address(0));
		nameTAOPositionAddress = _nameTAOPositionAddress;
	}

	                            
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	function CREATE990(address _stakeOwner,	//inject NONSTANDARD NAMING
		bytes32 _contentId,
		uint256 _networkIntegerAmount,
		uint256 _networkFractionAmount,
		bytes8 _denomination,
		uint256 _primordialAmount,
		uint256 _profitPercentage
		) external INWHITELIST936 returns (bytes32) {
		require (_CANCREATE436(_stakeOwner, _contentId, _networkIntegerAmount, _networkFractionAmount, _denomination, _primordialAmount, _profitPercentage));
		// Increment totalStakedContents
		totalStakedContents++;

		// Generate stakedContentId
		bytes32 _stakedContentId = keccak256(abi.encodePacked(this, _stakeOwner, _contentId));
		StakedContent storage _stakedContent = stakedContents[totalStakedContents];

		// Make sure the node doesn't stake the same content twice
		require (_stakedContent.stakeOwner == address(0));

		_stakedContent.stakedContentId = _stakedContentId;
		_stakedContent.contentId = _contentId;
		_stakedContent.stakeOwner = _stakeOwner;
		_stakedContent.profitPercentage = _profitPercentage;
		_stakedContent.active = true;
		_stakedContent.createdOnTimestamp = now;

		if (_aoTreasury.ISDENOMINATIONEXIST355(_denomination) && (_networkIntegerAmount > 0 || _networkFractionAmount > 0)) {
			_stakedContent.networkAmount = _aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination);
			require (_aoIon.STAKEFROM761(_namePublicKey.GETDEFAULTKEY207(_stakeOwner), _stakedContent.networkAmount));
		}
		if (_primordialAmount > 0) {
			_stakedContent.primordialAmount = _primordialAmount;

			// Primordial ion is the base AO ion
			_stakedContent.primordialWeightedMultiplier = _aoIon.WEIGHTEDMULTIPLIERBYADDRESS560(_namePublicKey.GETDEFAULTKEY207(_stakedContent.stakeOwner));
			require (_aoIon.STAKEPRIMORDIALFROM923(_namePublicKey.GETDEFAULTKEY207(_stakedContent.stakeOwner), _primordialAmount, _stakedContent.primordialWeightedMultiplier));
		}

		stakedContentIndex[_stakedContentId] = totalStakedContents;

		emit STAKECONTENT791(_stakedContent.stakeOwner, _stakedContent.stakedContentId, _stakedContent.contentId, _stakedContent.networkAmount, _stakedContent.primordialAmount, _stakedContent.primordialWeightedMultiplier, _stakedContent.profitPercentage, _stakedContent.createdOnTimestamp);
		return _stakedContent.stakedContentId;
	}

	                                                                                                                                                                                                                                                  
	function SETPROFITPERCENTAGE451(bytes32 _stakedContentId, uint256 _profitPercentage) public {	//inject NONSTANDARD NAMING
		require (_profitPercentage <= AOLibrary.PERCENTAGE_DIVISOR950());

		// Make sure the staked content exist
		require (stakedContentIndex[_stakedContentId] > 0);

		address _stakeOwnerNameId = _nameFactory.ETHADDRESSTONAMEID742(msg.sender);
		require (_stakeOwnerNameId != address(0));

		StakedContent storage _stakedContent = stakedContents[stakedContentIndex[_stakedContentId]];
		// Make sure the staked content owner is the same as the sender
		require (_stakedContent.stakeOwner == _stakeOwnerNameId);

		// Make sure we are updating profit percentage for AO Content only
		// Creative Commons/T(AO) Content has 0 profit percentage
		require (_aoContent.ISAOCONTENTUSAGETYPE884(_stakedContent.contentId));

		_stakedContent.profitPercentage = _profitPercentage;

		emit SETPROFITPERCENTAGE101(_stakeOwnerNameId, _stakedContentId, _profitPercentage);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	function GETBYID713(bytes32 _stakedContentId) external view returns (bytes32, address, uint256, uint256, uint256, uint256, bool, uint256) {	//inject NONSTANDARD NAMING
		// Make sure the staked content exist
		require (stakedContentIndex[_stakedContentId] > 0);

		StakedContent memory _stakedContent = stakedContents[stakedContentIndex[_stakedContentId]];
		return (
			_stakedContent.contentId,
			_stakedContent.stakeOwner,
			_stakedContent.networkAmount,
			_stakedContent.primordialAmount,
			_stakedContent.primordialWeightedMultiplier,
			_stakedContent.profitPercentage,
			_stakedContent.active,
			_stakedContent.createdOnTimestamp
		);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	function UNSTAKEPARTIALCONTENT405(bytes32 _stakedContentId,	//inject NONSTANDARD NAMING
		uint256 _networkIntegerAmount,
		uint256 _networkFractionAmount,
		bytes8 _denomination,
		uint256 _primordialAmount
		) public {
		// Make sure the staked content exist
		require (stakedContentIndex[_stakedContentId] > 0);
		require (_networkIntegerAmount > 0 || _networkFractionAmount > 0 || _primordialAmount > 0);

		StakedContent storage _stakedContent = stakedContents[stakedContentIndex[_stakedContentId]];
		(, uint256 _fileSize,,,,,,,) = _aoContent.GETBYID713(_stakedContent.contentId);

		address _stakeOwnerNameId = _nameFactory.ETHADDRESSTONAMEID742(msg.sender);
		require (_stakeOwnerNameId != address(0));

		// Make sure the staked content owner is the same as the sender
		require (_stakedContent.stakeOwner == _stakeOwnerNameId);
		// Make sure the staked content is currently active (staked) with some amounts
		require (this.ISACTIVE109(_stakedContentId));
		// Make sure the staked content has enough balance to unstake
		require (_CANUNSTAKEPARTIAL404(_networkIntegerAmount, _networkFractionAmount, _denomination, _primordialAmount, _stakedContent.networkAmount, _stakedContent.primordialAmount, _fileSize));

		if (_aoTreasury.ISDENOMINATIONEXIST355(_denomination) && (_networkIntegerAmount > 0 || _networkFractionAmount > 0)) {
			uint256 _unstakeNetworkAmount = _aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination);
			_stakedContent.networkAmount = _stakedContent.networkAmount.SUB542(_unstakeNetworkAmount);
			require (_aoIon.UNSTAKEFROM709(_namePublicKey.GETDEFAULTKEY207(_stakeOwnerNameId), _unstakeNetworkAmount));
		}
		if (_primordialAmount > 0) {
			_stakedContent.primordialAmount = _stakedContent.primordialAmount.SUB542(_primordialAmount);
			require (_aoIon.UNSTAKEPRIMORDIALFROM352(_namePublicKey.GETDEFAULTKEY207(_stakeOwnerNameId), _primordialAmount, _stakedContent.primordialWeightedMultiplier));
		}
		emit UNSTAKEPARTIALCONTENT485(_stakedContent.stakeOwner, _stakedContent.stakedContentId, _stakedContent.contentId, _stakedContent.networkAmount, _stakedContent.primordialAmount, _stakedContent.primordialWeightedMultiplier);
	}

	                                                                                                                                                                
	function UNSTAKECONTENT517(bytes32 _stakedContentId) public {	//inject NONSTANDARD NAMING
		// Make sure the staked content exist
		require (stakedContentIndex[_stakedContentId] > 0);

		StakedContent storage _stakedContent = stakedContents[stakedContentIndex[_stakedContentId]];

		address _stakeOwnerNameId = _nameFactory.ETHADDRESSTONAMEID742(msg.sender);
		require (_stakeOwnerNameId != address(0));

		// Make sure the staked content owner is the same as the sender
		require (_stakedContent.stakeOwner == _stakeOwnerNameId);
		// Make sure the staked content is currently active (staked) with some amounts
		require (this.ISACTIVE109(_stakedContentId));
		_stakedContent.active = false;

		if (_stakedContent.networkAmount > 0) {
			uint256 _unstakeNetworkAmount = _stakedContent.networkAmount;
			_stakedContent.networkAmount = 0;
			require (_aoIon.UNSTAKEFROM709(_namePublicKey.GETDEFAULTKEY207(_stakeOwnerNameId), _unstakeNetworkAmount));
		}
		if (_stakedContent.primordialAmount > 0) {
			uint256 _primordialAmount = _stakedContent.primordialAmount;
			uint256 _primordialWeightedMultiplier = _stakedContent.primordialWeightedMultiplier;
			_stakedContent.primordialAmount = 0;
			_stakedContent.primordialWeightedMultiplier = 0;
			require (_aoIon.UNSTAKEPRIMORDIALFROM352(_namePublicKey.GETDEFAULTKEY207(_stakeOwnerNameId), _primordialAmount, _primordialWeightedMultiplier));
		}
		emit UNSTAKECONTENT21(_stakedContent.stakeOwner, _stakedContentId);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	function STAKEEXISTINGCONTENT14(bytes32 _stakedContentId,	//inject NONSTANDARD NAMING
		uint256 _networkIntegerAmount,
		uint256 _networkFractionAmount,
		bytes8 _denomination,
		uint256 _primordialAmount
		) public {
		// Make sure the staked content exist
		require (stakedContentIndex[_stakedContentId] > 0);

		StakedContent storage _stakedContent = stakedContents[stakedContentIndex[_stakedContentId]];
		(, uint256 _fileSize,,,,,,,) = _aoContent.GETBYID713(_stakedContent.contentId);

		address _stakeOwnerNameId = _nameFactory.ETHADDRESSTONAMEID742(msg.sender);
		require (_stakeOwnerNameId != address(0));

		// Make sure the staked content owner is the same as the sender
		require (_stakedContent.stakeOwner == _stakeOwnerNameId);
		require (_networkIntegerAmount > 0 || _networkFractionAmount > 0 || _primordialAmount > 0);
		require (_CANSTAKEEXISTING524(_aoContent.ISAOCONTENTUSAGETYPE884(_stakedContent.contentId), _fileSize, _stakedContent.networkAmount.ADD927(_stakedContent.primordialAmount), _networkIntegerAmount, _networkFractionAmount, _denomination, _primordialAmount));

		// Make sure we can stake primordial ion
		// If we are currently staking an active staked content, then the stake owner's weighted multiplier has to match `stakedContent.primordialWeightedMultiplier`
		// i.e, can't use a combination of different weighted multiplier. Stake owner has to call unstakeContent() to unstake all ions first
		if (_primordialAmount > 0 && _stakedContent.active && _stakedContent.primordialAmount > 0 && _stakedContent.primordialWeightedMultiplier > 0) {
			require (_aoIon.WEIGHTEDMULTIPLIERBYADDRESS560(_namePublicKey.GETDEFAULTKEY207(_stakeOwnerNameId)) == _stakedContent.primordialWeightedMultiplier);
		}

		_stakedContent.active = true;
		if (_aoTreasury.ISDENOMINATIONEXIST355(_denomination) && (_networkIntegerAmount > 0 || _networkFractionAmount > 0)) {
			uint256 _stakeNetworkAmount = _aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination);
			_stakedContent.networkAmount = _stakedContent.networkAmount.ADD927(_stakeNetworkAmount);
			require (_aoIon.STAKEFROM761(_namePublicKey.GETDEFAULTKEY207(_stakedContent.stakeOwner), _stakeNetworkAmount));
		}
		if (_primordialAmount > 0) {
			_stakedContent.primordialAmount = _stakedContent.primordialAmount.ADD927(_primordialAmount);

			// Primordial ion is the base AO ion
			_stakedContent.primordialWeightedMultiplier = _aoIon.WEIGHTEDMULTIPLIERBYADDRESS560(_namePublicKey.GETDEFAULTKEY207(_stakedContent.stakeOwner));
			require (_aoIon.STAKEPRIMORDIALFROM923(_namePublicKey.GETDEFAULTKEY207(_stakedContent.stakeOwner), _primordialAmount, _stakedContent.primordialWeightedMultiplier));
		}

		emit STAKEEXISTINGCONTENT787(_stakeOwnerNameId, _stakedContent.stakedContentId, _stakedContent.contentId, _stakedContent.networkAmount, _stakedContent.primordialAmount, _stakedContent.primordialWeightedMultiplier);
	}

	                                                                                                                                                                    
	function ISACTIVE109(bytes32 _stakedContentId) external view returns (bool) {	//inject NONSTANDARD NAMING
		// Make sure the staked content exist
		require (stakedContentIndex[_stakedContentId] > 0);

		StakedContent memory _stakedContent = stakedContents[stakedContentIndex[_stakedContentId]];
		return (_stakedContent.active == true && (_stakedContent.networkAmount > 0 || (_stakedContent.primordialAmount > 0 && _stakedContent.primordialWeightedMultiplier > 0)));
	}

	                              
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
	function _CANCREATE436(address _stakeOwner,	//inject NONSTANDARD NAMING
		bytes32 _contentId,
		uint256 _networkIntegerAmount,
		uint256 _networkFractionAmount,
		bytes8 _denomination,
		uint256 _primordialAmount,
		uint256 _profitPercentage) internal view returns (bool) {
		(address _contentCreator, uint256 _fileSize,,,,,,,) = _aoContent.GETBYID713(_contentId);
		return (_stakeOwner != address(0) &&
			AOLibrary.ISNAME544(_stakeOwner) &&
			_stakeOwner == _contentCreator &&
			(_networkIntegerAmount > 0 || _networkFractionAmount > 0 || _primordialAmount > 0) &&
			(_aoContent.ISAOCONTENTUSAGETYPE884(_contentId) ?
				_aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination).ADD927(_primordialAmount) >= _fileSize :
				_aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination).ADD927(_primordialAmount) == _fileSize
			) &&
			_profitPercentage <= AOLibrary.PERCENTAGE_DIVISOR950()
		);
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	function _CANUNSTAKEPARTIAL404(	//inject NONSTANDARD NAMING
		uint256 _networkIntegerAmount,
		uint256 _networkFractionAmount,
		bytes8 _denomination,
		uint256 _primordialAmount,
		uint256 _stakedNetworkAmount,
		uint256 _stakedPrimordialAmount,
		uint256 _stakedFileSize
		) internal view returns (bool) {
		if (
			(_denomination.length > 0 && _denomination[0] != 0 &&
				(_networkIntegerAmount > 0 || _networkFractionAmount > 0) &&
				_stakedNetworkAmount < _aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination)
			) ||
			_stakedPrimordialAmount < _primordialAmount ||
			(
				_denomination.length > 0 && _denomination[0] != 0
					&& (_networkIntegerAmount > 0 || _networkFractionAmount > 0)
					&& (_stakedNetworkAmount.SUB542(_aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination)).ADD927(_stakedPrimordialAmount.SUB542(_primordialAmount)) < _stakedFileSize)
			) ||
			( _denomination.length == 0 && _denomination[0] == 0 && _networkIntegerAmount == 0 && _networkFractionAmount == 0 && _primordialAmount > 0 && _stakedPrimordialAmount.SUB542(_primordialAmount) < _stakedFileSize)
		) {
			return false;
		} else {
			return true;
		}
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	function _CANSTAKEEXISTING524(	//inject NONSTANDARD NAMING
		bool _isAOContentUsageType,
		uint256 _fileSize,
		uint256 _stakedAmount,
		uint256 _networkIntegerAmount,
		uint256 _networkFractionAmount,
		bytes8 _denomination,
		uint256 _primordialAmount
	) internal view returns (bool) {
		if (_isAOContentUsageType) {
			return _aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination).ADD927(_primordialAmount).ADD927(_stakedAmount) >= _fileSize;
		} else {
			return _aoTreasury.TOBASE998(_networkIntegerAmount, _networkFractionAmount, _denomination).ADD927(_primordialAmount).ADD927(_stakedAmount) == _fileSize;
		}
	}
}