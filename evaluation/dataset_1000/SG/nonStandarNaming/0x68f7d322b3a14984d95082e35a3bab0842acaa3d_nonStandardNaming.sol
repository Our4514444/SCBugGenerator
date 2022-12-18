                                                                 

pragma solidity ^0.5.2;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD228(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS996(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE485(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS996(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS996(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED69(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED69(address(0), _owner);
    }

                                                        
    function OWNER165() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER72() {	//inject NONSTANDARD NAMING
        require(ISOWNER221());
        _;
    }

                                                                                 
    function ISOWNER221() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP574() public ONLYOWNER72 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED69(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP350(address newOwner) public ONLYOWNER72 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP161(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP161(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED69(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/whitelist/IWhitelist.sol

pragma solidity ^0.5.0;


// Interface to be implemented by the Whitelist contract.
contract IWhitelist {
    function ISWHITELISTED807(address account) public view returns (bool);	//inject NONSTANDARD NAMING
}

// File: contracts/whitelist/Blacklist.sol

pragma solidity ^0.5.0;

contract Blacklist is IWhitelist, Ownable {
    using Roles for Roles.Role;

    event BLACKLISTADDED647(address indexed account);	//inject NONSTANDARD NAMING
    event BLACKLISTREMOVED638(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _blacklisted;

//    function addBlacklisted(address account) public onlyOwner {
//        _blacklisted.add(account);
//    }

    function REMOVEBLACKLISTED338(address account) public ONLYOWNER72 {	//inject NONSTANDARD NAMING
        _blacklisted.REMOVE485(account);
    }

    function ISWHITELISTED807(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return !_blacklisted.HAS996(account);
    }
}