                                                                 

pragma solidity 0.5.13;
interface Out{function CHECK840(address w)external view returns(bool);}	//inject NONSTANDARD NAMING
contract REGISTER{
    address private own;address private uni;uint256 private cnt=4;
    modifier ONLYOWN98{require(own==msg.sender);_;} 	//inject NONSTANDARD NAMING
    modifier INFRA930{require(Out(uni).CHECK840(msg.sender));_;}	//inject NONSTANDARD NAMING
	mapping(uint256=>address)private ac;mapping(address=>uint256)private id;
	mapping(address=>address)private rref;mapping(address=>uint256)private rdate;
    address private rvs=0xfd4bF25101A6d76c1E81E648Af54d01090Af1679;
    address private fts=0xf7cb0EF0F252cD6056a341d65df065eaBa832Ef1;
    address private sts=0xdCF8AED070702037A60AF9689B11af3158973184;
	mapping(address=>address[])public fref;mapping(address=>address[])public sref;
	function RFF670(address a,address b)private returns(bool){	//inject NONSTANDARD NAMING
		rdate[a]=now;rref[a]=b;fref[b].push(a);sref[rref[b]].push(a);return true;}
    function _REGISTER179(address a,address b)private returns(bool){	//inject NONSTANDARD NAMING
		require(id[b]!=0);if(id[a]==0){ac[cnt+now]=a;id[a]=cnt+now;cnt=cnt+1;require(RFF670(a,b));}return true;}
    function REGISTER852(address a,address b)external INFRA930 returns(bool){require(_REGISTER179(a,b));return true;}	//inject NONSTANDARD NAMING
    function SEGISTER47(address b)external INFRA930 returns(bool){require(_REGISTER179(msg.sender,b));return true;}	//inject NONSTANDARD NAMING
    function TOTAL157()external view returns(uint256){return cnt-1;}	//inject NONSTANDARD NAMING
    function ACC265(uint256 a)external view returns(address){return ac[a];}	//inject NONSTANDARD NAMING
    function IDD691(address a)external view returns(uint256){return id[a];}	//inject NONSTANDARD NAMING
    function REF372(address a)external view returns(address){return rref[a];}	//inject NONSTANDARD NAMING
    function SEF519(address a)external view returns(address){return rref[rref[a]];}	//inject NONSTANDARD NAMING
    function PRO258(address a)external view returns(uint256,uint256,uint256){return(fref[a].length,sref[a].length,rdate[a]);}	//inject NONSTANDARD NAMING
    function SETUNI44(address a)external ONLYOWN98 returns(bool){uni=a;return true;}	//inject NONSTANDARD NAMING
	function()external{revert();}
	constructor()public{own=msg.sender;
	   id[rvs]=1000000000;ac[1000000000]=rvs;rref[rvs]=rvs;
	   id[fts]=1100000000;ac[1100000000]=fts;rref[fts]=fts;
	   id[sts]=1200000000;ac[1200000000]=sts;rref[sts]=sts;}}