pragma solidity ^0.5.1;

/**
 * @title Vrenelium Token - VRE
 * @author Vrenelium AG 2018/2019
 */

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }
  address public owner;


address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
  event OwnershipRenounced(address indexed previousOwner);
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }
uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }
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
}

/**
 * @title SafeMath
 *
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}

/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * See https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
  function totalSupply() public view returns (uint256);
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  function balanceOf(address who) public view returns (uint256);
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
  function transfer(address to, uint256 value) public returns (bool);
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender)
    public view returns (uint256);
uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }

  function transferFrom(address from, address to, uint256 value)
    public returns (bool);
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }

  function approve(address spender, uint256 value) public returns (bool);
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
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

/**
 * @title Basic token
 *
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }
  mapping(address => uint256) balances;

mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
  uint256 totalSupply_;

  /**
  * @dev Total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }

  /**
  * @dev Transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_value <= balances[msg.sender]);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }

}


/**
 * @title ERC20 token implementation
 *
 * @dev Implementation of the ERC20 token.
 */
contract StandardToken is ERC20, BasicToken {

mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }
  mapping (address => mapping (address => uint256)) internal allowed;

  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    require(_to != address(0));

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(
    address _owner,
    address _spender
   )
    public
    view
    returns (uint256)
  {
    return allowed[_owner][_spender];
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

  /**
   * @dev Increase the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To increment
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * @param _spender The address which will spend the funds.
   * @param _addedValue The amount of tokens to increase the allowance by.
   */
  function increaseApproval(
    address _spender,
    uint256 _addedValue
  )
    public
    returns (bool)
  {
    allowed[msg.sender][_spender] = (
      allowed[msg.sender][_spender].add(_addedValue));
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }

  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   * approve should be called when allowed[_spender] == 0. To decrement
   * allowed value is better to use this function to avoid 2 calls (and wait until
   * the first transaction is mined)
   * @param _spender The address which will spend the funds.
   * @param _subtractedValue The amount of tokens to decrease the allowance by.
   */
  function decreaseApproval(
    address _spender,
    uint256 _subtractedValue
  )
    public
    returns (bool)
  {
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue >= oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }

}


/**
 * @title Mintable token with logarithmic approximation to token cap
 */
contract MintableTokenWithCap is StandardToken, Ownable {

bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event Mint(address indexed to, uint256 amount);

  uint256 public constant TOTAL_TOKEN_CAP      = 78000000 * 10 ** 18; // Maximum amount of tokens
  uint256 public constant PRE_MINTED_TOKEN_CAP = 24100000 * 10 ** 18; // Amount of pre minted tokens

mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }
  uint256 public constant PRE_MINTING_END      = 1577750400; // x1 - 2019-12-31T00:00:00+00:00 - Pre minting end Timestamp
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }
  uint256 public constant MINTING_END          = 3187295999; // x2 - 2070-12-31T23:59:59+00:00 - Minting end Timestamp


  modifier hasMintPermission() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Function to mint tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address _to,
    uint256 _amount
  )
    hasMintPermission
    public
    returns (bool)
  {
    require(totalSupply_ + _amount <= getCurrentMintingLimit());

    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }

  function getCurrentMintingLimit()
    public
    view
    returns(uint256)
  {
    if(now <= PRE_MINTING_END) {

      return PRE_MINTED_TOKEN_CAP;
    }
    else if(now <= MINTING_END) {

      // Logarithmic approximation until MINTING_END
      // qfactor = (ln(2x + 0.2) - ln(0.2)) / (ln(2.2)-ln(0.2))
      // Pre calculated values are used for efficiency reasons

      if(now <= 1609459199) { // 12/31/2020 @ 11:59pm (UTC)
            return 28132170 *10 ** 18;
      }
      else if(now <= 1640995199) { // 12/31/2021 @ 11:59pm (UTC)
            return 31541205 *10 ** 18;
      }
      else if(now <= 1672531199) { // 12/31/2022 @ 11:59pm (UTC)
            return 34500660 *10 ** 18;
      }
      else if(now <= 1704067199) { // 12/31/2023 @ 11:59pm (UTC)
            return 37115417 *10 ** 18;
      }
      else if(now <= 1735603199) { // 12/31/2024 @ 11:59pm (UTC)
            return 39457461 *10 ** 18;
      }
      else if(now <= 1767225599) { // 12/31/2025 @ 11:59pm (UTC)
            return 41583887 *10 ** 18;
      }
      else if(now <= 1798761599) { // 12/31/2026 @ 11:59pm (UTC)
            return 43521339 *10 ** 18;
      }
      else if(now <= 1830297599) { // 12/31/2027 @ 11:59pm (UTC)
            return 45304967 *10 ** 18;
      }
      else if(now <= 1861919999) { // 12/31/2028 @ 11:59pm (UTC)
            return 46961775 *10 ** 18;
      }
      else if(now <= 1893455999) { // 12/31/2029 @ 11:59pm (UTC)
            return 48500727 *10 ** 18;
      }
      else if(now <= 1924991999) { // 12/31/2030 @ 11:59pm (UTC)
            return 49941032 *10 ** 18;
      }
      else if(now <= 1956527999) { // 12/31/2031 @ 11:59pm (UTC)
            return 51294580 *10 ** 18;
      }
      else if(now <= 1988150399) { // 12/31/2032 @ 11:59pm (UTC)
            return 52574631 *10 ** 18;
      }
      else if(now <= 2019686399) { // 12/31/2033 @ 11:59pm (UTC)
            return 53782475 *10 ** 18;
      }
      else if(now <= 2051222399) { // 12/31/2034 @ 11:59pm (UTC)
            return 54928714 *10 ** 18;
      }
      else if(now <= 2082758399) { // 12/31/2035 @ 11:59pm (UTC)
            return 56019326 *10 ** 18;
      }
      else if(now <= 2114380799) { // 12/31/2036 @ 11:59pm (UTC)
            return 57062248 *10 ** 18;
      }
      else if(now <= 2145916799) { // 12/31/2037 @ 11:59pm (UTC)
            return 58056255 *10 ** 18;
      }
      else if(now <= 2177452799) { // 12/31/2038 @ 11:59pm (UTC)
            return 59008160 *10 ** 18;
      }
      else if(now <= 2208988799) { // 12/31/2039 @ 11:59pm (UTC)
            return 59921387 *10 ** 18;
      }
      else if(now <= 2240611199) { // 12/31/2040 @ 11:59pm (UTC)
            return 60801313 *10 ** 18;
      }
      else if(now <= 2272147199) { // 12/31/2041 @ 11:59pm (UTC)
            return 61645817 *10 ** 18;
      }
      else if(now <= 2303683199) { // 12/31/2042 @ 11:59pm (UTC)
            return 62459738 *10 ** 18;
      }
      else if(now <= 2335219199) { // 12/31/2043 @ 11:59pm (UTC)
            return 63245214 *10 ** 18;
      }
      else if(now <= 2366841599) { // 12/31/2044 @ 11:59pm (UTC)
            return 64006212 *10 ** 18;
      }
      else if(now <= 2398377599) { // 12/31/2045 @ 11:59pm (UTC)
            return 64740308 *10 ** 18;
      }
      else if(now <= 2429913599) { // 12/31/2046 @ 11:59pm (UTC)
            return 65451186 *10 ** 18;
      }
      else if(now <= 2461449599) { // 12/31/2047 @ 11:59pm (UTC)
            return 66140270 *10 ** 18;
      }
      else if(now <= 2493071999) { // 12/31/2048 @ 11:59pm (UTC)
            return 66810661 *10 ** 18;
      }
      else if(now <= 2524607999) { // 12/31/2049 @ 11:59pm (UTC)
            return 67459883 *10 ** 18;
      }
      else if(now <= 2556143999) { // 12/31/2050 @ 11:59pm (UTC)
            return 68090879 *10 ** 18;
      }
      else if(now <= 2587679999) { // 12/31/2051 @ 11:59pm (UTC)
            return 68704644 *10 ** 18;
      }
      else if(now <= 2619302399) { // 12/31/2052 @ 11:59pm (UTC)
            return 69303710 *10 ** 18;
      }
      else if(now <= 2650838399) { // 12/31/2053 @ 11:59pm (UTC)
            return 69885650 *10 ** 18;
      }
      else if(now <= 2682374399) { // 12/31/2054 @ 11:59pm (UTC)
            return 70452903 *10 ** 18;
      }
      else if(now <= 2713910399) { // 12/31/2055 @ 11:59pm (UTC)
            return 71006193 *10 ** 18;
      }
      else if(now <= 2745532799) { // 12/31/2056 @ 11:59pm (UTC)
            return 71547652 *10 ** 18;
      }
      else if(now <= 2777068799) { // 12/31/2057 @ 11:59pm (UTC)
            return 72074946 *10 ** 18;
      }
      else if(now <= 2808604799) { // 12/31/2058 @ 11:59pm (UTC)
            return 72590155 *10 ** 18;
      }
      else if(now <= 2840140799) { // 12/31/2059 @ 11:59pm (UTC)
            return 73093818 *10 ** 18;
      }
      else if(now <= 2871763199) { // 12/31/2060 @ 11:59pm (UTC)
            return 73587778 *10 ** 18;
      }
      else if(now <= 2903299199) { // 12/31/2061 @ 11:59pm (UTC)
            return 74069809 *10 ** 18;
      }
      else if(now <= 2934835199) { // 12/31/2062 @ 11:59pm (UTC)
            return 74541721 *10 ** 18;
      }
      else if(now <= 2966371199) { // 12/31/2063 @ 11:59pm (UTC)
            return 75003928 *10 ** 18;
      }
      else if(now <= 2997993599) { // 12/31/2064 @ 11:59pm (UTC)
            return 75458050 *10 ** 18;
      }
      else if(now <= 3029529599) { // 12/31/2065 @ 11:59pm (UTC)
            return 75901975 *10 ** 18;
      }
      else if(now <= 3061065599) { // 12/31/2066 @ 11:59pm (UTC)
            return 76337302 *10 ** 18;
      }
      else if(now <= 3092601599) { // 12/31/2067 @ 11:59pm (UTC)
            return 76764358 *10 ** 18;
      }
      else if(now <= 3124223999) { // 12/31/2068 @ 11:59pm (UTC)
            return 77184590 *10 ** 18;
      }
      else if(now <= 3155759999) { // 12/31/2069 @ 11:59pm (UTC)
            return 77595992 *10 ** 18;
      }
      else if(now <= 3187295999) { // 12/31/2070 @ 11:59pm (UTC)
            return 78000000 *10 ** 18;
      }
    }
    else {

      return TOTAL_TOKEN_CAP;
    }
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
}


/**
* @title Vrenelium Token Smart Contract
*/
contract VreneliumToken is MintableTokenWithCap {

    // Public Constants
  mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  string public constant name = "Vrenelium Token";
  bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }
  string public constant symbol = "VRE";
  bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
  uint8 public constant decimals = 18;

    /**
    * @dev Modifier to not allow transfers
    * to this contract
    */
    modifier validDestination(address _to) {
        require(_to != address(this));
        _;
    }

    constructor() public {
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }

    function transferFrom(address _from, address _to, uint256 _value) public
        validDestination(_to)
        returns (bool) {
        return super.transferFrom(_from, _to, _value);
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

    function approve(address _spender, uint256 _value) public
        returns (bool) {
        return super.approve(_spender, _value);
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

    function increaseApproval (address _spender, uint _addedValue) public
        returns (bool) {
        return super.increaseApproval(_spender, _addedValue);
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }

    function decreaseApproval (address _spender, uint _subtractedValue) public
        returns (bool) {
        return super.decreaseApproval(_spender, _subtractedValue);
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }

    function transfer(address _to, uint256 _value) public
        validDestination(_to)
        returns (bool) {
        return super.transfer(_to, _value);
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
}