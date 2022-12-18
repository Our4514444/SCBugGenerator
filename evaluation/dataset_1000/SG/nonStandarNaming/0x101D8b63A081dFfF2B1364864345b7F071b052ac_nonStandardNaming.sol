                                                                 

pragma solidity ^0.5.10;

                                            
contract NEST_NodeSave {
    IBMapping mappingContract;                      
    IBNEST nestContract;                             
    
                                                                                         
    constructor (address map) public {
        mappingContract = IBMapping(address(map));              
        nestContract = IBNEST(address(mappingContract.CHECKADDRESS618("nest")));            
    }
    
                                                                                           
    function CHANGEMAPPING639(address map) public ONLYOWNER592 {	//inject NONSTANDARD NAMING
        mappingContract = IBMapping(address(map));              
        nestContract = IBNEST(address(mappingContract.CHECKADDRESS618("nest")));            
    }
    
                                                                                                                                                                    
    function TURNOUT873(uint256 amount, address to) public ONLYMININGCALCULATION51 returns(uint256) {	//inject NONSTANDARD NAMING
        uint256 leftNum = nestContract.BALANCEOF436(address(this));
        if (leftNum >= amount) {
            nestContract.TRANSFER851(to, amount);
            return amount;
        } else {
            return 0;
        }
    }
    
    modifier ONLYOWNER592(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKOWNERS368(msg.sender) == true);
        _;
    }

    modifier ONLYMININGCALCULATION51(){	//inject NONSTANDARD NAMING
        require(address(mappingContract.CHECKADDRESS618("nodeAssignment")) == msg.sender);
        _;
    }
    
}

                                             
contract NEST_NodeAssignmentData {
    using SafeMath for uint256;
    IBMapping mappingContract;              
    uint256 nodeAllAmount = 0;                                 
    mapping(address => uint256) nodeLatestAmount;               
    
                                                                                         
    constructor (address map) public {
        mappingContract = IBMapping(map); 
    }
    
                                                                                           
    function CHANGEMAPPING639(address map) public ONLYOWNER592{	//inject NONSTANDARD NAMING
        mappingContract = IBMapping(map); 
    }
    
    //  Add nest
    function ADDNEST981(uint256 amount) public ONLYNODEASSIGNMENT648 {	//inject NONSTANDARD NAMING
        nodeAllAmount = nodeAllAmount.ADD822(amount);
    }
    
    //  View cumulative total
    function CHECKNODEALLAMOUNT977() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return nodeAllAmount;
    }
    
    //  Record last received quantity
    function ADDNODELATESTAMOUNT163(address add ,uint256 amount) public ONLYNODEASSIGNMENT648 {	//inject NONSTANDARD NAMING
        nodeLatestAmount[add] = amount;
    }
    
    //  View last received quantity
    function CHECKNODELATESTAMOUNT223(address add) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return nodeLatestAmount[address(add)];
    }
    
    modifier ONLYOWNER592(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKOWNERS368(msg.sender) == true);
        _;
    }
    
    modifier ONLYNODEASSIGNMENT648(){	//inject NONSTANDARD NAMING
        require(address(msg.sender) == address(mappingContract.CHECKADDRESS618("nodeAssignment")));
        _;
    }
}

                                          
contract NEST_NodeAssignment {
    
    using SafeMath for uint256;
    IBMapping mappingContract;  
    IBNEST nestContract;                                   
    SuperMan supermanContract;                              
    NEST_NodeSave nodeSave;
    NEST_NodeAssignmentData nodeAssignmentData;

                                                                                         
    constructor (address map) public {
        mappingContract = IBMapping(map); 
        nestContract = IBNEST(address(mappingContract.CHECKADDRESS618("nest")));
        supermanContract = SuperMan(address(mappingContract.CHECKADDRESS618("nestNode")));
        nodeSave = NEST_NodeSave(address(mappingContract.CHECKADDRESS618("nestNodeSave")));
        nodeAssignmentData = NEST_NodeAssignmentData(address(mappingContract.CHECKADDRESS618("nodeAssignmentData")));
    }
    
                                                                                           
    function CHANGEMAPPING639(address map) public ONLYOWNER592{	//inject NONSTANDARD NAMING
        mappingContract = IBMapping(map); 
        nestContract = IBNEST(address(mappingContract.CHECKADDRESS618("nest")));
        supermanContract = SuperMan(address(mappingContract.CHECKADDRESS618("nestNode")));
        nodeSave = NEST_NodeSave(address(mappingContract.CHECKADDRESS618("nestNodeSave")));
        nodeAssignmentData = NEST_NodeAssignmentData(address(mappingContract.CHECKADDRESS618("nodeAssignmentData")));
    }
    
                                                                                        
    function BOOKKEEPING962(uint256 amount) public {	//inject NONSTANDARD NAMING
        require(amount > 0);
        require(nestContract.BALANCEOF436(address(msg.sender)) >= amount);
        require(nestContract.ALLOWANCE21(address(msg.sender), address(this)) >= amount);
        require(nestContract.TRANSFERFROM634(address(msg.sender), address(nodeSave), amount));
        nodeAssignmentData.ADDNEST981(amount);
    }
    
                                                  
    function NODEGET740() public {	//inject NONSTANDARD NAMING
        require(address(msg.sender) == address(tx.origin));
        require(supermanContract.BALANCEOF436(address(msg.sender)) > 0);
        uint256 allAmount = nodeAssignmentData.CHECKNODEALLAMOUNT977();
        uint256 amount = allAmount.SUB106(nodeAssignmentData.CHECKNODELATESTAMOUNT223(address(msg.sender)));
        uint256 getAmount = amount.MUL618(supermanContract.BALANCEOF436(address(msg.sender))).DIV95(1500);
        require(nestContract.BALANCEOF436(address(nodeSave)) >= getAmount);
        nodeSave.TURNOUT873(getAmount,address(msg.sender));
        nodeAssignmentData.ADDNODELATESTAMOUNT163(address(msg.sender),allAmount);
    }
    
                                                                                                                              
    function NODECOUNT178(address fromAdd, address toAdd) public {	//inject NONSTANDARD NAMING
        require(address(supermanContract) == address(msg.sender));
        require(supermanContract.BALANCEOF436(address(fromAdd)) > 0);
        uint256 allAmount = nodeAssignmentData.CHECKNODEALLAMOUNT977();
        
        uint256 amountFrom = allAmount.SUB106(nodeAssignmentData.CHECKNODELATESTAMOUNT223(address(fromAdd)));
        uint256 getAmountFrom = amountFrom.MUL618(supermanContract.BALANCEOF436(address(fromAdd))).DIV95(1500);
        require(nestContract.BALANCEOF436(address(nodeSave)) >= getAmountFrom);
        nodeSave.TURNOUT873(getAmountFrom,address(fromAdd));
        nodeAssignmentData.ADDNODELATESTAMOUNT163(address(fromAdd),allAmount);
        
        uint256 amountTo = allAmount.SUB106(nodeAssignmentData.CHECKNODELATESTAMOUNT223(address(toAdd)));
        uint256 getAmountTo = amountTo.MUL618(supermanContract.BALANCEOF436(address(toAdd))).DIV95(1500);
        require(nestContract.BALANCEOF436(address(nodeSave)) >= getAmountTo);
        nodeSave.TURNOUT873(getAmountTo,address(toAdd));
        nodeAssignmentData.ADDNODELATESTAMOUNT163(address(toAdd),allAmount);
    }
    
    //  Amount available to the guardian node
    function CHECKNODENUM129() public view returns (uint256) {	//inject NONSTANDARD NAMING
         uint256 allAmount = nodeAssignmentData.CHECKNODEALLAMOUNT977();
         uint256 amount = allAmount.SUB106(nodeAssignmentData.CHECKNODELATESTAMOUNT223(address(msg.sender)));
         uint256 getAmount = amount.MUL618(supermanContract.BALANCEOF436(address(msg.sender))).DIV95(1500);
         return getAmount;
    }
    
    modifier ONLYOWNER592(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKOWNERS368(msg.sender) == true);
        _;
    }
}


                                                                                        
interface IERC20 {
    function TOTALSUPPLY129() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF436(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE21(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER851(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE661(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM634(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER443(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL857(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
    
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
contract SuperMan is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;
    
    IBMapping mappingContract;  //1111

    uint256 private _totalSupply = 1500;
    string public name = "NestNode";
    string public symbol = "NN";
    uint8 public decimals = 0;

    constructor (address map) public {
    	_balances[msg.sender] = _totalSupply;
    	mappingContract = IBMapping(map); 
    }
    
    function CHANGEMAPPING639(address map) public ONLYOWNER592{	//inject NONSTANDARD NAMING
        mappingContract = IBMapping(map);
    }
    
                                                             
    function TOTALSUPPLY129() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF436(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE21(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER851(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER657(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE661(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL857(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM634(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB106(value);
        _TRANSFER657(from, to, value);
        emit APPROVAL857(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE171(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD822(addedValue);
        emit APPROVAL857(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE465(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB106(subtractedValue);
        emit APPROVAL857(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER657(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));
        
        NEST_NodeAssignment nodeAssignment = NEST_NodeAssignment(address(mappingContract.CHECKADDRESS618("nodeAssignment")));
        nodeAssignment.NODECOUNT178(from, to);
        
        _balances[from] = _balances[from].SUB106(value);
        _balances[to] = _balances[to].ADD822(value);
        emit TRANSFER443(from, to, value);
        
        
    }
    
    modifier ONLYOWNER592(){	//inject NONSTANDARD NAMING
        require(mappingContract.CHECKOWNERS368(msg.sender) == true);
        _;
    }
}

                                                                                          
library SafeMath {
    int256 constant private int256_min809 = -2**255;	//inject NONSTANDARD NAMING

                                                                                
    function MUL618(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                              
    function MUL618(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        require(!(a == -1 && b == int256_min809)); // This is the only case of overflow not detected by the check below

        int256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV95(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                       
    function DIV95(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        require(b != 0); // Solidity only automatically asserts when dividing by 0
        require(!(b == -1 && a == int256_min809)); // This is the only case of overflow

        int256 c = a / b;

        return c;
    }

                                                                                                                            
    function SUB106(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                             
    function SUB106(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        int256 c = a - b;
        require((b >= 0 && c <= a) || (b < 0 && c > a));

        return c;
    }

                                                                          
    function ADD822(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                        
    function ADD822(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
        int256 c = a + b;
        require((b >= 0 && c >= a) || (b < 0 && c < a));

        return c;
    }

                                                                                                                                                 
    function MOD377(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

contract IBMapping {
	function CHECKADDRESS618(string memory name) public view returns (address contractAddress);	//inject NONSTANDARD NAMING
	function CHECKOWNERS368(address man) public view returns (bool);	//inject NONSTANDARD NAMING
}

contract IBNEST {
    function TOTALSUPPLY129() public view returns (uint supply);	//inject NONSTANDARD NAMING
    function BALANCEOF436( address who ) public view returns (uint value);	//inject NONSTANDARD NAMING
    function ALLOWANCE21( address owner, address spender ) public view returns (uint _allowance);	//inject NONSTANDARD NAMING

    function TRANSFER851( address to, uint256 value) external;	//inject NONSTANDARD NAMING
    function TRANSFERFROM634( address from, address to, uint value) public returns (bool ok);	//inject NONSTANDARD NAMING
    function APPROVE661( address spender, uint value ) public returns (bool ok);	//inject NONSTANDARD NAMING

    event TRANSFER443( address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL857( address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
    
    function BALANCESSTART118() public view returns(uint256);	//inject NONSTANDARD NAMING
    function BALANCESGETBOOL54(uint256 num) public view returns(bool);	//inject NONSTANDARD NAMING
    function BALANCESGETNEXT9(uint256 num) public view returns(uint256);	//inject NONSTANDARD NAMING
    function BALANCESGETVALUE571(uint256 num) public view returns(address, uint256);	//inject NONSTANDARD NAMING
}