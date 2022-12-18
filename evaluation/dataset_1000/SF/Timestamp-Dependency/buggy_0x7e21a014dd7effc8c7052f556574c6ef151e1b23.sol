/**
 *Submitted for verification at Etherscan.io on 2019-12-16
*/

pragma solidity 0.5.13;
interface Out{function check(address w)external view returns(bool);}
contract REGISTER{
  function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address private own;address private unfunction bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
i;uint256 private cnt=4;
    modifier onlyOwn{require(own==msg.sender);_;}
uint256 bugv_tmstmp3 = block.timestamp; 
    modifier infra{require(Out(uni).check(msg.sender));_;}
uint256 bugv_tmstmp1 = block.timestamp;
	mapping(uint256=>address)private afunction bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
c;mapping(address=>uint256)private id;address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

	mapping(address=>address)private rrefunction bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
f;mapping(address=>uint256)private rdate;
  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  address private rvs=0xfd4bF25101A6d76c1E81E648Af54d01090Af1679;
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address private fts=0xf7cb0EF0F252cD6056a341d65df065eaBa832Ef1;
  address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
  address private sts=0xdCF8AED070702037A60AF9689B11af3158973184;function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	mapping(address=>address[])public frefunction bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
f;mapping(address=>address[])public sref;
	function rff(address a,address b)private returns(bool){
		rdate[a]=now;rref[a]=b;fref[b].push(a);sref[rref[b]].push(a);return true;}
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function _register(address a,address b)private returns(bool){
		require(id[b]!=0);if(id[a]==0){ac[cnt+now]=a;id[a]=cnt+now;cnt=cnt+1;require(rff(a,b));}return true;}
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    function register(address a,address b)external infra returns(bool){require(_register(a,b));return true;}
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
    function segister(address b)external infra returns(bool){require(_register(msg.sender,b));return true;}
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
    function total()external view returns(uint256){return cnt-1;}
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    function acc(uint256 a)external view returns(address){return ac[a];}
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function idd(address a)external view returns(uint256){return id[a];}
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    function ref(address a)external view returns(address){return rref[a];}
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    function sef(address a)external view returns(address){return rref[rref[a]];}
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function pro(address a)external view returns(uint256,uint256,uint256){return(fref[a].length,sref[a].length,rdate[a]);}
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function setuni(address a)external onlyOwn returns(bool){uni=a;return true;}
uint256 bugv_tmstmp4 = block.timestamp;
	function()external{revert();}
uint256 bugv_tmstmp5 = block.timestamp;
	constructor()public{own=msg.sender;
	   id[rvs]=1000000000;ac[1000000000]=rvs;rref[rvs]=rvs;
	   id[fts]=1100000000;ac[1100000000]=fts;rref[fts]=fts;
	   id[sts]=1200000000;ac[1200000000]=sts;rref[sts]=sts;}
uint256 bugv_tmstmp2 = block.timestamp;}