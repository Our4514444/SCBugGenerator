pragma solidity ^0.5.7;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               



 contract Ownable {
     address private _owner;

     event OWNERSHIPTRANSFERRED854(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                               
     constructor () internal {
         _owner = msg.sender;
         emit OWNERSHIPTRANSFERRED854(address(0), _owner);
     }

                                                           
     function OWNER838() public view returns (address) {	//inject NONSTANDARD NAMING
         return _owner;
     }

                                                                                    
     modifier ONLYOWNER642() {	//inject NONSTANDARD NAMING
         require(ISOWNER902());
         _;
     }

                                                                                    
     function ISOWNER902() public view returns (bool) {	//inject NONSTANDARD NAMING
         return msg.sender == _owner;
     }

                                                                                                                                                                                                                                                                                                                                                                  
     function RENOUNCEOWNERSHIP776() public ONLYOWNER642 {	//inject NONSTANDARD NAMING
         emit OWNERSHIPTRANSFERRED854(_owner, address(0));
         _owner = address(0);
     }

                                                                                                                                                                        
     function TRANSFEROWNERSHIP873(address newOwner) public ONLYOWNER642 {	//inject NONSTANDARD NAMING
         _TRANSFEROWNERSHIP708(newOwner);
     }

                                                                                                                                             
     function _TRANSFEROWNERSHIP708(address newOwner) internal {	//inject NONSTANDARD NAMING
         require(newOwner != address(0));
         emit OWNERSHIPTRANSFERRED854(_owner, newOwner);
         _owner = newOwner;
     }
 }



 contract Pausable is Ownable {
   event PAUSE227();	//inject NONSTANDARD NAMING
   event UNPAUSE352();	//inject NONSTANDARD NAMING

   bool public paused = false;


                                                                                                   
   modifier WHENNOTPAUSED793() {	//inject NONSTANDARD NAMING
     require(!paused);
     _;
   }

                                                                                               
   modifier WHENPAUSED996() {	//inject NONSTANDARD NAMING
     require(paused);
     _;
   }

                                                                             
   function PAUSE576() ONLYOWNER642 WHENNOTPAUSED793 public {	//inject NONSTANDARD NAMING
     paused = true;
     emit PAUSE227();
   }

                                                                                
   function UNPAUSE224() ONLYOWNER642 WHENPAUSED996 public {	//inject NONSTANDARD NAMING
     paused = false;
     emit UNPAUSE352();
   }
 }


contract IERC20 {
    function TRANSFER442(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE776(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM589(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY399() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF475(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE432(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER353(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL246(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) public _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 public totalSupply;


                                                                                                                                                                                                             
    function BALANCEOF475(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE432(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER442(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER119(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE776(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE127(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM589(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER119(from, to, value);
        _APPROVE127(from, msg.sender, _allowed[from][msg.sender].SUB862(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE382(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE127(msg.sender, spender, _allowed[msg.sender][spender].ADD526(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE964(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE127(msg.sender, spender, _allowed[msg.sender][spender].SUB862(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER119(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB862(value);
        _balances[to] = _balances[to].ADD526(value);
        emit TRANSFER353(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT488(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        totalSupply = totalSupply.ADD526(value);
        _balances[account] = _balances[account].ADD526(value);
        emit TRANSFER353(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN349(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        totalSupply = totalSupply.SUB862(value);
        _balances[account] = _balances[account].SUB862(value);
        emit TRANSFER353(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE127(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL246(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM964(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN349(account, value);
        _APPROVE127(account, msg.sender, _allowed[account][msg.sender].SUB862(value));
    }

}




contract ERC20Pausable is ERC20, Pausable {
    function TRANSFER442(address to, uint256 value) public WHENNOTPAUSED793 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER442(to, value);
    }

    function TRANSFERFROM589(address from, address to, uint256 value) public WHENNOTPAUSED793 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM589(from, to, value);
    }

    function APPROVE776(address spender, uint256 value) public WHENNOTPAUSED793 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE776(spender, value);
    }

    function INCREASEALLOWANCE382(address spender, uint addedValue) public WHENNOTPAUSED793 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE382(spender, addedValue);
    }

    function DECREASEALLOWANCE964(address spender, uint subtractedValue) public WHENNOTPAUSED793 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE964(spender, subtractedValue);
    }
}






contract SRHcontract is Pausable {
  using SafeMath for uint256;

  mapping(address => uint256) _balances;

  mapping (address => mapping (address => uint256)) internal allowed;

  // the token being sold
  SRHToken public token;
  uint256 constant public tokendecimals486 = 18;	//inject NONSTANDARD NAMING

  // totalSupply
  uint256 public totalSupply = 1500000000 * (10 ** uint256(tokendecimals486));

  // to send tokens to
  address constant public walletoriginal124 = 0x56Cd3Ee680751D173743DB943E84Cfec5D5E17C5;	//inject NONSTANDARD NAMING



  constructor () public {

    token = CREATETOKENCONTRACT125();
    token.UNPAUSE224();
    token.TRANSFER442(walletoriginal124, totalSupply);



  }



  //
  // Token related operations
  //

  // creates the token to be sold.
  // override this method to have crowdsale of a specific mintable token.
  function CREATETOKENCONTRACT125() internal returns (SRHToken) {	//inject NONSTANDARD NAMING
    return new SRHToken();
  }

  // enable token transferability
  function ENABLETOKENTRANSFERABILITY325() external ONLYOWNER642 {	//inject NONSTANDARD NAMING
    token.UNPAUSE224();
  }

  // disable token transferability
  function DISABLETOKENTRANSFERABILITY707() external ONLYOWNER642 {	//inject NONSTANDARD NAMING
    token.PAUSE576();
  }


}





contract SRHToken is ERC20Pausable {
  string constant public name97 = "SRH";	//inject NONSTANDARD NAMING
  string constant public symbol33 = "SRH";	//inject NONSTANDARD NAMING
  uint256 constant public decimals109 = 18;	//inject NONSTANDARD NAMING
  uint256 constant token_unit588 = 10 ** uint256(decimals109);	//inject NONSTANDARD NAMING
  uint256 constant initial_supply172 = 1500000000 * token_unit588;	//inject NONSTANDARD NAMING


  constructor () public {
    // Set untransferable by default to the token
    paused = true;
    // asign all tokens to the contract creator
    totalSupply = initial_supply172;

    _balances[msg.sender] = initial_supply172;
  }

}



library SafeMath {
                                                                                
    function MUL839(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV396(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB862(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD526(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD341(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}