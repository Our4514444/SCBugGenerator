                                                                 

pragma solidity ^0.5.2;

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
    
    event RELEASED87(uint256 indexed price);	//inject NONSTANDARD NAMING
    event DISPUTED953(address indexed complainant);	//inject NONSTANDARD NAMING
    event RESOLVED630(uint256 indexed buyerAward, uint256 indexed sellerAward);	//inject NONSTANDARD NAMING
    
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
    
    function RELEASE340() public {	//inject NONSTANDARD NAMING
        require(msg.sender == buyer);
        require(disputed == false);
        address(seller).transfer(price);
        closed = true;
        emit RELEASED87(price);
    }
    
    function DISPUTE246(string memory _complaint) public {	//inject NONSTANDARD NAMING
        require(msg.sender == buyer || msg.sender == seller);
        require(closed == false);
        disputed = true;
        complaint = _complaint;
        emit DISPUTED953(msg.sender);
    }
    
    function RESOLVE115(uint256 buyerAward, uint256 sellerAward) public {	//inject NONSTANDARD NAMING
        require(msg.sender == arbitrator);
        require(disputed == true);
        uint256 arbFee = price / 20;
        require(buyerAward + sellerAward + arbFee == price);
        address(buyer).transfer(buyerAward);
        address(seller).transfer(sellerAward);
        address(arbitrator).transfer(arbFee);
        closed = true;
        emit RESOLVED630(buyerAward, sellerAward);
    }
    
    function GETBALANCE498() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return address(this).balance;
    }
}

contract lexDAOetherEscrowFactory {
    
    uint8 public LEEversion = 2;
    
    address payable public arbitrator = 0x97103fda00a2b47EaC669568063C00e65866a633; // lexDAO Agent
    
    lexDAOetherEscrow private LEE;
    
    address[] public escrows;
    
    event DEPLOYED356(	//inject NONSTANDARD NAMING
        address indexed lexDAOetherEscrow, 
        address indexed _buyer, 
        address indexed _seller);
        
    event ARBUPDATED263(address indexed newArb);	//inject NONSTANDARD NAMING
    
    function NEWLEE191(	//inject NONSTANDARD NAMING
        address payable _seller, 
        string memory _details) payable public {
        require(arbitrator != address(0));
           
        LEE = (new lexDAOetherEscrow).value(msg.value)(
            msg.sender,
            _seller,
            arbitrator,
            _details);
        
        escrows.push(address(LEE));
        
        emit DEPLOYED356(address(LEE), msg.sender, _seller);

    }
    
    function GETESCROWCOUNT612() public view returns (uint256 escrowCount) {	//inject NONSTANDARD NAMING
        return escrows.length;
    }
    
    function UPDATEARBITRATOR94(address payable newArb) public {	//inject NONSTANDARD NAMING
        require(msg.sender == arbitrator);
        arbitrator = newArb;
        
        emit ARBUPDATED263(newArb);
    }
}