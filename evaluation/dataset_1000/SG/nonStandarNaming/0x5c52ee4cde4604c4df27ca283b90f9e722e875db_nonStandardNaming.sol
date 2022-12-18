pragma solidity ^0.5.10;

                                                                                                                                                                                                                              

library SafeMath {
    function ADD60(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }

    function SUB788(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a);
        c = a - b;
    }

    function MUL398(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }

    function DIV460(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED511(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED511(address(0), _owner);
    }

                                                                     
    function OWNER820() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER728() {	//inject NONSTANDARD NAMING
        require(ISOWNER483(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER483() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP500() public ONLYOWNER728 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED511(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP817(address newOwner) public ONLYOWNER728 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP725(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP725(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED511(_owner, newOwner);
        _owner = newOwner;
    }
}


contract ERC20Interface {
    function TOTALSUPPLY134() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF7(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE299(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER81(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE692(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM77(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    event TRANSFER418(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL193(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

contract ERC918Interface {
  function TOTALSUPPLY134() public view returns (uint);	//inject NONSTANDARD NAMING
  function GETMININGDIFFICULTY401() public view returns (uint);	//inject NONSTANDARD NAMING
  function GETMININGTARGET307() public view returns (uint);	//inject NONSTANDARD NAMING
  function GETMININGREWARD506() public view returns (uint);	//inject NONSTANDARD NAMING
  function BALANCEOF7(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING

  function MINT629(uint256 nonce, bytes32 challenge_digest) public returns (bool success);	//inject NONSTANDARD NAMING

  event MINT931(address indexed from, uint reward_amount, uint epochCount, bytes32 newChallengeNumber);	//inject NONSTANDARD NAMING
}

                                                                                                                 
contract MintHelper is Ownable {
   using SafeMath for uint;

    string public name;
    address public mintableToken;
    mapping(bytes32 => bool) successfulPayments;

    constructor(address mToken, string memory mName)
    public
    {
      mintableToken = mToken;
      name = mName;
    }

    function SETMINTABLETOKEN370(address mToken)	//inject NONSTANDARD NAMING
    public ONLYOWNER728
    returns (bool)
    {
      mintableToken = mToken;
      return true;
    }

    function PAYMENTSUCCESSFUL232(bytes32 paymentId) public view returns (bool){	//inject NONSTANDARD NAMING
        return (successfulPayments[paymentId] == true);
    }
    
    function PROXYMINT690(uint256 nonce, bytes32 challenge_digest )	//inject NONSTANDARD NAMING
    public
    returns (bool)
    {
      require(ERC918Interface(mintableToken).MINT629(nonce, challenge_digest), "Could not mint token");
      return true;
    }

    //withdraw any eth inside
    function WITHDRAW633()	//inject NONSTANDARD NAMING
    public ONLYOWNER728
    {
        msg.sender.transfer(address(this).balance);
    }

    //send tokens out
    function SEND371(address _tokenAddr, address dest, uint value)	//inject NONSTANDARD NAMING
    public ONLYOWNER728
    returns (bool)
    {
     return ERC20Interface(_tokenAddr).TRANSFER81(dest, value);
    }

    //batch send tokens
    function MULTISEND134(address _tokenAddr, bytes32 paymentId, address[] memory dests, uint256[] memory values)	//inject NONSTANDARD NAMING
    public ONLYOWNER728
    returns (uint256)
    {
        require(dests.length > 0, "Must have more than 1 destination address");
        require(values.length >= dests.length, "Address to Value array size mismatch");
        require(successfulPayments[paymentId] != true, "Payment ID already exists and was successful");

        uint256 i = 0;
        while (i < dests.length) {
           require(ERC20Interface(_tokenAddr).TRANSFER81(dests[i], values[i]));
           i += 1;
        }

        successfulPayments[paymentId] = true;
        return (i);
    }
}