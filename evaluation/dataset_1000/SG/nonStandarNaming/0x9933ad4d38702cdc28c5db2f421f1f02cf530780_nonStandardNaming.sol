                                                                 

pragma solidity 0.5.16;

contract Ownable {
    address public owner;
    address public newOwner;

    event OWNERSHIPTRANSFERRED412(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER513() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "permission denied");
        _;
    }

    function TRANSFEROWNERSHIP376(address _newOwner) public ONLYOWNER513 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Owner should not be 0 address");
        require(_newOwner != owner, "The current and new owner cannot be the same");
        require(_newOwner != newOwner, "Cannot set the candidate owner to the same address");
        newOwner = _newOwner;
    }

    function ACCEPTOWNERSHIP934() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner, "msg.sender and _newOwner must be the same");
        emit OWNERSHIPTRANSFERRED412(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}


contract InsuranceImprovementProposalProxy is Ownable {

    address payable public IIP = address(0x616305e016B0539B8A550c9ECafe66BDb88956b2);

    modifier ISHUMAN827() {	//inject NONSTANDARD NAMING
        require(msg.sender == tx.origin, "sorry humans only");
        _;
    }

    function FORWARD724() external ISHUMAN827() {	//inject NONSTANDARD NAMING
        address payable self = address(uint160(address(this)));
        address payable sender = msg.sender;

        (bool pass, ) = sender.call.value(self.balance / 200)(""); // 0.5% rebate
        (bool success, ) = IIP.call.value(self.balance)("");
        require(pass && success, "something went wrong");
    }

    function NEWIIP955(address payable _IIP) external ONLYOWNER513 {	//inject NONSTANDARD NAMING
        IIP =_IIP;
    }
}

contract Exchange {
    function TRADE208(	//inject NONSTANDARD NAMING
        address src,
        uint256 srcAmount,
        address dest,
        address destAddress,
        uint256 maxDestAmount,
        uint256 minConversionRate,
        address walletId
    ) public payable returns (uint256);
}

contract InsuranceImprovementProposal {
    Exchange constant kyberex770 = Exchange(0x818E6FECD516Ecc3849DAf6845e3EC868087B755);	//inject NONSTANDARD NAMING
    address constant etheraddr460 = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;	//inject NONSTANDARD NAMING
    address constant bank188 = 0x83D0D842e6DB3B020f384a2af11bD14787BEC8E7;	//inject NONSTANDARD NAMING

    function() external payable {
        kyberex770.TRADE208.value(msg.value)(
            etheraddr460,
            msg.value,
            0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2, //MKR address
            bank188,
            10e28,
            1,
            bank188
        );
    }
}