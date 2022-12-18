pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER787(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE58(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM873(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY14() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF369(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE879(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER239(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL24(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                   
library SafeMath {
                                                                                  
    function MUL142(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV423(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB859(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD410(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD172(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}





                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY14() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF369(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE879(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER787(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER638(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE58(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE492(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM873(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER638(from, to, value);
        _APPROVE492(from, msg.sender, _allowed[from][msg.sender].SUB859(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE644(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE492(msg.sender, spender, _allowed[msg.sender][spender].ADD410(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE180(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE492(msg.sender, spender, _allowed[msg.sender][spender].SUB859(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER638(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB859(value);
        _balances[to] = _balances[to].ADD410(value);
        emit TRANSFER239(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT547(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD410(value);
        _balances[account] = _balances[account].ADD410(value);
        emit TRANSFER239(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN497(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB859(value);
        _balances[account] = _balances[account].SUB859(value);
        emit TRANSFER239(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE492(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL24(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM42(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN497(account, value);
        _APPROVE492(account, msg.sender, _allowed[account][msg.sender].SUB859(value));
    }
}


                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED610(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED610(address(0), _owner);
    }

                                                        
    function OWNER513() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER497() {	//inject NONSTANDARD NAMING
        require(ISOWNER744());
        _;
    }

                                                                                 
    function ISOWNER744() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP6() public ONLYOWNER497 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED610(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP979(address newOwner) public ONLYOWNER497 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP973(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP973(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED610(_owner, newOwner);
        _owner = newOwner;
    }
}




                                                                                                                                                                                                                                        
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME631() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL291() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS524() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}






contract ClickGemToken is ERC20, Ownable, ERC20Detailed {
	uint public initialSupply = 99000000000;
	mapping (address => uint256) public freezeList;
	

	mapping (address => LockItem[]) public lockList;
	
    struct LockItem {
		uint256  time;
		uint256  amount;
	}
	
	constructor() public ERC20Detailed("ClickGem Token", "CGMT", 18) 
	{  
		_MINT547(msg.sender, initialSupply*1000000000000000000);
	}

	function FREEZE890(address freezeAddress) public ONLYOWNER497 returns (bool done)	//inject NONSTANDARD NAMING
	{
		freezeList[freezeAddress]=1;
		return ISFREEZE824(freezeAddress);
    	}

	function UNFREEZE784(address freezeAddress) public ONLYOWNER497 returns (bool done)	//inject NONSTANDARD NAMING
	{
		delete freezeList[freezeAddress];
		return !ISFREEZE824(freezeAddress); 
	}

	function ISFREEZE824(address freezeAddress) public view returns (bool isFreezed) 	//inject NONSTANDARD NAMING
	{
		return freezeList[freezeAddress]==1;
	}



	function ISLOCKED457(address lockedAddress) public view returns (bool isLockedAddress)	//inject NONSTANDARD NAMING
	{
		if(lockList[lockedAddress].length>0)
		{
		    for(uint i=0; i< lockList[lockedAddress].length; i++)
		    {
		        if(lockList[lockedAddress][i].time - now > 0)
		        return true;
		    }
		}
		return false;
	}

	function TRANSFER787(address _receiver, uint256 _amount) public returns (bool success)	//inject NONSTANDARD NAMING
	{
		require(!ISFREEZE824(msg.sender));
	    if(!ISLOCKED457(_receiver)){
		    uint256 remain = BALANCEOF369(msg.sender).SUB859(_amount);
		    require(remain>=GETLOCKEDAMOUNT845(msg.sender));
		}
        return ERC20.TRANSFER787(_receiver, _amount);
	}

	function TRANSFERANDLOCK25(address _receiver, uint256 _amount, uint256 time) public returns (bool success)	//inject NONSTANDARD NAMING
	{
        TRANSFER787(_receiver, _amount);
    	LockItem memory item = LockItem({amount:_amount, time:time+now});
		lockList[_receiver].push(item);
        return true;
	}
	
	function GETLOCKEDLISTSIZE957(address lockedAddress) public view returns(uint256 _lenght)	//inject NONSTANDARD NAMING
	{
	    return lockList[lockedAddress].length;
	}
	
	function GETLOCKEDAMOUNTAT250(address lockedAddress, uint8 index) public view returns(uint256 _amount)	//inject NONSTANDARD NAMING
	{
	    return lockList[lockedAddress][index].amount;
	}
	
	function GETLOCKEDTIMEAT271(address lockedAddress, uint8 index) public view returns(uint256 _time)	//inject NONSTANDARD NAMING
	{
	    return lockList[lockedAddress][index].time.SUB859(now);
	}
	
	function GETLOCKEDAMOUNT845(address lockedAddress) public view returns(uint256 _amount)	//inject NONSTANDARD NAMING
	{
	    uint256 lockedAmount =0;
	    if(ISLOCKED457(lockedAddress))
	    {
	       for(uint8 j=0;j<lockList[lockedAddress].length;j++)
	       {
	        if(GETLOCKEDTIMEAT271(lockedAddress, j) > now )
	        {
	            lockedAmount=lockedAmount.ADD410(GETLOCKEDAMOUNTAT250(lockedAddress, j));
	        }
	       }
	    }
	    return lockedAmount;
	}


}