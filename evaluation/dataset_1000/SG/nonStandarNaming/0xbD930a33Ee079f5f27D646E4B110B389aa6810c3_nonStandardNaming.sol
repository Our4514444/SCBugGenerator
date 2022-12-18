                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

pragma solidity 0.5.12;

contract GemLike {
    function ALLOWANCE514(address, address) public returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE276(address, uint) public;	//inject NONSTANDARD NAMING
    function TRANSFER590(address, uint) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM466(address, address, uint) public returns (bool);	//inject NONSTANDARD NAMING
}

contract ValueLike {
    function PEEK726() public returns (uint, bool);	//inject NONSTANDARD NAMING
}

contract SaiTubLike {
    function SKR115() public view returns (GemLike);	//inject NONSTANDARD NAMING
    function GEM793() public view returns (GemLike);	//inject NONSTANDARD NAMING
    function GOV936() public view returns (GemLike);	//inject NONSTANDARD NAMING
    function SAI854() public view returns (GemLike);	//inject NONSTANDARD NAMING
    function PEP209() public view returns (ValueLike);	//inject NONSTANDARD NAMING
    function VOX563() public view returns (VoxLike);	//inject NONSTANDARD NAMING
    function BID960(uint) public view returns (uint);	//inject NONSTANDARD NAMING
    function INK214(bytes32) public view returns (uint);	//inject NONSTANDARD NAMING
    function TAG116() public view returns (uint);	//inject NONSTANDARD NAMING
    function TAB952(bytes32) public returns (uint);	//inject NONSTANDARD NAMING
    function RAP567(bytes32) public returns (uint);	//inject NONSTANDARD NAMING
    function DRAW108(bytes32, uint) public;	//inject NONSTANDARD NAMING
    function SHUT473(bytes32) public;	//inject NONSTANDARD NAMING
    function EXIT887(uint) public;	//inject NONSTANDARD NAMING
    function GIVE448(bytes32, address) public;	//inject NONSTANDARD NAMING
}

contract VoxLike {
    function PAR618() public returns (uint);	//inject NONSTANDARD NAMING
}

contract JoinLike {
    function ILK361() public returns (bytes32);	//inject NONSTANDARD NAMING
    function GEM793() public returns (GemLike);	//inject NONSTANDARD NAMING
    function DAI628() public returns (GemLike);	//inject NONSTANDARD NAMING
    function JOIN118(address, uint) public;	//inject NONSTANDARD NAMING
    function EXIT887(address, uint) public;	//inject NONSTANDARD NAMING
}
contract VatLike {
    function ILKS967(bytes32) public view returns (uint, uint, uint, uint, uint);	//inject NONSTANDARD NAMING
    function HOPE963(address) public;	//inject NONSTANDARD NAMING
    function FROB781(bytes32, address, address, address, int, int) public;	//inject NONSTANDARD NAMING
}

contract ManagerLike {
    function VAT400() public view returns (address);	//inject NONSTANDARD NAMING
    function URNS165(uint) public view returns (address);	//inject NONSTANDARD NAMING
    function OPEN299(bytes32, address) public returns (uint);	//inject NONSTANDARD NAMING
    function FROB781(uint, int, int) public;	//inject NONSTANDARD NAMING
    function GIVE448(uint, address) public;	//inject NONSTANDARD NAMING
    function MOVE213(uint, address, uint) public;	//inject NONSTANDARD NAMING
}

contract OtcLike {
    function GETPAYAMOUNT498(address, address, uint) public view returns (uint);	//inject NONSTANDARD NAMING
    function BUYALLAMOUNT665(address, uint, address, uint) public;	//inject NONSTANDARD NAMING
}


                                                      
library Blocklock {

  struct State {
    uint256 lockedAt;
    uint256 unlockedAt;
    uint256 lockDuration;
    uint256 cooldownDuration;
  }

  function SETLOCKDURATION178(State storage self, uint256 lockDuration) public {	//inject NONSTANDARD NAMING
    require(lockDuration > 0, "Blocklock/lock-min");
    self.lockDuration = lockDuration;
  }

  function SETCOOLDOWNDURATION93(State storage self, uint256 cooldownDuration) public {	//inject NONSTANDARD NAMING
    self.cooldownDuration = cooldownDuration;
  }

  function ISLOCKED626(State storage self, uint256 blockNumber) public view returns (bool) {	//inject NONSTANDARD NAMING
    uint256 endAt = LOCKENDAT624(self);
    return (
      self.lockedAt != 0 &&
      blockNumber >= self.lockedAt &&
      blockNumber < endAt
    );
  }

  function LOCK308(State storage self, uint256 blockNumber) public {	//inject NONSTANDARD NAMING
    require(CANLOCK997(self, blockNumber), "Blocklock/no-lock");
    self.lockedAt = blockNumber;
  }

  function UNLOCK63(State storage self, uint256 blockNumber) public {	//inject NONSTANDARD NAMING
    self.unlockedAt = blockNumber;
  }

  function CANLOCK997(State storage self, uint256 blockNumber) public view returns (bool) {	//inject NONSTANDARD NAMING
    uint256 endAt = LOCKENDAT624(self);
    return (
      self.lockedAt == 0 ||
      blockNumber >= endAt + self.cooldownDuration
    );
  }

  function COOLDOWNENDAT158(State storage self) internal view returns (uint256) {	//inject NONSTANDARD NAMING
    return LOCKENDAT624(self) + self.cooldownDuration;
  }

  function LOCKENDAT624(State storage self) internal view returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 endAt = self.lockedAt + self.lockDuration;
    // if we unlocked early
    if (self.unlockedAt >= self.lockedAt && self.unlockedAt < endAt) {
      endAt = self.unlockedAt;
    }
    return endAt;
  }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       





                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY634() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF289(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER590(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE514(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE276(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM466(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER27(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL539(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD820(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB37(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB37(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB37(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL96(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV891(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV891(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV891(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD209(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD209(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD209(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}






                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER501() {	//inject NONSTANDARD NAMING
    require(initializing || ISCONSTRUCTOR580() || !initialized, "Contract instance has already been initialized");

    bool isTopLevelCall = !initializing;
    if (isTopLevelCall) {
      initializing = true;
      initialized = true;
    }

    _;

    if (isTopLevelCall) {
      initializing = false;
    }
  }

                                                                                 
  function ISCONSTRUCTOR580() private view returns (bool) {	//inject NONSTANDARD NAMING
    // extcodesize checks the size of the code stored in an address, and
    // address returns the current address. Since the code is still not
    // deployed when running a constructor, any checks on its code size will
    // yield zero, making it an effective way to detect if a contract is
    // under construction or not.
    uint256 cs;
    assembly { cs := extcodesize(address) }
    return cs == 0;
  }

  // Reserved storage space to allow for layout changes in the future.
  uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract ReentrancyGuard is Initializable {
    // counter to allow mutex lock with only one SSTORE operation
    uint256 private _guardCounter;

    function INITIALIZE951() public INITIALIZER501 {	//inject NONSTANDARD NAMING
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT401() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }

    uint256[50] private ______gap;
}



                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD820(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS512(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE152(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS512(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS512(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       



contract ICErc20 {
    address public underlying;
    function MINT441(uint mintAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function REDEEMUNDERLYING321(uint redeemAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOFUNDERLYING212(address owner) external returns (uint);	//inject NONSTANDARD NAMING
    function GETCASH22() external view returns (uint);	//inject NONSTANDARD NAMING
    function SUPPLYRATEPERBLOCK644() external view returns (uint);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       



                                                                                                                                                                                                                                                     
library UniformRandomNumber {
                                                                                            
                                             
                                                              
                                                       
  function UNIFORM66(uint256 _entropy, uint256 _upperBound) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (_upperBound == 0) {
      return 0;
    }
    uint256 min = -_upperBound % _upperBound;
    uint256 random = _entropy;
    while (true) {
      if (random >= min) {
        break;
      }
      random = uint256(keccak256(abi.encodePacked(random)));
    }
    return random % _upperBound;
  }
}
                                                                                                                                                       



                                                                                                                                                                            
library SortitionSumTreeFactory {
                 

    struct SortitionSumTree {
        uint K; // The maximum number of childs per node.
        // We use this to keep track of vacant positions in the tree after removing a leaf. This is for keeping the tree as balanced as possible without spending gas on moving nodes around.
        uint[] stack;
        uint[] nodes;
        // Two-way mapping of IDs to node indexes. Note that node index 0 is reserved for the root node, and means the ID does not have a node.
        mapping(bytes32 => uint) IDsToNodeIndexes;
        mapping(uint => bytes32) nodeIndexesToIDs;
    }

                 

    struct SortitionSumTrees {
        mapping(bytes32 => SortitionSumTree) sortitionSumTrees;
    }

                  

                                                                                                                                                                                                       
    function CREATETREE317(SortitionSumTrees storage self, bytes32 _key, uint _K) internal {	//inject NONSTANDARD NAMING
        SortitionSumTree storage tree = self.sortitionSumTrees[_key];
        require(tree.K == 0, "Tree already exists.");
        require(_K > 1, "K must be greater than one.");
        tree.K = _K;
        tree.stack.length = 0;
        tree.nodes.length = 0;
        tree.nodes.push(0);
    }

                                                                                                                                                                                                                                                                                                                                      
    function SET2(SortitionSumTrees storage self, bytes32 _key, uint _value, bytes32 _ID) internal {	//inject NONSTANDARD NAMING
        SortitionSumTree storage tree = self.sortitionSumTrees[_key];
        uint treeIndex = tree.IDsToNodeIndexes[_ID];

        if (treeIndex == 0) { // No existing node.
            if (_value != 0) { // Non zero value.
                // Append.
                // Add node.
                if (tree.stack.length == 0) { // No vacant spots.
                    // Get the index and append the value.
                    treeIndex = tree.nodes.length;
                    tree.nodes.push(_value);

                    // Potentially append a new node and make the parent a sum node.
                    if (treeIndex != 1 && (treeIndex - 1) % tree.K == 0) { // Is first child.
                        uint parentIndex = treeIndex / tree.K;
                        bytes32 parentID = tree.nodeIndexesToIDs[parentIndex];
                        uint newIndex = treeIndex + 1;
                        tree.nodes.push(tree.nodes[parentIndex]);
                        delete tree.nodeIndexesToIDs[parentIndex];
                        tree.IDsToNodeIndexes[parentID] = newIndex;
                        tree.nodeIndexesToIDs[newIndex] = parentID;
                    }
                } else { // Some vacant spot.
                    // Pop the stack and append the value.
                    treeIndex = tree.stack[tree.stack.length - 1];
                    tree.stack.length--;
                    tree.nodes[treeIndex] = _value;
                }

                // Add label.
                tree.IDsToNodeIndexes[_ID] = treeIndex;
                tree.nodeIndexesToIDs[treeIndex] = _ID;

                UPDATEPARENTS217(self, _key, treeIndex, true, _value);
            }
        } else { // Existing node.
            if (_value == 0) { // Zero value.
                // Remove.
                // Remember value and set to 0.
                uint value = tree.nodes[treeIndex];
                tree.nodes[treeIndex] = 0;

                // Push to stack.
                tree.stack.push(treeIndex);

                // Clear label.
                delete tree.IDsToNodeIndexes[_ID];
                delete tree.nodeIndexesToIDs[treeIndex];

                UPDATEPARENTS217(self, _key, treeIndex, false, value);
            } else if (_value != tree.nodes[treeIndex]) { // New, non zero value.
                // Set.
                bool plusOrMinus = tree.nodes[treeIndex] <= _value;
                uint plusOrMinusValue = plusOrMinus ? _value - tree.nodes[treeIndex] : tree.nodes[treeIndex] - _value;
                tree.nodes[treeIndex] = _value;

                UPDATEPARENTS217(self, _key, treeIndex, plusOrMinus, plusOrMinusValue);
            }
        }
    }

                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function QUERYLEAFS61(	//inject NONSTANDARD NAMING
        SortitionSumTrees storage self,
        bytes32 _key,
        uint _cursor,
        uint _count
    ) internal view returns(uint startIndex, uint[] memory values, bool hasMore) {
        SortitionSumTree storage tree = self.sortitionSumTrees[_key];

        // Find the start index.
        for (uint i = 0; i < tree.nodes.length; i++) {
            if ((tree.K * i) + 1 >= tree.nodes.length) {
                startIndex = i;
                break;
            }
        }

        // Get the values.
        uint loopStartIndex = startIndex + _cursor;
        values = new uint[](loopStartIndex + _count > tree.nodes.length ? tree.nodes.length - loopStartIndex : _count);
        uint valuesIndex = 0;
        for (uint j = loopStartIndex; j < tree.nodes.length; j++) {
            if (valuesIndex < _count) {
                values[valuesIndex] = tree.nodes[j];
                valuesIndex++;
            } else {
                hasMore = true;
                break;
            }
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DRAW108(SortitionSumTrees storage self, bytes32 _key, uint _drawnNumber) internal view returns(bytes32 ID) {	//inject NONSTANDARD NAMING
        SortitionSumTree storage tree = self.sortitionSumTrees[_key];
        uint treeIndex = 0;
        uint currentDrawnNumber = _drawnNumber % tree.nodes[0];

        while ((tree.K * treeIndex) + 1 < tree.nodes.length)  // While it still has children.
            for (uint i = 1; i <= tree.K; i++) { // Loop over children.
                uint nodeIndex = (tree.K * treeIndex) + i;
                uint nodeValue = tree.nodes[nodeIndex];

                if (currentDrawnNumber >= nodeValue) currentDrawnNumber -= nodeValue; // Go to the next child.
                else { // Pick this child.
                    treeIndex = nodeIndex;
                    break;
                }
            }
        
        ID = tree.nodeIndexesToIDs[treeIndex];
    }

                                                                                                                                                                                   
    function STAKEOF280(SortitionSumTrees storage self, bytes32 _key, bytes32 _ID) internal view returns(uint value) {	//inject NONSTANDARD NAMING
        SortitionSumTree storage tree = self.sortitionSumTrees[_key];
        uint treeIndex = tree.IDsToNodeIndexes[_ID];

        if (treeIndex == 0) value = 0;
        else value = tree.nodes[treeIndex];
    }

   function TOTAL864(SortitionSumTrees storage self, bytes32 _key) internal view returns (uint) {	//inject NONSTANDARD NAMING
       SortitionSumTree storage tree = self.sortitionSumTrees[_key];
       if (tree.nodes.length == 0) {
           return 0;
       } else {
           return tree.nodes[0];
       }
   }

                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function UPDATEPARENTS217(SortitionSumTrees storage self, bytes32 _key, uint _treeIndex, bool _plusOrMinus, uint _value) private {	//inject NONSTANDARD NAMING
        SortitionSumTree storage tree = self.sortitionSumTrees[_key];

        uint parentIndex = _treeIndex;
        while (parentIndex != 0) {
            parentIndex = (parentIndex - 1) / tree.K;
            tree.nodes[parentIndex] = _plusOrMinus ? tree.nodes[parentIndex] + _value : tree.nodes[parentIndex] - _value;
        }
    }
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
library DrawManager {
    using SortitionSumTreeFactory for SortitionSumTreeFactory.SortitionSumTrees;
    using SafeMath for uint256;

                                                            
    bytes32 public constant tree_of_draws69 = "TreeOfDraws";	//inject NONSTANDARD NAMING

    uint8 public constant max_leaves66 = 10;	//inject NONSTANDARD NAMING

                                                        
    struct State {
                                                                                                                                                                                                                                                                                            
        SortitionSumTreeFactory.SortitionSumTrees sortitionSumTrees;

                                                                                            
        mapping(address => uint256) usersFirstDrawIndex;

                                                                                           
        mapping(address => uint256) usersSecondDrawIndex;

                                                                               
        mapping(uint256 => uint256) __deprecated__drawTotals;

                                                              
        uint256 openDrawIndex;

                                                                  
        uint256 __deprecated__committedSupply;
    }

                                                                                                                                                                                                          
    function OPENNEXTDRAW812(State storage self) public returns (uint256) {	//inject NONSTANDARD NAMING
        if (self.openDrawIndex == 0) {
            // If there is no previous draw, we must initialize
            self.sortitionSumTrees.CREATETREE317(tree_of_draws69, max_leaves66);
        } else {
            // else add current draw to sortition sum trees
            bytes32 drawId = bytes32(self.openDrawIndex);
            uint256 drawTotal = OPENSUPPLY780(self);
            self.sortitionSumTrees.SET2(tree_of_draws69, drawTotal, drawId);
        }
        // now create a new draw
        uint256 drawIndex = self.openDrawIndex.ADD820(1);
        self.sortitionSumTrees.CREATETREE317(bytes32(drawIndex), max_leaves66);
        self.openDrawIndex = drawIndex;

        return drawIndex;
    }

                                                                                                                                                                                                                                          
    function DEPOSIT532(State storage self, address _addr, uint256 _amount) public REQUIREOPENDRAW376(self) ONLYNONZERO919(_addr) {	//inject NONSTANDARD NAMING
        bytes32 userId = bytes32(uint256(_addr));
        uint256 openDrawIndex = self.openDrawIndex;

        // update the current draw
        uint256 currentAmount = self.sortitionSumTrees.STAKEOF280(bytes32(openDrawIndex), userId);
        currentAmount = currentAmount.ADD820(_amount);
        DRAWSET111(self, openDrawIndex, currentAmount, _addr);

        uint256 firstDrawIndex = self.usersFirstDrawIndex[_addr];
        uint256 secondDrawIndex = self.usersSecondDrawIndex[_addr];

        // if this is the users first draw, set it
        if (firstDrawIndex == 0) {
            self.usersFirstDrawIndex[_addr] = openDrawIndex;
        // otherwise, if the first draw is not this draw
        } else if (firstDrawIndex != openDrawIndex) {
            // if a second draw does not exist
            if (secondDrawIndex == 0) {
                // set the second draw to the current draw
                self.usersSecondDrawIndex[_addr] = openDrawIndex;
            // otherwise if a second draw exists but is not the current one
            } else if (secondDrawIndex != openDrawIndex) {
                // merge it into the first draw, and update the second draw index to this one
                uint256 firstAmount = self.sortitionSumTrees.STAKEOF280(bytes32(firstDrawIndex), userId);
                uint256 secondAmount = self.sortitionSumTrees.STAKEOF280(bytes32(secondDrawIndex), userId);
                DRAWSET111(self, firstDrawIndex, firstAmount.ADD820(secondAmount), _addr);
                DRAWSET111(self, secondDrawIndex, 0, _addr);
                self.usersSecondDrawIndex[_addr] = openDrawIndex;
            }
        }
    }

                                                                                                                                                                                                                                                              
    function DEPOSITCOMMITTED435(State storage self, address _addr, uint256 _amount) public REQUIRECOMMITTEDDRAW807(self) ONLYNONZERO919(_addr) {	//inject NONSTANDARD NAMING
        bytes32 userId = bytes32(uint256(_addr));
        uint256 firstDrawIndex = self.usersFirstDrawIndex[_addr];

        // if they have a committed balance
        if (firstDrawIndex != 0 && firstDrawIndex != self.openDrawIndex) {
            uint256 firstAmount = self.sortitionSumTrees.STAKEOF280(bytes32(firstDrawIndex), userId);
            DRAWSET111(self, firstDrawIndex, firstAmount.ADD820(_amount), _addr);
        } else { // they must not have any committed balance
            self.usersSecondDrawIndex[_addr] = firstDrawIndex;
            self.usersFirstDrawIndex[_addr] = self.openDrawIndex.SUB37(1);
            DRAWSET111(self, self.usersFirstDrawIndex[_addr], _amount, _addr);
        }
    }

                                                                                                                                                                              
    function WITHDRAW988(State storage self, address _addr) public REQUIREOPENDRAW376(self) ONLYNONZERO919(_addr) {	//inject NONSTANDARD NAMING
        uint256 firstDrawIndex = self.usersFirstDrawIndex[_addr];
        uint256 secondDrawIndex = self.usersSecondDrawIndex[_addr];

        if (firstDrawIndex != 0) {
            DRAWSET111(self, firstDrawIndex, 0, _addr);
            delete self.usersFirstDrawIndex[_addr];
        }

        if (secondDrawIndex != 0) {
            DRAWSET111(self, secondDrawIndex, 0, _addr);
            delete self.usersSecondDrawIndex[_addr];
        }
    }

    function WITHDRAWOPEN591(State storage self, address _addr, uint256 _amount) public REQUIREOPENDRAW376(self) ONLYNONZERO919(_addr) {	//inject NONSTANDARD NAMING
        bytes32 userId = bytes32(uint256(_addr));
        uint256 openTotal = self.sortitionSumTrees.STAKEOF280(bytes32(self.openDrawIndex), userId);

        require(_amount <= openTotal, "DrawMan/exceeds-open");

        uint256 remaining = openTotal.SUB37(_amount);

        DRAWSET111(self, self.openDrawIndex, remaining, _addr);
    }

                                                                                                                                                                                                                                                                        
    function WITHDRAWCOMMITTED311(State storage self, address _addr, uint256 _amount) public REQUIRECOMMITTEDDRAW807(self) ONLYNONZERO919(_addr) {	//inject NONSTANDARD NAMING
        bytes32 userId = bytes32(uint256(_addr));
        uint256 firstDrawIndex = self.usersFirstDrawIndex[_addr];
        uint256 secondDrawIndex = self.usersSecondDrawIndex[_addr];

        uint256 firstAmount = 0;
        uint256 secondAmount = 0;
        uint256 total = 0;

        if (secondDrawIndex != 0 && secondDrawIndex != self.openDrawIndex) {
            secondAmount = self.sortitionSumTrees.STAKEOF280(bytes32(secondDrawIndex), userId);
            total = total.ADD820(secondAmount);
        }

        if (firstDrawIndex != 0 && firstDrawIndex != self.openDrawIndex) {
            firstAmount = self.sortitionSumTrees.STAKEOF280(bytes32(firstDrawIndex), userId);
            total = total.ADD820(firstAmount);
        }

        require(_amount <= total, "Pool/exceed");

        uint256 remaining = total.SUB37(_amount);

        // if there was a second amount that needs to be updated
        if (remaining > firstAmount) {
            uint256 secondRemaining = remaining.SUB37(firstAmount);
            DRAWSET111(self, secondDrawIndex, secondRemaining, _addr);
        } else if (secondAmount > 0) { // else delete the second amount if it exists
            delete self.usersSecondDrawIndex[_addr];
            DRAWSET111(self, secondDrawIndex, 0, _addr);
        }

        // if the first amount needs to be destroyed
        if (remaining == 0) {
            delete self.usersFirstDrawIndex[_addr];
            DRAWSET111(self, firstDrawIndex, 0, _addr);
        } else if (remaining < firstAmount) {
            DRAWSET111(self, firstDrawIndex, remaining, _addr);
        }
    }

                                                                                                                           
    function BALANCEOF289(State storage drawState, address _addr) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return COMMITTEDBALANCEOF230(drawState, _addr).ADD820(OPENBALANCEOF937(drawState, _addr));
    }

                                                                                                                                                                                                                                                 
    function COMMITTEDBALANCEOF230(State storage self, address _addr) public view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 balance = 0;

        uint256 firstDrawIndex = self.usersFirstDrawIndex[_addr];
        uint256 secondDrawIndex = self.usersSecondDrawIndex[_addr];

        if (firstDrawIndex != 0 && firstDrawIndex != self.openDrawIndex) {
            balance = balance.ADD820(self.sortitionSumTrees.STAKEOF280(bytes32(firstDrawIndex), bytes32(uint256(_addr))));
        }

        if (secondDrawIndex != 0 && secondDrawIndex != self.openDrawIndex) {
            balance = balance.ADD820(self.sortitionSumTrees.STAKEOF280(bytes32(secondDrawIndex), bytes32(uint256(_addr))));
        }

        return balance;
    }

                                                                                                                                                                                                                     
    function OPENBALANCEOF937(State storage self, address _addr) public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (self.openDrawIndex == 0) {
            return 0;
        } else {
            return self.sortitionSumTrees.STAKEOF280(bytes32(self.openDrawIndex), bytes32(uint256(_addr)));
        }
    }

                                                                                                                                                                    
    function OPENSUPPLY780(State storage self) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return self.sortitionSumTrees.TOTAL864(bytes32(self.openDrawIndex));
    }

                                                                                                                                                                    
    function COMMITTEDSUPPLY838(State storage self) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return self.sortitionSumTrees.TOTAL864(tree_of_draws69);
    }

                                                                                                                                                                                                                                                              
    function DRAWSET111(State storage self, uint256 _drawIndex, uint256 _amount, address _addr) internal {	//inject NONSTANDARD NAMING
        bytes32 drawId = bytes32(_drawIndex);
        bytes32 userId = bytes32(uint256(_addr));
        uint256 oldAmount = self.sortitionSumTrees.STAKEOF280(drawId, userId);

        if (oldAmount != _amount) {
            // If the amount has changed

            // Update the Draw's balance for that address
            self.sortitionSumTrees.SET2(drawId, _amount, userId);

            // if the draw is committed
            if (_drawIndex != self.openDrawIndex) {
                // Get the new draw total
                uint256 newDrawTotal = self.sortitionSumTrees.TOTAL864(drawId);

                // update the draw in the committed tree
                self.sortitionSumTrees.SET2(tree_of_draws69, newDrawTotal, drawId);
            }
        }
    }

                                                                                                                                                                                                                                         
    function DRAW108(State storage self, uint256 _token) public view returns (address) {	//inject NONSTANDARD NAMING
        // If there is no one to select, just return the zero address
        if (COMMITTEDSUPPLY838(self) == 0) {
            return address(0);
        }
        require(_token < COMMITTEDSUPPLY838(self), "Pool/ineligible");
        uint256 drawIndex = uint256(self.sortitionSumTrees.DRAW108(tree_of_draws69, _token));
        uint256 drawSupply = self.sortitionSumTrees.TOTAL864(bytes32(drawIndex));
        uint256 drawToken = _token % drawSupply;
        return address(uint256(self.sortitionSumTrees.DRAW108(bytes32(drawIndex), drawToken)));
    }

                                                                                                                                                                                                                                                                                                                                
    function DRAWWITHENTROPY293(State storage self, bytes32 _entropy) public view returns (address) {	//inject NONSTANDARD NAMING
        return DRAW108(self, UniformRandomNumber.UNIFORM66(uint256(_entropy), COMMITTEDSUPPLY838(self)));
    }

    modifier REQUIREOPENDRAW376(State storage self) {	//inject NONSTANDARD NAMING
        require(self.openDrawIndex > 0, "Pool/no-open");
        _;
    }

    modifier REQUIRECOMMITTEDDRAW807(State storage self) {	//inject NONSTANDARD NAMING
        require(self.openDrawIndex > 1, "Pool/no-commit");
        _;
    }

    modifier ONLYNONZERO919(address _addr) {	//inject NONSTANDARD NAMING
        require(_addr != address(0), "Pool/not-zero");
        _;
    }
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
library FixidityLib {

                                                                                          
    function DIGITS888() public pure returns(uint8) {	//inject NONSTANDARD NAMING
        return 24;
    }
    
                                                                                                                                                                   
    function FIXED185() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return 1000000000000000000000000;
    }

                                                                                                                                                                             
    function MULPRECISION571() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return 1000000000000;
    }

                                                                                                                              
    function MAXINT256680() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return 57896044618658097711785492504343953926634992332820282019728792003956564819967;
    }

                                                                                                                                  
    function MININT256111() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return -57896044618658097711785492504343953926634992332820282019728792003956564819968;
    }

                                                                                                                                                                                                               
    function MAXNEWFIXED589() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return 57896044618658097711785492504343953926634992332820282;
    }

                                                                                                                                                                                                                  
    function MINNEWFIXED700() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return -57896044618658097711785492504343953926634992332820282;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MAXFIXEDADD698() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return 28948022309329048855892746252171976963317496166410141009864396001978282409983;
    }

                                                                                                                                                
    function MAXFIXEDSUB392() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return -28948022309329048855892746252171976963317496166410141009864396001978282409984;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function MAXFIXEDMUL639() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return 240615969168004498257251713877715648331380787511296;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function MAXFIXEDDIV949() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return 57896044618658097711785492504343953926634992332820282;
    }

                                                                                                                                                                                                                                                                                                                                                          
    function MAXFIXEDDIVISOR523() public pure returns(int256) {	//inject NONSTANDARD NAMING
        return 1000000000000000000000000000000000000000000000000;
    }

                                                                                                                                                                                                                                                                                                                         
    function NEWFIXED179(int256 x)	//inject NONSTANDARD NAMING
        public
        pure
        returns (int256)
    {
        require(x <= MAXNEWFIXED589());
        require(x >= MINNEWFIXED700());
        return x * FIXED185();
    }

                                                                                                                                                                   
    function FROMFIXED303(int256 x)	//inject NONSTANDARD NAMING
        public
        pure
        returns (int256)
    {
        return x / FIXED185();
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function CONVERTFIXED731(int256 x, uint8 _originDigits, uint8 _destinationDigits)	//inject NONSTANDARD NAMING
        public
        pure
        returns (int256)
    {
        require(_originDigits <= 38 && _destinationDigits <= 38);
        
        uint8 decimalDifference;
        if ( _originDigits > _destinationDigits ){
            decimalDifference = _originDigits - _destinationDigits;
            return x/(uint128(10)**uint128(decimalDifference));
        }
        else if ( _originDigits < _destinationDigits ){
            decimalDifference = _destinationDigits - _originDigits;
            // Cast uint8 -> uint128 is safe
            // Exponentiation is safe:
            //     _originDigits and _destinationDigits limited to 38 or less
            //     decimalDifference = abs(_destinationDigits - _originDigits)
            //     decimalDifference < 38
            //     10**38 < 2**128-1
            require(x <= MAXINT256680()/uint128(10)**uint128(decimalDifference));
            require(x >= MININT256111()/uint128(10)**uint128(decimalDifference));
            return x*(uint128(10)**uint128(decimalDifference));
        }
        // _originDigits == digits()) 
        return x;
    }

                                                                                                                                                                                                                                                                                               
    function NEWFIXED179(int256 x, uint8 _originDigits)	//inject NONSTANDARD NAMING
        public
        pure
        returns (int256)
    {
        return CONVERTFIXED731(x, _originDigits, DIGITS888());
    }

                                                                                                                                                                                                                                                                                                                   
    function FROMFIXED303(int256 x, uint8 _destinationDigits)	//inject NONSTANDARD NAMING
        public
        pure
        returns (int256)
    {
        return CONVERTFIXED731(x, DIGITS888(), _destinationDigits);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function NEWFIXEDFRACTION288(	//inject NONSTANDARD NAMING
        int256 numerator, 
        int256 denominator
        )
        public
        pure
        returns (int256)
    {
        require(numerator <= MAXNEWFIXED589());
        require(denominator <= MAXNEWFIXED589());
        require(denominator != 0);
        int256 convertedNumerator = NEWFIXED179(numerator);
        int256 convertedDenominator = NEWFIXED179(denominator);
        return DIVIDE239(convertedNumerator, convertedDenominator);
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function INTEGER529(int256 x) public pure returns (int256) {	//inject NONSTANDARD NAMING
        return (x / FIXED185()) * FIXED185(); // Can't overflow
    }

                                                                                                                                                                                                                                                                                                                                                                                                             
    function FRACTIONAL401(int256 x) public pure returns (int256) {	//inject NONSTANDARD NAMING
        return x - (x / FIXED185()) * FIXED185(); // Can't overflow
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function ABS463(int256 x) public pure returns (int256) {	//inject NONSTANDARD NAMING
        if (x >= 0) {
            return x;
        } else {
            int256 result = -x;
            assert (result > 0);
            return result;
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function ADD820(int256 x, int256 y) public pure returns (int256) {	//inject NONSTANDARD NAMING
        int256 z = x + y;
        if (x > 0 && y > 0) assert(z > x && z > y);
        if (x < 0 && y < 0) assert(z < x && z < y);
        return z;
    }

                                                                                                         
    function SUBTRACT592(int256 x, int256 y) public pure returns (int256) {	//inject NONSTANDARD NAMING
        return ADD820(x,-y);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MULTIPLY719(int256 x, int256 y) public pure returns (int256) {	//inject NONSTANDARD NAMING
        if (x == 0 || y == 0) return 0;
        if (y == FIXED185()) return x;
        if (x == FIXED185()) return y;

        // Separate into integer and fractional parts
        // x = x1 + x2, y = y1 + y2
        int256 x1 = INTEGER529(x) / FIXED185();
        int256 x2 = FRACTIONAL401(x);
        int256 y1 = INTEGER529(y) / FIXED185();
        int256 y2 = FRACTIONAL401(y);
        
        // (x1 + x2) * (y1 + y2) = (x1 * y1) + (x1 * y2) + (x2 * y1) + (x2 * y2)
        int256 x1y1 = x1 * y1;
        if (x1 != 0) assert(x1y1 / x1 == y1); // Overflow x1y1
        
        // x1y1 needs to be multiplied back by fixed1
        // solium-disable-next-line mixedcase
        int256 fixed_x1y1 = x1y1 * FIXED185();
        if (x1y1 != 0) assert(fixed_x1y1 / x1y1 == FIXED185()); // Overflow x1y1 * fixed1
        x1y1 = fixed_x1y1;

        int256 x2y1 = x2 * y1;
        if (x2 != 0) assert(x2y1 / x2 == y1); // Overflow x2y1

        int256 x1y2 = x1 * y2;
        if (x1 != 0) assert(x1y2 / x1 == y2); // Overflow x1y2

        x2 = x2 / MULPRECISION571();
        y2 = y2 / MULPRECISION571();
        int256 x2y2 = x2 * y2;
        if (x2 != 0) assert(x2y2 / x2 == y2); // Overflow x2y2

        // result = fixed1() * x1 * y1 + x1 * y2 + x2 * y1 + x2 * y2 / fixed1();
        int256 result = x1y1;
        result = ADD820(result, x2y1); // Add checks for overflow
        result = ADD820(result, x1y2); // Add checks for overflow
        result = ADD820(result, x2y2); // Add checks for overflow
        return result;
    }
    
                                                                                                                                                                                                                                                                                                                                 
    function RECIPROCAL60(int256 x) public pure returns (int256) {	//inject NONSTANDARD NAMING
        require(x != 0);
        return (FIXED185()*FIXED185()) / x; // Can't overflow
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function DIVIDE239(int256 x, int256 y) public pure returns (int256) {	//inject NONSTANDARD NAMING
        if (y == FIXED185()) return x;
        require(y != 0);
        require(y <= MAXFIXEDDIVISOR523());
        return MULTIPLY719(x, RECIPROCAL60(y));
    }
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       








                                                                                                                                                                                                                                                                                                                                                                                    
interface IERC777 {
                                                          
    function NAME361() external view returns (string memory);	//inject NONSTANDARD NAMING

                                                                                                          
    function SYMBOL354() external view returns (string memory);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                   
    function GRANULARITY718() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                      
    function TOTALSUPPLY634() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                       
    function BALANCEOF289(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function SEND71(address recipient, uint256 amount, bytes calldata data) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                        
    function BURN97(uint256 amount, bytes calldata data) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                             
    function ISOPERATORFOR337(address operator, address tokenHolder) external view returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                             
    function AUTHORIZEOPERATOR932(address operator) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                
    function REVOKEOPERATOR798(address operator) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                      
    function DEFAULTOPERATORS129() external view returns (address[] memory);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function OPERATORSEND418(	//inject NONSTANDARD NAMING
        address sender,
        address recipient,
        uint256 amount,
        bytes calldata data,
        bytes calldata operatorData
    ) external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function OPERATORBURN119(	//inject NONSTANDARD NAMING
        address account,
        uint256 amount,
        bytes calldata data,
        bytes calldata operatorData
    ) external;

    event SENT942(	//inject NONSTANDARD NAMING
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256 amount,
        bytes data,
        bytes operatorData
    );

    event MINTED270(address indexed operator, address indexed to, uint256 amount, bytes data, bytes operatorData);	//inject NONSTANDARD NAMING

    event BURNED499(address indexed operator, address indexed from, uint256 amount, bytes data, bytes operatorData);	//inject NONSTANDARD NAMING

    event AUTHORIZEDOPERATOR392(address indexed operator, address indexed tokenHolder);	//inject NONSTANDARD NAMING

    event REVOKEDOPERATOR200(address indexed operator, address indexed tokenHolder);	//inject NONSTANDARD NAMING
}




                                                                                                                                                                                                                                                                                                                                                                                                                                    
interface IERC777Sender {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TOKENSTOSEND300(	//inject NONSTANDARD NAMING
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) external;
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
interface IERC1820Registry {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function SETMANAGER953(address account, address newManager) external;	//inject NONSTANDARD NAMING

                                                                                              
    function GETMANAGER774(address account) external view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function SETINTERFACEIMPLEMENTER592(address account, bytes32 interfaceHash, address implementer) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                  
    function GETINTERFACEIMPLEMENTER536(address account, bytes32 interfaceHash) external view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                        
    function INTERFACEHASH955(string calldata interfaceName) external pure returns (bytes32);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                           
    function UPDATEERC165CACHE155(address account, bytes4 interfaceId) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function IMPLEMENTSERC165INTERFACE232(address account, bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                 
    function IMPLEMENTSERC165INTERFACENOCACHE260(address account, bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING

    event INTERFACEIMPLEMENTERSET635(address indexed account, bytes32 indexed interfaceHash, address indexed implementer);	//inject NONSTANDARD NAMING

    event MANAGERCHANGED628(address indexed account, address indexed newManager);	//inject NONSTANDARD NAMING
}



                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT975(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

                                                                                                                                                                                                          
    function TOPAYABLE804(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE740(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract PoolToken is Initializable, IERC20, IERC777 {
  using SafeMath for uint256;
  using Address for address;

                                                                     
  event REDEEMED86(address indexed operator, address indexed from, uint256 amount, bytes data, bytes operatorData);	//inject NONSTANDARD NAMING

  IERC1820Registry constant internal erc1820_registry666 = IERC1820Registry(0x1820a4B7618BdE71Dce8cdc73aAB6C95905faD24);	//inject NONSTANDARD NAMING

  // We inline the result of the following hashes because Solidity doesn't resolve them at compile time.
  // See https://github.com/ethereum/solidity/issues/4024.

  // keccak256("ERC777TokensSender")
  bytes32 constant internal tokens_sender_interface_hash859 =	//inject NONSTANDARD NAMING
      0x29ddb589b1fb5fc7cf394961c1adf5f8c6454761adf795e67fe149f658abe895;

  // keccak256("ERC777TokensRecipient")
  bytes32 constant internal tokens_recipient_interface_hash630 =	//inject NONSTANDARD NAMING
      0xb281fc8c12954d22544db45de3159a39272895b169a852b314f9cc762e44c53b;

  // keccak256("ERC777Token")
  bytes32 constant internal tokens_interface_hash815 =	//inject NONSTANDARD NAMING
      0xac7fbab5f54a3ca8194167523c6753bfeb96a445279294b6125b68cce2177054;

  // keccak256("ERC20Token")
  bytes32 constant internal erc20_tokens_interface_hash796 =	//inject NONSTANDARD NAMING
      0xaea199e31a596269b42cdafd93407f14436db6e4cad65417994c2eb37381e05a;

  string internal _name;
  string internal _symbol;

  // This isn't ever read from - it's only used to respond to the defaultOperators query.
  address[] internal _defaultOperatorsArray;

  // Immutable, but accounts may revoke them (tracked in __revokedDefaultOperators).
  mapping(address => bool) internal _defaultOperators;

  // For each account, a mapping of its operators and revoked default operators.
  mapping(address => mapping(address => bool)) internal _operators;
  mapping(address => mapping(address => bool)) internal _revokedDefaultOperators;

  // ERC20-allowances
  mapping (address => mapping (address => uint256)) internal _allowances;

  BasePool internal _pool;

  function INIT491 (	//inject NONSTANDARD NAMING
    string memory name,
    string memory symbol,
    address[] memory defaultOperators,
    BasePool pool
  ) public INITIALIZER501 {
      require(bytes(name).length != 0, "PoolToken/name");
      require(bytes(symbol).length != 0, "PoolToken/symbol");
      require(address(pool) != address(0), "PoolToken/pool-zero");

      _name = name;
      _symbol = symbol;
      _pool = pool;

      _defaultOperatorsArray = defaultOperators;
      for (uint256 i = 0; i < _defaultOperatorsArray.length; i++) {
          _defaultOperators[_defaultOperatorsArray[i]] = true;
      }

      // register interfaces
      erc1820_registry666.SETINTERFACEIMPLEMENTER592(address(this), tokens_interface_hash815, address(this));
      erc1820_registry666.SETINTERFACEIMPLEMENTER592(address(this), erc20_tokens_interface_hash796, address(this));
  }

  function POOL469() public view returns (address) {	//inject NONSTANDARD NAMING
      return address(_pool);
  }

  function POOLREDEEM776(address from, uint256 amount) external ONLYPOOL829 {	//inject NONSTANDARD NAMING
      _CALLTOKENSTOSEND62(from, from, address(0), amount, '', '');

      emit REDEEMED86(from, from, amount, '', '');
      emit TRANSFER27(from, address(0), amount);
  }

                                           
  function NAME361() public view returns (string memory) {	//inject NONSTANDARD NAMING
      return _name;
  }

                                             
  function SYMBOL354() public view returns (string memory) {	//inject NONSTANDARD NAMING
      return _symbol;
  }

                                                                                                                                                                                  
  function DECIMALS290() public pure returns (uint8) {	//inject NONSTANDARD NAMING
      return 18;
  }

                                                                                                      
  function GRANULARITY718() public view returns (uint256) {	//inject NONSTANDARD NAMING
      return 1;
  }

                                                  
  function TOTALSUPPLY634() public view returns (uint256) {	//inject NONSTANDARD NAMING
      return _pool.COMMITTEDSUPPLY838();
  }

                                               
  function BALANCEOF289(address _addr) external view returns (uint256) {	//inject NONSTANDARD NAMING
      return _pool.COMMITTEDBALANCEOF230(_addr);
  }

                                                                                                              
  function SEND71(address recipient, uint256 amount, bytes calldata data) external {	//inject NONSTANDARD NAMING
      _SEND72(msg.sender, msg.sender, recipient, amount, data, "");
  }

                                                                                                                                                                                                                       
  function TRANSFER590(address recipient, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
      require(recipient != address(0), "PoolToken/transfer-zero");

      address from = msg.sender;

      _CALLTOKENSTOSEND62(from, from, recipient, amount, "", "");

      _MOVE397(from, from, recipient, amount, "", "");

      _CALLTOKENSRECEIVED406(from, from, recipient, amount, "", "", false);

      return true;
  }

                                                                                                                                                          
  function REDEEM105(uint256 amount, bytes calldata data) external {	//inject NONSTANDARD NAMING
      _REDEEM891(msg.sender, msg.sender, amount, data, "");
  }

                                                                                                                                          
  function BURN97(uint256, bytes calldata) external {	//inject NONSTANDARD NAMING
      revert("PoolToken/no-support");
  }

                                                    
  function ISOPERATORFOR337(	//inject NONSTANDARD NAMING
      address operator,
      address tokenHolder
  ) public view returns (bool) {
      return operator == tokenHolder ||
          (_defaultOperators[operator] && !_revokedDefaultOperators[tokenHolder][operator]) ||
          _operators[tokenHolder][operator];
  }

                                                        
  function AUTHORIZEOPERATOR932(address operator) external {	//inject NONSTANDARD NAMING
      require(msg.sender != operator, "PoolToken/auth-self");

      if (_defaultOperators[operator]) {
          delete _revokedDefaultOperators[msg.sender][operator];
      } else {
          _operators[msg.sender][operator] = true;
      }

      emit AUTHORIZEDOPERATOR392(operator, msg.sender);
  }

                                                     
  function REVOKEOPERATOR798(address operator) external {	//inject NONSTANDARD NAMING
      require(operator != msg.sender, "PoolToken/revoke-self");

      if (_defaultOperators[operator]) {
          _revokedDefaultOperators[msg.sender][operator] = true;
      } else {
          delete _operators[msg.sender][operator];
      }

      emit REVOKEDOPERATOR200(operator, msg.sender);
  }

                                                       
  function DEFAULTOPERATORS129() public view returns (address[] memory) {	//inject NONSTANDARD NAMING
      return _defaultOperatorsArray;
  }

                                                                                                   
  function OPERATORSEND418(	//inject NONSTANDARD NAMING
      address sender,
      address recipient,
      uint256 amount,
      bytes calldata data,
      bytes calldata operatorData
  )
  external
  {
      require(ISOPERATORFOR337(msg.sender, sender), "PoolToken/not-operator");
      _SEND72(msg.sender, sender, recipient, amount, data, operatorData);
  }

                                                                                       
  function OPERATORBURN119(address, uint256, bytes calldata, bytes calldata) external {	//inject NONSTANDARD NAMING
      revert("PoolToken/no-support");
  }

                                                                                                                                                             
  function OPERATORREDEEM210(address account, uint256 amount, bytes calldata data, bytes calldata operatorData) external {	//inject NONSTANDARD NAMING
      require(ISOPERATORFOR337(msg.sender, account), "PoolToken/not-operator");
      _REDEEM891(msg.sender, account, amount, data, operatorData);
  }

                                                                                                                                                                                                                                
  function ALLOWANCE514(address holder, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
      return _allowances[holder][spender];
  }

                                                                                                                             
  function APPROVE276(address spender, uint256 value) external returns (bool) {	//inject NONSTANDARD NAMING
      address holder = msg.sender;
      _APPROVE122(holder, spender, value);
      return true;
  }

                                                                                                                                                                                                                                                                                                                                       
  function TRANSFERFROM466(address holder, address recipient, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
      require(recipient != address(0), "PoolToken/to-zero");
      require(holder != address(0), "PoolToken/from-zero");

      address spender = msg.sender;

      _CALLTOKENSTOSEND62(spender, holder, recipient, amount, "", "");

      _MOVE397(spender, holder, recipient, amount, "", "");
      _APPROVE122(holder, spender, _allowances[holder][spender].SUB37(amount, "PoolToken/exceed-allow"));

      _CALLTOKENSRECEIVED406(spender, holder, recipient, amount, "", "", false);

      return true;
  }

                                                                                                                   
  function POOLMINT348(uint256 amount) external ONLYPOOL829 {	//inject NONSTANDARD NAMING
    _MINTEVENTS923(address(_pool), address(_pool), amount, '', '');
  }

                                                               
  function _MINTEVENTS923(	//inject NONSTANDARD NAMING
      address operator,
      address account,
      uint256 amount,
      bytes memory userData,
      bytes memory operatorData
  )
  internal
  {
      emit MINTED270(operator, account, amount, userData, operatorData);
      emit TRANSFER27(address(0), account, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                            
  function _SEND72(	//inject NONSTANDARD NAMING
      address operator,
      address from,
      address to,
      uint256 amount,
      bytes memory userData,
      bytes memory operatorData
  )
      private
  {
      require(from != address(0), "PoolToken/from-zero");
      require(to != address(0), "PoolToken/to-zero");

      _CALLTOKENSTOSEND62(operator, from, to, amount, userData, operatorData);

      _MOVE397(operator, from, to, amount, userData, operatorData);

      _CALLTOKENSRECEIVED406(operator, from, to, amount, userData, operatorData, true);
  }

                                                                                                                                                                                                                                                                                                                                                                                                 
  function _REDEEM891(	//inject NONSTANDARD NAMING
      address operator,
      address from,
      uint256 amount,
      bytes memory data,
      bytes memory operatorData
  )
      private
  {
      require(from != address(0), "PoolToken/from-zero");

      _CALLTOKENSTOSEND62(operator, from, address(0), amount, data, operatorData);

      _pool.WITHDRAWCOMMITTEDDEPOSIT880(from, amount);

      emit REDEEMED86(operator, from, amount, data, operatorData);
      emit TRANSFER27(from, address(0), amount);
  }

  function _MOVE397(	//inject NONSTANDARD NAMING
      address operator,
      address from,
      address to,
      uint256 amount,
      bytes memory userData,
      bytes memory operatorData
  )
      private
  {
      _pool.MOVECOMMITTED644(from, to, amount);

      emit SENT942(operator, from, to, amount, userData, operatorData);
      emit TRANSFER27(from, to, amount);
  }

  function _APPROVE122(address holder, address spender, uint256 value) private {	//inject NONSTANDARD NAMING
      require(spender != address(0), "PoolToken/from-zero");

      _allowances[holder][spender] = value;
      emit APPROVAL539(holder, spender, value);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function _CALLTOKENSTOSEND62(	//inject NONSTANDARD NAMING
      address operator,
      address from,
      address to,
      uint256 amount,
      bytes memory userData,
      bytes memory operatorData
  )
      internal NOTLOCKED240
  {
      address implementer = erc1820_registry666.GETINTERFACEIMPLEMENTER536(from, tokens_sender_interface_hash859);
      if (implementer != address(0)) {
          IERC777Sender(implementer).TOKENSTOSEND300(operator, from, to, amount, userData, operatorData);
      }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function _CALLTOKENSRECEIVED406(	//inject NONSTANDARD NAMING
      address operator,
      address from,
      address to,
      uint256 amount,
      bytes memory userData,
      bytes memory operatorData,
      bool requireReceptionAck
  )
      private
  {
      address implementer = erc1820_registry666.GETINTERFACEIMPLEMENTER536(to, tokens_recipient_interface_hash630);
      if (implementer != address(0)) {
          IERC777Recipient(implementer).TOKENSRECEIVED789(operator, from, to, amount, userData, operatorData);
      } else if (requireReceptionAck) {
          require(!to.ISCONTRACT975(), "PoolToken/no-recip-inter");
      }
  }

  modifier ONLYPOOL829() {	//inject NONSTANDARD NAMING
    require(msg.sender == address(_pool), "PoolToken/only-pool");
    _;
  }

  modifier NOTLOCKED240() {	//inject NONSTANDARD NAMING
    require(!_pool.ISLOCKED626(), "PoolToken/is-locked");
    _;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
contract BasePool is Initializable, ReentrancyGuard {
  using DrawManager for DrawManager.State;
  using SafeMath for uint256;
  using Roles for Roles.Role;
  using Blocklock for Blocklock.State;

  bytes32 internal constant rolled_over_entropy_magic_number986 = bytes32(uint256(1));	//inject NONSTANDARD NAMING
  uint256 internal constant default_lock_duration693 = 40;	//inject NONSTANDARD NAMING
  uint256 internal constant default_cooldown_duration351 = 80;	//inject NONSTANDARD NAMING

                                                                                                                                                       
  event DEPOSITED769(address indexed sender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                                                                                               
  event DEPOSITEDANDCOMMITTED991(address indexed sender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                                                              
  event SPONSORSHIPDEPOSITED414(address indexed sender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                             
  event ADMINADDED752(address indexed admin);	//inject NONSTANDARD NAMING

                                                                                                                   
  event ADMINREMOVED721(address indexed admin);	//inject NONSTANDARD NAMING

                                                                                                                                                                                
  event WITHDRAWN997(address indexed sender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                                                                                           
  event SPONSORSHIPANDFEESWITHDRAWN227(address indexed sender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                                                                          
  event OPENDEPOSITWITHDRAWN633(address indexed sender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                                                                               
  event COMMITTEDDEPOSITWITHDRAWN134(address indexed sender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                      
  event FEECOLLECTED724(address indexed sender, uint256 amount, uint256 drawId);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                    
  event OPENED103(	//inject NONSTANDARD NAMING
    uint256 indexed drawId,
    address indexed feeBeneficiary,
    bytes32 secretHash,
    uint256 feeFraction
  );

                                                                                 
  event COMMITTED397(	//inject NONSTANDARD NAMING
    uint256 indexed drawId
  );

                                                                                                                                                                                                                                                                                                             
  event REWARDED406(	//inject NONSTANDARD NAMING
    uint256 indexed drawId,
    address indexed winner,
    bytes32 entropy,
    uint256 winnings,
    uint256 fee
  );

                                                                                                                                                                            
  event NEXTFEEFRACTIONCHANGED672(uint256 feeFraction);	//inject NONSTANDARD NAMING

                                                                                                                                                   
  event NEXTFEEBENEFICIARYCHANGED977(address indexed feeBeneficiary);	//inject NONSTANDARD NAMING

                                                          
  event PAUSED776(address indexed sender);	//inject NONSTANDARD NAMING

                                                            
  event UNPAUSED976(address indexed sender);	//inject NONSTANDARD NAMING

                                                                                                
  event ROLLEDOVER638(uint256 indexed drawId);	//inject NONSTANDARD NAMING

  struct Draw {
    uint256 feeFraction; //fixed point 18
    address feeBeneficiary;
    uint256 openedBlock;
    bytes32 secretHash;
    bytes32 entropy;
    address winner;
    uint256 netWinnings;
    uint256 fee;
  }

                                                                
  ICErc20 public cToken;

                                                                 
  address public nextFeeBeneficiary;

                                                              
  uint256 public nextFeeFraction;

                                          
  uint256 public accountedBalance;

                                                               
  mapping (address => uint256) balances;

                                                         
  mapping(uint256 => Draw) draws;

                                                                               
  DrawManager.State drawState;

                                                          
  Roles.Role admins;

                                               
  bool public paused;

  Blocklock.State blocklock;

  PoolToken public poolToken;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  function INIT491 (	//inject NONSTANDARD NAMING
    address _owner,
    address _cToken,
    uint256 _feeFraction,
    address _feeBeneficiary,
    uint256 _lockDuration,
    uint256 _cooldownDuration
  ) public INITIALIZER501 {
    require(_owner != address(0), "Pool/owner-zero");
    require(_cToken != address(0), "Pool/ctoken-zero");
    cToken = ICErc20(_cToken);
    _ADDADMIN406(_owner);
    _SETNEXTFEEFRACTION321(_feeFraction);
    _SETNEXTFEEBENEFICIARY918(_feeBeneficiary);
    INITBLOCKLOCK440(_lockDuration, _cooldownDuration);
  }

  function SETPOOLTOKEN599(PoolToken _poolToken) external ONLYADMIN889 {	//inject NONSTANDARD NAMING
    require(address(poolToken) == address(0), "Pool/token-was-set");
    require(_poolToken.POOL469() == address(this), "Pool/token-mismatch");
    poolToken = _poolToken;
  }

  function INITBLOCKLOCK440(uint256 _lockDuration, uint256 _cooldownDuration) internal {	//inject NONSTANDARD NAMING
    blocklock.SETLOCKDURATION178(_lockDuration);
    blocklock.SETCOOLDOWNDURATION93(_cooldownDuration);
  }

                                                                                                         
  function OPEN299(bytes32 _secretHash) internal {	//inject NONSTANDARD NAMING
    drawState.OPENNEXTDRAW812();
    draws[drawState.openDrawIndex] = Draw(
      nextFeeFraction,
      nextFeeBeneficiary,
      block.number,
      _secretHash,
      bytes32(0),
      address(0),
      uint256(0),
      uint256(0)
    );
    emit OPENED103(
      drawState.openDrawIndex,
      nextFeeBeneficiary,
      _secretHash,
      nextFeeFraction
    );
  }

                                                  
  function EMITCOMMITTED1000() internal {	//inject NONSTANDARD NAMING
    uint256 drawId = CURRENTOPENDRAWID438();
    emit COMMITTED397(drawId);
    if (address(poolToken) != address(0)) {
      poolToken.POOLMINT348(OPENSUPPLY780());
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                      
  function OPENNEXTDRAW812(bytes32 nextSecretHash) public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    if (CURRENTCOMMITTEDDRAWID175() > 0) {
      require(CURRENTCOMMITTEDDRAWHASBEENREWARDED822(), "Pool/not-reward");
    }
    if (CURRENTOPENDRAWID438() != 0) {
      EMITCOMMITTED1000();
    }
    OPEN299(nextSecretHash);
  }

                                                                                                                                                                                                                                     
  function ROLLOVERANDOPENNEXTDRAW388(bytes32 nextSecretHash) public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    ROLLOVER676();
    OPENNEXTDRAW812(nextSecretHash);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function REWARDANDOPENNEXTDRAW516(bytes32 nextSecretHash, bytes32 lastSecret, bytes32 _salt) public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    REWARD388(lastSecret, _salt);
    OPENNEXTDRAW812(nextSecretHash);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function REWARD388(bytes32 _secret, bytes32 _salt) public ONLYADMIN889 ONLYLOCKED859 REQUIRECOMMITTEDNOREWARD106 NONREENTRANT401 {	//inject NONSTANDARD NAMING
    blocklock.UNLOCK63(block.number);

    // require that there is a committed draw
    // require that the committed draw has not been rewarded
    uint256 drawId = CURRENTCOMMITTEDDRAWID175();

    Draw storage draw = draws[drawId];

    require(draw.secretHash == keccak256(abi.encodePacked(_secret, _salt)), "Pool/bad-secret");

    // derive entropy from the revealed secret
    bytes32 entropy = keccak256(abi.encodePacked(_secret));

    // Select the winner using the hash as entropy
    address winningAddress = CALCULATEWINNER646(entropy);

    // Calculate the gross winnings
    uint256 underlyingBalance = BALANCE153();
    uint256 grossWinnings = underlyingBalance.SUB37(accountedBalance);

    // Calculate the beneficiary fee
    uint256 fee = CALCULATEFEE161(draw.feeFraction, grossWinnings);

    // Update balance of the beneficiary
    balances[draw.feeBeneficiary] = balances[draw.feeBeneficiary].ADD820(fee);

    // Calculate the net winnings
    uint256 netWinnings = grossWinnings.SUB37(fee);

    draw.winner = winningAddress;
    draw.netWinnings = netWinnings;
    draw.fee = fee;
    draw.entropy = entropy;

    // If there is a winner who is to receive non-zero winnings
    if (winningAddress != address(0) && netWinnings != 0) {
      // Updated the accounted total
      accountedBalance = underlyingBalance;

      AWARDWINNINGS464(winningAddress, netWinnings);
    } else {
      // Only account for the fee
      accountedBalance = accountedBalance.ADD820(fee);
    }

    emit REWARDED406(
      drawId,
      winningAddress,
      entropy,
      netWinnings,
      fee
    );
    emit FEECOLLECTED724(draw.feeBeneficiary, fee, drawId);
  }

  function AWARDWINNINGS464(address winner, uint256 amount) internal {	//inject NONSTANDARD NAMING
    // Update balance of the winner
    balances[winner] = balances[winner].ADD820(amount);

    // Enter their winnings into the open draw
    drawState.DEPOSIT532(winner, amount);
  }

                                                                                                                                                               
  function ROLLOVER676() public ONLYADMIN889 REQUIRECOMMITTEDNOREWARD106 {	//inject NONSTANDARD NAMING
    uint256 drawId = CURRENTCOMMITTEDDRAWID175();

    Draw storage draw = draws[drawId];
    draw.entropy = rolled_over_entropy_magic_number986;

    emit ROLLEDOVER638(
      drawId
    );

    emit REWARDED406(
      drawId,
      address(0),
      rolled_over_entropy_magic_number986,
      0,
      0
    );
  }

                                                                                                                                                                                                                                                                                 
  function CALCULATEFEE161(uint256 _feeFraction, uint256 _grossWinnings) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    int256 grossWinningsFixed = FixidityLib.NEWFIXED179(int256(_grossWinnings));
    int256 feeFixed = FixidityLib.MULTIPLY719(grossWinningsFixed, FixidityLib.NEWFIXED179(int256(_feeFraction), uint8(18)));
    return uint256(FixidityLib.FROMFIXED303(feeFixed));
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function DEPOSITSPONSORSHIP923(uint256 _amount) public UNLESSPAUSED599 NONREENTRANT401 {	//inject NONSTANDARD NAMING
    // Transfer the tokens into this contract
    require(TOKEN683().TRANSFERFROM466(msg.sender, address(this), _amount), "Pool/t-fail");

    // Deposit the sponsorship amount
    _DEPOSITSPONSORSHIPFROM941(msg.sender, _amount);
  }

                                                                                                                                                                                                                       
  function TRANSFERBALANCETOSPONSORSHIP256() public UNLESSPAUSED599 {	//inject NONSTANDARD NAMING
    // Deposit the sponsorship amount
    _DEPOSITSPONSORSHIPFROM941(address(this), TOKEN683().BALANCEOF289(address(this)));
  }

                                                                                                                                                                                                                                                                                                                                                                                                                  
  function DEPOSITPOOL710(uint256 _amount) public REQUIREOPENDRAW376 UNLESSPAUSED599 NONREENTRANT401 {	//inject NONSTANDARD NAMING
    // Transfer the tokens into this contract
    require(TOKEN683().TRANSFERFROM466(msg.sender, address(this), _amount), "Pool/t-fail");

    // Deposit the funds
    _DEPOSITPOOLFROM74(msg.sender, _amount);
  }

  function _DEPOSITSPONSORSHIPFROM941(address _spender, uint256 _amount) internal {	//inject NONSTANDARD NAMING
    // Deposit the funds
    _DEPOSITFROM969(_spender, _amount);

    emit SPONSORSHIPDEPOSITED414(_spender, _amount);
  }

  function _DEPOSITPOOLFROM74(address _spender, uint256 _amount) internal {	//inject NONSTANDARD NAMING
    // Update the user's eligibility
    drawState.DEPOSIT532(_spender, _amount);

    _DEPOSITFROM969(_spender, _amount);

    emit DEPOSITED769(_spender, _amount);
  }

  function _DEPOSITPOOLFROMCOMMITTED823(address _spender, uint256 _amount) internal NOTLOCKED240 {	//inject NONSTANDARD NAMING
    // Update the user's eligibility
    drawState.DEPOSITCOMMITTED435(_spender, _amount);

    _DEPOSITFROM969(_spender, _amount);

    emit DEPOSITEDANDCOMMITTED991(_spender, _amount);
  }

  function _DEPOSITFROM969(address _spender, uint256 _amount) internal {	//inject NONSTANDARD NAMING
    // Update the user's balance
    balances[_spender] = balances[_spender].ADD820(_amount);

    // Update the total of this contract
    accountedBalance = accountedBalance.ADD820(_amount);

    // Deposit into Compound
    require(TOKEN683().APPROVE276(address(cToken), _amount), "Pool/approve");
    require(cToken.MINT441(_amount) == 0, "Pool/supply");
  }

                                                                           
  function WITHDRAW988() public NONREENTRANT401 NOTLOCKED240 {	//inject NONSTANDARD NAMING

    uint256 sponsorshipAndFees = SPONSORSHIPANDFEEBALANCEOF409(msg.sender);
    uint256 openBalance = drawState.OPENBALANCEOF937(msg.sender);
    uint256 committedBalance = drawState.COMMITTEDBALANCEOF230(msg.sender);

    uint balance = balances[msg.sender];
    // Update their chances of winning
    drawState.WITHDRAW988(msg.sender);
    _WITHDRAW32(msg.sender, balance);

    if (address(poolToken) != address(0)) {
      poolToken.POOLREDEEM776(msg.sender, committedBalance);
    }

    emit SPONSORSHIPANDFEESWITHDRAWN227(msg.sender, sponsorshipAndFees);
    emit OPENDEPOSITWITHDRAWN633(msg.sender, openBalance);
    emit COMMITTEDDEPOSITWITHDRAWN134(msg.sender, committedBalance);
    emit WITHDRAWN997(msg.sender, balance);
  }

                                                                                                                         
  function WITHDRAWSPONSORSHIPANDFEE583(uint256 _amount) public {	//inject NONSTANDARD NAMING
    uint256 sponsorshipAndFees = SPONSORSHIPANDFEEBALANCEOF409(msg.sender);
    require(_amount <= sponsorshipAndFees, "Pool/exceeds-sfee");
    _WITHDRAW32(msg.sender, _amount);

    emit SPONSORSHIPANDFEESWITHDRAWN227(msg.sender, _amount);
  }

                                                                                                                                          
  function SPONSORSHIPANDFEEBALANCEOF409(address _sender) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return balances[_sender] - drawState.BALANCEOF289(_sender);
  }

                                                                                                  
  function WITHDRAWOPENDEPOSIT492(uint256 _amount) public {	//inject NONSTANDARD NAMING
    drawState.WITHDRAWOPEN591(msg.sender, _amount);
    _WITHDRAW32(msg.sender, _amount);

    emit OPENDEPOSITWITHDRAWN633(msg.sender, _amount);
  }

                                                                                                       
  function WITHDRAWCOMMITTEDDEPOSIT880(uint256 _amount) external NOTLOCKED240 returns (bool)  {	//inject NONSTANDARD NAMING
    _WITHDRAWCOMMITTEDDEPOSITANDEMIT923(msg.sender, _amount);
    if (address(poolToken) != address(0)) {
      poolToken.POOLREDEEM776(msg.sender, _amount);
    }
    return true;
  }

                                                                                                                                                                                                        
  function WITHDRAWCOMMITTEDDEPOSIT880(	//inject NONSTANDARD NAMING
    address _from,
    uint256 _amount
  ) external ONLYTOKEN387 NOTLOCKED240 returns (bool)  {
    return _WITHDRAWCOMMITTEDDEPOSITANDEMIT923(_from, _amount);
  }

                                                                                                                                                                                             
  function _WITHDRAWCOMMITTEDDEPOSITANDEMIT923(address _from, uint256 _amount) internal returns (bool) {	//inject NONSTANDARD NAMING
    drawState.WITHDRAWCOMMITTED311(_from, _amount);
    _WITHDRAW32(_from, _amount);

    emit COMMITTEDDEPOSITWITHDRAWN134(_from, _amount);

    return true;
  }

                                                                                                   
  function MOVECOMMITTED644(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint256 _amount
  ) external ONLYTOKEN387 ONLYCOMMITTEDBALANCEGTEQ603(_from, _amount) NOTLOCKED240 returns (bool) {
    balances[_from] = balances[_from].SUB37(_amount, "move could not sub amount");
    balances[_to] = balances[_to].ADD820(_amount);
    drawState.WITHDRAWCOMMITTED311(_from, _amount);
    drawState.DEPOSITCOMMITTED435(_to, _amount);

    return true;
  }

                                                                                                                 
  function _WITHDRAW32(address _sender, uint256 _amount) internal {	//inject NONSTANDARD NAMING
    uint balance = balances[_sender];

    require(_amount <= balance, "Pool/no-funds");

    // Update the user's balance
    balances[_sender] = balance.SUB37(_amount);

    // Update the total of this contract
    accountedBalance = accountedBalance.SUB37(_amount);

    // Withdraw from Compound and transfer
    require(cToken.REDEEMUNDERLYING321(_amount) == 0, "Pool/redeem");
    require(TOKEN683().TRANSFER590(_sender, _amount), "Pool/transfer");
  }

                                                                                                       
  function CURRENTOPENDRAWID438() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return drawState.openDrawIndex;
  }

                                                                                                                 
  function CURRENTCOMMITTEDDRAWID175() public view returns (uint256) {	//inject NONSTANDARD NAMING
    if (drawState.openDrawIndex > 1) {
      return drawState.openDrawIndex - 1;
    } else {
      return 0;
    }
  }

                                                                                                                                                                        
  function CURRENTCOMMITTEDDRAWHASBEENREWARDED822() internal view returns (bool) {	//inject NONSTANDARD NAMING
    Draw storage draw = draws[CURRENTCOMMITTEDDRAWID175()];
    return draw.entropy != bytes32(0);
  }

                                                                                                                                                                                                                                                                                                                                                                       
  function GETDRAW49(uint256 _drawId) public view returns (	//inject NONSTANDARD NAMING
    uint256 feeFraction,
    address feeBeneficiary,
    uint256 openedBlock,
    bytes32 secretHash,
    bytes32 entropy,
    address winner,
    uint256 netWinnings,
    uint256 fee
  ) {
    Draw storage draw = draws[_drawId];
    feeFraction = draw.feeFraction;
    feeBeneficiary = draw.feeBeneficiary;
    openedBlock = draw.openedBlock;
    secretHash = draw.secretHash;
    entropy = draw.entropy;
    winner = draw.winner;
    netWinnings = draw.netWinnings;
    fee = draw.fee;
  }

                                                                                                                                                                                                                                                         
  function COMMITTEDBALANCEOF230(address _addr) external view returns (uint256) {	//inject NONSTANDARD NAMING
    return drawState.COMMITTEDBALANCEOF230(_addr);
  }

                                                                                                                                                                                                                                                                   
  function OPENBALANCEOF937(address _addr) external view returns (uint256) {	//inject NONSTANDARD NAMING
    return drawState.OPENBALANCEOF937(_addr);
  }

                                                                                                                                                                                                                                      
  function TOTALBALANCEOF517(address _addr) external view returns (uint256) {	//inject NONSTANDARD NAMING
    return balances[_addr];
  }

                                                                                                                                                                                                                   
  function BALANCEOF289(address _addr) external view returns (uint256) {	//inject NONSTANDARD NAMING
    return drawState.COMMITTEDBALANCEOF230(_addr);
  }

                                                                                                                                                                                                       
  function CALCULATEWINNER646(bytes32 _entropy) public view returns (address) {	//inject NONSTANDARD NAMING
    return drawState.DRAWWITHENTROPY293(_entropy);
  }

                                                                                                                                                         
  function COMMITTEDSUPPLY838() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return drawState.COMMITTEDSUPPLY838();
  }

                                                                                                                                                                
  function OPENSUPPLY780() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return drawState.OPENSUPPLY780();
  }

                                                                                                                                                                                                                                               
  function ESTIMATEDINTERESTRATE399(uint256 _blocks) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return SUPPLYRATEPERBLOCK644().MUL96(_blocks);
  }

                                                                                                                                                                  
  function SUPPLYRATEPERBLOCK644() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return cToken.SUPPLYRATEPERBLOCK644();
  }

                                                                                                                                                                                                                                                                                                                       
  function SETNEXTFEEFRACTION573(uint256 _feeFraction) public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    _SETNEXTFEEFRACTION321(_feeFraction);
  }

  function _SETNEXTFEEFRACTION321(uint256 _feeFraction) internal {	//inject NONSTANDARD NAMING
    require(_feeFraction <= 1 ether, "Pool/less-1");
    nextFeeFraction = _feeFraction;

    emit NEXTFEEFRACTIONCHANGED672(_feeFraction);
  }

                                                                                                                                                                                                      
  function SETNEXTFEEBENEFICIARY62(address _feeBeneficiary) public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    _SETNEXTFEEBENEFICIARY918(_feeBeneficiary);
  }

  function _SETNEXTFEEBENEFICIARY918(address _feeBeneficiary) internal {	//inject NONSTANDARD NAMING
    require(_feeBeneficiary != address(0), "Pool/not-zero");
    nextFeeBeneficiary = _feeBeneficiary;

    emit NEXTFEEBENEFICIARYCHANGED977(_feeBeneficiary);
  }

                                                                                                                                                                              
  function ADDADMIN520(address _admin) public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    _ADDADMIN406(_admin);
  }

                                                                                                                                                                                   
  function ISADMIN312(address _admin) public view returns (bool) {	//inject NONSTANDARD NAMING
    return admins.HAS512(_admin);
  }

  function _ADDADMIN406(address _admin) internal {	//inject NONSTANDARD NAMING
    admins.ADD820(_admin);

    emit ADMINADDED752(_admin);
  }

                                                                                                                                                                                                                           
  function REMOVEADMIN343(address _admin) public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    require(admins.HAS512(_admin), "Pool/no-admin");
    require(_admin != msg.sender, "Pool/remove-self");
    admins.REMOVE152(_admin);

    emit ADMINREMOVED721(_admin);
  }

  modifier REQUIRECOMMITTEDNOREWARD106() {	//inject NONSTANDARD NAMING
    require(CURRENTCOMMITTEDDRAWID175() > 0, "Pool/committed");
    require(!CURRENTCOMMITTEDDRAWHASBEENREWARDED822(), "Pool/already");
    _;
  }

                                                                                                     
  function TOKEN683() public view returns (IERC20) {	//inject NONSTANDARD NAMING
    return IERC20(cToken.underlying());
  }

                                                                                                                                                     
  function BALANCE153() public returns (uint256) {	//inject NONSTANDARD NAMING
    return cToken.BALANCEOFUNDERLYING212(address(this));
  }

                                                                                                                                                                                                                                   
  function LOCKTOKENS476() public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    blocklock.LOCK308(block.number);
  }

                                                                                            
  function UNLOCKTOKENS586() public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    blocklock.UNLOCK63(block.number);
  }

                                                                                                                                                                                                      
  function PAUSE642() public UNLESSPAUSED599 ONLYADMIN889 {	//inject NONSTANDARD NAMING
    paused = true;

    emit PAUSED776(msg.sender);
  }

                                                        
  function UNPAUSE894() public WHENPAUSED545 ONLYADMIN889 {	//inject NONSTANDARD NAMING
    paused = false;

    emit UNPAUSED976(msg.sender);
  }

  function ISLOCKED626() public view returns (bool) {	//inject NONSTANDARD NAMING
    return blocklock.ISLOCKED626(block.number);
  }

  function LOCKENDAT624() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return blocklock.LOCKENDAT624();
  }

  function COOLDOWNENDAT158() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return blocklock.COOLDOWNENDAT158();
  }

  function CANLOCK997() public view returns (bool) {	//inject NONSTANDARD NAMING
    return blocklock.CANLOCK997(block.number);
  }

  function LOCKDURATION840() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return blocklock.lockDuration;
  }

  function COOLDOWNDURATION914() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return blocklock.cooldownDuration;
  }

  modifier NOTLOCKED240() {	//inject NONSTANDARD NAMING
    require(!blocklock.ISLOCKED626(block.number), "Pool/locked");
    _;
  }

  modifier ONLYLOCKED859() {	//inject NONSTANDARD NAMING
    require(blocklock.ISLOCKED626(block.number), "Pool/unlocked");
    _;
  }

  modifier ONLYADMIN889() {	//inject NONSTANDARD NAMING
    require(admins.HAS512(msg.sender), "Pool/admin");
    _;
  }

  modifier REQUIREOPENDRAW376() {	//inject NONSTANDARD NAMING
    require(CURRENTOPENDRAWID438() != 0, "Pool/no-open");
    _;
  }

  modifier WHENPAUSED545() {	//inject NONSTANDARD NAMING
    require(paused, "Pool/be-paused");
    _;
  }

  modifier UNLESSPAUSED599() {	//inject NONSTANDARD NAMING
    require(!paused, "Pool/not-paused");
    _;
  }

  modifier ONLYTOKEN387() {	//inject NONSTANDARD NAMING
    require(msg.sender == address(poolToken), "Pool/only-token");
    _;
  }

  modifier ONLYCOMMITTEDBALANCEGTEQ603(address _from, uint256 _amount) {	//inject NONSTANDARD NAMING
    uint256 committedBalance = drawState.COMMITTEDBALANCEOF230(_from);
    require(_amount <= committedBalance, "not enough funds");
    _;
  }
}





contract ScdMcdMigration {
    SaiTubLike                  public tub;
    VatLike                     public vat;
    ManagerLike                 public cdpManager;
    JoinLike                    public saiJoin;
    JoinLike                    public wethJoin;
    JoinLike                    public daiJoin;

    constructor(
        address tub_,           // SCD tub contract address
        address cdpManager_,    // MCD manager contract address
        address saiJoin_,       // MCD SAI collateral adapter contract address
        address wethJoin_,      // MCD ETH collateral adapter contract address
        address daiJoin_        // MCD DAI adapter contract address
    ) public {
        tub = SaiTubLike(tub_);
        cdpManager = ManagerLike(cdpManager_);
        vat = VatLike(cdpManager.VAT400());
        saiJoin = JoinLike(saiJoin_);
        wethJoin = JoinLike(wethJoin_);
        daiJoin = JoinLike(daiJoin_);

        require(wethJoin.GEM793() == tub.GEM793(), "non-matching-weth");
        require(saiJoin.GEM793() == tub.SAI854(), "non-matching-sai");

        tub.GOV936().APPROVE276(address(tub), uint(-1));
        tub.SKR115().APPROVE276(address(tub), uint(-1));
        tub.SAI854().APPROVE276(address(tub), uint(-1));
        tub.SAI854().APPROVE276(address(saiJoin), uint(-1));
        wethJoin.GEM793().APPROVE276(address(wethJoin), uint(-1));
        daiJoin.DAI628().APPROVE276(address(daiJoin), uint(-1));
        vat.HOPE963(address(daiJoin));
    }

    function ADD820(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "add-overflow");
    }

    function SUB37(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "sub-underflow");
    }

    function MUL96(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "mul-overflow");
    }

    function TOINT334(uint x) internal pure returns (int y) {	//inject NONSTANDARD NAMING
        y = int(x);
        require(y >= 0, "int-overflow");
    }

    // Function to swap SAI to DAI
    // This function is to be used by users that want to get new DAI in exchange of old one (aka SAI)
    // wad amount has to be <= the value pending to reach the debt ceiling (the minimum between general and ilk one)
    function SWAPSAITODAI551(	//inject NONSTANDARD NAMING
        uint wad
    ) external {
        // Get wad amount of SAI from user's wallet:
        saiJoin.GEM793().TRANSFERFROM466(msg.sender, address(this), wad);
        // Join the SAI wad amount to the `vat`:
        saiJoin.JOIN118(address(this), wad);
        // Lock the SAI wad amount to the CDP and generate the same wad amount of DAI
        vat.FROB781(saiJoin.ILK361(), address(this), address(this), address(this), TOINT334(wad), TOINT334(wad));
        // Send DAI wad amount as a ERC20 token to the user's wallet
        daiJoin.EXIT887(msg.sender, wad);
    }

    // Function to swap DAI to SAI
    // This function is to be used by users that want to get SAI in exchange of DAI
    // wad amount has to be <= the amount of SAI locked (and DAI generated) in the migration contract SAI CDP
    function SWAPDAITOSAI934(	//inject NONSTANDARD NAMING
        uint wad
    ) external {
        // Get wad amount of DAI from user's wallet:
        daiJoin.DAI628().TRANSFERFROM466(msg.sender, address(this), wad);
        // Join the DAI wad amount to the vat:
        daiJoin.JOIN118(address(this), wad);
        // Payback the DAI wad amount and unlocks the same value of SAI collateral
        vat.FROB781(saiJoin.ILK361(), address(this), address(this), address(this), -TOINT334(wad), -TOINT334(wad));
        // Send SAI wad amount as a ERC20 token to the user's wallet
        saiJoin.EXIT887(msg.sender, wad);
    }

    // Function to migrate a SCD CDP to MCD one (needs to be used via a proxy so the code can be kept simpler). Check MigrationProxyActions.sol code for usage.
    // In order to use migrate function, SCD CDP debtAmt needs to be <= SAI previously deposited in the SAI CDP * (100% - Collateralization Ratio)
    function MIGRATE608(	//inject NONSTANDARD NAMING
        bytes32 cup
    ) external returns (uint cdp) {
        // Get values
        uint debtAmt = tub.TAB952(cup);    // CDP SAI debt
        uint pethAmt = tub.INK214(cup);    // CDP locked collateral
        uint ethAmt = tub.BID960(pethAmt); // CDP locked collateral equiv in ETH

        // Take SAI out from MCD SAI CDP. For this operation is necessary to have a very low collateralization ratio
        // This is not actually a problem as this ilk will only be accessed by this migration contract,
        // which will make sure to have the amounts balanced out at the end of the execution.
        vat.FROB781(
            bytes32(saiJoin.ILK361()),
            address(this),
            address(this),
            address(this),
            -TOINT334(debtAmt),
            0
        );
        saiJoin.EXIT887(address(this), debtAmt); // SAI is exited as a token

        // Shut SAI CDP and gets WETH back
        tub.SHUT473(cup);      // CDP is closed using the SAI just exited and the MKR previously sent by the user (via the proxy call)
        tub.EXIT887(pethAmt);  // Converts PETH to WETH

        // Open future user's CDP in MCD
        cdp = cdpManager.OPEN299(wethJoin.ILK361(), address(this));

        // Join WETH to Adapter
        wethJoin.JOIN118(cdpManager.URNS165(cdp), ethAmt);

        // Lock WETH in future user's CDP and generate debt to compensate the SAI used to paid the SCD CDP
        (, uint rate,,,) = vat.ILKS967(wethJoin.ILK361());
        cdpManager.FROB781(
            cdp,
            TOINT334(ethAmt),
            TOINT334(MUL96(debtAmt, 10 ** 27) / rate + 1) // To avoid rounding issues we add an extra wei of debt
        );
        // Move DAI generated to migration contract (to recover the used funds)
        cdpManager.MOVE213(cdp, address(this), MUL96(debtAmt, 10 ** 27));
        // Re-balance MCD SAI migration contract's CDP
        vat.FROB781(
            bytes32(saiJoin.ILK361()),
            address(this),
            address(this),
            address(this),
            0,
            -TOINT334(debtAmt)
        );

        // Set ownership of CDP to the user
        cdpManager.GIVE448(cdp, msg.sender);
    }
}




                                                                                                                                                                                                                                                                                                                                                                                                                      
interface IERC777Recipient {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function TOKENSRECEIVED789(	//inject NONSTANDARD NAMING
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) external;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
contract MCDAwarePool is BasePool, IERC777Recipient {
  IERC1820Registry constant internal erc1820_registry666 = IERC1820Registry(0x1820a4B7618BdE71Dce8cdc73aAB6C95905faD24);	//inject NONSTANDARD NAMING

  // keccak256("ERC777TokensRecipient")
  bytes32 constant internal tokens_recipient_interface_hash630 =	//inject NONSTANDARD NAMING
      0xb281fc8c12954d22544db45de3159a39272895b169a852b314f9cc762e44c53b;

                                                                                                                                                                                                                                                     
  ScdMcdMigration public scdMcdMigration;

                                                             
  MCDAwarePool public saiPool;

                                                                                                                                                                                                                                                                                                                              
  function INIT491 (	//inject NONSTANDARD NAMING
    address _owner,
    address _cToken,
    uint256 _feeFraction,
    address _feeBeneficiary,
    uint256 lockDuration,
    uint256 cooldownDuration
  ) public INITIALIZER501 {
    super.INIT491(
      _owner,
      _cToken,
      _feeFraction,
      _feeBeneficiary,
      lockDuration,
      cooldownDuration
    );
    INITREGISTRY386();
    INITBLOCKLOCK440(lockDuration, cooldownDuration);
  }

                                                                                                                                                                                                 
  function INITMCDAWAREPOOL747(uint256 lockDuration, uint256 cooldownDuration) public {	//inject NONSTANDARD NAMING
    INITREGISTRY386();
    if (blocklock.lockDuration == 0) {
      INITBLOCKLOCK440(lockDuration, cooldownDuration);
    }
  }

  function INITREGISTRY386() internal {	//inject NONSTANDARD NAMING
    erc1820_registry666.SETINTERFACEIMPLEMENTER592(address(this), tokens_recipient_interface_hash630, address(this));
  }

  function INITMIGRATION905(ScdMcdMigration _scdMcdMigration, MCDAwarePool _saiPool) public ONLYADMIN889 {	//inject NONSTANDARD NAMING
    _INITMIGRATION128(_scdMcdMigration, _saiPool);
  }

  function _INITMIGRATION128(ScdMcdMigration _scdMcdMigration, MCDAwarePool _saiPool) internal {	//inject NONSTANDARD NAMING
    require(address(scdMcdMigration) == address(0), "Pool/init");
    require(address(_scdMcdMigration) != address(0), "Pool/mig-def");
    scdMcdMigration = _scdMcdMigration;
    saiPool = _saiPool; // may be null
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function TOKENSRECEIVED789(	//inject NONSTANDARD NAMING
    address, // operator
    address from,
    address, // to address can't be anything but us because we don't implement ERC1820ImplementerInterface
    uint256 amount,
    bytes calldata,
    bytes calldata
  ) external UNLESSPAUSED599 {
    require(msg.sender == address(SAIPOOLTOKEN202()), "Pool/sai-only");
    require(address(TOKEN683()) == address(DAITOKEN891()), "Pool/not-dai");

    // cash out of the Pool.  This call transfers sai to this contract
    SAIPOOLTOKEN202().REDEEM105(amount, '');

    // approve of the transfer to the migration contract
    SAITOKEN40().APPROVE276(address(scdMcdMigration), amount);

    // migrate the sai to dai.  The contract now has dai
    scdMcdMigration.SWAPSAITODAI551(amount);

    if (CURRENTCOMMITTEDDRAWID175() > 0) {
      // now deposit the dai as tickets
      _DEPOSITPOOLFROMCOMMITTED823(from, amount);
    } else {
      _DEPOSITPOOLFROM74(from, amount);
    }
  }

  function SAIPOOLTOKEN202() internal view returns (PoolToken) {	//inject NONSTANDARD NAMING
    if (address(saiPool) != address(0)) {
      return saiPool.poolToken();
    } else {
      return PoolToken(0);
    }
  }

  function SAITOKEN40() public returns (GemLike) {	//inject NONSTANDARD NAMING
    return scdMcdMigration.saiJoin().GEM793();
  }

  function DAITOKEN891() public returns (GemLike) {	//inject NONSTANDARD NAMING
    return scdMcdMigration.daiJoin().DAI628();
  }
}