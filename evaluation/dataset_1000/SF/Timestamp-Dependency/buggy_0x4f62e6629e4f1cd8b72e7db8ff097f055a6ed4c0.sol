pragma solidity ^0.5.7;


contract ReentrancyGuard {
    uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }

    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter);
    }
}


library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b);

        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0);
        uint256 c = a / b;

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}


interface PrimaryStorage {
    function isPlatformModerator(address who) external view returns (bool);
    function isCommunityModerator(address who) external view returns (bool);
    function getProjectController() external view returns (address);
    function getRefundController() external view returns (address);
    function getDisputeController() external view returns (address);
    function getUtilityController() external view returns (address);
    function getAffiliateEscrow() external view returns (address payable);
    function getRefundPool() external view returns (address payable);
    function getdAppState(bytes32 controllersHash) external view returns (address projectController, address refundController, address disputeController, address maintenanceController);
    function getInsuranceControllerState(uint256 insId) external view returns (bytes32);
    function oldProjectCtrl(bytes32 controllersHash) external view returns (address payable);
    function oldRefundCtrl(bytes32 controllersHash) external view returns (address payable);
    function oldDisputeCtrl(bytes32 cntrllrs) external view  returns (address payable);
    function oldUtilityCtrl(bytes32 cntrllrs) external view  returns (address payable);
    function getIsNetworkDeployed() external view returns (bool);
    function getCurrentControllersHash() external view returns (bytes32 controllerState);
    function getProjectCurrentState(uint256) external view returns (uint8);
    function setEventLogger(address loggerAddress) external;
    function setModerationResources(address payable modResourcesAddr) external;
    function setMainContract(address mainContract) external;
    function setProjectController(address payable controllerAddress) external;
    function setRefundController(address payable controllerAddress) external;
    function setDisputeController(address payable controllerAddress) external;
    function setUtilityController(address payable controllerAddress) external;
    function addNewContract(address payable dAppContractAddress) external;
    function setPlatformModerator(address newPlModAddr) external;
    function setMinInvestorContribution(uint256 newMinInvestorContribution) external;
    function setMaxInvestorContribution(uint256 newMaxInvestorContribution) external;
    function setMinProtectionPercentage(uint256 newPercentage) external;
    function setMaxProtectionPercentage(uint256 newPercentage) external;
    function setMinOwnerContribution(uint256 newMinOwnContrib) external;
    function setDefaultBasePolicyDuration(uint256 newBasePolicyPeriod) external;
    function setDefaultPolicyDuration(uint256 newPolicyPeriod) external;
    function setRegularContributionPercentage(uint256 newPercentage) external;
    function getDisputeProjectId(uint256 disputeId) external view returns (uint256);
    function setValidationToken(address verificatedUser, uint256 validationNumber) external;
    function getDisputeControllerOfProject(uint256 disputeId) external view returns (address);
}


interface SecondaryStorage {
    function getRefundControllerOfProject(uint256 pid) external view returns (address);
    function getDisputeControllerOfProject(uint256 pid) external view returns (address);
    function getUitilityControllerOfProject(uint256 pid) external view returns (address);
    function getProjectControllerOfProject(uint256 pid) external view returns (address);
    function getProjectCurrentState(uint256 pid) external view returns (uint8);
    function getVoteEnd(uint256 pid) external view returns (uint256);
    function getProjectControllerState(uint256 pid) external view returns (bytes32);
    function getUtilityControllerOfProject(uint256 pid) external view returns (address);
}


interface ProjectController {
    function newProject(
				bytes calldata projectName,
				address tokenAddress,
				uint256 crowdsaleEnd,
				uint256 highestCrowdsalePrice,
				uint8 tokenDecimals
		)
				external
				payable;
    function newInsurance(
				address payable insOwner,
				uint256 pid,
				address referrer
		)
				external
				payable
				returns (bool success);
    function newOwnerContribution(uint256 pid, address ownerAddr) external payable;
    function close(uint256 pid) external;
    function setNewProjectTokenPrice(
				uint256 pid,
				uint256 newPrice,
				uint256 insuranceId
		)
				external
				returns (uint256 numberOfChanges);
    function isOpen(uint256 projectId) external returns (bool);
    function upgrade(uint256 insId) external;
}


interface RefundController {
     function cancel(uint256 ins, uint256 pid, address insOwner) external returns (bool);
     function voteForRefundState(address owner, uint256 ins, uint256 pid) external returns (bool);
     function withdraw(address owner, uint256 ins, uint256 pid) external returns (bool);
     function forceRefundState(address moderator, uint256 pid) external;
     function finalizeVote(uint256 pid) external;
}


interface DisputeController {
    function createNewDispute(
				address caller,
				uint256 pid,
				bytes calldata publicDisputeUrl
		)
				external
				payable
				returns (bool);
    function addPublicVote(address voter, uint256 did, bytes32 hiddenVote) external payable returns (bool);
    function decryptVote(address voter, uint256 did, bool isProjectFailed, uint64 pin) external returns (bool);
    function finalizeDispute(uint256 did) external returns (bool);
}


interface UtilityController {
    function withdraw(uint256 pid, address payable owner, uint256 insuranceId) external;
    function withdrawInsuranceFee(uint256 pid, address payable owner, uint256 insuranceId) external;
    function ownerWithdraw(address owner, address sendTo, uint256 pid) external returns (bool);
    function withdrawDisputePayment(address payable caller, uint256 did) external;
    function cancelInvalid(uint256 pid, uint256[8] calldata invalidInsuranceId) external;
    function cancelProjectCovarage(uint256 pid) external;
    function managePolicies(uint256 startFromn, uint256 umberOfProjects) external;
    function voteMaintenance(uint256 startFrom, uint256 numberOfProjects) external;
    function affiliatePayment(address owner) external;
    function removeCanceled(uint256 pid, uint256[8] calldata canceledInsIdx) external;
}


interface AffiliateEscrow {
    function deposit(address affiliate) external payable;
    function getAffiliatePayment (address affiliate) external view returns (uint256);
    function withdraw(address to) external;
    function updateControllerState(
				address payable projectCtrl,
				address payable refundCtrl,
				address payable disputeCtrl,
				address payable utilityCtrl
		)
				external;
}


interface RefundPool {
    function cleanIfNoProjects() external;
}


/**
  *
  *  Refundable Token Offerings - RTO
  *  DAO platform for insurance of investments
  *  in token offerings with a refund option.
  *
  *  Autonomous, open source and completely transparent
  *  dApp for decentralized investment insurances in blockchain
  *  projects (ICOs, STOs, IEOs, etc) managed entirely by smart
  *  contracts and governed by the participants in it.
  *
  */


contract RefundableTokenOffering is ReentrancyGuard {
    using SafeMath for uint256;

    PrimaryStorage    private masterStorage;
    SecondaryStorage  private secondStorage;
    RefundPool        private pool;

    ProjectController private projectController;
    RefundController  private refundController;
    DisputeController private disputeController;
    UtilityController private utilityController;

    AffiliateEscrow private affiliate;

    bytes32 private controllersHash;
    address payable private refundPool;


  uint256 bugv_tmstmp3 = block.timestamp;
  event CommunityAidReceived(address sender, uint256 value);
  uint256 bugv_tmstmp1 = block.timestamp;
  event ControllerUpgrade(address newController);

    constructor(
        address primaryStorage,
        address secondaryStorage,
        address payable refundPoolAddress,
        address payable affiliateEscrow
    )
        public
    {
        masterStorage = PrimaryStorage(primaryStorage);
        secondStorage = SecondaryStorage(secondaryStorage);
        refundPool = refundPoolAddress;
        affiliate = AffiliateEscrow(affiliateEscrow);
    }

    function() external payable {
        emit CommunityAidReceived(msg.sender, msg.value);
    }

    ///////////////////////////////////////////////////
    //  Access modifiers
    //////////////////////////////////////////////////

    modifier onlyModerators {
        if (!masterStorage.isPlatformModerator(msg.sender)) {
            revert("Not allowed");
        }
        _;
    }
uint256 bugv_tmstmp4 = block.timestamp;

    modifier onlyOpen(uint256 pid) {
        if (secondStorage.getProjectCurrentState(pid) == 0) {
            _;
        } else {
            revert("The project is not open");
        }
    }
uint256 bugv_tmstmp5 = block.timestamp;

    modifier onlyExternalAccounts(address sender) {
        if (_isContract(sender)) {
            revert("Not allowed");
        } else {
            _;
        }

    }
uint256 bugv_tmstmp2 = block.timestamp;

    ///////////////////////////////////////////////////
    //  Main View
    //////////////////////////////////////////////////

    function addCoveredProject(
        bytes   memory projectName,
        address tokenAddress,
        uint256 crowdsaleEnd,
        uint256 highestCrowdsalePrice,
        uint8   tokenDecimals
    )
        public
        payable
        onlyModerators
    {
        projectController.newProject.value(msg.value)(
            projectName,
            tokenAddress,
            crowdsaleEnd,
            highestCrowdsalePrice,
            tokenDecimals
        );
    }

    function newInvestmentProtection(uint256 pid, address referrer)
        external
        payable
        nonReentrant
        onlyOpen(pid)
        onlyExternalAccounts(msg.sender)
    {
        ProjectController project = _projectControllerOfProject(pid);
        project.newInsurance.value(msg.value)(msg.sender, pid, referrer);
    }

    function projectOwnerContribution(uint256 pid)
        external
        payable
        nonReentrant
        onlyOpen(pid)
    {
        ProjectController project = _projectControllerOfProject(pid);
        project.newOwnerContribution.value(msg.value)(pid, msg.sender);
    }

    function closeProject(uint256 pid)
        public
        payable
        onlyModerators
    {
        ProjectController project = _projectControllerOfProject(pid);
        project.close(pid);
    }

    function setProjectTokenPrice(uint256 pid, uint256 newPrice, uint256 insuranceId)
        public
        payable
        onlyModerators
    {
        ProjectController project = _projectControllerOfProject(pid);
        project.setNewProjectTokenPrice(pid, newPrice, insuranceId);
    }

    function cancelInsurance(uint256 ins, uint256 pid) external nonReentrant {
        RefundController refund = _refundControllerOfInsurance(ins);
        refund.cancel(ins, pid, msg.sender);
    }

    function voteForRefundState(uint256 ins, uint256 pid) external nonReentrant {
        RefundController refund = _refundControllerOfInsurance(ins);
        refund.voteForRefundState(msg.sender, ins, pid);
    }

    function requestRefundWithdraw(uint256 ins, uint256 pid) external nonReentrant {
        RefundController refund = _refundControllerOfInsurance(ins);
        refund.withdraw(msg.sender, ins, pid);
    }

    function finishInternalVote(uint256 pid) public {
        uint8 pcs = secondStorage.getProjectCurrentState(pid);
        uint256 voteEndDate = secondStorage.getVoteEnd(pid);
        require(pcs == 2 && block.number > voteEndDate, "The project is not in a internal vote period, or it is not finished");
        RefundController refund = _refundControllerOfProject(pid);
        refund.finalizeVote(pid);
    }

    function forceRefundState(uint256 pid) public onlyModerators {
        RefundController refund = _refundControllerOfProject(pid);
        refund.forceRefundState(msg.sender, pid);
    }

    function createPublicDispute(uint256 pid, bytes calldata publicDisputeUrl)
        external
        payable
        nonReentrant
        onlyExternalAccounts(msg.sender)
    {
        DisputeController dispute = _disputeControllerOfProject(pid);
        dispute.createNewDispute.value(msg.value)(msg.sender, pid, publicDisputeUrl);
    }

    function newPublicVote(uint256 did, bytes32 encryptedVote)
        external
        payable
        nonReentrant
        onlyExternalAccounts(msg.sender)
    {
        DisputeController dispute = _disputeControllerOfDispute(did);
        dispute.addPublicVote.value(msg.value)(msg.sender, did, encryptedVote);
    }

    function revealPublicVote(
        uint256 did,
        bool isProjectFailed,
        uint64 pin
    )
        external
        returns (bool)
    {
        DisputeController dispute = _disputeControllerOfDispute(did);
        dispute.decryptVote(msg.sender, did, isProjectFailed, pin);
    }

    function finishPublicDispute(uint256 did)
        external
        nonReentrant
    {
        DisputeController dispute = _disputeControllerOfDispute(did);
        dispute.finalizeDispute(did);
    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}

    function withdrawDisputePayment(uint256 did) external nonReentrant {
        uint256 pid = masterStorage.getDisputeProjectId(did);
        UtilityController utility = _utilityControllerOfProject(pid);
        utility.withdrawDisputePayment(msg.sender, did);
    }
address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}

    function setValidationToken(address verificatedUser, uint256 validationNumber) public onlyModerators {
        masterStorage.setValidationToken(verificatedUser, validationNumber);
    }
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function withdraw(uint256 pid, uint256 insuranceId) external nonReentrant {
        UtilityController utility = _utilityControllerOfInsurance(insuranceId);
        utility.withdraw(pid, msg.sender, insuranceId);
    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function withdrawFee(uint256 pid, uint256 insuranceId) external nonReentrant {
        UtilityController utility = _utilityControllerOfInsurance(insuranceId);
        utility.withdrawInsuranceFee(pid, msg.sender, insuranceId);
    }
address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}

    function affiliatePayment() external nonReentrant {
        affiliate.withdraw(msg.sender);
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function cancelInvalidInsurances(uint256 projectId, uint256[8] memory invalidInsuranceId) public
    {
        UtilityController utility = _utilityControllerOfProject(projectId);
        utility.cancelInvalid(projectId, invalidInsuranceId);
    }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}

    function removeCanceledInsurances(
        uint256 pid,
        uint256[8] memory invalidInsuranceId
    )
        public
    {
        UtilityController utility = _utilityControllerOfProject(pid);
        utility.removeCanceled(pid, invalidInsuranceId);
    }
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function withdrawOwnerFunds(uint256 pid, address sendTo) external nonReentrant returns (bool) {
        UtilityController utility = _utilityControllerOfProject(pid);
        return utility.ownerWithdraw(msg.sender, sendTo, pid);
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

    function cancelProjectCovarage(uint256 pid) public {
        UtilityController utility = _utilityControllerOfProject(pid);
        return utility.cancelProjectCovarage(pid);
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}

    function policyMaintenance(uint256 startFrom, uint256 numberOfProjects) external nonReentrant {
        return utilityController.managePolicies(startFrom, numberOfProjects);
    }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function voteMaintenance(uint256 startFrom, uint256 endBefore) external {
        return utilityController.voteMaintenance(startFrom, endBefore);
    }
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}

    ///////////////////////////////////////////////////
    //  State & Contracts
    //////////////////////////////////////////////////

    function updateControllerState() public onlyModerators {
        projectController = ProjectController(masterStorage.getProjectController());
        refundController  = RefundController(masterStorage.getRefundController());
        disputeController = DisputeController(masterStorage.getDisputeController());
        utilityController = UtilityController(masterStorage.getUtilityController());
        controllersHash   = masterStorage.getCurrentControllersHash();
    }
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}

    function transferAidToRefundPool() public onlyModerators {
        address(refundPool).transfer(address(this).balance);
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}

    function changeModerationResourcesAddress(address payable newModRsrcAddr)
        public
        onlyModerators
    {
        masterStorage.setModerationResources(newModRsrcAddr);
    }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function upgradeEventLogger(address newLogger) public onlyModerators {
        masterStorage.setEventLogger(newLogger);
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function upgradeMain(address payable newMainContract) public onlyModerators {
        masterStorage.setMainContract(newMainContract);
    }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function upgradeUtilityController(address payable newUtilityController)
        public
        onlyModerators
    {
        masterStorage.setUtilityController(newUtilityController);
        emit ControllerUpgrade(newUtilityController);
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

    function upgradeDisputeController(address payable newDisputeController)
        public
        onlyModerators
    {
        masterStorage.setDisputeController(newDisputeController);
        emit ControllerUpgrade(newDisputeController);

    }
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function upgradeRefundController(address payable newRefundController)
        public
        onlyModerators
    {
        masterStorage.setRefundController(newRefundController);
        emit ControllerUpgrade(newRefundController);

    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

    function upgradeProjectController(address payable newProjectController)
        public
        onlyModerators
    {
        masterStorage.setProjectController(newProjectController);
        emit ControllerUpgrade(newProjectController);
    }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function addNetworkContract(address payable newNetworkContract)
        public
        onlyModerators
    {
        masterStorage.addNewContract(newNetworkContract);
    }
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function setPlatformModerator(address newMod) public onlyModerators {
        masterStorage.setPlatformModerator(newMod);
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function setMinInvestorContribution(uint256 newMinInvestorContr) public onlyModerators {
        masterStorage.setMinInvestorContribution(newMinInvestorContr);
    }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

    function setMaxInvestorContribution(uint256 newMaxInvestorContr) public onlyModerators {
        masterStorage.setMaxInvestorContribution(newMaxInvestorContr);
    }
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function setMinProtectionPercentage(uint256 newPercentage) public onlyModerators {
        masterStorage.setMinProtectionPercentage(newPercentage);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    function setMaxProtectionPercentage(uint256 newPercentage) public onlyModerators
    {
        masterStorage.setMaxProtectionPercentage(newPercentage);
    }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function setMinOwnerContribution(uint256 newMinOwnContrib) public onlyModerators {
        masterStorage.setMinOwnerContribution(newMinOwnContrib);
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    function setDefaultBasePolicy(uint256 newBasePolicy) public onlyModerators {
        masterStorage.setDefaultBasePolicyDuration(newBasePolicy);
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function setDefaultPolicy(uint256 newPolicy) public onlyModerators {
        masterStorage.setDefaultPolicyDuration(newPolicy);
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function setRegularContributionPercentage(uint256 newPercentage) public onlyModerators {
        masterStorage.setRegularContributionPercentage(newPercentage);
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function cleanIfNoProjects() public onlyModerators {
        pool.cleanIfNoProjects();
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function _projectControllerOfProject(uint256 pid)
        internal
        view
        returns (ProjectController)
    {
        return ProjectController(secondStorage.getProjectControllerOfProject(pid));
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    function _refundControllerOfProject(uint256 pid)
        internal
        view
        returns (RefundController)
    {
        return RefundController(secondStorage.getRefundControllerOfProject(pid));
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    function _disputeControllerOfProject(uint256 pid)
        internal
        view
        returns (DisputeController)
    {
        return DisputeController(secondStorage.getDisputeControllerOfProject(pid));
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    function _disputeControllerOfDispute(uint256 did)
        internal
        view
        returns (DisputeController)
    {
        return DisputeController(masterStorage.getDisputeControllerOfProject(did));
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function _utilityControllerOfProject(uint256 pid)
        internal
        view
        returns (UtilityController)
    {
        return UtilityController(secondStorage.getUtilityControllerOfProject(pid));
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

    function _refundControllerOfInsurance(uint256 ins)
        internal
        view
        returns (RefundController) {
        bytes32 insCtrlState = masterStorage.getInsuranceControllerState(ins);

        if (controllersHash != insCtrlState) {
            return RefundController(masterStorage.oldRefundCtrl(insCtrlState));
        } else {
            return refundController;
        }
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

    function _utilityControllerOfInsurance(uint256 ins)
        internal
        view
        returns (UtilityController) {
        bytes32 insCtrlState = masterStorage.getInsuranceControllerState(ins);

        if (controllersHash != insCtrlState) {
            return UtilityController(masterStorage.oldUtilityCtrl(insCtrlState));
        } else {
            return utilityController;
        }
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function _isContract(address sender) internal view returns (bool) {
        uint codeSize;
        assembly {
            codeSize := extcodesize(sender)
        }
        return(codeSize != 0);
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}