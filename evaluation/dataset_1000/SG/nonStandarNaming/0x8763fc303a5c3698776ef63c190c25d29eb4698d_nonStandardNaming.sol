                                                                 

pragma solidity ^0.5.11;

// File: @openzeppelin/contracts/utils/Address.sol

                                                                    
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT807(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

// File: @openzeppelin/contracts/introspection/ERC165Checker.sol

                                                                                                                                                                                                                                                                                     
library ERC165Checker {
    // As per the EIP-165 spec, no interface should ever match 0xffffffff
    bytes4 private constant _interface_id_invalid623 = 0xffffffff;	//inject NONSTANDARD NAMING

                                                                                  
    bytes4 private constant _interface_id_erc165837 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                       
    function _SUPPORTSERC165438(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // Any contract that implements ERC165 must explicitly indicate support of
        // InterfaceId_ERC165 and explicitly indicate non-support of InterfaceId_Invalid
        return _SUPPORTSERC165INTERFACE422(account, _interface_id_erc165837) &&
            !_SUPPORTSERC165INTERFACE422(account, _interface_id_invalid623);
    }

                                                                                                                                                                                                                   
    function _SUPPORTSINTERFACE763(address account, bytes4 interfaceId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // query support of both ERC165 as per the spec and support of _interfaceId
        return _SUPPORTSERC165438(account) &&
            _SUPPORTSERC165INTERFACE422(account, interfaceId);
    }

                                                                                                                                                                                                                                                                                                                                        
    function _SUPPORTSALLINTERFACES867(address account, bytes4[] memory interfaceIds) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // query support of ERC165 itself
        if (!_SUPPORTSERC165438(account)) {
            return false;
        }

        // query support of each interface in _interfaceIds
        for (uint256 i = 0; i < interfaceIds.length; i++) {
            if (!_SUPPORTSERC165INTERFACE422(account, interfaceIds[i])) {
                return false;
            }
        }

        // all interfaces supported
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function _SUPPORTSERC165INTERFACE422(address account, bytes4 interfaceId) private view returns (bool) {	//inject NONSTANDARD NAMING
        // success determines whether the staticcall succeeded and result determines
        // whether the contract at account indicates support of _interfaceId
        (bool success, bool result) = _CALLERC165SUPPORTSINTERFACE51(account, interfaceId);

        return (success && result);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function _CALLERC165SUPPORTSINTERFACE51(address account, bytes4 interfaceId)	//inject NONSTANDARD NAMING
        private
        view
        returns (bool success, bool result)
    {
        bytes memory encodedParams = abi.encodeWithSelector(_interface_id_erc165837, interfaceId);

        // solhint-disable-next-line no-inline-assembly
        assembly {
            let encodedParams_data := add(0x20, encodedParams)
            let encodedParams_size := mload(encodedParams)

            let output := mload(0x40)    // Find empty storage location using "free memory pointer"
            mstore(output, 0x0)

            success := staticcall(
                30000,                   // 30k gas
                account,                 // To addr
                encodedParams_data,
                encodedParams_size,
                output,
                0x20                     // Outputs are 32 bytes long
            )

            result := mload(output)      // Load the result
        }
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY181() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF937(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER66(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE367(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE189(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM249(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER413(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL289(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/math/SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD657(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB965(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL896(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV21(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD685(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY181() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF937(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER66(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER125(msg.sender, recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE367(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE189(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE337(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM249(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER125(sender, recipient, amount);
        _APPROVE337(sender, msg.sender, _allowances[sender][msg.sender].SUB965(amount));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE67(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE337(msg.sender, spender, _allowances[msg.sender][spender].ADD657(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE456(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE337(msg.sender, spender, _allowances[msg.sender][spender].SUB965(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER125(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB965(amount);
        _balances[recipient] = _balances[recipient].ADD657(amount);
        emit TRANSFER413(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT577(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD657(amount);
        _balances[account] = _balances[account].ADD657(amount);
        emit TRANSFER413(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN676(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.SUB965(value);
        _balances[account] = _balances[account].SUB965(value);
        emit TRANSFER413(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE337(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit APPROVAL289(owner, spender, value);
    }

                                                                                                                                                                          
    function _BURNFROM728(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN676(account, amount);
        _APPROVE337(account, msg.sender, _allowances[account][msg.sender].SUB965(amount));
    }
}

// File: @openzeppelin/contracts/introspection/IERC165.sol

                                                                                                                                                                                                                                                                                         
interface IERC165 {
                                                                                                                                                                                                                                                                                                                                                          
    function SUPPORTSINTERFACE346(bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/introspection/ERC165.sol

                                                                                                                                                                           
contract ERC165 is IERC165 {
                                                                                  
    bytes4 private constant _interface_id_erc165837 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                      
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor () internal {
        // Derived contracts need only register support for their own interfaces,
        // we register support for ERC165 itself here
        _REGISTERINTERFACE738(_interface_id_erc165837);
    }

                                                                                                                                               
    function SUPPORTSINTERFACE346(bytes4 interfaceId) external view returns (bool) {	//inject NONSTANDARD NAMING
        return _supportedInterfaces[interfaceId];
    }

                                                                                                                                                                                                                                                                                                                                                                                                   
    function _REGISTERINTERFACE738(bytes4 interfaceId) internal {	//inject NONSTANDARD NAMING
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363.sol

                                                                                                                                                                                                                  
contract IERC1363 is IERC20, ERC165 {
                                                                                                                                                                                                                                                                                                                                                                                                                

                                                                                                                                                                                                                                              

                                                                                                                                                                                                                                                                                                            
    function TRANSFERANDCALL499(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                    
    function TRANSFERANDCALL499(address to, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                             
    function TRANSFERFROMANDCALL385(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING


                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function TRANSFERFROMANDCALL385(address from, address to, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function APPROVEANDCALL955(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function APPROVEANDCALL955(address spender, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363Receiver.sol

                                                                                                                                                                                                                                                                                                            
contract IERC1363Receiver {
                                                                                                                                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function ONTRANSFERRECEIVED282(address operator, address from, uint256 value, bytes memory data) public returns (bytes4); // solhint-disable-line  max-line-length	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363Spender.sol

                                                                                                                                                                                                                                                                                   
contract IERC1363Spender {
                                                                                                                                                                         

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function ONAPPROVALRECEIVED33(address owner, uint256 value, bytes memory data) public returns (bytes4);	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/ERC1363.sol

                                                                                                                                        
contract ERC1363 is ERC20, IERC1363 {
    using Address for address;

                                                                                                                                                                                                                                                                                                                                                                                                                
    bytes4 internal constant _interface_id_erc1363_transfer400 = 0x4bbee2df;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                              
    bytes4 internal constant _interface_id_erc1363_approve879 = 0xfb9ec8ce;	//inject NONSTANDARD NAMING

    // Equals to `bytes4(keccak256("onTransferReceived(address,address,uint256,bytes)"))`
    // which can be also obtained as `IERC1363Receiver(0).onTransferReceived.selector`
    bytes4 private constant _erc1363_received938 = 0x88a7ca5c;	//inject NONSTANDARD NAMING

    // Equals to `bytes4(keccak256("onApprovalReceived(address,uint256,bytes)"))`
    // which can be also obtained as `IERC1363Spender(0).onApprovalReceived.selector`
    bytes4 private constant _erc1363_approved168 = 0x7b04a2d0;	//inject NONSTANDARD NAMING

    constructor() public {
        // register the supported interfaces to conform to ERC1363 via ERC165
        _REGISTERINTERFACE738(_interface_id_erc1363_transfer400);
        _REGISTERINTERFACE738(_interface_id_erc1363_approve879);
    }

    function TRANSFERANDCALL499(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERANDCALL499(to, value, "");
    }

    function TRANSFERANDCALL499(address to, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        require(TRANSFER66(to, value));
        require(_CHECKANDCALLTRANSFER306(msg.sender, to, value, data));
        return true;
    }

    function TRANSFERFROMANDCALL385(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROMANDCALL385(from, to, value, "");
    }

    function TRANSFERFROMANDCALL385(address from, address to, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        require(TRANSFERFROM249(from, to, value));
        require(_CHECKANDCALLTRANSFER306(from, to, value, data));
        return true;
    }

    function APPROVEANDCALL955(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return APPROVEANDCALL955(spender, value, "");
    }

    function APPROVEANDCALL955(address spender, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        APPROVE189(spender, value);
        require(_CHECKANDCALLAPPROVE70(spender, value, data));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _CHECKANDCALLTRANSFER306(address from, address to, uint256 value, bytes memory data) internal returns (bool) {	//inject NONSTANDARD NAMING
        if (!to.ISCONTRACT807()) {
            return false;
        }
        bytes4 retval = IERC1363Receiver(to).ONTRANSFERRECEIVED282(
            msg.sender, from, value, data
        );
        return (retval == _erc1363_received938);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _CHECKANDCALLAPPROVE70(address spender, uint256 value, bytes memory data) internal returns (bool) {	//inject NONSTANDARD NAMING
        if (!spender.ISCONTRACT807()) {
            return false;
        }
        bytes4 retval = IERC1363Spender(spender).ONAPPROVALRECEIVED33(
            msg.sender, value, data
        );
        return (retval == _erc1363_approved168);
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20Detailed.sol

                                                           
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

                                                                                                                                                                                       
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                          
    function NAME458() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL261() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DECIMALS270() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: @openzeppelin/contracts/access/Roles.sol

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD657(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS34(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE274(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS34(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS34(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

// File: @openzeppelin/contracts/access/roles/MinterRole.sol

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED550(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED476(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER495(msg.sender);
    }

    modifier ONLYMINTER797() {	//inject NONSTANDARD NAMING
        require(ISMINTER691(msg.sender), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER691(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS34(account);
    }

    function ADDMINTER571(address account) public ONLYMINTER797 {	//inject NONSTANDARD NAMING
        _ADDMINTER495(account);
    }

    function RENOUNCEMINTER712() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER491(msg.sender);
    }

    function _ADDMINTER495(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD657(account);
        emit MINTERADDED550(account);
    }

    function _REMOVEMINTER491(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE274(account);
        emit MINTERREMOVED476(account);
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20Mintable.sol

                                                                                                                                                                                                                                     
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                 
    function MINT673(address account, uint256 amount) public ONLYMINTER797 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT577(account, amount);
        return true;
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20Capped.sol

                                                                                     
contract ERC20Capped is ERC20Mintable {
    uint256 private _cap;

                                                                                                                                     
    constructor (uint256 cap) public {
        require(cap > 0, "ERC20Capped: cap is 0");
        _cap = cap;
    }

                                                                        
    function CAP939() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

                                                                                                                                                             
    function _MINT577(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(TOTALSUPPLY181().ADD657(value) <= _cap, "ERC20Capped: cap exceeded");
        super._MINT577(account, value);
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20Burnable.sol

                                                                                                                                                                                                                
contract ERC20Burnable is ERC20 {
                                                                                                     
    function BURN113(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN676(msg.sender, amount);
    }

                                                  
    function BURNFROM851(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURNFROM728(account, amount);
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

                                                                                                                                                                                                                                                                                                                                                                       
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED952(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED952(address(0), _owner);
    }

                                                                     
    function OWNER672() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER441() {	//inject NONSTANDARD NAMING
        require(ISOWNER715(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER715() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP554() public ONLYOWNER441 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED952(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP796(address newOwner) public ONLYOWNER441 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP805(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP805(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED952(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: eth-token-recover/contracts/TokenRecover.sol

                                                                                                                                                                  
contract TokenRecover is Ownable {

                                                                                                                                                                                                                                             
    function RECOVERERC20189(address tokenAddress, uint256 tokenAmount) public ONLYOWNER441 {	//inject NONSTANDARD NAMING
        IERC20(tokenAddress).TRANSFER66(OWNER672(), tokenAmount);
    }
}

// File: ico-maker/contracts/access/roles/OperatorRole.sol

contract OperatorRole {
    using Roles for Roles.Role;

    event OPERATORADDED699(address indexed account);	//inject NONSTANDARD NAMING
    event OPERATORREMOVED746(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _operators;

    constructor() internal {
        _ADDOPERATOR237(msg.sender);
    }

    modifier ONLYOPERATOR638() {	//inject NONSTANDARD NAMING
        require(ISOPERATOR692(msg.sender));
        _;
    }

    function ISOPERATOR692(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _operators.HAS34(account);
    }

    function ADDOPERATOR540(address account) public ONLYOPERATOR638 {	//inject NONSTANDARD NAMING
        _ADDOPERATOR237(account);
    }

    function RENOUNCEOPERATOR596() public {	//inject NONSTANDARD NAMING
        _REMOVEOPERATOR445(msg.sender);
    }

    function _ADDOPERATOR237(address account) internal {	//inject NONSTANDARD NAMING
        _operators.ADD657(account);
        emit OPERATORADDED699(account);
    }

    function _REMOVEOPERATOR445(address account) internal {	//inject NONSTANDARD NAMING
        _operators.REMOVE274(account);
        emit OPERATORREMOVED746(account);
    }
}

// File: ico-maker/contracts/token/ERC20/BaseERC20Token.sol

                                                                                                                                             
contract BaseERC20Token is ERC20Detailed, ERC20Capped, ERC20Burnable, OperatorRole, TokenRecover {

    event MINTFINISHED961();	//inject NONSTANDARD NAMING
    event TRANSFERENABLED901();	//inject NONSTANDARD NAMING

    // indicates if minting is finished
    bool private _mintingFinished = false;

    // indicates if transfer is enabled
    bool private _transferEnabled = false;

                                                                              
    modifier CANMINT196() {	//inject NONSTANDARD NAMING
        require(!_mintingFinished);
        _;
    }

                                                                                                                  
    modifier CANTRANSFER622(address from) {	//inject NONSTANDARD NAMING
        require(_transferEnabled || ISOPERATOR692(from));
        _;
    }

                                                                                                                                                                                                                                                                                                                                 
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 cap,
        uint256 initialSupply
    )
        public
        ERC20Detailed(name, symbol, decimals)
        ERC20Capped(cap)
    {
        if (initialSupply > 0) {
            _MINT577(OWNER672(), initialSupply);
        }
    }

                                                             
    function MINTINGFINISHED302() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _mintingFinished;
    }

                                                             
    function TRANSFERENABLED543() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _transferEnabled;
    }

                                                                                                                                                                                                                                                
    function MINT673(address to, uint256 value) public CANMINT196 returns (bool) {	//inject NONSTANDARD NAMING
        return super.MINT673(to, value);
    }

                                                                                                                                                                                                                                         
    function TRANSFER66(address to, uint256 value) public CANTRANSFER622(msg.sender) returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER66(to, value);
    }

                                                                                                                                                                                                                                                                                                                                                                 
    function TRANSFERFROM249(address from, address to, uint256 value) public CANTRANSFER622(from) returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM249(from, to, value);
    }

                                                                
    function FINISHMINTING813() public ONLYOWNER441 CANMINT196 {	//inject NONSTANDARD NAMING
        _mintingFinished = true;

        emit MINTFINISHED961();
    }

                                                     
    function ENABLETRANSFER692() public ONLYOWNER441 {	//inject NONSTANDARD NAMING
        _transferEnabled = true;

        emit TRANSFERENABLED901();
    }

                                                                                                                         
    function REMOVEOPERATOR760(address account) public ONLYOWNER441 {	//inject NONSTANDARD NAMING
        _REMOVEOPERATOR445(account);
    }

                                                                                                                       
    function REMOVEMINTER209(address account) public ONLYOWNER441 {	//inject NONSTANDARD NAMING
        _REMOVEMINTER491(account);
    }
}

// File: ico-maker/contracts/token/ERC1363/BaseERC1363Token.sol

                                                                                                                                                                       
contract BaseERC1363Token is BaseERC20Token, ERC1363 {

                                                                                                                                                                                                                                                                                                                                 
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 cap,
        uint256 initialSupply
    )
        public
        BaseERC20Token(name, symbol, decimals, cap, initialSupply)
    {} // solhint-disable-line no-empty-blocks
}

// File: contracts/ERC20Token.sol

                                                                                                                                         
contract ERC20Token is BaseERC1363Token {

	string public name1 = "DEI";
	string public symbol1 = "DEI";
	uint8 decimals1 = 8;
	uint256 cap1 = 280000000 * 10**8;
	uint256 initialSupply1 = 280000000 * 10**8;
	bool transferEnabled1 = true;

    constructor()
        public
		BaseERC1363Token(name1, symbol1, decimals1, cap1, initialSupply1)
    {
        if (transferEnabled1) {
            ENABLETRANSFER692();
        }
    }
}