pragma solidity >= 0.5.4 ;

library SafeMath {
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

  
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
       
        require(b > 0);
        uint256 c = a / b;

        return c;
    }

    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}


interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes calldata _extraData) external; }


contract Ownable {
    address private _owner;

  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

    
    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

   
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

   
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

   
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
}



contract Pausable is Ownable{
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event Paused(address account);
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event Unpaused(address account);

    bool private _paused;

    constructor () internal {
        _paused = false;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    
    function paused() public view returns (bool) {
        return _paused;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    
    modifier whenNotPaused() {
        require(!_paused);
        _;
    }

   
    modifier whenPaused() {
        require(_paused);
        _;
    }

    
    function pause() public onlyOwner whenNotPaused {
        _paused = true;
        emit Paused(msg.sender);
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    
    function unpause() public onlyOwner whenPaused {
        _paused = false;
        emit Unpaused(msg.sender);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
}


contract TokenERC20{
    using SafeMath for uint256;

    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) public allowance;

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
    
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Burn(address indexed from, uint256 value);

    
    constructor(uint256 initialSupply,string memory tokenName,string memory tokenSymbol) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  
        balanceOf[msg.sender] = totalSupply;                
        name = tokenName;                                  
        symbol = tokenSymbol;                              
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    
    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != address(0x0));

        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);

        emit Transfer(_from, _to, _value);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

   
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
        _transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

   
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

   
    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData)
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, address(this), _extraData);
            return true;
        }
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

   
    function burn(uint256 _value) public returns (bool success) {
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);             
        totalSupply = totalSupply.sub(_value);                                 
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        balanceOf[_from] = balanceOf[_from].sub(_value);                                        
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);                
        totalSupply = totalSupply.sub(_value);                                                  
        emit Burn(_from, _value);
        return true;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

}


contract FuteToken is TokenERC20, Ownable,Pausable{

  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public frozenAccount;

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event FrozenFunds(address target, bool frozen);

    constructor() TokenERC20(500000000,"Fute Token","FUTE") public {
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    function freezeAccount(address account, bool freeze) onlyOwner public {
        frozenAccount[account] = freeze;
        emit FrozenFunds(account, freeze);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function changeName(string memory newName) public onlyOwner {
        name = newName;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function changeSymbol(string memory newSymbol) public onlyOwner{
        symbol = newSymbol;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    
    function _transfer(address _from, address _to, uint _value) internal whenNotPaused {
        require(_to != address(0x0));

        require(!frozenAccount[_from]);
        require(!frozenAccount[_to]);

        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);

        emit Transfer(_from, _to, _value);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}