/**
 *Submitted for verification at Etherscan.io on 2020-04-21
*/

pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract AdminAuth {

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  address public admin;

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice Admin is set by owner first time, after that admin is super role and has permission to change owner
    /// @param _admin Address of multisig that becomes admin
    function setAdminByOwner(address _admin) public {
        require(msg.sender == owner);
        require(_admin == address(0));

        admin = _admin;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice Admin is able to set new admin
    /// @param _admin Address of multisig that becomes new admin
    function setAdminByAdmin(address _admin) public {
        require(msg.sender == admin);

        admin = _admin;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice Admin is able to change owner
    /// @param _owner Address of new owner
    function setOwnerByAdmin(address _owner) public {
        require(msg.sender == admin);

        owner = _owner;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
}


contract CompoundSubscriptions is AdminAuth {

    struct CompoundHolder {
        address user;
        uint128 minRatio;
        uint128 maxRatio;
        uint128 optimalRatioBoost;
        uint128 optimalRatioRepay;
        bool boostEnabled;
    }

    struct SubPosition {
        uint arrPos;
        bool subscribed;
    }

  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  CompoundHolder[] public subscribers;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => SubPosition) public subscribersPos;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  uint public changeIndex;

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Subscribed(address indexed user);
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Unsubscribed(address indexed user);
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Updated(address indexed user);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event ParamUpdates(address indexed user, uint128, uint128, uint128, uint128, bool);

    /// @dev Called by the DSProxy contract which owns the Compound position
    /// @notice Adds the users Compound poistion in the list of subscriptions so it can be monitored
    /// @param _minRatio Minimum ratio below which repay is triggered
    /// @param _maxRatio Maximum ratio after which boost is triggered
    /// @param _optimalBoost Ratio amount which boost should target
    /// @param _optimalRepay Ratio amount which repay should target
    /// @param _boostEnabled Boolean determing if boost is enabled
    function subscribe(uint128 _minRatio, uint128 _maxRatio, uint128 _optimalBoost, uint128 _optimalRepay, bool _boostEnabled) external {

        // if boost is not enabled, set max ratio to max uint
        uint128 localMaxRatio = _boostEnabled ? _maxRatio : uint128(-1);
        require(checkParams(_minRatio, localMaxRatio), "Must be correct params");

        SubPosition storage subInfo = subscribersPos[msg.sender];

        CompoundHolder memory subscription = CompoundHolder({
                minRatio: _minRatio,
                maxRatio: localMaxRatio,
                optimalRatioBoost: _optimalBoost,
                optimalRatioRepay: _optimalRepay,
                user: msg.sender,
                boostEnabled: _boostEnabled
            });

        changeIndex++;

        if (subInfo.subscribed) {
            subscribers[subInfo.arrPos] = subscription;

            emit Updated(msg.sender);
            emit ParamUpdates(msg.sender, _minRatio, localMaxRatio, _optimalBoost, _optimalRepay, _boostEnabled);
        } else {
            subscribers.push(subscription);

            subInfo.arrPos = subscribers.length - 1;
            subInfo.subscribed = true;

            emit Subscribed(msg.sender);
        }
    }

    /// @notice Called by the users DSProxy
    /// @dev Owner who subscribed cancels his subscription
    function unsubscribe() external {
        _unsubscribe(msg.sender);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    /// @dev Checks limit if minRatio is bigger than max
    function checkParams(uint128 _minRatio, uint128 _maxRatio) internal pure returns (bool) {

        if (_minRatio > _maxRatio) {
            return false;
        }

        return true;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    /// @dev Internal method to remove a subscriber from the list
    function _unsubscribe(address _user) internal {
        require(subscribers.length > 0, "Must have subscribers in the list");

        SubPosition storage subInfo = subscribersPos[_user];

        require(subInfo.subscribed, "Must first be subscribed");

        address lastOwner = subscribers[subscribers.length - 1].user;

        SubPosition storage subInfo2 = subscribersPos[lastOwner];
        subInfo2.arrPos = subInfo.arrPos;

        subscribers[subInfo.arrPos] = subscribers[subscribers.length - 1];
        delete subscribers[subscribers.length - 1];
        subscribers.length--;

        changeIndex++;
        subInfo.subscribed = false;
        subInfo.arrPos = 0;

        emit Unsubscribed(msg.sender);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function isSubscribed(address _user) public view returns (bool) {
        SubPosition storage subInfo = subscribersPos[_user];

        return subInfo.subscribed;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function getHolder(address _user) public view returns (CompoundHolder memory) {
        SubPosition storage subInfo = subscribersPos[_user];

        return subscribers[subInfo.arrPos];
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice Helper method to return all the subscribed CDPs
    function getSubscribers() public view returns (CompoundHolder[] memory) {
        return subscribers;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice Helper method to return all the subscribed CDPs
    function getSubscribersByPage(uint _page, uint _perPage) public view returns (CompoundHolder[] memory) {
        CompoundHolder[] memory holders = new CompoundHolder[](_perPage);

        uint start = _page * _perPage;
        uint end = start + _perPage;

        uint count = 0;
        for (uint i=start; i<end; i++) {
            holders[count] = subscribers[i];
            count++;
        }

        return holders;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    ////////////// ADMIN METHODS ///////////////////

    /// @notice Admin function to unsubscribe a CDP
    function unsubscribeByAdmin(address _user) public onlyOwner {
        SubPosition storage subInfo = subscribersPos[_user];

        if (subInfo.subscribed) {
            _unsubscribe(_user);
        }
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
}