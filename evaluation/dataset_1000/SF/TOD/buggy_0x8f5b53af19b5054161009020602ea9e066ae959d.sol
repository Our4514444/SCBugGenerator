/**
 *Submitted for verification at Etherscan.io on 2019-12-17
*/

pragma solidity 0.5.13;
library SafeMath{
    function add(uint256 a,uint256 b)internal pure returns(uint256){uint256 c=a+b;require(c>=a);return c;}
	function sub(uint256 a,uint256 b)internal pure returns(uint256){require(b<=a);uint256 c=a-b;return c;}
	function div(uint256 a,uint256 b)internal pure returns(uint256){require(b>0);uint256 c=a/b;return c;}
	function mul(uint256 a,uint256 b)internal pure returns(uint256){if(a==0){return 0;}uint256 c=a*b;require(c/a==b);return c;}}
interface Out{
    function aad(uint256 n)external view returns(address);function bad(uint256 n)external view returns(address);
	function cad(uint256 n)external view returns(address);function dad(uint256 n)external view returns(address);
	function aam(uint256 n)external view returns(uint256);function srs(uint256 n)external view returns(uint256);
	function arw(uint256 n)external view returns(uint256);function brw(uint256 n)external view returns(uint256);
	function crw(uint256 n)external view returns(uint256);function drw(uint256 n)external view returns(uint256);
    function afin(uint256 n)external returns(bool);function bfin(uint256 n)external returns(bool);
	function cfin(uint256 n)external returns(bool);function dfin(uint256 n)external returns(bool);
	function day()external view returns(uint256);
	function mint(address w,uint256 a)external returns(bool);
    function swait(address w,uint256 n)external returns(bool);
	function mined(address w,uint256 n)external returns(bool);}
contract MINING{	
    using SafeMath for uint256; modifier onlyOwn{require(own==msg.sender);_;}
  address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
  address private delbool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }
; address private rotaddress payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }
; address private own;
    function mining(uint256 n)external returns(bool){
		address dd = msg.sender;uint256 sr=Out(del).srs(n);uint256 aa=Out(del).aam(n);
		uint256 a; uint256 r=0; uint256 mt=0;
		if(sr==2){if(dd==Out(del).aad(n)){r=Out(del).arw(n);a=aa;}else
		if(dd==Out(del).bad(n)){r=Out(del).brw(n);a=aa.div(5).mul(4);}else
		if(dd==Out(del).cad(n)){r=Out(del).crw(n);a=a.add(aa.div(10));}else
		if(dd==Out(del).dad(n)){r=Out(del).drw(n);a=a.add(aa.div(10));}else{r=0;}}else
		if(sr==1){if(dd==Out(del).aad(n)){r=Out(del).arw(n);a=aa.div(100).mul(172);}else
		if(dd==Out(del).bad(n)){r=Out(del).brw(n);a=aa.div(5).mul(8);}else
		if(dd==Out(del).cad(n)){r=Out(del).crw(n);a=a.add(aa.div(100).mul(18));}else
		if(dd==Out(del).dad(n)){r=Out(del).drw(n);a=a.add(aa.div(10));}else{r=0;}}else
		if(sr==0){if(dd==Out(del).aad(n)){ r=Out(del).arw(n);a=aa.mul(9);}
		if(dd==Out(del).cad(n)){ r=Out(del).crw(n);a=a.add(aa.div(2));}
		if(dd==Out(del).dad(n)){ r=Out(del).drw(n);a=a.add(aa.div(2));}else{r=0;}}
		require(r>0); uint256 t=Out(del).day().sub(r); if(t<73){mt=t;}else
		if(t<146){mt=73;mt=mt.add((t.sub(73)).mul(3));}else
		if(t<219){mt=292;mt=mt.add((t.sub(146)).mul(9));}else
		if(t<292){mt=949;mt=mt.add((t.sub(219)).mul(27));}else
		if(t<365){mt=2920;mt=mt.add((t.sub(292)).mul(81));}else{mt=8833;}
		if(mt==8833){mt=a;}else{ mt=(a.mul(mt)).div(8833);}
		require(mt>0&&Out(rot).mint(dd,mt)&&Out(del).mined(dd,mt)&&Out(del).swait(dd,a));
		if(dd==Out(del).aad(n)){require(Out(del).afin(n));}
		if(dd==Out(del).bad(n)){require(Out(del).bfin(n));}
		if(dd==Out(del).cad(n)){require(Out(del).cfin(n));}
		if(dd==Out(del).dad(n)){require(Out(del).dfin(n));}return true;}
address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
	function setrot(address a)external onlyOwn returns(bool){rot=a;return true;}
bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
    function setdel(address a)external onlyOwn returns(bool){del=a;return true;}
address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
    function()external{revert();}
address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
    constructor()public{own=msg.sender;}
address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }}