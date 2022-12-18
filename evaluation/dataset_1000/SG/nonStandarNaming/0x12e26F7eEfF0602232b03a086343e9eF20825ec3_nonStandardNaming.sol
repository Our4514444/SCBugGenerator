                                                                 

pragma solidity 0.5.16;

interface ERC20Interface {
    function BALANCEOF365(address owner)  external view returns(uint256 balance);	//inject NONSTANDARD NAMING
    function TRANSFER909(address to, uint value) external returns(bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM421(address _from, address _to, uint256 value)  external returns(bool success);	//inject NONSTANDARD NAMING
    function EXCHANGE_PRICE5() external view returns(uint256 actual_Price);	//inject NONSTANDARD NAMING
}

contract WBCATM {

    address public _owner;
    address public TOKEN_SC;
    address public EXCHNG;
    
    uint8 public Provision;
    uint256 public TOKEN_PRICE;

    mapping ( address => uint256 ) public Token_Safe;
    mapping ( address => uint256 ) public ETH_Deposit;

    event DEPOSIT945(address user, uint256 amountETH);	//inject NONSTANDARD NAMING
    event EXCHANGE845(address buyer, uint256 amount, uint paid, uint provision);	//inject NONSTANDARD NAMING
    event WITHDRAWBALANCE503(address user, uint256 balanceETH );	//inject NONSTANDARD NAMING
    event CALCULATEDAMOUNT757(uint256 amount);	//inject NONSTANDARD NAMING

    modifier ONLYOWNER397() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner, "only Owner");
        _;
    }

   constructor() public {
        _owner = msg.sender;
        TOKEN_SC = 0x79C90021A36250BcE01f11CFd847Ba30E05488B1;
        TOKEN_PRICE = 0.001 ether;
        Provision = 10;
   }

    function () external payable {
        require(msg.value > 0);
        ETH_Deposit[msg.sender] += msg.value;
        emit DEPOSIT945(msg.sender, msg.value);
    }

    function DEPOSIT878(uint256 amount) payable public {	//inject NONSTANDARD NAMING
        require(msg.value == amount);
        require(amount > 0);
        ETH_Deposit[msg.sender] += msg.value;
        emit DEPOSIT945(msg.sender, msg.value);
    }

    function EXCHANGETOKEN2ETH87(uint256 _amountWei) payable public {  	//inject NONSTANDARD NAMING
        require(_amountWei > 0,"Value must more then 0 !");
        ERC20Interface ERC20Token = ERC20Interface(TOKEN_SC);
        ERC20Token.TRANSFERFROM421(msg.sender, address(this), _amountWei);

        Token_Safe[TOKEN_SC] = Token_Safe[TOKEN_SC] + _amountWei ;
        
        uint256 Prov = ((_amountWei* TOKEN_PRICE)/(10**18)) * Provision / 100 ;
        uint256 amountWeiETH = ((_amountWei * TOKEN_PRICE)/(10**18)) - Prov ;
        msg.sender.transfer(amountWeiETH);
        emit EXCHANGE845 ( msg.sender, _amountWei, amountWeiETH, Prov);
    }

    function WITHDRAWETH252(uint256 amountWeiETH) public payable ONLYOWNER397 {	//inject NONSTANDARD NAMING
        require(amountWeiETH > 0,"Value must more then 0 !");
        uint256 balanceETH;
        balanceETH = address(this).balance;
        require(balanceETH >= amountWeiETH);
        address(uint160(msg.sender)).transfer(amountWeiETH);
    }

    function WITHDRAWQPON809() public ONLYOWNER397 {	//inject NONSTANDARD NAMING
        require(Token_Safe[TOKEN_SC] > 0,"Token Safe is empty !");
        ERC20Interface ERC20Token = ERC20Interface(TOKEN_SC);
        ERC20Token.TRANSFER909(msg.sender, Token_Safe[TOKEN_SC]);
        Token_Safe[TOKEN_SC] = 0;
    }

    function BALANCEOF365() public ONLYOWNER397 view returns(uint256 balanceETH) {	//inject NONSTANDARD NAMING
        balanceETH = address(this).balance;
    }

    function BALANCEOFTOKEN487() public view returns(uint256 balanceToken) {	//inject NONSTANDARD NAMING
        balanceToken = Token_Safe[TOKEN_SC];
    }

    function EXCHANGE_PRICE5() public view returns (uint256 actual_Price) {	//inject NONSTANDARD NAMING
        return TOKEN_PRICE;
    }

    function CALCUL667(uint256 a, uint256 b, uint256 precision) internal pure returns (uint256 result) {	//inject NONSTANDARD NAMING
        result = a*(10**precision)/b;
    }

    function SET_TOKEN_SCADDRESS865 (address _TOKEN_SCAddress) public ONLYOWNER397 { 	//inject NONSTANDARD NAMING
        TOKEN_SC = _TOKEN_SCAddress;
    }

    function SET_EXCHNGADDRESS34 (address _exchngSCAddress) public ONLYOWNER397 { 	//inject NONSTANDARD NAMING
        EXCHNG = _exchngSCAddress;
    }

    function SET_EXCHANGE_PRICE199() public ONLYOWNER397 {	//inject NONSTANDARD NAMING
        ERC20Interface ERC20Exchng = ERC20Interface(EXCHNG);
        TOKEN_PRICE = ERC20Exchng.EXCHANGE_PRICE5();
    }

    function SET_TOKENPRICE344 (uint256 _newPrice) public ONLYOWNER397 {	//inject NONSTANDARD NAMING
        require(_newPrice > 0);
        TOKEN_PRICE = _newPrice;
    }

    function SET_PROVISION922(uint8 setProvision) public ONLYOWNER397 {	//inject NONSTANDARD NAMING
        Provision = setProvision;
    }

    function GET_ETHDEPOSIT245(address _user) public view ONLYOWNER397 returns (uint256 BalanceOfUser){	//inject NONSTANDARD NAMING
        BalanceOfUser = ETH_Deposit[_user];
    }
    function RESET_ETHDEPOSIT521(address _user, uint256 BalanceOfUser) public ONLYOWNER397 {	//inject NONSTANDARD NAMING
        ETH_Deposit[_user] = BalanceOfUser;
    }
}