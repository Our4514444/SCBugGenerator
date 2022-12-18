pragma solidity ^0.5.2;

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
  function totalSupply() public view returns (uint256);

  function balanceOf(address _who) public view returns (uint256);

  function allowance(address _owner, address _spender)
    public view returns (uint256);

  function transfer(address _to, uint256 _value) public returns (bool);

  function approve(address _spender, uint256 _value)
    public returns (bool);

  function transferFrom(address _from, address _to, uint256 _value)
    public returns (bool);

  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract _0xLTC_Sale {

    using SafeMath for uint256;
    address owner;
    address selfdroptoken;
    address[] internal hugeetherinvest;

    mapping (address => bool) public blacklist;

    uint256 internal rate = 0;
    uint256 internal totalRemaining;
    uint256 internal selfdropvalue;

    event Distr(address indexed to, uint256 amount);
    event DistrFinished();
    event crowdsaleFinishedd();

    bool internal distributionFinished;
    bool internal crowdsaleFinished;
    
    modifier canDistr() {
        require(!distributionFinished);
        _;
    }
    modifier canDistrCS() {
        require(!crowdsaleFinished);
        _;
    }
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlynotblacklist() {
        require(blacklist[msg.sender] == false);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    function setselfdroptoken(address _selfdroptoken) public onlyOwner {
        require (_selfdroptoken != address(0));
        selfdroptoken = _selfdroptoken;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalRemaining = ERC20(selfdroptoken).balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    } 
    function transferOwnership(address newOwner) onlyOwner public {
        if (newOwner != address(0)) {
            owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }
    function startsale() onlyOwner public returns (bool) {
        distributionFinished = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }
    function startcrowdsale() onlyOwner public returns (bool) {
        crowdsaleFinished = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }
    function finishselfdrop() onlyOwner canDistr public returns (bool) {
        distributionFinished = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit DistrFinished();
        return true;
    }
    function finishcrowdsale() onlyOwner canDistrCS public returns (bool) {
        crowdsaleFinished = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit crowdsaleFinishedd();
        return true;
    }
    
    function distr(address _to, uint256 _amount) private returns (bool) {

        totalRemaining = totalRemaining.sub(_amount);
        ERC20(selfdroptoken).transfer(_to,_amount);
        emit Distr(_to, _amount);
        return true;
        
        if (totalRemaining == 0) {
            distributionFinished = true;
            crowdsaleFinished = true;
        }
    }
    function setselfdropvalue(uint256 _value) public onlyOwner {
        selfdropvalue = _value.mul(1e18);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function () external payable{
        if(msg.value == 0){getTokenss();}else{getTokens();}         
    }
    function getTokenss() canDistr onlynotblacklist internal {
        
        require (selfdropvalue != 0);
        
        if (selfdropvalue > totalRemaining) {
            selfdropvalue = totalRemaining;
        }
        
        require(selfdropvalue <= totalRemaining);
        
        address investor = msg.sender;
        uint256 toGive = selfdropvalue;
        
        distr(investor, toGive);
        
        if (toGive > 0) {
            blacklist[investor] = true;
        }
    }
    
    function setethrate(uint _rate) onlyOwner public {
        rate = _rate;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function getTokens() canDistrCS public payable {
        
        require(msg.value >= 0.001 ether);
        require(rate > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint256 value = msg.value.mul(rate);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        require(totalRemaining >= value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        address investor = msg.sender;
        uint256 toGive = value;
        
        distr(investor, toGive);
        
        if(msg.value >= 0.1 ether){
            hugeetherinvest.push(msg.sender);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }
    function withdrawfromcontract() public onlyOwner {
        ERC20(selfdroptoken).transfer(owner,ERC20(selfdroptoken).balanceOf(address(this)));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    function withdraw() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
}