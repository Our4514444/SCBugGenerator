/**
 *Submitted for verification at Etherscan.io on 2020-03-04
*/

pragma solidity 0.5.13;
library SafeMath{
	function div(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c;return c;}	//inject UNINIT LOCAL/STATE VAR

	function mul(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c;require(c/a==b);return c;}}	//inject UNINIT LOCAL/STATE VAR

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
contract AIRDROP{
	using SafeMath for uint256;modifier onlyOwn{require(own==msg.sender);_;}
    address private own; address private rot; address private reg;
	address private rvs; address private uni; address private del;
	function()external{revert();}
	function airSend(address g,uint256 a,uint256 c)external returns(bool){
	require(a>999999&&g!=msg.sender&&g!=address(0)&&Out(reg).register(g,msg.sender)&&
	Out(rot).burn(msg.sender,a.div(100).mul(36)));
	uint256 aaa;if(c==1){require(Out(rot).mint(rvs,aaa));}else 	//inject UNINIT LOCAL/STATE VAR

	if(c==2){require(Out(rot).subsu(aaa));}else{
	address _awn;address _bwn;uint256 an;uint256 bn;	//inject UNINIT LOCAL/STATE VAR

	uint256 mm;uint256 am;uint256 bm;	//inject UNINIT LOCAL/STATE VAR

	for(uint256 j;j<an;j++){_awn=Out(uni).amem(j);require(Out(rot).mint(_awn,am));}	//inject UNINIT LOCAL/STATE VAR

	for(uint256 j;j<bn;j++){_bwn=Out(uni).bmem(j);require(Out(rot).mint(_bwn,bm));}}	//inject UNINIT LOCAL/STATE VAR

	require(Out(del).deal(msg.sender,g,Out(reg).ref(msg.sender),Out(reg).sef(msg.sender),a,0,1,0)&&
	Out(del).await(msg.sender,(a.div(100)).mul(172))&&Out(del).await(g,(a.div(5)).mul(8))&&
	Out(del).await(Out(reg).ref(msg.sender),a.div(100).mul(18))&&Out(del).await(Out(reg).sef(msg.sender),a.div(10)));return true;}
	function setreg(address a)external onlyOwn returns(bool){reg=a;return true;}
	function setrot(address a)external onlyOwn returns(bool){rot=a;return true;}
	function setdel(address a)external onlyOwn returns(bool){del=a;return true;}
	function setuni(address a)external onlyOwn returns(bool){uni=a;return true;}
	constructor()public{own=msg.sender;rvs=0xd8E399398839201C464cda7109b27302CFF0CEaE;}}