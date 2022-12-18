                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
                                                                      
    function TOTALSUPPLY659() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF933(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER95(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE297(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE340(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM265(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER406(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL132(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: contracts\open-zeppelin-contracts\math\SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD230(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB954(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL464(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV167(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD328(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

// File: contracts\open-zeppelin-contracts\token\ERC20\ERC20.sol

pragma solidity ^0.5.0;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY659() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF933(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER95(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER31(msg.sender, recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE297(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE340(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE793(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM265(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER31(sender, recipient, amount);
        _APPROVE793(sender, msg.sender, _allowances[sender][msg.sender].SUB954(amount));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE239(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE793(msg.sender, spender, _allowances[msg.sender][spender].ADD230(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE280(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE793(msg.sender, spender, _allowances[msg.sender][spender].SUB954(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                    
    function _TRANSFER31(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB954(amount);
        _balances[recipient] = _balances[recipient].ADD230(amount);
        emit TRANSFER406(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT834(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD230(amount);
        _balances[account] = _balances[account].ADD230(amount);
        emit TRANSFER406(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                         
    function _BURN358(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.SUB954(value);
        _balances[account] = _balances[account].SUB954(value);
        emit TRANSFER406(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE793(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit APPROVAL132(owner, spender, value);
    }

                                                                                                                                                                          
    function _BURNFROM246(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN358(account, amount);
        _APPROVE793(account, msg.sender, _allowances[account][msg.sender].SUB954(amount));
    }
}

// File: contracts\ERC20\SimpleERC20Token.sol

pragma solidity ^0.5.0;


                                                                                                                                                                                                      
contract YFINOVA is ERC20 {

    string private _name;
    string private _symbol;
    uint8 private _decimals;

                                                                                                                                                                                                                                                                                                                                                                                                     
    constructor(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply, address tokenOwnerAddress) public payable {
      _name = name;
      _symbol = symbol;
      _decimals = decimals;

      // set tokenOwnerAddress as owner of all tokens
      _MINT834(tokenOwnerAddress, totalSupply);
    }

                                                                                                                                 
    function BURN853(uint256 value) public {	//inject NONSTANDARD NAMING
      _BURN358(msg.sender, value);
    }

    // optional functions from ERC20 stardard

                                                     
    function NAME211() public view returns (string memory) {	//inject NONSTANDARD NAMING
      return _name;
    }

                                                       
    function SYMBOL918() public view returns (string memory) {	//inject NONSTANDARD NAMING
      return _symbol;
    }

                                                                   
    function DECIMALS138() public view returns (uint8) {	//inject NONSTANDARD NAMING
      return _decimals;
    }
}