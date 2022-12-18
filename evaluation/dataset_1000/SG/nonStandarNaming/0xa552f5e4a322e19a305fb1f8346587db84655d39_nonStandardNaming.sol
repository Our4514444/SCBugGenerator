// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER752(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE985(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM397(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY101() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF257(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE112(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER230(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL719(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL669(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV631(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB565(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD338(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD821(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

pragma solidity ^0.5.2;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY101() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF257(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE112(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER752(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER295(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE985(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE611(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM397(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER295(from, to, value);
        _APPROVE611(from, msg.sender, _allowed[from][msg.sender].SUB565(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE280(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE611(msg.sender, spender, _allowed[msg.sender][spender].ADD338(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE237(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE611(msg.sender, spender, _allowed[msg.sender][spender].SUB565(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER295(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB565(value);
        _balances[to] = _balances[to].ADD338(value);
        emit TRANSFER230(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT512(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD338(value);
        _balances[account] = _balances[account].ADD338(value);
        emit TRANSFER230(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN773(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB565(value);
        _balances[account] = _balances[account].SUB565(value);
        emit TRANSFER230(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE611(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL719(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM239(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN773(account, value);
        _APPROVE611(account, msg.sender, _allowed[account][msg.sender].SUB565(value));
    }
}

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED460(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED460(address(0), _owner);
    }

                                                        
    function OWNER914() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER972() {	//inject NONSTANDARD NAMING
        require(ISOWNER122());
        _;
    }

                                                                                 
    function ISOWNER122() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP134() public ONLYOWNER972 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED460(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP424(address newOwner) public ONLYOWNER972 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP722(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP722(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED460(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @gnosis.pm/mock-contract/contracts/MockContract.sol

pragma solidity ^0.5.0;

interface MockInterface {
	                                                                                                                                                                                                                                                                                       
	function GIVENANYRETURN437(bytes calldata response) external;	//inject NONSTANDARD NAMING
	function GIVENANYRETURNBOOL84(bool response) external;	//inject NONSTANDARD NAMING
	function GIVENANYRETURNUINT627(uint response) external;	//inject NONSTANDARD NAMING
	function GIVENANYRETURNADDRESS892(address response) external;	//inject NONSTANDARD NAMING

	function GIVENANYREVERT104() external;	//inject NONSTANDARD NAMING
	function GIVENANYREVERTWITHMESSAGE480(string calldata message) external;	//inject NONSTANDARD NAMING
	function GIVENANYRUNOUTOFGAS65() external;	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	function GIVENMETHODRETURN376(bytes calldata method, bytes calldata response) external;	//inject NONSTANDARD NAMING
	function GIVENMETHODRETURNBOOL835(bytes calldata method, bool response) external;	//inject NONSTANDARD NAMING
	function GIVENMETHODRETURNUINT42(bytes calldata method, uint response) external;	//inject NONSTANDARD NAMING
	function GIVENMETHODRETURNADDRESS100(bytes calldata method, address response) external;	//inject NONSTANDARD NAMING

	function GIVENMETHODREVERT695(bytes calldata method) external;	//inject NONSTANDARD NAMING
	function GIVENMETHODREVERTWITHMESSAGE143(bytes calldata method, string calldata message) external;	//inject NONSTANDARD NAMING
	function GIVENMETHODRUNOUTOFGAS892(bytes calldata method) external;	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                                                                                                                                                                                                              
	function GIVENCALLDATARETURN974(bytes calldata call, bytes calldata response) external;	//inject NONSTANDARD NAMING
	function GIVENCALLDATARETURNBOOL799(bytes calldata call, bool response) external;	//inject NONSTANDARD NAMING
	function GIVENCALLDATARETURNUINT560(bytes calldata call, uint response) external;	//inject NONSTANDARD NAMING
	function GIVENCALLDATARETURNADDRESS528(bytes calldata call, address response) external;	//inject NONSTANDARD NAMING

	function GIVENCALLDATAREVERT419(bytes calldata call) external;	//inject NONSTANDARD NAMING
	function GIVENCALLDATAREVERTWITHMESSAGE39(bytes calldata call, string calldata message) external;	//inject NONSTANDARD NAMING
	function GIVENCALLDATARUNOUTOFGAS735(bytes calldata call) external;	//inject NONSTANDARD NAMING

	                                                                                                    
	function INVOCATIONCOUNT686() external returns (uint);	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                                                                        
	function INVOCATIONCOUNTFORMETHOD846(bytes calldata method) external returns (uint);	//inject NONSTANDARD NAMING

	                                                                                                                                                                               
	function INVOCATIONCOUNTFORCALLDATA340(bytes calldata call) external returns (uint);	//inject NONSTANDARD NAMING

	                                                                  
	 function RESET905() external;	//inject NONSTANDARD NAMING
}

                                               
contract MockContract is MockInterface {
	enum MockType { Return, Revert, OutOfGas }
	
	bytes32 public constant mocks_list_start592 = hex"01";	//inject NONSTANDARD NAMING
	bytes public constant mocks_list_end880 = "0xff";	//inject NONSTANDARD NAMING
	bytes32 public constant mocks_list_end_hash800 = keccak256(mocks_list_end880);	//inject NONSTANDARD NAMING
	bytes4 public constant sentinel_any_mocks189 = hex"01";	//inject NONSTANDARD NAMING

	// A linked list allows easy iteration and inclusion checks
	mapping(bytes32 => bytes) calldataMocks;
	mapping(bytes => MockType) calldataMockTypes;
	mapping(bytes => bytes) calldataExpectations;
	mapping(bytes => string) calldataRevertMessage;
	mapping(bytes32 => uint) calldataInvocations;

	mapping(bytes4 => bytes4) methodIdMocks;
	mapping(bytes4 => MockType) methodIdMockTypes;
	mapping(bytes4 => bytes) methodIdExpectations;
	mapping(bytes4 => string) methodIdRevertMessages;
	mapping(bytes32 => uint) methodIdInvocations;

	MockType fallbackMockType;
	bytes fallbackExpectation;
	string fallbackRevertMessage;
	uint invocations;
	uint resetCount;

	constructor() public {
		calldataMocks[mocks_list_start592] = mocks_list_end880;
		methodIdMocks[sentinel_any_mocks189] = sentinel_any_mocks189;
	}

	function TRACKCALLDATAMOCK693(bytes memory call) private {	//inject NONSTANDARD NAMING
		bytes32 callHash = keccak256(call);
		if (calldataMocks[callHash].length == 0) {
			calldataMocks[callHash] = calldataMocks[mocks_list_start592];
			calldataMocks[mocks_list_start592] = call;
		}
	}

	function TRACKMETHODIDMOCK810(bytes4 methodId) private {	//inject NONSTANDARD NAMING
		if (methodIdMocks[methodId] == 0x0) {
			methodIdMocks[methodId] = methodIdMocks[sentinel_any_mocks189];
			methodIdMocks[sentinel_any_mocks189] = methodId;
		}
	}

	function _GIVENANYRETURN932(bytes memory response) internal {	//inject NONSTANDARD NAMING
		fallbackMockType = MockType.Return;
		fallbackExpectation = response;
	}

	function GIVENANYRETURN437(bytes calldata response) external {	//inject NONSTANDARD NAMING
		_GIVENANYRETURN932(response);
	}

	function GIVENANYRETURNBOOL84(bool response) external {	//inject NONSTANDARD NAMING
		uint flag = response ? 1 : 0;
		_GIVENANYRETURN932(UINTTOBYTES186(flag));
	}

	function GIVENANYRETURNUINT627(uint response) external {	//inject NONSTANDARD NAMING
		_GIVENANYRETURN932(UINTTOBYTES186(response));	
	}

	function GIVENANYRETURNADDRESS892(address response) external {	//inject NONSTANDARD NAMING
		_GIVENANYRETURN932(UINTTOBYTES186(uint(response)));
	}

	function GIVENANYREVERT104() external {	//inject NONSTANDARD NAMING
		fallbackMockType = MockType.Revert;
		fallbackRevertMessage = "";
	}

	function GIVENANYREVERTWITHMESSAGE480(string calldata message) external {	//inject NONSTANDARD NAMING
		fallbackMockType = MockType.Revert;
		fallbackRevertMessage = message;
	}

	function GIVENANYRUNOUTOFGAS65() external {	//inject NONSTANDARD NAMING
		fallbackMockType = MockType.OutOfGas;
	}

	function _GIVENCALLDATARETURN632(bytes memory call, bytes memory response) private  {	//inject NONSTANDARD NAMING
		calldataMockTypes[call] = MockType.Return;
		calldataExpectations[call] = response;
		TRACKCALLDATAMOCK693(call);
	}

	function GIVENCALLDATARETURN974(bytes calldata call, bytes calldata response) external  {	//inject NONSTANDARD NAMING
		_GIVENCALLDATARETURN632(call, response);
	}

	function GIVENCALLDATARETURNBOOL799(bytes calldata call, bool response) external {	//inject NONSTANDARD NAMING
		uint flag = response ? 1 : 0;
		_GIVENCALLDATARETURN632(call, UINTTOBYTES186(flag));
	}

	function GIVENCALLDATARETURNUINT560(bytes calldata call, uint response) external {	//inject NONSTANDARD NAMING
		_GIVENCALLDATARETURN632(call, UINTTOBYTES186(response));
	}

	function GIVENCALLDATARETURNADDRESS528(bytes calldata call, address response) external {	//inject NONSTANDARD NAMING
		_GIVENCALLDATARETURN632(call, UINTTOBYTES186(uint(response)));
	}

	function _GIVENMETHODRETURN801(bytes memory call, bytes memory response) private {	//inject NONSTANDARD NAMING
		bytes4 method = BYTESTOBYTES4322(call);
		methodIdMockTypes[method] = MockType.Return;
		methodIdExpectations[method] = response;
		TRACKMETHODIDMOCK810(method);		
	}

	function GIVENMETHODRETURN376(bytes calldata call, bytes calldata response) external {	//inject NONSTANDARD NAMING
		_GIVENMETHODRETURN801(call, response);
	}

	function GIVENMETHODRETURNBOOL835(bytes calldata call, bool response) external {	//inject NONSTANDARD NAMING
		uint flag = response ? 1 : 0;
		_GIVENMETHODRETURN801(call, UINTTOBYTES186(flag));
	}

	function GIVENMETHODRETURNUINT42(bytes calldata call, uint response) external {	//inject NONSTANDARD NAMING
		_GIVENMETHODRETURN801(call, UINTTOBYTES186(response));
	}

	function GIVENMETHODRETURNADDRESS100(bytes calldata call, address response) external {	//inject NONSTANDARD NAMING
		_GIVENMETHODRETURN801(call, UINTTOBYTES186(uint(response)));
	}

	function GIVENCALLDATAREVERT419(bytes calldata call) external {	//inject NONSTANDARD NAMING
		calldataMockTypes[call] = MockType.Revert;
		calldataRevertMessage[call] = "";
		TRACKCALLDATAMOCK693(call);
	}

	function GIVENMETHODREVERT695(bytes calldata call) external {	//inject NONSTANDARD NAMING
		bytes4 method = BYTESTOBYTES4322(call);
		methodIdMockTypes[method] = MockType.Revert;
		TRACKMETHODIDMOCK810(method);		
	}

	function GIVENCALLDATAREVERTWITHMESSAGE39(bytes calldata call, string calldata message) external {	//inject NONSTANDARD NAMING
		calldataMockTypes[call] = MockType.Revert;
		calldataRevertMessage[call] = message;
		TRACKCALLDATAMOCK693(call);
	}

	function GIVENMETHODREVERTWITHMESSAGE143(bytes calldata call, string calldata message) external {	//inject NONSTANDARD NAMING
		bytes4 method = BYTESTOBYTES4322(call);
		methodIdMockTypes[method] = MockType.Revert;
		methodIdRevertMessages[method] = message;
		TRACKMETHODIDMOCK810(method);		
	}

	function GIVENCALLDATARUNOUTOFGAS735(bytes calldata call) external {	//inject NONSTANDARD NAMING
		calldataMockTypes[call] = MockType.OutOfGas;
		TRACKCALLDATAMOCK693(call);
	}

	function GIVENMETHODRUNOUTOFGAS892(bytes calldata call) external {	//inject NONSTANDARD NAMING
		bytes4 method = BYTESTOBYTES4322(call);
		methodIdMockTypes[method] = MockType.OutOfGas;
		TRACKMETHODIDMOCK810(method);	
	}

	function INVOCATIONCOUNT686() external returns (uint) {	//inject NONSTANDARD NAMING
		return invocations;
	}

	function INVOCATIONCOUNTFORMETHOD846(bytes calldata call) external returns (uint) {	//inject NONSTANDARD NAMING
		bytes4 method = BYTESTOBYTES4322(call);
		return methodIdInvocations[keccak256(abi.encodePacked(resetCount, method))];
	}

	function INVOCATIONCOUNTFORCALLDATA340(bytes calldata call) external returns (uint) {	//inject NONSTANDARD NAMING
		return calldataInvocations[keccak256(abi.encodePacked(resetCount, call))];
	}

	function RESET905() external {	//inject NONSTANDARD NAMING
		// Reset all exact calldataMocks
		bytes memory nextMock = calldataMocks[mocks_list_start592];
		bytes32 mockHash = keccak256(nextMock);
		// We cannot compary bytes
		while(mockHash != mocks_list_end_hash800) {
			// Reset all mock maps
			calldataMockTypes[nextMock] = MockType.Return;
			calldataExpectations[nextMock] = hex"";
			calldataRevertMessage[nextMock] = "";
			// Set next mock to remove
			nextMock = calldataMocks[mockHash];
			// Remove from linked list
			calldataMocks[mockHash] = "";
			// Update mock hash
			mockHash = keccak256(nextMock);
		}
		// Clear list
		calldataMocks[mocks_list_start592] = mocks_list_end880;

		// Reset all any calldataMocks
		bytes4 nextAnyMock = methodIdMocks[sentinel_any_mocks189];
		while(nextAnyMock != sentinel_any_mocks189) {
			bytes4 currentAnyMock = nextAnyMock;
			methodIdMockTypes[currentAnyMock] = MockType.Return;
			methodIdExpectations[currentAnyMock] = hex"";
			methodIdRevertMessages[currentAnyMock] = "";
			nextAnyMock = methodIdMocks[currentAnyMock];
			// Remove from linked list
			methodIdMocks[currentAnyMock] = 0x0;
		}
		// Clear list
		methodIdMocks[sentinel_any_mocks189] = sentinel_any_mocks189;

		fallbackExpectation = "";
		fallbackMockType = MockType.Return;
		invocations = 0;
		resetCount += 1;
	}

	function USEALLGAS496() private {	//inject NONSTANDARD NAMING
		while(true) {
			bool s;
			assembly {
				//expensive call to EC multiply contract
				s := call(sub(gas, 2000), 6, 0, 0x0, 0xc0, 0x0, 0x60)
			}
		}
	}

	function BYTESTOBYTES4322(bytes memory b) private pure returns (bytes4) {	//inject NONSTANDARD NAMING
		bytes4 out;
		for (uint i = 0; i < 4; i++) {
			out |= bytes4(b[i] & 0xFF) >> (i * 8);
		}
		return out;
	}

	function UINTTOBYTES186(uint256 x) private pure returns (bytes memory b) {	//inject NONSTANDARD NAMING
		b = new bytes(32);
		assembly { mstore(add(b, 32), x) }
	}

	function UPDATEINVOCATIONCOUNT433(bytes4 methodId, bytes memory originalMsgData) public {	//inject NONSTANDARD NAMING
		require(msg.sender == address(this), "Can only be called from the contract itself");
		invocations += 1;
		methodIdInvocations[keccak256(abi.encodePacked(resetCount, methodId))] += 1;
		calldataInvocations[keccak256(abi.encodePacked(resetCount, originalMsgData))] += 1;
	}

	function() payable external {
		bytes4 methodId;
		assembly {
			methodId := calldataload(0)
		}

		// First, check exact matching overrides
		if (calldataMockTypes[msg.data] == MockType.Revert) {
			revert(calldataRevertMessage[msg.data]);
		}
		if (calldataMockTypes[msg.data] == MockType.OutOfGas) {
			USEALLGAS496();
		}
		bytes memory result = calldataExpectations[msg.data];

		// Then check method Id overrides
		if (result.length == 0) {
			if (methodIdMockTypes[methodId] == MockType.Revert) {
				revert(methodIdRevertMessages[methodId]);
			}
			if (methodIdMockTypes[methodId] == MockType.OutOfGas) {
				USEALLGAS496();
			}
			result = methodIdExpectations[methodId];
		}

		// Last, use the fallback override
		if (result.length == 0) {
			if (fallbackMockType == MockType.Revert) {
				revert(fallbackRevertMessage);
			}
			if (fallbackMockType == MockType.OutOfGas) {
				USEALLGAS496();
			}
			result = fallbackExpectation;
		}

		// Record invocation as separate call so we don't rollback in case we are called with STATICCALL
		(, bytes memory r) = address(this).call.gas(100000)(abi.encodeWithSignature("updateInvocationCount(bytes4,bytes)", methodId, msg.data));
		assert(r.length == 0);
		
		assembly {
			return(add(0x20, result), mload(result))
		}
	}
}

// File: openzeppelin-solidity/contracts/access/Roles.sol

pragma solidity ^0.5.2;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD338(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS898(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE320(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS898(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS898(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: openzeppelin-solidity/contracts/access/roles/MinterRole.sol

pragma solidity ^0.5.2;


contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED185(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED935(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER97(msg.sender);
    }

    modifier ONLYMINTER31() {	//inject NONSTANDARD NAMING
        require(ISMINTER900(msg.sender));
        _;
    }

    function ISMINTER900(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS898(account);
    }

    function ADDMINTER380(address account) public ONLYMINTER31 {	//inject NONSTANDARD NAMING
        _ADDMINTER97(account);
    }

    function RENOUNCEMINTER758() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER1000(msg.sender);
    }

    function _ADDMINTER97(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD338(account);
        emit MINTERADDED185(account);
    }

    function _REMOVEMINTER1000(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE320(account);
        emit MINTERREMOVED935(account);
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol

pragma solidity ^0.5.2;



                                                           
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                                                                                                                                
    function MINT815(address to, uint256 value) public ONLYMINTER31 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT512(to, value);
        return true;
    }
}

// File: contracts/interfaces/IDutchExchange.sol

pragma solidity ^0.5.0;



contract IDutchExchange {

    mapping(address => mapping(address => mapping(uint => mapping(address => uint)))) public sellerBalances;
    mapping(address => mapping(address => mapping(uint => mapping(address => uint)))) public buyerBalances;
    mapping(address => mapping(address => mapping(uint => mapping(address => uint)))) public claimedAmounts;
    mapping(address => mapping(address => uint)) public balances;

    function WITHDRAW452(address tokenAddress, uint amount) public returns (uint);	//inject NONSTANDARD NAMING
    function DEPOSIT20(address tokenAddress, uint amount) public returns (uint);	//inject NONSTANDARD NAMING
    function ETHTOKEN755() public returns(address);	//inject NONSTANDARD NAMING
    function FRTTOKEN483() public returns(address);	//inject NONSTANDARD NAMING
    function OWLTOKEN441() public returns(address);	//inject NONSTANDARD NAMING
    function GETAUCTIONINDEX161(address token1, address token2) public view returns(uint256);	//inject NONSTANDARD NAMING
    function POSTBUYORDER557(address token1, address token2, uint256 auctionIndex, uint256 amount) public returns(uint256);	//inject NONSTANDARD NAMING
    function POSTSELLORDER389(address token1, address token2, uint256 auctionIndex, uint256 tokensBought) public returns(uint256, uint256);	//inject NONSTANDARD NAMING
    function GETCURRENTAUCTIONPRICE666(address token1, address token2, uint256 auctionIndex) public view returns(uint256, uint256);	//inject NONSTANDARD NAMING
    function CLAIMSELLERFUNDS646(address sellToken, address buyToken, address user, uint auctionIndex) public returns (uint returned, uint frtsIssued);	//inject NONSTANDARD NAMING
}

// File: @gnosis.pm/util-contracts/contracts/Proxy.sol

pragma solidity ^0.5.2;

                                                                                                            
                                      
contract Proxied {
    address public masterCopy;
}

                                                                                                                    
                                              
contract Proxy is Proxied {
                                                                       
                                               
    constructor(address _masterCopy) public {
        require(_masterCopy != address(0), "The master copy is required");
        masterCopy = _masterCopy;
    }

                                                                                              
    function() external payable {
        address _masterCopy = masterCopy;
        assembly {
            calldatacopy(0, 0, calldatasize)
            let success := delegatecall(not(0), _masterCopy, 0, calldatasize, 0, 0)
            returndatacopy(0, 0, returndatasize)
            switch success
                case 0 {
                    revert(0, returndatasize)
                }
                default {
                    return(0, returndatasize)
                }
        }
    }
}

// File: @gnosis.pm/util-contracts/contracts/Token.sol

                                                                                                                
pragma solidity ^0.5.2;

                                                                                   
contract Token {
                             
    event TRANSFER230(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL719(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING

                                       
    function TRANSFER752(address to, uint value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM397(address from, address to, uint value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE985(address spender, uint value) public returns (bool);	//inject NONSTANDARD NAMING
    function BALANCEOF257(address owner) public view returns (uint);	//inject NONSTANDARD NAMING
    function ALLOWANCE112(address owner, address spender) public view returns (uint);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY101() public view returns (uint);	//inject NONSTANDARD NAMING
}

// File: @gnosis.pm/util-contracts/contracts/Math.sol

pragma solidity ^0.5.2;

                                                                                     
                                         
                                              
library GnosisMath {
                                
    // This is equal to 1 in our calculations
    uint public constant one137 = 0x10000000000000000;	//inject NONSTANDARD NAMING
    uint public constant ln2215 = 0xb17217f7d1cf79ac;	//inject NONSTANDARD NAMING
    uint public constant log2_e741 = 0x171547652b82fe177;	//inject NONSTANDARD NAMING

                                       
                                                                  
                  
                    
    function EXP220(int x) public pure returns (uint) {	//inject NONSTANDARD NAMING
        // revert if x is > MAX_POWER, where
        // MAX_POWER = int(mp.floor(mp.log(mpf(2**256 - 1) / ONE) * ONE))
        require(x <= 2454971259878909886679);
        // return 0 if exp(x) is tiny, using
        // MIN_POWER = int(mp.floor(mp.log(mpf(1) / ONE) * ONE))
        if (x < -818323753292969962227) return 0;
        // Transform so that e^x -> 2^x
        x = x * int(one137) / int(ln2215);
        // 2^x = 2^whole(x) * 2^frac(x)
        //       ^^^^^^^^^^ is a bit shift
        // so Taylor expand on z = frac(x)
        int shift;
        uint z;
        if (x >= 0) {
            shift = x / int(one137);
            z = uint(x % int(one137));
        } else {
            shift = x / int(one137) - 1;
            z = one137 - uint(-x % int(one137));
        }
        // 2^x = 1 + (ln 2) x + (ln 2)^2/2! x^2 + ...
        //
        // Can generate the z coefficients using mpmath and the following lines
        // >>> from mpmath import mp
        // >>> mp.dps = 100
        // >>> ONE =  0x10000000000000000
        // >>> print('\n'.join(hex(int(mp.log(2)**i / mp.factorial(i) * ONE)) for i in range(1, 7)))
        // 0xb17217f7d1cf79ab
        // 0x3d7f7bff058b1d50
        // 0xe35846b82505fc5
        // 0x276556df749cee5
        // 0x5761ff9e299cc4
        // 0xa184897c363c3
        uint zpow = z;
        uint result = one137;
        result += 0xb17217f7d1cf79ab * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x3d7f7bff058b1d50 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0xe35846b82505fc5 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x276556df749cee5 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x5761ff9e299cc4 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0xa184897c363c3 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0xffe5fe2c4586 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x162c0223a5c8 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x1b5253d395e * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x1e4cf5158b * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x1e8cac735 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x1c3bd650 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x1816193 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x131496 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0xe1b7 * zpow / one137;
        zpow = zpow * z / one137;
        result += 0x9c7 * zpow / one137;
        if (shift >= 0) {
            if (result >> (256 - shift) > 0) return (2 ** 256 - 1);
            return result << shift;
        } else return result >> (-shift);
    }

                                                       
                  
                     
    function LN512(uint x) public pure returns (int) {	//inject NONSTANDARD NAMING
        require(x > 0);
        // binary search for floor(log2(x))
        int ilog2 = FLOORLOG2711(x);
        int z;
        if (ilog2 < 0) z = int(x << uint(-ilog2));
        else z = int(x >> uint(ilog2));
        // z = x * 2^-1log1x1
        // so 1 <= z < 2
        // and ln z = ln x - 1log1x1/log1e
        // so just compute ln z using artanh series
        // and calculate ln x from that
        int term = (z - int(one137)) * int(one137) / (z + int(one137));
        int halflnz = term;
        int termpow = term * term / int(one137) * term / int(one137);
        halflnz += termpow / 3;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 5;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 7;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 9;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 11;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 13;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 15;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 17;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 19;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 21;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 23;
        termpow = termpow * term / int(one137) * term / int(one137);
        halflnz += termpow / 25;
        return (ilog2 * int(one137)) * int(one137) / int(log2_e741) + 2 * halflnz;
    }

                                                      
                  
                                 
    function FLOORLOG2711(uint x) public pure returns (int lo) {	//inject NONSTANDARD NAMING
        lo = -64;
        int hi = 193;
        // I use a shift here instead of / 2 because it floors instead of rounding towards 0
        int mid = (hi + lo) >> 1;
        while ((lo + 1) < hi) {
            if (mid < 0 && x << uint(-mid) < one137 || mid >= 0 && x >> uint(mid) < one137) hi = mid;
            else lo = mid;
            mid = (hi + lo) >> 1;
        }
    }

                                        
                                           
                              
    function MAX963(int[] memory nums) public pure returns (int maxNum) {	//inject NONSTANDARD NAMING
        require(nums.length > 0);
        maxNum = -2 ** 255;
        for (uint i = 0; i < nums.length; i++) if (nums[i] > maxNum) maxNum = nums[i];
    }

                                                                
                             
                              
                                      
    function SAFETOADD45(uint a, uint b) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return a + b >= a;
    }

                                                                        
                        
                           
                                       
    function SAFETOSUB889(uint a, uint b) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return a >= b;
    }

                                                                    
                             
                              
                                      
    function SAFETOMUL544(uint a, uint b) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return b == 0 || a * b / b == a;
    }

                                                
                             
                              
                   
    function ADD338(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(SAFETOADD45(a, b));
        return a + b;
    }

                                                       
                        
                           
                          
    function SUB565(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(SAFETOSUB889(a, b));
        return a - b;
    }

                                                    
                             
                              
                       
    function MUL669(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(SAFETOMUL544(a, b));
        return a * b;
    }

                                                                
                             
                              
                                      
    function SAFETOADD45(int a, int b) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return (b >= 0 && a + b >= a) || (b < 0 && a + b < a);
    }

                                                                        
                        
                           
                                       
    function SAFETOSUB889(int a, int b) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return (b >= 0 && a - b <= a) || (b < 0 && a - b > a);
    }

                                                                    
                             
                              
                                      
    function SAFETOMUL544(int a, int b) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return (b == 0) || (a * b / b == a);
    }

                                                
                             
                              
                   
    function ADD338(int a, int b) internal pure returns (int) {	//inject NONSTANDARD NAMING
        require(SAFETOADD45(a, b));
        return a + b;
    }

                                                       
                        
                           
                          
    function SUB565(int a, int b) internal pure returns (int) {	//inject NONSTANDARD NAMING
        require(SAFETOSUB889(a, b));
        return a - b;
    }

                                                    
                             
                              
                       
    function MUL669(int a, int b) internal pure returns (int) {	//inject NONSTANDARD NAMING
        require(SAFETOMUL544(a, b));
        return a * b;
    }
}

// File: @gnosis.pm/util-contracts/contracts/GnosisStandardToken.sol

pragma solidity ^0.5.2;




                                                     
contract StandardTokenData {
                              
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowances;
    uint totalTokens;
}

                                                     
                                                           
contract GnosisStandardToken is Token, StandardTokenData {
    using GnosisMath for *;

                                       
                                                                          
                                           
                                                 
                                        
    function TRANSFER752(address to, uint value) public returns (bool) {	//inject NONSTANDARD NAMING
        if (!balances[msg.sender].SAFETOSUB889(value) || !balances[to].SAFETOADD45(value)) {
            return false;
        }

        balances[msg.sender] -= value;
        balances[to] += value;
        emit TRANSFER230(msg.sender, to, value);
        return true;
    }

                                                                                                       
                                                           
                                                  
                                                 
                                        
    function TRANSFERFROM397(address from, address to, uint value) public returns (bool) {	//inject NONSTANDARD NAMING
        if (!balances[from].SAFETOSUB889(value) || !allowances[from][msg.sender].SAFETOSUB889(
            value
        ) || !balances[to].SAFETOADD45(value)) {
            return false;
        }
        balances[from] -= value;
        allowances[from][msg.sender] -= value;
        balances[to] += value;
        emit TRANSFER230(from, to, value);
        return true;
    }

                                                                        
                                                 
                                              
                                        
    function APPROVE985(address spender, uint value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowances[msg.sender][spender] = value;
        emit APPROVAL719(msg.sender, spender, value);
        return true;
    }

                                                               
                                           
                                               
                                               
    function ALLOWANCE112(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return allowances[owner][spender];
    }

                                                            
                                           
                                
    function BALANCEOF257(address owner) public view returns (uint) {	//inject NONSTANDARD NAMING
        return balances[owner];
    }

                                           
                            
    function TOTALSUPPLY101() public view returns (uint) {	//inject NONSTANDARD NAMING
        return totalTokens;
    }
}

// File: @gnosis.pm/dx-contracts/contracts/TokenFRT.sol

pragma solidity ^0.5.2;




                                                           
contract TokenFRT is Proxied, GnosisStandardToken {
    address public owner;

    string public constant symbol477 = "MGN";	//inject NONSTANDARD NAMING
    string public constant name169 = "Magnolia Token";	//inject NONSTANDARD NAMING
    uint8 public constant decimals697 = 18;	//inject NONSTANDARD NAMING

    struct UnlockedToken {
        uint amountUnlocked;
        uint withdrawalTime;
    }

                              
    address public minter;

    // user => UnlockedToken
    mapping(address => UnlockedToken) public unlockedTokens;

    // user => amount
    mapping(address => uint) public lockedTokenBalances;

                                       

    // @dev allows to set the minter of Magnolia tokens once.
    // @param   _minter the minter of the Magnolia tokens, should be the DX-proxy
    function UPDATEMINTER541(address _minter) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Only the minter can set a new one");
        require(_minter != address(0), "The new minter must be a valid address");

        minter = _minter;
    }

    // @dev the intention is to set the owner as the DX-proxy, once it is deployed
    // Then only an update of the DX-proxy contract after a 30 days delay could change the minter again.
    function UPDATEOWNER556(address _owner) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Only the owner can update the owner");
        require(_owner != address(0), "The new owner must be a valid address");
        owner = _owner;
    }

    function MINTTOKENS641(address user, uint amount) public {	//inject NONSTANDARD NAMING
        require(msg.sender == minter, "Only the minter can mint tokens");

        lockedTokenBalances[user] = ADD338(lockedTokenBalances[user], amount);
        totalTokens = ADD338(totalTokens, amount);
    }

                       
    function LOCKTOKENS826(uint amount) public returns (uint totalAmountLocked) {	//inject NONSTANDARD NAMING
        // Adjust amount by balance
        uint actualAmount = MIN603(amount, balances[msg.sender]);

        // Update state variables
        balances[msg.sender] = SUB565(balances[msg.sender], actualAmount);
        lockedTokenBalances[msg.sender] = ADD338(lockedTokenBalances[msg.sender], actualAmount);

        // Get return variable
        totalAmountLocked = lockedTokenBalances[msg.sender];
    }

    function UNLOCKTOKENS56() public returns (uint totalAmountUnlocked, uint withdrawalTime) {	//inject NONSTANDARD NAMING
        // Adjust amount by locked balances
        uint amount = lockedTokenBalances[msg.sender];

        if (amount > 0) {
            // Update state variables
            lockedTokenBalances[msg.sender] = SUB565(lockedTokenBalances[msg.sender], amount);
            unlockedTokens[msg.sender].amountUnlocked = ADD338(unlockedTokens[msg.sender].amountUnlocked, amount);
            unlockedTokens[msg.sender].withdrawalTime = now + 24 hours;
        }

        // Get return variables
        totalAmountUnlocked = unlockedTokens[msg.sender].amountUnlocked;
        withdrawalTime = unlockedTokens[msg.sender].withdrawalTime;
    }

    function WITHDRAWUNLOCKEDTOKENS883() public {	//inject NONSTANDARD NAMING
        require(unlockedTokens[msg.sender].withdrawalTime < now, "The tokens cannot be withdrawn yet");
        balances[msg.sender] = ADD338(balances[msg.sender], unlockedTokens[msg.sender].amountUnlocked);
        unlockedTokens[msg.sender].amountUnlocked = 0;
    }

    function MIN603(uint a, uint b) public pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a < b) {
            return a;
        } else {
            return b;
        }
    }
    
                                                                
                             
                              
                                      
    function SAFETOADD45(uint a, uint b) public pure returns (bool) {	//inject NONSTANDARD NAMING
        return a + b >= a;
    }

                                                                        
                        
                           
                                       
    function SAFETOSUB889(uint a, uint b) public pure returns (bool) {	//inject NONSTANDARD NAMING
        return a >= b;
    }

                                                
                             
                              
                   
    function ADD338(uint a, uint b) public pure returns (uint) {	//inject NONSTANDARD NAMING
        require(SAFETOADD45(a, b), "It must be a safe adition");
        return a + b;
    }

                                                       
                        
                           
                          
    function SUB565(uint a, uint b) public pure returns (uint) {	//inject NONSTANDARD NAMING
        require(SAFETOSUB889(a, b), "It must be a safe substraction");
        return a - b;
    }
}

// File: openzeppelin-solidity/contracts/utils/Address.sol

pragma solidity ^0.5.2;

                                                           
library Address {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT514(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

// File: @daostack/arc/contracts/libs/SafeERC20.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
pragma solidity ^0.5.2;



library SafeERC20 {
    using Address for address;

    bytes4 constant private transfer_selector233 = bytes4(keccak256(bytes("transfer(address,uint256)")));	//inject NONSTANDARD NAMING
    bytes4 constant private transferfrom_selector970 = bytes4(keccak256(bytes("transferFrom(address,address,uint256)")));	//inject NONSTANDARD NAMING
    bytes4 constant private approve_selector235 = bytes4(keccak256(bytes("approve(address,uint256)")));	//inject NONSTANDARD NAMING

    function SAFETRANSFER151(address _erc20Addr, address _to, uint256 _value) internal {	//inject NONSTANDARD NAMING

        // Must be a contract addr first!
        require(_erc20Addr.ISCONTRACT514());

        (bool success, bytes memory returnValue) =
        // solhint-disable-next-line avoid-low-level-calls
        _erc20Addr.call(abi.encodeWithSelector(transfer_selector233, _to, _value));
        // call return false when something wrong
        require(success);
        //check return value
        require(returnValue.length == 0 || (returnValue.length == 32 && (returnValue[31] != 0)));
    }

    function SAFETRANSFERFROM82(address _erc20Addr, address _from, address _to, uint256 _value) internal {	//inject NONSTANDARD NAMING

        // Must be a contract addr first!
        require(_erc20Addr.ISCONTRACT514());

        (bool success, bytes memory returnValue) =
        // solhint-disable-next-line avoid-low-level-calls
        _erc20Addr.call(abi.encodeWithSelector(transferfrom_selector970, _from, _to, _value));
        // call return false when something wrong
        require(success);
        //check return value
        require(returnValue.length == 0 || (returnValue.length == 32 && (returnValue[31] != 0)));
    }

    function SAFEAPPROVE603(address _erc20Addr, address _spender, uint256 _value) internal {	//inject NONSTANDARD NAMING

        // Must be a contract addr first!
        require(_erc20Addr.ISCONTRACT514());

        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero.
        require((_value == 0) || (IERC20(_erc20Addr).ALLOWANCE112(msg.sender, _spender) == 0));

        (bool success, bytes memory returnValue) =
        // solhint-disable-next-line avoid-low-level-calls
        _erc20Addr.call(abi.encodeWithSelector(approve_selector235, _spender, _value));
        // call return false when something wrong
        require(success);
        //check return value
        require(returnValue.length == 0 || (returnValue.length == 32 && (returnValue[31] != 0)));
    }
}

// File: contracts/DxMgnPool.sol

pragma solidity ^0.5.0;








contract DxMgnPool is Ownable {
    using SafeMath for uint;

    uint constant owl_allowance506 = 10**36; 	//inject NONSTANDARD NAMING
    struct Participation {
        uint startAuctionCount; // how many auction passed when this participation started contributing
        uint poolShares; // number of shares this participation accounts for (absolute)
    }
    mapping (address => bool) public hasParticpationWithdrawn;
    enum State {
        Pooling,
        PoolingEnded,
        DepositWithdrawnFromDx,
        MgnUnlocked
    }
    State public currentState = State.Pooling;

    mapping (address => Participation[]) public participationsByAddress;
    uint public totalPoolShares; // total number of shares in this pool
    uint public totalPoolSharesCummulative; // over all auctions, the rolling sum of all shares participated
    uint public totalDeposit;
    uint public totalMgn;
    uint public lastParticipatedAuctionIndex;
    uint public auctionCount;
    
    ERC20 public depositToken;
    ERC20 public secondaryToken;
    TokenFRT public mgnToken;
    IDutchExchange public dx;

    uint public poolingPeriodEndTime;

    constructor (
        ERC20 _depositToken, 
        ERC20 _secondaryToken, 
        IDutchExchange _dx,
        uint _poolingTimeSeconds
    ) public Ownable()
    {
        depositToken = _depositToken;
        secondaryToken = _secondaryToken;
        dx = _dx;
        mgnToken = TokenFRT(dx.FRTTOKEN483());
        ERC20(dx.OWLTOKEN441()).APPROVE985(address(dx), owl_allowance506);
        poolingPeriodEndTime = now + _poolingTimeSeconds;
    }

                                       
    function DEPOSIT20(uint amount) public {	//inject NONSTANDARD NAMING
        CHECKFORSTATEUPDATE952();
        require(currentState == State.Pooling, "Pooling is already over");

        uint poolShares = CALCULATEPOOLSHARES436(amount);
        Participation memory participation = Participation({
            startAuctionCount: ISDEPOSITTOKENTURN827() ? auctionCount : auctionCount + 1,
            poolShares: poolShares
            });
        participationsByAddress[msg.sender].push(participation);
        totalPoolShares += poolShares;
        totalDeposit += amount;

        SafeERC20.SAFETRANSFERFROM82(address(depositToken), msg.sender, address(this), amount);
    }

    function WITHDRAWDEPOSIT816() public returns(uint) {	//inject NONSTANDARD NAMING
        require(currentState == State.DepositWithdrawnFromDx || currentState == State.MgnUnlocked, "Funds not yet withdrawn from dx");
        require(!hasParticpationWithdrawn[msg.sender],"sender has already withdrawn funds");

        uint totalDepositAmount = 0;
        Participation[] storage participations = participationsByAddress[msg.sender];
        uint length = participations.length;
        for (uint i = 0; i < length; i++) {
            totalDepositAmount += CALCULATECLAIMABLEDEPOSIT515(participations[i]);
        }
        hasParticpationWithdrawn[msg.sender] = true;
        SafeERC20.SAFETRANSFER151(address(depositToken), msg.sender, totalDepositAmount);
        return totalDepositAmount;
    }

    function WITHDRAWMAGNOLIA130() public returns(uint) {	//inject NONSTANDARD NAMING
        require(currentState == State.MgnUnlocked, "MGN has not been unlocked, yet");
        require(hasParticpationWithdrawn[msg.sender], "Withdraw deposits first");
        
        uint totalMgnClaimed = 0;
        Participation[] memory participations = participationsByAddress[msg.sender];
        for (uint i = 0; i < participations.length; i++) {
            totalMgnClaimed += CALCULATECLAIMABLEMGN73(participations[i]);
        }
        delete participationsByAddress[msg.sender];
        delete hasParticpationWithdrawn[msg.sender];
        SafeERC20.SAFETRANSFER151(address(mgnToken), msg.sender, totalMgnClaimed);
        return totalMgnClaimed;
    }

    function WITHDRAWDEPOSITANDMAGNOLIA140() public returns(uint, uint){ 	//inject NONSTANDARD NAMING
        return (WITHDRAWDEPOSIT816(),WITHDRAWMAGNOLIA130());
    }

    function PARTICIPATEINAUCTION234() public  ONLYOWNER972() {	//inject NONSTANDARD NAMING
        CHECKFORSTATEUPDATE952();
        require(currentState == State.Pooling, "Pooling period is over.");

        uint auctionIndex = dx.GETAUCTIONINDEX161(address(depositToken), address(secondaryToken));
        require(auctionIndex > lastParticipatedAuctionIndex, "Has to wait for new auction to start");

        (address sellToken, address buyToken) = SELLANDBUYTOKEN977();
        uint depositAmount = depositToken.BALANCEOF257(address(this));
        if (ISDEPOSITTOKENTURN827()) {
            totalPoolSharesCummulative += 2 * totalPoolShares;
            if( depositAmount > 0){
                //depositing new tokens
                depositToken.APPROVE985(address(dx), depositAmount);
                dx.DEPOSIT20(address(depositToken), depositAmount);
            }
        }
        // Don't revert if we can't claimSellerFunds
        address(dx).call(abi.encodeWithSignature("claimSellerFunds(address,address,address,uint256)", buyToken, sellToken, address(this), lastParticipatedAuctionIndex));

        uint amount = dx.balances(address(sellToken), address(this));
        if (ISDEPOSITTOKENTURN827()) {
            totalDeposit = amount;
        }

        (lastParticipatedAuctionIndex, ) = dx.POSTSELLORDER389(sellToken, buyToken, 0, amount);
        auctionCount += 1;
    }

    function TRIGGERMGNUNLOCKANDCLAIMTOKENS512() public {	//inject NONSTANDARD NAMING
        CHECKFORSTATEUPDATE952();
        require(currentState == State.PoolingEnded, "Pooling period is not yet over.");
        require(
            dx.GETAUCTIONINDEX161(address(depositToken), address(secondaryToken)) > lastParticipatedAuctionIndex, 
            "Last auction is still running"
        );      
        
        // Don't revert if wen can't claimSellerFunds
        address(dx).call(abi.encodeWithSignature("claimSellerFunds(address,address,address,uint256)", secondaryToken, depositToken, address(this), lastParticipatedAuctionIndex));
        mgnToken.UNLOCKTOKENS56();

        uint amountOfFundsInDX = dx.balances(address(depositToken), address(this));
        totalDeposit = amountOfFundsInDX + depositToken.BALANCEOF257(address(this));
        if(amountOfFundsInDX > 0){
            dx.WITHDRAW452(address(depositToken), amountOfFundsInDX);
        }
        currentState = State.DepositWithdrawnFromDx;
    }

    function WITHDRAWUNLOCKEDMAGNOLIAFROMDX940() public {	//inject NONSTANDARD NAMING
        require(currentState == State.DepositWithdrawnFromDx, "Unlocking not yet triggered");

        // Implicitly we also have:
        // require(unlockedTokens[msg.sender].withdrawalTime < now, "The tokens cannot be withdrawn yet");

        mgnToken.WITHDRAWUNLOCKEDTOKENS883();
        totalMgn = mgnToken.BALANCEOF257(address(this));

        currentState = State.MgnUnlocked;
    }

    function CHECKFORSTATEUPDATE952() public {	//inject NONSTANDARD NAMING
        if (now >= poolingPeriodEndTime && ISDEPOSITTOKENTURN827() && currentState == State.Pooling) {
            currentState = State.PoolingEnded;
        }
    }

                                          
    function UPDATEANDGETCURRENTSTATE168() public returns(State) {	//inject NONSTANDARD NAMING
        CHECKFORSTATEUPDATE952();

        return currentState;
    }

                                            
     
    function NUMBEROFPARTICIPATIONS940(address addr) public view returns (uint) {	//inject NONSTANDARD NAMING
        return participationsByAddress[addr].length;
    }

    function PARTICIPATIONATINDEX72(address addr, uint index) public view returns (uint, uint) {	//inject NONSTANDARD NAMING
        Participation memory participation = participationsByAddress[addr][index];
        return (participation.startAuctionCount, participation.poolShares);
    }

    function POOLSHARESBYADDRESS945(address userAddress) external view returns(uint[] memory) {	//inject NONSTANDARD NAMING
        uint length = participationsByAddress[userAddress].length;        
        uint[] memory userTotalPoolShares = new uint[](length);
        
        for (uint i = 0; i < length; i++) {
            userTotalPoolShares[i] = participationsByAddress[userAddress][i].poolShares;
        }

        return userTotalPoolShares;
    }

    function SELLANDBUYTOKEN977() public view returns(address sellToken, address buyToken) {	//inject NONSTANDARD NAMING
        if (ISDEPOSITTOKENTURN827()) {
            return (address(depositToken), address(secondaryToken));
        } else {
            return (address(secondaryToken), address(depositToken)); 
        }
    }

    function GETALLCLAIMABLEMGNANDDEPOSITS533(address userAddress) external view returns(uint[] memory, uint[] memory) {	//inject NONSTANDARD NAMING
        uint length = participationsByAddress[userAddress].length;

        uint[] memory allUserClaimableMgn = new uint[](length);
        uint[] memory allUserClaimableDeposit = new uint[](length);

        for (uint i = 0; i < length; i++) {
            allUserClaimableMgn[i] = CALCULATECLAIMABLEMGN73(participationsByAddress[userAddress][i]);
            allUserClaimableDeposit[i] = CALCULATECLAIMABLEDEPOSIT515(participationsByAddress[userAddress][i]);
        }
        return (allUserClaimableMgn, allUserClaimableDeposit);
    }

                                       
    
    function CALCULATEPOOLSHARES436(uint amount) private view returns (uint) {	//inject NONSTANDARD NAMING
        if (totalDeposit == 0) {
            return amount;
        } else {
            return totalPoolShares.MUL669(amount) / totalDeposit;
        }
    }
    
    function ISDEPOSITTOKENTURN827() private view returns (bool) {	//inject NONSTANDARD NAMING
        return auctionCount % 2 == 0;
    }

    function CALCULATECLAIMABLEMGN73(Participation memory participation) private view returns (uint) {	//inject NONSTANDARD NAMING
        if (totalPoolSharesCummulative == 0) {
            return 0;
        }
        uint duration = auctionCount - participation.startAuctionCount;
        return totalMgn.MUL669(participation.poolShares).MUL669(duration) / totalPoolSharesCummulative;
    }

    function CALCULATECLAIMABLEDEPOSIT515(Participation memory participation) private view returns (uint) {	//inject NONSTANDARD NAMING
        if (totalPoolShares == 0) {
            return 0;
        }
        return totalDeposit.MUL669(participation.poolShares) / totalPoolShares;
    }
}

// File: contracts/Coordinator.sol

pragma solidity ^0.5.0;

contract Coordinator {

    DxMgnPool public dxMgnPool1;
    DxMgnPool public dxMgnPool2;

    constructor (
        ERC20 _token1, 
        ERC20 _token2, 
        IDutchExchange _dx,
        uint _poolingTime
    ) public {
        dxMgnPool1 = new DxMgnPool(_token1, _token2, _dx, _poolingTime);
        dxMgnPool2 = new DxMgnPool(_token2, _token1, _dx, _poolingTime);
    }

    function PARTICIPATEINAUCTION234() public {	//inject NONSTANDARD NAMING
        dxMgnPool1.PARTICIPATEINAUCTION234();
        dxMgnPool2.PARTICIPATEINAUCTION234();
    }

    function CANPARTICIPATE782() public returns (bool) {	//inject NONSTANDARD NAMING
        uint auctionIndex = dxMgnPool1.dx().GETAUCTIONINDEX161(
            address(dxMgnPool1.depositToken()),
            address(dxMgnPool1.secondaryToken())
        );
        // update the state before checking the currentState
        dxMgnPool1.CHECKFORSTATEUPDATE952();
        // Since both auctions start at the same time, it suffices to check one.
        return auctionIndex > dxMgnPool1.lastParticipatedAuctionIndex() && dxMgnPool1.currentState() == DxMgnPool.State.Pooling;
    }

}