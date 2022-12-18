                                                                 

pragma solidity ^0.5.17;

library SafeMath {
    function ADD563(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    
    function SUB603(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a); 
        c = a - b; 
    } 
    
    function MUL860(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b; 
        require(a == 0 || c / a == b); 
    } 
    
    function DIV561(uint a, uint b) public pure returns (uint c) { 	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}

contract Ownable {
    address public owner;

    constructor () public {
        owner = msg.sender;
    }

    modifier ONLYOWNER90() {	//inject NONSTANDARD NAMING
        if (msg.sender == owner)
            _;
    }

    function TRANSFEROWNERSHIP429(address newOwner) public ONLYOWNER90 {	//inject NONSTANDARD NAMING
        if (newOwner != address(0)) owner = newOwner;
    }
}

contract ERC20Interface {
    function TOTALSUPPLY485() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF105(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE176(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER98(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE428(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM828(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    event TRANSFER731(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL197(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

contract sZAC is Ownable {
    using SafeMath for uint;
    
    struct StakingInfo {
        uint amount;
        uint depositDate;
        uint rewardPercent;
    }
    
    uint minStakeAmount = 30 * 10**18; // ZAC token has 18 decimals
    uint REWARD_DIVIDER = 10**8;
    
    ERC20Interface stakingToken;
    uint rewardPercent; //  percent value for per second  -> set 192 if you want 5% per month reward (because it will be divided by 10^8 for getting the small float number)
    string name = "sZAC";
    
    uint ownerTokensAmount;
    address[] internal stakeholders;
    mapping(address => StakingInfo[]) internal stakes;

    //  percent value for per second  
    //  set 192 if you want 5% per month reward (because it will be divided by 10^8 for getting the small float number)
    //  5% per month = 5 / (30 * 24 * 60 * 60) ~ 0.00000192 (192 / 10^8)
    constructor(ERC20Interface _stakingToken, uint _rewardPercent) public {
        stakingToken = _stakingToken;
        rewardPercent = _rewardPercent;
    }
    
    event STAKED879(address staker, uint amount);	//inject NONSTANDARD NAMING
    event UNSTAKED62(address staker, uint amount);	//inject NONSTANDARD NAMING
    
    function CHANGEREWARDPERCENT203(uint _rewardPercent) public ONLYOWNER90 {	//inject NONSTANDARD NAMING
        rewardPercent = _rewardPercent;
    }
    
    function CHANGEMINSTAKEAMOUNT583(uint _minStakeAmount) public ONLYOWNER90 {	//inject NONSTANDARD NAMING
        minStakeAmount = _minStakeAmount;
    }
    
    function TOTALSTAKES917() public view returns(uint256) {	//inject NONSTANDARD NAMING
        uint _totalStakes = 0;
        for (uint i = 0; i < stakeholders.length; i += 1) {
            for (uint j = 0; j < stakes[stakeholders[i]].length; j += 1)
             _totalStakes = _totalStakes.ADD563(stakes[stakeholders[i]][j].amount);
        }
        return _totalStakes;
    }
    
    function ISSTAKEHOLDER404(address _address) public view returns(bool, uint256) {	//inject NONSTANDARD NAMING
        for (uint256 s = 0; s < stakeholders.length; s += 1) {
            if (_address == stakeholders[s]) 
                return (true, s);
        }
        return (false, 0);
    }

    function ADDSTAKEHOLDER761(address _stakeholder) internal {	//inject NONSTANDARD NAMING
        (bool _isStakeholder, ) = ISSTAKEHOLDER404(_stakeholder);
        if (!_isStakeholder)
            stakeholders.push(_stakeholder);
    }

    function REMOVESTAKEHOLDER139(address _stakeholder) internal {	//inject NONSTANDARD NAMING
        (bool _isStakeholder, uint256 s) = ISSTAKEHOLDER404(_stakeholder);
        if (_isStakeholder) {
            stakeholders[s] = stakeholders[stakeholders.length - 1];
            stakeholders.pop();
        }
    }
    
    function STAKE525(uint256 _amount) public {	//inject NONSTANDARD NAMING
        require(_amount >= minStakeAmount);
        require(stakingToken.TRANSFERFROM828(msg.sender, address(this), _amount), "Stake required!");
        if (stakes[msg.sender].length == 0) {
            ADDSTAKEHOLDER761(msg.sender);
        }
        stakes[msg.sender].push(StakingInfo(_amount, now, rewardPercent));
        emit STAKED879(msg.sender, _amount);
    }

    function UNSTAKE70() public {	//inject NONSTANDARD NAMING
        uint withdrawAmount = 0;
        for (uint j = 0; j < stakes[msg.sender].length; j += 1) {
            uint amount = stakes[msg.sender][j].amount;
            withdrawAmount = withdrawAmount.ADD563(amount);
            
            uint rewardAmount = amount.MUL860((now - stakes[msg.sender][j].depositDate).MUL860(stakes[msg.sender][j].rewardPercent));
            rewardAmount = rewardAmount.DIV561(REWARD_DIVIDER);
            withdrawAmount = withdrawAmount.ADD563(rewardAmount.DIV561(100));
        }
        
        require(stakingToken.TRANSFER98(msg.sender, withdrawAmount), "Not enough tokens in contract!");
        delete stakes[msg.sender];
        REMOVESTAKEHOLDER139(msg.sender);
        emit UNSTAKED62(msg.sender, withdrawAmount);
    }
    
    function SENDTOKENS512(uint _amount) public ONLYOWNER90 {	//inject NONSTANDARD NAMING
        require(stakingToken.TRANSFERFROM828(msg.sender, address(this), _amount), "Transfering not approved!");
        ownerTokensAmount = ownerTokensAmount.ADD563(_amount);
    }
    
    function WITHDRAWTOKENS967(address receiver, uint _amount) public ONLYOWNER90 {	//inject NONSTANDARD NAMING
        ownerTokensAmount = ownerTokensAmount.SUB603(_amount);
        require(stakingToken.TRANSFER98(receiver, _amount), "Not enough tokens on contract!");
    }
}