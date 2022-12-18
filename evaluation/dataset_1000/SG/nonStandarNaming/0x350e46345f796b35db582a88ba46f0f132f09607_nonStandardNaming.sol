                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY329() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF774(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER501(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE202(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DECIMALS973() external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE172(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM38(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER763(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL109(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD664(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB429(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB429(a, b, "SafeMath: subtraction overflow");
    }
    function SUB429(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL106(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV615(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV615(a, b, "SafeMath: division by zero");
    }
    function DIV615(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD242(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD242(a, b, "SafeMath: modulo by zero");
    }
    function MOD242(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT93(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE742(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE782(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER468(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN402(token, abi.encodeWithSelector(token.TRANSFER501.selector, to, value));
    }

    function SAFETRANSFERFROM764(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN402(token, abi.encodeWithSelector(token.TRANSFERFROM38.selector, from, to, value));
    }

    function SAFEAPPROVE913(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE202(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN402(token, abi.encodeWithSelector(token.APPROVE172.selector, spender, value));
    }
    function CALLOPTIONALRETURN402(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT93(), "SafeERC20: call to non-contract");

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
    function GETPRICEPERFULLSHARE122() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF774(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function DEPOSITALL172() external;	//inject NONSTANDARD NAMING
    function WITHDRAW593(uint _shares) external;	//inject NONSTANDARD NAMING
    function WITHDRAWALL963() external;	//inject NONSTANDARD NAMING
}

interface Controller {
    function VAULTS503(address) external view returns (address);	//inject NONSTANDARD NAMING
    function STRATEGIES413(address) external view returns (address);	//inject NONSTANDARD NAMING
    function REWARDS628() external view returns (address);	//inject NONSTANDARD NAMING
}

interface Strategy {
    function WITHDRAWALFEE222() external view returns (uint);	//inject NONSTANDARD NAMING
}

                         

interface GemLike {
    function APPROVE172(address, uint) external;	//inject NONSTANDARD NAMING
    function TRANSFER501(address, uint) external;	//inject NONSTANDARD NAMING
    function TRANSFERFROM38(address, address, uint) external;	//inject NONSTANDARD NAMING
    function DEPOSIT965() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW593(uint) external;	//inject NONSTANDARD NAMING
}

interface ManagerLike {
    function CDPCAN50(address, uint, address) external view returns (uint);	//inject NONSTANDARD NAMING
    function ILKS102(uint) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function OWNS383(uint) external view returns (address);	//inject NONSTANDARD NAMING
    function URNS676(uint) external view returns (address);	//inject NONSTANDARD NAMING
    function VAT390() external view returns (address);	//inject NONSTANDARD NAMING
    function OPEN700(bytes32, address) external returns (uint);	//inject NONSTANDARD NAMING
    function GIVE189(uint, address) external;	//inject NONSTANDARD NAMING
    function CDPALLOW373(uint, address, uint) external;	//inject NONSTANDARD NAMING
    function URNALLOW823(address, uint) external;	//inject NONSTANDARD NAMING
    function FROB187(uint, int, int) external;	//inject NONSTANDARD NAMING
    function FLUX461(uint, address, uint) external;	//inject NONSTANDARD NAMING
    function MOVE324(uint, address, uint) external;	//inject NONSTANDARD NAMING
    function EXIT395(address, uint, address, uint) external;	//inject NONSTANDARD NAMING
    function QUIT745(uint, address) external;	//inject NONSTANDARD NAMING
    function ENTER889(address, uint) external;	//inject NONSTANDARD NAMING
    function SHIFT548(uint, uint) external;	//inject NONSTANDARD NAMING
}

interface VatLike {
    function CAN557(address, address) external view returns (uint);	//inject NONSTANDARD NAMING
    function ILKS102(bytes32) external view returns (uint, uint, uint, uint, uint);	//inject NONSTANDARD NAMING
    function DAI204(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function URNS676(bytes32, address) external view returns (uint, uint);	//inject NONSTANDARD NAMING
    function FROB187(bytes32, address, address, address, int, int) external;	//inject NONSTANDARD NAMING
    function HOPE119(address) external;	//inject NONSTANDARD NAMING
    function MOVE324(address, address, uint) external;	//inject NONSTANDARD NAMING
}

interface GemJoinLike {
    function DEC388() external returns (uint);	//inject NONSTANDARD NAMING
    function GEM292() external returns (GemLike);	//inject NONSTANDARD NAMING
    function JOIN467(address, uint) external payable;	//inject NONSTANDARD NAMING
    function EXIT395(address, uint) external;	//inject NONSTANDARD NAMING
}

interface GNTJoinLike {
    function BAGS740(address) external view returns (address);	//inject NONSTANDARD NAMING
    function MAKE691(address) external returns (address);	//inject NONSTANDARD NAMING
}

interface DaiJoinLike {
    function VAT390() external returns (VatLike);	//inject NONSTANDARD NAMING
    function DAI204() external returns (GemLike);	//inject NONSTANDARD NAMING
    function JOIN467(address, uint) external payable;	//inject NONSTANDARD NAMING
    function EXIT395(address, uint) external;	//inject NONSTANDARD NAMING
}

interface HopeLike {
    function HOPE119(address) external;	//inject NONSTANDARD NAMING
    function NOPE695(address) external;	//inject NONSTANDARD NAMING
}

interface EndLike {
    function FIX462(bytes32) external view returns (uint);	//inject NONSTANDARD NAMING
    function CASH149(bytes32, uint) external;	//inject NONSTANDARD NAMING
    function FREE302(bytes32) external;	//inject NONSTANDARD NAMING
    function PACK395(uint) external;	//inject NONSTANDARD NAMING
    function SKIM739(bytes32, address) external;	//inject NONSTANDARD NAMING
}

interface JugLike {
    function DRIP453(bytes32) external returns (uint);	//inject NONSTANDARD NAMING
}

interface PotLike {
    function PIE680(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function DRIP453() external returns (uint);	//inject NONSTANDARD NAMING
    function JOIN467(uint) external;	//inject NONSTANDARD NAMING
    function EXIT395(uint) external;	//inject NONSTANDARD NAMING
}

interface SpotLike {
    function ILKS102(bytes32) external view returns (address, uint);	//inject NONSTANDARD NAMING
}

interface OSMedianizer {
    function READ989() external view returns (uint, bool);	//inject NONSTANDARD NAMING
    function FORESIGHT799() external view returns (uint, bool);	//inject NONSTANDARD NAMING
}

interface Uni {
    function SWAPEXACTTOKENSFORTOKENS189(uint, uint, address[] calldata, address, uint) external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

contract StrategyMKRVaultDAIDelegate {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    address constant public token263 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);	//inject NONSTANDARD NAMING
    address constant public want176 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);	//inject NONSTANDARD NAMING
    address constant public weth592 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);	//inject NONSTANDARD NAMING
    address constant public dai752 = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING

    address public cdp_manager = address(0x5ef30b9986345249bc32d8928B7ee64DE9435E39);
    address public vat = address(0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B);
    address public mcd_join_eth_a = address(0x2F0b23f53734252Bda2277357e97e1517d6B042A);
    address public mcd_join_dai = address(0x9759A6Ac90977b93B58547b4A71c78317f391A28);
    address public mcd_spot = address(0x65C79fcB50Ca1594B025960e539eD7A9a6D434A3);
    address public jug = address(0x19c0976f590D67707E62397C87829d896Dc0f1F1);

    address public eth_price_oracle = address(0xCF63089A8aD2a9D8BD6Bb8022f3190EB7e1eD0f1);
    address constant public yvaultdai729 = address(0xACd43E627e64355f1861cEC6d3a6688B31a6F952);	//inject NONSTANDARD NAMING

    address constant public unirouter986 = address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING

    uint public c = 20000;
    uint public c_safe = 30000;
    uint constant public c_base40 = 10000;	//inject NONSTANDARD NAMING

    uint public performanceFee = 500;
    uint constant public performancemax893 = 10000;	//inject NONSTANDARD NAMING

    uint public withdrawalFee = 50;
    uint constant public withdrawalmax567 = 10000;	//inject NONSTANDARD NAMING
    
    uint public strategistReward = 5000;
    uint constant public strategistrewardmax641 = 10000;	//inject NONSTANDARD NAMING

    bytes32 constant public ilk193 = "ETH-A";	//inject NONSTANDARD NAMING

    address public governance;
    address public controller;
    address public strategist;
    address public harvester;

    uint public cdpId;

    constructor(address _controller) public {
        governance = msg.sender;
        strategist = 0x2839df1F230dedA9fDDBF1BCB0D4eB1Ee1f7b7d0;
        harvester = msg.sender;
        controller = _controller;
        cdpId = ManagerLike(cdp_manager).OPEN700(ilk193, address(this));
        _APPROVEALL374();
    }

    function GETNAME389() external pure returns (string memory) {	//inject NONSTANDARD NAMING
        return "StrategyMKRVaultDAIDelegate";
    }
    
    function SETSTRATEGISTREWARD855(uint _strategistReward) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        strategistReward = _strategistReward;
    }
    
    function SETORACLE476(address _oracle) external {		//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");	
        eth_price_oracle = _oracle;	
    }

    function SETSTRATEGIST337(address _strategist) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        strategist = _strategist;
    }

    function SETHARVESTER506(address _harvester) external {	//inject NONSTANDARD NAMING
        require(msg.sender == harvester || msg.sender == governance, "!allowed");
        harvester = _harvester;
    }

    function SETWITHDRAWALFEE376(uint _withdrawalFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        withdrawalFee = _withdrawalFee;
    }

    function SETPERFORMANCEFEE334(uint _performanceFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        performanceFee = _performanceFee;
    }

    function SETBORROWCOLLATERALIZATIONRATIO617(uint _c) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        c = _c;
    }

    function SETWITHDRAWCOLLATERALIZATIONRATIO614(uint _c_safe) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        c_safe = _c_safe;
    }

    // optional
    function SETMCDVALUE54(	//inject NONSTANDARD NAMING
        address _manager,
        address _ethAdapter,
        address _daiAdapter,
        address _spot,
        address _jug
    ) external {
        require(msg.sender == governance, "!governance");
        cdp_manager = _manager;
        vat = ManagerLike(_manager).VAT390();
        mcd_join_eth_a = _ethAdapter;
        mcd_join_dai = _daiAdapter;
        mcd_spot = _spot;
        jug = _jug;
    }

    function _APPROVEALL374() internal {	//inject NONSTANDARD NAMING
        IERC20(token263).APPROVE172(mcd_join_eth_a, uint(-1));
        IERC20(dai752).APPROVE172(mcd_join_dai, uint(-1));
        IERC20(dai752).APPROVE172(yvaultdai729, uint(-1));
        IERC20(dai752).APPROVE172(unirouter986, uint(-1));
    }

    function DEPOSIT965() public {	//inject NONSTANDARD NAMING
        uint _token = IERC20(token263).BALANCEOF774(address(this));
        if (_token > 0) {
            uint p = _GETPRICE356();
            uint _draw = _token.MUL106(p).MUL106(c_base40).DIV615(c).DIV615(1e18);
                                                    
            require(_CHECKDEBTCEILING165(_draw), "debt ceiling is reached!");
            _LOCKWETHANDDRAWDAI906(_token, _draw);
        }
                                      
        yVault(yvaultdai729).DEPOSITALL172();
    }

    function _GETPRICE356() internal view returns (uint p) {	//inject NONSTANDARD NAMING
        (uint _read,) = OSMedianizer(eth_price_oracle).READ989();
        (uint _foresight,) = OSMedianizer(eth_price_oracle).FORESIGHT799();
        p = _foresight < _read ? _foresight : _read;
    }

    function _CHECKDEBTCEILING165(uint _amt) internal view returns (bool) {	//inject NONSTANDARD NAMING
        (,,,uint _line,) = VatLike(vat).ILKS102(ilk193);
        uint _debt = GETTOTALDEBTAMOUNT110().ADD664(_amt);
        if (_line.DIV615(1e27) < _debt) { return false; }
        return true;
    }

    function _LOCKWETHANDDRAWDAI906(uint wad, uint wadD) internal {	//inject NONSTANDARD NAMING
        address urn = ManagerLike(cdp_manager).URNS676(cdpId);

                                                                            
        GemJoinLike(mcd_join_eth_a).JOIN467(urn, wad);
        ManagerLike(cdp_manager).FROB187(cdpId, TOINT284(wad), _GETDRAWDART418(urn, wadD));
        ManagerLike(cdp_manager).MOVE324(cdpId, address(this), wadD.MUL106(1e27));
        if (VatLike(vat).CAN557(address(this), address(mcd_join_dai)) == 0) {
            VatLike(vat).HOPE119(mcd_join_dai);
        }
        DaiJoinLike(mcd_join_dai).EXIT395(address(this), wadD);
    }

    function _GETDRAWDART418(address urn, uint wad) internal returns (int dart) {	//inject NONSTANDARD NAMING
        uint rate = JugLike(jug).DRIP453(ilk193);
        uint _dai = VatLike(vat).DAI204(urn);

        // If there was already enough DAI in the vat balance, just exits it without adding more debt
        if (_dai < wad.MUL106(1e27)) {
            dart = TOINT284(wad.MUL106(1e27).SUB429(_dai).DIV615(rate));
            dart = uint(dart).MUL106(rate) < wad.MUL106(1e27) ? dart + 1 : dart;
        }
    }

    function TOINT284(uint x) internal pure returns (int y) {	//inject NONSTANDARD NAMING
        y = int(x);
        require(y >= 0, "int-overflow");
    }

    // Controller only function for creating additional rewards from dust
    function WITHDRAW593(IERC20 _asset) external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(want176 != address(_asset), "want");
        require(dai752 != address(_asset), "dai");
        require(yvaultdai729 != address(_asset), "ydai");
        balance = _asset.BALANCEOF774(address(this));
        _asset.SAFETRANSFER468(controller, balance);
    }

    // Withdraw partial funds, normally used with a vault withdrawal
    function WITHDRAW593(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        uint _balance = IERC20(want176).BALANCEOF774(address(this));
        if (_balance < _amount) {
            _amount = _WITHDRAWSOME429(_amount.SUB429(_balance));
            _amount = _amount.ADD664(_balance);
        }

        uint _fee = _amount.MUL106(withdrawalFee).DIV615(withdrawalmax567);

        IERC20(want176).SAFETRANSFER468(Controller(controller).REWARDS628(), _fee);
        address _vault = Controller(controller).VAULTS503(address(want176));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds

        IERC20(want176).SAFETRANSFER468(_vault, _amount.SUB429(_fee));
    }

    function _WITHDRAWSOME429(uint256 _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        if (GETTOTALDEBTAMOUNT110() != 0 && GETMVAULTRATIO863(_amount) < c_safe.MUL106(1e2)) {
            uint p = _GETPRICE356();
            _WIPE989(_WITHDRAWDAILEAST456(_amount.MUL106(p).DIV615(1e18)));
        }
        
        _FREEWETH568(_amount);
        
        return _amount;
    }

    function _FREEWETH568(uint wad) internal {	//inject NONSTANDARD NAMING
        ManagerLike(cdp_manager).FROB187(cdpId, -TOINT284(wad), 0);
        ManagerLike(cdp_manager).FLUX461(cdpId, address(this), wad);
        GemJoinLike(mcd_join_eth_a).EXIT395(address(this), wad);
    }

    function _WIPE989(uint wad) internal {	//inject NONSTANDARD NAMING
        // wad in DAI
        address urn = ManagerLike(cdp_manager).URNS676(cdpId);

        DaiJoinLike(mcd_join_dai).JOIN467(urn, wad);
        ManagerLike(cdp_manager).FROB187(cdpId, 0, _GETWIPEDART948(VatLike(vat).DAI204(urn), urn));
    }

    function _GETWIPEDART948(	//inject NONSTANDARD NAMING
        uint _dai,
        address urn
    ) internal view returns (int dart) {
        (, uint rate,,,) = VatLike(vat).ILKS102(ilk193);
        (, uint art) = VatLike(vat).URNS676(ilk193, urn);

        dart = TOINT284(_dai / rate);
        dart = uint(dart) <= art ? - dart : - TOINT284(art);
    }

    // Withdraw all funds, normally used when migrating strategies
    function WITHDRAWALL963() external returns (uint balance) {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        _WITHDRAWALL776();

        _SWAP335(IERC20(dai752).BALANCEOF774(address(this)));
        balance = IERC20(want176).BALANCEOF774(address(this));

        address _vault = Controller(controller).VAULTS503(address(want176));
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        IERC20(want176).SAFETRANSFER468(_vault, balance);
    }

    function _WITHDRAWALL776() internal {	//inject NONSTANDARD NAMING
        yVault(yvaultdai729).WITHDRAWALL963(); // get Dai
        _WIPE989(GETTOTALDEBTAMOUNT110().ADD664(1)); // in case of edge case
        _FREEWETH568(BALANCEOFMVAULT30());
    }

    function BALANCEOF774() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCEOFWANT764()
               .ADD664(BALANCEOFMVAULT30());
    }

    function BALANCEOFWANT764() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(want176).BALANCEOF774(address(this));
    }

    function BALANCEOFMVAULT30() public view returns (uint) {	//inject NONSTANDARD NAMING
        uint ink;
        address urnHandler = ManagerLike(cdp_manager).URNS676(cdpId);
        (ink,) = VatLike(vat).URNS676(ilk193, urnHandler);
        return ink;
    }

    function HARVEST950() public {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == harvester || msg.sender == governance, "!authorized");
        
        uint v = GETUNDERLYINGDAI768();
        uint d = GETTOTALDEBTAMOUNT110();
        require(v > d, "profit is not realized yet!");
        uint profit = v.SUB429(d);

        uint _before = IERC20(want176).BALANCEOF774(address(this));
        _SWAP335(_WITHDRAWDAIMOST371(profit));
        uint _after = IERC20(want176).BALANCEOF774(address(this));
        uint _want = _after.SUB429(_before);
        if (_want > 0) {
            uint _fee = _want.MUL106(performanceFee).DIV615(performancemax893);
            uint _strategistReward = _fee.MUL106(strategistReward).DIV615(strategistrewardmax641);
            IERC20(want176).SAFETRANSFER468(strategist, _strategistReward);
            IERC20(want176).SAFETRANSFER468(Controller(controller).REWARDS628(), _fee.SUB429(_strategistReward));
        }
        DEPOSIT965();
    }

    function SHOULDREBALANCE842() external view returns (bool) {	//inject NONSTANDARD NAMING
        return GETMVAULTRATIO863(0) < c.MUL106(1e2);
    }
    
    function REBALANCE677() external {	//inject NONSTANDARD NAMING
        uint _safe = c.MUL106(1e2);
        uint _current = GETMVAULTRATIO863(0);
        if (_current < _safe) {
            uint d = GETTOTALDEBTAMOUNT110();
            uint diff = _safe.SUB429(_current);
            uint free = d.MUL106(diff).DIV615(_safe);
            _WIPE989(_WITHDRAWDAILEAST456(free));
        }
    }
    
    function FORCEREBALANCE453(uint _amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance || msg.sender == strategist || msg.sender == harvester, "!authorized");
        _WIPE989(_WITHDRAWDAILEAST456(_amount));
    }

    function GETTOTALDEBTAMOUNT110() public view returns (uint) {	//inject NONSTANDARD NAMING
        uint art;
        uint rate;
        address urnHandler = ManagerLike(cdp_manager).URNS676(cdpId);
        (,art) = VatLike(vat).URNS676(ilk193, urnHandler);
        (,rate,,,) = VatLike(vat).ILKS102(ilk193);
        return art.MUL106(rate).DIV615(1e27);
    }

    function GETMVAULTRATIO863(uint amount) public view returns (uint) {	//inject NONSTANDARD NAMING
        uint spot; // ray
        uint liquidationRatio; // ray
        uint denominator = GETTOTALDEBTAMOUNT110();
        (,,spot,,) = VatLike(vat).ILKS102(ilk193);
        (,liquidationRatio) = SpotLike(mcd_spot).ILKS102(ilk193);
        uint delayedCPrice = spot.MUL106(liquidationRatio).DIV615(1e27); // ray
        
        uint _balance = BALANCEOFMVAULT30();
        if (_balance < amount) {
            _balance = 0;
        } else {
            _balance = _balance.SUB429(amount);
        }
        
        uint numerator = _balance.MUL106(delayedCPrice).DIV615(1e18); // ray
        return numerator.DIV615(denominator).DIV615(1e3);
    }

    function GETUNDERLYINGWITHDRAWALFEE714() public view returns (uint) {	//inject NONSTANDARD NAMING
        address _strategy = Controller(controller).STRATEGIES413(dai752);
        return Strategy(_strategy).WITHDRAWALFEE222();
    }

    function GETUNDERLYINGDAI768() public view returns (uint) {	//inject NONSTANDARD NAMING
        return IERC20(yvaultdai729).BALANCEOF774(address(this))
                .MUL106(yVault(yvaultdai729).GETPRICEPERFULLSHARE122())
                .DIV615(1e18);
    }

    function _WITHDRAWDAIMOST371(uint _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _shares = _amount
                        .MUL106(1e18)
                        .DIV615(yVault(yvaultdai729).GETPRICEPERFULLSHARE122());
        
        if (_shares > IERC20(yvaultdai729).BALANCEOF774(address(this))) {
            _shares = IERC20(yvaultdai729).BALANCEOF774(address(this));
        }
        
        uint _before = IERC20(dai752).BALANCEOF774(address(this));
        yVault(yvaultdai729).WITHDRAW593(_shares);
        uint _after = IERC20(dai752).BALANCEOF774(address(this));
        return _after.SUB429(_before);
    }

    function _WITHDRAWDAILEAST456(uint _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint _shares = _amount
                        .MUL106(1e18)
                        .DIV615(yVault(yvaultdai729).GETPRICEPERFULLSHARE122())
                        .MUL106(withdrawalmax567)
                        .DIV615(withdrawalmax567.SUB429(GETUNDERLYINGWITHDRAWALFEE714()));
        
        if (_shares > IERC20(yvaultdai729).BALANCEOF774(address(this))) {
            _shares = IERC20(yvaultdai729).BALANCEOF774(address(this));
        }
        
        uint _before = IERC20(dai752).BALANCEOF774(address(this));
        yVault(yvaultdai729).WITHDRAW593(_shares);
        uint _after = IERC20(dai752).BALANCEOF774(address(this));
        return _after.SUB429(_before);
    }

    function _SWAP335(uint _amountIn) internal {	//inject NONSTANDARD NAMING
        address[] memory path = new address[](2);
        path[0] = address(dai752);
        path[1] = address(want176);

                                         
        Uni(unirouter986).SWAPEXACTTOKENSFORTOKENS189(_amountIn, 0, path, address(this), now.ADD664(1 days));
    }

    function SETGOVERNANCE537(address _governance) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    function SETCONTROLLER635(address _controller) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
}