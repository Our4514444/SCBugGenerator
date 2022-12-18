                                                                 

pragma solidity ^0.5.13;

library SafeMath {
                                                                                                                                                                                                                                    
    function ADD987(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB589(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB589(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB589(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;
        return c;
    }

                                                                                                                                                                                                                                                
    function MUL713(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV852(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV852(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV852(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

}

interface Callable {
	function TOKENCALLBACK750(address _from, uint256 _tokens, bytes calldata _data) external returns (bool);	//inject NONSTANDARD NAMING
}

contract ANULNetwork {
    
    using SafeMath for uint256;
	uint256 constant private float_scalar108 = 2**64;	//inject NONSTANDARD NAMING
	uint256 constant private initial_supply28 = 21000000e18;	//inject NONSTANDARD NAMING
	uint256 constant private min_stake_amount62 = 1e21; // 1,000 Tokens Needed	//inject NONSTANDARD NAMING

	uint256 private XFER_FEE = 5; // 5% per tx
	uint256 private POOL_FEE = 3; // 3% to pool
	uint256 private DESTRUCTION = 2;  // 2% to Destruction
	uint256 private SHARE_DIVIDENDS = 6;  // 25% every collect
	uint256 private BASE_PROFIT = 5; // 1% Base Prifit

	uint256 private MAX_UNSTAKE_LIMIT = 2592000;

	string constant public name231 = "Annular Network";	//inject NONSTANDARD NAMING
	string constant public symbol10 = "ANUL";	//inject NONSTANDARD NAMING
	uint8 constant public decimals529 = 18;	//inject NONSTANDARD NAMING

	struct User {
		
		uint256 balance;
		uint256 staked;
		mapping(address => uint256) allowance;
		uint collectTime;
		uint stakeTime;
		int256 scaledPayout;
	}

	struct Info {
		uint256 totalSupply;
		uint256 totalStaked;
		uint256 totalStake;
		mapping(address => User) users;
		uint256 scaledPayoutPerToken;
		address admin;
	}
	
	Info private info;


	event TRANSFER453(address indexed from, address indexed to, uint256 tokens);	//inject NONSTANDARD NAMING
	event APPROVAL339(address indexed owner, address indexed spender, uint256 tokens);	//inject NONSTANDARD NAMING
	
	event STAKE599(address indexed owner, uint256 tokens);	//inject NONSTANDARD NAMING
	event UNSTAKE349(address indexed owner, uint256 tokens);	//inject NONSTANDARD NAMING
	event COLLECT5(address indexed owner, uint256 tokens);	//inject NONSTANDARD NAMING
	event TAX174(uint256 tokens);	//inject NONSTANDARD NAMING


	constructor() public {
		info.admin = msg.sender;
		info.totalSupply = initial_supply28;
		info.users[msg.sender].balance = initial_supply28;
		emit TRANSFER453(address(0x0), msg.sender, initial_supply28);
	}
	
	function SETXFERFEE382(uint256 newXferFee) public {	//inject NONSTANDARD NAMING
        require(msg.sender == info.admin);
        require(newXferFee <= 10);
        XFER_FEE = newXferFee;
    }
    
    function SETPOOLFEE957(uint256 newPoolFee) public {	//inject NONSTANDARD NAMING
        require(msg.sender == info.admin);
        require(XFER_FEE >= newPoolFee);
        POOL_FEE = newPoolFee;
    }
    
    function SETDESTRUCTION811(uint256 newDestruction) public {	//inject NONSTANDARD NAMING
        require(msg.sender == info.admin);
        require(XFER_FEE >= newDestruction);
        DESTRUCTION = newDestruction;
    }
    
    
    function SETSHAREDIVIDENDS663(uint256 newShareDividends) public {	//inject NONSTANDARD NAMING
        require(msg.sender == info.admin);
        require(newShareDividends < 100);
        SHARE_DIVIDENDS = newShareDividends;
    }
    
    function SETBASEPROFIT462(uint256 newBaseProfit) public {	//inject NONSTANDARD NAMING
        require(msg.sender == info.admin);
        require(newBaseProfit < 10);
        BASE_PROFIT = newBaseProfit;
    }
    
     function SETMAXUNSTAKELIMIT300(uint256 newMaxUnStakeLimit) public {	//inject NONSTANDARD NAMING
        require(msg.sender == info.admin);
        require(newMaxUnStakeLimit < 8640000);
        MAX_UNSTAKE_LIMIT = newMaxUnStakeLimit;
    }
    

	function STAKE262(uint256 _tokens) external {	//inject NONSTANDARD NAMING
		_STAKE19(_tokens);
	}

	function UNSTAKE479(uint256 _tokens) external {	//inject NONSTANDARD NAMING
		_UNSTAKE724(_tokens);
	}

	function COLLECT350() external returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 _dividends = DIVIDENDSOF733(msg.sender);
		require(_dividends > 0);
		require(info.users[msg.sender].collectTime < now);
		uint256 profit = _dividends.MUL713(SHARE_DIVIDENDS).DIV852(100);
		uint256 base = info.users[msg.sender].staked.MUL713(BASE_PROFIT).DIV852(100);
		info.users[msg.sender].scaledPayout += int256(_dividends.MUL713(float_scalar108).MUL713(SHARE_DIVIDENDS).DIV852(100));
		info.users[msg.sender].balance += profit + base;
		info.users[msg.sender].collectTime = now + 86400;

		info.totalSupply += base;
		
		emit TRANSFER453(address(this), msg.sender, profit + base);
		emit COLLECT5(msg.sender, _dividends);
		return _dividends;
	}
	function REINVEST796() external returns (uint256) {	//inject NONSTANDARD NAMING
	    uint256 _dividends = DIVIDENDSOF733(msg.sender);
		require(_dividends > 0);
		require(info.users[msg.sender].collectTime < now);
		uint256 profit = _dividends.MUL713(SHARE_DIVIDENDS).DIV852(100);
		uint256 base = info.users[msg.sender].staked.MUL713(BASE_PROFIT).DIV852(100);
		uint256 _amount = profit + base;
		
		require(BALANCEOF860(msg.sender) >= _amount);
		require(STAKEDOF151(msg.sender) + _amount >= min_stake_amount62);
		
		info.users[msg.sender].scaledPayout += int256(_dividends.MUL713(float_scalar108).MUL713(SHARE_DIVIDENDS).DIV852(100));
		info.users[msg.sender].collectTime = now + 86400;

		info.totalSupply += base;
		info.totalStaked += _amount;
		info.users[msg.sender].staked += _amount;
		info.users[msg.sender].scaledPayout += int256(_amount.MUL713(info.scaledPayoutPerToken));
		
		return _dividends;
    }
	function DISTRIBUTE164(uint256 _tokens) external {	//inject NONSTANDARD NAMING
		require(info.totalStaked > 0);
		require(BALANCEOF860(msg.sender) >= _tokens);
		info.users[msg.sender].balance -= _tokens;
		info.scaledPayoutPerToken += _tokens.MUL713(float_scalar108).DIV852(info.totalStaked);
		emit TRANSFER453(msg.sender, address(this), _tokens);
	}

	function TRANSFER387(address _to, uint256 _tokens) external returns (bool) {	//inject NONSTANDARD NAMING
		_TRANSFER402(msg.sender, _to, _tokens);
		return true;
	}

	function APPROVE133(address _spender, uint256 _tokens) external returns (bool) {	//inject NONSTANDARD NAMING
		info.users[msg.sender].allowance[_spender] = _tokens;
		emit APPROVAL339(msg.sender, _spender, _tokens);
		return true;
	}

	function TRANSFERFROM142(address _from, address _to, uint256 _tokens) external returns (bool) {	//inject NONSTANDARD NAMING
		require(info.users[_from].allowance[msg.sender] >= _tokens);
		info.users[_from].allowance[msg.sender] -= _tokens;
		_TRANSFER402(_from, _to, _tokens);
		return true;
	}

	function TRANSFERANDCALL667(address _to, uint256 _tokens, bytes calldata _data) external returns (bool) {	//inject NONSTANDARD NAMING
		uint256 _transferred = _TRANSFER402(msg.sender, _to, _tokens);
		uint32 _size;
		assembly {
			_size := extcodesize(_to)
		}
		if (_size > 0) {
			require(Callable(_to).TOKENCALLBACK750(msg.sender, _transferred, _data));
		}
		return true;
	}

	function BULKTRANSFER537(address[] calldata _receivers, uint256[] calldata _amounts) external {	//inject NONSTANDARD NAMING
		require(_receivers.length == _amounts.length);
		for (uint256 i = 0; i < _receivers.length; i++) {
			_TRANSFER402(msg.sender, _receivers[i], _amounts[i]);
		}
	}


	function TOTALSUPPLY332() public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.totalSupply;
	}

	function TOTALSTAKED527() public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.totalStaked;
	}

	function BALANCEOF860(address _user) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.users[_user].balance - STAKEDOF151(_user);
	}

	function STAKEDOF151(address _user) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.users[_user].staked;
	}
	
	function UNSTAKETIMEOF977(address _user) public view returns (uint256) {	//inject NONSTANDARD NAMING
	    return uint256(int256(info.users[_user].stakeTime + (info.totalSupply - info.totalStaked) * MAX_UNSTAKE_LIMIT / info.totalSupply ));
	}
	
	function COLLECTTIMEOF504(address _user) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.users[_user].collectTime;
	}
	
	function STAKETIMEOF391(address _user) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.users[_user].stakeTime;
	}

	function DIVIDENDSOF733(address _user) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return uint256(int256(info.scaledPayoutPerToken * info.users[_user].staked) - info.users[_user].scaledPayout) / float_scalar108;
	}

	function ALLOWANCE265(address _user, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return info.users[_user].allowance[_spender];
	}

	function ALLDATAFOR850(address _user) public view returns (uint256 totalTokenSupply, uint256 totalTokensStaked, uint256 userBalance, uint256 userStaked, uint256 userDividends, uint256 userCollectTime, uint256 userUnstakeTime) {	//inject NONSTANDARD NAMING
		return (TOTALSUPPLY332(), TOTALSTAKED527(), BALANCEOF860(_user), STAKEDOF151(_user), DIVIDENDSOF733(_user), COLLECTTIMEOF504(_user), UNSTAKETIMEOF977(_user));
	}


	function _TRANSFER402(address _from, address _to, uint256 _tokens) internal returns (uint256) {	//inject NONSTANDARD NAMING
		require(BALANCEOF860(_from) >= _tokens);
		info.users[_from].balance -= _tokens;
		
		uint256 _taxAmount = _tokens.MUL713(XFER_FEE).DIV852(100);
		uint256 _poolAmount = _tokens.MUL713(POOL_FEE).DIV852(100);
		uint256 _destructionAmount = _tokens.MUL713(DESTRUCTION).DIV852(100);
		
		uint256 _transferred = _tokens - _taxAmount;
		
        if (info.totalStaked > 0) {
            info.users[_to].balance += _transferred;
            info.totalSupply = info.totalSupply.SUB589(_destructionAmount);
            emit TRANSFER453(_from, _to, _transferred);
            info.scaledPayoutPerToken += _poolAmount.MUL713(float_scalar108).DIV852(info.totalStaked);
            emit TRANSFER453(_from, address(this), _poolAmount);
            emit TRANSFER453(_from, address(0), _destructionAmount);
            emit TAX174(_taxAmount);
            return _transferred;
        } else {
            info.users[_to].balance += _tokens;
            emit TRANSFER453(_from, _to, _tokens);
            return _tokens;
        }
    }

	function _STAKE19(uint256 _amount) internal {	//inject NONSTANDARD NAMING
		require(BALANCEOF860(msg.sender) >= _amount);
		require(STAKEDOF151(msg.sender) + _amount >= min_stake_amount62);
		info.users[msg.sender].stakeTime = now;
		info.totalStaked += _amount;
		info.users[msg.sender].staked += _amount;
		info.users[msg.sender].scaledPayout += int256(_amount.MUL713(info.scaledPayoutPerToken));
		emit TRANSFER453(msg.sender, address(this), _amount);
		emit STAKE599(msg.sender, _amount);
	}

	function _UNSTAKE724(uint256 _amount) internal {	//inject NONSTANDARD NAMING
	    require(now > info.users[msg.sender].stakeTime.ADD987(info.totalSupply.SUB589(info.totalStaked).MUL713(MAX_UNSTAKE_LIMIT).DIV852(info.totalSupply)));
		require(STAKEDOF151(msg.sender) >= _amount);
		uint256 _taxAmount = _amount.MUL713(XFER_FEE).DIV852(100);
		info.scaledPayoutPerToken += _taxAmount.MUL713(float_scalar108).DIV852(info.totalStaked);
		info.totalStaked -= _amount;
		info.users[msg.sender].balance -= _taxAmount;
		info.users[msg.sender].staked -= _amount;
		info.users[msg.sender].scaledPayout -= int256(_amount.MUL713(info.scaledPayoutPerToken));
		emit TRANSFER453(address(this), msg.sender, _amount.SUB589(_taxAmount));
		emit UNSTAKE349(msg.sender, _amount);
	}
}