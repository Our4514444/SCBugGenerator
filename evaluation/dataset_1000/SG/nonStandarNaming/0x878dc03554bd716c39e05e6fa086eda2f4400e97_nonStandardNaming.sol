                                                                 

pragma solidity 0.5.17;


interface DharmaGasReserveInterface {
    event PULLED19(address indexed gasAccount, uint256 amount);	//inject NONSTANDARD NAMING

    function PULLGAS19() external;	//inject NONSTANDARD NAMING

    function ADDGASACCOUNT745(address gasAccount) external;	//inject NONSTANDARD NAMING
    function REMOVEGASACCOUNT760(address gasAccount) external;	//inject NONSTANDARD NAMING
    function SETPULLAMOUNT419(uint256 amount) external;	//inject NONSTANDARD NAMING
    function SETRATELIMIT301(uint256 interval) external;	//inject NONSTANDARD NAMING
    function CALLANY485(	//inject NONSTANDARD NAMING
        address payable target, uint256 amount, bytes calldata data
    ) external returns (bool ok, bytes memory returnData);

    function GETGASACCOUNTS20() external view returns (address[] memory);	//inject NONSTANDARD NAMING
    function GETPULLAMOUNT531() external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETRATELIMIT426() external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETLASTPULLTIME320(address gasAccount) external view returns (uint256);	//inject NONSTANDARD NAMING
}


contract TwoStepOwnable {
  address private _owner;

  address private _newPotentialOwner;

  event OWNERSHIPTRANSFERRED837(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );

                                                                                            
  constructor() internal {
    _owner = tx.origin;
    emit OWNERSHIPTRANSFERRED837(address(0), _owner);
  }

                                                               
  function OWNER517() public view returns (address) {	//inject NONSTANDARD NAMING
    return _owner;
  }

                                                                           
  modifier ONLYOWNER843() {	//inject NONSTANDARD NAMING
    require(ISOWNER396(), "TwoStepOwnable: caller is not the owner.");
    _;
  }

                                                                      
  function ISOWNER396() public view returns (bool) {	//inject NONSTANDARD NAMING
    return msg.sender == _owner;
  }

                                                                                                                          
  function TRANSFEROWNERSHIP646(address newOwner) public ONLYOWNER843 {	//inject NONSTANDARD NAMING
    require(
      newOwner != address(0),
      "TwoStepOwnable: new potential owner is the zero address."
    );

    _newPotentialOwner = newOwner;
  }

                                                                                                                    
  function CANCELOWNERSHIPTRANSFER505() public ONLYOWNER843 {	//inject NONSTANDARD NAMING
    delete _newPotentialOwner;
  }

                                                                                                                                                   
  function ACCEPTOWNERSHIP463() public {	//inject NONSTANDARD NAMING
    require(
      msg.sender == _newPotentialOwner,
      "TwoStepOwnable: current owner must set caller as new potential owner."
    );

    delete _newPotentialOwner;

    emit OWNERSHIPTRANSFERRED837(_owner, msg.sender);

    _owner = msg.sender;
  }
}


contract DharmaGasReserve is DharmaGasReserveInterface, TwoStepOwnable {
    // Track all authorized gas accounts.
    address[] private _gasAccounts;

    // Indexes start at 1, as 0 signifies non-inclusion
    mapping (address => uint256) private _gasAccountIndexes;
    
    mapping (address => uint256) private _lastPullTime;
    
    uint256 private _pullAmount;
    uint256 private _rateLimit;

    constructor(address[] memory initialGasAccounts) public {
        _pullAmount = 3 ether;
        _rateLimit = 1 hours;
        for (uint256 i; i < initialGasAccounts.length; i++) {
            address gasAccount = initialGasAccounts[i];
            _ADDGASACCOUNT613(gasAccount);
        }
    }

    function PULLGAS19() external {	//inject NONSTANDARD NAMING
        require(
            _gasAccountIndexes[msg.sender] != 0,
            "Only authorized gas accounts may pull from this contract."
        );

        require(
            now > _lastPullTime[msg.sender] + _rateLimit,
            "Gas account is currently rate-limited."
        );
        _lastPullTime[msg.sender] = now;

        uint256 pullAmount = _pullAmount;
        (bool ok, ) = msg.sender.call.value(pullAmount)("");
        if (!ok) {
            assembly {
                returndatacopy(0, 0, returndatasize)
                revert(0, returndatasize)
            }
        }

        emit PULLED19(msg.sender, pullAmount);
    }

    function ADDGASACCOUNT745(address gasAccount) external ONLYOWNER843 {	//inject NONSTANDARD NAMING
        _ADDGASACCOUNT613(gasAccount);
    }

    function REMOVEGASACCOUNT760(address gasAccount) external ONLYOWNER843 {	//inject NONSTANDARD NAMING
        uint256 removedGasAccountIndex = _gasAccountIndexes[gasAccount];
        require(
            removedGasAccountIndex != 0,
            "No gas account found matching the provided account."
        );

        // swap account to remove with the last one then pop from the array.
        address lastGasAccount = _gasAccounts[_gasAccounts.length - 1];
        _gasAccounts[removedGasAccountIndex - 1] = lastGasAccount;
        _gasAccountIndexes[lastGasAccount] = removedGasAccountIndex;
        _gasAccounts.pop();
        delete _gasAccountIndexes[gasAccount];
    }

    function SETPULLAMOUNT419(uint256 amount) external ONLYOWNER843 {	//inject NONSTANDARD NAMING
        _pullAmount = amount;
    }

    function SETRATELIMIT301(uint256 interval) external ONLYOWNER843 {	//inject NONSTANDARD NAMING
        _rateLimit = interval;
    }

    function CALLANY485(	//inject NONSTANDARD NAMING
        address payable target, uint256 amount, bytes calldata data
    ) external ONLYOWNER843 returns (bool ok, bytes memory returnData) {
        // Call the specified target and supply the specified data.
        (ok, returnData) = target.call.value(amount)(data);
    }

    function GETGASACCOUNTS20() external view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return _gasAccounts;
    }

    function GETPULLAMOUNT531() external view returns (uint256) {	//inject NONSTANDARD NAMING
        return  _pullAmount;
    }

    function GETRATELIMIT426() external view returns (uint256) {	//inject NONSTANDARD NAMING
        return _rateLimit;
    }

    function GETLASTPULLTIME320(address gasAccount) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return _lastPullTime[gasAccount];
    }

    function _ADDGASACCOUNT613(address gasAccount) internal {	//inject NONSTANDARD NAMING
        require(
            _gasAccountIndexes[gasAccount] == 0,
            "Gas account matching the provided account already exists."
        );
        _gasAccounts.push(gasAccount);
        _gasAccountIndexes[gasAccount] = _gasAccounts.length;
    }
}