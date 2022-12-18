pragma solidity ^0.5.8;
// @notice SECURITY TOKEN CONTRACT
// @dev ERC-1404 with ERC-20 with ERC223 protection Token Standard Compliant
// @author Geoffrey Tipton at AEN
// ----------------------------------------------------------------------------
// Deployed by : Geoffrey Tipton
// Symbol      : SMPT
// Name        : Smart Pharma Token
// Total supply: 1,000,000,000
// Decimals    : 8
//
// (c) AENCOIN. The MIT Licence.
// ----------------------------------------------------------------------------
// THE SMPT TOKENS HAVE NOT BEEN REGISTERED UNDER THE U.S. SECURITIES ACT OF
// 1933, AS AMENDED (THE11SECURITIES ACT1).  THE SMPT TOKENS WERE ISSUED IN
// A TRANSACTION EXEMPT FROM THE REGISTRATION REQUIREMENTS OF THE SECURITIES
// ACT PURSUANT TO REGULATION S PROMULGATED UNDER IT.  THE SMPT TOKENS MAY NOT
// BE OFFERED OR SOLD IN THE UNITED STATES UNLESS REGISTERED UNDER THE SECURITIES
// ACT OR AN EXEMPTION FROM REGISTRATION IS AVAILABLE.  TRANSFERS OF THE SMPT
// TOKENS MAY NOT BE MADE EXCEPT IN ACCORDANCE WITH THE PROVISIONS OF REGULATION S,
// PURSUANT TO REGISTRATION UNDER THE SECURITIES ACT, OR PURSUANT TO AN AVAILABLE
// EXEMPTION FROM REGISTRATION.  FURTHER, HEDGING TRANSACTIONS WITH REGARD TO THE
// SMPT TOKENS MAY NOT BE CONDUCTED UNLESS IN COMPLIANCE WITH THE SECURITIES ACT.
// ----------------------------------------------------------------------------
library SafeMath {
    function ADD530(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b; require(c >= a,"Can not add Negative Values"); }
    function SUB390(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a, "Result can not be negative"); c = a - b;  }
    function MUL380(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b; require(a == 0 || c / a == b,"Dived by Zero protection"); }
    function DIV577(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0,"Devide by Zero protection"); c = a / b; }
}

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function TOTALSUPPLY387() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF388(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE543(address owner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER909(address to, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE63(address spender, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM986(address from, address to, uint value) public returns (bool success);	//inject NONSTANDARD NAMING

    event TRANSFER765(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL300(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract ERC1404 is ERC20Interface {
    function DETECTTRANSFERRESTRICTION34 (address from, address to, uint256 value) public view returns (uint8);	//inject NONSTANDARD NAMING
    function MESSAGEFORTRANSFERRESTRICTION270 (uint8 restrictionCode) public view returns (string memory);	//inject NONSTANDARD NAMING
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address internal newOwner;

    event OWNERSHIPTRANSFERRED192(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

    constructor() public { //Only on contract creation
        owner = msg.sender;
    }

    modifier ONLYOWNER58 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Only the contract owner can execute this function");
        _;
    }

    function TRANSFEROWNERSHIP697(address _newOwner) external ONLYOWNER58 {	//inject NONSTANDARD NAMING
        newOwner = _newOwner;
    }

    function ACCEPTOWNERSHIP357() external {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner);
        emit OWNERSHIPTRANSFERRED192(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

contract Managed is Owned {
    mapping (address => bool) public managers;


    modifier ONLYMANAGER638 () {	//inject NONSTANDARD NAMING
        require(managers[msg.sender], "Only managers may perform this action");
        _;
    }

    function ADDMANAGER11 (address managerAddress) public ONLYOWNER58 {	//inject NONSTANDARD NAMING
        managers[managerAddress] = true;
    }

    function REMOVEMANAGER865 (address managerAddress) external ONLYOWNER58 {	//inject NONSTANDARD NAMING
        managers[managerAddress] = false;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Whitelist is Managed {
    mapping(address => bytes1) public whiteList;
    bytes1 internal listRule;
    bytes1 internal constant whitelisted_can_rx_code982 = 0x01;  // binary for 0001	//inject NONSTANDARD NAMING
    bytes1 internal constant whitelisted_can_tx_code459 = 0x02;  // binary for 0010	//inject NONSTANDARD NAMING
    bytes1 internal constant whitelisted_freeze_code528 = 0x04;  // binary for 0100	//inject NONSTANDARD NAMING

    function FROZEN470(address _account) public view returns (bool){ //If account is flagged to freeze return true	//inject NONSTANDARD NAMING
        return (whitelisted_freeze_code528 == (whiteList[_account] & whitelisted_freeze_code528)); // 10 & 11 = True
    }

    function ADDTOSENDALLOWED379(address _to) external ONLYMANAGER638 {	//inject NONSTANDARD NAMING
        whiteList[_to] = whiteList[_to] | whitelisted_can_tx_code459; // just add the code 1
    }

    function ADDTORECEIVEALLOWED347(address _to) external ONLYMANAGER638 {	//inject NONSTANDARD NAMING
        whiteList[_to] = whiteList[_to] | whitelisted_can_rx_code982; // just add the code 2
    }

    function REMOVEFROMSENDALLOWED789(address _to) public ONLYMANAGER638 {	//inject NONSTANDARD NAMING
        if (whitelisted_can_tx_code459 == (whiteList[_to] & whitelisted_can_tx_code459))  { //check code 4 so it does toggle when recalled
            whiteList[_to] = whiteList[_to] ^ whitelisted_can_tx_code459; // xor the code to remove the flag
        }
    }

    function REMOVEFROMRECEIVEALLOWED630(address _to) public ONLYMANAGER638 {	//inject NONSTANDARD NAMING
        if (whitelisted_can_rx_code982 == (whiteList[_to] & whitelisted_can_rx_code982))  {
            whiteList[_to] = whiteList[_to] ^ whitelisted_can_rx_code982;
        }
    }

    function REMOVEFROMBOTHSENDANDRECEIVEALLOWED99 (address _to) external ONLYMANAGER638 {	//inject NONSTANDARD NAMING
        REMOVEFROMSENDALLOWED789(_to);
        REMOVEFROMRECEIVEALLOWED630(_to);
    }

                                                                                                                                                       
    function FREEZE532(address _to) external ONLYOWNER58 {	//inject NONSTANDARD NAMING
        whiteList[_to] = whiteList[_to] | whitelisted_freeze_code528; // 4 [0100]
    }

    function UNFREEZE921(address _to) external ONLYOWNER58 {	//inject NONSTANDARD NAMING
        if (whitelisted_freeze_code528 == (whiteList[_to] & whitelisted_freeze_code528 )) { //Already UnFrozen
            whiteList[_to] = whiteList[_to] ^ whitelisted_freeze_code528; // 4 [0100]
        }
    }

                                                                                                                                                                                                                             
    function SETWHITELISTRULE632(byte _newRule) external ONLYOWNER58 {	//inject NONSTANDARD NAMING
        listRule = _newRule;
    }
    function GETWHITELISTRULE481() external view returns (byte){	//inject NONSTANDARD NAMING
        return listRule;
    }
}

// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and an initial fixed supply
contract SPTToken is ERC1404, Owned, Whitelist {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;
    uint8 internal restrictionCheck;

    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) allowed;


    // ------------------------------------------------------------------------
    // Constructor
    constructor() public {
        symbol = "SMPT";
        name = "Smart Pharma Token";
        decimals = 8;
        _totalSupply = 100000000000000000;
        balances[msg.sender] = _totalSupply;
        managers[msg.sender] = true;
        listRule = 0x00; //Receiver does not need to be whitelisted.
        emit TRANSFER765(address(0), msg.sender, _totalSupply);
    }

    modifier TRANSFERALLOWED666(address _from, address _to, uint256 _amount ) {	//inject NONSTANDARD NAMING
        require(!FROZEN470(_to) && !FROZEN470(_from), "One of the Accounts are Frozen");  //If not frozen go check
        if ((listRule & whitelisted_can_tx_code459) != 0) { // if whitelist send rul applies then must be set
            require(whitelisted_can_tx_code459 == (whiteList[_from] & whitelisted_can_tx_code459), "Sending Account is not whitelisted"); // 10 & 11 = true
        }
        if ((listRule & whitelisted_can_rx_code982) != 0) { //if whitelist to receive is required, then check,
            require(whitelisted_can_rx_code982 == (whiteList[_to] & whitelisted_can_rx_code982),"Receiving Account is not Whitelisted"); // 01 & 11 = True
        }
        _;
    }

    // ------------------------------------------------------------------------
    // Total supply minus any lost tokens to the zero address (Potential burn)
    function TOTALSUPPLY387() external view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply.SUB390(balances[address(0)]);
    }

    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    function BALANCEOF388(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return balances[owner];
    }

    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // function transfer(address _to, uint _tokens)  public receiveAllowed(_to)  returns (bool success) {
    function TRANSFER909(address _to, uint _value)  public TRANSFERALLOWED666(msg.sender, _to, _value) returns (bool) {	//inject NONSTANDARD NAMING
        require((_to != address(0)) && (_to != address(this))); // Do not allow transfer to 0x0 or the token contract itself
        balances[msg.sender] = balances[msg.sender].SUB390(_value);
        balances[_to] = balances[_to].ADD530(_value);
        emit TRANSFER765(msg.sender, _to, _value);
        return true;
    }

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    function APPROVE63(address spender, uint value) public TRANSFERALLOWED666(msg.sender, spender, value) returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = value;
        emit APPROVAL300(msg.sender, spender, value);
        return true;
    }

    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    function TRANSFERFROM986(address _from, address _to, uint _value) public TRANSFERALLOWED666(_from, _to, _value) returns (bool) {	//inject NONSTANDARD NAMING
        // function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        require((_to != address(0)) && (_to != address(this))); // Do not allow transfer to 0x0 or the token contract itself
        balances[_from] = balances[_from].SUB390(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB390(_value);
        balances[_to] = balances[_to].ADD530(_value);
        emit TRANSFER765(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                        
    function ALLOWANCE543(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return allowed[owner][spender];
    }

                                                                                                               
    function () payable external {
        revert();
    }

                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERANYERC20TOKEN582(address tokenAddress, uint tokens) public ONLYOWNER58 returns (bool success) {	//inject NONSTANDARD NAMING
        return ERC20Interface(tokenAddress).TRANSFER909(owner, tokens);
    }

                                                                                                                                                                                                                                                         
    function DETECTTRANSFERRESTRICTION34 (address _from, address _to, uint256 _value) public view returns (uint8 restrictionCode)	//inject NONSTANDARD NAMING
    {
        restrictionCode = 0; // No restrictions
        if ( whitelisted_can_tx_code459 == (listRule & whitelisted_can_tx_code459) ) { //Can Send rule applies
            if (!(whitelisted_can_tx_code459 == (whiteList[_to] & whitelisted_can_tx_code459)) ) { //True if allowed to send
                restrictionCode += 1; // Send is not allowed
            }
        }
        if (whitelisted_can_rx_code982 == (listRule & whitelisted_can_rx_code982)){ // Can Receive Rule applied
            if (!(whitelisted_can_rx_code982 == (whiteList[_from] & whitelisted_can_rx_code982))) {
                restrictionCode += 2; // Receive is not allowed
            }
        }
        if ((whitelisted_freeze_code528 == (whiteList[_from] & whitelisted_freeze_code528)) ) { // Added to Frozen
            restrictionCode += 4; // Sender is Frozen
        }
        if ((whitelisted_freeze_code528 == (whiteList[_to] & whitelisted_freeze_code528)) ) { // Added to Frozen
            restrictionCode += 8; // Receiver is Frozen
        }

        if (BALANCEOF388(_from) < _value) {
            restrictionCode += 16; // Send has insufficient balance
        }

        return restrictionCode;
    }

                                                                                                                                                                                             
    function MESSAGEFORTRANSFERRESTRICTION270 (uint8 _restrictionCode) public view returns (string memory _message) {	//inject NONSTANDARD NAMING
        _message = "Transfer Allowed";  // default and when is zero
        if (_restrictionCode >= 16) {
            _message = "Insufficient Balance to send";
        } else if (_restrictionCode >= 8) {
            _message = "To Account is Frozen, contact provider";
        } else if (_restrictionCode >= 4) {
            _message = "From Account is Frozen, contact provider";
        } else if (_restrictionCode >= 3) {
            _message = "Both Sending and receiving address has not been KYC Approved";
        } else if (_restrictionCode >= 2) {
            _message = "Receiving address has not been KYC Approved";
        } else if (_restrictionCode >= 1) {
            _message = "Sending address has not been KYC Approved";
        }
        return _message;
    }
}