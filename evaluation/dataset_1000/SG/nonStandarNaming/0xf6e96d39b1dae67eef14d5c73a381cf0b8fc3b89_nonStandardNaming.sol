pragma solidity ^0.5.2;
contract ERC20 {
    function TOTALSUPPLY866() public  returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF171(address tokenOwner) public view  returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE455(address tokenOwner, address spender) public  returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER980(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE170(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM105(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    event TRANSFER743(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL726(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

contract future1ex
 {
    address public adminaddr; 
    address public useraddr; 
    mapping (address => mapping(address => uint256)) public dep_token;
    mapping (address => uint256) public dep_ETH;

 
    constructor() public
    {
         adminaddr = msg.sender; 
    }
    
    function SAFEADD152(uint crtbal, uint depbal) public pure returns (uint) 	//inject NONSTANDARD NAMING
    {
        uint totalbal = crtbal + depbal;
        return totalbal;
    }
    
    function SAFESUB180(uint crtbal, uint depbal) public pure returns (uint) 	//inject NONSTANDARD NAMING
    {
        uint totalbal = crtbal - depbal;
        return totalbal;
    }
        
    function BALANCEOF171(address token,address user) public view returns(uint256)            // show bal of perticular token in user add	//inject NONSTANDARD NAMING
    {
        return ERC20(token).BALANCEOF171(user);
    }
    
    function TRANSFER980(address token, uint256 tokens)public payable                         // deposit perticular token balance to contract address (site address), can depoit multiple token   	//inject NONSTANDARD NAMING
    {
        ERC20(token).TRANSFERFROM105(msg.sender, address(this), tokens);
        dep_token[msg.sender][token] = SAFEADD152(dep_token[msg.sender][token] , tokens);
        
    }
    
     function ADMIN_TOKEN_WITHDRAW632(address token, address to, uint256 tokens)public payable  // withdraw perticular token balance from contract to user    	//inject NONSTANDARD NAMING
    {
        if(adminaddr==msg.sender)
        {                                                              // here only admin can withdraw token                    
            if(dep_token[to][token]>=tokens) 
            {
                dep_token[to][token] = SAFESUB180(dep_token[to][token] , tokens) ;   
                ERC20(token).TRANSFER980(to, tokens);
            }
        }
    }
    
    function TOK_BAL_CONTRACT914(address token) public view returns(uint256)                       // show balance of contract address	//inject NONSTANDARD NAMING
    {
        return ERC20(token).BALANCEOF171(address(this));
    }
    
 
    function DEPOSITETH789() payable external                                                      // this function deposit eth in contract address	//inject NONSTANDARD NAMING
 
    { 
        dep_ETH[msg.sender] = SAFEADD152(dep_ETH[msg.sender] , msg.value);
    }
    
    function ADMIN_WITHDRAWETH501(address payable to, uint256 value) public payable returns (bool)  // this will withdraw eth from contract  to address(to)	//inject NONSTANDARD NAMING
    {
        
        if(adminaddr==msg.sender)
        {                                                               // only admin can withdraw ETH from user
            if(dep_ETH[msg.sender]>=value) 
             {
                 dep_ETH[to]= SAFESUB180(dep_ETH[to] , value);    
                 to.transfer(value);
                 return true;
             }
         }
    }
}
    

//0xef2d4d6fa3dd517abb4f713aa64834a898f6dcaa