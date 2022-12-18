                                                                 

                                                                 

pragma solidity ^0.5.15;

// File: @openzeppelin/contracts/utils/Address.sol

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT744(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE235(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE8(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/introspection/ERC165Checker.sol

                                                                                                                                                                                                                                                                                     
library ERC165Checker {
    // As per the EIP-165 spec, no interface should ever match 0xffffffff
    bytes4 private constant _interface_id_invalid846 = 0xffffffff;	//inject NONSTANDARD NAMING

                                                                                  
    bytes4 private constant _interface_id_erc165403 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                       
    function _SUPPORTSERC165339(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // Any contract that implements ERC165 must explicitly indicate support of
        // InterfaceId_ERC165 and explicitly indicate non-support of InterfaceId_Invalid
        return _SUPPORTSERC165INTERFACE537(account, _interface_id_erc165403) &&
            !_SUPPORTSERC165INTERFACE537(account, _interface_id_invalid846);
    }

                                                                                                                                                                                                                   
    function _SUPPORTSINTERFACE603(address account, bytes4 interfaceId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // query support of both ERC165 as per the spec and support of _interfaceId
        return _SUPPORTSERC165339(account) &&
            _SUPPORTSERC165INTERFACE537(account, interfaceId);
    }

                                                                                                                                                                                                                                                                                                                                        
    function _SUPPORTSALLINTERFACES590(address account, bytes4[] memory interfaceIds) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // query support of ERC165 itself
        if (!_SUPPORTSERC165339(account)) {
            return false;
        }

        // query support of each interface in _interfaceIds
        for (uint256 i = 0; i < interfaceIds.length; i++) {
            if (!_SUPPORTSERC165INTERFACE537(account, interfaceIds[i])) {
                return false;
            }
        }

        // all interfaces supported
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function _SUPPORTSERC165INTERFACE537(address account, bytes4 interfaceId) private view returns (bool) {	//inject NONSTANDARD NAMING
        // success determines whether the staticcall succeeded and result determines
        // whether the contract at account indicates support of _interfaceId
        (bool success, bool result) = _CALLERC165SUPPORTSINTERFACE936(account, interfaceId);

        return (success && result);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function _CALLERC165SUPPORTSINTERFACE936(address account, bytes4 interfaceId)	//inject NONSTANDARD NAMING
        private
        view
        returns (bool success, bool result)
    {
        bytes memory encodedParams = abi.encodeWithSelector(_interface_id_erc165403, interfaceId);

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

    function _MSGSENDER382() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA926() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY840() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF399(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER854(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE868(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE954(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM540(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER729(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL786(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/math/SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD262(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB896(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB896(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB896(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL61(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV515(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV515(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV515(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD745(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD745(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD745(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                     
    function TOTALSUPPLY840() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF399(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER854(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER172(_MSGSENDER382(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE868(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE954(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE507(_MSGSENDER382(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM540(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER172(sender, recipient, amount);
        _APPROVE507(sender, _MSGSENDER382(), _allowances[sender][_MSGSENDER382()].SUB896(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE862(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE507(_MSGSENDER382(), spender, _allowances[_MSGSENDER382()][spender].ADD262(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE211(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE507(_MSGSENDER382(), spender, _allowances[_MSGSENDER382()][spender].SUB896(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER172(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB896(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD262(amount);
        emit TRANSFER729(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT32(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD262(amount);
        _balances[account] = _balances[account].ADD262(amount);
        emit TRANSFER729(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                         
    function _BURN118(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB896(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB896(amount);
        emit TRANSFER729(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE507(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL786(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM365(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN118(account, amount);
        _APPROVE507(account, _MSGSENDER382(), _allowances[account][_MSGSENDER382()].SUB896(amount, "ERC20: burn amount exceeds allowance"));
    }
}

// File: @openzeppelin/contracts/introspection/IERC165.sol

                                                                                                                                                                                                                                                                                       
interface IERC165 {
                                                                                                                                                                                                                                                                                                                                                        
    function SUPPORTSINTERFACE229(bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/introspection/ERC165.sol

                                                                                                                                                                           
contract ERC165 is IERC165 {
                                                                                  
    bytes4 private constant _interface_id_erc165403 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                      
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor () internal {
        // Derived contracts need only register support for their own interfaces,
        // we register support for ERC165 itself here
        _REGISTERINTERFACE320(_interface_id_erc165403);
    }

                                                                                                                                               
    function SUPPORTSINTERFACE229(bytes4 interfaceId) external view returns (bool) {	//inject NONSTANDARD NAMING
        return _supportedInterfaces[interfaceId];
    }

                                                                                                                                                                                                                                                                                                                                                                                                   
    function _REGISTERINTERFACE320(bytes4 interfaceId) internal {	//inject NONSTANDARD NAMING
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363.sol

                                                                                                                                                                                                                  
contract IERC1363 is IERC20, ERC165 {
                                                                                                                                                                                                                                                                                                                                                                                                                

                                                                                                                                                                                                                                              

                                                                                                                                                                                                                                                                                                            
    function TRANSFERANDCALL546(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                    
    function TRANSFERANDCALL546(address to, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                             
    function TRANSFERFROMANDCALL344(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING


                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function TRANSFERFROMANDCALL344(address from, address to, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function APPROVEANDCALL79(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function APPROVEANDCALL79(address spender, uint256 value, bytes memory data) public returns (bool);	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363Receiver.sol

                                                                                                                                                                                                                                                                                                            
contract IERC1363Receiver {
                                                                                                                                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function ONTRANSFERRECEIVED480(address operator, address from, uint256 value, bytes memory data) public returns (bytes4); // solhint-disable-line  max-line-length	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/IERC1363Spender.sol

                                                                                                                                                                                                                                                                                   
contract IERC1363Spender {
                                                                                                                                                                         

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function ONAPPROVALRECEIVED505(address owner, uint256 value, bytes memory data) public returns (bytes4);	//inject NONSTANDARD NAMING
}

// File: erc-payable-token/contracts/token/ERC1363/ERC1363.sol

                                                                                                                                        
contract ERC1363 is ERC20, IERC1363 {
    using Address for address;

                                                                                                                                                                                                                                                                                                                                                                                                                
    bytes4 internal constant _interface_id_erc1363_transfer467 = 0x4bbee2df;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                              
    bytes4 internal constant _interface_id_erc1363_approve367 = 0xfb9ec8ce;	//inject NONSTANDARD NAMING

    // Equals to `bytes4(keccak256("onTransferReceived(address,address,uint256,bytes)"))`
    // which can be also obtained as `IERC1363Receiver(0).onTransferReceived.selector`
    bytes4 private constant _erc1363_received541 = 0x88a7ca5c;	//inject NONSTANDARD NAMING

    // Equals to `bytes4(keccak256("onApprovalReceived(address,uint256,bytes)"))`
    // which can be also obtained as `IERC1363Spender(0).onApprovalReceived.selector`
    bytes4 private constant _erc1363_approved907 = 0x7b04a2d0;	//inject NONSTANDARD NAMING

    constructor() public {
        // register the supported interfaces to conform to ERC1363 via ERC165
        _REGISTERINTERFACE320(_interface_id_erc1363_transfer467);
        _REGISTERINTERFACE320(_interface_id_erc1363_approve367);
    }

    function TRANSFERANDCALL546(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERANDCALL546(to, value, "");
    }

    function TRANSFERANDCALL546(address to, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        require(TRANSFER854(to, value));
        require(_CHECKANDCALLTRANSFER130(msg.sender, to, value, data));
        return true;
    }

    function TRANSFERFROMANDCALL344(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROMANDCALL344(from, to, value, "");
    }

    function TRANSFERFROMANDCALL344(address from, address to, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        require(TRANSFERFROM540(from, to, value));
        require(_CHECKANDCALLTRANSFER130(from, to, value, data));
        return true;
    }

    function APPROVEANDCALL79(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        return APPROVEANDCALL79(spender, value, "");
    }

    function APPROVEANDCALL79(address spender, uint256 value, bytes memory data) public returns (bool) {	//inject NONSTANDARD NAMING
        APPROVE954(spender, value);
        require(_CHECKANDCALLAPPROVE764(spender, value, data));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _CHECKANDCALLTRANSFER130(address from, address to, uint256 value, bytes memory data) internal returns (bool) {	//inject NONSTANDARD NAMING
        if (!to.ISCONTRACT744()) {
            return false;
        }
        bytes4 retval = IERC1363Receiver(to).ONTRANSFERRECEIVED480(
            msg.sender, from, value, data
        );
        return (retval == _erc1363_received541);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _CHECKANDCALLAPPROVE764(address spender, uint256 value, bytes memory data) internal returns (bool) {	//inject NONSTANDARD NAMING
        if (!spender.ISCONTRACT744()) {
            return false;
        }
        bytes4 retval = IERC1363Spender(spender).ONAPPROVALRECEIVED505(
            msg.sender, value, data
        );
        return (retval == _erc1363_approved907);
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

                                                          
    function NAME592() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL545() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function DECIMALS978() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: @openzeppelin/contracts/access/Roles.sol

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD262(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS572(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE159(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS572(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS572(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

// File: @openzeppelin/contracts/access/roles/MinterRole.sol

contract MinterRole is Context {
    using Roles for Roles.Role;

    event MINTERADDED282(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED833(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER172(_MSGSENDER382());
    }

    modifier ONLYMINTER277() {	//inject NONSTANDARD NAMING
        require(ISMINTER683(_MSGSENDER382()), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER683(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS572(account);
    }

    function ADDMINTER434(address account) public ONLYMINTER277 {	//inject NONSTANDARD NAMING
        _ADDMINTER172(account);
    }

    function RENOUNCEMINTER366() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER244(_MSGSENDER382());
    }

    function _ADDMINTER172(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD262(account);
        emit MINTERADDED282(account);
    }

    function _REMOVEMINTER244(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE159(account);
        emit MINTERREMOVED833(account);
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20Mintable.sol

                                                                                                                                                                                                                                     
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                 
    function MINT301(address account, uint256 amount) public ONLYMINTER277 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT32(account, amount);
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

                                                                        
    function CAP293() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

                                                                                                                                                             
    function _MINT32(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(TOTALSUPPLY840().ADD262(value) <= _cap, "ERC20Capped: cap exceeded");
        super._MINT32(account, value);
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20Burnable.sol

                                                                                                                                                                                                                
contract ERC20Burnable is Context, ERC20 {
                                                                                                      
    function BURN630(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN118(_MSGSENDER382(), amount);
    }

                                                  
    function BURNFROM508(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURNFROM365(account, amount);
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED421(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER382();
        emit OWNERSHIPTRANSFERRED421(address(0), _owner);
    }

                                                                     
    function OWNER690() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER453() {	//inject NONSTANDARD NAMING
        require(ISOWNER380(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER380() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER382() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP715() public ONLYOWNER453 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED421(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP41(address newOwner) public ONLYOWNER453 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP812(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP812(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED421(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: eth-token-recover/contracts/TokenRecover.sol

                                                                                                                                                                  
contract TokenRecover is Ownable {

                                                                                                                                                                                                                                             
    function RECOVERERC20618(address tokenAddress, uint256 tokenAmount) public ONLYOWNER453 {	//inject NONSTANDARD NAMING
        IERC20(tokenAddress).TRANSFER854(OWNER690(), tokenAmount);
    }
}

// File: ico-maker/contracts/access/roles/OperatorRole.sol

contract OperatorRole {
    using Roles for Roles.Role;

    event OPERATORADDED633(address indexed account);	//inject NONSTANDARD NAMING
    event OPERATORREMOVED46(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _operators;

    constructor() internal {
        _ADDOPERATOR906(msg.sender);
    }

    modifier ONLYOPERATOR496() {	//inject NONSTANDARD NAMING
        require(ISOPERATOR424(msg.sender));
        _;
    }

    function ISOPERATOR424(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _operators.HAS572(account);
    }

    function ADDOPERATOR461(address account) public ONLYOPERATOR496 {	//inject NONSTANDARD NAMING
        _ADDOPERATOR906(account);
    }

    function RENOUNCEOPERATOR991() public {	//inject NONSTANDARD NAMING
        _REMOVEOPERATOR258(msg.sender);
    }

    function _ADDOPERATOR906(address account) internal {	//inject NONSTANDARD NAMING
        _operators.ADD262(account);
        emit OPERATORADDED633(account);
    }

    function _REMOVEOPERATOR258(address account) internal {	//inject NONSTANDARD NAMING
        _operators.REMOVE159(account);
        emit OPERATORREMOVED46(account);
    }
}

// File: ico-maker/contracts/token/ERC20/BaseERC20Token.sol

                                                                                                                                             
contract BaseERC20Token is ERC20Detailed, ERC20Capped, ERC20Burnable, OperatorRole, TokenRecover {

    event MINTFINISHED216();	//inject NONSTANDARD NAMING
    event TRANSFERENABLED33();	//inject NONSTANDARD NAMING

    // indicates if minting is finished
    bool private _mintingFinished = false;

    // indicates if transfer is enabled
    bool private _transferEnabled = false;

                                                                              
    modifier CANMINT467() {	//inject NONSTANDARD NAMING
        require(!_mintingFinished);
        _;
    }

                                                                                                                  
    modifier CANTRANSFER614(address from) {	//inject NONSTANDARD NAMING
        require(_transferEnabled || ISOPERATOR424(from));
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
            _MINT32(OWNER690(), initialSupply);
        }
    }

                                                             
    function MINTINGFINISHED647() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _mintingFinished;
    }

                                                             
    function TRANSFERENABLED80() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _transferEnabled;
    }

                                                                                                                                                                                                                                                
    function MINT301(address to, uint256 value) public CANMINT467 returns (bool) {	//inject NONSTANDARD NAMING
        return super.MINT301(to, value);
    }

                                                                                                                                                                                                                                         
    function TRANSFER854(address to, uint256 value) public CANTRANSFER614(msg.sender) returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER854(to, value);
    }

                                                                                                                                                                                                                                                                                                                                                                 
    function TRANSFERFROM540(address from, address to, uint256 value) public CANTRANSFER614(from) returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM540(from, to, value);
    }

                                                                
    function FINISHMINTING777() public ONLYOWNER453 CANMINT467 {	//inject NONSTANDARD NAMING
        _mintingFinished = true;

        emit MINTFINISHED216();
    }

                                                     
    function ENABLETRANSFER240() public ONLYOWNER453 {	//inject NONSTANDARD NAMING
        _transferEnabled = true;

        emit TRANSFERENABLED33();
    }

                                                                                                                         
    function REMOVEOPERATOR670(address account) public ONLYOWNER453 {	//inject NONSTANDARD NAMING
        _REMOVEOPERATOR258(account);
    }

                                                                                                                       
    function REMOVEMINTER741(address account) public ONLYOWNER453 {	//inject NONSTANDARD NAMING
        _REMOVEMINTER244(account);
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
            ENABLETRANSFER240();
        }
    }
}