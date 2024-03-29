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

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
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
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

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
function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
    
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
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
    
    /** @dev Gets Total number of categories added till now
    */
    function totalCategories() external view returns(uint numberOfCategories);
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

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
function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
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
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

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

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event MemberRole(uint256 indexed roleId, bytes32 roleName, string roleDescription);
    
    enum Role {UnAssigned, AdvisoryBoard, TokenHolder, DisputeResolution}

    function setInititorAddress(address _initiator) external;
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    /// @dev Adds new member role
    /// @param _roleName New role name
    /// @param _roleDescription New description hash
    /// @param _authorized Authorized member against every role id
    function addRole(bytes32 _roleName, string memory _roleDescription, address _authorized) public;
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

    /// @dev Assign or Delete a member from specific role.
    /// @param _memberAddress Address of Member
    /// @param _roleId RoleId to update
    /// @param _active active is set to be True if we want to assign this role to member, False otherwise!
    function updateRole(address _memberAddress, uint _roleId, bool _active) public;
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    /// @dev Change Member Address who holds the authority to Add/Delete any member from specific role.
    /// @param _roleId roleId to update its Authorized Address
    /// @param _authorized New authorized address against role id
    function changeAuthorized(uint _roleId, address _authorized) public;
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    /// @dev Return number of member roles
    function totalRoles() public view returns(uint256);
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /// @dev Gets the member addresses assigned by a specific role
    /// @param _memberRoleId Member role id
    /// @return roleId Role id
    /// @return allMemberAddress Member addresses of specified role id
    function members(uint _memberRoleId) public view returns(uint, address[] memory allMemberAddress);
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    /// @dev Gets all members' length
    /// @param _memberRoleId Member role id
    /// @return memberRoleData[_memberRoleId].memberAddress.length Member length
    function numberOfMembers(uint _memberRoleId) public view returns(uint);
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
    
    /// @dev Return member address who holds the right to add/remove any member from specific role.
    function authorized(uint _memberRoleId) public view returns(address);
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

    /// @dev Get All role ids array that has been assigned to a member so far.
    function roles(address _memberAddress) public view returns(uint[] memory assignedRoles);
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

    /// @dev Returns true if the given role id is assigned to a member.
    /// @param _memberAddress Address of member
    /// @param _roleId Checks member's authenticity with the roleId.
    /// i.e. Returns true if this roleId is assigned to member
    function checkRole(address _memberAddress, uint _roleId) public view returns(bool);
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
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
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

    /**
    * @dev Tells the address of the implementation where every call will be delegated.
    * @return address of the implementation to which it will be delegated
    */
    function implementation() public view returns (address);
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
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
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Upgraded(address indexed implementation);

    // Storage position of the address of the current implementation
    bytes32 private constant IMPLEMENTATION_POSITION = keccak256("org.govblocks.proxy.implementation");

    /**
    * @dev Constructor function
    */
    constructor() public {}
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
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
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
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
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
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
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
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
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
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
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
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
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
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
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    /**
    * @dev Allows the proxy owner to upgrade the current version of the proxy.
    * @param _implementation representing the address of the new implementation to be set.
    */
    function upgradeTo(address _implementation) public onlyProxyOwner {
        _upgradeTo(_implementation);
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
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
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
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
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
    function isInternal(address _address) public view returns(bool);
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function getLatestAddress(bytes2 _module) public view returns(address);
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function isAuthorizedToGovern(address _toCheck) public view returns(bool);
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
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
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    } 

}

// File: contracts/interfaces/Iupgradable.sol

pragma solidity 0.5.7;

contract Iupgradable {

    /**
     * @dev change master address
     */
    function setMasterAddress() public;
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
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
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /**
     * @dev Gets Total number of categories added till now
     */
    function totalCategories() external view returns (uint256) {
        return allCategory.length;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
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
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
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
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
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
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
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
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
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
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
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
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
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
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
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
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
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
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
}