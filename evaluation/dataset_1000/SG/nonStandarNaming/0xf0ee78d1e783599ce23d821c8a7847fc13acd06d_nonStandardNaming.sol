pragma solidity ^0.5.2;

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED952(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED952(address(0), _owner);
    }

                                                        
    function OWNER926() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER172() {	//inject NONSTANDARD NAMING
        require(ISOWNER951());
        _;
    }

                                                                                 
    function ISOWNER951() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP104() public ONLYOWNER172 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED952(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP350(address newOwner) public ONLYOWNER172 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP428(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP428(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED952(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/whitelisting/MgnOwnableMock.sol

contract MgnOwnableMock is Ownable {

    // user => amount
    mapping (address => uint) public lockedTokenBalances;

    function LOCK791(uint256 _amount, address _beneficiary) public ONLYOWNER172 {	//inject NONSTANDARD NAMING
        lockedTokenBalances[_beneficiary] = _amount;
    }
}