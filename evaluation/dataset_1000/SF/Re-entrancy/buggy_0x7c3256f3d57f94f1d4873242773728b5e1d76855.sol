pragma solidity ^0.5.2;

/*
 * Admin sets only for revealling address restricton
 */
contract RevealPrivilege {
  uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
  address owner;
  mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }
  address public delegateAddr;
  mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }
  mapping(address => bool) public isAdmin;

    modifier onlyAdmins() {
        require(isAdmin[msg.sender] == true);
        _;
    }
    
    modifier isContractOwner() {
        require(owner == msg.sender);
        _;
    }
    
    function addAdmin(address _addr) isContractOwner public {
        isAdmin[_addr] = true;
    }
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }
    
    function removeAdmin(address _addr) isContractOwner public {
        isAdmin[_addr] = false;
    }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
    
    function transferOwner(address _addr) isContractOwner public {
        owner = _addr;
    }
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }
    
    function setdelegateAddr(address _addr) onlyAdmins public {
        delegateAddr = _addr;
    }
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }
}

contract FIH is RevealPrivilege {
    using SafeMath for uint256;
    
    // constant value
  mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
  uint256 constant withdrawalFee = 0.05 ether;
  mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }
  uint256 constant stake = 0.01 ether;
    
  mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }
  uint256 public bonusCodeNonce;
  address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }
  uint16 public currentPeriod;
    uint256 bonusPool;
  mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  uint256 public teamBonus;
    
    struct BonusCode {
        uint8 prefix;
        uint256 orderId;
        uint256 code;
        uint256 nums;
        uint256 period;
        address addr;
    }
    
    //user balance
  bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }
  mapping(address => uint256) balanceOf;
  bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
  mapping(address => bool) public allowance;
    // _period => BonusCode
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }
  mapping(uint16 => BonusCode) public revealResultPerPeriod;
  uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  mapping(uint16 => uint256) revealBonusPerPeriod;
    
  mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
  mapping(address => BonusCode[]) revealInfoByAddr;

  mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  mapping(uint16 => uint256) gameBonusPerPeriod;
    
  mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
  mapping(uint16 => mapping(address => uint256)) invitedBonus; // period => address => amount
  mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
  mapping(address => address) invitedRelations;

  uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
  mapping(uint16 => mapping(uint8 => uint256)) sideTotalAmount; // period => prefix => amount
  mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  mapping(uint16 => mapping(uint256 => BonusCode)) public revealBonusCodes; // period => code => BonusCode
  mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  mapping(uint16 => uint256[]) bcodes; // period => code

  address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
  event Bet(uint16 _currentPeriod, uint256 _orderId, uint256 _code, address _from);
  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  event Deposit(address _from, address _to, uint256 _amount);
  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event Reveal(uint16 _currentPeriod, uint256 _orderId, uint256 _prefix, uint256 _code, address _addr, uint256 _winnerBonus);
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event Withdrawal(address _to, uint256 _amount);

    constructor () public {
        owner = msg.sender;
        isAdmin[owner] = true;
        currentPeriod = 1;
        bonusCodeNonce = 0;
        bonusPool = 0;
        teamBonus = 0;
        gameBonusPerPeriod[currentPeriod] = 0;
    }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }

    function deposit(address _to) payable public { 
        require(msg.value > 0);
        if (msg.sender != _to) {
            require(msg.sender == delegateAddr, "deposit can only from self-address or delegated address");
            allowance[_to] = true;
        }
        balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], msg.value);
        emit Deposit(msg.sender, _to, msg.value);
    }
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
    
    function bet(address _from, address _invitedAddr, uint256 _amount, uint8 _fType) public {
        // validate
        require(stake <= _amount  && _amount <= balanceOf[_from], "amount should more than stake and less or equal to balance");
        if (msg.sender != _from) {
            require(msg.sender == delegateAddr && allowance[_from] == true, "permission rejected");
        }
        if (_invitedAddr != address(0x0)) {
             require(_from != _invitedAddr, "bet _from is not equals _invitedAddr");
        }
        
        //handler balance and allowance
        balanceOf[_from] = balanceOf[_from].safeSub(_amount);
         
        sideTotalAmount[currentPeriod][_fType] = sideTotalAmount[currentPeriod][_fType].safeAdd(_amount);
        /* split amount */
        //1. bonusPool
        uint256 currentAmount = _amount;
        uint256 gameBonusPercentVal = _amount.safeMul(20).safeDiv(100);
        uint256 teamBonusPercentVal = _amount.safeMul(15).safeDiv(100);
        uint256 bonusPoolPercentVal = _amount.safeMul(50).safeDiv(100);
        
        gameBonusPerPeriod[currentPeriod] = gameBonusPerPeriod[currentPeriod].safeAdd(gameBonusPercentVal);
        currentAmount = currentAmount.safeSub(gameBonusPercentVal);
        
        teamBonus = teamBonus.safeAdd(teamBonusPercentVal);
        currentAmount = currentAmount.safeSub(teamBonusPercentVal);
        
        bonusPool = bonusPool.safeAdd(bonusPoolPercentVal);
        currentAmount = currentAmount.safeSub(bonusPoolPercentVal);
        
        //invited bonus 
        uint256 bonusLevelOne = _amount.safeMul(10).safeDiv(100);
        uint256 bonusLevelTwo = _amount.safeMul(5).safeDiv(100);
        
        if(_invitedAddr != address(0x0)) {
            invitedRelations[_from] = _invitedAddr;
        }
        if (invitedRelations[_from] != address(0x0)) {
            address fa = invitedRelations[_from];
            invitedBonus[currentPeriod][fa] = invitedBonus[currentPeriod][fa].safeAdd(bonusLevelOne);
            balanceOf[fa] = balanceOf[fa].safeAdd(bonusLevelOne);
            currentAmount = currentAmount.safeSub(bonusLevelOne);
            address gfa = invitedRelations[fa];
            if (gfa != address(0x0)) {
               invitedBonus[currentPeriod][gfa] = invitedBonus[currentPeriod][gfa].safeAdd(bonusLevelTwo);
               balanceOf[gfa] = balanceOf[gfa].safeAdd(bonusLevelTwo);
               currentAmount = currentAmount.safeSub(bonusLevelTwo);
            }
        }
        assert(currentAmount >= 0);
        bonusPool = bonusPool.safeAdd(currentAmount);
        
        //generate order and bonusCodes
        uint256 oId = block.timestamp;
        
        BonusCode memory bc = BonusCode({
            orderId: oId,
            prefix:  _fType,
            code:    bonusCodeNonce,
            nums:    _amount.safeDiv(stake),
            addr:    _from, 
            period:  currentPeriod
        });
        revealBonusCodes[currentPeriod][bonusCodeNonce] = bc;
        bcodes[currentPeriod].push(bonusCodeNonce);
        emit Bet(currentPeriod, oId, bonusCodeNonce, _from);
        bonusCodeNonce = bonusCodeNonce.safeAdd(_amount.safeDiv(stake));
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }
    
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event Debug(uint256 winnerIndex, uint256 bcodesLen, uint256 pos);
    function reveal(string memory _seed) public onlyAdmins {
        // random winner index
        
        uint256 winner = uint256(keccak256(abi.encodePacked(_seed, msg.sender, block.timestamp))) % bonusCodeNonce;
        uint256 lt = 0;
        uint256 rt = bcodes[currentPeriod].length - 1;
        require(lt <= rt, "bcodes length is not correct");
        uint256 pos = lt;
        while (lt <= rt) {
            uint256 mid = lt + (rt - lt) / 2;
            if (bcodes[currentPeriod][mid] <= winner) {
                pos = mid;
                lt = mid + 1;
            } else {
                rt = mid - 1;
            }
        }
        emit Debug(winner, bcodes[currentPeriod].length, pos);
        
        
        uint256 halfBonusPool = bonusPool.safeMul(50).safeDiv(100);
        BonusCode memory winnerBcode = revealBonusCodes[currentPeriod][bcodes[currentPeriod][pos]];
        
        // iterate;  
        uint256 bcodesLen = bcodes[currentPeriod].length;
        for (uint256 i = 0; i < bcodesLen; i++) {
            if (revealBonusCodes[currentPeriod][bcodes[currentPeriod][i]].prefix != winnerBcode.prefix) {
                continue;
            }
            BonusCode memory thisBonusCode = revealBonusCodes[currentPeriod][bcodes[currentPeriod][i]];
            if (thisBonusCode.addr == winnerBcode.addr && thisBonusCode.orderId == winnerBcode.orderId) {
                balanceOf[winnerBcode.addr] = balanceOf[winnerBcode.addr].safeAdd(halfBonusPool);
            } else {
                uint256 bonusAmount = halfBonusPool.safeMul(
                    thisBonusCode.nums.safeMul(stake).safeDiv(sideTotalAmount[currentPeriod][winnerBcode.prefix])
                    );
                balanceOf[thisBonusCode.addr] = balanceOf[thisBonusCode.addr].safeAdd(bonusAmount);
            }
        }
        
        // update reveal result && reset value
        revealBonusPerPeriod[currentPeriod] = halfBonusPool;
        revealResultPerPeriod[currentPeriod] = winnerBcode;
        revealInfoByAddr[winnerBcode.addr].push(winnerBcode);
        currentPeriod++;
        bonusPool = 0;
        bonusCodeNonce = 0;
        gameBonusPerPeriod[currentPeriod] = 0;
        
        emit Reveal(currentPeriod - 1, winnerBcode.orderId, winnerBcode.prefix, winnerBcode.code, winnerBcode.addr, halfBonusPool);
    }
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }
    
    function withdrawal(address _from, address payable _to, uint256 _amount) public {
        // permission check
        if (msg.sender != _from) {
            require(allowance[_from] == true && msg.sender == delegateAddr, "permission rejected");
        }
        // amount check
        require(withdrawalFee <= _amount && _amount <= balanceOf[_from], "Don't have enough balance");
        
        balanceOf[_from] = balanceOf[_from].safeSub(_amount);
        _amount = _amount.safeSub(withdrawalFee);
        teamBonus = teamBonus.safeAdd(withdrawalFee);
        
	  	_to.transfer(_amount);
	    emit Withdrawal(_to, _amount);
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }
    
    function teamWithdrawal() onlyAdmins public {
        require(teamBonus > 0, "Don't have enough teamBonus");
        uint256 tmp = teamBonus;
        teamBonus = 0;
        msg.sender.transfer(tmp);
    }
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
    
    function gameBonusWithdrawal(uint16 _period) onlyAdmins public {
        require(gameBonusPerPeriod[_period] > 0, "Don't have enough money");
        uint256 tmp = gameBonusPerPeriod[_period];
        gameBonusPerPeriod[_period] = 0;
        msg.sender.transfer(tmp);
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
    
    function updateContract() isContractOwner public {
        msg.sender.transfer(address(this).balance);
    }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
    
    /*
     * read only part
     * for query 
     */
    function getBalance(address _addr) public view returns(uint256) {
        return balanceOf[_addr];
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
    
    function getBonusPool() public view returns(uint256) {
        return bonusPool;
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }

    function getBonusInvited(address _from) public view returns(uint256) {
        return invitedBonus[currentPeriod][_from];
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
    
    function getRevealResultPerPeriod(uint16 _period) public view returns(uint8 _prefix, uint256 _orderId, uint256 _code, uint256 _nums, address _addr, uint256 _revealBonus) {
        _prefix = revealResultPerPeriod[_period].prefix;
        _orderId = revealResultPerPeriod[_period].orderId;
        _code = revealResultPerPeriod[_period].code;
        _nums = revealResultPerPeriod[_period].nums;
        _addr = revealResultPerPeriod[_period].addr;
        _revealBonus = revealBonusPerPeriod[_period];
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
}

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function safeMul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function safeDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function safeMod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}