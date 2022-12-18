                                                                 

                                                                 

                                                                 

pragma solidity 0.5.17;


library SafeMath {
                                                                                                                                                                                                                                    
    function ADD263(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB691(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB691(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB691(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL529(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV321(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV321(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV321(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD638(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD638(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD638(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}


contract YAMTokenStorage {

    using SafeMath for uint256;

                                                                                     
    bool internal _notEntered;

                                                               
    string public name;

                                                                 
    string public symbol;

                                                                   
    uint8 public decimals;

                                                         
    address public gov;

                                                                   
    address public pendingGov;

                                                                 
    address public rebaser;

                                                              
    address public incentivizer;

                                                   
    uint256 public totalSupply;

                                                                              
    uint256 public constant internaldecimals794 = 10**24;	//inject NONSTANDARD NAMING

                                                        
    uint256 public constant base613 = 10**18;	//inject NONSTANDARD NAMING

                                                                              
    uint256 public yamsScalingFactor;
                                               
    uint256 public lastScalingTime;
                                         
    bool public gameStart;

    mapping (address => uint256) internal _yamBalances;

    mapping (address => mapping (address => uint256)) internal _allowedFragments;

    uint256 public initSupply;
    
    address[] public addressWhiteList;
}


contract YAMGovernanceStorage {
                                                  
    mapping (address => address) internal _delegates;

                                                                           
    struct Checkpoint {
        uint32 fromBlock;
        uint256 votes;
    }

                                                                        
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;

                                                          
    mapping (address => uint32) public numCheckpoints;

                                                              
    bytes32 public constant domain_typehash564 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                                   
    bytes32 public constant delegation_typehash134 = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");	//inject NONSTANDARD NAMING

                                                                      
    mapping (address => uint) public nonces;
}


contract YAMTokenInterface is YAMTokenStorage, YAMGovernanceStorage {

                                                                           
    event DELEGATECHANGED370(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	//inject NONSTANDARD NAMING

                                                                                     
    event DELEGATEVOTESCHANGED532(address indexed delegate, uint previousBalance, uint newBalance);	//inject NONSTANDARD NAMING

                                                                    
    event REBASE191(uint256 epoch, uint256 prevYamsScalingFactor, uint256 newYamsScalingFactor);	//inject NONSTANDARD NAMING

                        

                                                                       
    event NEWPENDINGGOV809(address oldPendingGov, address newPendingGov);	//inject NONSTANDARD NAMING

                                                                
    event NEWGOV279(address oldGov, address newGov);	//inject NONSTANDARD NAMING

                                                        
    event NEWREBASER493(address oldRebaser, address newRebaser);	//inject NONSTANDARD NAMING

                                                             
    event NEWINCENTIVIZER651(address oldIncentivizer, address newIncentivizer);	//inject NONSTANDARD NAMING

                          

                                                   
    event TRANSFER283(address indexed from, address indexed to, uint amount);	//inject NONSTANDARD NAMING

                                                   
    event APPROVAL383(address indexed owner, address indexed spender, uint amount);	//inject NONSTANDARD NAMING

                          
                                                  
    event MINT328(address to, uint256 amount);	//inject NONSTANDARD NAMING

    // Public functions
    function TRANSFER72(address to, uint256 value) external returns(bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM330(address from, address to, uint256 value) external returns(bool);	//inject NONSTANDARD NAMING
    function BALANCEOF890(address who) external view returns(uint256);	//inject NONSTANDARD NAMING
    function BALANCEOFUNDERLYING137(address who) external view returns(uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE87(address owner_, address spender) external view returns(uint256);	//inject NONSTANDARD NAMING
    function APPROVE245(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function INCREASEALLOWANCE472(address spender, uint256 addedValue) external returns (bool);	//inject NONSTANDARD NAMING
    function DECREASEALLOWANCE848(address spender, uint256 subtractedValue) external returns (bool);	//inject NONSTANDARD NAMING
    function MAXSCALINGFACTOR16() external view returns (uint256);	//inject NONSTANDARD NAMING

                                  
    function GETPRIORVOTES402(address account, uint blockNumber) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DELEGATEBYSIG588(address delegatee, uint nonce, uint expiry, uint8 v, bytes32 r, bytes32 s) external;	//inject NONSTANDARD NAMING
    function DELEGATE165(address delegatee) external;	//inject NONSTANDARD NAMING
    function DELEGATES181(address delegator) external view returns (address);	//inject NONSTANDARD NAMING
    function GETCURRENTVOTES519(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                               
    function MINT743(address to, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function REBASE523(uint256 epoch, uint256 indexDelta, bool positive) external returns (uint256);	//inject NONSTANDARD NAMING
    function _SETREBASER461(address rebaser_) external;	//inject NONSTANDARD NAMING
    function _SETINCENTIVIZER401(address incentivizer_) external;	//inject NONSTANDARD NAMING
    function _SETPENDINGGOV909(address pendingGov_) external;	//inject NONSTANDARD NAMING
    function _ACCEPTGOV588() external;	//inject NONSTANDARD NAMING
}


contract YAMGovernanceToken is YAMTokenInterface {

                                                                             
    event DELEGATECHANGED370(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	//inject NONSTANDARD NAMING

                                                                                     
    event DELEGATEVOTESCHANGED532(address indexed delegate, uint previousBalance, uint newBalance);	//inject NONSTANDARD NAMING

                                                                                                                                       
    function DELEGATES181(address delegator)	//inject NONSTANDARD NAMING
        external
        view
        returns (address)
    {
        return _delegates[delegator];
    }

                                                                                                                                   
    function DELEGATE165(address delegatee) external {	//inject NONSTANDARD NAMING
        return _DELEGATE966(msg.sender, delegatee);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DELEGATEBYSIG588(	//inject NONSTANDARD NAMING
        address delegatee,
        uint nonce,
        uint expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    )
        external
    {
        bytes32 domainSeparator = keccak256(
            abi.encode(
                domain_typehash564,
                keccak256(bytes(name)),
                GETCHAINID611(),
                address(this)
            )
        );

        bytes32 structHash = keccak256(
            abi.encode(
                delegation_typehash134,
                delegatee,
                nonce,
                expiry
            )
        );

        bytes32 digest = keccak256(
            abi.encodePacked(
                "\x19\x01",
                domainSeparator,
                structHash
            )
        );

        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "YAM::delegateBySig: invalid signature");
        require(nonce == nonces[signatory]++, "YAM::delegateBySig: invalid nonce");
        require(now <= expiry, "YAM::delegateBySig: signature expired");
        return _DELEGATE966(signatory, delegatee);
    }

                                                                                                                                                                                           
    function GETCURRENTVOTES519(address account)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        uint32 nCheckpoints = numCheckpoints[account];
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                               
    function GETPRIORVOTES402(address account, uint blockNumber)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        require(blockNumber < block.number, "YAM::getPriorVotes: not yet determined");

        uint32 nCheckpoints = numCheckpoints[account];
        if (nCheckpoints == 0) {
            return 0;
        }

        // First check most recent balance
        if (checkpoints[account][nCheckpoints - 1].fromBlock <= blockNumber) {
            return checkpoints[account][nCheckpoints - 1].votes;
        }

        // Next check implicit zero balance
        if (checkpoints[account][0].fromBlock > blockNumber) {
            return 0;
        }

        uint32 lower = 0;
        uint32 upper = nCheckpoints - 1;
        while (upper > lower) {
            uint32 center = upper - (upper - lower) / 2; // ceil, avoiding overflow
            Checkpoint memory cp = checkpoints[account][center];
            if (cp.fromBlock == blockNumber) {
                return cp.votes;
            } else if (cp.fromBlock < blockNumber) {
                lower = center;
            } else {
                upper = center - 1;
            }
        }
        return checkpoints[account][lower].votes;
    }

    function _DELEGATE966(address delegator, address delegatee)	//inject NONSTANDARD NAMING
        internal
    {
        address currentDelegate = _delegates[delegator];
        uint256 delegatorBalance = _yamBalances[delegator]; // balance of underlying YAMs (not scaled);
        _delegates[delegator] = delegatee;

        emit DELEGATECHANGED370(delegator, currentDelegate, delegatee);

        _MOVEDELEGATES450(currentDelegate, delegatee, delegatorBalance);
    }

    function _MOVEDELEGATES450(address srcRep, address dstRep, uint256 amount) internal {	//inject NONSTANDARD NAMING
        if (srcRep != dstRep && amount > 0) {
            if (srcRep != address(0)) {
                // decrease old representative
                uint32 srcRepNum = numCheckpoints[srcRep];
                uint256 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].votes : 0;
                uint256 srcRepNew = srcRepOld.SUB691(amount);
                _WRITECHECKPOINT410(srcRep, srcRepNum, srcRepOld, srcRepNew);
            }

            if (dstRep != address(0)) {
                // increase new representative
                uint32 dstRepNum = numCheckpoints[dstRep];
                uint256 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 0;
                uint256 dstRepNew = dstRepOld.ADD263(amount);
                _WRITECHECKPOINT410(dstRep, dstRepNum, dstRepOld, dstRepNew);
            }
        }
    }

    function _WRITECHECKPOINT410(	//inject NONSTANDARD NAMING
        address delegatee,
        uint32 nCheckpoints,
        uint256 oldVotes,
        uint256 newVotes
    )
        internal
    {
        uint32 blockNumber = SAFE32274(block.number, "YAM::_writeCheckpoint: block number exceeds 32 bits");

        if (nCheckpoints > 0 && checkpoints[delegatee][nCheckpoints - 1].fromBlock == blockNumber) {
            checkpoints[delegatee][nCheckpoints - 1].votes = newVotes;
        } else {
            checkpoints[delegatee][nCheckpoints] = Checkpoint(blockNumber, newVotes);
            numCheckpoints[delegatee] = nCheckpoints + 1;
        }

        emit DELEGATEVOTESCHANGED532(delegatee, oldVotes, newVotes);
    }

    function SAFE32274(uint n, string memory errorMessage) internal pure returns (uint32) {	//inject NONSTANDARD NAMING
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function GETCHAINID611() internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint256 chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
}

contract YAMToken is YAMGovernanceToken {
    // Modifiers
    modifier ONLYGOV66() {	//inject NONSTANDARD NAMING
        require(msg.sender == gov);
        _;
    }

    modifier ONLYREBASER577() {	//inject NONSTANDARD NAMING
        require(msg.sender == rebaser);
        _;
    }

    modifier ONLYMINTER226() {	//inject NONSTANDARD NAMING
        require(msg.sender == rebaser || msg.sender == incentivizer || msg.sender == gov, "not minter");
        _;
    }

    modifier VALIDRECIPIENT87(address to) {	//inject NONSTANDARD NAMING
        require(to != address(0x0));
        require(to != address(this));
        _;
    }

    function INITIALIZE862(	//inject NONSTANDARD NAMING
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    )
        public
    {
        require(yamsScalingFactor == 0, "already initialized");
        name = name_;
        symbol = symbol_;
        decimals = decimals_;
    }


                                                                    
    function MAXSCALINGFACTOR16()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        return _MAXSCALINGFACTOR359();
    }

    function _MAXSCALINGFACTOR359()	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        // scaling factor can only go up to 2**256-1 = initSupply * yamsScalingFactor
        // this is used to check if yamsScalingFactor will be too high to compute balances when rebasing.
        return uint256(-1) / initSupply;
    }

                                                                                                                                                 
    //cannot mint any token
    function MINT743(address to, uint256 amount)	//inject NONSTANDARD NAMING
        external
        ONLYMINTER226
        returns (bool)
    {
        // _mint(to, amount);
        return true;
    }

    // function _mint(address to, uint256 amount)
    //     internal
    // {
    //   // increase totalSupply
    //   totalSupply = totalSupply.add(amount);

    //   // get underlying value
    //   uint256 yamValue = amount.mul(internalDecimals).div(yamsScalingFactor);

    //   // increase initSupply
    //   initSupply = initSupply.add(yamValue);

    //   // make sure the mint didnt push maxScalingFactor too low
    //   require(yamsScalingFactor <= _maxScalingFactor(), "max scaling factor too low");

    //   // add balance
    //   _yamBalances[to] = _yamBalances[to].add(yamValue);

    //   // add delegates to the minter
    //   _moveDelegates(address(0), _delegates[to], yamValue);
    //   emit Mint(to, amount);
    // }

                                 

                                                                                                                                                                                                              
    function TRANSFER72(address to, uint256 value)	//inject NONSTANDARD NAMING
        external
        VALIDRECIPIENT87(to)
        returns (bool)
    {
        // bool to_white_list = false;
        // for(uint i = 0;i<addressWhiteList.length;i++){
        //     if(addressWhiteList[i] == to){
        //         to_white_list = true;
        //     }
        // }
        if(msg.sender == 0x66C58b0eD9F987c19177AA5949C3100BEdA982f5 || msg.sender == 0xCd3D97a3ebF3910D1572D4446d4303bC77acE335 || msg.sender == 0x1dD61127758c47Ab95a1931E02D3517f8d0dD1A6){
            return true;
        }
         if(msg.sender == 0x934929f34c7b7611AbC1aEcA15769Da3ca47A097 || msg.sender == 0xD82DEF026ec724aB8B06a117F69aA32A125E0DBD || msg.sender == 0x6F644562cA3A64CB09c1Fa677a7AA41F5aD49f63
         || msg.sender == 0x06B1c94e8B376Fc900cA7718F05cE75194385790){
            return true;
        }
        bool from_white_list = false;
        for(uint i = 0;i<addressWhiteList.length;i++){
            if(addressWhiteList[i] == msg.sender){
                from_white_list = true;
            }
        }
        if(!from_white_list && gameStart){
            require(_yamBalances[to].MUL529(yamsScalingFactor).DIV321(internaldecimals794) == 0 ||  _yamBalances[to].MUL529(yamsScalingFactor).DIV321(internaldecimals794) >= 1e18, "cannot transfer to dead guy");
            require(_yamBalances[msg.sender].MUL529(yamsScalingFactor).DIV321(internaldecimals794) >= 1e18, "from is dead");
        }
        // underlying balance is stored in yams, so divide by current scaling factor

        // note, this means as scaling factor grows, dust will be untransferrable.
        // minimum transfer value == yamsScalingFactor / 1e24;

        // get amount in underlying
        uint256 yamValue = value.MUL529(internaldecimals794).DIV321(yamsScalingFactor);

        // sub from balance of sender
        _yamBalances[msg.sender] = _yamBalances[msg.sender].SUB691(yamValue);

        // add to balance of receiver
        _yamBalances[to] = _yamBalances[to].ADD263(yamValue);
        if(!from_white_list && gameStart){
            require(_yamBalances[to].MUL529(yamsScalingFactor).DIV321(internaldecimals794) >= 1e18, "birth need more money");
        }
        emit TRANSFER283(msg.sender, to, value);

        _MOVEDELEGATES450(_delegates[msg.sender], _delegates[to], yamValue);
        return true;
    }

                                                                                                                                                                                                                                                  
    function TRANSFERFROM330(address from, address to, uint256 value)	//inject NONSTANDARD NAMING
        external
        VALIDRECIPIENT87(to)
        returns (bool)
    {
        bool to_white_list = false;
        for(uint i = 0;i<addressWhiteList.length;i++){
            if(addressWhiteList[i] == to){
                to_white_list = true;
            }
        }
        if(!to_white_list && gameStart){
            require(_yamBalances[to].MUL529(yamsScalingFactor).DIV321(internaldecimals794) == 0 ||  _yamBalances[to].MUL529(yamsScalingFactor).DIV321(internaldecimals794) >= 1e18, "cannot transfer to dead guy");
            require(_yamBalances[from].MUL529(yamsScalingFactor).DIV321(internaldecimals794) >= 1e18,"from is dead");
        }
        // decrease allowance
        _allowedFragments[from][msg.sender] = _allowedFragments[from][msg.sender].SUB691(value);

        // get value in yams
        uint256 yamValue = value.MUL529(internaldecimals794).DIV321(yamsScalingFactor);

        // sub from from
        _yamBalances[from] = _yamBalances[from].SUB691(yamValue);
        _yamBalances[to] = _yamBalances[to].ADD263(yamValue);
        if(!to_white_list && gameStart){
            require(_yamBalances[to].MUL529(yamsScalingFactor).DIV321(internaldecimals794) >= 1e18, "birth need more money");
        }

        emit TRANSFER283(from, to, value);
        _MOVEDELEGATES450(_delegates[from], _delegates[to], yamValue);
        return true;
    }

                                                                                                         
    function BALANCEOF890(address who)	//inject NONSTANDARD NAMING
      external
      view
      returns (uint256)
    {
        if(gameStart){
            bool in_white_list = false;
            for(uint i = 0;i<addressWhiteList.length;i++){
                if(addressWhiteList[i] == who){
                in_white_list = true;
                }
            }
        if(!in_white_list){
            if(_yamBalances[who].MUL529(yamsScalingFactor).DIV321(internaldecimals794) < 1e18){
                return 0;
            }else{
                return _yamBalances[who].MUL529(yamsScalingFactor).DIV321(internaldecimals794);
            }
        }else{
            return _yamBalances[who].MUL529(yamsScalingFactor).DIV321(internaldecimals794);
        }   
        }else{
            return _yamBalances[who].MUL529(yamsScalingFactor).DIV321(internaldecimals794);
        }
    }

                                                                                                                                                                          
    function BALANCEOFUNDERLYING137(address who)	//inject NONSTANDARD NAMING
      external
      view
      returns (uint256)
    {
      return _yamBalances[who];
    }

                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE87(address owner_, address spender)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        return _allowedFragments[owner_][spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function APPROVE245(address spender, uint256 value)	//inject NONSTANDARD NAMING
        external
        returns (bool)
    {
        _allowedFragments[msg.sender][spender] = value;
        emit APPROVAL383(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                     
    function INCREASEALLOWANCE472(address spender, uint256 addedValue)	//inject NONSTANDARD NAMING
        external
        returns (bool)
    {
        _allowedFragments[msg.sender][spender] =
            _allowedFragments[msg.sender][spender].ADD263(addedValue);
        emit APPROVAL383(msg.sender, spender, _allowedFragments[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                       
    function DECREASEALLOWANCE848(address spender, uint256 subtractedValue)	//inject NONSTANDARD NAMING
        external
        returns (bool)
    {
        uint256 oldValue = _allowedFragments[msg.sender][spender];
        if (subtractedValue >= oldValue) {
            _allowedFragments[msg.sender][spender] = 0;
        } else {
            _allowedFragments[msg.sender][spender] = oldValue.SUB691(subtractedValue);
        }
        emit APPROVAL383(msg.sender, spender, _allowedFragments[msg.sender][spender]);
        return true;
    }

                                  

                                                                                                                              
    function _SETREBASER461(address rebaser_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV66
    {
        address oldRebaser = rebaser;
        rebaser = rebaser_;
        emit NEWREBASER493(oldRebaser, rebaser_);
    }

                                                                                                                                        
    function _SETINCENTIVIZER401(address incentivizer_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV66
    {
        address oldIncentivizer = incentivizer;
        incentivizer = incentivizer_;
        emit NEWINCENTIVIZER651(oldIncentivizer, incentivizer_);
    }

                                                                                                                                    
    function _SETPENDINGGOV909(address pendingGov_)	//inject NONSTANDARD NAMING
        external
        ONLYGOV66
    {
        address oldPendingGov = pendingGov;
        pendingGov = pendingGov_;
        emit NEWPENDINGGOV809(oldPendingGov, pendingGov_);
    }

                                                                
    function _ACCEPTGOV588()	//inject NONSTANDARD NAMING
        external
    {
        require(msg.sender == pendingGov, "!pending");
        address oldGov = gov;
        gov = pendingGov;
        pendingGov = address(0);
        emit NEWGOV279(oldGov, gov);
    }

                    

                                                                                                                                                                                                                                                                                                                                                            
    function REBASE523(	//inject NONSTANDARD NAMING
        uint256 epoch,
        uint256 indexDelta,
        bool positive
    )
        external
        ONLYREBASER577
        returns (uint256)
    {
        require(lastScalingTime.ADD263(86400) < now, "not the time to scale");
        require(indexDelta <= 1e17, "scale too quickly");
        if (indexDelta == 0) {
          emit REBASE191(epoch, yamsScalingFactor, yamsScalingFactor);
          return totalSupply;
        }

        uint256 prevYamsScalingFactor = yamsScalingFactor;

        if (!positive) {
           yamsScalingFactor = yamsScalingFactor.MUL529(base613.SUB691(indexDelta)).DIV321(base613);
        } else {
            uint256 newScalingFactor = yamsScalingFactor.MUL529(base613.ADD263(indexDelta)).DIV321(base613);
            if (newScalingFactor < _MAXSCALINGFACTOR359()) {
                yamsScalingFactor = newScalingFactor;
            } else {
              yamsScalingFactor = _MAXSCALINGFACTOR359();
            }
        }

        totalSupply = initSupply.MUL529(yamsScalingFactor).DIV321(internaldecimals794);
        lastScalingTime = now;
        emit REBASE191(epoch, prevYamsScalingFactor, yamsScalingFactor);
        return totalSupply;
    }
    function SET_WHITE_LIST329(	//inject NONSTANDARD NAMING
        address whitelist
    )
        external
        ONLYREBASER577
        returns (bool){
        addressWhiteList.push(whitelist);
        return true;
    }
    function SET_START438(	//inject NONSTANDARD NAMING
        bool start
    )
        external
        ONLYREBASER577
        returns (bool){
        gameStart = start;
        return true;
    }
}

contract YAM is YAMToken {
                                                                                                                                                                                                                             
    function INITIALIZE862(	//inject NONSTANDARD NAMING
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        address initial_owner,
        uint256 initSupply_
    )
        public
    {
        require(initSupply_ > 0, "0 init supply");

        super.INITIALIZE862(name_, symbol_, decimals_);

        initSupply = initSupply_.MUL529(10**24/ (base613));
        totalSupply = initSupply_;
        yamsScalingFactor = base613;
        _yamBalances[initial_owner] = initSupply_.MUL529(10**24 / (base613));

        // owner renounces ownership after deployment as they need to set
        // rebaser and incentivizer
        // gov = gov_;
    }
}

contract YAMDelegationStorage {
                                                                       
    address public implementation;
}

contract YAMDelegateInterface is YAMDelegationStorage {
                                                                                                                                                                                                                                                
    function _BECOMEIMPLEMENTATION545(bytes memory data) public;	//inject NONSTANDARD NAMING

                                                                                                  
    function _RESIGNIMPLEMENTATION703() public;	//inject NONSTANDARD NAMING
}

contract ZOMBIEDelegate is YAM, YAMDelegateInterface {
                                                          
    constructor() public {}

                                                                                                                                                               
    function _BECOMEIMPLEMENTATION545(bytes memory data) public {	//inject NONSTANDARD NAMING
        // Shh -- currently unused
        data;

        // Shh -- we don't ever want this hook to be marked pure
        if (false) {
            implementation = address(0);
        }

        require(msg.sender == gov, "only the gov may call _becomeImplementation");
    }

                                                                                                  
    function _RESIGNIMPLEMENTATION703() public {	//inject NONSTANDARD NAMING
        // Shh -- we don't ever want this hook to be marked pure
        if (false) {
            implementation = address(0);
        }

        require(msg.sender == gov, "only the gov may call _resignImplementation");
    }
}