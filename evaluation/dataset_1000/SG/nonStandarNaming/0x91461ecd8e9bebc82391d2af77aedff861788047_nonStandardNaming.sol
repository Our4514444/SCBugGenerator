                                                                 

pragma solidity 0.5.13;
library SafeMath{
	function DIV384(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}	//inject NONSTANDARD NAMING
	function MUL536(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}}	//inject NONSTANDARD NAMING
interface Out{
	function MINT273(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
	function BONUS532(address w,uint256 a)external returns(bool);		//inject NONSTANDARD NAMING
    function BURN379(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function AWAIT452(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function SUBSU621(uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
	function REF230(address a)external view returns(address);	//inject NONSTANDARD NAMING
    function SEF932(address a)external view returns(address);	//inject NONSTANDARD NAMING
	function REGISTER346(address a,address b)external returns(bool);	//inject NONSTANDARD NAMING
    function BCT660()external view returns(uint256);	//inject NONSTANDARD NAMING
    function ACT950()external view returns(uint256);	//inject NONSTANDARD NAMING
	function AMEM433(uint256 i)external view returns(address);	//inject NONSTANDARD NAMING
	function BMEM823(uint256 i)external view returns(address);	//inject NONSTANDARD NAMING
	function DEAL34(address w,address g,address q,address x,uint256 a,uint256 e,uint256 s,uint256 z)external returns(bool);}	//inject NONSTANDARD NAMING
contract TO_MINE{
	using SafeMath for uint256;modifier ONLYOWN838{require(own==msg.sender);_;}	//inject NONSTANDARD NAMING
    address private own; address private rot; address private reg;
	address private rvs; address private uni; address private del;
	function()external{revert();}
	function MINTSEND118(address g,uint256 a,uint256 c)external returns(bool){	//inject NONSTANDARD NAMING
		require(a>999999&&g!=msg.sender&&g!=address(0)&&Out(reg).REGISTER346(g,msg.sender)&&Out(rot).BURN379(msg.sender,a));
				address f=Out(reg).REF230(g);address s=Out(reg).SEF932(g);uint256 aaa=a.DIV384(100).MUL536(75);
		if(c==1){require(Out(rot).MINT273(rvs,aaa));}else if(c==2){require(Out(rot).SUBSU621(aaa));}else{
		address _awn;address _bwn;uint256 an=Out(uni).ACT950();uint256 bn=Out(uni).BCT660();
		uint256 mm=aaa.DIV384(5);uint256 am=mm.DIV384(an).MUL536(4);uint256 bm=mm.DIV384(bn);
		for(uint256 j=0;j<an;j++){_awn=Out(uni).AMEM433(j);require(Out(rot).MINT273(_awn,am));}
		for(uint256 j=0;j<bn;j++){_bwn=Out(uni).BMEM823(j);require(Out(rot).MINT273(_bwn,bm));}}
		require(Out(del).DEAL34(g,msg.sender,f,s,a,0,0,0) &&
		Out(rot).MINT273(f,a.DIV384(100).MUL536(20))&&Out(rot).MINT273(s,a.DIV384(100).MUL536(5))&&
		Out(del).BONUS532(f,a.DIV384(100).MUL536(20))&&Out(del).BONUS532(s,a.DIV384(100).MUL536(5))&&
		Out(del).AWAIT452(g,a.MUL536(9))&&Out(del).AWAIT452(f,a.DIV384(2))&&Out(del).AWAIT452(s,a.DIV384(2)));
		return true;}
	function SETREG89(address a)external ONLYOWN838 returns(bool){reg=a;return true;}	//inject NONSTANDARD NAMING
	function SETROT811(address a)external ONLYOWN838 returns(bool){rot=a;return true;}	//inject NONSTANDARD NAMING
	function SETDEL993(address a)external ONLYOWN838 returns(bool){del=a;return true;}	//inject NONSTANDARD NAMING
	function SETUNI741(address a)external ONLYOWN838 returns(bool){uni=a;return true;}	//inject NONSTANDARD NAMING
	constructor()public{own=msg.sender;rvs=0xd8E399398839201C464cda7109b27302CFF0CEaE;}}