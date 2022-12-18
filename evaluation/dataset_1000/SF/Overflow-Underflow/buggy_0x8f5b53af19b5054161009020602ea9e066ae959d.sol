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
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address private delmapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
; address private rotfunction bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
	function setrot(address a)external onlyOwn returns(bool){rot=a;return true;}
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
    function setdel(address a)external onlyOwn returns(bool){del=a;return true;}
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function()external{revert();}
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
    constructor()public{own=msg.sender;}
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }}