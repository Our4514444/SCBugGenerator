pragma solidity ^0.5.8;

contract ERC20_Coin{
    
    string public name;//11
    string public symbol;//11
    uint8 public decimals = 18;//1111111
    uint256 public totalSupply;//1111
    address internal admin;//111
    mapping (address => uint256) internal balanceOf;//1111
    bool internal isAct = true;//111111
    bool internal openRaise = false;//11111111
    uint256 internal raisePrice = 0;//111111
    address payable internal finance;//1111
    
    //1111
	event Transfer(address indexed from, address indexed to, uint256 value);
	//111111
	event SendEth(address indexed to, uint256 value);
    
    constructor(
        uint256 initialSupply,//111
        string memory tokenName,//11
        string memory tokenSymbol//11
     ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
        finance = msg.sender;
        admin = msg.sender;
    }

    // 111111111
    modifier onlyAdmin() { 
        require(msg.sender == admin);
        _;
    }

    // 1111111111
    modifier isActivity() { 
        require(isAct);
        _;
    }

    // 1111111111
    modifier isOpenRaise() { 
        require(openRaise);
        _;
    }

    //1111111111111111111ETH
    function () external payable isActivity isOpenRaise{
		require(raisePrice >= 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		uint256 buyNum = msg.value /10000 * raisePrice;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		require(buyNum <= balanceOf[finance]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		balanceOf[finance] -= buyNum;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		balanceOf[msg.sender] += buyNum;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        finance.transfer(msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit SendEth(finance, msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(finance, msg.sender, buyNum);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
    
    //111111111111111
    //111111111111111imtoken1MetaMask
    function transfer(address _to, uint256 _value) public isActivity{
	    _transfer(msg.sender, _to, _value);
    }
    
    //111111111
    function transferList(address[] memory _tos, uint[] memory _values) public isActivity {
        require(_tos.length == _values.length);
        uint256 _total = 0;
        for(uint256 i;i<_values.length;i++){
            _total += _values[i];
	    }
        require(balanceOf[msg.sender]>=_total);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        for(uint256 i;i<_tos.length;i++){
            _transfer(msg.sender,_tos[i],_values[i]);
	    }
    }
    
    //111111
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
	
    //11111111111
	function setRaisePrice(uint256 _price)public onlyAdmin{
		raisePrice = _price;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
	
    //111111111111111111
	function setOpenRaise(bool _open) public onlyAdmin{
	    openRaise = _open;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
	
    //1111111111111
	function setActivity(bool _isAct) public onlyAdmin{
		isAct = _isAct;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
	
    //1111111
	function setAdmin(address _address) public onlyAdmin{
       admin = _address;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    //1111111
    function setMagage(address payable _address) public onlyAdmin{
       finance = _address;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
	
    //1111
	function killYourself()public onlyAdmin{
		selfdestruct(finance);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
	
}