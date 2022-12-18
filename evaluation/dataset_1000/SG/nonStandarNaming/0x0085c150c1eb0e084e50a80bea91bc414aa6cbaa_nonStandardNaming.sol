pragma solidity 0.5.7;
// produced by the Solididy File Flattener (c) David Appleton 2018
// contact : dave@akomba.com
// released under Apache 2.0 licence
// input  /Users/rmanzoku/src/github.com/doublejumptokyo/mch-experimental/contracts/MetaMarking.sol
// flattened :  Friday, 12-Apr-19 07:50:40 UTC
library ECDSA {
                                                                                                                                                                                                                                                                                                 
    function RECOVER26(bytes32 hash, bytes memory signature) internal pure returns (address) {	//inject NONSTANDARD NAMING
        // Check the signature length
        if (signature.length != 65) {
            return (address(0));
        }

        // Divide the signature in r, s and v variables
        bytes32 r;
        bytes32 s;
        uint8 v;

        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        // EIP-2 still allows signature malleability for ecrecover(). Remove this possibility and make the signature
        // unique. Appendix F in the Ethereum Yellow paper (https://ethereum.github.io/yellowpaper/paper.pdf), defines
        // the valid range for s in (281): 0 < s < secp256k1n 1 2 + 1, and for v in (282): v 1 {27, 28}. Most
        // signatures from current libraries generate a unique signature with an s-value in the lower half order.
        //
        // If your library generates malleable signatures, such as s-values in the upper range, calculate a new s-value
        // with 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - s1 and flip v from 27 to 28 or
        // vice versa. If your library also generates signatures with 0/1 for v instead 27/28, add 27 to v to accept
        // these malleable signatures as well.
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return address(0);
        }

        if (v != 27 && v != 28) {
            return address(0);
        }

        // If the signature is valid (and not malleable), return the signer address
        return ecrecover(hash, v, r, s);
    }

                                                                                                                                               
    function TOETHSIGNEDMESSAGEHASH916(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD997(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS290(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE518(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS290(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS290(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

contract OperatorRole {
    using Roles for Roles.Role;

    event OPERATORADDED238(address indexed account);	//inject NONSTANDARD NAMING
    event OPERATORREMOVED413(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private operators;

    constructor() public {
        operators.ADD997(msg.sender);
    }

    modifier ONLYOPERATOR812() {	//inject NONSTANDARD NAMING
        require(ISOPERATOR81(msg.sender));
        _;
    }
    
    function ISOPERATOR81(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return operators.HAS290(account);
    }

    function ADDOPERATOR591(address account) public ONLYOPERATOR812() {	//inject NONSTANDARD NAMING
        operators.ADD997(account);
        emit OPERATORADDED238(account);
    }

    function REMOVEOPERATOR100(address account) public ONLYOPERATOR812() {	//inject NONSTANDARD NAMING
        operators.REMOVE518(account);
        emit OPERATORREMOVED413(account);
    }

}
contract MCHMetaMarking is OperatorRole {

  mapping(address => uint256) public nonces;

  struct Mark {
    bool isExist;
    int64 markAt;
    uint32 uid;
    int64 primeUntil;
    uint8 landType;
  }

  event MARKING354(	//inject NONSTANDARD NAMING
             address indexed from,
             int64 markAt,
             uint32 uid,
             int64 primeUntil,
             uint8 landType
             );

  mapping(uint8 => address[]) public addressesByLandType;
  mapping(address => Mark) public latestMarkByAddress;

  constructor() public {
    ADDOPERATOR591(address(0x51C36baAa8b0e6CF45e2E1A77E84E3c0D1713F97));
  }

  function ENCODEDATA396(address _from, int64 _markAt, uint32 _uid, int64 _primeUntil,	//inject NONSTANDARD NAMING
                      uint8 _landType, uint256 _nonce, address _relayer) public view returns (bytes32) {
    return keccak256(abi.encode(
                                      address(this),
                                      _from,
                                      _markAt,
                                      _uid,
                                      _primeUntil,
                                      _landType,
                                      _nonce,
                                      _relayer
                                      )
                     );
  }

  function ETHSIGNEDMESSAGEHASH988(bytes32 _data) public pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return ECDSA.TOETHSIGNEDMESSAGEHASH916(_data);
  }

  function RECOVER26(bytes32 _data, bytes memory _sig) public pure returns (address) {	//inject NONSTANDARD NAMING
    bytes32 data = ECDSA.TOETHSIGNEDMESSAGEHASH916(_data);
    return ECDSA.RECOVER26(data, _sig);
  }

  function EXECUTEMARKMETATX673(address _from, int64 _markAt, uint32 _uid, int64 _primeUntil,	//inject NONSTANDARD NAMING
                             uint8 _landType, uint256 _nonce, bytes calldata _sig) external ONLYOPERATOR812() {
    require(nonces[_from]+1 == _nonce, "nonces[_from]+1 != _nonce");
    bytes32 encodedData = ENCODEDATA396(_from, _markAt, _uid, _primeUntil, _landType, _nonce, msg.sender);
    address signer = RECOVER26(encodedData, _sig);
    require(signer == _from, "signer != _from");

    _MARK443(_from, _markAt, _uid, _primeUntil, _landType);
    nonces[_from]++;
  }

  function FORCEMARK707(address _user, int64 _markAt, uint32 _uid, int64 _primeUntil, uint8 _landType) external ONLYOPERATOR812() {	//inject NONSTANDARD NAMING
    _MARK443(_user, _markAt, _uid, _primeUntil, _landType);
  }

  function _MARK443(address _user, int64 _markAt, uint32 _uid, int64 _primeUntil, uint8 _landType) private {	//inject NONSTANDARD NAMING

    if (!latestMarkByAddress[_user].isExist) {
      latestMarkByAddress[_user] = Mark(
                                        true,
                                        _markAt,
                                        _uid,
                                        _primeUntil,
                                        _landType
                                        );
      addressesByLandType[_landType].push(_user);
      return;
    }

    uint8 currentLandType = latestMarkByAddress[_user].landType;
    if (currentLandType != _landType) {
      uint256 i;
      for (i = 0; i < addressesByLandType[_landType].length; i++) {
	if (addressesByLandType[_landType][i] != _user) {
	  break;
	}
      }

      delete addressesByLandType[currentLandType][i];
      addressesByLandType[_landType].push(_user);
    }

    latestMarkByAddress[_user].markAt = _markAt;
    latestMarkByAddress[_user].uid = _uid;
    latestMarkByAddress[_user].primeUntil = _primeUntil;
    latestMarkByAddress[_user].landType = _landType;

    emit MARKING354(_user, _markAt, _uid, _primeUntil, _landType);
  }

  function GETADDRESSESBYLANDTYPE908(uint8 _landType, int64 _validSince) public view returns (address[] memory){	//inject NONSTANDARD NAMING
    if (addressesByLandType[_landType].length == 0) {
      return new address[](0);
    }

    uint256 cnt;
    for (uint256 i = 0; i < addressesByLandType[_landType].length; i++) {
      address addr = addressesByLandType[_landType][i];
      if (addr == address(0x0)) {
        continue;
      }

      if (latestMarkByAddress[addr].markAt >= _validSince) {
        cnt++;
      }
    }

    address[] memory ret = new address[](cnt);
    uint256 idx = 0;
    for (uint256 i = 0; i < addressesByLandType[_landType].length; i++) {
      address addr = addressesByLandType[_landType][i];
      if (addr == address(0x0)) {
        continue;
      }

      if (latestMarkByAddress[addr].markAt >= _validSince) {
        ret[idx] = addr;
        idx++;
      }
    }

    return ret;
  }

  function META_NONCE834(address _from) external view returns (uint256 nonce) {	//inject NONSTANDARD NAMING
    return nonces[_from];
  }

  function KILL974() external ONLYOPERATOR812() {	//inject NONSTANDARD NAMING
    selfdestruct(msg.sender);
  }
}