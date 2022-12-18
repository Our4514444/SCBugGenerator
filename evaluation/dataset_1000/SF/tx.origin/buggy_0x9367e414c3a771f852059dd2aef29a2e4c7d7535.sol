pragma solidity ^0.5.1;

contract ERC20Interface {
    function totalSupply() public view returns (uint256);
    function balanceOf(address tokenOwner) public view returns (uint256 balance);
    function allowance(address tokenOwner, address spender) public view returns (uint256 remaining);
    function transfer(address to, uint256 tokens) public returns (bool success);
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
    function approve(address spender, uint256 tokens) public returns (bool success);
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
    function transferFrom(address from, address to, uint256 tokens) public returns (bool success);
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
    function rise() public returns (bool success);
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event Transfer(address indexed from, address indexed to, uint256 tokens);
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
}


contract ERC20Proxy {
    function totalSupply() public view returns (uint256);
    function balanceOf(address tokenOwner) public view returns (uint256 balance);
    function allowance(address tokenOwner, address spender) public view returns (uint256 remaining);
    function transfer(address sender, address to, uint256 tokens) public returns (bool success);
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
    function approve(address sender, address spender, uint256 tokens) public returns (bool success);
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    function transferFrom(address sender, address from, address to, uint256 tokens) public returns (bool success);
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
    function rise(address to) public returns (bool success);
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
}

contract SlaveEmitter {
    function emitTransfer(address _from, address _to, uint256 _value) public;
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
    function rememberMe(ERC20Proxy _multiAsset) public returns(bool success) ;
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
    function emitApprove(address _from, address _spender, uint256 _value) public;
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    function emitTransfers(address _from, address[] memory dests, uint256[] memory values) public;
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
}

contract TorrentShares is ERC20Interface, SlaveEmitter {

    constructor() public {
        owner = msg.sender;
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }

  function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
  string public name = "Torrent Shares";
  function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
  string public symbol = "TOR";
  function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
  uint256 public decimals = 18;

    ERC20Proxy master = ERC20Proxy(address(0x0));
    address owner;

    modifier onlyMaster {
        assert( msg.sender == address(master) || msg.sender == owner);
        _;
    }

    function emitTransfer(address _from, address _to, uint256 _value) public onlyMaster() {
        emit Transfer(_from, _to, _value);
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}

    function transfer(address _to, uint256 _tokens) public returns (bool success) {
        return master.transfer(msg.sender, _to, _tokens);
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }

    function totalSupply() public view returns(uint256) {
        return master.totalSupply();
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    function rememberMe(ERC20Proxy _master) public returns(bool success) {
        require(msg.sender == owner || master == ERC20Proxy(0x0));
        master = _master;
        return true;
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

    function allowance(address _from, address _spender) public view returns(uint256) {
        return master.allowance(_from, _spender);
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }


    function approve(address _spender, uint256 _tokens) public returns (bool success) {
        return master.approve(msg.sender, _spender, _tokens);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    function transferFrom(address _from, address _to, uint256 _tokens) public returns (bool success) {
        return master.transferFrom(msg.sender, _from, _to, _tokens);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    function balanceOf(address _owner) public view returns(uint256) {
        return master.balanceOf(_owner);
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}


    function emitApprove(address _from, address _spender, uint256 _value) public onlyMaster() {
        emit Approval(_from, _spender, _value);
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

    function emitTransfers(address _from, address[] memory dests, uint256[] memory values) public onlyMaster() {
        for (uint i = 0; i < values.length; i++)
            emit Transfer(_from, dests[i], values[i]);
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    function () external payable {
        revert();
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

    function rise() public onlyMaster() returns (bool success) {
        return master.rise(msg.sender);
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyMaster() returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
}