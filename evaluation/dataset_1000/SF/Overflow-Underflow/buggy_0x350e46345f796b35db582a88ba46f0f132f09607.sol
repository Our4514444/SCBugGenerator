/**
 *Submitted for verification at Etherscan.io on 2020-08-31
*/

pragma solidity ^0.5.17;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function decimals() external view returns (uint);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function isContract(address account) internal view returns (bool) {
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface yVault {
    function getPricePerFullShare() external view returns (uint);
    function balanceOf(address) external view returns (uint);
    function depositAll() external;
    function withdraw(uint _shares) external;
    function withdrawAll() external;
}

interface Controller {
    function vaults(address) external view returns (address);
    function strategies(address) external view returns (address);
    function rewards() external view returns (address);
}

interface Strategy {
    function withdrawalFee() external view returns (uint);
}

/* MakerDao interfaces */

interface GemLike {
    function approve(address, uint) external;
    function transfer(address, uint) external;
    function transferFrom(address, address, uint) external;
    function deposit() external payable;
    function withdraw(uint) external;
}

interface ManagerLike {
    function cdpCan(address, uint, address) external view returns (uint);
    function ilks(uint) external view returns (bytes32);
    function owns(uint) external view returns (address);
    function urns(uint) external view returns (address);
    function vat() external view returns (address);
    function open(bytes32, address) external returns (uint);
    function give(uint, address) external;
    function cdpAllow(uint, address, uint) external;
    function urnAllow(address, uint) external;
    function frob(uint, int, int) external;
    function flux(uint, address, uint) external;
    function move(uint, address, uint) external;
    function exit(address, uint, address, uint) external;
    function quit(uint, address) external;
    function enter(address, uint) external;
    function shift(uint, uint) external;
}

interface VatLike {
    function can(address, address) external view returns (uint);
    function ilks(bytes32) external view returns (uint, uint, uint, uint, uint);
    function dai(address) external view returns (uint);
    function urns(bytes32, address) external view returns (uint, uint);
    function frob(bytes32, address, address, address, int, int) external;
    function hope(address) external;
    function move(address, address, uint) external;
}

interface GemJoinLike {
    function dec() external returns (uint);
    function gem() external returns (GemLike);
    function join(address, uint) external payable;
    function exit(address, uint) external;
}

interface GNTJoinLike {
    function bags(address) external view returns (address);
    function make(address) external returns (address);
}

interface DaiJoinLike {
    function vat() external returns (VatLike);
    function dai() external returns (GemLike);
    function join(address, uint) external payable;
    function exit(address, uint) external;
}

interface HopeLike {
    function hope(address) external;
    function nope(address) external;
}

interface EndLike {
    function fix(bytes32) external view returns (uint);
    function cash(bytes32, uint) external;
    function free(bytes32) external;
    function pack(uint) external;
    function skim(bytes32, address) external;
}

interface JugLike {
    function drip(bytes32) external returns (uint);
}

interface PotLike {
    function pie(address) external view returns (uint);
    function drip() external returns (uint);
    function join(uint) external;
    function exit(uint) external;
}

interface SpotLike {
    function ilks(bytes32) external view returns (address, uint);
}

interface OSMedianizer {
    function read() external view returns (uint, bool);
    function foresight() external view returns (uint, bool);
}

interface Uni {
    function swapExactTokensForTokens(uint, uint, address[] calldata, address, uint) external;
}

/*

 A strategy must implement the following calls;

 - deposit()
 - withdraw(address) must exclude any tokens used in the yield - Controller role - withdraw should return to Controller
 - withdraw(uint) - Controller | Vault role - withdraw should always return to vault
 - withdrawAll() - Controller | Vault role - withdraw should always return to vault
 - balanceOf()

 Where possible, strategies must remain as immutable as possible, instead of updating variables, we update the contract by linking it in the controller

*/

contract StrategyMKRVaultDAIDelegate {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    address constant public token = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    address constant public want = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    address constant public weth = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    address constant public dai = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);

    address public cdp_manager = address(0x5ef30b9986345249bc32d8928B7ee64DE9435E39);
    address public vat = address(0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B);
    address public mcd_join_eth_a = address(0x2F0b23f53734252Bda2277357e97e1517d6B042A);
    address public mcd_join_dai = address(0x9759A6Ac90977b93B58547b4A71c78317f391A28);
    address public mcd_spot = address(0x65C79fcB50Ca1594B025960e539eD7A9a6D434A3);
    address public jug = address(0x19c0976f590D67707E62397C87829d896Dc0f1F1);

    address public eth_price_oracle = address(0xCF63089A8aD2a9D8BD6Bb8022f3190EB7e1eD0f1);
    address constant public yVaultDAI = address(0xACd43E627e64355f1861cEC6d3a6688B31a6F952);

    address constant public unirouter = address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

    uint public c = 20000;
    uint public c_safe = 30000;
    uint constant public c_base = 10000;

    uint public performanceFee = 500;
    uint constant public performanceMax = 10000;

    uint public withdrawalFee = 50;
    uint constant public withdrawalMax = 10000;
    
    uint public strategistReward = 5000;
    uint constant public strategistRewardMax = 10000;

    bytes32 constant public ilk = "ETH-A";

    address public governance;
    address public controller;
    address public strategist;
    address public harvester;

  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint public cdpId;

    constructor(address _controller) public {
        governance = msg.sender;
        strategist = 0x2839df1F230dedA9fDDBF1BCB0D4eB1Ee1f7b7d0;
        harvester = msg.sender;
        controller = _controller;
        cdpId = ManagerLike(cdp_manager).open(ilk, address(this));
        _approveAll();
    }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

    function getName() external pure returns (string memory) {
        return "StrategyMKRVaultDAIDelegate";
    }
mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
    
    function setStrategistReward(uint _strategistReward) external {
        require(msg.sender == governance, "!governance");
        strategistReward = _strategistReward;
    }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
    
    function setOracle(address _oracle) external {	
        require(msg.sender == governance, "!governance");	
        eth_price_oracle = _oracle;	
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }

    function setStrategist(address _strategist) external {
        require(msg.sender == governance, "!governance");
        strategist = _strategist;
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

    function setHarvester(address _harvester) external {
        require(msg.sender == harvester || msg.sender == governance, "!allowed");
        harvester = _harvester;
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

    function setWithdrawalFee(uint _withdrawalFee) external {
        require(msg.sender == governance, "!governance");
        withdrawalFee = _withdrawalFee;
    }
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }

    function setPerformanceFee(uint _performanceFee) external {
        require(msg.sender == governance, "!governance");
        performanceFee = _performanceFee;
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function setBorrowCollateralizationRatio(uint _c) external {
        require(msg.sender == governance, "!governance");
        c = _c;
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function setWithdrawCollateralizationRatio(uint _c_safe) external {
        require(msg.sender == governance, "!governance");
        c_safe = _c_safe;
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

    // optional
    function setMCDValue(
        address _manager,
        address _ethAdapter,
        address _daiAdapter,
        address _spot,
        address _jug
    ) external {
        require(msg.sender == governance, "!governance");
        cdp_manager = _manager;
        vat = ManagerLike(_manager).vat();
        mcd_join_eth_a = _ethAdapter;
        mcd_join_dai = _daiAdapter;
        mcd_spot = _spot;
        jug = _jug;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }

    function _approveAll() internal {
        IERC20(token).approve(mcd_join_eth_a, uint(-1));
        IERC20(dai).approve(mcd_join_dai, uint(-1));
        IERC20(dai).approve(yVaultDAI, uint(-1));
        IERC20(dai).approve(unirouter, uint(-1));
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

    function deposit() public {
        uint _token = IERC20(token).balanceOf(address(this));
        if (_token > 0) {
            uint p = _getPrice();
            uint _draw = _token.mul(p).mul(c_base).div(c).div(1e18);
            //// approve adapter to use token amount
            require(_checkDebtCeiling(_draw), "debt ceiling is reached!");
            _lockWETHAndDrawDAI(_token, _draw);
        }
        //// approve yVaultDAI use DAI
        yVault(yVaultDAI).depositAll();
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }

    function _getPrice() internal view returns (uint p) {
        (uint _read,) = OSMedianizer(eth_price_oracle).read();
        (uint _foresight,) = OSMedianizer(eth_price_oracle).foresight();
        p = _foresight < _read ? _foresight : _read;
    }

    function _checkDebtCeiling(uint _amt) internal view returns (bool) {
        (,,,uint _line,) = VatLike(vat).ilks(ilk);
        uint _debt = getTotalDebtAmount().add(_amt);
        if (_line.div(1e27) < _debt) { return false; }
        return true;
    }
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }

    function _lockWETHAndDrawDAI(uint wad, uint wadD) internal {
        address urn = ManagerLike(cdp_manager).urns(cdpId);

        //// GemJoinLike(mcd_join_eth_a).gem().approve(mcd_join_eth_a, wad);
        GemJoinLike(mcd_join_eth_a).join(urn, wad);
        ManagerLike(cdp_manager).frob(cdpId, toInt(wad), _getDrawDart(urn, wadD));
        ManagerLike(cdp_manager).move(cdpId, address(this), wadD.mul(1e27));
        if (VatLike(vat).can(address(this), address(mcd_join_dai)) == 0) {
            VatLike(vat).hope(mcd_join_dai);
        }
        DaiJoinLike(mcd_join_dai).exit(address(this), wadD);
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }

    function _getDrawDart(address urn, uint wad) internal returns (int dart) {
        uint rate = JugLike(jug).drip(ilk);
        uint _dai = VatLike(vat).dai(urn);

        // If there was already enough DAI in the vat balance, just exits it without adding more debt
        if (_dai < wad.mul(1e27)) {
            dart = toInt(wad.mul(1e27).sub(_dai).div(rate));
            dart = uint(dart).mul(rate) < wad.mul(1e27) ? dart + 1 : dart;
        }
    }

    function toInt(uint x) internal pure returns (int y) {
        y = int(x);
        require(y >= 0, "int-overflow");
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}

    // Controller only function for creating additional rewards from dust
    function withdraw(IERC20 _asset) external returns (uint balance) {
        require(msg.sender == controller, "!controller");
        require(want != address(_asset), "want");
        require(dai != address(_asset), "dai");
        require(yVaultDAI != address(_asset), "ydai");
        balance = _asset.balanceOf(address(this));
        _asset.safeTransfer(controller, balance);
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    // Withdraw partial funds, normally used with a vault withdrawal
    function withdraw(uint _amount) external {
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want).balanceOf(address(this));
        if (_balance < _amount) {
            _amount = _withdrawSome(_amount.sub(_balance));
            _amount = _amount.add(_balance);
        }

        uint _fee = _amount.mul(withdrawalFee).div(withdrawalMax);

        IERC20(want).safeTransfer(Controller(controller).rewards(), _fee);
        address _vault = Controller(controller).vaults(address(want));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds

        IERC20(want).safeTransfer(_vault, _amount.sub(_fee));
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}

    function _withdrawSome(uint256 _amount) internal returns (uint) {
        if (getTotalDebtAmount() != 0 && getmVaultRatio(_amount) < c_safe.mul(1e2)) {
            uint p = _getPrice();
            _wipe(_withdrawDaiLeast(_amount.mul(p).div(1e18)));
        }
        
        _freeWETH(_amount);
        
        return _amount;
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }

    function _freeWETH(uint wad) internal {
        ManagerLike(cdp_manager).frob(cdpId, -toInt(wad), 0);
        ManagerLike(cdp_manager).flux(cdpId, address(this), wad);
        GemJoinLike(mcd_join_eth_a).exit(address(this), wad);
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}

    function _wipe(uint wad) internal {
        // wad in DAI
        address urn = ManagerLike(cdp_manager).urns(cdpId);

        DaiJoinLike(mcd_join_dai).join(urn, wad);
        ManagerLike(cdp_manager).frob(cdpId, 0, _getWipeDart(VatLike(vat).dai(urn), urn));
    }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}

    function _getWipeDart(
        uint _dai,
        address urn
    ) internal view returns (int dart) {
        (, uint rate,,,) = VatLike(vat).ilks(ilk);
        (, uint art) = VatLike(vat).urns(ilk, urn);

        dart = toInt(_dai / rate);
        dart = uint(dart) <= art ? - dart : - toInt(art);
    }

    // Withdraw all funds, normally used when migrating strategies
    function withdrawAll() external returns (uint balance) {
        require(msg.sender == controller, "!controller");
        _withdrawAll();

        _swap(IERC20(dai).balanceOf(address(this)));
        balance = IERC20(want).balanceOf(address(this));

        address _vault = Controller(controller).vaults(address(want));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want).safeTransfer(_vault, balance);
    }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }

    function _withdrawAll() internal {
        yVault(yVaultDAI).withdrawAll(); // get Dai
        _wipe(getTotalDebtAmount().add(1)); // in case of edge case
        _freeWETH(balanceOfmVault());
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function balanceOf() public view returns (uint) {
        return balanceOfWant()
               .add(balanceOfmVault());
    }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}

    function balanceOfWant() public view returns (uint) {
        return IERC20(want).balanceOf(address(this));
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function balanceOfmVault() public view returns (uint) {
        uint ink;
        address urnHandler = ManagerLike(cdp_manager).urns(cdpId);
        (ink,) = VatLike(vat).urns(ilk, urnHandler);
        return ink;
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

    function harvest() public {
        require(msg.sender == strategist || msg.sender == harvester || msg.sender == governance, "!authorized");
        
        uint v = getUnderlyingDai();
        uint d = getTotalDebtAmount();
        require(v > d, "profit is not realized yet!");
        uint profit = v.sub(d);

        uint _before = IERC20(want).balanceOf(address(this));
        _swap(_withdrawDaiMost(profit));
        uint _after = IERC20(want).balanceOf(address(this));
        uint _want = _after.sub(_before);
        if (_want > 0) {
            uint _fee = _want.mul(performanceFee).div(performanceMax);
            uint _strategistReward = _fee.mul(strategistReward).div(strategistRewardMax);
            IERC20(want).safeTransfer(strategist, _strategistReward);
            IERC20(want).safeTransfer(Controller(controller).rewards(), _fee.sub(_strategistReward));
        }
        deposit();
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function shouldRebalance() external view returns (bool) {
        return getmVaultRatio(0) < c.mul(1e2);
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
    
    function rebalance() external {
        uint _safe = c.mul(1e2);
        uint _current = getmVaultRatio(0);
        if (_current < _safe) {
            uint d = getTotalDebtAmount();
            uint diff = _safe.sub(_current);
            uint free = d.mul(diff).div(_safe);
            _wipe(_withdrawDaiLeast(free));
        }
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
    
    function forceRebalance(uint _amount) external {
        require(msg.sender == governance || msg.sender == strategist || msg.sender == harvester, "!authorized");
        _wipe(_withdrawDaiLeast(_amount));
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }

    function getTotalDebtAmount() public view returns (uint) {
        uint art;
        uint rate;
        address urnHandler = ManagerLike(cdp_manager).urns(cdpId);
        (,art) = VatLike(vat).urns(ilk, urnHandler);
        (,rate,,,) = VatLike(vat).ilks(ilk);
        return art.mul(rate).div(1e27);
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }

    function getmVaultRatio(uint amount) public view returns (uint) {
        uint spot; // ray
        uint liquidationRatio; // ray
        uint denominator = getTotalDebtAmount();
        (,,spot,,) = VatLike(vat).ilks(ilk);
        (,liquidationRatio) = SpotLike(mcd_spot).ilks(ilk);
        uint delayedCPrice = spot.mul(liquidationRatio).div(1e27); // ray
        
        uint _balance = balanceOfmVault();
        if (_balance < amount) {
            _balance = 0;
        } else {
            _balance = _balance.sub(amount);
        }
        
        uint numerator = _balance.mul(delayedCPrice).div(1e18); // ray
        return numerator.div(denominator).div(1e3);
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function getUnderlyingWithdrawalFee() public view returns (uint) {
        address _strategy = Controller(controller).strategies(dai);
        return Strategy(_strategy).withdrawalFee();
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

    function getUnderlyingDai() public view returns (uint) {
        return IERC20(yVaultDAI).balanceOf(address(this))
                .mul(yVault(yVaultDAI).getPricePerFullShare())
                .div(1e18);
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function _withdrawDaiMost(uint _amount) internal returns (uint) {
        uint _shares = _amount
                        .mul(1e18)
                        .div(yVault(yVaultDAI).getPricePerFullShare());
        
        if (_shares > IERC20(yVaultDAI).balanceOf(address(this))) {
            _shares = IERC20(yVaultDAI).balanceOf(address(this));
        }
        
        uint _before = IERC20(dai).balanceOf(address(this));
        yVault(yVaultDAI).withdraw(_shares);
        uint _after = IERC20(dai).balanceOf(address(this));
        return _after.sub(_before);
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }

    function _withdrawDaiLeast(uint _amount) internal returns (uint) {
        uint _shares = _amount
                        .mul(1e18)
                        .div(yVault(yVaultDAI).getPricePerFullShare())
                        .mul(withdrawalMax)
                        .div(withdrawalMax.sub(getUnderlyingWithdrawalFee()));
        
        if (_shares > IERC20(yVaultDAI).balanceOf(address(this))) {
            _shares = IERC20(yVaultDAI).balanceOf(address(this));
        }
        
        uint _before = IERC20(dai).balanceOf(address(this));
        yVault(yVaultDAI).withdraw(_shares);
        uint _after = IERC20(dai).balanceOf(address(this));
        return _after.sub(_before);
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

    function _swap(uint _amountIn) internal {
        address[] memory path = new address[](2);
        path[0] = address(dai);
        path[1] = address(want);

        //// approve unirouter to use dai
        Uni(unirouter).swapExactTokensForTokens(_amountIn, 0, path, address(this), now.add(1 days));
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function setGovernance(address _governance) external {
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }

    function setController(address _controller) external {
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}