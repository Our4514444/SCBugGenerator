/*

 Copyright 2017-2019 RigoBlock, Rigo Investment Sagl.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.

*/

pragma solidity 0.5.2;

contract Owned {

  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address public owner;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event NewOwner(address indexed old, address indexed current);

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    function setOwner(address _new)
        public
        onlyOwner
    {
        require(_new != address(0));
        owner = _new;
        emit NewOwner(owner, _new);
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
}

interface RigoToken {

    /*
     * EVENTS
     */
    event TokenMinted(address indexed recipient, uint256 amount);

    /*
     * CORE FUNCTIONS
     */
    function mintToken(address _recipient, uint256 _amount) external;
    function changeMintingAddress(address _newAddress) external;
    function changeRigoblockAddress(address _newAddress) external;
    
    function balanceOf(address _who) external view returns (uint256);
}

interface Authority {

    /*
     * EVENTS
     */
    event AuthoritySet(address indexed authority);
    event WhitelisterSet(address indexed whitelister);
    event WhitelistedUser(address indexed target, bool approved);
    event WhitelistedRegistry(address indexed registry, bool approved);
    event WhitelistedFactory(address indexed factory, bool approved);
    event WhitelistedVault(address indexed vault, bool approved);
    event WhitelistedDrago(address indexed drago, bool isWhitelisted);
    event NewDragoEventful(address indexed dragoEventful);
    event NewVaultEventful(address indexed vaultEventful);
    event NewNavVerifier(address indexed navVerifier);
    event NewExchangesAuthority(address indexed exchangesAuthority);

    /*
     * CORE FUNCTIONS
     */
    function setAuthority(address _authority, bool _isWhitelisted) external;
    function setWhitelister(address _whitelister, bool _isWhitelisted) external;
    function whitelistUser(address _target, bool _isWhitelisted) external;
    function whitelistDrago(address _drago, bool _isWhitelisted) external;
    function whitelistVault(address _vault, bool _isWhitelisted) external;
    function whitelistRegistry(address _registry, bool _isWhitelisted) external;
    function whitelistFactory(address _factory, bool _isWhitelisted) external;
    function setDragoEventful(address _dragoEventful) external;
    function setVaultEventful(address _vaultEventful) external;
    function setNavVerifier(address _navVerifier) external;
    function setExchangesAuthority(address _exchangesAuthority) external;

    /*
     * CONSTANT PUBLIC FUNCTIONS
     */
    function isWhitelistedUser(address _target) external view returns (bool);
    function isAuthority(address _authority) external view returns (bool);
    function isWhitelistedRegistry(address _registry) external view returns (bool);
    function isWhitelistedDrago(address _drago) external view returns (bool);
    function isWhitelistedVault(address _vault) external view returns (bool);
    function isWhitelistedFactory(address _factory) external view returns (bool);
    function getDragoEventful() external view returns (address);
    function getVaultEventful() external view returns (address);
    function getNavVerifier() external view returns (address);
    function getExchangesAuthority() external view returns (address);
}

contract SafeMath {

    function safeMul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function safeDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return c;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function max64(uint64 a, uint64 b) internal pure returns (uint64) {
        return a >= b ? a : b;
    }

    function min64(uint64 a, uint64 b) internal pure returns (uint64) {
        return a < b ? a : b;
    }

    function max256(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    function min256(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }
}

interface InflationFace {

    /*
     * CORE FUNCTIONS
     */
    function mintInflation(address _thePool, uint256 _reward) external returns (bool);
    function setInflationFactor(address _group, uint256 _inflationFactor) external;
    function setMinimumRigo(uint256 _minimum) external;
    function setRigoblock(address _newRigoblock) external;
    function setAuthority(address _authority) external;
    function setProofOfPerformance(address _pop) external;
    function setPeriod(uint256 _newPeriod) external;

    /*
     * CONSTANT PUBLIC FUNCTIONS
     */
    function canWithdraw(address _thePool) external view returns (bool);
    function timeUntilClaim(address _thePool) external view returns (uint256);
    function getInflationFactor(address _group) external view returns (uint256);
}

/// @title Inflation - Allows ProofOfPerformance to mint tokens.
/// @author Gabriele Rigo - <gab@rigoblock.com>
// solhint-disable-next-line
contract Inflation is
    SafeMath,
    InflationFace
{
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  address public RIGOTOKENADDRESS;

  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public period = 1 days;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  uint256 public minimumGRG = 0;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address public proofOfPerformance;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  address public authority;
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  address public rigoblockDao;

  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  mapping(address => Performer) performers;
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(address => Group) groups;

    struct Performer {
        uint256 claimedTokens;
        mapping(uint256 => bool) claim;
        uint256 startTime;
        uint256 endTime;
        uint256 epoch;
    }

    struct Group {
        uint256 epochReward;
    }

    /// @notice in order to qualify for PoP user has to told minimum rigo token
    modifier minimumRigo(address _ofPool) {
        RigoToken rigoToken = RigoToken(RIGOTOKENADDRESS);
        require(
            rigoToken.balanceOf(getPoolOwner(_ofPool)) >= minimumGRG,
            "BELOW_MINIMUM_GRG"
        );
        _;
    }

    modifier onlyRigoblockDao {
        require(
            msg.sender == rigoblockDao,
            "ONLY_RIGOBLOCK_DAO"
        );
        _;
    }

    modifier onlyProofOfPerformance {
        require(
            msg.sender == proofOfPerformance,
            "ONLY_POP_CONTRACT"
        );
        _;
    }

    modifier isApprovedFactory(address _factory) {
        Authority auth = Authority(authority);
        require(
            auth.isWhitelistedFactory(_factory),
            "NOT_APPROVED_AUTHORITY"
        );
        _;
    }

    modifier timeAtLeast(address _thePool) {
        require(
            now >= performers[_thePool].endTime,
            "TIME_NOT_ENOUGH"
        );
        _;
    }

    constructor(
        address _rigoTokenAddress,
        address _proofOfPerformance,
        address _authority)
        public
    {
        RIGOTOKENADDRESS = _rigoTokenAddress;
        rigoblockDao = msg.sender;
        proofOfPerformance = _proofOfPerformance;
        authority = _authority;
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    /*
     * CORE FUNCTIONS
     */
    /// @dev Allows ProofOfPerformance to mint rewards
    /// @param _thePool Address of the target pool
    /// @param _reward Number of reward in Rigo tokens
    /// @return Bool the transaction executed correctly
    function mintInflation(address _thePool, uint256 _reward)
        external
        onlyProofOfPerformance
        minimumRigo(_thePool)
        timeAtLeast(_thePool)
        returns (bool)
    {
        performers[_thePool].startTime = now;
        performers[_thePool].endTime = now + period;
        ++performers[_thePool].epoch;
        uint256 reward = _reward * 95 / 100; //5% royalty to rigoblock dao
        uint256 rigoblockReward = safeSub(_reward, reward);
        RigoToken rigoToken = RigoToken(RIGOTOKENADDRESS);
        rigoToken.mintToken(getPoolOwner(_thePool), reward);
        rigoToken.mintToken(rigoblockDao, rigoblockReward);
        return true;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    /// @dev Allows rigoblock dao to set the inflation factor for a group
    /// @param _group Address of the group/factory
    /// @param _inflationFactor Value of the reward factor
    function setInflationFactor(address _group, uint256 _inflationFactor)
        external
        onlyRigoblockDao
        isApprovedFactory(_group)
    {
        groups[_group].epochReward = _inflationFactor;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    /// @dev Allows rigoblock dao to set the minimum number of required tokens
    /// @param _minimum Number of minimum tokens
    function setMinimumRigo(uint256 _minimum)
        external
        onlyRigoblockDao
    {
        minimumGRG = _minimum;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    /// @dev Allows rigoblock dao to upgrade its address
    /// @param _newRigoblock Address of the new rigoblock dao
    function setRigoblock(address _newRigoblock)
        external
        onlyRigoblockDao
    {
        rigoblockDao = _newRigoblock;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    /// @dev Allows rigoblock dao to update the authority
    /// @param _authority Address of the authority
    function setAuthority(address _authority)
        external
        onlyRigoblockDao
    {
        authority = _authority;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    /// @dev Allows rigoblock dao to update proof of performance
    /// @param _pop Address of the Proof of Performance contract
    function setProofOfPerformance(address _pop)
        external
        onlyRigoblockDao
    {
        proofOfPerformance = _pop;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    /// @dev Allows rigoblock dao to set the minimum time between reward collection
    /// @param _newPeriod Number of seconds between 2 rewards
    /// @notice set period on shorter subsets of time for testing
    function setPeriod(uint256 _newPeriod)
        external
        onlyRigoblockDao
    {
        period = _newPeriod;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    /*
     * CONSTANT PUBLIC FUNCTIONS
     */
    /// @dev Returns whether a wizard can claim reward tokens
    /// @param _thePool Address of the target pool
    /// @return Bool the wizard can claim
    function canWithdraw(address _thePool)
        external
        view
        returns (bool)
    {
        if (now >= performers[_thePool].endTime) {
            return true;
        }
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /// @dev Returns how much time needed until next claim
    /// @param _thePool Address of the target pool
    /// @return Number in seconds
    function timeUntilClaim(address _thePool)
        external
        view
        returns (uint256)
    {
        if (now < performers[_thePool].endTime) {
            return (performers[_thePool].endTime);
        }
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    /// @dev Return the reward factor for a group
    /// @param _group Address of the group
    /// @return Value of the reward factor
    function getInflationFactor(address _group)
        external
        view
        returns (uint256)
    {
        return groups[_group].epochReward;
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    /*
     * INTERNAL FUNCTIONS
     */
    /// @dev Returns the address of the pool owner
    /// @param _ofPool Number of the registered pool
    /// @return Address of the pool owner
    function getPoolOwner(address _ofPool)
        internal
        view
        returns (address)
    {
        return Owned(_ofPool).owner();
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
}