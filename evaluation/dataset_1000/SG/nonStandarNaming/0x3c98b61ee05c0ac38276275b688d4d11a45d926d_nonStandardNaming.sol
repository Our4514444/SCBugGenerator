                                                                 

                                                                 

pragma solidity ^0.5.15;

// File: @openzeppelin/contracts/utils/Address.sol

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT210(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

                                                                                                                                                                                                          
    function TOPAYABLE850(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE350(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/introspection/ERC165Checker.sol

                                                                                                                                                                                                                                                                                     
library ERC165Checker {
    // As per the EIP-165 spec, no interface should ever match 0xffffffff
    bytes4 private constant _interface_id_invalid257 = 0xffffffff;	//inject NONSTANDARD NAMING

                                                                                  
    bytes4 private constant _interface_id_erc165643 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                       
    function _SUPPORTSERC165110(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // Any contract that implements ERC165 must explicitly indicate support of
        // InterfaceId_ERC165 and explicitly indicate non-support of InterfaceId_Invalid
        return _SUPPORTSERC165INTERFACE770(account, _interface_id_erc165643) &&
            !_SUPPORTSERC165INTERFACE770(account, _interface_id_invalid257);
    }

                                                                                                                                                                                                                   
    function _SUPPORTSINTERFACE182(address account, bytes4 interfaceId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // query support of both ERC165 as per the spec and support of _interfaceId
        return _SUPPORTSERC165110(account) &&
            _SUPPORTSERC165INTERFACE770(account, interfaceId);
    }

                                                                                                                                                                                                                                                                                                                                        
    function _SUPPORTSALLINTERFACES564(address account, bytes4[] memory interfaceIds) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // query support of ERC165 itself
        if (!_SUPPORTSERC165110(account)) {
            return false;
        }

        // query support of each interface in _interfaceIds
        for (uint256 i = 0; i < interfaceIds.length; i++) {
            if (!_SUPPORTSERC165INTERFACE770(account, interfaceIds[i])) {
                return false;
            }
        }

        // all interfaces supported
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function _SUPPORTSERC165INTERFACE770(address account, bytes4 interfaceId) private view returns (bool) {	//inject NONSTANDARD NAMING
        // success determines whether the staticcall succeeded and result determines
        // whether the contract at account indicates support of _interfaceId
        (bool success, bool result) = _CALLERC165SUPPORTSINTERFACE613(account, interfaceId);

        return (success && result);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function _CALLERC165SUPPORTSINTERFACE613(address account, bytes4 interfaceId)	//inject NONSTANDARD NAMING
        private
        view
        returns (bool success, bool result)
    {
        bytes memory encodedParams = abi.encodeWithSelector(_interface_id_erc165643, interfaceId);

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

// File: @openzeppelin/contracts/GSN/Context.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER404() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA595() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY113() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF841(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER296(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE213(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE188(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM789(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER327(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL187(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/math/SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD604(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB898(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB898(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB898(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL522(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV497(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV497(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV497(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD120(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD120(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD120(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY113() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF841(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER296(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER408(_MSGSENDER404(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE213(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE188(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE357(_MSGSENDER404(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM789(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER408(sender, recipient, amount);
        _APPROVE357(sender, _MSGSENDER404(), _allowances[sender][_MSGSENDER404()].SUB898(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE551(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE357(_MSGSENDER404(), spender, _allowances[_MSGSENDER404()][spender].ADD604(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE921(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE357(_MSGSENDER404(), spender, _allowances[_MSGSENDER404()][spender].SUB898(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER408(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB898(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD604(amount);
        emit TRANSFER327(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT490(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD604(amount);
        _balances[account] = _balances[account].ADD604(amount);
        emit TRANSFER327(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                         
    function _BURN183(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB898(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB898(amount);
        emit TRANSFER327(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE357(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL187(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM248(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN183(account, amount);
        _APPROVE357(account, _MSGSENDER404(), _allowances[account][_MSGSENDER404()].SUB898(amount, "ERC20: burn amount exceeds allowance"));
    }
}

// File: @openzeppelin/contracts/introspection/IERC165.sol

                                                                                                                                                                                                                                                                                       
interface IERC165 {
                                                                                                                                                                                                                                                                                                                                                        
    function SUPPORTSINTERFACE529(bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/introspection/ERC165.sol

                                                                                                                                                                           
contract ERC165 is IERC165 {
                                                                                  
    bytes4 private constant _interface_id_erc165643 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                      
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor () internal {
        // Derived contracts need only register support for their own interfaces,
        // we register support for ERC165 itself here
        _REGISTERINTERFACE533(_interface_id_erc165643);
    }

                                                                                                                                               
    function SUPPORTSINTERFACE529(bytes4 interfaceId) external view returns (bool) {	//inject NONSTANDARD NAMING
        return _supportedInterfaces[interfaceId];
    }

                                                                                                                                                                                                                                                                                                                                                                                                   
    function _REGISTERINTERFACE533(bytes4 interfaceId) internal {	//inject NONSTANDARD NAMING
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363.sol

                                                                                                                                                                                                                  
contract IERC1363 is IERC20, ERC165 {
                                                                                                                                                                                                                                                                                                                                                                                                                

                                                                                                                                                                                                                                              

                                                                                                                                                                                                                                                                                                            
    function TRANSFERANDCALL65(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                    
    function TRANSFERANDCALL65(address to, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                             
    function TRANSFERFROMANDCALL990(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING


                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function TRANSFERFROMANDCALL990(address from, address to, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function APPROVEANDCALL241(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function APPROVEANDCALL241(address spender, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363Receiver.sol

                                                                                                                                                                                                                                                                                                            
contract IERC1363Receiver {
                                                                                                                                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function ONTRANSFERRECEIVED459(address operator, address from, uint256 value, bytes memory data) public returns (bytes4); // solhint-disable-line  max-line-length	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363Spender.sol

                                                                                                                                                                                                                                                                                   
contract IERC1363Spender {
                                                                                                                                                                         

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function ONAPPROVALRECEIVED161(address owner, uint256 value, bytes memory data) public returns (bytes4);	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/ERC1363.sol

                                                                                                                                        
contract ERC1363 is ERC20, IERC1363 {
    using Address for address;

                                                                                                                                                                                                                                                                                                                                                                                                                
    bytes4 internal constant _interface_id_erc1363_transfer803 = 0x4bbee2df;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                              
    bytes4 internal constant _interface_id_erc1363_approve287 = 0xfb9ec8ce;	//inject NONSTANDARD NAMING

    // Equals to `bytes4(keccak256("onTransferReceived(address,address,uint256,bytes)"))`
    // which can be also obtained as `IERC1363Receiver(0).onTransferReceived.selector`
    bytes4 private constant _erc1363_received1 = 0x88a7ca5c;	//inject NONSTANDARD NAMING

    // Equals to `bytes4(keccak256("onApprovalReceived(address,uint256,bytes)"))`
    // which can be also obtained as `IERC1363Spender(0).onApprovalReceived.selector`
    bytes4 private constant _erc1363_approved984 = 0x7b04a2d0;	//inject NONSTANDARD NAMING

    constructor() public {
        // register the supported interfaces to conform to ERC1363 via ERC165
        _REGISTERINTERFACE533(_interface_id_erc1363_transfer803);
        _REGISTERINTERFACE533(_interface_id_erc1363_approve287);
    }

    function TRANSFERANDCALL65(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERANDCALL65(to, value, "");
    }

    function TRANSFERANDCALL65(address to, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        require(TRANSFER296(to, value));
        require(_CHECKANDCALLTRANSFER70(msg.sender, to, value, data));
        return true;
    }

    function TRANSFERFROMANDCALL990(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROMANDCALL990(from, to, value, "");
    }

    function TRANSFERFROMANDCALL990(address from, address to, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        require(TRANSFERFROM789(from, to, value));
        require(_CHECKANDCALLTRANSFER70(from, to, value, data));
        return true;
    }

    function APPROVEANDCALL241(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return APPROVEANDCALL241(spender, value, "");
    }

    function APPROVEANDCALL241(address spender, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        APPROVE188(spender, value);
        require(_CHECKANDCALLAPPROVE801(spender, value, data));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _CHECKANDCALLTRANSFER70(address from, address to, uint256 value, bytes memory data) internal returns (bool) {	//inject NONSTANDARD NAMING
        if (!to.ISCONTRACT210()) {
            return false;
        }
        bytes4 retval = IERC1363Receiver(to).ONTRANSFERRECEIVED459(
            msg.sender, from, value, data
        );
        return (retval == _erc1363_received1);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _CHECKANDCALLAPPROVE801(address spender, uint256 value, bytes memory data) internal returns (bool) {	//inject NONSTANDARD NAMING
        if (!spender.ISCONTRACT210()) {
            return false;
        }
        bytes4 retval = IERC1363Spender(spender).ONAPPROVALRECEIVED161(
            msg.sender, value, data
        );
        return (retval == _erc1363_approved984);
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

                                                          
    function NAME175() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL564() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function DECIMALS175() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: @openzeppelin/contracts/access/Roles.sol

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD604(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS932(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE442(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS932(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS932(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

// File: @openzeppelin/contracts/access/roles/MinterRole.sol

contract MinterRole is Context {
    using Roles for Roles.Role;

    event MINTERADDED419(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED684(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER663(_MSGSENDER404());
    }

    modifier ONLYMINTER385() {	//inject NONSTANDARD NAMING
        require(ISMINTER390(_MSGSENDER404()), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER390(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS932(account);
    }

    function ADDMINTER298(address account) public ONLYMINTER385 {	//inject NONSTANDARD NAMING
        _ADDMINTER663(account);
    }

    function RENOUNCEMINTER300() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER285(_MSGSENDER404());
    }

    function _ADDMINTER663(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD604(account);
        emit MINTERADDED419(account);
    }

    function _REMOVEMINTER285(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE442(account);
        emit MINTERREMOVED684(account);
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20Mintable.sol

                                                                                                                                                                                                                                     
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                 
    function MINT534(address account, uint256 amount) public ONLYMINTER385 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT490(account, amount);
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

                                                                        
    function CAP278() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

                                                                                                                                                             
    function _MINT490(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(TOTALSUPPLY113().ADD604(value) <= _cap, "ERC20Capped: cap exceeded");
        super._MINT490(account, value);
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20Burnable.sol

                                                                                                                                                                                                                
contract ERC20Burnable is Context, ERC20 {
                                                                                                      
    function BURN642(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN183(_MSGSENDER404(), amount);
    }

                                                  
    function BURNFROM479(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURNFROM248(account, amount);
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED522(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER404();
        emit OWNERSHIPTRANSFERRED522(address(0), _owner);
    }

                                                                     
    function OWNER12() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER820() {	//inject NONSTANDARD NAMING
        require(ISOWNER494(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER494() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER404() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP932() public ONLYOWNER820 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED522(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP40(address newOwner) public ONLYOWNER820 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP120(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP120(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED522(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: eth-token-recover/contracts/TokenRecover.sol

                                                                                                                                                                  
contract TokenRecover is Ownable {

                                                                                                                                                                                                                                             
    function RECOVERERC2011(address tokenAddress, uint256 tokenAmount) public ONLYOWNER820 {	//inject NONSTANDARD NAMING
        IERC20(tokenAddress).TRANSFER296(OWNER12(), tokenAmount);
    }
}

// File: ico-maker/contracts/access/roles/OperatorRole.sol

contract OperatorRole {
    using Roles for Roles.Role;

    event OPERATORADDED269(address indexed account);	//inject NONSTANDARD NAMING
    event OPERATORREMOVED627(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _operators;

    constructor() internal {
        _ADDOPERATOR234(msg.sender);
    }

    modifier ONLYOPERATOR834() {	//inject NONSTANDARD NAMING
        require(ISOPERATOR344(msg.sender));
        _;
    }

    function ISOPERATOR344(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _operators.HAS932(account);
    }

    function ADDOPERATOR467(address account) public ONLYOPERATOR834 {	//inject NONSTANDARD NAMING
        _ADDOPERATOR234(account);
    }

    function RENOUNCEOPERATOR343() public {	//inject NONSTANDARD NAMING
        _REMOVEOPERATOR425(msg.sender);
    }

    function _ADDOPERATOR234(address account) internal {	//inject NONSTANDARD NAMING
        _operators.ADD604(account);
        emit OPERATORADDED269(account);
    }

    function _REMOVEOPERATOR425(address account) internal {	//inject NONSTANDARD NAMING
        _operators.REMOVE442(account);
        emit OPERATORREMOVED627(account);
    }
}

// File: ico-maker/contracts/token/ERC20/BaseERC20Token.sol

                                                                                                                                             
contract BaseERC20Token is ERC20Detailed, ERC20Capped, ERC20Burnable, OperatorRole, TokenRecover {

    event MINTFINISHED988();	//inject NONSTANDARD NAMING
    event TRANSFERENABLED201();	//inject NONSTANDARD NAMING

    // indicates if minting is finished
    bool private _mintingFinished = false;

    // indicates if transfer is enabled
    bool private _transferEnabled = false;

                                                                              
    modifier CANMINT175() {	//inject NONSTANDARD NAMING
        require(!_mintingFinished);
        _;
    }

                                                                                                                  
    modifier CANTRANSFER372(address from) {	//inject NONSTANDARD NAMING
        require(_transferEnabled || ISOPERATOR344(from));
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
            _MINT490(OWNER12(), initialSupply);
        }
    }

                                                             
    function MINTINGFINISHED295() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _mintingFinished;
    }

                                                             
    function TRANSFERENABLED579() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _transferEnabled;
    }

                                                                                                                                                                                                                                                
    function MINT534(address to, uint256 value) public CANMINT175 returns (bool) {	//inject NONSTANDARD NAMING
        return super.MINT534(to, value);
    }

                                                                                                                                                                                                                                         
    function TRANSFER296(address to, uint256 value) public CANTRANSFER372(msg.sender) returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER296(to, value);
    }

                                                                                                                                                                                                                                                                                                                                                                 
    function TRANSFERFROM789(address from, address to, uint256 value) public CANTRANSFER372(from) returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM789(from, to, value);
    }

                                                                
    function FINISHMINTING720() public ONLYOWNER820 CANMINT175 {	//inject NONSTANDARD NAMING
        _mintingFinished = true;

        emit MINTFINISHED988();
    }

                                                     
    function ENABLETRANSFER480() public ONLYOWNER820 {	//inject NONSTANDARD NAMING
        _transferEnabled = true;

        emit TRANSFERENABLED201();
    }

                                                                                                                         
    function REMOVEOPERATOR679(address account) public ONLYOWNER820 {	//inject NONSTANDARD NAMING
        _REMOVEOPERATOR425(account);
    }

                                                                                                                       
    function REMOVEMINTER769(address account) public ONLYOWNER820 {	//inject NONSTANDARD NAMING
        _REMOVEMINTER285(account);
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

    string public builtOn = "https://vittominacori.github.io/erc20-generator";
    string public project = "AuroGold";
    string public availableOn = "https://auro.gold";

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 cap,
        uint256 initialSupply,
        bool transferEnabled
    )
        public
        BaseERC1363Token(name, symbol, decimals, cap, initialSupply)
    {
        if (transferEnabled) {
            ENABLETRANSFER480();
        }
    }
}