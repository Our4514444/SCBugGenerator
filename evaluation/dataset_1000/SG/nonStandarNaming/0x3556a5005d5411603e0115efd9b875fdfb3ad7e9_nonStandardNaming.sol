                                                                 

//file: Context.sol
pragma solidity 0.5.12;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER327() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA739() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

//file: IERC20.sol

pragma solidity 0.5.12;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY773() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF199(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER934(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE521(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE567(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM919(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER680(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL316(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

//file: ERC20.sol
pragma solidity 0.5.12;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY773() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF199(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER934(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER457(_MSGSENDER327(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE521(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE567(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE961(_MSGSENDER327(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM919(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER457(sender, recipient, amount);
        _APPROVE961(sender, _MSGSENDER327(), _allowances[sender][_MSGSENDER327()].SUB678(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE560(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE961(_MSGSENDER327(), spender, _allowances[_MSGSENDER327()][spender].ADD880(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE247(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE961(_MSGSENDER327(), spender, _allowances[_MSGSENDER327()][spender].SUB678(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER457(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB678(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD880(amount);
        emit TRANSFER680(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT465(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD880(amount);
        _balances[account] = _balances[account].ADD880(amount);
        emit TRANSFER680(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN458(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB678(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB678(amount);
        emit TRANSFER680(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE961(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL316(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM852(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN458(account, amount);
        _APPROVE961(account, _MSGSENDER327(), _allowances[account][_MSGSENDER327()].SUB678(amount, "ERC20: burn amount exceeds allowance"));
    }
}

//file: SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD880(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB678(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB678(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB678(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL41(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV393(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV393(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV393(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD596(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD596(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD596(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

pragma solidity 0.5.12;

// ----------------------------------------------------------------------------
// 'DECA' DEcentralized CArbon tokens - ITDE (initial token distribution event)
//
// Deployed to : 0x3556A5005D5411603e0115efD9B875FdFb3ad7E9
// Network     : MAIN
// Symbol      : DECA
// Name        : DEcentralized CArbon tokens
// Total supply: Gazillion
// Decimals    : 18
// 
// Designed and wrote by D. Perez Negron <david@neetsec.com> A.K.A p1r0
// Test and Migrations to truffle by vitaliykuzmich
// ----------------------------------------------------------------------------
                                                                                              
contract Ownable is Context {
    address payable private _owner;
    using SafeMath for uint256;
    string public _CCDBAddress;


    event OWNERSHIPTRANSFERRED308(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER327();
        emit OWNERSHIPTRANSFERRED308(address(0), _owner);
    }

                                                                     
    function OWNER385() public view returns (address payable) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER320() {	//inject NONSTANDARD NAMING
        require(ISOWNER387(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER387() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER327() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP619() public ONLYOWNER320 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED308(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP717(address payable newOwner) public ONLYOWNER320 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP66(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP66(address payable newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED308(_owner, newOwner);
        _owner = newOwner;
    }

                                                                                                                                        
    function UPDATECCDBADDRESS834(string memory newCCDBAddress) public ONLYOWNER320 {	//inject NONSTANDARD NAMING
       _CCDBAddress = newCCDBAddress;
    }
}

// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and assisted
// token transfers
// ----------------------------------------------------------------------------
contract DECA is ERC20, Ownable {
    using SafeMath for uint256;
    string constant public symbol265 = "DECA";	//inject NONSTANDARD NAMING
    string constant public name29 = "DEcentralized CArbon tokens";	//inject NONSTANDARD NAMING
    uint8 constant public decimals782 = 18;	//inject NONSTANDARD NAMING
    //for testing change weeks for hours...
    uint public preICOEnds = now + 1 weeks;
    uint public bonus1Ends = now + 3 weeks;
    uint public bonus2Ends = now + 6 weeks;
    uint public endDate = now + 11 weeks;
    bool private _pause = false;

    modifier NOTPAUSED26() {	//inject NONSTANDARD NAMING
        require(!_pause, "crowdsale on pause");
        _;
    }
    function GETPAUSE479() view public returns (bool){	//inject NONSTANDARD NAMING
        return _pause;
    }

    function SETPAUSE947(bool p) external ONLYOWNER320 {	//inject NONSTANDARD NAMING
        _pause = p;
    }
    // ------------------------------------------------------------------------
    // 100 DECA Tokens per 1 ETH
    // ------------------------------------------------------------------------
    function() NOTPAUSED26 external payable {
        require(now <= endDate);
        uint tokens;
        uint toOwner;
        uint toSender;
        uint divBy;

        divBy = 40;
        //2.5% extra printed to be 2% of the marketcap, please see README.md
        if (now <= preICOEnds) {
            tokens = msg.value * 300;
        } else if (now > preICOEnds && now <= bonus1Ends) {
            tokens = msg.value * 275;
        } else if (now > bonus1Ends && now <= bonus2Ends) {
            tokens = msg.value * 250;
        } else {
            tokens = msg.value * 225;
        }

        toOwner = tokens.DIV393(divBy);
        //created 2.5% extra to the contract owner to approach 2% total marketcap
        toSender = tokens;
        //tokens that goes to the sender

        _MINT465(OWNER385(), toOwner);
        _MINT465(msg.sender, toSender);
    }

    //Add weeks in case ICO gets not enough funds
    function APPENDWEEKS838(uint addWeeks ) public ONLYOWNER320 {	//inject NONSTANDARD NAMING
        require(now >= bonus2Ends && now < endDate);
        // Fix Integer Overflow / Underflow
        require(endDate < (endDate + (addWeeks * 1 weeks)));
        // add weeks to the endDate
        endDate += (addWeeks * 1 weeks);
    }
    
    //Close down the ICO and claim the Ether.
    function GETETH386() public ONLYOWNER320 {	//inject NONSTANDARD NAMING
        require(now >= endDate);
        // transfer the ETH balance in the contract to the owner
        OWNER385().transfer(address(this).balance);
    }

    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function TRANSFERANYERC20TOKEN192(address payable tokenAddress, uint tokens) public ONLYOWNER320 returns (bool success) {	//inject NONSTANDARD NAMING
        return IERC20(tokenAddress).TRANSFER934(OWNER385(), tokens);
    }
}