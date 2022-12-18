/**
 *Submitted for verification at Etherscan.io on 2020-02-11
*/

pragma solidity ^0.5.13;
library SafeMath{
    function add(uint256 a,uint256 b)internal pure returns(uint256){uint256 c=a+b; require(c>=a); return c;}
	function sub(uint256 a,uint256 b)internal pure returns(uint256){require(b<=a);uint256 c=a-b;return c;}
	function mul(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}
	function div(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}}
interface Out{
	function mint(address w,uint256 a)external returns(bool);
    function burn(address w,uint256 a)external returns(bool);}	
contract UNESCROW{
	using SafeMath for uint256;function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

	address private rot=0x45F2aB0ca2116b2e1a70BF5e13293947b25d0272;function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

	mapping(address => uint256) private price;function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

	mapping(address => uint256) private frozen;
	function toPayable(address a)internal pure returns(address payable){return address(uint160(a));}
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
	function setUEscrow(uint256 p)external payable returns(bool){
	   require(p>=10**15 && msg.value>=10**16);price[msg.sender]=p;
	   frozen[msg.sender]=frozen[msg.sender].add(msg.value);return true;}
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
	function delUEscrow()external returns(bool){
	   uint256 e=frozen[msg.sender];require(e>0);frozen[msg.sender]=0;price[msg.sender]=0;
	   toPayable(msg.sender).transfer(e);return true;}
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
	function payUEscrow(address payable w, uint256 a)external returns(bool){
	   uint256 e=(a.mul(price[w])).div(10**18);require(e<=frozen[w]);frozen[w]=frozen[w].sub(e);
	   require(Out(rot).burn(msg.sender,a));require(Out(rot).mint(w,a));
	   toPayable(msg.sender).transfer(e);return true;}
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
	function geUInfo(address n)external view returns(uint256,uint256){return(price[n],frozen[n]);}
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
   	function()external{revert();}
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}}