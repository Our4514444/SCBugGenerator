pragma solidity 0.5.3;

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/external/Token.sol

                                                                                                         
contract Token {
                                                                                                                                                                                                                                                                                                                                                                                                                
                            
  uint public totalSupply;

                                                                        
                         
  function BALANCEOF125(address _owner) public view returns (uint balance);	//inject NONSTANDARD NAMING

                                                            
                                             
                                                         
                                                        
  function TRANSFER390(address _to, uint _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                  
                                            
                                             
                                                         
                                                        
  function TRANSFERFROM658(address _from, address _to, uint _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                                       
                                                                            
                                                                    
                                                        
  function APPROVE892(address _spender, uint _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                            
                                                                            
                                                         
  function ALLOWANCE879(address _owner, address _spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING

  event TRANSFER23(address indexed _from, address indexed _to, uint _value);	//inject NONSTANDARD NAMING
  event APPROVAL173(address indexed _owner, address indexed _spender, uint _value);	//inject NONSTANDARD NAMING
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/external/MerkleProof.sol

// note: can use a deployed https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/cryptography/MerkleProof.sol
contract MerkleProof {

                                                                                                                                                                               
  function CHECKPROOF192(bytes memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {	//inject NONSTANDARD NAMING
    if (proof.length % 32 != 0) return false; // Check if proof is made of bytes32 slices

    bytes memory elements = proof;
    bytes32 element;
    bytes32 hash = leaf;
    for (uint i = 32; i <= proof.length; i += 32) {
      assembly {
      // Load the current element of the proofOfInclusion (optimal way to get a bytes32 slice)
        element := mload(add(elements, i))
      }
      hash = keccak256(abi.encodePacked(hash < element ? abi.encodePacked(hash, element) : abi.encodePacked(element, hash)));
    }
    return hash == root;
  }

  // from StorJ -- https://github.com/nginnever/storj-audit-verifier/contracts/MerkleVerifyv3.sol
  function CHECKPROOFORDERED781(bytes memory proof, bytes32 root, bytes32 leaf, uint index) public pure returns (bool) {	//inject NONSTANDARD NAMING
    if (proof.length % 32 != 0) return false; // Check if proof is made of bytes32 slices

    // use the index to determine the node ordering (index ranges 1 to n)
    bytes32 element;
    bytes32 hash = leaf;
    uint remaining;
    for (uint j = 32; j <= proof.length; j += 32) {
      assembly {
        element := mload(add(proof, j))
      }

      // calculate remaining elements in proof
      remaining = (proof.length - j + 32) / 32;

      // we don't assume that the tree is padded to a power of 2
      // if the index is odd then the proof will start with a hash at a higher layer,
      // so we have to adjust the index to be the index at that layer
      while (remaining > 0 && index % 2 == 1 && index > 2 ** remaining) {
        index = uint(index) / 2 + 1;
      }

      if (index % 2 == 0) {
        hash = keccak256(abi.encodePacked(abi.encodePacked(element, hash)));
        index = index / 2;
      } else {
        hash = keccak256(abi.encodePacked(abi.encodePacked(hash, element)));
        index = uint(index) / 2 + 1;
      }
    }
    return hash == root;
  }

                                                                               
  function VERIFYINCLUDED368(bytes memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {	//inject NONSTANDARD NAMING
    return CHECKPROOF192(proof, root, leaf);
  }

                                                                                                               
  function VERIFYINCLUDEDATINDEX14(bytes memory proof, bytes32 root, bytes32 leaf, uint index) public pure returns (bool) {	//inject NONSTANDARD NAMING
    return CHECKPROOFORDERED781(proof, root, leaf, index);
  }
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/Stoppable.sol

                                                                           
contract Stoppable {

                                                                                    
  modifier ONLYOWNER972 { _; }	//inject NONSTANDARD NAMING
                                                                                    

  bool public isOn = true;

  modifier WHENON230() { require(isOn, "must be on"); _; }	//inject NONSTANDARD NAMING
  modifier WHENOFF128() { require(!isOn, "must be off"); _; }	//inject NONSTANDARD NAMING

  function SWITCHOFF568() external ONLYOWNER972 {	//inject NONSTANDARD NAMING
    if (isOn) {
      isOn = false;
      emit OFF138();
    }
  }
  event OFF138();	//inject NONSTANDARD NAMING
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/Validating.sol

contract Validating {

  modifier NOTZERO198(uint number) { require(number != 0, "invalid 0 value"); _; }	//inject NONSTANDARD NAMING
  modifier NOTEMPTY766(string memory text) { require(bytes(text).length != 0, "invalid empty string"); _; }	//inject NONSTANDARD NAMING
  modifier VALIDADDRESS746(address value) { require(value != address(0x0), "invalid address");  _; }	//inject NONSTANDARD NAMING

}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/HasOwners.sol

contract HasOwners is Validating {

  mapping(address => bool) public isOwner;
  address[] private owners;

  constructor(address[] memory _owners) public {
    for (uint i = 0; i < _owners.length; i++) _ADDOWNER_265(_owners[i]);
    owners = _owners;
  }

  modifier ONLYOWNER972 { require(isOwner[msg.sender], "invalid sender; must be owner"); _; }	//inject NONSTANDARD NAMING

  function GETOWNERS687() public view returns (address[] memory) { return owners; }	//inject NONSTANDARD NAMING

  function ADDOWNER429(address owner) external ONLYOWNER972 {  _ADDOWNER_265(owner); }	//inject NONSTANDARD NAMING

  function _ADDOWNER_265(address owner) private VALIDADDRESS746(owner) {	//inject NONSTANDARD NAMING
    if (!isOwner[owner]) {
      isOwner[owner] = true;
      owners.push(owner);
      emit OWNERADDED536(owner);
    }
  }
  event OWNERADDED536(address indexed owner);	//inject NONSTANDARD NAMING

  function REMOVEOWNER947(address owner) external ONLYOWNER972 {	//inject NONSTANDARD NAMING
    if (isOwner[owner]) {
      require(owners.length > 1, "removing the last owner is not allowed");
      isOwner[owner] = false;
      for (uint i = 0; i < owners.length - 1; i++) {
        if (owners[i] == owner) {
          owners[i] = owners[owners.length - 1]; // replace map last entry
          delete owners[owners.length - 1];
          break;
        }
      }
      owners.length -= 1;
      emit OWNERREMOVED886(owner);
    }
  }
  event OWNERREMOVED886(address indexed owner);	//inject NONSTANDARD NAMING
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/Versioned.sol

contract Versioned {
  string public version;

  constructor(string memory _version) public {
    version = _version;
  }

}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/custodian/Ledger.sol

contract Ledger {

  function EXTRACTENTRY309(address[] memory addresses, uint[] memory uints) internal view returns (Entry memory result) {	//inject NONSTANDARD NAMING
    addresses[0] = address(this);                
    result.account = addresses[1];
    result.asset = addresses[2];
    result.entryType = EntryType(uints[0]);
    result.action = uints[1];
    result.timestamp = uints[2];
    result.id = uints[3];
    result.quantity = uints[4];
    result.balance = uints[5];
    result.previous = uints[6];
    result.addresses = addresses;
    result.uints = uints;
    result.hash = CALCULATEEVMCONSTRAINEDHASH344(result.entryType, addresses, uints);
  }

                                                                                                                                                                                                                                                                                                            
  function CALCULATEEVMCONSTRAINEDHASH344(EntryType entryType, address[] memory addresses, uint[] memory uints) internal view returns (bytes32) {	//inject NONSTANDARD NAMING
    bytes32 entryHash = CALCULATEENTRYHASH520(addresses, uints);
    bytes32 witnessHash = CALCULATEWITNESSHASH230(entryType, addresses, uints);
    return keccak256(abi.encodePacked(abi.encodePacked(entryHash, witnessHash)));
  }
  function CALCULATEENTRYHASH520(address[] memory addresses, uint[] memory uints) private pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(
        addresses[0],
        addresses[1],
        addresses[2],
        uints[0],
        uints[1],
        uints[2],
        uints[3],
        uints[4],
        uints[5],
        uints[6]
      ));
  }
  function CALCULATEWITNESSHASH230(EntryType entryType, address[] memory addresses, uint[] memory uints) private view returns (bytes32) {	//inject NONSTANDARD NAMING
    if (entryType == EntryType.Deposit) return CALCULATEDEPOSITINFOWITNESSHASH418(uints);
    if (entryType == EntryType.Withdrawal) return CALCULATEWITHDRAWALREQUESTWITNESSHASH476(addresses, uints);
    if (entryType == EntryType.Trade || entryType == EntryType.Fee) return CALCULATEMATCHWITNESSHASH807(addresses, uints);
    return keccak256(abi.encodePacked(abi.encodePacked(uint(0))));
  }
  function CALCULATEDEPOSITINFOWITNESSHASH418(uint[] memory uints) private view returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(
        uints[offsets.uints.witness + 0],
        uints[offsets.uints.witness + 1]
      ));
  }
  function CALCULATEWITHDRAWALREQUESTWITNESSHASH476(address[] memory addresses, uint[] memory uints) private view returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(
        addresses[offsets.addresses.witness + 0],
        addresses[offsets.addresses.witness + 1],
        uints[offsets.uints.witness + 0],
        uints[offsets.uints.witness + 1]
      ));
  }
  function CALCULATEMATCHWITNESSHASH807(address[] memory addresses, uint[] memory uints) private view returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(
        CALCULATEFILLHASH778(addresses, uints, offsets.addresses.witness, offsets.uints.witness),    // fill
        CALCULATEORDERHASH961(addresses, uints, offsets.addresses.maker, offsets.uints.maker), // maker
        CALCULATEORDERHASH961(addresses, uints, offsets.addresses.taker, offsets.uints.taker)  // taker
      ));
  }
  function CALCULATEFILLHASH778(address[] memory addresses, uint[] memory uints, uint8 addressesOffset, uint8 uintsOffset) private pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(
        addresses[addressesOffset + 0],
        uints[uintsOffset + 0],
        uints[uintsOffset + 1],
        uints[uintsOffset + 2]
      ));
  }
  function CALCULATEORDERHASH961(address[] memory addresses, uint[] memory uints, uint8 addressesOffset, uint8 uintsOffset) private pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(
        addresses[addressesOffset + 0],
        addresses[addressesOffset + 1],
        uints[uintsOffset + 0],
        uints[uintsOffset + 1],
        uints[uintsOffset + 2],
        uints[uintsOffset + 3],
        uints[uintsOffset + 4],
        uints[uintsOffset + 5],
        uints[uintsOffset + 6]
      ));
  }

  Offsets private offsets = GETOFFSETS677();
  function GETOFFSETS677() private pure returns (Offsets memory) {	//inject NONSTANDARD NAMING
    uint8 addressesInEntry = 3;
    uint8 uintsInEntry = 7;
    uint8 addressesInFill = 1;
    uint8 uintsInFill = 3;
    uint8 addressesInOrder = 2;
    uint8 uintsInOrder = 7;
    uint8 addressesInDeposit = 3;
    uint8 uintsInDeposit = 3;
    return Offsets({
      addresses: OffsetKind({
        deposit: addressesInDeposit,
        witness: addressesInEntry,
        maker: addressesInEntry + addressesInFill,
        taker: addressesInEntry + addressesInFill + addressesInOrder
        }),
      uints: OffsetKind({
        deposit: uintsInDeposit,
        witness: uintsInEntry,
        maker: uintsInEntry + uintsInFill,
        taker: uintsInEntry + uintsInFill + uintsInOrder
        })
      });
  }
  struct OffsetKind { uint8 deposit; uint8 witness; uint8 maker; uint8 taker; }
  struct Offsets { OffsetKind addresses; OffsetKind uints; }


  enum EntryType { Unknown, Origin, Deposit, Withdrawal, Exited, Trade, Fee }

  struct Entry {
    EntryType entryType;
    uint action;
    uint timestamp;
    uint id;
    address account;
    address asset;
    uint quantity;
    uint balance;
    uint previous;
    address[] addresses;
    uint[] uints;
    bytes32 hash;
  }

  struct DepositCommitmentRecord {
    address account;
    address asset;
    uint quantity;
    uint nonce;
    uint designatedGblock;
    bytes32 hash;
  }


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/custodian/Depositing.sol

interface Depositing {

  function DEPOSITETHER22() external payable;	//inject NONSTANDARD NAMING

  function DEPOSITTOKEN777(address token, uint quantity) external;	//inject NONSTANDARD NAMING

  function RECLAIMDEPOSIT955(	//inject NONSTANDARD NAMING
    address[] calldata addresses,
    uint[] calldata uints,
    bytes32[] calldata leaves,
    uint[] calldata indexes,
    bytes calldata predecessor,
    bytes calldata successor
  ) external;
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/custodian/Withdrawing.sol

interface Withdrawing {

  function WITHDRAW894(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;	//inject NONSTANDARD NAMING

  function CLAIMEXIT426(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;	//inject NONSTANDARD NAMING

  function EXIT754(bytes32 entryHash, bytes calldata proof, bytes32 root) external;	//inject NONSTANDARD NAMING

  function EXITONHALT921(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;	//inject NONSTANDARD NAMING
}

// File: contracts/custodian/Custodian.sol

contract Custodian is Stoppable, HasOwners, MerkleProof, Ledger, Depositing, Withdrawing, Versioned {

  address public constant eth757 = address(0x0);	//inject NONSTANDARD NAMING
  uint public constant confirmationdelay611 = 5;	//inject NONSTANDARD NAMING
  uint public constant visibilitydelay753 = 3;	//inject NONSTANDARD NAMING
  uint public nonceGenerator = 0;

  address public operator;
  address public registry;

  constructor(address[] memory _owners, address _registry, address _operator, uint _submissionInterval, string memory _version)
    HasOwners(_owners)
    Versioned(_version)
    public VALIDADDRESS746(_registry) VALIDADDRESS746(_operator)
  {
    operator = _operator;
    registry = _registry;
    submissionInterval = _submissionInterval;
  }

  // note: can move to a library
  function TRANSFER390(uint quantity, address asset, address account) internal {	//inject NONSTANDARD NAMING
    asset == eth757 ?
      require(address(uint160(account)).send(quantity), "failed to transfer ether") : // explicit casting to `address payable`
      require(Token(asset).TRANSFER390(account, quantity), "failed to transfer token");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  // note: can move to a library
  // note: can use a deployed https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/cryptography/ECDSA.sol
  function RECOVER540(bytes32 hash, bytes memory signature) private pure returns (address) {	//inject NONSTANDARD NAMING
    bytes32 r; bytes32 s; uint8 v;
    if (signature.length != 65) return (address(0)); //Check the signature length

    // Divide the signature into r, s and v variables
    assembly {
      r := mload(add(signature, 32))
      s := mload(add(signature, 64))
      v := byte(0, mload(add(signature, 96)))
    }

    // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
    if (v < 27) v += 27;

    // If the version is correct return the signer address
    return (v != 27 && v != 28) ? (address(0)) : ecrecover(hash, v, r, s);
  }

  function VERIFYSIGNEDBY488(bytes32 hash, bytes memory signature, address signer) internal pure {	//inject NONSTANDARD NAMING
    require(RECOVER540(hash, signature) == signer, "failed to verify signature");
  }

                                                                                                                        

  mapping (bytes32 => bool) public deposits;

  modifier VALIDTOKEN938(address value) { require(value != eth757, "value must be a valid ERC20 token address"); _; }	//inject NONSTANDARD NAMING

  function () external payable { DEPOSIT571(msg.sender, eth757, msg.value); }
  function DEPOSITETHER22() external payable { DEPOSIT571(msg.sender, eth757, msg.value); }	//inject NONSTANDARD NAMING

  // note: an account must call token.approve(custodian, quantity) beforehand
  function DEPOSITTOKEN777(address token, uint quantity) external VALIDTOKEN938(token) {	//inject NONSTANDARD NAMING
    uint balanceBefore = Token(token).BALANCEOF125(address(this));
    require(Token(token).TRANSFERFROM658(msg.sender, address(this), quantity), "failure to transfer quantity from token");
    uint balanceAfter = Token(token).BALANCEOF125(address(this));
    require(balanceAfter - balanceBefore == quantity, "bad Token; transferFrom erroneously reported of successful transfer");
    DEPOSIT571(msg.sender, token, quantity);
  }

  function DEPOSIT571(address account, address asset, uint quantity) private WHENON230 {	//inject NONSTANDARD NAMING
    uint nonce = ++nonceGenerator;
    uint designatedGblock = currentGblockNumber + visibilitydelay753;
    DepositCommitmentRecord memory record = TODEPOSITCOMMITMENTRECORD173(account, asset, quantity, nonce, designatedGblock);
    deposits[record.hash] = true;
    emit DEPOSITED752(address(this), account, asset, quantity, nonce, designatedGblock);
  }

  function RECLAIMDEPOSIT955(	//inject NONSTANDARD NAMING
    address[] calldata addresses,
    uint[] calldata uints,
    bytes32[] calldata leaves,
    uint[] calldata indexes,
    bytes calldata predecessor,
    bytes calldata successor
  ) external {
    ProofOfExclusionOfDeposit memory proof = EXTRACTPROOFOFEXCLUSIONOFDEPOSIT267(addresses, uints, leaves, indexes, predecessor, successor);
    DepositCommitmentRecord memory record = proof.excluded;
    require(record.account == msg.sender, "claimant must be the original depositor");
    require(currentGblockNumber > record.designatedGblock && record.designatedGblock != 0, "designated gblock is unconfirmed or unknown");

    Gblock memory designatedGblock = gblocksByNumber[record.designatedGblock];
    require(PROVEISEXCLUDEDFROMDEPOSITS538(designatedGblock.depositsRoot, proof), "failed to proof exclusion of deposit");

    _RECLAIMDEPOSIT_429(record);
  }

  function PROVEISEXCLUDEDFROMDEPOSITS538(bytes32 root, ProofOfExclusionOfDeposit memory proof) private pure returns (bool) {	//inject NONSTANDARD NAMING
    return
      proof.successor.index == proof.predecessor.index + 1 && // predecessor & successor must be consecutive
      VERIFYINCLUDEDATINDEX14(proof.predecessor.proof, root, proof.predecessor.leaf, proof.predecessor.index) &&
      VERIFYINCLUDEDATINDEX14(proof.successor.proof, root, proof.successor.leaf, proof.successor.index);
  }

  function RECLAIMDEPOSITONHALT86(address asset, uint quantity, uint nonce, uint designatedGblock) external WHENOFF128 {	//inject NONSTANDARD NAMING
    DepositCommitmentRecord memory record = TODEPOSITCOMMITMENTRECORD173(msg.sender, asset, quantity, nonce, designatedGblock);
    require(record.designatedGblock >= currentGblockNumber, "designated gblock is already confirmed; use exitOnHalt instead");
    _RECLAIMDEPOSIT_429(record);
  }

  function _RECLAIMDEPOSIT_429(DepositCommitmentRecord memory record) private {	//inject NONSTANDARD NAMING
    require(deposits[record.hash], "unknown deposit");
    delete deposits[record.hash];
    TRANSFER390(record.quantity, record.asset, record.account);
    emit DEPOSITRECLAIMED940(address(this), record.account, record.asset, record.quantity, record.nonce);
  }

  function EXTRACTPROOFOFEXCLUSIONOFDEPOSIT267(	//inject NONSTANDARD NAMING
    address[] memory addresses,
    uint[] memory uints,
    bytes32[] memory leaves,
    uint[] memory indexes,
    bytes memory predecessor,
    bytes memory successor
  ) private view returns (ProofOfExclusionOfDeposit memory result) {
    result.excluded = EXTRACTDEPOSITCOMMITMENTRECORD343(addresses, uints);
    result.predecessor = ProofOfInclusionAtIndex(leaves[0], indexes[0], predecessor);
    result.successor = ProofOfInclusionAtIndex(leaves[1], indexes[1], successor);
  }

  function EXTRACTDEPOSITCOMMITMENTRECORD343(address[] memory addresses, uint[] memory uints) private view returns (DepositCommitmentRecord memory) {	//inject NONSTANDARD NAMING
    return TODEPOSITCOMMITMENTRECORD173(
      addresses[1],
      addresses[2],
      uints[0],
      uints[1],
      uints[2]
    );
  }

  function TODEPOSITCOMMITMENTRECORD173(	//inject NONSTANDARD NAMING
    address account,
    address asset,
    uint quantity,
    uint nonce,
    uint designatedGblock
  ) private view returns (DepositCommitmentRecord memory result) {
    result.account = account;
    result.asset = asset;
    result.quantity = quantity;
    result.nonce = nonce;
    result.designatedGblock = designatedGblock;
    result.hash = keccak256(abi.encodePacked(
      address(this),
      account,
      asset,
      quantity,
      nonce,
      designatedGblock
    ));
  }

  event DEPOSITED752(address indexed custodian, address indexed account, address indexed asset, uint quantity, uint nonce, uint designatedGblock);	//inject NONSTANDARD NAMING
  event DEPOSITRECLAIMED940(address indexed custodian, address indexed account, address indexed asset, uint quantity, uint nonce);	//inject NONSTANDARD NAMING

  struct ProofOfInclusionAtIndex { bytes32 leaf; uint index; bytes proof; }
  struct ProofOfExclusionOfDeposit { DepositCommitmentRecord excluded; ProofOfInclusionAtIndex predecessor; ProofOfInclusionAtIndex successor; }

                                                                                                                        

  mapping (bytes32 => bool) public withdrawn;
  mapping (bytes32 => ExitClaim) private exitClaims;
  mapping (address => mapping (address => bool)) public exited; // account => asset => did-exit

  function WITHDRAW894(	//inject NONSTANDARD NAMING
    address[] calldata addresses,
    uint[] calldata uints,
    bytes calldata signature,
    bytes calldata proof,
    bytes32 root
  ) external {
    Entry memory entry = EXTRACTENTRY309(addresses, uints);
    VERIFYSIGNEDBY488(entry.hash, signature, operator);
    require(entry.account == msg.sender, "withdrawer must be entry's account");
    require(entry.entryType == EntryType.Withdrawal, "entry must be of type Withdrawal");
    require(PROVEINCONFIRMEDWITHDRAWALS68(proof, root, entry.hash), "invalid entry proof");
    require(!withdrawn[entry.hash], "entry already withdrawn");
    withdrawn[entry.hash] = true;
    TRANSFER390(entry.quantity, entry.asset, entry.account);
    emit WITHDRAWN761(entry.hash, entry.account, entry.asset, entry.quantity);
  }

  function CLAIMEXIT426(	//inject NONSTANDARD NAMING
    address[] calldata addresses,
    uint[] calldata uints,
    bytes calldata signature,
    bytes calldata proof,
    bytes32 root
  ) external WHENON230 {
    Entry memory entry = EXTRACTENTRY309(addresses, uints);
    VERIFYSIGNEDBY488(entry.hash, signature, operator);
    require(entry.account == msg.sender, "claimant must be entry's account");
    require(!HASEXITED372(entry.account, entry.asset), "previously exited");
    require(PROVEINCONFIRMEDBALANCES105(proof, root, entry.hash), "invalid balance proof");

    uint confirmationThreshold = currentGblockNumber + confirmationdelay611;
    exitClaims[entry.hash] = ExitClaim(entry, confirmationThreshold);
    emit EXITCLAIMED615(entry.hash, entry.account, entry.asset, entry.balance, entry.timestamp, confirmationThreshold);
  }

  function EXIT754(bytes32 entryHash, bytes calldata proof, bytes32 root) external WHENON230 {	//inject NONSTANDARD NAMING
    ExitClaim memory claim = exitClaims[entryHash];
    require(CANEXIT454(entryHash), "no prior claim found to withdraw OR balances are yet to be confirmed");
    require(PROVEINUNCONFIRMEDBALANCES701(proof, root, entryHash), "invalid balance proof");
    delete exitClaims[entryHash];
    _EXIT_579(claim.entry);
  }

  function EXITONHALT921(	//inject NONSTANDARD NAMING
    address[] calldata addresses,
    uint[] calldata uints,
    bytes calldata signature,
    bytes calldata proof,
    bytes32 root
  ) external WHENOFF128 {
    Entry memory entry = EXTRACTENTRY309(addresses, uints);
    VERIFYSIGNEDBY488(entry.hash, signature, operator);
    require(entry.account == msg.sender, "claimant must be entry's account");
    require(PROVEINCONFIRMEDBALANCES105(proof, root, entry.hash), "invalid balance proof");
    _EXIT_579(entry);
  }

  function _EXIT_579(Entry memory entry) private {	//inject NONSTANDARD NAMING
    require(!HASEXITED372(entry.account, entry.asset), "previously exited");
    exited[entry.account][entry.asset] = true;
    TRANSFER390(entry.balance, entry.asset, entry.account);
    emit EXITED910(entry.account, entry.asset, entry.balance);
  }

  function HASEXITED372(address account, address asset) public view returns (bool) { return exited[account][asset]; }	//inject NONSTANDARD NAMING

  function CANEXIT454(bytes32 entryHash) public view returns (bool) {	//inject NONSTANDARD NAMING
    return
      exitClaims[entryHash].confirmationThreshold != 0 &&  // exists
      currentGblockNumber >= exitClaims[entryHash].confirmationThreshold;
  }

  event EXITCLAIMED615(bytes32 hash, address indexed account, address indexed asset, uint quantity, uint timestamp, uint confirmationThreshold);	//inject NONSTANDARD NAMING
  event EXITED910(address indexed account, address indexed asset, uint quantity);	//inject NONSTANDARD NAMING
  event WITHDRAWN761(bytes32 hash, address indexed account, address indexed asset, uint quantity);	//inject NONSTANDARD NAMING

  struct ExitClaim { Entry entry; uint confirmationThreshold; }

                                                                                                                        

  uint public currentGblockNumber;
  mapping(uint => Gblock) public gblocksByNumber;
  mapping(bytes32 => uint) public gblocksByDepositsRoot;
  mapping(bytes32 => uint) public gblocksByWithdrawalsRoot;
  mapping(bytes32 => uint) public gblocksByBalancesRoot;
  uint public submissionInterval;
  uint public submissionBlock = block.number;

  function CANSUBMIT143() public view returns (bool) { return block.number >= submissionBlock; }	//inject NONSTANDARD NAMING

  function SUBMIT202(uint gblockNumber, bytes32 withdrawalsRoot, bytes32 depositsRoot, bytes32 balancesRoot) external WHENON230 {	//inject NONSTANDARD NAMING
    require(CANSUBMIT143(), "cannot submit yet");
    require(msg.sender == operator, "submitter must be the operator");
    require(gblockNumber == currentGblockNumber + 1, "gblock must be the next in sequence");
    Gblock memory gblock = Gblock(gblockNumber, withdrawalsRoot, depositsRoot, balancesRoot);
    gblocksByNumber[gblockNumber] = gblock;
    gblocksByDepositsRoot[depositsRoot] = gblockNumber;
    gblocksByWithdrawalsRoot[withdrawalsRoot] = gblockNumber;
    gblocksByBalancesRoot[balancesRoot] = gblockNumber;
    currentGblockNumber = gblockNumber;
    submissionBlock = block.number + submissionInterval;
    emit SUBMITTED567(gblockNumber, withdrawalsRoot, depositsRoot, balancesRoot);
  }

  function PROVEINCONFIRMEDWITHDRAWALS68(bytes memory proof, bytes32 root, bytes32 entryHash) public view returns (bool) {	//inject NONSTANDARD NAMING
    return ISCONFIRMEDWITHDRAWALS257(root) && VERIFYINCLUDED368(proof, root, entryHash);
  }

  function PROVEINCONFIRMEDBALANCES105(bytes memory proof, bytes32 root, bytes32 entryHash) public view returns (bool) {	//inject NONSTANDARD NAMING
    return
      root == gblocksByNumber[currentGblockNumber - 1                            ].balancesRoot &&
      VERIFYINCLUDED368(proof, root, entryHash);
  }

  function PROVEINUNCONFIRMEDBALANCES701(bytes memory proof, bytes32 root, bytes32 entryHash) public view returns (bool) {	//inject NONSTANDARD NAMING
    return
      root == gblocksByNumber[currentGblockNumber                         ].balancesRoot &&
      VERIFYINCLUDED368(proof, root, entryHash);
  }

  function ISCONFIRMEDWITHDRAWALS257(bytes32 root) public view returns (bool) { return ISCONFIRMEDGBLOCK922(gblocksByWithdrawalsRoot[root]); }	//inject NONSTANDARD NAMING
  function ISUNCONFIRMEDWITHDRAWALS957(bytes32 root) public view returns (bool) { return gblocksByWithdrawalsRoot[root] == currentGblockNumber; }	//inject NONSTANDARD NAMING
  function INCLUDESWITHDRAWALS866(bytes32 root) public view returns (bool) { return gblocksByWithdrawalsRoot[root] != 0; }	//inject NONSTANDARD NAMING

  function ISUNCONFIRMEDBALANCES415(bytes32 root) public view returns (bool) { return gblocksByBalancesRoot[root] == currentGblockNumber; }	//inject NONSTANDARD NAMING

  function ISCONFIRMEDGBLOCK922(uint number) public view returns (bool) { return 0 < number && number < currentGblockNumber; }	//inject NONSTANDARD NAMING

  event SUBMITTED567(uint gblockNumber, bytes32 withdrawalsRoot, bytes32 depositsRoot, bytes32 balancesRoot);	//inject NONSTANDARD NAMING

  struct Gblock { uint number; bytes32 withdrawalsRoot; bytes32 depositsRoot; bytes32 balancesRoot; }

                                                                                                                        
}
