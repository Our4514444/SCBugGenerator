                                                                 

pragma solidity 0.5.13;
library SafeMath{
	function DIV201(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}	//inject NONSTANDARD NAMING
	function MUL656(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}}	//inject NONSTANDARD NAMING
interface Out{
	function MINT707(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function BURN120(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function AWAIT17(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function SUBSU219(uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function IDD713(address a)external view returns(uint256);	//inject NONSTANDARD NAMING
	function REF21(address a)external view returns(address);	//inject NONSTANDARD NAMING
    function SEF76(address a)external view returns(address);	//inject NONSTANDARD NAMING
	function REGISTER399(address a,address b)external returns(bool);	//inject NONSTANDARD NAMING
    function BCT124()external view returns(uint256);	//inject NONSTANDARD NAMING
    function ACT594()external view returns(uint256);	//inject NONSTANDARD NAMING
	function AMEM835(uint256 i)external view returns(address);	//inject NONSTANDARD NAMING
	function BMEM348(uint256 i)external view returns(address);	//inject NONSTANDARD NAMING
	function DEAL666(address w,address g,address q,address x,uint256 a,uint256 e,uint256 s,uint256 z)external returns(bool);}	//inject NONSTANDARD NAMING
contract CASHBACK{
	using SafeMath for uint256;modifier ONLYOWN260{require(own==msg.sender);_;}	//inject NONSTANDARD NAMING
    address private own; address private rot; address private reg;
	address private rvs; address private uni; address private del;
	function()external{revert();}
	function CASHSEND68(address g,uint256 a,uint256 c)external returns(bool){	//inject NONSTANDARD NAMING
	require(a>999999&&g!=msg.sender&&g!=address(0)&&Out(reg).REGISTER399(g,msg.sender)&&
	Out(rot).BURN120(msg.sender,a)&&
	Out(rot).MINT707(Out(reg).REF21(msg.sender),a.DIV201(10))&&
	Out(rot).MINT707(Out(reg).SEF76(msg.sender),a.DIV201(20)));
	uint256 aaa=a.DIV201(100).MUL656(85);
	if(c==1){require(Out(rot).MINT707(rvs,aaa));}else 
	if(c==2){require(Out(rot).SUBSU219(aaa));}else{
	address _awn;address _bwn;uint256 an=Out(uni).ACT594();uint256 bn=Out(uni).BCT124();
	uint256 mm=aaa.DIV201(5);uint256 am=mm.DIV201(an).MUL656(4);uint256 bm=mm.DIV201(bn);
	for(uint256 j=0;j<an;j++){_awn=Out(uni).AMEM835(j);require(Out(rot).MINT707(_awn,am));}
	for(uint256 j=0;j<bn;j++){_bwn=Out(uni).BMEM348(j);require(Out(rot).MINT707(_bwn,bm));}}
	require(Out(del).DEAL666(msg.sender,g,address(0),address(0),a,0,3,0)&&
	Out(del).AWAIT17(msg.sender,a)&&
	Out(del).AWAIT17(g,a.MUL656(10)));
	return true;}
    function CASHDEND907(address g,uint256 a,uint256 c)external returns(bool){	//inject NONSTANDARD NAMING
	require(a>999999&&g!=msg.sender&&g!=address(0)&&Out(reg).REGISTER399(g,msg.sender)&&
	Out(rot).BURN120(msg.sender,a)&&
	Out(rot).MINT707(Out(reg).REF21(msg.sender),a.DIV201(10))&&
	Out(rot).MINT707(Out(reg).SEF76(msg.sender),a.DIV201(20)));
	uint256 aaa=a.DIV201(100).MUL656(85);
	if(c==1){require(Out(rot).MINT707(rvs,aaa));}else 
	if(c==2){require(Out(rot).SUBSU219(aaa));}else{
	address _awn;address _bwn;uint256 an=Out(uni).ACT594();uint256 bn=Out(uni).BCT124();
	uint256 mm=aaa.DIV201(5);uint256 am=mm.DIV201(an).MUL656(4);uint256 bm=mm.DIV201(bn);
	for(uint256 j=0;j<an;j++){_awn=Out(uni).AMEM835(j);require(Out(rot).MINT707(_awn,am));}
	for(uint256 j=0;j<bn;j++){_bwn=Out(uni).BMEM348(j);require(Out(rot).MINT707(_bwn,bm));}}
	require(Out(del).DEAL666(msg.sender,g,Out(reg).REF21(msg.sender),Out(reg).SEF76(msg.sender),a,0,4,0)&&
	Out(del).AWAIT17(msg.sender,a.MUL656(4))&&
	Out(del).AWAIT17(g,a.MUL656(5))&&
	Out(del).AWAIT17(Out(reg).REF21(msg.sender),a.DIV201(2))&&
	Out(del).AWAIT17(Out(reg).SEF76(msg.sender),a.DIV201(2)));
	return true;}	
	function SETREG973(address a)external ONLYOWN260 returns(bool){reg=a;return true;}	//inject NONSTANDARD NAMING
	function SETROT697(address a)external ONLYOWN260 returns(bool){rot=a;return true;}	//inject NONSTANDARD NAMING
	function SETDEL294(address a)external ONLYOWN260 returns(bool){del=a;return true;}	//inject NONSTANDARD NAMING
	function SETUNI2(address a)external ONLYOWN260 returns(bool){uni=a;return true;}	//inject NONSTANDARD NAMING
	constructor()public{own=msg.sender;rvs=0xd8E399398839201C464cda7109b27302CFF0CEaE;}}