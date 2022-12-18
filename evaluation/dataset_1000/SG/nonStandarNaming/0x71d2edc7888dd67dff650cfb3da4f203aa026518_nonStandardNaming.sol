pragma solidity ^0.5.2;
contract ERC20 {
    function TOTALSUPPLY688() public  returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF838(address tokenOwner) public view  returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE134(address tokenOwner, address spender) public  returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER79(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE834(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM340(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    event TRANSFER806(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL709(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

contract future1new
 {
    address public adminaddr; 
    address public useraddr; 
    mapping (address => mapping(address => uint256)) public dep_token;


 
    constructor() public
    {
         adminaddr = msg.sender; 
    }
    
    function SAFEADD29(uint crtbal, uint depbal) public pure returns (uint) 	//inject NONSTANDARD NAMING
    {
        uint totalbal = crtbal + depbal;
        return totalbal;
    }
    
    function SAFESUB508(uint crtbal, uint depbal) public pure returns (uint) 	//inject NONSTANDARD NAMING
    {
        uint totalbal = crtbal - depbal;
        return totalbal;
    }
        
    function BALANCEOF838(address token,address user) public view returns(uint256)            // show bal of perticular token in user add	//inject NONSTANDARD NAMING
    {
        return ERC20(token).BALANCEOF838(user);
    }
    
    function TRANSFER79(address token, uint256 tokens)public payable                         // deposit perticular token balance to contract address (site address), can depoit multiple token   	//inject NONSTANDARD NAMING
    {
        ERC20(token).TRANSFERFROM340(msg.sender, address(this), tokens);
        dep_token[msg.sender][token] = SAFEADD29(dep_token[msg.sender][token] , tokens);
        
    }
    
     function ADMIN_TOKEN_WITHDRAW592(address token, address to, uint256 tokens)public payable  // withdraw perticular token balance from contract to user    	//inject NONSTANDARD NAMING
    {
        if(adminaddr==msg.sender)
        {                                                              // here only admin can withdraw token                    
            if(dep_token[to][token]>=tokens) 
            {
                dep_token[to][token] = SAFESUB508(dep_token[to][token] , tokens) ;   
                ERC20(token).TRANSFER79(to, tokens);
            }
        }
    }
    
    function TOK_BAL_CONTRACT2(address token) public view returns(uint256)                       // show balance of contract address	//inject NONSTANDARD NAMING
    {
        return ERC20(token).BALANCEOF838(address(this));
    }
    
 
    function DEPOSITETH794() payable external                                                      // this function deposit eth in contract address	//inject NONSTANDARD NAMING
 
    { 
        
    }
    
    function ADMIN_WITHDRAWETH535(address payable to, uint256 value) public payable returns (bool)  // this will withdraw eth from contract  to address(to)	//inject NONSTANDARD NAMING
    {
        
        if(adminaddr==msg.sender)
        {                                                               // only admin can withdraw ETH from user
            
   
                 to.transfer(value);
                 return true;

         }
    }
}