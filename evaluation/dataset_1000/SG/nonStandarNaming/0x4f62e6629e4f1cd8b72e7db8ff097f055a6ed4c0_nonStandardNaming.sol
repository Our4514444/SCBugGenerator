pragma solidity ^0.5.7;


contract ReentrancyGuard {
    uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }

    modifier NONREENTRANT915() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter);
    }
}


library SafeMath {
    function MUL841(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b);

        return c;
    }
    function DIV213(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0);
        uint256 c = a / b;

        return c;
    }

    function SUB669(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }
    function ADD572(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
    function MOD427(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


interface PrimaryStorage {
    function ISPLATFORMMODERATOR294(address who) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISCOMMUNITYMODERATOR611(address who) external view returns (bool);	//inject NONSTANDARD NAMING
    function GETPROJECTCONTROLLER829() external view returns (address);	//inject NONSTANDARD NAMING
    function GETREFUNDCONTROLLER65() external view returns (address);	//inject NONSTANDARD NAMING
    function GETDISPUTECONTROLLER365() external view returns (address);	//inject NONSTANDARD NAMING
    function GETUTILITYCONTROLLER409() external view returns (address);	//inject NONSTANDARD NAMING
    function GETAFFILIATEESCROW503() external view returns (address payable);	//inject NONSTANDARD NAMING
    function GETREFUNDPOOL490() external view returns (address payable);	//inject NONSTANDARD NAMING
    function GETDAPPSTATE400(bytes32 controllersHash) external view returns (address projectController, address refundController, address disputeController, address maintenanceController);	//inject NONSTANDARD NAMING
    function GETINSURANCECONTROLLERSTATE97(uint256 insId) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function OLDPROJECTCTRL957(bytes32 controllersHash) external view returns (address payable);	//inject NONSTANDARD NAMING
    function OLDREFUNDCTRL414(bytes32 controllersHash) external view returns (address payable);	//inject NONSTANDARD NAMING
    function OLDDISPUTECTRL751(bytes32 cntrllrs) external view  returns (address payable);	//inject NONSTANDARD NAMING
    function OLDUTILITYCTRL283(bytes32 cntrllrs) external view  returns (address payable);	//inject NONSTANDARD NAMING
    function GETISNETWORKDEPLOYED840() external view returns (bool);	//inject NONSTANDARD NAMING
    function GETCURRENTCONTROLLERSHASH82() external view returns (bytes32 controllerState);	//inject NONSTANDARD NAMING
    function GETPROJECTCURRENTSTATE7(uint256) external view returns (uint8);	//inject NONSTANDARD NAMING
    function SETEVENTLOGGER507(address loggerAddress) external;	//inject NONSTANDARD NAMING
    function SETMODERATIONRESOURCES383(address payable modResourcesAddr) external;	//inject NONSTANDARD NAMING
    function SETMAINCONTRACT321(address mainContract) external;	//inject NONSTANDARD NAMING
    function SETPROJECTCONTROLLER855(address payable controllerAddress) external;	//inject NONSTANDARD NAMING
    function SETREFUNDCONTROLLER108(address payable controllerAddress) external;	//inject NONSTANDARD NAMING
    function SETDISPUTECONTROLLER875(address payable controllerAddress) external;	//inject NONSTANDARD NAMING
    function SETUTILITYCONTROLLER751(address payable controllerAddress) external;	//inject NONSTANDARD NAMING
    function ADDNEWCONTRACT183(address payable dAppContractAddress) external;	//inject NONSTANDARD NAMING
    function SETPLATFORMMODERATOR546(address newPlModAddr) external;	//inject NONSTANDARD NAMING
    function SETMININVESTORCONTRIBUTION375(uint256 newMinInvestorContribution) external;	//inject NONSTANDARD NAMING
    function SETMAXINVESTORCONTRIBUTION398(uint256 newMaxInvestorContribution) external;	//inject NONSTANDARD NAMING
    function SETMINPROTECTIONPERCENTAGE427(uint256 newPercentage) external;	//inject NONSTANDARD NAMING
    function SETMAXPROTECTIONPERCENTAGE139(uint256 newPercentage) external;	//inject NONSTANDARD NAMING
    function SETMINOWNERCONTRIBUTION860(uint256 newMinOwnContrib) external;	//inject NONSTANDARD NAMING
    function SETDEFAULTBASEPOLICYDURATION853(uint256 newBasePolicyPeriod) external;	//inject NONSTANDARD NAMING
    function SETDEFAULTPOLICYDURATION210(uint256 newPolicyPeriod) external;	//inject NONSTANDARD NAMING
    function SETREGULARCONTRIBUTIONPERCENTAGE702(uint256 newPercentage) external;	//inject NONSTANDARD NAMING
    function GETDISPUTEPROJECTID387(uint256 disputeId) external view returns (uint256);	//inject NONSTANDARD NAMING
    function SETVALIDATIONTOKEN72(address verificatedUser, uint256 validationNumber) external;	//inject NONSTANDARD NAMING
    function GETDISPUTECONTROLLEROFPROJECT220(uint256 disputeId) external view returns (address);	//inject NONSTANDARD NAMING
}


interface SecondaryStorage {
    function GETREFUNDCONTROLLEROFPROJECT742(uint256 pid) external view returns (address);	//inject NONSTANDARD NAMING
    function GETDISPUTECONTROLLEROFPROJECT220(uint256 pid) external view returns (address);	//inject NONSTANDARD NAMING
    function GETUITILITYCONTROLLEROFPROJECT934(uint256 pid) external view returns (address);	//inject NONSTANDARD NAMING
    function GETPROJECTCONTROLLEROFPROJECT308(uint256 pid) external view returns (address);	//inject NONSTANDARD NAMING
    function GETPROJECTCURRENTSTATE7(uint256 pid) external view returns (uint8);	//inject NONSTANDARD NAMING
    function GETVOTEEND418(uint256 pid) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPROJECTCONTROLLERSTATE453(uint256 pid) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETUTILITYCONTROLLEROFPROJECT273(uint256 pid) external view returns (address);	//inject NONSTANDARD NAMING
}


interface ProjectController {
    function NEWPROJECT431(	//inject NONSTANDARD NAMING
				bytes calldata projectName,
				address tokenAddress,
				uint256 crowdsaleEnd,
				uint256 highestCrowdsalePrice,
				uint8 tokenDecimals
		)
				external
				payable;
    function NEWINSURANCE522(	//inject NONSTANDARD NAMING
				address payable insOwner,
				uint256 pid,
				address referrer
		)
				external
				payable
				returns (bool success);
    function NEWOWNERCONTRIBUTION915(uint256 pid, address ownerAddr) external payable;	//inject NONSTANDARD NAMING
    function CLOSE39(uint256 pid) external;	//inject NONSTANDARD NAMING
    function SETNEWPROJECTTOKENPRICE948(	//inject NONSTANDARD NAMING
				uint256 pid,
				uint256 newPrice,
				uint256 insuranceId
		)
				external
				returns (uint256 numberOfChanges);
    function ISOPEN865(uint256 projectId) external returns (bool);	//inject NONSTANDARD NAMING
    function UPGRADE742(uint256 insId) external;	//inject NONSTANDARD NAMING
}


interface RefundController {
     function CANCEL307(uint256 ins, uint256 pid, address insOwner) external returns (bool);	//inject NONSTANDARD NAMING
     function VOTEFORREFUNDSTATE767(address owner, uint256 ins, uint256 pid) external returns (bool);	//inject NONSTANDARD NAMING
     function WITHDRAW843(address owner, uint256 ins, uint256 pid) external returns (bool);	//inject NONSTANDARD NAMING
     function FORCEREFUNDSTATE997(address moderator, uint256 pid) external;	//inject NONSTANDARD NAMING
     function FINALIZEVOTE141(uint256 pid) external;	//inject NONSTANDARD NAMING
}


interface DisputeController {
    function CREATENEWDISPUTE136(	//inject NONSTANDARD NAMING
				address caller,
				uint256 pid,
				bytes calldata publicDisputeUrl
		)
				external
				payable
				returns (bool);
    function ADDPUBLICVOTE685(address voter, uint256 did, bytes32 hiddenVote) external payable returns (bool);	//inject NONSTANDARD NAMING
    function DECRYPTVOTE696(address voter, uint256 did, bool isProjectFailed, uint64 pin) external returns (bool);	//inject NONSTANDARD NAMING
    function FINALIZEDISPUTE613(uint256 did) external returns (bool);	//inject NONSTANDARD NAMING
}


interface UtilityController {
    function WITHDRAW843(uint256 pid, address payable owner, uint256 insuranceId) external;	//inject NONSTANDARD NAMING
    function WITHDRAWINSURANCEFEE240(uint256 pid, address payable owner, uint256 insuranceId) external;	//inject NONSTANDARD NAMING
    function OWNERWITHDRAW361(address owner, address sendTo, uint256 pid) external returns (bool);	//inject NONSTANDARD NAMING
    function WITHDRAWDISPUTEPAYMENT214(address payable caller, uint256 did) external;	//inject NONSTANDARD NAMING
    function CANCELINVALID272(uint256 pid, uint256[8] calldata invalidInsuranceId) external;	//inject NONSTANDARD NAMING
    function CANCELPROJECTCOVARAGE690(uint256 pid) external;	//inject NONSTANDARD NAMING
    function MANAGEPOLICIES606(uint256 startFromn, uint256 umberOfProjects) external;	//inject NONSTANDARD NAMING
    function VOTEMAINTENANCE570(uint256 startFrom, uint256 numberOfProjects) external;	//inject NONSTANDARD NAMING
    function AFFILIATEPAYMENT87(address owner) external;	//inject NONSTANDARD NAMING
    function REMOVECANCELED730(uint256 pid, uint256[8] calldata canceledInsIdx) external;	//inject NONSTANDARD NAMING
}


interface AffiliateEscrow {
    function DEPOSIT997(address affiliate) external payable;	//inject NONSTANDARD NAMING
    function GETAFFILIATEPAYMENT119 (address affiliate) external view returns (uint256);	//inject NONSTANDARD NAMING
    function WITHDRAW843(address to) external;	//inject NONSTANDARD NAMING
    function UPDATECONTROLLERSTATE610(	//inject NONSTANDARD NAMING
				address payable projectCtrl,
				address payable refundCtrl,
				address payable disputeCtrl,
				address payable utilityCtrl
		)
				external;
}


interface RefundPool {
    function CLEANIFNOPROJECTS989() external;	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                      


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


    event COMMUNITYAIDRECEIVED732(address sender, uint256 value);	//inject NONSTANDARD NAMING
    event CONTROLLERUPGRADE662(address newController);	//inject NONSTANDARD NAMING

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
        emit COMMUNITYAIDRECEIVED732(msg.sender, msg.value);
    }

                                                       
    //  Access modifiers
                                                      

    modifier ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        if (!masterStorage.ISPLATFORMMODERATOR294(msg.sender)) {
            revert("Not allowed");
        }
        _;
    }

    modifier ONLYOPEN319(uint256 pid) {	//inject NONSTANDARD NAMING
        if (secondStorage.GETPROJECTCURRENTSTATE7(pid) == 0) {
            _;
        } else {
            revert("The project is not open");
        }
    }

    modifier ONLYEXTERNALACCOUNTS749(address sender) {	//inject NONSTANDARD NAMING
        if (_ISCONTRACT442(sender)) {
            revert("Not allowed");
        } else {
            _;
        }

    }

                                                       
    //  Main View
                                                      

    function ADDCOVEREDPROJECT694(	//inject NONSTANDARD NAMING
        bytes   memory projectName,
        address tokenAddress,
        uint256 crowdsaleEnd,
        uint256 highestCrowdsalePrice,
        uint8   tokenDecimals
    )
        public
        payable
        ONLYMODERATORS745
    {
        projectController.NEWPROJECT431.value(msg.value)(
            projectName,
            tokenAddress,
            crowdsaleEnd,
            highestCrowdsalePrice,
            tokenDecimals
        );
    }

    function NEWINVESTMENTPROTECTION928(uint256 pid, address referrer)	//inject NONSTANDARD NAMING
        external
        payable
        NONREENTRANT915
        ONLYOPEN319(pid)
        ONLYEXTERNALACCOUNTS749(msg.sender)
    {
        ProjectController project = _PROJECTCONTROLLEROFPROJECT532(pid);
        project.NEWINSURANCE522.value(msg.value)(msg.sender, pid, referrer);
    }

    function PROJECTOWNERCONTRIBUTION471(uint256 pid)	//inject NONSTANDARD NAMING
        external
        payable
        NONREENTRANT915
        ONLYOPEN319(pid)
    {
        ProjectController project = _PROJECTCONTROLLEROFPROJECT532(pid);
        project.NEWOWNERCONTRIBUTION915.value(msg.value)(pid, msg.sender);
    }

    function CLOSEPROJECT375(uint256 pid)	//inject NONSTANDARD NAMING
        public
        payable
        ONLYMODERATORS745
    {
        ProjectController project = _PROJECTCONTROLLEROFPROJECT532(pid);
        project.CLOSE39(pid);
    }

    function SETPROJECTTOKENPRICE897(uint256 pid, uint256 newPrice, uint256 insuranceId)	//inject NONSTANDARD NAMING
        public
        payable
        ONLYMODERATORS745
    {
        ProjectController project = _PROJECTCONTROLLEROFPROJECT532(pid);
        project.SETNEWPROJECTTOKENPRICE948(pid, newPrice, insuranceId);
    }

    function CANCELINSURANCE107(uint256 ins, uint256 pid) external NONREENTRANT915 {	//inject NONSTANDARD NAMING
        RefundController refund = _REFUNDCONTROLLEROFINSURANCE211(ins);
        refund.CANCEL307(ins, pid, msg.sender);
    }

    function VOTEFORREFUNDSTATE767(uint256 ins, uint256 pid) external NONREENTRANT915 {	//inject NONSTANDARD NAMING
        RefundController refund = _REFUNDCONTROLLEROFINSURANCE211(ins);
        refund.VOTEFORREFUNDSTATE767(msg.sender, ins, pid);
    }

    function REQUESTREFUNDWITHDRAW557(uint256 ins, uint256 pid) external NONREENTRANT915 {	//inject NONSTANDARD NAMING
        RefundController refund = _REFUNDCONTROLLEROFINSURANCE211(ins);
        refund.WITHDRAW843(msg.sender, ins, pid);
    }

    function FINISHINTERNALVOTE911(uint256 pid) public {	//inject NONSTANDARD NAMING
        uint8 pcs = secondStorage.GETPROJECTCURRENTSTATE7(pid);
        uint256 voteEndDate = secondStorage.GETVOTEEND418(pid);
        require(pcs == 2 && block.number > voteEndDate, "The project is not in a internal vote period, or it is not finished");
        RefundController refund = _REFUNDCONTROLLEROFPROJECT429(pid);
        refund.FINALIZEVOTE141(pid);
    }

    function FORCEREFUNDSTATE997(uint256 pid) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        RefundController refund = _REFUNDCONTROLLEROFPROJECT429(pid);
        refund.FORCEREFUNDSTATE997(msg.sender, pid);
    }

    function CREATEPUBLICDISPUTE373(uint256 pid, bytes calldata publicDisputeUrl)	//inject NONSTANDARD NAMING
        external
        payable
        NONREENTRANT915
        ONLYEXTERNALACCOUNTS749(msg.sender)
    {
        DisputeController dispute = _DISPUTECONTROLLEROFPROJECT703(pid);
        dispute.CREATENEWDISPUTE136.value(msg.value)(msg.sender, pid, publicDisputeUrl);
    }

    function NEWPUBLICVOTE762(uint256 did, bytes32 encryptedVote)	//inject NONSTANDARD NAMING
        external
        payable
        NONREENTRANT915
        ONLYEXTERNALACCOUNTS749(msg.sender)
    {
        DisputeController dispute = _DISPUTECONTROLLEROFDISPUTE825(did);
        dispute.ADDPUBLICVOTE685.value(msg.value)(msg.sender, did, encryptedVote);
    }

    function REVEALPUBLICVOTE877(	//inject NONSTANDARD NAMING
        uint256 did,
        bool isProjectFailed,
        uint64 pin
    )
        external
        returns (bool)
    {
        DisputeController dispute = _DISPUTECONTROLLEROFDISPUTE825(did);
        dispute.DECRYPTVOTE696(msg.sender, did, isProjectFailed, pin);
    }

    function FINISHPUBLICDISPUTE684(uint256 did)	//inject NONSTANDARD NAMING
        external
        NONREENTRANT915
    {
        DisputeController dispute = _DISPUTECONTROLLEROFDISPUTE825(did);
        dispute.FINALIZEDISPUTE613(did);
    }

    function WITHDRAWDISPUTEPAYMENT214(uint256 did) external NONREENTRANT915 {	//inject NONSTANDARD NAMING
        uint256 pid = masterStorage.GETDISPUTEPROJECTID387(did);
        UtilityController utility = _UTILITYCONTROLLEROFPROJECT795(pid);
        utility.WITHDRAWDISPUTEPAYMENT214(msg.sender, did);
    }

    function SETVALIDATIONTOKEN72(address verificatedUser, uint256 validationNumber) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETVALIDATIONTOKEN72(verificatedUser, validationNumber);
    }

    function WITHDRAW843(uint256 pid, uint256 insuranceId) external NONREENTRANT915 {	//inject NONSTANDARD NAMING
        UtilityController utility = _UTILITYCONTROLLEROFINSURANCE609(insuranceId);
        utility.WITHDRAW843(pid, msg.sender, insuranceId);
    }

    function WITHDRAWFEE336(uint256 pid, uint256 insuranceId) external NONREENTRANT915 {	//inject NONSTANDARD NAMING
        UtilityController utility = _UTILITYCONTROLLEROFINSURANCE609(insuranceId);
        utility.WITHDRAWINSURANCEFEE240(pid, msg.sender, insuranceId);
    }

    function AFFILIATEPAYMENT87() external NONREENTRANT915 {	//inject NONSTANDARD NAMING
        affiliate.WITHDRAW843(msg.sender);
    }

    function CANCELINVALIDINSURANCES942(uint256 projectId, uint256[8] memory invalidInsuranceId) public	//inject NONSTANDARD NAMING
    {
        UtilityController utility = _UTILITYCONTROLLEROFPROJECT795(projectId);
        utility.CANCELINVALID272(projectId, invalidInsuranceId);
    }

    function REMOVECANCELEDINSURANCES764(	//inject NONSTANDARD NAMING
        uint256 pid,
        uint256[8] memory invalidInsuranceId
    )
        public
    {
        UtilityController utility = _UTILITYCONTROLLEROFPROJECT795(pid);
        utility.REMOVECANCELED730(pid, invalidInsuranceId);
    }

    function WITHDRAWOWNERFUNDS760(uint256 pid, address sendTo) external NONREENTRANT915 returns (bool) {	//inject NONSTANDARD NAMING
        UtilityController utility = _UTILITYCONTROLLEROFPROJECT795(pid);
        return utility.OWNERWITHDRAW361(msg.sender, sendTo, pid);
    }

    function CANCELPROJECTCOVARAGE690(uint256 pid) public {	//inject NONSTANDARD NAMING
        UtilityController utility = _UTILITYCONTROLLEROFPROJECT795(pid);
        return utility.CANCELPROJECTCOVARAGE690(pid);
    }

    function POLICYMAINTENANCE359(uint256 startFrom, uint256 numberOfProjects) external NONREENTRANT915 {	//inject NONSTANDARD NAMING
        return utilityController.MANAGEPOLICIES606(startFrom, numberOfProjects);
    }

    function VOTEMAINTENANCE570(uint256 startFrom, uint256 endBefore) external {	//inject NONSTANDARD NAMING
        return utilityController.VOTEMAINTENANCE570(startFrom, endBefore);
    }

                                                       
    //  State & Contracts
                                                      

    function UPDATECONTROLLERSTATE610() public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        projectController = ProjectController(masterStorage.GETPROJECTCONTROLLER829());
        refundController  = RefundController(masterStorage.GETREFUNDCONTROLLER65());
        disputeController = DisputeController(masterStorage.GETDISPUTECONTROLLER365());
        utilityController = UtilityController(masterStorage.GETUTILITYCONTROLLER409());
        controllersHash   = masterStorage.GETCURRENTCONTROLLERSHASH82();
    }

    function TRANSFERAIDTOREFUNDPOOL222() public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        address(refundPool).transfer(address(this).balance);
    }

    function CHANGEMODERATIONRESOURCESADDRESS148(address payable newModRsrcAddr)	//inject NONSTANDARD NAMING
        public
        ONLYMODERATORS745
    {
        masterStorage.SETMODERATIONRESOURCES383(newModRsrcAddr);
    }

    function UPGRADEEVENTLOGGER179(address newLogger) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETEVENTLOGGER507(newLogger);
    }

    function UPGRADEMAIN990(address payable newMainContract) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETMAINCONTRACT321(newMainContract);
    }

    function UPGRADEUTILITYCONTROLLER522(address payable newUtilityController)	//inject NONSTANDARD NAMING
        public
        ONLYMODERATORS745
    {
        masterStorage.SETUTILITYCONTROLLER751(newUtilityController);
        emit CONTROLLERUPGRADE662(newUtilityController);
    }

    function UPGRADEDISPUTECONTROLLER237(address payable newDisputeController)	//inject NONSTANDARD NAMING
        public
        ONLYMODERATORS745
    {
        masterStorage.SETDISPUTECONTROLLER875(newDisputeController);
        emit CONTROLLERUPGRADE662(newDisputeController);

    }

    function UPGRADEREFUNDCONTROLLER563(address payable newRefundController)	//inject NONSTANDARD NAMING
        public
        ONLYMODERATORS745
    {
        masterStorage.SETREFUNDCONTROLLER108(newRefundController);
        emit CONTROLLERUPGRADE662(newRefundController);

    }

    function UPGRADEPROJECTCONTROLLER874(address payable newProjectController)	//inject NONSTANDARD NAMING
        public
        ONLYMODERATORS745
    {
        masterStorage.SETPROJECTCONTROLLER855(newProjectController);
        emit CONTROLLERUPGRADE662(newProjectController);
    }

    function ADDNETWORKCONTRACT185(address payable newNetworkContract)	//inject NONSTANDARD NAMING
        public
        ONLYMODERATORS745
    {
        masterStorage.ADDNEWCONTRACT183(newNetworkContract);
    }

    function SETPLATFORMMODERATOR546(address newMod) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETPLATFORMMODERATOR546(newMod);
    }

    function SETMININVESTORCONTRIBUTION375(uint256 newMinInvestorContr) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETMININVESTORCONTRIBUTION375(newMinInvestorContr);
    }

    function SETMAXINVESTORCONTRIBUTION398(uint256 newMaxInvestorContr) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETMAXINVESTORCONTRIBUTION398(newMaxInvestorContr);
    }

    function SETMINPROTECTIONPERCENTAGE427(uint256 newPercentage) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETMINPROTECTIONPERCENTAGE427(newPercentage);
    }

    function SETMAXPROTECTIONPERCENTAGE139(uint256 newPercentage) public ONLYMODERATORS745	//inject NONSTANDARD NAMING
    {
        masterStorage.SETMAXPROTECTIONPERCENTAGE139(newPercentage);
    }

    function SETMINOWNERCONTRIBUTION860(uint256 newMinOwnContrib) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETMINOWNERCONTRIBUTION860(newMinOwnContrib);
    }

    function SETDEFAULTBASEPOLICY319(uint256 newBasePolicy) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETDEFAULTBASEPOLICYDURATION853(newBasePolicy);
    }

    function SETDEFAULTPOLICY499(uint256 newPolicy) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETDEFAULTPOLICYDURATION210(newPolicy);
    }

    function SETREGULARCONTRIBUTIONPERCENTAGE702(uint256 newPercentage) public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        masterStorage.SETREGULARCONTRIBUTIONPERCENTAGE702(newPercentage);
    }

    function CLEANIFNOPROJECTS989() public ONLYMODERATORS745 {	//inject NONSTANDARD NAMING
        pool.CLEANIFNOPROJECTS989();
    }

    function _PROJECTCONTROLLEROFPROJECT532(uint256 pid)	//inject NONSTANDARD NAMING
        internal
        view
        returns (ProjectController)
    {
        return ProjectController(secondStorage.GETPROJECTCONTROLLEROFPROJECT308(pid));
    }

    function _REFUNDCONTROLLEROFPROJECT429(uint256 pid)	//inject NONSTANDARD NAMING
        internal
        view
        returns (RefundController)
    {
        return RefundController(secondStorage.GETREFUNDCONTROLLEROFPROJECT742(pid));
    }

    function _DISPUTECONTROLLEROFPROJECT703(uint256 pid)	//inject NONSTANDARD NAMING
        internal
        view
        returns (DisputeController)
    {
        return DisputeController(secondStorage.GETDISPUTECONTROLLEROFPROJECT220(pid));
    }

    function _DISPUTECONTROLLEROFDISPUTE825(uint256 did)	//inject NONSTANDARD NAMING
        internal
        view
        returns (DisputeController)
    {
        return DisputeController(masterStorage.GETDISPUTECONTROLLEROFPROJECT220(did));
    }

    function _UTILITYCONTROLLEROFPROJECT795(uint256 pid)	//inject NONSTANDARD NAMING
        internal
        view
        returns (UtilityController)
    {
        return UtilityController(secondStorage.GETUTILITYCONTROLLEROFPROJECT273(pid));
    }

    function _REFUNDCONTROLLEROFINSURANCE211(uint256 ins)	//inject NONSTANDARD NAMING
        internal
        view
        returns (RefundController) {
        bytes32 insCtrlState = masterStorage.GETINSURANCECONTROLLERSTATE97(ins);

        if (controllersHash != insCtrlState) {
            return RefundController(masterStorage.OLDREFUNDCTRL414(insCtrlState));
        } else {
            return refundController;
        }
    }

    function _UTILITYCONTROLLEROFINSURANCE609(uint256 ins)	//inject NONSTANDARD NAMING
        internal
        view
        returns (UtilityController) {
        bytes32 insCtrlState = masterStorage.GETINSURANCECONTROLLERSTATE97(ins);

        if (controllersHash != insCtrlState) {
            return UtilityController(masterStorage.OLDUTILITYCTRL283(insCtrlState));
        } else {
            return utilityController;
        }
    }

    function _ISCONTRACT442(address sender) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint codeSize;
        assembly {
            codeSize := extcodesize(sender)
        }
        return(codeSize != 0);
    }
}