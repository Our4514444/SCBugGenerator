/**
 *Submitted for verification at Etherscan.io on 2020-01-18
*/

pragma solidity ^0.5.2;	//inject UNLIMITED COMPILER VERSIONS

// LEE is a digital escrow program in beta. Use at your own risk. || lexDAO ||

contract lexDAOetherEscrow {
    
    address payable public buyer;
    address payable public seller;
    address payable public arbitrator;
    uint256 public price;
    string public details;
    string public complaint;
    bool public disputed;
    bool public closed;
    
    event Released(uint256 indexed price);
    event Disputed(address indexed complainant);
    event Resolved(uint256 indexed buyerAward, uint256 indexed sellerAward);
    
    constructor(
        address payable _buyer,
        address payable _seller,
        address payable _arbitrator,
        string memory _details) payable public {
        buyer = _buyer;
        seller = _seller;
        arbitrator = _arbitrator;
        price = msg.value;
        details = _details;
    }
    
    function release() public {
        require(msg.sender == buyer);
        require(disputed == false);
        address(seller).transfer(price);
        closed = true;
        emit Released(price);
    }
    
    function dispute(string memory _complaint) public {
        require(msg.sender == buyer || msg.sender == seller);
        require(closed == false);
        disputed = true;
        complaint = _complaint;
        emit Disputed(msg.sender);
    }
    
    function resolve(uint256 buyerAward, uint256 sellerAward) public {
        require(msg.sender == arbitrator);
        require(disputed == true);
        uint256 arbFee = price / 20;
        require(buyerAward + sellerAward + arbFee == price);
        address(buyer).transfer(buyerAward);
        address(seller).transfer(sellerAward);
        address(arbitrator).transfer(arbFee);
        closed = true;
        emit Resolved(buyerAward, sellerAward);
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract lexDAOetherEscrowFactory {
    
    uint8 public LEEversion = 2;
    
    address payable public arbitrator = 0x97103fda00a2b47EaC669568063C00e65866a633; // lexDAO Agent
    
    lexDAOetherEscrow private LEE;
    
    address[] public escrows;
    
    event Deployed(
        address indexed lexDAOetherEscrow, 
        address indexed _buyer, 
        address indexed _seller);
        
    event ArbUpdated(address indexed newArb);
    
    function newLEE(
        address payable _seller, 
        string memory _details) payable public {
        require(arbitrator != address(0));
           
        LEE = (new lexDAOetherEscrow).value(msg.value)(
            msg.sender,
            _seller,
            arbitrator,
            _details);
        
        escrows.push(address(LEE));
        
        emit Deployed(address(LEE), msg.sender, _seller);

    }
    
    function getEscrowCount() public view returns (uint256 escrowCount) {
        return escrows.length;
    }
    
    function updateArbitrator(address payable newArb) public {
        require(msg.sender == arbitrator);
        arbitrator = newArb;
        
        emit ArbUpdated(newArb);
    }
}