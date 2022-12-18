                                                                 

pragma solidity ^0.5.16;

library SafeMath {

    function MUL199(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) 
            return 0;
        uint256 c = a * b;
        require(c / a == b);
        return c;
    }

    function DIV244(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0);
        uint256 c = a / b;
        return c;
    }

    function SUB339(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;
        return c;
    }

    function ADD80(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);
        return c;
    }

    function MOD846(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

contract Ownable {
    address public owner;

    event OWNERSHIPTRANSFERRED666(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
                                                                                                                           
    constructor() public {
        owner = msg.sender;
    }
                                                                                 
    modifier ONLYOWNER627() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }
                                                                                                                                                                 
    function TRANSFEROWNERSHIP423(address newOwner) public ONLYOWNER627 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED666(owner, newOwner);
        owner = newOwner;
    }
}

contract ERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) internal _balances;
    mapping (address => mapping (address => uint256)) internal _allowed;
    
    event TRANSFER92(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL14(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    uint256 internal _totalSupply;

                                                             
    function TOTALSUPPLY10() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                         
    function BALANCEOF87(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                               
    function ALLOWANCE367(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                            
    function TRANSFER663(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER982(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE854(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[msg.sender][spender] = value;
        emit APPROVAL14(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function TRANSFERFROM176(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER982(from, to, value);
        if(_allowed[msg.sender][to] < uint256(-1)) {
            _allowed[msg.sender][to] = _allowed[msg.sender][to].SUB339(value);
        }
        return true;
    }

    function _TRANSFER982(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));
        _balances[from] = _balances[from].SUB339(value);
        _balances[to] = _balances[to].ADD80(value);
        emit TRANSFER92(from, to, value);
    }

}

contract ERC20Mintable is ERC20 {

    function _MINT735(address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _balances[to] = _balances[to].ADD80(amount);
        _totalSupply = _totalSupply.ADD80(amount);
        emit TRANSFER92(address(0), to, amount);
    }

    function _BURN371(address from, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _balances[from] = _balances[from].SUB339(amount);
        _totalSupply = _totalSupply.SUB339(amount);
        emit TRANSFER92(from, address(0), amount);
    }

}

contract borrowTokenFallBack {
    function RECEIVETOKEN187(address caller, address token, uint256 amount, uint256 amountToRepay, bytes calldata data) external;	//inject NONSTANDARD NAMING
}

contract proxy {
    function TOTALVALUE323() external returns(uint256);	//inject NONSTANDARD NAMING
    function TOTALVALUESTORED777() external view returns(uint256);	//inject NONSTANDARD NAMING
    function DEPOSIT734(uint256 amount) external returns(bool);	//inject NONSTANDARD NAMING
    function WITHDRAW773(address to, uint256 amount) external returns(bool);	//inject NONSTANDARD NAMING
    function ISPROXY755() external returns(bool);	//inject NONSTANDARD NAMING
}

contract DAIHub is ERC20Mintable, Ownable {
    using SafeMath for uint256;

    address public pendingProxy;
    uint256 public mature;
    uint256 public repayRate; // amount to repay = borrow * repayRate / 1e18

    ERC20 constant dai517 = ERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING

    mapping(address => bool) public isProxy;

    address[] public proxies;

    event PROPOSEPROXY307(address proxy, uint256 mature);	//inject NONSTANDARD NAMING
    event ADDPROXY550(address proxy);	//inject NONSTANDARD NAMING
    event BORROW829(address indexed who, uint256 amount);	//inject NONSTANDARD NAMING

    //calculate value from all proxies and cash
    function TOTALVALUE323() public returns(uint256 sum) {  	//inject NONSTANDARD NAMING
        sum = CASH965();
        for(uint256 i = 0; i < proxies.length; i++){
            sum = sum.ADD80(proxy(proxies[i]).TOTALVALUE323());
        }
    }

    function TOTALVALUESTORED777() external view returns(uint256 sum) {	//inject NONSTANDARD NAMING
        sum = CASH965();
        for(uint256 i = 0; i < proxies.length; i++){
            sum = sum.ADD80(proxy(proxies[i]).TOTALVALUESTORED777());
        }
    }

    //cash value of an user's deposit
    function BALANCEOFUNDERLYING62(address who) public returns(uint256) {	//inject NONSTANDARD NAMING
        return BALANCEOF87(who).MUL199(TOTALVALUE323()).DIV244(TOTALSUPPLY10());
    }

    // cash in this contract
    function CASH965() public view returns(uint256) {	//inject NONSTANDARD NAMING
        return dai517.BALANCEOF87(address(this));
    }

    // deposit money to this contract
    function DEPOSIT734(address to, uint256 amount) external returns(uint256 increased) {	//inject NONSTANDARD NAMING
        
        if(TOTALSUPPLY10() > 0) {
            increased = TOTALSUPPLY10().MUL199(amount).DIV244(TOTALVALUE323());
            _MINT735(to, increased);
        }
        else {
            increased = amount;
            _MINT735(to, amount);
        }

        require(dai517.TRANSFERFROM176(msg.sender, address(this), amount));
    }

    //withdraw money by burning `amount` share
    function WITHDRAW773(address to, uint256 amount) external {	//inject NONSTANDARD NAMING
        uint256 withdrawal = amount.MUL199(TOTALVALUE323()).DIV244(TOTALSUPPLY10());
        _BURN371(msg.sender, amount);
        _WITHDRAW716(to, withdrawal);
    }

    //withdraw certain `amount` of money
    function WITHDRAWUNDERLYING628(address to, uint256 amount) external {	//inject NONSTANDARD NAMING
        uint256 shareToBurn = amount.MUL199(TOTALSUPPLY10()).DIV244(TOTALVALUE323()).ADD80(1);
        _BURN371(msg.sender, shareToBurn);
        _WITHDRAW716(to, amount);
    }

    //borrow `amount` token, call by EOA
    function BORROW717(address to, uint256 amount, bytes calldata data) external {	//inject NONSTANDARD NAMING
        uint256 repayAmount = amount.MUL199(repayRate).DIV244(1e18);
        _WITHDRAW716(to, amount);
        borrowTokenFallBack(to).RECEIVETOKEN187(msg.sender, address(dai517), amount, repayAmount, data);
        require(dai517.TRANSFERFROM176(to, address(this), repayAmount));
    }

    //borrow `amount` token, call by contract
    function BORROW717(uint256 amount) external {	//inject NONSTANDARD NAMING
        uint256 repayAmount = amount.MUL199(repayRate).DIV244(1e18);
        _WITHDRAW716(msg.sender, amount);
        borrowTokenFallBack(msg.sender).RECEIVETOKEN187(msg.sender, address(dai517), amount, repayAmount, bytes(""));
        require(dai517.TRANSFERFROM176(msg.sender, address(this), repayAmount));
    }

    function _WITHDRAW716(address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        uint256 _cash = CASH965();

        if(amount <= _cash) {
            require(dai517.TRANSFER663(msg.sender, amount));
        }
        else {
            require(dai517.TRANSFER663(msg.sender, _cash));
            amount -= _cash;
            
            for(uint256 i = 0; i < proxies.length && amount > 0; i++) {
                _cash = proxy(proxies[i]).TOTALVALUE323();
                if(_cash == 0) continue;
                if(amount <= _cash) {
                    proxy(proxies[i]).WITHDRAW773(to, amount);
                    amount = 0;
                }
                else {
                    proxy(proxies[i]).WITHDRAW773(to, _cash);
                    amount -= _cash;
                }
            }
            require(amount == 0);
        }
    }

    //propose a new proxy to be added
    function PROPOSEPROXY186(address _proxy) external ONLYOWNER627 {	//inject NONSTANDARD NAMING
        pendingProxy = _proxy;
        mature = now.ADD80(7 days);
        emit PROPOSEPROXY307(_proxy, mature);
    }

    //add a new proxy by owner
    function ADDPROXY846() external ONLYOWNER627 {	//inject NONSTANDARD NAMING
        require(now >= mature);
        require(isProxy[pendingProxy] == false);
        //require(proxy(pendingProxy).isProxy());
        isProxy[pendingProxy] = true;
        proxies.push(pendingProxy);
        dai517.APPROVE854(pendingProxy, uint256(-1));
        emit ADDPROXY550(pendingProxy);
        pendingProxy = address(0);
    }

    //invest cash to a proxy
    function INVEST24(address _proxy, uint256 amount) external ONLYOWNER627 {	//inject NONSTANDARD NAMING
        require(isProxy[_proxy]);
        proxy(_proxy).DEPOSIT734(amount);
    }

    //redeem investment from a proxy
    function REDEEM205(address _proxy, uint256 amount) external ONLYOWNER627 {	//inject NONSTANDARD NAMING
        require(isProxy[_proxy]);
        proxy(_proxy).WITHDRAW773(address(this), amount);
    }

    //set new repay rate
    function SETREPAYRATE586(uint256 newRepayRate) external ONLYOWNER627 {	//inject NONSTANDARD NAMING
        require(newRepayRate <= 1.05e18); //repayRate must be less than 105%
        repayRate = newRepayRate;
    }

    //swap position of two proxies in list
    function SWAPPROXY877(uint256 a, uint256 b) external ONLYOWNER627 {	//inject NONSTANDARD NAMING
        require(a < proxies.length && b < proxies.length);
        (proxies[a], proxies[b]) = (proxies[b], proxies[a]);
    }

    //ERC20 token info
    uint8 public decimals;
    string public name;
    string public symbol; 

    //constructor
    constructor(address[] memory _proxies) public {
        for(uint256 i = 0; i < _proxies.length; i++){
            proxies.push(_proxies[i]);
            isProxy[_proxies[i]] = true;
            dai517.APPROVE854(_proxies[i], uint256(-1));
        }
        repayRate = 1.002e18;
        decimals = 18;
        name = "DAIHub";
        symbol = "hDAI";
    }
}