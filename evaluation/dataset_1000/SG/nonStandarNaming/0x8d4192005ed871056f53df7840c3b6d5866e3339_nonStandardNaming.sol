                                                                 

pragma solidity ^0.5.16;

library SafeMath {
    function MUL550(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
          return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }
    
    function DIV221(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }
    
    function SUB690(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }
    
    function ADD176(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract LockIdGen {

    uint256 public requestCount;

    constructor() public {
        requestCount = 0;
    }

    function GENERATELOCKID304() internal returns (bytes32 lockId) {	//inject NONSTANDARD NAMING
        return keccak256(abi.encodePacked(blockhash(block.number-1), address(this), ++requestCount));
    }
}
                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT245(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE915(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE871(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER872(StandardToken token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN811(token, abi.encodeWithSelector(token.TRANSFER576.selector, to, value));
    }

    function SAFETRANSFERFROM439(StandardToken token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN811(token, abi.encodeWithSelector(token.TRANSFERFROM53.selector, from, to, value));
    }

    function SAFEAPPROVE697(StandardToken token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE335(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN811(token, abi.encodeWithSelector(token.APPROVE151.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE567(StandardToken token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE335(address(this), spender).ADD176(value);
        CALLOPTIONALRETURN811(token, abi.encodeWithSelector(token.APPROVE151.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE264(StandardToken token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE335(address(this), spender).SUB690(value);
        CALLOPTIONALRETURN811(token, abi.encodeWithSelector(token.APPROVE151.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN811(ERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT245(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract ManagerUpgradeable is LockIdGen {

    struct ChangeRequest {
        address proposedNew;
        address proposedClear;
    }

    // address public custodian;
    mapping (address => address) public managers;

    mapping (bytes32 => ChangeRequest) public changeReqs;

    uint256     public    mancount  ;

    // CONSTRUCTOR
    constructor(
         address  [] memory _mans
    )
      LockIdGen()
      public
    {
        uint256 numMans = _mans.length;
        for (uint256 i = 0; i < numMans; i++) {
          address pto = _mans[i];
          require(pto != address(0));
          managers[pto] = pto;
        }
        mancount = 0;
    }

    modifier ONLYMANAGER596 {	//inject NONSTANDARD NAMING
        require(msg.sender == managers[msg.sender]);
        _;
    }

    // for manager change
    function REQUESTCHANGE607(address _new,address _clear) public ONLYMANAGER596 returns (bytes32 lockId) {	//inject NONSTANDARD NAMING
        require( _clear != address(0) || _new != address(0) );

        require( _clear == address(0) || managers[_clear] == _clear);

        lockId = GENERATELOCKID304();

        changeReqs[lockId] = ChangeRequest({
            proposedNew: _new,
            proposedClear: _clear
        });

        emit CHANGEREQUESTED396(lockId, msg.sender, _new,_clear);
    }

    event CHANGEREQUESTED396(	//inject NONSTANDARD NAMING
        bytes32 _lockId,
        address _msgSender,
        address _new,
        address _clear
    );

   function CONFIRMCHANGE0(bytes32 _lockId) public ONLYMANAGER596 {	//inject NONSTANDARD NAMING
        ChangeRequest storage changeRequest = changeReqs[_lockId];
        require( changeRequest.proposedNew != address(0) || changeRequest.proposedClear != address(0));

        if(changeRequest.proposedNew != address(0))
        {
            managers[changeRequest.proposedNew] = changeRequest.proposedNew;
            mancount = mancount + 1;
        }

        if(changeRequest.proposedClear != address(0))
        {
            delete managers[changeRequest.proposedClear];
            mancount = mancount - 1;
        }

        delete changeReqs[_lockId];

        emit CHANGECONFIRMED250(_lockId, changeRequest.proposedNew,changeRequest.proposedClear);
    }
    event CHANGECONFIRMED250(bytes32 _lockId, address _newCustodian, address _clearCustodian);	//inject NONSTANDARD NAMING

    function SWEEPCHANGE607(bytes32 _lockId) public ONLYMANAGER596 {	//inject NONSTANDARD NAMING
        ChangeRequest storage changeRequest=changeReqs[_lockId];
        require((changeRequest.proposedNew != address(0) || changeRequest.proposedClear != address(0) ));
        delete changeReqs[_lockId];
        emit CHANGESWEEP885(_lockId, msg.sender);
    }
    event CHANGESWEEP885(bytes32 _lockId, address _sender);	//inject NONSTANDARD NAMING

}

contract ERC20Basic {
    // events
    event TRANSFER285(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    // public functions
    function TOTALSUPPLY552() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF223(address addr) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER576(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
}

contract ERC20 is ERC20Basic {
    // events
    event APPROVAL300(address indexed owner, address indexed agent, uint256 value);	//inject NONSTANDARD NAMING

    // public functions
    function ALLOWANCE335(address owner, address agent) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM53(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE151(address agent, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

}

contract DFK is ManagerUpgradeable {
            
    //liquidity +
    function STAKINGDEPOSIT140(uint256 value) public payable returns (bool);	//inject NONSTANDARD NAMING

    //profit +
    function PROFIT2STAKING678(uint256 value)public  returns (bool success);	//inject NONSTANDARD NAMING
    
	
    function WITHDRAWPROFIT484(address to)public  returns (bool success);	//inject NONSTANDARD NAMING
    
	
    function WITHDRAWSTAKING84(address to,uint256 value)public  returns (bool success);	//inject NONSTANDARD NAMING
    
	
    function WITHDRAWALL714(address to)public  returns (bool success);	//inject NONSTANDARD NAMING

    
	
    function TOTALMINERS291() public view returns (uint256);	//inject NONSTANDARD NAMING

    function TOTALSTAKING367() public view returns (uint256);	//inject NONSTANDARD NAMING

	
    function POOLBALANCE327() public view returns (uint256);	//inject NONSTANDARD NAMING

	
    function MINEDBALANCE896() public view returns (uint256);	//inject NONSTANDARD NAMING

	
    function STAKINGBALANCE622(address miner) public view returns (uint256);	//inject NONSTANDARD NAMING


    function PROFITBALANCE998(address miner) public view returns (uint256);	//inject NONSTANDARD NAMING

    
    
    function PAUSESTAKING350()public  returns (bool success);	//inject NONSTANDARD NAMING
    
    
    function RESUMESTAKING971()public  returns (bool success);	//inject NONSTANDARD NAMING

}

contract DFKProxy is DFK {
            
    DFK  public impl;


    constructor(address [] memory _mans) public ManagerUpgradeable(_mans){
        impl = DFK(0x0);
    }


    function REQUESTIMPLCHANGE452(address _newDFK) public ONLYMANAGER596 returns (bytes32 ) {	//inject NONSTANDARD NAMING
        require(_newDFK != address(0));
        impl = DFK(_newDFK);
    }



    function STAKINGDEPOSIT140(uint256 value) public payable returns (bool){	//inject NONSTANDARD NAMING
        return impl.STAKINGDEPOSIT140(value);
    }



    function PROFIT2STAKING678(uint256 value)public  returns (bool success){	//inject NONSTANDARD NAMING
        return impl.PROFIT2STAKING678(value);
    }


    function WITHDRAWPROFIT484(address to)public  returns (bool success){	//inject NONSTANDARD NAMING
        return impl.WITHDRAWPROFIT484(to);
    }


    function WITHDRAWSTAKING84(address to,uint256 value)public  returns (bool success){	//inject NONSTANDARD NAMING
        return impl.WITHDRAWSTAKING84(to,value);
    }
    
    
    function WITHDRAWALL714(address to)public  returns (bool success){	//inject NONSTANDARD NAMING
        return impl.WITHDRAWALL714(to);
    }
    


    function TOTALMINERS291() public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return impl.TOTALMINERS291();
    }


    function TOTALSTAKING367() public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return impl.TOTALSTAKING367();
    }


    function POOLBALANCE327() public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return impl.POOLBALANCE327();
    }


    function MINEDBALANCE896() public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return impl.MINEDBALANCE896();
    }


    function STAKINGBALANCE622(address miner) public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return impl.STAKINGBALANCE622(miner);
    }



    function PROFITBALANCE998(address miner) public view returns (uint256)	//inject NONSTANDARD NAMING
    {
        return impl.PROFITBALANCE998(miner);
    }



    function PAUSESTAKING350()public  returns (bool success)	//inject NONSTANDARD NAMING
    {
        return impl.PAUSESTAKING350();
    }
    
    
    function RESUMESTAKING971()public  returns (bool success)	//inject NONSTANDARD NAMING
    {
        return impl.RESUMESTAKING971();
    }

}

contract DFKImplement is DFK {

    using SafeMath for uint256;
    using SafeERC20 for StandardToken;

    int public status; 

    struct StakingLog{
        uint256   staking_time;
        uint256   profit_time;
        uint256   staking_value;
        uint256   unstaking_value; 
    }
    mapping(address => StakingLog) public stakings;

    uint256  public cleanup_time;

    uint256  public profit_period;

    uint256  public period_bonus; 

    mapping(address => uint256) public balanceProfit;
    mapping(address => uint256) public balanceStaking;

    StandardToken    public     dfkToken;

    uint256 public  _totalMiners;
    uint256 public  _totalStaking; 
    uint256 public  totalProfit;

    uint256 public  minePoolBalance; 

    modifier ONSTAKING261 {	//inject NONSTANDARD NAMING
        require(status == 1,"please start minner");
        _;
    }
    event PROFITLOG124(	//inject NONSTANDARD NAMING
        address indexed from,
        uint256 profit_time, 
        uint256 staking_value,
        uint256 unstaking_value,
        uint256 profit_times, 
        uint256 profit
    );

    constructor(address _dfkToken,int decimals,address  [] memory _mans) public ManagerUpgradeable(_mans){
        status = 0;
        cleanup_time = now;
        profit_period = 24*3600; 
        period_bonus = 100000*(10 ** uint256(decimals));
        cleanup_time = now;
        dfkToken = StandardToken(_dfkToken);
    }

     
    function ADDMINEPOOL538(uint256 stakevalue) public ONSTAKING261 payable returns (uint256){	//inject NONSTANDARD NAMING
        require(stakevalue>0);

        // user must call prove first.
        dfkToken.SAFETRANSFERFROM439(msg.sender,address(this),stakevalue);

        minePoolBalance = minePoolBalance.ADD176(stakevalue);

        return minePoolBalance;
    }


      
    function STAKINGDEPOSIT140(uint256 stakevalue) public ONSTAKING261 payable returns (bool){	//inject NONSTANDARD NAMING
        require(stakevalue>0,"stakevalue is gt zero");

        // user must call prove first.
        dfkToken.TRANSFERFROM53(msg.sender,address(this),stakevalue);

        _totalStaking = _totalStaking.ADD176(stakevalue);
         
        return ADDMINERSTAKING737(msg.sender,stakevalue);
    }


    function ADDMINERSTAKING737(address miner,uint256 stakevalue) internal  returns (bool){	//inject NONSTANDARD NAMING
        balanceStaking[miner] = balanceStaking[miner].ADD176(stakevalue);
        
        StakingLog memory slog=stakings[miner];

        if(slog.profit_time < cleanup_time){ 
            stakings[miner] = StakingLog({
                staking_time:now,
                profit_time:now,
                staking_value:0,
                unstaking_value:stakevalue
            });
            _totalMiners = _totalMiners.ADD176(1);
        }else if(now.SUB690(slog.profit_time) >= profit_period){ 
            uint256   profit_times = now.SUB690(slog.profit_time).DIV221(profit_period); 
            
            stakings[miner] = StakingLog({
                staking_time:now,
                profit_time:now,
                staking_value:slog.staking_value.ADD176(slog.unstaking_value),
                unstaking_value:stakevalue
            });
            
            
            uint256   profit =  period_bonus.MUL550(stakings[miner].staking_value).MUL550(profit_times).DIV221(_totalStaking);
            emit PROFITLOG124(miner,stakings[miner].profit_time,stakings[miner].staking_value,stakings[miner].unstaking_value,profit_times,profit);
            require(minePoolBalance>=profit,"minePoolBalance lt profit");
            minePoolBalance = minePoolBalance.SUB690(profit);

             
            balanceProfit[miner]=balanceProfit[miner].ADD176(profit);
            totalProfit = totalProfit.ADD176(profit);

        }else { 
            stakings[miner] = StakingLog({
                staking_time:now,
                profit_time:slog.profit_time,
                staking_value:slog.staking_value,
                unstaking_value:slog.unstaking_value.ADD176(stakevalue)
            });
        }
        return true;
    }


     
    function PROFIT2STAKING678(uint256 value)public ONSTAKING261 returns (bool success){	//inject NONSTANDARD NAMING
        
        require(balanceProfit[msg.sender]>=value);
        balanceProfit[msg.sender] = balanceProfit[msg.sender].SUB690(value);
        return ADDMINERSTAKING737(msg.sender,value);

    }

     
    function WITHDRAWPROFIT484(address to)public  returns (bool success){	//inject NONSTANDARD NAMING
        
        require(to != address(0));

        ADDMINERSTAKING737(msg.sender,0);

        uint256 profit = balanceProfit[msg.sender];
        balanceProfit[msg.sender] = 0;

        require(dfkToken.TRANSFER576(to,profit));

        return true;

    }

     
    function WITHDRAWSTAKING84(address to,uint256 value)public  returns (bool success){	//inject NONSTANDARD NAMING
        require(value>0);
        require(to != address(0));
        require(balanceStaking[msg.sender]>=value);
        require(_totalStaking>=value);
        
        _totalStaking=_totalStaking.SUB690(value);
        
        balanceStaking[msg.sender] = balanceStaking[msg.sender].SUB690(value);
        StakingLog memory slog=stakings[msg.sender];
        
         
        stakings[msg.sender] = StakingLog({
            staking_time:now,
            profit_time:slog.profit_time,
            staking_value:0,
            unstaking_value:balanceStaking[msg.sender]
        });
        
        require(dfkToken.TRANSFER576(to,value));
        
        return true;
    }

      
    function WITHDRAWALL714(address to)public  returns (bool success){	//inject NONSTANDARD NAMING
        require(to != address(0));
        
        ADDMINERSTAKING737(msg.sender,0);
        
        _totalStaking=_totalStaking.SUB690(balanceStaking[msg.sender]);
        
        uint256 total=balanceStaking[msg.sender].ADD176(balanceProfit[msg.sender]);

        balanceProfit[msg.sender]=0;
        balanceStaking[msg.sender] = 0;
         
        stakings[msg.sender] = StakingLog({
            staking_time:0,
            profit_time:0,
            staking_value:0,
            unstaking_value:0
        });
        // _totalMiners=_totalMiners.sub(1);
        require(dfkToken.TRANSFER576(to,total));
        
        return true;
    }
    
    
    function TOTALMINERS291() public view returns (uint256){	//inject NONSTANDARD NAMING
        return _totalMiners;
    }

     
    function TOTALSTAKING367() public view returns (uint256){	//inject NONSTANDARD NAMING
        return _totalStaking;

    }
     
    function POOLBALANCE327() public view returns (uint256){	//inject NONSTANDARD NAMING
        return minePoolBalance;
    }

     
    function MINEDBALANCE896() public view returns (uint256){	//inject NONSTANDARD NAMING
        return totalProfit;
    }

     
    function STAKINGBALANCE622(address miner) public view returns (uint256){	//inject NONSTANDARD NAMING
        return balanceStaking[miner];
    }


     
    function PROFITBALANCE998(address miner) public view returns (uint256){	//inject NONSTANDARD NAMING
        return balanceProfit[miner];
    }

     
    function PAUSESTAKING350()public ONLYMANAGER596  returns (bool ){	//inject NONSTANDARD NAMING
        status = 0;
    }
    
     
    function RESUMESTAKING971()public ONLYMANAGER596 returns (bool ){	//inject NONSTANDARD NAMING
       status = 1;
    }
}

contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  // public variables
  string public name;
  string public symbol;
  uint8 public decimals = 18;

  // internal variables
  uint256 _totalSupply;
  mapping(address => uint256) _balances;

  // events

  // public functions
  function TOTALSUPPLY552() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _totalSupply;
  }

  function BALANCEOF223(address addr) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return _balances[addr];
  }

  function TRANSFER576(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(to != address(0));
    require(value <= _balances[msg.sender]);

    _balances[msg.sender] = _balances[msg.sender].SUB690(value);
    _balances[to] = _balances[to].ADD176(value);
    emit TRANSFER285(msg.sender, to, value);
    return true;
  }

  // internal functions

}

contract StandardToken is ERC20, BasicToken {
  // public variables

  // internal variables
  mapping (address => mapping (address => uint256)) _allowances;

  // events

  // public functions
  function TRANSFERFROM53(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(to != address(0));
    require(value <= _balances[from],"value lt from");
    require(value <= _allowances[from][msg.sender],"value lt _allowances from ");

    _balances[from] = _balances[from].SUB690(value);
    _balances[to] = _balances[to].ADD176(value);
    _allowances[from][msg.sender] = _allowances[from][msg.sender].SUB690(value);
    emit TRANSFER285(from, to, value);
    return true;
  }

  function APPROVE151(address agent, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
    _allowances[msg.sender][agent] = value;
    emit APPROVAL300(msg.sender, agent, value);
    return true;
  }

  function ALLOWANCE335(address owner, address agent) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _allowances[owner][agent];
  }

  function INCREASEAPPROVAL359(address agent, uint value) public returns (bool) {	//inject NONSTANDARD NAMING
    _allowances[msg.sender][agent] = _allowances[msg.sender][agent].ADD176(value);
    emit APPROVAL300(msg.sender, agent, _allowances[msg.sender][agent]);
    return true;
  }

  function DECREASEAPPROVAL201(address agent, uint value) public returns (bool) {	//inject NONSTANDARD NAMING
    uint allowanceValue = _allowances[msg.sender][agent];
    if (value > allowanceValue) {
      _allowances[msg.sender][agent] = 0;
    } else {
      _allowances[msg.sender][agent] = allowanceValue.SUB690(value);
    }
    emit APPROVAL300(msg.sender, agent, _allowances[msg.sender][agent]);
    return true;
  }
  // internal functions
}

contract DFKToken is StandardToken {
  // public variables
  string public name = "Defiking";
  string public symbol = "DFK";
  uint8 public decimals = 18;

  // internal variables
 
  // events

  // public functions
  constructor() public {
    //init _totalSupply
    _totalSupply = 1000000000 * (10 ** uint256(decimals));

    _balances[msg.sender] = _totalSupply;
    emit TRANSFER285(address(0x0), msg.sender, _totalSupply);
  }

  // internal functions
}