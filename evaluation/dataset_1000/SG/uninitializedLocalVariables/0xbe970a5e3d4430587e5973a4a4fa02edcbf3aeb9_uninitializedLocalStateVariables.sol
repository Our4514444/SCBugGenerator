/**
 *Submitted for verification at Etherscan.io on 2020-02-11
*/

pragma solidity ^0.5.13;
library SafeMath{
    function add(uint256 a,uint256 b)internal pure returns(uint256){uint256 c; require(c>=a); return c;}	//inject UNINIT LOCAL/STATE VAR

	function sub(uint256 a,uint256 b)internal pure returns(uint256){require(b<=a);uint256 c;return c;}	//inject UNINIT LOCAL/STATE VAR

	function mul(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c;require(c/a==b);return c;}	//inject UNINIT LOCAL/STATE VAR

	function div(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c;return c;}}	//inject UNINIT LOCAL/STATE VAR

interface Out{
	function mint(address w,uint256 a)external returns(bool);
    function burn(address w,uint256 a)external returns(bool);}	
contract UNESCROW{
	using SafeMath for uint256;
	address private rot;	//inject UNINIT LOCAL/STATE VAR

	mapping(address => uint256) private price;
	mapping(address => uint256) private frozen;
	function toPayable(address a)internal pure returns(address payable){return address(uint160(a));}
	function setUEscrow(uint256 p)external payable returns(bool){
	   require(p>=10**15 && msg.value>=10**16);price[msg.sender]=p;
	   frozen[msg.sender]=frozen[msg.sender].add(msg.value);return true;}
	function delUEscrow()external returns(bool){
	   uint256 e;require(e>0);frozen[msg.sender]=0;price[msg.sender]=0;	//inject UNINIT LOCAL/STATE VAR

	   toPayable(msg.sender).transfer(e);return true;}
	function payUEscrow(address payable w, uint256 a)external returns(bool){
	   uint256 e;require(e<=frozen[w]);frozen[w]=frozen[w].sub(e);	//inject UNINIT LOCAL/STATE VAR

	   require(Out(rot).burn(msg.sender,a));require(Out(rot).mint(w,a));
	   toPayable(msg.sender).transfer(e);return true;}
	function geUInfo(address n)external view returns(uint256,uint256){return(price[n],frozen[n]);}
   	function()external{revert();}}