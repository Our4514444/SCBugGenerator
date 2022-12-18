pragma solidity ^0.5.0;

contract freedomStatement {
    
    string public statement = "https://ipfs.globalupload.io/QmeeFwpnMk9CaXHZYv4Hn1FFD2MT7kxZ7TNnT9JfZqTzUM";
    mapping (address => bool) public checkconsent;
    event WEAREHERE246(string statement);	//inject NONSTANDARD NAMING
    uint public signAmounts;
    
    constructor () public {
        emit WEAREHERE246(statement);
    }
        
    function ISHUMAN301(address addr) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint size;
        assembly { size := extcodesize(addr) }
        return size == 0;
    }

    function () external payable {
        require(ISHUMAN301(msg.sender),"no robot");//Don't want to use tx.origin because that will cause an interoperability problem
        require(msg.value< 0.0000001 ether);//don't give me money, for metamask no error
        require(checkconsent[msg.sender] == false,"You have already signed up");
        checkconsent[msg.sender] = true;
        signAmounts++;
    }

}