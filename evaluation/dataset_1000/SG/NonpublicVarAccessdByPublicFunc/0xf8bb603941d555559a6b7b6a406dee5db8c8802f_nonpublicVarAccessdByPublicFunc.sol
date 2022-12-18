/**
 *Submitted for verification at Etherscan.io on 2020-01-18
*/

pragma solidity ^0.5.2;

// LEE is a digital escrow program in beta. Use at your own risk. || lexDAO ||

contract lexDAOetherEscrow {
    
    address payable internal buyer;
    address payable internal seller;
    address payable internal arbitrator;
    uint256 internal price;
    string public details;
    string internal complaint;
    bool internal disputed;
    bool internal closed;
    
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
        require(msg.sender == buyer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(disputed == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        address(seller).transfer(price);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        closed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Released(price);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function dispute(string memory _complaint) public {
        require(msg.sender == buyer || msg.sender == seller);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(closed == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        disputed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        complaint = _complaint;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Disputed(msg.sender);
    }
    
    function resolve(uint256 buyerAward, uint256 sellerAward) public {
        require(msg.sender == arbitrator);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(disputed == true);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint256 arbFee = price / 20;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(buyerAward + sellerAward + arbFee == price);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        address(buyer).transfer(buyerAward);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        address(seller).transfer(sellerAward);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        address(arbitrator).transfer(arbFee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        closed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Resolved(buyerAward, sellerAward);
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract lexDAOetherEscrowFactory {
    
    uint8 public LEEversion = 2;
    
    address payable internal arbitrator = 0x97103fda00a2b47EaC669568063C00e65866a633; // lexDAO Agent
    
    lexDAOetherEscrow private LEE;
    
    address[] internal escrows;
    
    event Deployed(
        address indexed lexDAOetherEscrow, 
        address indexed _buyer, 
        address indexed _seller);
        
    event ArbUpdated(address indexed newArb);
    
    function newLEE(
        address payable _seller, 
        string memory _details) payable public {
        require(arbitrator != address(0));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
           
        LEE = (new lexDAOetherEscrow).value(msg.value)(	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            msg.sender,
            _seller,
            arbitrator,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            _details);
        
        escrows.push(address(LEE));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit Deployed(address(LEE), msg.sender, _seller);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    }
    
    function getEscrowCount() public view returns (uint256 escrowCount) {
        return escrows.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function updateArbitrator(address payable newArb) public {
        require(msg.sender == arbitrator);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        arbitrator = newArb;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit ArbUpdated(newArb);
    }
}