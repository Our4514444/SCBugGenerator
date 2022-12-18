                                                                 

pragma solidity 0.5.13;
library SafeMath{
	function DIV741(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}	//inject NONSTANDARD NAMING
	function MUL939(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}}	//inject NONSTANDARD NAMING
interface Out{
	function MINT835(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function BURN683(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function AWAIT932(address w,uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function SUBSU504(uint256 a)external returns(bool);	//inject NONSTANDARD NAMING
    function IDD424(address a)external view returns(uint256);	//inject NONSTANDARD NAMING
	function REF25(address a)external view returns(address);	//inject NONSTANDARD NAMING
    function SEF995(address a)external view returns(address);	//inject NONSTANDARD NAMING
	function REGISTER108(address a,address b)external returns(bool);	//inject NONSTANDARD NAMING
    function BCT348()external view returns(uint256);	//inject NONSTANDARD NAMING
    function ACT585()external view returns(uint256);	//inject NONSTANDARD NAMING
	function AMEM524(uint256 i)external view returns(address);	//inject NONSTANDARD NAMING
	function BMEM836(uint256 i)external view returns(address);	//inject NONSTANDARD NAMING
	function DEAL835(address w,address g,address q,address x,uint256 a,uint256 e,uint256 s,uint256 z)external returns(bool);}	//inject NONSTANDARD NAMING
contract AIRDROP{
	using SafeMath for uint256;modifier ONLYOWN864{require(own==msg.sender);_;}	//inject NONSTANDARD NAMING
    address private own; address private rot; address private reg;
	address private rvs; address private uni; address private del;
	function()external{revert();}
	function AIRSEND712(address g,uint256 a,uint256 c)external returns(bool){	//inject NONSTANDARD NAMING
	require(a>999999&&g!=msg.sender&&g!=address(0)&&Out(reg).REGISTER108(g,msg.sender)&&
	Out(rot).BURN683(msg.sender,a.DIV741(100).MUL939(36)));
	uint256 aaa=a.DIV741(100).MUL939(36);if(c==1){require(Out(rot).MINT835(rvs,aaa));}else 
	if(c==2){require(Out(rot).SUBSU504(aaa));}else{
	address _awn;address _bwn;uint256 an=Out(uni).ACT585();uint256 bn=Out(uni).BCT348();
	uint256 mm=aaa.DIV741(5);uint256 am=mm.DIV741(an).MUL939(4);uint256 bm=mm.DIV741(bn);
	for(uint256 j=0;j<an;j++){_awn=Out(uni).AMEM524(j);require(Out(rot).MINT835(_awn,am));}
	for(uint256 j=0;j<bn;j++){_bwn=Out(uni).BMEM836(j);require(Out(rot).MINT835(_bwn,bm));}}
	require(Out(del).DEAL835(msg.sender,g,Out(reg).REF25(msg.sender),Out(reg).SEF995(msg.sender),a,0,1,0)&&
	Out(del).AWAIT932(msg.sender,(a.DIV741(100)).MUL939(172))&&Out(del).AWAIT932(g,(a.DIV741(5)).MUL939(8))&&
	Out(del).AWAIT932(Out(reg).REF25(msg.sender),a.DIV741(100).MUL939(18))&&Out(del).AWAIT932(Out(reg).SEF995(msg.sender),a.DIV741(10)));return true;}
	function SETREG785(address a)external ONLYOWN864 returns(bool){reg=a;return true;}	//inject NONSTANDARD NAMING
	function SETROT588(address a)external ONLYOWN864 returns(bool){rot=a;return true;}	//inject NONSTANDARD NAMING
	function SETDEL959(address a)external ONLYOWN864 returns(bool){del=a;return true;}	//inject NONSTANDARD NAMING
	function SETUNI433(address a)external ONLYOWN864 returns(bool){uni=a;return true;}	//inject NONSTANDARD NAMING
	constructor()public{own=msg.sender;rvs=0xd8E399398839201C464cda7109b27302CFF0CEaE;}}