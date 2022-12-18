                                                                 

// File: original_contracts/IPartner.sol

pragma solidity 0.5.11;


interface IPartner {

    function GETREFERRALID480() external view returns(string memory);	//inject NONSTANDARD NAMING

    function GETFEEWALLET92() external view returns(address payable);	//inject NONSTANDARD NAMING

    function GETFEE268() external view returns(uint256);	//inject NONSTANDARD NAMING

    function GETPARTNERSHARE419() external returns(uint256);	//inject NONSTANDARD NAMING

    function GETPARASWAPSHARE580() external returns(uint256);	//inject NONSTANDARD NAMING

    function CHANGEFEEWALLET182(address payable feeWallet) external;	//inject NONSTANDARD NAMING

    function CHANGEFEE801(uint256 newFee) external;	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                       
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED147(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED147(address(0), _owner);
    }

                                                                     
    function OWNER452() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER324() {	//inject NONSTANDARD NAMING
        require(ISOWNER654(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER654() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP367() public ONLYOWNER324 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED147(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP390(address newOwner) public ONLYOWNER324 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP437(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP437(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED147(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: original_contracts/Partner.sol

pragma solidity 0.5.11;




contract Partner is Ownable {

    string private _referralId;

    address payable private _feeWallet;

    //It should be in percentage. For 1% it should be 100
    uint256 private _fee;

    //Paraswap share in the fee. For 20% it should 2000
    //It means 20% of 1% fee charged
    uint256 private _paraswapShare;

    //Partner share in the fee. For 80% it should be 8000
    uint256 private _partnerShare;

    event FEEWALLETCHANGED701(address indexed feeWallet);	//inject NONSTANDARD NAMING
    event FEECHANGED460(uint256 fee);	//inject NONSTANDARD NAMING

    constructor(
        string memory referralId,
        address payable feeWallet,
        uint256 fee,
        uint256 paraswapShare,
        uint256 partnerShare,
        address owner
    )
        public
    {
        _referralId = referralId;
        _feeWallet = feeWallet;
        _fee = fee;
        _paraswapShare = paraswapShare;
        _partnerShare = partnerShare;
        TRANSFEROWNERSHIP390(owner);
    }

    function GETREFERRALID480() external view returns(string memory) {	//inject NONSTANDARD NAMING
        return _referralId;
    }

    function GETFEEWALLET92() external view returns(address payable) {	//inject NONSTANDARD NAMING
        return _feeWallet;
    }

    function GETFEE268() external view returns(uint256) {	//inject NONSTANDARD NAMING
        return _fee;
    }

    function GETPARTNERSHARE419() external returns(uint256) {	//inject NONSTANDARD NAMING
        return _partnerShare;
    }

    function GETPARASWAPSHARE580() external returns(uint256) {	//inject NONSTANDARD NAMING
        return _paraswapShare;
    }

    function CHANGEFEEWALLET182(address payable feeWallet) external ONLYOWNER324 {	//inject NONSTANDARD NAMING
        require(feeWallet != address(0), "Invalide fee wallet passed!!");
        _feeWallet = feeWallet;

        emit FEEWALLETCHANGED701(feeWallet);
    }

    function CHANGEFEE801(uint256 newFee) external ONLYOWNER324 {	//inject NONSTANDARD NAMING
        require(newFee <= 10000, "Invalid fee passed!!");

        _fee = newFee;

        emit FEECHANGED460(newFee);
    }

}