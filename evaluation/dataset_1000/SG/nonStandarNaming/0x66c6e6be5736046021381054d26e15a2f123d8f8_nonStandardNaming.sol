// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER468(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE0(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM289(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY128() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF536(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE76(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER553(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL995(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL664(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV783(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB683(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD266(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD388(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                               
    function TOTALSUPPLY128() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF536(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE76(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER468(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER734(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE0(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE108(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM289(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER734(from, to, value);
        _APPROVE108(from, msg.sender, _allowed[from][msg.sender].SUB683(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE138(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE108(msg.sender, spender, _allowed[msg.sender][spender].ADD266(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE168(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE108(msg.sender, spender, _allowed[msg.sender][spender].SUB683(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER734(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB683(value);
        _balances[to] = _balances[to].ADD266(value);
        emit TRANSFER553(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT957(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD266(value);
        _balances[account] = _balances[account].ADD266(value);
        emit TRANSFER553(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN124(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB683(value);
        _balances[account] = _balances[account].SUB683(value);
        emit TRANSFER553(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE108(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL995(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM166(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN124(account, value);
        _APPROVE108(account, msg.sender, _allowed[account][msg.sender].SUB683(value));
    }
}

// File: openzeppelin-solidity/contracts/access/Roles.sol

pragma solidity ^0.5.2;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD266(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS540(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE334(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS540(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS540(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: openzeppelin-solidity/contracts/access/roles/MinterRole.sol

pragma solidity ^0.5.2;


contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED754(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED214(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER278(msg.sender);
    }

    modifier ONLYMINTER450() {	//inject NONSTANDARD NAMING
        require(ISMINTER784(msg.sender));
        _;
    }

    function ISMINTER784(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS540(account);
    }

    function ADDMINTER822(address account) public ONLYMINTER450 {	//inject NONSTANDARD NAMING
        _ADDMINTER278(account);
    }

    function RENOUNCEMINTER29() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER327(msg.sender);
    }

    function _ADDMINTER278(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD266(account);
        emit MINTERADDED754(account);
    }

    function _REMOVEMINTER327(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE334(account);
        emit MINTERREMOVED214(account);
    }
}

// File: contracts/DeVere.sol

pragma solidity ^0.5.2;




contract DeVere is ERC20, MinterRole {
    using SafeMath for uint256;

    string public constant name106 = "DeVere";	//inject NONSTANDARD NAMING
    string public constant symbol902 = "DVR";	//inject NONSTANDARD NAMING
    uint256 public constant decimals851 = 18;	//inject NONSTANDARD NAMING

    uint256 private constant base1614 = 10 ** decimals851;	//inject NONSTANDARD NAMING
    address private constant banker39 = 0xA8b58e07093F2fb394194a23eE1905Bc58EDf66d;	//inject NONSTANDARD NAMING
    address private constant beneficiary723 = 0x39048931a3e2DD9aA1618854e0C22642a13129e5;	//inject NONSTANDARD NAMING

    uint256 private constant stage1562 = 1560528000; //2019-06-15	//inject NONSTANDARD NAMING
    uint256 private constant stage2817 = 1563120000; //2019-07-15	//inject NONSTANDARD NAMING
    uint256 private constant stage3697 = 1565798400; //2019-08-15	//inject NONSTANDARD NAMING
    uint256 private constant stage4240 = 1568476800; //2019-09-15	//inject NONSTANDARD NAMING
    uint256 private constant stage5920 = 1571068800; //2019-10-15	//inject NONSTANDARD NAMING
    uint256 private constant stageamounteach886 = 2000000 * base1614;	//inject NONSTANDARD NAMING
    uint256 private _stageMintTotal = 0;

    constructor() public {
        _MINT957(banker39, 31 * (10 ** 7) * base1614);
    }

    function MINT539() public ONLYMINTER450 returns (bool) {	//inject NONSTANDARD NAMING
        return MINTTO97(beneficiary723);
    }

    function MINTTO97(address _to) public ONLYMINTER450 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0x0), "Invalid address");
        uint256 nowTime = block.timestamp;
        uint256 sumAmount = 0;
        if (nowTime >= stage5920) {
            sumAmount = stageamounteach886.MUL664(5);
        } else if (nowTime >= stage4240) {
            sumAmount = stageamounteach886.MUL664(4);
        } else if (nowTime >= stage3697) {
            sumAmount = stageamounteach886.MUL664(3);
        } else if (nowTime >= stage2817) {
            sumAmount = stageamounteach886.MUL664(2);
        } else if (nowTime >= stage1562) {
            sumAmount = stageamounteach886;
        }
        require(sumAmount > _stageMintTotal, "Can not mint more token!");

        uint256 amount = sumAmount.SUB683(_stageMintTotal);
        _stageMintTotal = sumAmount;
        _MINT957(_to, amount);
        return true;
    }
}