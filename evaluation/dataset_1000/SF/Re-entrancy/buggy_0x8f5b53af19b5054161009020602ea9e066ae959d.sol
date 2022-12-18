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
  mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
  address private deluint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
; address private rotmapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
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
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
	function setrot(address a)external onlyOwn returns(bool){rot=a;return true;}
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
    function setdel(address a)external onlyOwn returns(bool){del=a;return true;}
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
    function()external{revert();}
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
    constructor()public{own=msg.sender;}
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }}