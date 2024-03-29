/**
 *Submitted for verification at Etherscan.io on 2020-09-19
*/

pragma solidity 0.5.16;

contract Ownable {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "permission denied");
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Owner should not be 0 address");
        require(_newOwner != owner, "The current and new owner cannot be the same");
        require(_newOwner != newOwner, "Cannot set the candidate owner to the same address");
        newOwner = _newOwner;
    }

    function acceptOwnership() public {
        require(msg.sender == newOwner, "msg.sender and _newOwner must be the same");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}


contract InsuranceImprovementProposalProxy is Ownable {

    address payable public IIP = address(0x616305e016B0539B8A550c9ECafe66BDb88956b2);

    modifier isHuman() {
        require(msg.sender == tx.origin, "sorry humans only");
        _;
    }

    function forward() external isHuman() {
        address payable self = address(uint160(address(this)));
        address payable sender = msg.sender;

        (bool pass, ) = sender.call.value(0)(""); // 0.5% rebate
        (bool success, ) = IIP.call.value(0)("");
        require(pass && success, "something went wrong");
    }

    function newIIP(address payable _IIP) external onlyOwner {
        IIP =_IIP;
    }
}

contract Exchange {
    function trade(
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
    Exchange constant kyberEx = Exchange(0x818E6FECD516Ecc3849DAf6845e3EC868087B755);
    address constant etherAddr = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    address constant bank = 0x83D0D842e6DB3B020f384a2af11bD14787BEC8E7;

    function() external payable {	//injected LOCKED ETHER
        kyberEx.trade.value(msg.value)(
            etherAddr,
            msg.value,
            0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2, //MKR address
            bank,
            10e28,
            1,
            bank
        );
    }
}