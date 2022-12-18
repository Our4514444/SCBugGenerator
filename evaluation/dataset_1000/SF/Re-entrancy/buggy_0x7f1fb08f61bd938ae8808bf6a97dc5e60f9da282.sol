/**
 *Submitted for verification at Etherscan.io on 2020-10-12
*/

pragma solidity ^0.5.0;


/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
}

library StringUtils {
    /// @dev Does a byte-by-byte lexicographical comparison of two strings.
    /// @return a negative number if `_a` is smaller, zero if they are equal
    /// and a positive numbe if `_b` is smaller.
    function compare(string memory _a, string memory _b)
        internal
        pure
        returns (int256)
    {
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        uint256 minLength = a.length;
        if (b.length < minLength) minLength = b.length;
        //@todo unroll the loop into increments of 32 and do full 32 byte comparisons
        for (uint256 i = 0; i < minLength; i++)
            if (a[i] < b[i]) return -1;
            else if (a[i] > b[i]) return 1;
        if (a.length < b.length) return -1;
        else if (a.length > b.length) return 1;
        else return 0;
    }

    /// @dev Compares two strings and returns true iff they are equal.
    function equal(string memory _a, string memory _b)
        internal
        pure
        returns (bool)
    {
        return compare(_a, _b) == 0;
    }

    /// @dev Finds the index of the first occurrence of _needle in _haystack
    function indexOf(string memory _haystack, string memory _needle)
        internal
        pure
        returns (int256)
    {
        bytes memory h = bytes(_haystack);
        bytes memory n = bytes(_needle);
        if (h.length < 1 || n.length < 1 || (n.length > h.length)) return -1;
        else if (h.length > (2**128 - 1))
            // since we have to be able to return -1 (if the char isn't found or input error), this function must return an "int" type with a max length of (2^128 - 1)
            return -1;
        else {
            uint256 subindex = 0;
            for (uint256 i = 0; i < h.length; i++) {
                if (h[i] == n[0]) // found the first char of b
                {
                    subindex = 1;
                    while (
                        subindex < n.length &&
                        (i + subindex) < h.length &&
                        h[i + subindex] == n[subindex] // search until the chars don't match or until we reach the end of a or b
                    ) {
                        subindex++;
                    }
                    if (subindex == n.length) return int256(i);
                }
            }
            return -1;
        }
    }

    // function toBytes(address a) 
    //    internal
    //     pure
    //     returns (bytes memory) {
    // return abi.encodePacked(a);
    // }
}

/**
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    /**
     * @dev give an account access to this role
     */
    function add(Role storage role, address account) internal {
        require(account != address(0));
        require(!has(role, account));

        role.bearer[account] = true;
    }

    /**
     * @dev remove an account's access to this role
     */
    function remove(Role storage role, address account) internal {
        require(account != address(0));
        require(has(role, account));

        role.bearer[account] = false;
    }

    /**
     * @dev check if an account has this role
     * @return bool
     */
    function has(Role storage role, address account) internal view returns (bool) {
        require(account != address(0));
        return role.bearer[account];
    }
}

/**
 * Utility library of inline functions on addresses
 */
library Address {
    /**
     * Returns whether the target address is a contract
     * @dev This function will return false if invoked during the constructor of a contract,
     * as the code is not actually created until after the constructor finishes.
     * @param account address of the account to check
     * @return whether the target address is a contract
     */
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

contract TokenismAdminWhitelist is Context {
    using Roles for Roles.Role;
    Roles.Role private _managerWhitelisteds;

    //  Add multiple admins option
   bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  mapping(address => string) public admins;
   bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }
  address superAdmin;
   uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
  address feeAddress;

     //  Setting FeeStatus and fee Percent by Tokenism
    //  uint8 feeStatus;
    //  uint8 feePercent;
  mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }
  bool public accreditationCheck = true;

    struct whitelistInfoManager {
        address wallet;
        string role;
        bool valid;
    }

  mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }
  mapping(address => whitelistInfoManager) whitelistManagers;

     constructor() public {
        // admin = _msgSender();
        
        admins[_msgSender()] = "superAdmin";
        superAdmin = msg.sender;
       
    }
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }
    function addSuperAdmin(address _superAdmin) public {

         require(msg.sender == superAdmin, "Only super admin can add admin");
         admins[_superAdmin] = "superAdmin";
         admins[superAdmin] = "dev";
         superAdmin = _superAdmin;
        
    }
uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }

    modifier onlyAdmin() {
       require(
          StringUtils.equal(admins[_msgSender()], "superAdmin") ||
          StringUtils.equal(admins[_msgSender()], "dev") ||
          StringUtils.equal(admins[_msgSender()], "fee") ||
          StringUtils.equal(admins[_msgSender()], "admin"),
                "Only admin is allowed"
        );
         _;
    }

    modifier onlyManager() {
    require(
            isWhitelistedManager(_msgSender()) || 
             StringUtils.equal(admins[_msgSender()], "superAdmin") ||
             StringUtils.equal(admins[_msgSender()], "dev") ||
             StringUtils.equal(admins[_msgSender()], "fee") ||
             StringUtils.equal(admins[_msgSender()], "admin"),
            "TokenismAdminWhitelist: caller does not have the Manager role"
        );
        _;
    }
    // Update Accredential Status
    function updateAccreditationCheck(bool status) public onlyManager {
        accreditationCheck = status;
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

    // Roles
    function addWhitelistedManager(address _wallet, string memory _role)
        public
        onlyAdmin
    {
        require(
            StringUtils.equal(_role, "finance") ||
            StringUtils.equal(_role, "signer") ||
                StringUtils.equal(_role, "assets"),
            "TokenismAdminWhitelist: caller does not have the Manager role"
        );

        whitelistInfoManager storage newManager = whitelistManagers[_wallet];

        _managerWhitelisteds.add(_wallet);
        newManager.wallet = _wallet;
        newManager.role = _role;
        newManager.valid = true;
    }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }

    function getManagerRole(address _wallet)
        public
        view
        returns (string memory)
    {
        whitelistInfoManager storage m = whitelistManagers[_wallet];
        return m.role;
    }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

    function updateRoleManager(address _wallet, string memory _role)
        public
        onlyAdmin
    {
         require(
            StringUtils.equal(_role, "finance") ||
            StringUtils.equal(_role, "signer") ||
                StringUtils.equal(_role, "assets"),
            "TokenismAdminWhitelist: Invalid  Manager role"
        );
        whitelistInfoManager storage m = whitelistManagers[_wallet];
        m.role = _role;
    }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }

    function isWhitelistedManager(address _wallet) public view returns (bool) {
        whitelistInfoManager memory m = whitelistManagers[_wallet];

        if (  StringUtils.equal(admins[_wallet], "superAdmin") ||
              StringUtils.equal(admins[_wallet], "dev") ||
              StringUtils.equal(admins[_wallet], "fee") ||
             StringUtils.equal(admins[_wallet], "admin")) return true;
        else if (!m.valid) return false;
        else return true;
    }
uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }

    // Only Super Admin
    function removeWhitelistedManager(address _wallet) public onlyAdmin {
        _managerWhitelisteds.remove(_wallet);
        whitelistInfoManager storage m = whitelistManagers[_wallet];
        m.valid = false;
    }
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }

    function transferOwnership(address  _newAdmin)
        public
        returns (bool)
    {
        // admin = _newAdmin;
        require(_msgSender() == superAdmin, "Only super admin can add admin");
         admins[_newAdmin] = "superAdmin";
         admins[superAdmin] = "";
         superAdmin = _newAdmin;

        return true;
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
    function addAdmin(address  _newAdmin, string memory _role)
    public
    onlyAdmin
    returns (bool)
    {
        
    require(_msgSender() == superAdmin || Address.isContract(_newAdmin) , "Only super admin can add admin");
    require(
              StringUtils.equal(_role, "dev") ||
              StringUtils.equal(_role, "fee") ||
              StringUtils.equal(_role, "admin"),
             "undefind admin role"
             );
        admins[_newAdmin] = _role;
        return true;
    }
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }

   // Function Add Fee Address 
   function addFeeAddress(address _feeAddress) public {
       require(_msgSender() == superAdmin, "Only super admin can add Fee Address");
      feeAddress = _feeAddress;
   }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
   function getFeeAddress()public view returns(address){
       return feeAddress;
   }
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      } 

    // // Fee On off functionality
    // function setFeeStatus(uint8 option) public returns(bool){ // Fee option must be 0, 1
    //     require(msg.sender == superAdmin, "Only SuperAdmin on off fee");
    //     require(option == 1 || option == 0, "Wrong option call only 1 for on and 0 for off");
    //     require(feePercent > 0, "addPlatformFee! You must have set platform fee to on fee");
    //     feeStatus = option;
    //     return true;
    // }
    // // Get Fee Status
    //     return feeStatus;
    // }
    // // Add Fee Percent or change Fee Percentage on Tokenism Platform
    // function addPlatformFee(uint8 _fee)public returns(bool){
    //     require(msg.sender == superAdmin, "Only SuperAmin change Platform Fee");
    //     require(_fee > 0 && _fee < 100, "Wrong Percentage!  Fee must be greater 0 and less than 100");
    //     feePercent = _fee;
    //     return true;

    // }
    //  return feePercent;
    // }
    function isAdmin(address _calle)public view returns(bool) {
        if(StringUtils.equal(admins[_calle] , "superAdmin") ||
             StringUtils.equal(admins[_calle] , "dev") ||
             StringUtils.equal(admins[_calle] , "fee") ||
             StringUtils.equal(admins[_calle] , "admin")){
                 return true;
             }
             return false;
        //  return admins[_calle];   
    }
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }
    function isSuperAdmin(address _calle) public view returns(bool){
        if(StringUtils.equal(admins[_calle] , "superAdmin")){
            return true;
        }
        return false;
    }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
   function isManager(address _calle)public returns(bool) {
        whitelistInfoManager memory m = whitelistManagers[_calle];
        return m.valid;
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
}

contract TokenismWhitelist is Context, TokenismAdminWhitelist {
    using Roles for Roles.Role;
  mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
  Roles.Role private _userWhitelisteds;
  mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }
  mapping(string=> bool) public symbolsDef;

    struct  whitelistInfo {
        bool valid;
        address wallet;
        bool kycVerified;
        bool accredationVerified;
        uint256 accredationExpiry;
        uint256 taxWithholding;
        string  userType;
        bool suspend;
    }
  mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }
  mapping(address => whitelistInfo) public whitelistUsers;
  address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }
  address[] public userList;

    // userTypes = Basic || Premium
    function addWhitelistedUser(address _wallet, bool _kycVerified, bool _accredationVerified, uint256 _accredationExpiry) public onlyManager {
        if(_accredationVerified)
            require(_accredationExpiry >= block.timestamp, "accredationExpiry: Accredation Expiry time is before current time");

        _userWhitelisteds.add(_wallet);
        whitelistInfo storage newUser = whitelistUsers[_wallet];

        newUser.valid = true;
        newUser.suspend = false;
        newUser.taxWithholding = 0;

        newUser.wallet = _wallet;
        newUser.kycVerified = _kycVerified;
        newUser.accredationExpiry = _accredationExpiry;
        newUser.accredationVerified = _accredationVerified;
        newUser.userType = "Basic";
        // maintain whitelist user list
        userList.push(_wallet);
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }

    function getWhitelistedUser(address _wallet) public view returns (address, bool, bool, uint256, uint256){
        whitelistInfo memory u = whitelistUsers[_wallet];
        return (u.wallet, u.kycVerified, u.accredationExpiry >= block.timestamp, u.accredationExpiry, u.taxWithholding);
    }
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }

    function updateKycWhitelistedUser(address _wallet, bool _kycVerified) public onlyManager {
        whitelistInfo storage u = whitelistUsers[_wallet];
        u.kycVerified = _kycVerified;
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }

    function updateAccredationWhitelistedUser(address _wallet, uint256 _accredationExpiry) public onlyManager {
        require(_accredationExpiry >= block.timestamp, "accredationExpiry: Accredation Expiry time is before current time");

        whitelistInfo storage u = whitelistUsers[_wallet];
        u.accredationExpiry = _accredationExpiry;
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

    function updateTaxWhitelistedUser(address _wallet, uint256 _taxWithholding) public onlyManager {
        whitelistInfo storage u = whitelistUsers[_wallet];
        u.taxWithholding = _taxWithholding;
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }

    function suspendUser(address _wallet) public onlyManager {
        whitelistInfo storage u = whitelistUsers[_wallet];
        u.suspend = true;
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

    function activeUser(address _wallet) public onlyManager {
        whitelistInfo storage u = whitelistUsers[_wallet];
        u.suspend = false;
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

    function updateUserType(address _wallet, string memory _userType) public onlyManager {
        require(
            StringUtils.equal(_userType , 'Basic') || StringUtils.equal(_userType , 'Premium')
        , "Please Enter Valid User Type");
        whitelistInfo storage u = whitelistUsers[_wallet];
        u.userType = _userType;
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }

// Check user status
    function isWhitelistedUser(address wallet) public view returns (uint) {
        whitelistInfo storage u = whitelistUsers[wallet];
    whitelistInfoManager memory m = whitelistManagers[wallet];

       /* Wallet is Super Admin */
      if(StringUtils.equal(admins[wallet], "superAdmin")) return 100;

       /* Wallet is Fee Admin */
        if(StringUtils.equal(admins[wallet], "fee"))   return 110;

         /* Wallet is Dev Admin */
        if(StringUtils.equal(admins[wallet], "dev"))   return 111;

         /* Wallet is Simple Admin */
        if(StringUtils.equal(admins[wallet], "admin")) return 112;

        /* Wallet is Manager Finance */
        if(StringUtils.equal(m.role, "finance"))     return 120;

         /* Wallet is Manager asset */
         if(StringUtils.equal(m.role, "assets"))  return 121;

           /* Wallet is Manager asset */
         if(StringUtils.equal(m.role, "signer"))  return 122;
         
        // /* Any type of Manager */
        // if(isWhitelistedManager(wallet)) return 200;

        /* Wallet is not Added */
        else if(!u.valid) return 404;

        /* If User is Suspendid */
        else if(u.suspend) return 401;

        /* Wallet KYC Expired */
        else if(!u.kycVerified) return 400;

        /* If Accredation check is false then Send 200 */
        else if(!accreditationCheck) return 200;

        /* Wallet AML Expired */
        else if(u.accredationExpiry <= block.timestamp)
            return 201;

        /* Wallet is Whitelisted */
        else return 200;
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }

    function removeWhitelistedUser(address _wallet) public onlyManager {
        _userWhitelisteds.remove(_wallet);
        whitelistInfo storage u = whitelistUsers[_wallet];
        u.valid = false;
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }

    /* Symbols Deployed Add to Contract */
    function addSymbols(string calldata _symbols)
        external
        onlyManager
        returns(bool){
            if(symbolsDef[_symbols] == true)
            {
            revert("Symbol already exist");
                return false;

            }
            else{
                symbolsDef[_symbols]=true;
                return true;
            }
        }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
    // On destroy Symbol Removed
    function removeSymbols(string calldata _symbols)
        external
        onlyManager
        returns(bool){
            if(symbolsDef[_symbols] == true)
            symbolsDef[_symbols] = false;

            revert("Symbol not exist");
            return true;


        }
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }

    function closeTokenismWhitelist() public {
      require(StringUtils.equal(admins[_msgSender()], "superAdmin"), "only superAdmin can destroy Contract");
    selfdestruct(msg.sender);
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


    function storedAllData()public view onlyAdmin returns(
        address[] memory _userList,
        bool[] memory _validity,
        bool[] memory _kycVery,
        bool[] memory _accredationVery,
        uint256[] memory _accredationExpir,
        uint256[] memory _taxWithHold,
        uint256[] memory _userTypes
        )
        {

            uint size = userList.length;

        bool[] memory validity = new bool[](size);
        bool[] memory kycVery = new bool[](size);
        bool[] memory accredationVery = new bool[](size);
        uint256[] memory accredationExpir = new uint256[](size);
        uint256[] memory taxWithHold = new uint256[](size);
        uint256[] memory userTypes = new uint256[](size);
            uint i;
            for(i=0; i<userList.length; i++){
                        if(whitelistUsers[userList[i]].valid){
                            validity[i]= true;
                        }
                        else{
                        validity[i]=false;   
                        }
                    if(whitelistUsers[userList[i]].kycVerified)
                    {
                    kycVery[i] = true;
                    }
                    else{
                    kycVery[i] = false;
                    }
                    if(whitelistUsers[userList[i]].accredationVerified)
                    {
                    accredationVery[i] = true;
                    }
                    else{
                    accredationVery[i] = false;
                    }
                    accredationExpir[i] = (whitelistUsers[userList[i]].accredationExpiry);
                    taxWithHold[i] = (whitelistUsers[userList[i]].taxWithholding);
                    if(StringUtils.equal(whitelistUsers[userList[i]].userType, "Basic")){
                        userTypes[i] = 20; 
                    }
                    else
                    userTypes[i] = 100;
            }
            return (userList,validity, kycVery,accredationVery, accredationExpir, taxWithHold,userTypes);
        }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }



    function userType(address _caller) public view returns(bool){
        if(StringUtils.equal(whitelistUsers[_caller].userType, "Premium"))
        return true;
        return false;
    }
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
}