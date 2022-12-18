pragma solidity 0.5.4;


                                                                                         
library SafeMath {

                                                               
  function MUL757(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
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

                                                                             
  function DIV861(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

                                                                                                           
  function SUB95(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

                                                         
  function ADD767(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = a + b;
    assert(c >= a);
    return c;
  }
}

                                                                                                                                                                                               

contract MultiOwnable {
    using SafeMath for uint8;

    struct CommitteeStatusPack{
                                                                                                            
        uint8 numOfOwners;
        uint8 numOfVotes;
        uint8 numOfMinOwners;
        bytes proposedFuncData;
    }
    CommitteeStatusPack public committeeStatus;

    address[] public ballot; // To make sure if it already was voted
    mapping(address => bool) public owner;

    event VOTE111(address indexed proposer, bytes indexed proposedFuncData);	//inject NONSTANDARD NAMING
    event PROPOSE639(address indexed proposer, bytes indexed proposedFuncData);	//inject NONSTANDARD NAMING
    event DISMISS797(address indexed proposer, bytes indexed proposedFuncData);	//inject NONSTANDARD NAMING
    event ADDEDOWNER894(address newOwner);	//inject NONSTANDARD NAMING
    event REMOVEDOWNER984(address removedOwner);	//inject NONSTANDARD NAMING
    event TRANSFEROWNERSHIP499(address from, address to);	//inject NONSTANDARD NAMING


                                                                                                                                                                                                                                                                                    
    constructor(address _coOwner1, address _coOwner2, address _coOwner3, address _coOwner4, address _coOwner5) internal {
        require(_coOwner1 != address(0x0) &&
                _coOwner2 != address(0x0) &&
                _coOwner3 != address(0x0) &&
                _coOwner4 != address(0x0) &&
                _coOwner5 != address(0x0));
        require(_coOwner1 != _coOwner2 &&
                _coOwner1 != _coOwner3 &&
                _coOwner1 != _coOwner4 &&
                _coOwner1 != _coOwner5 &&
                _coOwner2 != _coOwner3 &&
                _coOwner2 != _coOwner4 &&
                _coOwner2 != _coOwner5 &&
                _coOwner3 != _coOwner4 &&
                _coOwner3 != _coOwner5 &&
                _coOwner4 != _coOwner5); // SmartDec Recommendations
        owner[_coOwner1] = true;
        owner[_coOwner2] = true;
        owner[_coOwner3] = true;
        owner[_coOwner4] = true;
        owner[_coOwner5] = true;
        committeeStatus.numOfOwners = 5;
        committeeStatus.numOfMinOwners = 5;
        emit ADDEDOWNER894(_coOwner1);
        emit ADDEDOWNER894(_coOwner2);
        emit ADDEDOWNER894(_coOwner3);
        emit ADDEDOWNER894(_coOwner4);
        emit ADDEDOWNER894(_coOwner5);
    }


    modifier ONLYOWNER229() {	//inject NONSTANDARD NAMING
        require(owner[msg.sender]);
        _;
    }

                                                                                                                                                                                         
    modifier COMMITTEEAPPROVED425() {	//inject NONSTANDARD NAMING
                                                                              
      require( keccak256(committeeStatus.proposedFuncData) == keccak256(msg.data) ); // SmartDec Recommendations

                             
      require(committeeStatus.numOfVotes > committeeStatus.numOfOwners.DIV861(2));
      _;
      _DISMISS240(); //Once a commission-approved proposal is made, the proposal is initialized.
    }


                                                                                                                                                                  
    function PROPOSE529(bytes memory _targetFuncData) ONLYOWNER229 public {	//inject NONSTANDARD NAMING
                                                   
      require(committeeStatus.numOfVotes == 0);
      require(committeeStatus.proposedFuncData.length == 0);

                                                                  
      committeeStatus.proposedFuncData = _targetFuncData;
      emit PROPOSE639(msg.sender, _targetFuncData);
    }

                                                                                                                                                                   
    function DISMISS13() ONLYOWNER229 public {	//inject NONSTANDARD NAMING
      _DISMISS240();
    }

                                                                                                                                                                                                                                                                                                                                           

    function _DISMISS240() internal {	//inject NONSTANDARD NAMING
      emit DISMISS797(msg.sender, committeeStatus.proposedFuncData);
      committeeStatus.numOfVotes = 0;
      committeeStatus.proposedFuncData = "";
      delete ballot;
    }


                                                                                                                                                                                                                 

    function VOTE502() ONLYOWNER229 public {	//inject NONSTANDARD NAMING
      // Check duplicated voting list.
      uint length = ballot.length; // SmartDec Recommendations
      for(uint i=0; i<length; i++) // SmartDec Recommendations
        require(ballot[i] != msg.sender);

      //onlyOnwers can vote, if there's ongoing proposal.
      require( committeeStatus.proposedFuncData.length != 0 );

      //Check, if everyone voted.
      //require(committeeStatus.numOfOwners > committeeStatus.numOfVotes); // SmartDec Recommendations
      committeeStatus.numOfVotes++;
      ballot.push(msg.sender);
      emit VOTE111(msg.sender, committeeStatus.proposedFuncData);
    }


                                                                                                                                                                                                                     
    function TRANSFEROWNERSHIP605(address _newOwner) ONLYOWNER229 COMMITTEEAPPROVED425 public {	//inject NONSTANDARD NAMING
        require( _newOwner != address(0x0) ); // callisto recommendation
        require( owner[_newOwner] == false );
        owner[msg.sender] = false;
        owner[_newOwner] = true;
        emit TRANSFEROWNERSHIP499(msg.sender, _newOwner);
    }

                                                                                                                       
    function ADDOWNER750(address _newOwner) ONLYOWNER229 COMMITTEEAPPROVED425 public {	//inject NONSTANDARD NAMING
        require( _newOwner != address(0x0) );
        require( owner[_newOwner] != true );
        owner[_newOwner] = true;
        committeeStatus.numOfOwners++;
        emit ADDEDOWNER894(_newOwner);
    }

                                                                                                                            
    function REMOVEOWNER620(address _toRemove) ONLYOWNER229 COMMITTEEAPPROVED425 public {	//inject NONSTANDARD NAMING
        require( _toRemove != address(0x0) );
        require( owner[_toRemove] == true );
        require( committeeStatus.numOfOwners > committeeStatus.numOfMinOwners ); // must keep Number of Minimum Owners at least.
        owner[_toRemove] = false;
        committeeStatus.numOfOwners--;
        emit REMOVEDOWNER984(_toRemove);
    }
}

contract Pausable is MultiOwnable {
    event PAUSE219();	//inject NONSTANDARD NAMING
    event UNPAUSE162();	//inject NONSTANDARD NAMING

    bool internal paused;

    modifier WHENNOTPAUSED263() {	//inject NONSTANDARD NAMING
        require(!paused);
        _;
    }

    modifier WHENPAUSED445() {	//inject NONSTANDARD NAMING
        require(paused);
        _;
    }

    modifier NOREENTRANCY221() {	//inject NONSTANDARD NAMING
        require(!paused);
        paused = true;
        _;
        paused = false;
    }

                                                                                                                                                          
    function PAUSE214() public ONLYOWNER229 COMMITTEEAPPROVED425 WHENNOTPAUSED263 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE219();
    }

    function UNPAUSE12() public ONLYOWNER229 COMMITTEEAPPROVED425 WHENPAUSED445 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE162();
    }
}

                                                                          
contract RunningContractManager is Pausable {
    address public implementation; //SmartDec Recommendations

    event UPGRADED374(address indexed newContract);	//inject NONSTANDARD NAMING

    function UPGRADE982(address _newAddr) ONLYOWNER229 COMMITTEEAPPROVED425 external {	//inject NONSTANDARD NAMING
        require(implementation != _newAddr);
        implementation = _newAddr;
        emit UPGRADED374(_newAddr); // SmartDec Recommendations
    }

                                                                                                                                                    
}



                                                                       
contract TokenERC20 is RunningContractManager {
    using SafeMath for uint256;

    // Public variables of the token
    string public name;
    string public symbol;
    uint8 public decimals = 18;    // 18 decimals is the strongly suggested default, avoid changing it
    uint256 public totalSupply;

                                                 
    mapping (address => uint256) internal balances;
    mapping (address => mapping (address => uint256)) internal allowed;
    //mapping (address => bool) public frozenAccount; // SmartDec Recommendations
    mapping (address => uint256) public frozenExpired;

    //bool private initialized = false;
    bool private initialized; // SmartDec Recommendations

                                                                                                                                                                                                                                                                                                                                 


    // This generates a public event on the blockchain that will notify clients
    event TRANSFER585(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event LASTBALANCE627(address indexed account, uint256 value);	//inject NONSTANDARD NAMING

    // This notifies clients about the allowance of balance
    event APPROVAL967(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

    // This notifies clients about the amount burnt
    // event Burn(address indexed from, uint256 value); // callisto recommendation

    // This notifies clients about the freezing address
    //event FrozenFunds(address target, bool frozen); // callisto recommendation
    event FROZENFUNDS708(address target, uint256 expirationDate); // SmartDec Recommendations	//inject NONSTANDARD NAMING

                                                                                                                                             

    function INITTOKEN706(	//inject NONSTANDARD NAMING
        string memory _tokenName,
        string memory _tokenSymbol,
        uint256 _initialSupply,
        address _marketSaleManager,
        address _serviceOperationManager,
        address _dividendManager,
        address _incentiveManager,
        address _reserveFundManager
    ) internal ONLYOWNER229 COMMITTEEAPPROVED425 {
        require( initialized == false );
        require(_initialSupply > 0 && _initialSupply <= 2**uint256(184)); // [2019.03.05] Fixed for Mythril Vulerablity SWC ID:101 => _initialSupply <= 2^184 <= (2^256 / 10^18)

        name = _tokenName;                                       // Set the name for display purposes
        symbol = _tokenSymbol;                                   // Set the symbol for display purposes
        //totalSupply = convertToDecimalUnits(_initialSupply);     // Update total supply with the decimal amount

                                                                                                                                                                                                                                                                        

        // SmartDec Recommendations
        uint256 tempSupply = CONVERTTODECIMALUNITS623(_initialSupply);

        uint256 dividendBalance = tempSupply.DIV861(10);               // dividendBalance = 10%
        uint256 reserveFundBalance = dividendBalance;               // reserveFundBalance = 10%
        uint256 marketSaleBalance = tempSupply.DIV861(5);              // marketSaleBalance = 20%
        uint256 serviceOperationBalance = marketSaleBalance.MUL757(2); // serviceOperationBalance = 40%
        uint256 incentiveBalance = marketSaleBalance;               // incentiveBalance = 20%

        balances[_marketSaleManager] = marketSaleBalance;
        balances[_serviceOperationManager] = serviceOperationBalance;
        balances[_dividendManager] = dividendBalance;
        balances[_incentiveManager] = incentiveBalance;
        balances[_reserveFundManager] = reserveFundBalance;

        totalSupply = tempSupply;

        emit TRANSFER585(address(0), _marketSaleManager, marketSaleBalance);
        emit TRANSFER585(address(0), _serviceOperationManager, serviceOperationBalance);
        emit TRANSFER585(address(0), _dividendManager, dividendBalance);
        emit TRANSFER585(address(0), _incentiveManager, incentiveBalance);
        emit TRANSFER585(address(0), _reserveFundManager, reserveFundBalance);

        emit LASTBALANCE627(address(this), 0);
        emit LASTBALANCE627(_marketSaleManager, marketSaleBalance);
        emit LASTBALANCE627(_serviceOperationManager, serviceOperationBalance);
        emit LASTBALANCE627(_dividendManager, dividendBalance);
        emit LASTBALANCE627(_incentiveManager, incentiveBalance);
        emit LASTBALANCE627(_reserveFundManager, reserveFundBalance);

        assert( tempSupply ==
          marketSaleBalance.ADD767(serviceOperationBalance).
                            ADD767(dividendBalance).
                            ADD767(incentiveBalance).
                            ADD767(reserveFundBalance)
        );


        initialized = true;
    }


                                                                                                                                 
    function CONVERTTODECIMALUNITS623(uint256 _value) internal view returns (uint256 value) {	//inject NONSTANDARD NAMING
        value = _value.MUL757(10 ** uint256(decimals));
        return value;
    }

                                                                                                                                                                          
    function BALANCEOF997(address _account) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        balance = balances[_account];
        return balance;
    }

                                                                                                                                                                                                                                            
    function ALLOWANCE977(address _owner, address _spender) external view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        remaining = allowed[_owner][_spender];
        return remaining;
    }

                                                                             
    function _TRANSFER386(address _from, address _to, uint256 _value) internal {	//inject NONSTANDARD NAMING
        require(_to != address(0x0));                                            // Prevent transfer to 0x0 address.
        require(balances[_from] >= _value);                             // Check if the sender has enough
        if(frozenExpired[_from] != 0 ){                                 // Check if sender is frozen
            require(block.timestamp > frozenExpired[_from]);
            _UNFREEZEACCOUNT700(_from);
        }
        if(frozenExpired[_to] != 0 ){                                   // Check if recipient is frozen
            require(block.timestamp > frozenExpired[_to]);
            _UNFREEZEACCOUNT700(_to);
        }

        uint256 previousBalances = balances[_from].ADD767(balances[_to]);  // Save this for an assertion in the future

        balances[_from] = balances[_from].SUB95(_value);                  // Subtract from the sender
        balances[_to] = balances[_to].ADD767(_value);                      // Add the same to the recipient
        emit TRANSFER585(_from, _to, _value);
        emit LASTBALANCE627(_from, balances[_from]);
        emit LASTBALANCE627(_to, balances[_to]);

        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balances[_from] + balances[_to] == previousBalances);
    }

                                                                                                                                                                                                          
    function TRANSFER227(address _to, uint256 _value) public NOREENTRANCY221 returns (bool success) {	//inject NONSTANDARD NAMING
        _TRANSFER386(msg.sender, _to, _value);
        success = true;
        return success;
    }


                                                                                                                                                                                                                                                                      
    function TRANSFERFROM345(address _from, address _to, uint256 _value) public NOREENTRANCY221 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_value <= allowed[_from][msg.sender]);     // Check allowance
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB95(_value);
        _TRANSFER386(_from, _to, _value);
        success = true;
        return success;
    }

                                                                                                                                                                                             
    function _APPROVE870(address _spender, uint256 _value) internal returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL967(msg.sender, _spender, _value);
        success = true;
        return success;
    }

                                                                                                                                                                                                                                                            
    function APPROVE11(address _spender, uint256 _value) public NOREENTRANCY221 returns (bool success) {	//inject NONSTANDARD NAMING
        success = _APPROVE870(_spender, _value);
        return success;
    }


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function INCREASEAPPROVAL589(address _spender, uint256 _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
      allowed[msg.sender][_spender] = (
        allowed[msg.sender][_spender].ADD767(_addedValue));
      emit APPROVAL967(msg.sender, _spender, allowed[msg.sender][_spender]);
      return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function DECREASEAPPROVAL357(address _spender, uint256 _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
      uint256 oldValue = allowed[msg.sender][_spender];
      if (_subtractedValue >= oldValue) {
        allowed[msg.sender][_spender] = 0;
      } else {
        allowed[msg.sender][_spender] = oldValue.SUB95(_subtractedValue);
      }
      emit APPROVAL967(msg.sender, _spender, allowed[msg.sender][_spender]);
      return true;
    }




                                                                          
                                          
    function FREEZEACCOUNT968(address target, uint256 freezeExpiration) ONLYOWNER229 COMMITTEEAPPROVED425 public {	//inject NONSTANDARD NAMING
        frozenExpired[target] = freezeExpiration;
        //emit FrozenFunds(target, true);
        emit FROZENFUNDS708(target, freezeExpiration); // SmartDec Recommendations
    }

                                                                         
                                                                                                                                               
                                                                    
                                            
    function _UNFREEZEACCOUNT700(address target) internal returns (bool success) {	//inject NONSTANDARD NAMING
        frozenExpired[target] = 0;
        //emit FrozenFunds(target, false);
        emit FROZENFUNDS708(target, 0); // SmartDec Recommendations
        success = true;
        return success;
    }

                                                  
                                            
    function UNFREEZEACCOUNT228(address target) ONLYOWNER229 COMMITTEEAPPROVED425 public returns(bool success) {	//inject NONSTANDARD NAMING
        success = _UNFREEZEACCOUNT700(target);
        return success;
    }

}


                                                                                                                                                                  

contract TokenExchanger is TokenERC20{
  using SafeMath for uint256;

    uint256 internal tokenPerEth;
    bool public opened;

    event EXCHANGEETHERTOTOKEN342(address indexed from, uint256 etherValue, uint256 tokenPerEth);	//inject NONSTANDARD NAMING
    event EXCHANGETOKENTOETHER586(address indexed from, uint256 etherValue, uint256 tokenPerEth);	//inject NONSTANDARD NAMING
    event WITHDRAWTOKEN489(address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event WITHDRAWETHER165(address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event SETEXCHANGERATE210(address indexed from, uint256 tokenPerEth);	//inject NONSTANDARD NAMING


    constructor(address _coOwner1,
                address _coOwner2,
                address _coOwner3,
                address _coOwner4,
                address _coOwner5)
        MultiOwnable( _coOwner1, _coOwner2, _coOwner3, _coOwner4, _coOwner5) public { opened = true; }

                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function INITEXCHANGER638(	//inject NONSTANDARD NAMING
        string calldata _tokenName,
        string calldata _tokenSymbol,
        uint256 _initialSupply,
        uint256 _tokenPerEth,
        address _marketSaleManager,
        address _serviceOperationManager,
        address _dividendManager,
        address _incentiveManager,
        address _reserveFundManager
    ) external ONLYOWNER229 COMMITTEEAPPROVED425 {
        require(opened);
        //require(_tokenPerEth > 0 && _initialSupply > 0);  // [2019.03.05] Fixed for Mythril Vulerablity SWC ID:101
        require(_tokenPerEth > 0); // SmartDec Recommendations
        require(_marketSaleManager != address(0) &&
                _serviceOperationManager != address(0) &&
                _dividendManager != address(0) &&
                _incentiveManager != address(0) &&
                _reserveFundManager != address(0));
        require(_marketSaleManager != _serviceOperationManager &&
                _marketSaleManager != _dividendManager &&
                _marketSaleManager != _incentiveManager &&
                _marketSaleManager != _reserveFundManager &&
                _serviceOperationManager != _dividendManager &&
                _serviceOperationManager != _incentiveManager &&
                _serviceOperationManager != _reserveFundManager &&
                _dividendManager != _incentiveManager &&
                _dividendManager != _reserveFundManager &&
                _incentiveManager != _reserveFundManager); // SmartDec Recommendations

        super.INITTOKEN706(_tokenName, _tokenSymbol, _initialSupply,
          // SmartDec Recommendations
          _marketSaleManager,
          _serviceOperationManager,
          _dividendManager,
          _incentiveManager,
          _reserveFundManager
        );
        tokenPerEth = _tokenPerEth;
        emit SETEXCHANGERATE210(msg.sender, tokenPerEth);
    }


                                                                                                                                                                                                                             
    function SETEXCHANGERATE197(uint256 _tokenPerEth) ONLYOWNER229 COMMITTEEAPPROVED425 external returns (bool success){	//inject NONSTANDARD NAMING
        require(opened);
        require( _tokenPerEth > 0);
        tokenPerEth = _tokenPerEth;
        emit SETEXCHANGERATE210(msg.sender, tokenPerEth);

        success = true;
        return success;
    }

    function GETEXCHANGERRATE811() external view returns(uint256){	//inject NONSTANDARD NAMING
        return tokenPerEth;
    }

                                                                                                                                                                   
    function EXCHANGEETHERTOTOKEN81() payable external NOREENTRANCY221 returns (bool success){	//inject NONSTANDARD NAMING
        require(opened);
        uint256 tokenPayment;
        uint256 ethAmount = msg.value;

        require(ethAmount > 0);
        require(tokenPerEth != 0);
        tokenPayment = ethAmount.MUL757(tokenPerEth);

        super._TRANSFER386(address(this), msg.sender, tokenPayment);

        emit EXCHANGEETHERTOTOKEN342(msg.sender, msg.value, tokenPerEth);

        success = true;
        return success;
    }

                                                                                                                                                                                                                     
    function EXCHANGETOKENTOETHER417(uint256 _value) external NOREENTRANCY221 returns (bool success){	//inject NONSTANDARD NAMING
      require(opened);
      require(tokenPerEth != 0);

      uint256 remainingEthBalance = address(this).balance;
      uint256 etherPayment = _value.DIV861(tokenPerEth);
      uint256 remainder = _value % tokenPerEth; // [2019.03.06 Fixing Securify vulnerabilities-Division influences Transfer Amount]
      require(remainingEthBalance >= etherPayment);

      uint256 tokenAmount = _value.SUB95(remainder); // [2019.03.06 Fixing Securify vulnerabilities-Division influences Transfer Amount]
      super._TRANSFER386(msg.sender, address(this), tokenAmount); // [2019.03.06 Fixing Securify vulnerabilities-Division influences Transfer Amount]
      //require(address(msg.sender).send(etherPayment));
      address(msg.sender).transfer(etherPayment); // SmartDec Recommendations

      emit EXCHANGETOKENTOETHER586(address(this), etherPayment, tokenPerEth);
      success = true;
      return success;
    }

                                                                                                                                                                                                                                                           
    function WITHDRAWTOKEN667(address _recipient, uint256 _value) ONLYOWNER229 COMMITTEEAPPROVED425 NOREENTRANCY221 public {	//inject NONSTANDARD NAMING
      //require(opened);
      super._TRANSFER386(address(this) ,_recipient, _value);
      emit WITHDRAWTOKEN489(_recipient, _value);
    }


                                                                                                                                                                                                                                                           
    function WITHDRAWETHER284(address payable _recipient, uint256 _value) ONLYOWNER229 COMMITTEEAPPROVED425 NOREENTRANCY221 public {	//inject NONSTANDARD NAMING
        //require(opened);
        //require(_recipient.send(_value));
        _recipient.transfer(_value); // SmartDec Recommendations
        emit WITHDRAWETHER165(_recipient, _value);
    }

                                                                                                                                                                                                                     
    function CLOSEEXCHANGER500() ONLYOWNER229 COMMITTEEAPPROVED425 external {	//inject NONSTANDARD NAMING
        opened = false;
    }
}


                                                                                                                                                                                                                           

contract NemodaxStorage is RunningContractManager {

    // Never ever change the order of variables below!!!!
    // Public variables of the token
    string public name;
    string public symbol;
    uint8 public decimals = 18;    // 18 decimals is the strongly suggested default, avoid changing it
    uint256 public totalSupply;

                                                 
    mapping (address => uint256) internal balances;
    mapping (address => mapping (address => uint256)) internal allowed;
    mapping (address => uint256) public frozenExpired; // SmartDec Recommendations

    bool private initialized;

    uint256 internal tokenPerEth;
    bool public opened = true;
}

                                                                                                                                                                                                  

contract ProxyNemodax is NemodaxStorage {

                                                                                                          
    constructor(address _coOwner1,
                address _coOwner2,
                address _coOwner3,
                address _coOwner4,
                address _coOwner5)
        MultiOwnable( _coOwner1, _coOwner2, _coOwner3, _coOwner4, _coOwner5) public {}

    function () payable external {
        address localImpl = implementation;
        require(localImpl != address(0x0));

        assembly {
            let ptr := mload(0x40)

            switch calldatasize
            case 0 {  } // just to receive ethereum

            default{
                calldatacopy(ptr, 0, calldatasize)

                let result := delegatecall(gas, localImpl, ptr, calldatasize, 0, 0)
                let size := returndatasize
                returndatacopy(ptr, 0, size)
                switch result

                case 0 { revert(ptr, size) }
                default { return(ptr, size) }
            }
        }
    }
}