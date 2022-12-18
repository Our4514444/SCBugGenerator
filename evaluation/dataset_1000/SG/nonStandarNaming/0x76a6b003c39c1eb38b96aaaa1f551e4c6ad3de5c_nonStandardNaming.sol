pragma solidity ^0.5.8;

contract ERC20_Coin{
    
    string public name;//11
    string public symbol;//11
    uint8 public decimals = 18;//1111111
    uint256 public totalSupply;//1111
    address internal admin;//111
    mapping (address => uint256) public balanceOf;//1111
    bool public isAct = true;//111111
    bool public openRaise = false;//11111111
    uint256 public raisePrice = 0;//111111
    address payable internal finance;//1111
    
    //1111
	event TRANSFER746(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
	//111111
	event SENDETH366(address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    
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
    modifier ONLYADMIN629() { 	//inject NONSTANDARD NAMING
        require(msg.sender == admin);
        _;
    }

    // 1111111111
    modifier ISACTIVITY455() { 	//inject NONSTANDARD NAMING
        require(isAct);
        _;
    }

    // 1111111111
    modifier ISOPENRAISE264() { 	//inject NONSTANDARD NAMING
        require(openRaise);
        _;
    }

    //1111111111111111111ETH
    function () external payable ISACTIVITY455 ISOPENRAISE264{
		require(raisePrice >= 0);
		uint256 buyNum = msg.value /10000 * raisePrice;
		require(buyNum <= balanceOf[finance]);
		balanceOf[finance] -= buyNum;
		balanceOf[msg.sender] += buyNum;
        finance.transfer(msg.value);
        emit SENDETH366(finance, msg.value);
        emit TRANSFER746(finance, msg.sender, buyNum);
	}
    
    //111111111111111
    //111111111111111imtoken1MetaMask
    function TRANSFER576(address _to, uint256 _value) public ISACTIVITY455{	//inject NONSTANDARD NAMING
	    _TRANSFER923(msg.sender, _to, _value);
    }
    
    //111111111
    function TRANSFERLIST461(address[] memory _tos, uint[] memory _values) public ISACTIVITY455 {	//inject NONSTANDARD NAMING
        require(_tos.length == _values.length);
        uint256 _total = 0;
        for(uint256 i;i<_values.length;i++){
            _total += _values[i];
	    }
        require(balanceOf[msg.sender]>=_total);
        for(uint256 i;i<_tos.length;i++){
            _TRANSFER923(msg.sender,_tos[i],_values[i]);
	    }
    }
    
    //111111
    function _TRANSFER923(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit TRANSFER746(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
	
    //11111111111
	function SETRAISEPRICE138(uint256 _price)public ONLYADMIN629{	//inject NONSTANDARD NAMING
		raisePrice = _price;
	}
	
    //111111111111111111
	function SETOPENRAISE223(bool _open) public ONLYADMIN629{	//inject NONSTANDARD NAMING
	    openRaise = _open;
	}
	
    //1111111111111
	function SETACTIVITY774(bool _isAct) public ONLYADMIN629{	//inject NONSTANDARD NAMING
		isAct = _isAct;
	}
	
    //1111111
	function SETADMIN421(address _address) public ONLYADMIN629{	//inject NONSTANDARD NAMING
       admin = _address;
    }
    
    //1111111
    function SETMAGAGE864(address payable _address) public ONLYADMIN629{	//inject NONSTANDARD NAMING
       finance = _address;
    }
	
    //1111
	function KILLYOURSELF584()public ONLYADMIN629{	//inject NONSTANDARD NAMING
		selfdestruct(finance);
	}
	
}