                                                                 

// File: contracts/refund/IAlphaJobsManager.sol

pragma solidity ^0.5.11;


contract IAlphaJobsManager {
    function BROADCASTERS496(address _broadcaster) public view returns (uint256 deposit, uint256 withdrawBlock);	//inject NONSTANDARD NAMING
}

// File: contracts/refund/Refunder.sol

pragma solidity ^0.5.11;



contract Refunder {
    // Reference to alpha JobsManager
    IAlphaJobsManager public alphaJobsManager;

    // Keeps track of addresses that have withdrawn their refund
    mapping (address => bool) public withdrawn;

    event FUNDSRECEIVED244(address from, uint256 amount);	//inject NONSTANDARD NAMING
    event REFUNDWITHDRAWN796(address indexed addr, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                    
    constructor(address _alphaJobsManagerAddr) public {
        alphaJobsManager = IAlphaJobsManager(_alphaJobsManagerAddr);
    }

                                                          
    function() external payable {
        emit FUNDSRECEIVED244(msg.sender, msg.value);
    }

                                                                                                                                           
    function WITHDRAW332(address payable _addr) external {	//inject NONSTANDARD NAMING
        require(
            !withdrawn[_addr],
            "address has already withdrawn alpha JobsManager refund"
        );

        (uint256 deposit,) = alphaJobsManager.BROADCASTERS496(_addr);

        require(
            deposit > 0,
            "address does not have a deposit with alpha JobsManager"
        );

        withdrawn[_addr] = true;

        _addr.transfer(deposit);

        emit REFUNDWITHDRAWN796(_addr, deposit);
    }
}