                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER609() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA511() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY586() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF858(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER878(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE377(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE145(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM446(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER934(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL897(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}
// SPDX-License-Identifier: MIT



// import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";








                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD493(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB230(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB230(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB230(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL824(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV778(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV778(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV778(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD620(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD620(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD620(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY586() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF858(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER878(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER788(_MSGSENDER609(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE377(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE145(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE233(_MSGSENDER609(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM446(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER788(sender, recipient, amount);
        _APPROVE233(sender, _MSGSENDER609(), _allowances[sender][_MSGSENDER609()].SUB230(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE923(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE233(_MSGSENDER609(), spender, _allowances[_MSGSENDER609()][spender].ADD493(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE488(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE233(_MSGSENDER609(), spender, _allowances[_MSGSENDER609()][spender].SUB230(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER788(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB230(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD493(amount);
        emit TRANSFER934(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT221(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD493(amount);
        _balances[account] = _balances[account].ADD493(amount);
        emit TRANSFER934(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN960(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB230(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB230(amount);
        emit TRANSFER934(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE233(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL897(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM453(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN960(account, amount);
        _APPROVE233(account, _MSGSENDER609(), _allowances[account][_MSGSENDER609()].SUB230(amount, "ERC20: burn amount exceeds allowance"));
    }
}






                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD493(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS787(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE689(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS787(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS787(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}


contract MinterRole is Context {
    using Roles for Roles.Role;

    event MINTERADDED517(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED797(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER717(_MSGSENDER609());
    }

    modifier ONLYMINTER28() {	//inject NONSTANDARD NAMING
        require(ISMINTER873(_MSGSENDER609()), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER873(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS787(account);
    }

    function ADDMINTER76(address account) public ONLYMINTER28 {	//inject NONSTANDARD NAMING
        _ADDMINTER717(account);
    }

    function RENOUNCEMINTER994() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER791(_MSGSENDER609());
    }

    function _ADDMINTER717(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD493(account);
        emit MINTERADDED517(account);
    }

    function _REMOVEMINTER791(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE689(account);
        emit MINTERREMOVED797(account);
    }
}


                                                                                                                                                                                                                                     
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                 
    function MINT647(address account, uint256 amount) public ONLYMINTER28 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT221(account, amount);
        return true;
    }
}





                                                           
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

                                                                                                                                                                                       
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                          
    function NAME524() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL139() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function DECIMALS876() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}






                                                                                                                                                                                                                
contract ERC20Burnable is Context, ERC20 {
                                                                                                      
    function BURN291(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN960(_MSGSENDER609(), amount);
    }

                                                  
    function BURNFROM83(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURNFROM453(account, amount);
    }
}

// import "../node_modules/@openzeppelin/contracts/ownership/Ownable.sol";

contract ChaChaToken is ERC20Mintable, ERC20Detailed, ERC20Burnable {
    // string memory name, string memory symbol, uint8 decimals
    constructor (
        // uint256 initMint,
        string memory _name,
        string memory _symbol,
        uint8 _decimals
        // uint256 burnAmount
        )

        ERC20Mintable()
        ERC20Detailed(_name, _symbol, _decimals)
        ERC20Burnable()

        public
    {

    }
    // https://t.me/midddlelayer2game

}