                                                                 

                                            

// Copyright (C) 2020  Martin Lundfall

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity >=0.5.12;

interface TokenLike {
  function TRANSFERFROM810(address from, address to, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE754(address to, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function BALANCEOF584(address to) external returns (uint);	//inject NONSTANDARD NAMING
  function JOIN730(address to, uint256 amount) external;	//inject NONSTANDARD NAMING
  function EXIT19(address from, uint256 amount) external;	//inject NONSTANDARD NAMING
}

interface Uniswappy {
    function TOKENTOETHTRANSFERINPUT667(uint256 tokens_sold, uint256 min_tokens,	//inject NONSTANDARD NAMING
                uint256 deadline, address recipient) external returns (uint256);
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

contract Dach {
  TokenLike public constant dai619 = TokenLike(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
  TokenLike public constant chai790 = TokenLike(0x06AF07097C9Eeb7fD685c692751D5C66dB49c215);	//inject NONSTANDARD NAMING
  Uniswappy public constant daiuniswap408 = Uniswappy(0x2a1530C4C41db0B0b2bB646CB5Eb1A67b7158667);	//inject NONSTANDARD NAMING
  Uniswappy public constant chaiuniswap262 = Uniswappy(0x6C3942B383bc3d0efd3F36eFa1CBE7C8E12C8A2B);	//inject NONSTANDARD NAMING
  
  mapping (address => uint256) public nonces;
  string public constant version155 = "1";	//inject NONSTANDARD NAMING
  string public constant name684 = "Dai Automated Clearing House";	//inject NONSTANDARD NAMING

  // --- EIP712 niceties ---
  //keccak256(abi.encode(
  //   keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
  //   keccak256(bytes(name)), keccak256(bytes(version)), chainId, address(this)));
  //generate with ADDRESS=$(dapp address $ETH_FROM $(seth nonce $ETH_FROM)) CHAIN_ID=1 ./bin/domain_separator
  bytes32 constant public domain_separator956 = 0x12941727324f08818b6823ad59845bef3c6e4139428eb3fd9490efeb9d088969;	//inject NONSTANDARD NAMING

  //keccak256("DaiCheque(address sender,address receiver,uint256 amount,uint256 fee,uint256 nonce,uint256 expiry,address relayer)");
  bytes32 constant public daicheque_typehash55 = 0x2d4b89f08cf38e73f267d45cf655caeec6ec2d1958ff3f7c04bc93b285692ba0;	//inject NONSTANDARD NAMING

  //keccak256("DaiSwap(address sender,uint256 amount,uint256 min_eth,uint256 fee,uint256 nonce,uint256 expiry,address relayer)");
  bytes32 constant public daiswap_typehash786 = 0x569d16faba32239b19edb6a011b30ad0035ca192ef2f179c46edfb1d50280084;	//inject NONSTANDARD NAMING

  //keccak256("ChaiJoin(address sender,address receiver,uint256 amount,uint256 fee,uint256 nonce,uint256 expiry,address relayer)");
  bytes32 constant public chaijoin_typehash628 = 0x9b0767889629ab3e37d797178aba3047e96d19239c5977f2c56ea8da3275cb05;	//inject NONSTANDARD NAMING

  //keccak256("ChaiCheque(address sender,address receiver,uint256 amount,uint256 fee,uint256 nonce,uint256 expiry,address relayer)");
  bytes32 constant public chaicheque_typehash839 = 0x77ae2fa9d8312ad1d4a645b9102258e9fc5e64280c2198da01c426cbcc966fb1;	//inject NONSTANDARD NAMING

  //keccak256("ChaiSwap(address sender,uint256 amount,uint256 min_eth,uint256 fee,uint256 nonce,uint256 expiry,address relayer)");
  bytes32 constant public chaiswap_typehash303 = 0x7cf3e6fd2031b292afffa62c2dbc5e4212855cadd6455a36bed415f2b8246a47;	//inject NONSTANDARD NAMING

  //keccak256("ChaiExit(address sender,address receiver,uint256 amount,uint256 fee,uint256 nonce,uint256 expiry,address relayer)");
  bytes32 constant public chaiexit_typehash884 = 0x69fa4cd566f89a9c8d4e3ca437a7fbc893137962cb1b036c59ceeb1415c58c01;	//inject NONSTANDARD NAMING
 
  constructor() public {
    dai619.APPROVE754(address(chai790), uint(-1));
    dai619.APPROVE754(address(daiuniswap408), uint(-1));
    chai790.APPROVE754(address(chaiuniswap262), uint(-1));
  }

  function DIGEST958(bytes32 hash, address src, address dst, uint amount, uint fee,	//inject NONSTANDARD NAMING
                  uint nonce, uint expiry, address relayer) internal view returns (bytes32) {
    return keccak256(abi.encodePacked("\x19\x01", domain_separator956,
                                      keccak256(abi.encode(hash, src, dst, amount, fee, nonce, expiry, relayer))
                                      )
                     );
  }

  function DIGEST958(bytes32 hash, address src, uint amount, uint min_eth, uint fee,	//inject NONSTANDARD NAMING
                  uint nonce, uint expiry, address relayer) internal view returns (bytes32) {
    return keccak256(abi.encodePacked("\x19\x01", domain_separator956,
                                      keccak256(abi.encode(hash, src, amount, min_eth, fee, nonce, expiry, relayer))
                                      )
                     );
  }

  // --- Dai actions ---
  // Requires dai.permit before execution

  // Transfer @amount dai to the receiver from the sender
  function DAICHEQUE561(address sender, address receiver, uint amount, uint fee, uint nonce,	//inject NONSTANDARD NAMING
                     uint expiry, address relayer, uint8 v, bytes32 r, bytes32 s) public {
    require(sender != address(0) && sender == ecrecover(DIGEST958(daicheque_typehash55, sender, receiver,
                                       amount, fee, nonce, expiry, relayer), v, r, s), "invalid cheque");
    require(nonce  == nonces[sender]++, "invalid nonce");
    require(expiry == 0 || now <= expiry, "cheque expired");
    dai619.TRANSFERFROM810(sender, relayer, fee);
    dai619.TRANSFERFROM810(sender, receiver, amount);
  }

  // Sell @amount dai for eth on uniswap
  function DAISWAP497(address sender, uint amount, uint min_eth, uint fee, uint nonce,	//inject NONSTANDARD NAMING
                   uint expiry, address relayer, uint8 v, bytes32 r, bytes32 s) public returns (uint256) {
    require(sender != address(0) && sender == ecrecover(DIGEST958(daiswap_typehash786, sender, amount,
                                       min_eth, fee, nonce, expiry, relayer), v, r, s), "invalid swap");
    require(nonce == nonces[sender]++, "invalid nonce");
    require(expiry == 0 || now <= expiry, "swap expired");
    dai619.TRANSFERFROM810(sender, address(this), amount);
    dai619.TRANSFERFROM810(sender, relayer, fee);
    return daiuniswap408.TOKENTOETHTRANSFERINPUT667(amount, min_eth, now, sender);
  }

  // Convert @amount dai to chai
  function JOINCHAI945(address sender, address receiver, uint amount, uint fee, uint nonce,	//inject NONSTANDARD NAMING
                    uint expiry, address relayer, uint8 v, bytes32 r, bytes32 s) public {
    require(sender != address(0) && sender == ecrecover(DIGEST958(chaijoin_typehash628, sender, receiver,
                                       amount, fee, nonce, expiry, relayer), v, r, s), "invalid join");
    require(nonce == nonces[sender]++, "invalid nonce");
    require(expiry == 0 || now <= expiry, "join expired");
    dai619.TRANSFERFROM810(sender, address(this), amount);
    dai619.TRANSFERFROM810(sender, relayer, fee);
    chai790.JOIN730(receiver, amount);
  }

  // --- Chai actions ---
  // Requires chai.permit before execution

  // Transfer @amount chai to the receiver from the sender
  function CHAICHEQUE878(address sender, address receiver, uint amount, uint fee, uint nonce,	//inject NONSTANDARD NAMING
                      uint expiry, address relayer, uint8 v, bytes32 r, bytes32 s) public {
    require(sender != address(0) && sender == ecrecover(DIGEST958(chaicheque_typehash839, sender, receiver,
                                       amount, fee, nonce, expiry, relayer), v, r, s), "invalid cheque");
    require(nonce  == nonces[sender]++, "invalid nonce");
    require(expiry == 0 || now <= expiry, "cheque expired");
    chai790.TRANSFERFROM810(sender, relayer, fee);
    chai790.TRANSFERFROM810(sender, receiver, amount);
  }

  // Sell @amount chai for eth on uniswap
  function CHAISWAP190(address sender, uint amount, uint min_eth, uint fee, uint nonce,	//inject NONSTANDARD NAMING
                    uint expiry, address relayer, uint8 v, bytes32 r, bytes32 s) public returns (uint256) {
    require(sender != address(0) && sender == ecrecover(DIGEST958(chaiswap_typehash303, sender, amount,
                                       min_eth, fee, nonce, expiry, relayer), v, r, s), "invalid swap");
    require(nonce == nonces[sender]++, "invalid nonce");
    require(expiry == 0 || now <= expiry, "swap expired");
    chai790.TRANSFERFROM810(sender, address(this), amount);
    chai790.TRANSFERFROM810(sender, relayer, fee);
    return chaiuniswap262.TOKENTOETHTRANSFERINPUT667(amount, min_eth, now, sender);
  }

  // Convert @amount chai to dai
  function EXITCHAI232(address sender, address receiver, uint amount, uint fee, uint nonce,	//inject NONSTANDARD NAMING
                    uint expiry, address relayer, uint8 v, bytes32 r, bytes32 s) public {
    require(sender != address(0) && sender == ecrecover(DIGEST958(chaiexit_typehash884, sender, receiver,
                                       amount, fee, nonce, expiry, relayer), v, r, s), "invalid exit");
    require(nonce == nonces[sender]++, "invalid nonce");
    require(expiry == 0 || now <= expiry, "exit expired");
    chai790.EXIT19(sender, amount);
    dai619.TRANSFERFROM810(address(this), receiver, dai619.BALANCEOF584(address(this)));
    chai790.TRANSFERFROM810(sender, relayer, fee);
  }
}