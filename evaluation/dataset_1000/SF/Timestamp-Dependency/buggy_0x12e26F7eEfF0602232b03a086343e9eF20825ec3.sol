/**
 *Submitted for verification at Etherscan.io on 2020-10-29
*/

pragma solidity 0.5.16;

interface ERC20Interface {
    function balanceOf(address owner)  external view returns(uint256 balance);
    function transfer(address to, uint value) external returns(bool success);
    function transferFrom(address _from, address _to, uint256 value)  external returns(bool success);
    function Exchange_Price() external view returns(uint256 actual_Price);
}

contract WBCATM {

  function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public _owner;
  address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  address public TOKEN_SC;
  function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public EXCHNG;
    
  address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  uint8 public Provision;
  function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public TOKEN_PRICE;

  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping ( address => uint256 ) public Token_Safe;
  function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping ( address => uint256 ) public ETH_Deposit;

  uint256 bugv_tmstmp5 = block.timestamp;
  event Deposit(address user, uint256 amountETH);
  uint256 bugv_tmstmp2 = block.timestamp;
  event Exchange(address buyer, uint256 amount, uint paid, uint provision);
  uint256 bugv_tmstmp3 = block.timestamp;
  event withdrawBalance(address user, uint256 balanceETH );
  uint256 bugv_tmstmp1 = block.timestamp;
  event calculatedAmount(uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == _owner, "only Owner");
        _;
    }
uint256 bugv_tmstmp4 = block.timestamp;

   constructor() public {
        _owner = msg.sender;
        TOKEN_SC = 0x79C90021A36250BcE01f11CFd847Ba30E05488B1;
        TOKEN_PRICE = 0.001 ether;
        Provision = 10;
   }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

    function () external payable {
        require(msg.value > 0);
        ETH_Deposit[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function deposit(uint256 amount) payable public {
        require(msg.value == amount);
        require(amount > 0);
        ETH_Deposit[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    function exchangeToken2ETH(uint256 _amountWei) payable public {  
        require(_amountWei > 0,"Value must more then 0 !");
        ERC20Interface ERC20Token = ERC20Interface(TOKEN_SC);
        ERC20Token.transferFrom(msg.sender, address(this), _amountWei);

        Token_Safe[TOKEN_SC] = Token_Safe[TOKEN_SC] + _amountWei ;
        
        uint256 Prov = ((_amountWei* TOKEN_PRICE)/(10**18)) * Provision / 100 ;
        uint256 amountWeiETH = ((_amountWei * TOKEN_PRICE)/(10**18)) - Prov ;
        msg.sender.transfer(amountWeiETH);
        emit Exchange ( msg.sender, _amountWei, amountWeiETH, Prov);
    }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function withdrawETH(uint256 amountWeiETH) public payable onlyOwner {
        require(amountWeiETH > 0,"Value must more then 0 !");
        uint256 balanceETH;
        balanceETH = address(this).balance;
        require(balanceETH >= amountWeiETH);
        address(uint160(msg.sender)).transfer(amountWeiETH);
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    function withdrawQPON() public onlyOwner {
        require(Token_Safe[TOKEN_SC] > 0,"Token Safe is empty !");
        ERC20Interface ERC20Token = ERC20Interface(TOKEN_SC);
        ERC20Token.transfer(msg.sender, Token_Safe[TOKEN_SC]);
        Token_Safe[TOKEN_SC] = 0;
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function balanceOf() public onlyOwner view returns(uint256 balanceETH) {
        balanceETH = address(this).balance;
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function balanceOfToken() public view returns(uint256 balanceToken) {
        balanceToken = Token_Safe[TOKEN_SC];
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function Exchange_Price() public view returns (uint256 actual_Price) {
        return TOKEN_PRICE;
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function calcul(uint256 a, uint256 b, uint256 precision) internal pure returns (uint256 result) {
        result = a*(10**precision)/b;
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    function set_TOKEN_SCAddress (address _TOKEN_SCAddress) public onlyOwner { 
        TOKEN_SC = _TOKEN_SCAddress;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    function set_EXCHNGAddress (address _exchngSCAddress) public onlyOwner { 
        EXCHNG = _exchngSCAddress;
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    function set_Exchange_Price() public onlyOwner {
        ERC20Interface ERC20Exchng = ERC20Interface(EXCHNG);
        TOKEN_PRICE = ERC20Exchng.Exchange_Price();
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function set_TokenPrice (uint256 _newPrice) public onlyOwner {
        require(_newPrice > 0);
        TOKEN_PRICE = _newPrice;
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

    function set_Provision(uint8 setProvision) public onlyOwner {
        Provision = setProvision;
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

    function get_ETHDeposit(address _user) public view onlyOwner returns (uint256 BalanceOfUser){
        BalanceOfUser = ETH_Deposit[_user];
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function reset_ETHDeposit(address _user, uint256 BalanceOfUser) public onlyOwner {
        ETH_Deposit[_user] = BalanceOfUser;
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}