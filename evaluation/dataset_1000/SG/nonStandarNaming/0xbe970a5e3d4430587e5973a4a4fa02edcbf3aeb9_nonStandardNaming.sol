                                                                 

pragma solidity ^0.5.13;
library SafeMath{
    function ADD482(uint256 a,uint256 b)internal pure returns(uint256){uint256 c=a+b; require(c>=a); return c;}	//inject NONSTANDARD NAMING
	function SUB407(uint256 a,uint256 b)internal pure returns(uint256){require(b<=a);uint256 c=a-b;return c;}	//inject NONSTANDARD NAMING
	function MUL795(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}	//inject NONSTANDARD NAMING
	function DIV12(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}}	//inject NONSTANDARD NAMING
interface Out{
	function MINT835(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function BURN821(address w,uint256 a)external returns(bool);}		//inject NONSTANDARD NAMING
contract UNESCROW{
	using SafeMath for uint256;
	address private rot=0x45F2aB0ca2116b2e1a70BF5e13293947b25d0272;
	mapping(address => uint256) private price;
	mapping(address => uint256) private frozen;
	function TOPAYABLE533(address a)internal pure returns(address payable){return address(uint160(a));}	//inject NONSTANDARD NAMING
	function SETUESCROW987(uint256 p)external payable returns(bool){	//inject NONSTANDARD NAMING
	   require(p>=10**15 && msg.value>=10**16);price[msg.sender]=p;
	   frozen[msg.sender]=frozen[msg.sender].ADD482(msg.value);return true;}
	function DELUESCROW46()external returns(bool){	//inject NONSTANDARD NAMING
	   uint256 e=frozen[msg.sender];require(e>0);frozen[msg.sender]=0;price[msg.sender]=0;
	   TOPAYABLE533(msg.sender).transfer(e);return true;}
	function PAYUESCROW774(address payable w, uint256 a)external returns(bool){	//inject NONSTANDARD NAMING
	   uint256 e=(a.MUL795(price[w])).DIV12(10**18);require(e<=frozen[w]);frozen[w]=frozen[w].SUB407(e);
	   require(Out(rot).BURN821(msg.sender,a));require(Out(rot).MINT835(w,a));
	   TOPAYABLE533(msg.sender).transfer(e);return true;}
	function GEUINFO488(address n)external view returns(uint256,uint256){return(price[n],frozen[n]);}	//inject NONSTANDARD NAMING
   	function()external{revert();}}