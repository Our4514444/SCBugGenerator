pragma solidity ^0.5.8;

contract ERC20_Coin{
    
  address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  string public name;//名称
  function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  string public symbol;//缩写
  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint8 public decimals = 18;//精确的小数位数
  function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint256 public totalSupply;//总发行量
  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  address internal admin;//管理员
  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (address => uint256) public balanceOf;//客户群体
  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  bool public isAct = true;//合约活动标记
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  bool public openRaise = false;//开启募集资金功能
  address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
  uint256 public raisePrice = 0;//募集兑换比例
  function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address payable internal finance;//财务管理
    
    //转账通知uint256 bugv_tmstmp3 = block.timestamp;

	event Transfer(address indexed from, address indexed to, uint256 value);
	//以太转出通知uint256 bugv_tmstmp1 = block.timestamp;

	event SendEth(address indexed to, uint256 value);
    
    constructor(
        uint256 initialSupply,//发行量
        string memory tokenName,//名称
        string memory tokenSymbol//缩写
     ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
        finance = msg.sender;
        admin = msg.sender;
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

    // 只有管理员能调用的
    modifier onlyAdmin() { 
        require(msg.sender == admin);
        _;
    }
uint256 bugv_tmstmp4 = block.timestamp;

    // 判断合约是否暂停服务
    modifier isActivity() { 
        require(isAct);
        _;
    }
uint256 bugv_tmstmp5 = block.timestamp;

    // 是否处于募集资金状态
    modifier isOpenRaise() { 
        require(openRaise);
        _;
    }
uint256 bugv_tmstmp2 = block.timestamp;

    //只有在活动中并且开启了募集标记才会接收ETH
    function () external payable isActivity isOpenRaise{
		require(raisePrice >= 0);
		uint256 buyNum = msg.value /10000 * raisePrice;
		require(buyNum <= balanceOf[finance]);
		balanceOf[finance] -= buyNum;
		balanceOf[msg.sender] += buyNum;
        finance.transfer(msg.value);
        emit SendEth(finance, msg.value);
        emit Transfer(finance, msg.sender, buyNum);
	}
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    //普通的转账功能，只判断活动状态
    //可以在各种第三方钱包调用，如：imtoken、MetaMask
    function transfer(address _to, uint256 _value) public isActivity{
	    _transfer(msg.sender, _to, _value);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    
    //出纳转账，批量操作
    function transferList(address[] memory _tos, uint[] memory _values) public isActivity {
        require(_tos.length == _values.length);
        uint256 _total = 0;
        for(uint256 i;i<_values.length;i++){
            _total += _values[i];
	    }
        require(balanceOf[msg.sender]>=_total);
        for(uint256 i;i<_tos.length;i++){
            _transfer(msg.sender,_tos[i],_values[i]);
	    }
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
    
    //内部转账封装
    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != address(0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
	
    //设置募集资金的兑换比例
	function setRaisePrice(uint256 _price)public onlyAdmin{
		raisePrice = _price;
	}
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
	
    //开启募集通道，做预留，默认都是关闭的
	function setOpenRaise(bool _open) public onlyAdmin{
	    openRaise = _open;
	}
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
    //设置活动状态，处理应急状况
	function setActivity(bool _isAct) public onlyAdmin{
		isAct = _isAct;
	}
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
	
    //转让管理员权限
	function setAdmin(address _address) public onlyAdmin{
       admin = _address;
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    
    //设置资金管理员
    function setMagage(address payable _address) public onlyAdmin{
       finance = _address;
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
    //销毁合约
	function killYourself()public onlyAdmin{
		selfdestruct(finance);
	}
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
}