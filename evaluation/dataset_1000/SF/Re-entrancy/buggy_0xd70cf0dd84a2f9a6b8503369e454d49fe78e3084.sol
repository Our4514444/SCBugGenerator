/**
 *Submitted for verification at Etherscan.io on 2020-10-29
*/

// File: contracts/external/govblocks-protocol/interfaces/IProposalCategory.sol

/* Copyright (C) 2017 GovBlocks.io
  This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
  You should have received a copy of the GNU General Public License
    along with this program.  If not, see http://www.gnu.org/licenses/ */

pragma solidity 0.5.7;


contract IProposalCategory {

  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  event Category(
        uint indexed categoryId,
        string categoryName,
        string actionHash
    );

    mapping(uint256 => bytes) public categoryActionHashes;

    /**
    * @dev Adds new category
    * @param _name Category name
    * @param _memberRoleToVote Voting Layer sequence in which the voting has to be performed.
    * @param _majorityVotePerc Majority Vote threshold for Each voting layer
    * @param _quorumPerc minimum threshold percentage required in voting to calculate result
    * @param _allowedToCreateProposal Member roles allowed to create the proposal
    * @param _closingTime Vote closing time for Each voting layer
    * @param _actionHash hash of details containing the action that has to be performed after proposal is accepted
    * @param _contractAddress address of contract to call after proposal is accepted
    * @param _contractName name of contract to be called after proposal is accepted
    * @param _incentives rewards to distributed after proposal is accepted
    * @param _functionHash function signature to be executed
    */
    function newCategory(
        string calldata _name, 
        uint _memberRoleToVote,
        uint _majorityVotePerc, 
        uint _quorumPerc,
        uint[] calldata _allowedToCreateProposal,
        uint _closingTime,
        string calldata _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint[] calldata _incentives,
        string calldata _functionHash
    )
        external;

    /** @dev gets category details
    */
    function category(uint _categoryId)
        external
        view
        returns(
            uint categoryId,
            uint memberRoleToVote,
            uint majorityVotePerc,
            uint quorumPerc,
            uint[] memory allowedToCreateProposal,
            uint closingTime,
            uint minStake
        );
    
    /**@dev gets category action details
    */
    function categoryAction(uint _categoryId)
        external
        view
        returns(
            uint categoryId,
            address contractAddress,
            bytes2 contractName,
            uint defaultIncentive
        );
    
    /** @dev Gets Total number of categories added till now
    */
    function totalCategories() external view returns(uint numberOfCategories);

    /**
     * @dev Gets the category acion details of a category id
     * @param _categoryId is the category id in concern
     * @return the category id
     * @return the contract address
     * @return the contract name
     * @return the default incentive
     * @return action function hash
     */
    function categoryActionDetails(uint256 _categoryId)
        external
        view
        returns (
            uint256,
            address,
            bytes2,
            uint256,
            bytes memory
        );

    /**
    * @dev Updates category details
    * @param _categoryId Category id that needs to be updated
    * @param _name Category name
    * @param _memberRoleToVote Voting Layer sequence in which the voting has to be performed.
    * @param _allowedToCreateProposal Member roles allowed to create the proposal
    * @param _majorityVotePerc Majority Vote threshold for Each voting layer
    * @param _quorumPerc minimum threshold percentage required in voting to calculate result
    * @param _closingTime Vote closing time for Each voting layer
    * @param _actionHash hash of details containing the action that has to be performed after proposal is accepted
    * @param _contractAddress address of contract to call after proposal is accepted
    * @param _contractName name of contract to be called after proposal is accepted
    * @param _incentives rewards to distributed after proposal is accepted
    * @param _functionHash function signature to be executed
    */
    function editCategory(
        uint _categoryId, 
        string calldata _name, 
        uint _memberRoleToVote, 
        uint _majorityVotePerc, 
        uint _quorumPerc,
        uint[] calldata _allowedToCreateProposal,
        uint _closingTime,
        string calldata _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint[] calldata _incentives,
        string calldata _functionHash
    )
        external;

}

// File: contracts/external/govblocks-protocol/interfaces/IMemberRoles.sol

/* Copyright (C) 2017 GovBlocks.io
  This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
  You should have received a copy of the GNU General Public License
    along with this program.  If not, see http://www.gnu.org/licenses/ */

pragma solidity 0.5.7;


contract IMemberRoles {

  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event MemberRole(uint256 indexed roleId, bytes32 roleName, string roleDescription);
    
    enum Role {UnAssigned, AdvisoryBoard, TokenHolder, DisputeResolution}

    function setInititorAddress(address _initiator) external;
bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }

    /// @dev Adds new member role
    /// @param _roleName New role name
    /// @param _roleDescription New description hash
    /// @param _authorized Authorized member against every role id
    function addRole(bytes32 _roleName, string memory _roleDescription, address _authorized) public;
bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }

    /// @dev Assign or Delete a member from specific role.
    /// @param _memberAddress Address of Member
    /// @param _roleId RoleId to update
    /// @param _active active is set to be True if we want to assign this role to member, False otherwise!
    function updateRole(address _memberAddress, uint _roleId, bool _active) public;
uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }

    /// @dev Change Member Address who holds the authority to Add/Delete any member from specific role.
    /// @param _roleId roleId to update its Authorized Address
    /// @param _authorized New authorized address against role id
    function changeAuthorized(uint _roleId, address _authorized) public;
mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }

    /// @dev Return number of member roles
    function totalRoles() public view returns(uint256);
mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }

    /// @dev Gets the member addresses assigned by a specific role
    /// @param _memberRoleId Member role id
    /// @return roleId Role id
    /// @return allMemberAddress Member addresses of specified role id
    function members(uint _memberRoleId) public view returns(uint, address[] memory allMemberAddress);
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

    /// @dev Gets all members' length
    /// @param _memberRoleId Member role id
    /// @return memberRoleData[_memberRoleId].memberAddress.length Member length
    function numberOfMembers(uint _memberRoleId) public view returns(uint);
mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }
    
    /// @dev Return member address who holds the right to add/remove any member from specific role.
    function authorized(uint _memberRoleId) public view returns(address);
mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }

    /// @dev Get All role ids array that has been assigned to a member so far.
    function roles(address _memberAddress) public view returns(uint[] memory assignedRoles);
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }

    /// @dev Returns true if the given role id is assigned to a member.
    /// @param _memberAddress Address of member
    /// @param _roleId Checks member's authenticity with the roleId.
    /// i.e. Returns true if this roleId is assigned to member
    function checkRole(address _memberAddress, uint _roleId) public view returns(bool);
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }   
}

// File: contracts/external/proxy/Proxy.sol

pragma solidity 0.5.7;


/**
 * @title Proxy
 * @dev Gives the possibility to delegate any call to a foreign implementation.
 */
contract Proxy {
    /**
    * @dev Fallback function allowing to perform a delegatecall to the given implementation.
    * This function will return whatever the implementation call returns
    */
    function () external payable {
        address _impl = implementation();
        require(_impl != address(0));

        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
            }
    }
bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }

    /**
    * @dev Tells the address of the implementation where every call will be delegated.
    * @return address of the implementation to which it will be delegated
    */
    function implementation() public view returns (address);
bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
}

// File: contracts/external/proxy/UpgradeabilityProxy.sol

pragma solidity 0.5.7;



/**
 * @title UpgradeabilityProxy
 * @dev This contract represents a proxy where the implementation address to which it will delegate can be upgraded
 */
contract UpgradeabilityProxy is Proxy {
    /**
    * @dev This event will be emitted every time the implementation gets upgraded
    * @param implementation representing the address of the upgraded implementation
    */
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event Upgraded(address indexed implementation);

    // Storage position of the address of the current implementation
    bytes32 private constant IMPLEMENTATION_POSITION = keccak256("org.govblocks.proxy.implementation");

    /**
    * @dev Constructor function
    */
    constructor() public {}
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }

    /**
    * @dev Tells the address of the current implementation
    * @return address of the current implementation
    */
    function implementation() public view returns (address impl) {
        bytes32 position = IMPLEMENTATION_POSITION;
        assembly {
            impl := sload(position)
        }
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
    * @dev Sets the address of the current implementation
    * @param _newImplementation address representing the new implementation to be set
    */
    function _setImplementation(address _newImplementation) internal {
        bytes32 position = IMPLEMENTATION_POSITION;
        assembly {
        sstore(position, _newImplementation)
        }
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

    /**
    * @dev Upgrades the implementation address
    * @param _newImplementation representing the address of the new implementation to be set
    */
    function _upgradeTo(address _newImplementation) internal {
        address currentImplementation = implementation();
        require(currentImplementation != _newImplementation);
        _setImplementation(_newImplementation);
        emit Upgraded(_newImplementation);
    }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
}

// File: contracts/external/proxy/OwnedUpgradeabilityProxy.sol

pragma solidity 0.5.7;



/**
 * @title OwnedUpgradeabilityProxy
 * @dev This contract combines an upgradeability proxy with basic authorization control functionalities
 */
contract OwnedUpgradeabilityProxy is UpgradeabilityProxy {
    /**
    * @dev Event to show ownership has been transferred
    * @param previousOwner representing the address of the previous owner
    * @param newOwner representing the address of the new owner
    */
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event ProxyOwnershipTransferred(address previousOwner, address newOwner);

    // Storage position of the owner of the contract
    bytes32 private constant PROXY_OWNER_POSITION = keccak256("org.govblocks.proxy.owner");

    /**
    * @dev the constructor sets the original owner of the contract to the sender account.
    */
    constructor(address _implementation) public {
        _setUpgradeabilityOwner(msg.sender);
        _upgradeTo(_implementation);
    }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier onlyProxyOwner() {
        require(msg.sender == proxyOwner());
        _;
    }

    /**
    * @dev Tells the address of the owner
    * @return the address of the owner
    */
    function proxyOwner() public view returns (address owner) {
        bytes32 position = PROXY_OWNER_POSITION;
        assembly {
            owner := sload(position)
        }
    }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }

    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param _newOwner The address to transfer ownership to.
    */
    function transferProxyOwnership(address _newOwner) public onlyProxyOwner {
        require(_newOwner != address(0));
        _setUpgradeabilityOwner(_newOwner);
        emit ProxyOwnershipTransferred(proxyOwner(), _newOwner);
    }
uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }

    /**
    * @dev Allows the proxy owner to upgrade the current version of the proxy.
    * @param _implementation representing the address of the new implementation to be set.
    */
    function upgradeTo(address _implementation) public onlyProxyOwner {
        _upgradeTo(_implementation);
    }
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }

    /**
     * @dev Sets the address of the owner
    */
    function _setUpgradeabilityOwner(address _newProxyOwner) internal {
        bytes32 position = PROXY_OWNER_POSITION;
        assembly {
            sstore(position, _newProxyOwner)
        }
    }
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
}

// File: contracts/external/govblocks-protocol/Governed.sol

/* Copyright (C) 2017 GovBlocks.io
  This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
  You should have received a copy of the GNU General Public License
    along with this program.  If not, see http://www.gnu.org/licenses/ */

pragma solidity 0.5.7;


contract IMaster {
    mapping(address => bool) public whitelistedSponsor;
    function dAppToken() public view returns(address);
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }
    function isInternal(address _address) public view returns(bool);
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
    function getLatestAddress(bytes2 _module) public view returns(address);
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }
    function isAuthorizedToGovern(address _toCheck) public view returns(bool);
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }
}


contract Governed {

    address public masterAddress; // Name of the dApp, needs to be set by contracts inheriting this contract

    /// @dev modifier that allows only the authorized addresses to execute the function
    modifier onlyAuthorizedToGovern() {
        IMaster ms = IMaster(masterAddress);
        require(ms.getLatestAddress("GV") == msg.sender, "Not authorized");
        _;
    }

    /// @dev checks if an address is authorized to govern
    function isAuthorizedToGovern(address _toCheck) public view returns(bool) {
        IMaster ms = IMaster(masterAddress);
        return (ms.getLatestAddress("GV") == _toCheck);
    }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    } 

}

// File: contracts/interfaces/Iupgradable.sol

pragma solidity 0.5.7;

contract Iupgradable {

    /**
     * @dev change master address
     */
    function setMasterAddress() public;
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
}

// File: contracts/ProposalCategory.sol

/* Copyright (C) 2020 PlotX.io

  This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

  This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
    along with this program.  If not, see http://www.gnu.org/licenses/ */

pragma solidity 0.5.7;






contract ProposalCategory is Governed, IProposalCategory, Iupgradable {
    bool public constructorCheck;
    IMemberRoles internal mr;

    struct CategoryStruct {
        uint256 memberRoleToVote;
        uint256 majorityVotePerc;
        uint256 quorumPerc;
        uint256[] allowedToCreateProposal;
        uint256 closingTime;
        uint256 minStake;
    }

    struct CategoryAction {
        uint256 defaultIncentive;
        address contractAddress;
        bytes2 contractName;
    }

    CategoryStruct[] internal allCategory;
    mapping(uint256 => CategoryAction) internal categoryActionData;
    mapping(uint256 => bytes) public categoryActionHashes;

    bool public initiated;

    /**
     * @dev Initiates Default settings for Proposal Category contract (Adding default categories)
     */
    function proposalCategoryInitiate() external {
        //solhint-disable-line
        require(!initiated, "Category action hashes already updated");
        initiated = true;

        uint256 advisoryBoardRole = uint256(IMemberRoles.Role.AdvisoryBoard);
        uint256 tokenHolder = uint256(IMemberRoles.Role.TokenHolder);
        uint256 disputeResolutionBoard = uint256(IMemberRoles.Role.DisputeResolution);

        _addInitialCategories("Uncategorized", "", "EX", "", 0, 0);
        _addInitialCategories(
            "Add new member role",
            "QmQFnBep7AyMYU3LJDuHSpTYatnw65XjHzzirrghtZoR8U",
            "MR",
            "addRole(bytes32,string,address)",
            50,
            advisoryBoardRole
        ); //1
        _addInitialCategories(
            "Update member role",
            "QmXMzSViLBJ22P9oj51Zz7isKTRnXWPHZcQ5hzGvvWD3UV",
            "MR",
            "updateRole(address,uint256,bool)",
            50,
            advisoryBoardRole
        ); // 2
        _addInitialCategories(
            "Add new category",
            "QmaVtv7NDR36X2ZEBjCmh1ny4UXKYSHPMfg8peuPLnNc3f",
            "PC",
            "newCategory(string,uint256,uint256,uint256,uint256[],uint256,string,address,bytes2,uint256[],string)",
            50,
            advisoryBoardRole
        ); // 3
        _addInitialCategories(
            "Edit category",
            "QmdmQhGo6hU5HzrNLuoyq2TUh1N3DQ7pT2SkPUhZvnsBYZ",
            "PC",
            "editCategory(uint256,string,uint256,uint256,uint256,uint256[],uint256,string,address,bytes2,uint256[],string)",
            50,
            advisoryBoardRole
        ); //4
        _addInitialCategories(
            "Update Market Implementations",
            "QmbyrHnGgTU9WWFq7DgtRTdpExLg9MqcFRYpWNpo7Ezjd5",
            "PL",
            "updateMarketImplementations(uint256[],address[])",
            60,
            tokenHolder
        ); // 5
        _addInitialCategories(
            "Update contract's Implementation",
            "QmesiuX929bJHmgH8E58L6FWPazcLdgcdjmFzinEdsMfre",
            "PL",
            "upgradeContractImplementation(address,address)",
            60,
            tokenHolder
        ); // 6
        _addInitialCategories(
            "Upgrade multiple contract Implementations",
            "QmcL1jUk7oda2cumSUTCrF6vTSeQN7qd1bYDFdz3v7BbUH",
            "MS",
            "upgradeMultipleImplementations(bytes2[],address[])",
            50,
            tokenHolder
        ); // 7
        _addInitialCategories(
            "Update master Implementation",
            "QmPrGbWA4cuWzZbc9ZmqFmSRSFJnp5sa747wKsJnQkkj4t",
            "MS",
            "upgradeTo(address)",
            50,
            tokenHolder
        ); // 8
        _addInitialCategories(
            "Add new contract",
            "QmXq5Jb4oeNzD2NHBLuWqy2m9J4N1KtkwyirBjkPBRNHii",
            "MS",
            "addNewContract(bytes2,address)",
            50,
            tokenHolder
        );
        _addInitialCategories(
            "Raise Dispute",
            "QmQLKazba2dL8nTtGaoon6DsPv5FcpKqWZPRdxLv2tfUQW",
            "PL",
            "resolveDispute(address,uint256)",
            60,
            disputeResolutionBoard
        );
        _addInitialCategories(
            "Burn Dispute Resolution Member Tokens",
            "QmTV2xSz5R5LVi9VozCyvNgnguq6xEsfVx7JaFbSatVVvQ",
            "TC",
            "burnLockedTokens(address,bytes32,uint256)",
            60,
            tokenHolder
        ); //11
        _addInitialCategories(
            "Swap AB member",
            "QmV5HJMmhkEiHWt5qdNp6AbCqcn9Lw9ASA9efHDKGm8mdh",
            "MR",
            "swapABMember(address,address)",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Update governance parameters",
            "QmTzKKxzpp1E4b8N3ch1kumetYRieEpN7ecTd3MNg4V1T9",
            "GV",
            "updateUintParameters(bytes8,uint256)",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Update Token Controller parameters",
            "QmdVH5FdXbiGbqsj17643KVEEBQ3ciBZnjn9Mj24ehsrGm",
            "TC",
            "updateUintParameters(bytes8,uint256)",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Add new market type",
            "QmPwAdEj6quzB65JWr6hDz6HrLtjTfbezwUiAe6mBq2sxY",
            "PL",
            "addNewMarketType(uint64,uint64,uint64)",
            60,
            tokenHolder
        ); //15
        _addInitialCategories(
            "Add new market currency",
            "QmTu2FnkqUWhhNbeQraSrtbdA4DfGLavTsLRKRCeLV51x1",
            "PL",
            "addNewMarketCurrency(address,uint64)",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Pause Market Creation",
            "QmamFs4k5ZbzajipsbWb4LCaKtyxDUwb9U5dYiNFqExb2W",
            "PL",
            "pauseMarketCreation()",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Resume Market Creation",
            "QmZ9W1gHTJjSnt3ieiNv1Ux6ooX7ngU4Jrpvk3QiiBeP5r",
            "PL",
            "resumeMarketCreation()",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Transfer Market Registry Assets",
            "QmeRCfGJuA6oTqY8a7nuVxdHih2SmZUTaZLVrttGv6yKy5",
            "PL",
            "transferAssets(address,address,uint256)",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Update Market Uint parameters",
            "QmXPXBkSKfidTgbDcRBLqokqAa9SU2wwErTyedPAZPfr5z",
            "PL",
            "updateUintParameters(bytes8,uint256)",
            60,
            tokenHolder
        ); //20
        _addInitialCategories(
            "Update Market Address parameters",
            "QmbbNRchZHMULBbKFT8qjCWgCRPa4qdkst8mE8A2Kffy7N",
            "PL",
            "updateConfigAddressParameters(bytes8,address)",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Update Member roles parameters",
            "QmcG8KXLMTDL5CtiKed12bJxE4ioL7Wn7oXLdW1zYWpf62",
            "MR",
            "updateUintParameters(bytes8,uint256)",
            60,
            tokenHolder
        ); //22
        _addInitialCategories(
            "Whitelist Sponsor",
            "QmRB2twfkzjox4ZAStnZTvtqr7Tr7ByGVdjTziWnpxXmWw",
            "MS",
            "whitelistSponsor(address)",
            60,
            tokenHolder
        );
        _addInitialCategories(
            "Any other item",
            "",
            "EX",
            "",
            60,
            tokenHolder
        );
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
     * @dev Gets Total number of categories added till now
     */
    function totalCategories() external view returns (uint256) {
        return allCategory.length;
    }
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }

    /**
     * @dev Gets category details
     */
    function category(uint256 _categoryId)
        external
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256[] memory,
            uint256,
            uint256
        )
    {
        return (
            _categoryId,
            allCategory[_categoryId].memberRoleToVote,
            allCategory[_categoryId].majorityVotePerc,
            allCategory[_categoryId].quorumPerc,
            allCategory[_categoryId].allowedToCreateProposal,
            allCategory[_categoryId].closingTime,
            allCategory[_categoryId].minStake
        );
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }

    /**
     * @dev Gets the category action details
     * @param _categoryId is the category id in concern
     * @return the category id
     * @return the contract address
     * @return the contract name
     * @return the default incentive
     */
    function categoryAction(uint256 _categoryId)
        external
        view
        returns (
            uint256,
            address,
            bytes2,
            uint256
        )
    {
        return (
            _categoryId,
            categoryActionData[_categoryId].contractAddress,
            categoryActionData[_categoryId].contractName,
            categoryActionData[_categoryId].defaultIncentive
        );
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

    /**
     * @dev Gets the category action details of a category id
     * @param _categoryId is the category id in concern
     * @return the category id
     * @return the contract address
     * @return the contract name
     * @return the default incentive
     * @return action function hash
     */
    function categoryActionDetails(uint256 _categoryId)
        external
        view
        returns (
            uint256,
            address,
            bytes2,
            uint256,
            bytes memory
        )
    {
        return (
            _categoryId,
            categoryActionData[_categoryId].contractAddress,
            categoryActionData[_categoryId].contractName,
            categoryActionData[_categoryId].defaultIncentive,
            categoryActionHashes[_categoryId]
        );
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }

    /**
     * @dev Changes the master address and update it's instance
     */
    function setMasterAddress() public {
        OwnedUpgradeabilityProxy proxy = OwnedUpgradeabilityProxy(
            address(uint160(address(this)))
        );
        require(msg.sender == proxy.proxyOwner(), "Sender is not proxy owner.");

        require(masterAddress == address(0), "Master address already set");
        masterAddress = msg.sender;
        mr = IMemberRoles(IMaster(masterAddress).getLatestAddress("MR"));
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

    /**
     * @dev Adds new category
     * @param _name Category name
     * @param _memberRoleToVote Voting Layer sequence in which the voting has to be performed.
     * @param _majorityVotePerc Majority Vote threshold for Each voting layer
     * @param _quorumPerc minimum threshold percentage required in voting to calculate result
     * @param _allowedToCreateProposal Member roles allowed to create the proposal
     * @param _closingTime Vote closing time for Each voting layer
     * @param _actionHash hash of details containing the action that has to be performed after proposal is accepted
     * @param _contractAddress address of contract to call after proposal is accepted
     * @param _contractName name of contract to be called after proposal is accepted
     * @param _incentives rewards to distributed after proposal is accepted
     * @param _functionHash function signature to be executed
     */
    function newCategory(
        string memory _name,
        uint256 _memberRoleToVote,
        uint256 _majorityVotePerc,
        uint256 _quorumPerc,
        uint256[] memory _allowedToCreateProposal,
        uint256 _closingTime,
        string memory _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint256[] memory _incentives,
        string memory _functionHash
    ) public onlyAuthorizedToGovern {
        require(
            _quorumPerc <= 100 && _majorityVotePerc <= 100,
            "Invalid percentage"
        );

        require(
            (_contractName == "EX" && _contractAddress == address(0)) ||
                bytes(_functionHash).length > 0,
            "Wrong parameters passed"
        );

        _addCategory(
            _name,
            _memberRoleToVote,
            _majorityVotePerc,
            _quorumPerc,
            _allowedToCreateProposal,
            _closingTime,
            _actionHash,
            _contractAddress,
            _contractName,
            _incentives
        );

        bytes memory _encodedHash = abi.encodeWithSignature(_functionHash);
        if (
            bytes(_functionHash).length > 0 &&
            _encodedHash.length == 4
        ) {
            if(keccak256(_encodedHash) == keccak256(abi.encodeWithSignature("resolveDispute(address,uint256)"))) {
                require(_memberRoleToVote == uint256(IMemberRoles.Role.DisputeResolution));
            }
            categoryActionHashes[allCategory.length - 1] = _encodedHash;
        }
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

    /**
     * @dev Updates category details
     * @param _categoryId Category id that needs to be updated
     * @param _name Category name
     * @param _memberRoleToVote Voting Layer sequence in which the voting has to be performed.
     * @param _allowedToCreateProposal Member roles allowed to create the proposal
     * @param _majorityVotePerc Majority Vote threshold for Each voting layer
     * @param _quorumPerc minimum threshold percentage required in voting to calculate result
     * @param _closingTime Vote closing time for Each voting layer
     * @param _actionHash hash of details containing the action that has to be performed after proposal is accepted
     * @param _contractAddress address of contract to call after proposal is accepted
     * @param _contractName name of contract to be called after proposal is accepted
     * @param _incentives rewards to distributed after proposal is accepted
     * @param _functionHash function signature to be executed
     */
    function editCategory(
        uint256 _categoryId,
        string memory _name,
        uint256 _memberRoleToVote,
        uint256 _majorityVotePerc,
        uint256 _quorumPerc,
        uint256[] memory _allowedToCreateProposal,
        uint256 _closingTime,
        string memory _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint256[] memory _incentives,
        string memory _functionHash
    ) public onlyAuthorizedToGovern {
        require(
            _verifyMemberRoles(_memberRoleToVote, _allowedToCreateProposal),
            "Invalid Role"
        );

        require(
            _quorumPerc <= 100 && _majorityVotePerc <= 100,
            "Invalid percentage"
        );

        require(
            (_contractName == "EX" && _contractAddress == address(0)) ||
                bytes(_functionHash).length > 0,
            "Wrong parameters passed"
        );

        delete categoryActionHashes[_categoryId];
        if (
            bytes(_functionHash).length > 0 &&
            abi.encodeWithSignature(_functionHash).length == 4
        ) {
            if(keccak256(abi.encodeWithSignature(_functionHash)) == keccak256(abi.encodeWithSignature("resolveDispute(address,uint256)"))) {
                require(_memberRoleToVote == uint256(IMemberRoles.Role.DisputeResolution));
            }
            categoryActionHashes[_categoryId] = abi.encodeWithSignature(
                _functionHash
            );
        }
        allCategory[_categoryId].memberRoleToVote = _memberRoleToVote;
        allCategory[_categoryId].majorityVotePerc = _majorityVotePerc;
        allCategory[_categoryId].closingTime = _closingTime;
        allCategory[_categoryId]
            .allowedToCreateProposal = _allowedToCreateProposal;
        allCategory[_categoryId].minStake = _incentives[0];
        allCategory[_categoryId].quorumPerc = _quorumPerc;
        categoryActionData[_categoryId].defaultIncentive = _incentives[1];
        categoryActionData[_categoryId].contractName = _contractName;
        categoryActionData[_categoryId].contractAddress = _contractAddress;
        emit Category(_categoryId, _name, _actionHash);
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }

    /**
     * @dev Internal call to add new category
     * @param _name Category name
     * @param _memberRoleToVote Voting Layer sequence in which the voting has to be performed.
     * @param _majorityVotePerc Majority Vote threshold for Each voting layer
     * @param _quorumPerc minimum threshold percentage required in voting to calculate result
     * @param _allowedToCreateProposal Member roles allowed to create the proposal
     * @param _closingTime Vote closing time for Each voting layer
     * @param _actionHash hash of details containing the action that has to be performed after proposal is accepted
     * @param _contractAddress address of contract to call after proposal is accepted
     * @param _contractName name of contract to be called after proposal is accepted
     * @param _incentives rewards to distributed after proposal is accepted
     */
    function _addCategory(
        string memory _name,
        uint256 _memberRoleToVote,
        uint256 _majorityVotePerc,
        uint256 _quorumPerc,
        uint256[] memory _allowedToCreateProposal,
        uint256 _closingTime,
        string memory _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint256[] memory _incentives
    ) internal {
        require(
            _verifyMemberRoles(_memberRoleToVote, _allowedToCreateProposal),
            "Invalid Role"
        );
        allCategory.push(
            CategoryStruct(
                _memberRoleToVote,
                _majorityVotePerc,
                _quorumPerc,
                _allowedToCreateProposal,
                _closingTime,
                _incentives[0]
            )
        );
        uint256 categoryId = allCategory.length - 1;
        categoryActionData[categoryId] = CategoryAction(
            _incentives[1],
            _contractAddress,
            _contractName
        );
        emit Category(categoryId, _name, _actionHash);
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }

    /**
     * @dev Internal call to check if given roles are valid or not
     */
    function _verifyMemberRoles(
        uint256 _memberRoleToVote,
        uint256[] memory _allowedToCreateProposal
    ) internal view returns (bool) {
        uint256 totalRoles = mr.totalRoles();
        if (_memberRoleToVote >= totalRoles) {
            return false;
        }
        for (uint256 i = 0; i < _allowedToCreateProposal.length; i++) {
            if (_allowedToCreateProposal[i] >= totalRoles) {
                return false;
            }
        }
        return true;
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }

    /**
     * @dev to add the initial categories
     * @param _name is category name
     * @param _actionHash hash of category action
     * @param _contractName is the name of contract
     * @param _majorityVotePerc percentage of majority vote
     * @param _memberRoleToVote is the member role the category can vote on
     */
    function _addInitialCategories(
        string memory _name,
        string memory _solutionHash,
        bytes2 _contractName,
        string memory _actionHash,
        uint256 _majorityVotePerc,
        uint256 _memberRoleToVote
    ) internal {
        uint256[] memory allowedToCreateProposal = new uint256[](1);
        uint256[] memory stakeIncentive = new uint256[](2);
        uint256 closingTime = 3 days;
        allowedToCreateProposal[0] = _memberRoleToVote;
        stakeIncentive[0] = 0;
        stakeIncentive[1] = 0;
        if (_memberRoleToVote == uint256(IMemberRoles.Role.DisputeResolution)) {
            stakeIncentive[1] = 100 ether;
            allowedToCreateProposal[0] = uint256(IMemberRoles.Role.TokenHolder);
            closingTime = 2 days;
        }
        if (bytes(_actionHash).length > 0) {
            categoryActionHashes[allCategory.length] = abi.encodeWithSignature(
                _actionHash
            );
        }
        _addCategory(
            _name,
            _memberRoleToVote,
            _majorityVotePerc,
            10,
            allowedToCreateProposal,
            closingTime,
            _solutionHash,
            address(0),
            _contractName,
            stakeIncentive
        );
    }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
}