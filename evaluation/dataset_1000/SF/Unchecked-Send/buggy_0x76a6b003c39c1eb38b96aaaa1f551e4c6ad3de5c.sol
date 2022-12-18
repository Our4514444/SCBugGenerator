pragma solidity ^0.5.8;

contract ERC20_Coin{
    
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  string public name;//名称
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;//缩写
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals = 18;//精确的小数位数
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;//总发行量
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  address internal admin;//管理员
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balanceOf;//客户群体
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  bool public isAct = true;//合约活动标记
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  bool public openRaise = false;//开启募集资金功能
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public raisePrice = 0;//募集兑换比例
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  address payable internal finance;//财务管理
    
    //转账通知function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

	event Transfer(address indexed from, address indexed to, uint256 value);
	//以太转出通知function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    // 只有管理员能调用的
    modifier onlyAdmin() { 
        require(msg.sender == admin);
        _;
    }

    // 判断合约是否暂停服务
    modifier isActivity() { 
        require(isAct);
        _;
    }

    // 是否处于募集资金状态
    modifier isOpenRaise() { 
        require(openRaise);
        _;
    }

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
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    
    //普通的转账功能，只判断活动状态
    //可以在各种第三方钱包调用，如：imtoken、MetaMask
    function transfer(address _to, uint256 _value) public isActivity{
	    _transfer(msg.sender, _to, _value);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    
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
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    
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
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
	
    //设置募集资金的兑换比例
	function setRaisePrice(uint256 _price)public onlyAdmin{
		raisePrice = _price;
	}
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
	
    //开启募集通道，做预留，默认都是关闭的
	function setOpenRaise(bool _open) public onlyAdmin{
	    openRaise = _open;
	}
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
	
    //设置活动状态，处理应急状况
	function setActivity(bool _isAct) public onlyAdmin{
		isAct = _isAct;
	}
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
	
    //转让管理员权限
	function setAdmin(address _address) public onlyAdmin{
       admin = _address;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    //设置资金管理员
    function setMagage(address payable _address) public onlyAdmin{
       finance = _address;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
	
    //销毁合约
	function killYourself()public onlyAdmin{
		selfdestruct(finance);
	}
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
	
}