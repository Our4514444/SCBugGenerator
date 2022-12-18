                                                                 

pragma solidity 0.5.13;
library SafeMath{
    function ADD5(uint256 a,uint256 b)internal pure returns(uint256){uint256 c=a+b;require(c>=a);return c;}	//inject NONSTANDARD NAMING
	function SUB561(uint256 a,uint256 b)internal pure returns(uint256){require(b<=a);uint256 c=a-b;return c;}	//inject NONSTANDARD NAMING
	function DIV420(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}	//inject NONSTANDARD NAMING
	function MUL743(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}}	//inject NONSTANDARD NAMING
interface Out{
    function AAD600(uint256 n)external view returns(address);function BAD438(uint256 n)external view returns(address);	//inject NONSTANDARD NAMING
	function CAD811(uint256 n)external view returns(address);function DAD557(uint256 n)external view returns(address);	//inject NONSTANDARD NAMING
	function AAM727(uint256 n)external view returns(uint256);function SRS750(uint256 n)external view returns(uint256);	//inject NONSTANDARD NAMING
	function ARW621(uint256 n)external view returns(uint256);function BRW78(uint256 n)external view returns(uint256);	//inject NONSTANDARD NAMING
	function CRW371(uint256 n)external view returns(uint256);function DRW381(uint256 n)external view returns(uint256);	//inject NONSTANDARD NAMING
    function AFIN891(uint256 n)external returns(bool);function BFIN783(uint256 n)external returns(bool);	//inject NONSTANDARD NAMING
	function CFIN661(uint256 n)external returns(bool);function DFIN403(uint256 n)external returns(bool);	//inject NONSTANDARD NAMING
	function DAY980()external view returns(uint256);	//inject NONSTANDARD NAMING
	function MINT21(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function SWAIT681(address w,uint256 n)external returns(bool);	//inject NONSTANDARD NAMING
	function MINED98(address w,uint256 n)external returns(bool);}	//inject NONSTANDARD NAMING
contract MINING{	
    using SafeMath for uint256; modifier ONLYOWN13{require(own==msg.sender);_;}	//inject NONSTANDARD NAMING
    address private del; address private rot; address private own;
    function MINING541(uint256 n)external returns(bool){	//inject NONSTANDARD NAMING
		address dd = msg.sender;uint256 sr=Out(del).SRS750(n);uint256 aa=Out(del).AAM727(n);
		uint256 a; uint256 r=0; uint256 mt=0;
		if(sr==2){if(dd==Out(del).AAD600(n)){r=Out(del).ARW621(n);a=aa;}else
		if(dd==Out(del).BAD438(n)){r=Out(del).BRW78(n);a=aa.DIV420(5).MUL743(4);}else
		if(dd==Out(del).CAD811(n)){r=Out(del).CRW371(n);a=a.ADD5(aa.DIV420(10));}else
		if(dd==Out(del).DAD557(n)){r=Out(del).DRW381(n);a=a.ADD5(aa.DIV420(10));}else{r=0;}}else
		if(sr==1){if(dd==Out(del).AAD600(n)){r=Out(del).ARW621(n);a=aa.DIV420(100).MUL743(172);}else
		if(dd==Out(del).BAD438(n)){r=Out(del).BRW78(n);a=aa.DIV420(5).MUL743(8);}else
		if(dd==Out(del).CAD811(n)){r=Out(del).CRW371(n);a=a.ADD5(aa.DIV420(100).MUL743(18));}else
		if(dd==Out(del).DAD557(n)){r=Out(del).DRW381(n);a=a.ADD5(aa.DIV420(10));}else{r=0;}}else
		if(sr==0){if(dd==Out(del).AAD600(n)){ r=Out(del).ARW621(n);a=aa.MUL743(9);}
		if(dd==Out(del).CAD811(n)){ r=Out(del).CRW371(n);a=a.ADD5(aa.DIV420(2));}
		if(dd==Out(del).DAD557(n)){ r=Out(del).DRW381(n);a=a.ADD5(aa.DIV420(2));}else{r=0;}}
		require(r>0); uint256 t=Out(del).DAY980().SUB561(r); if(t<73){mt=t;}else
		if(t<146){mt=73;mt=mt.ADD5((t.SUB561(73)).MUL743(3));}else
		if(t<219){mt=292;mt=mt.ADD5((t.SUB561(146)).MUL743(9));}else
		if(t<292){mt=949;mt=mt.ADD5((t.SUB561(219)).MUL743(27));}else
		if(t<365){mt=2920;mt=mt.ADD5((t.SUB561(292)).MUL743(81));}else{mt=8833;}
		if(mt==8833){mt=a;}else{ mt=(a.MUL743(mt)).DIV420(8833);}
		require(mt>0&&Out(rot).MINT21(dd,mt)&&Out(del).MINED98(dd,mt)&&Out(del).SWAIT681(dd,a));
		if(dd==Out(del).AAD600(n)){require(Out(del).AFIN891(n));}
		if(dd==Out(del).BAD438(n)){require(Out(del).BFIN783(n));}
		if(dd==Out(del).CAD811(n)){require(Out(del).CFIN661(n));}
		if(dd==Out(del).DAD557(n)){require(Out(del).DFIN403(n));}return true;}
	function SETROT827(address a)external ONLYOWN13 returns(bool){rot=a;return true;}	//inject NONSTANDARD NAMING
    function SETDEL496(address a)external ONLYOWN13 returns(bool){del=a;return true;}	//inject NONSTANDARD NAMING
    function()external{revert();}
    constructor()public{own=msg.sender;}}