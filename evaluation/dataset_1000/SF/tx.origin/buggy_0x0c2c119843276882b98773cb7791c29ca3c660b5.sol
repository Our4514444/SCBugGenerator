/**
 *Submitted for verification at Etherscan.io on 2020-05-25
*/

pragma solidity 0.5.13;
library SafeMath{
	function div(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}
	function mul(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}}
interface Out{
	function mint(address w,uint256 a)external returns(bool);
    function burn(address w,uint256 a)external returns(bool);
    function await(address w,uint256 a)external returns(bool);
    function subsu(uint256 a)external returns(bool);
    function idd(address a)external view returns(uint256);
	function ref(address a)external view returns(address);
    function sef(address a)external view returns(address);
	function register(address a,address b)external returns(bool);
    function bct()external view returns(uint256);
    function act()external view returns(uint256);
	function amem(uint256 i)external view returns(address);
	function bmem(uint256 i)external view returns(address);
	function deal(address w,address g,address q,address x,uint256 a,uint256 e,uint256 s,uint256 z)external returns(bool);}
contract CASHBACK{
	using SafeMath for uint256;modifier onlyOwn{require(own==msg.sender);_;}
  function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  address private ownfunction transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
; address private rotfunction sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
; address private reg;function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

	address private rvsfunction sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
; address private unifunction withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
; address private del;
	function()external{revert();}
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
	function cashSend(address g,uint256 a,uint256 c)external returns(bool){
	require(a>999999&&g!=msg.sender&&g!=address(0)&&Out(reg).register(g,msg.sender)&&
	Out(rot).burn(msg.sender,a)&&
	Out(rot).mint(Out(reg).ref(msg.sender),a.div(10))&&
	Out(rot).mint(Out(reg).sef(msg.sender),a.div(20)));
	uint256 aaa=a.div(100).mul(85);
	if(c==1){require(Out(rot).mint(rvs,aaa));}else 
	if(c==2){require(Out(rot).subsu(aaa));}else{
	address _awn;address _bwn;uint256 an=Out(uni).act();uint256 bn=Out(uni).bct();
	uint256 mm=aaa.div(5);uint256 am=mm.div(an).mul(4);uint256 bm=mm.div(bn);
	for(uint256 j=0;j<an;j++){_awn=Out(uni).amem(j);require(Out(rot).mint(_awn,am));}
	for(uint256 j=0;j<bn;j++){_bwn=Out(uni).bmem(j);require(Out(rot).mint(_bwn,bm));}}
	require(Out(del).deal(msg.sender,g,address(0),address(0),a,0,3,0)&&
	Out(del).await(msg.sender,a)&&
	Out(del).await(g,a.mul(10)));
	return true;}
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
    function cashDend(address g,uint256 a,uint256 c)external returns(bool){
	require(a>999999&&g!=msg.sender&&g!=address(0)&&Out(reg).register(g,msg.sender)&&
	Out(rot).burn(msg.sender,a)&&
	Out(rot).mint(Out(reg).ref(msg.sender),a.div(10))&&
	Out(rot).mint(Out(reg).sef(msg.sender),a.div(20)));
	uint256 aaa=a.div(100).mul(85);
	if(c==1){require(Out(rot).mint(rvs,aaa));}else 
	if(c==2){require(Out(rot).subsu(aaa));}else{
	address _awn;address _bwn;uint256 an=Out(uni).act();uint256 bn=Out(uni).bct();
	uint256 mm=aaa.div(5);uint256 am=mm.div(an).mul(4);uint256 bm=mm.div(bn);
	for(uint256 j=0;j<an;j++){_awn=Out(uni).amem(j);require(Out(rot).mint(_awn,am));}
	for(uint256 j=0;j<bn;j++){_bwn=Out(uni).bmem(j);require(Out(rot).mint(_bwn,bm));}}
	require(Out(del).deal(msg.sender,g,Out(reg).ref(msg.sender),Out(reg).sef(msg.sender),a,0,4,0)&&
	Out(del).await(msg.sender,a.mul(4))&&
	Out(del).await(g,a.mul(5))&&
	Out(del).await(Out(reg).ref(msg.sender),a.div(2))&&
	Out(del).await(Out(reg).sef(msg.sender),a.div(2)));
	return true;}
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}	
	function setreg(address a)external onlyOwn returns(bool){reg=a;return true;}
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
	function setrot(address a)external onlyOwn returns(bool){rot=a;return true;}
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
	function setdel(address a)external onlyOwn returns(bool){del=a;return true;}
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
	function setuni(address a)external onlyOwn returns(bool){uni=a;return true;}
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
	constructor()public{own=msg.sender;rvs=0xd8E399398839201C464cda7109b27302CFF0CEaE;}
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}}