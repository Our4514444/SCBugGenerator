                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY929() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF108(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER618(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE666(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS561() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE554(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM311(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER388(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL799(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD991(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB672(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB672(a, b, "SafeMath: subtraction overflow");
    }
    function SUB672(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL881(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV200(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV200(a, b, "SafeMath: division by zero");
    }
    function DIV200(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD663(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD663(a, b, "SafeMath: modulo by zero");
    }
    function MOD663(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT210(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE403(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE482(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER476(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN256(token, abi.encodeWithSelector(token.TRANSFER618.selector, to, value));
    }

    function SAFETRANSFERFROM824(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN256(token, abi.encodeWithSelector(token.TRANSFERFROM311.selector, from, to, value));
    }

    function SAFEAPPROVE32(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE666(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN256(token, abi.encodeWithSelector(token.APPROVE554.selector, spender, value));
    }
    function CALLOPTIONALRETURN256(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT210(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface Controller {
    function VAULTS188(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS827() external view returns (address);	//inject NONSTANDARD NAMING
}

interface Rewards {
    function WITHDRAW913(uint) external;	//inject NONSTANDARD NAMING
    function GETREWARD368() external;	//inject NONSTANDARD NAMING
    function STAKE542(uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF108(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EXIT321() external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

interface ICurveFi {

  function GET_VIRTUAL_PRICE266() external view returns (uint);	//inject NONSTANDARD NAMING
  function ADD_LIQUIDITY327(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function REMOVE_LIQUIDITY_IMBALANCE846(	//inject NONSTANDARD NAMING
    uint256[4] calldata amounts,
    uint256 max_burn_amount
  ) external;
  function REMOVE_LIQUIDITY142(	//inject NONSTANDARD NAMING
    uint256 _amount,
    uint256[4] calldata amounts
  ) external;
  function EXCHANGE607(	//inject NONSTANDARD NAMING
    int128 from, int128 to, uint256 _from_amount, uint256 _min_to_amount
  ) external;
}

interface Synthetix {
    function ISSUEMAXSYNTHS898() external;	//inject NONSTANDARD NAMING
    function BURNSYNTHS698(uint) external;	//inject NONSTANDARD NAMING
    function DEBTBALANCEOF706(address account, bytes32 currencyKey) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERABLESYNTHETIX905(address account) external view returns (uint transferable);	//inject NONSTANDARD NAMING
    function BURNSYNTHSTOTARGET365() external;	//inject NONSTANDARD NAMING
    function MAXISSUABLESYNTHS59(address) external view returns (uint);	//inject NONSTANDARD NAMING
}

interface SynthetixEscrow {
    function VEST277() external;	//inject NONSTANDARD NAMING
}

interface SynthetixFees {
    function CLAIMFEES183() external;	//inject NONSTANDARD NAMING
    function FEESAVAILABLE397(address) external view returns (uint totalFees,uint totalRewards);	//inject NONSTANDARD NAMING
    function ISFEESCLAIMABLE737(address) external view returns (bool);	//inject NONSTANDARD NAMING
}

interface SynthetixExchange {
    function RATEFORCURRENCY164(bytes32 currencyKey) external view returns (uint rate);	//inject NONSTANDARD NAMING
}

contract StrategySNXSUSD {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    address constant public want844 = address(0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F);	//inject NONSTANDARD NAMING
    address constant public curve969 = address(0xA5407eAE9Ba41422680e2e00537571bcC53efBfD);	//inject NONSTANDARD NAMING
    address constant public snx531 = address(0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F);	//inject NONSTANDARD NAMING
    address constant public scrv613 = address(0xC25a3A3b969415c80451098fa907EC722572917F);	//inject NONSTANDARD NAMING
    address constant public rewards313 = address(0xDCB6A51eA3CA5d3Fd898Fd6564757c7aAeC3ca92);	//inject NONSTANDARD NAMING
    address constant public susd113 = address(0x57Ab1ec28D129707052df4dF418D58a2D46d5f51);	//inject NONSTANDARD NAMING
    address constant public fees806 = address(0xb440DD674e1243644791a4AdfE3A2AbB0A92d309);	//inject NONSTANDARD NAMING
    address constant public escrow311 = address(0xb671F2210B1F6621A2607EA63E6B2DC3e2464d1F);	//inject NONSTANDARD NAMING
    address constant public exchange700 = address(0xba727c69636491ecdfE3E6F64cBE9428aD371e48);	//inject NONSTANDARD NAMING
    
    address constant public dai83 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    address constant public usdt587 = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);	//inject NONSTANDARD NAMING
    address constant public usdc23 = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);	//inject NONSTANDARD NAMING
    
    uint constant public fee725 = 50;	//inject NONSTANDARD NAMING
    uint constant public max116 = 10000;	//inject NONSTANDARD NAMING
    
    address public governance;
    address public controller;
    
    constructor(address _controller) public {
        governance = msg.sender;
        controller = _controller;
    }
    
    function DEPOSIT971() public {	//inject NONSTANDARD NAMING
        // Mint sUSD
        uint _issuable = Synthetix(snx531).MAXISSUABLESYNTHS59(address(this));
        if (_issuable > 0) {
            Synthetix(snx531).ISSUEMAXSYNTHS898();
        }
        
        // Mint sCRV
        uint _susd = IERC20(susd113).BALANCEOF108(address(this));
        if (_susd > 0) {
            IERC20(susd113).SAFEAPPROVE32(curve969, 0);
            IERC20(susd113).SAFEAPPROVE32(curve969, _susd);
            ICurveFi(curve969).ADD_LIQUIDITY327([0,0,0,_susd],0);
        }
        
        // Stake sCRV
        uint _scrv = IERC20(scrv613).BALANCEOF108(address(this));
        if (_scrv > 0) {
            IERC20(scrv613).SAFEAPPROVE32(rewards313, 0);
            IERC20(scrv613).SAFEAPPROVE32(rewards313, _scrv);
            Rewards(rewards313).STAKE542(_scrv);
        }
    }
    
    function HARVESTANDCOMPOUND313() public {	//inject NONSTANDARD NAMING
        HARVEST600();
        DEPOSIT971();
    }
    
    function HARVEST600() public {	//inject NONSTANDARD NAMING
        uint _before = BALANCEOFWANT320();
        BURNSYNTHSTOTARGET365();
        CLAIMREWARDS510();
        // Claim SNX rewards from Rewards pool
        CLAIMFEES183();
        // Claim escrow (if available ~ 12 months)
        VEST277();
        uint _after = BALANCEOFWANT320();
        uint _fee = (_after.SUB672(_before)).MUL881(fee725).DIV200(max116);
        IERC20(want844).SAFETRANSFER476(Controller(controller).REWARDS827(), _fee);
    }
    
    function BURNSYNTHSTOTARGET365() public {	//inject NONSTANDARD NAMING
        uint _issuable = Synthetix(snx531).MAXISSUABLESYNTHS59(address(this));
        uint _debt = Synthetix(snx531).DEBTBALANCEOF706(address(this), "sUSD");
        // check to avoid the sub revert in burnSynthsToTarget() use deposit instead to increase
        if (_debt > _issuable) {
            Synthetix(snx531).BURNSYNTHSTOTARGET365();
        }
    }
    
    function CLAIMREWARDS510() public {	//inject NONSTANDARD NAMING
        Rewards(rewards313).GETREWARD368();
    }
    
    function VEST277() public {	//inject NONSTANDARD NAMING
        SynthetixEscrow(escrow311).VEST277();
    }
    
    function CLAIMFEES183() public {	//inject NONSTANDARD NAMING
        // Claim weekly fees (if available)
        if (SynthetixFees(fees806).ISFEESCLAIMABLE737(address(this))) {
            SynthetixFees(fees806).CLAIMFEES183();
        }
    }
    
    // Controller only function for creating additional rewards from dust
    function WITHDRAW913(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want844 != address(_asset), "want");
        balance = _asset.BALANCEOF108(address(this));
        _asset.SAFETRANSFER476(controller, balance);
    }
    
    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW913(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = Synthetix(snx531).TRANSFERABLESYNTHETIX905(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME151(_amount.SUB672(_balance));
            _amount = _amount.ADD991(_balance);
        }
        
        //address _vault = Controller(controller).vaults(address(want));
        //require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        uint _fee = _amount.MUL881(fee725).DIV200(max116);
        IERC20(want844).SAFETRANSFER476(Controller(controller).REWARDS827(), _fee);
        IERC20(want844).SAFETRANSFER476(controller, _amount.SUB672(_fee));
    }
    
    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL107() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL665();
        balance = Synthetix(snx531).TRANSFERABLESYNTHETIX905(address(this));
        
        //address _vault = Controller(controller).vaults(address(want));
        //require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want844).SAFETRANSFER476(controller, balance);
    }
    
    function WITHDRAWSUSD870(uint _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _before = IERC20(susd113).BALANCEOF108(address(this));
        
        IERC20(scrv613).SAFEAPPROVE32(curve969, 0);
        IERC20(scrv613).SAFEAPPROVE32(curve969, _amount);
        ICurveFi(curve969).REMOVE_LIQUIDITY142(_amount, [uint256(0),0,0,0]);
        
        uint256 _dai = IERC20(dai83).BALANCEOF108(address(this));
        uint256 _usdc = IERC20(usdc23).BALANCEOF108(address(this));
        uint256 _usdt = IERC20(usdt587).BALANCEOF108(address(this));
        
        if (_dai > 0) {
            IERC20(dai83).SAFEAPPROVE32(curve969, 0);
            IERC20(dai83).SAFEAPPROVE32(curve969, _dai);
            ICurveFi(curve969).EXCHANGE607(0, 3, _dai, 0);
        }
        if (_usdc > 0) {
            IERC20(usdc23).SAFEAPPROVE32(curve969, 0);
            IERC20(usdc23).SAFEAPPROVE32(curve969, _usdc);
            ICurveFi(curve969).EXCHANGE607(1, 3, _usdc, 0);
        }
        if (_usdt > 0) {
            IERC20(usdt587).SAFEAPPROVE32(curve969, 0);
            IERC20(usdt587).SAFEAPPROVE32(curve969, _usdt);
            ICurveFi(curve969).EXCHANGE607(2, 3, _usdt, 0);
        }
        
        uint _after = IERC20(susd113).BALANCEOF108(address(this));
        return _after.SUB672(_before);
    }
    
    function _WITHDRAWALL665() internal {	//inject NONSTANDARD NAMING
        Rewards(rewards313).EXIT321();
        WITHDRAWSUSD870(IERC20(scrv613).BALANCEOF108(address(this)));
        uint _debt = Synthetix(snx531).DEBTBALANCEOF706(address(this), "sUSD");
        if (IERC20(susd113).BALANCEOF108(address(this))<_debt) {
            _debt = IERC20(susd113).BALANCEOF108(address(this));
        }
        if (_debt > 0) {
            Synthetix(snx531).BURNSYNTHS698(_debt);
        }
    }
    
    function _WITHDRAWSOME151(uint _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _ratio = BALANCEOFREWARDS107().MUL881(_amount).DIV200(BALANCEOFLOCKED82());
        uint _withdrew = WITHDRAWSUSD870(_ratio);
        uint _before = Synthetix(snx531).TRANSFERABLESYNTHETIX905(address(this));
        Synthetix(snx531).BURNSYNTHS698(_withdrew);
        uint _after = Synthetix(snx531).TRANSFERABLESYNTHETIX905(address(this));
        uint _diff = _after.SUB672(_before);
        if (_diff < _amount) {
            _amount = _diff;
        }
        return _amount;
    }
    
    function BALANCEOFLOCKED82() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT320().SUB672(Synthetix(snx531).TRANSFERABLESYNTHETIX905(address(this)));
    }
    
    function BALANCEOFWANT320() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want844).BALANCEOF108(address(this));
    }
    
    function BALANCEOFREWARDS107() public view returns (uint) {	//inject NONSTANDARD NAMING
        return Rewards(rewards313).BALANCEOF108(address(this));
    }
    
    function BALANCEOF108() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT320();
    }
    
    function SETGOVERNANCE296(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER823(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}