                                                                 

pragma solidity ^0.5.0;


library Pairing {
    struct G1Point {
        uint X;
        uint Y;
    }

    // Encoding of field elements is: X[0] * z + X[1]
    struct G2Point {
        uint[2] X;
        uint[2] Y;
    }

                                   
    function P1123()	//inject NONSTANDARD NAMING
        internal pure returns (G1Point memory)
    {
        return G1Point(1, 2);
    }

                                   
    function P2811() internal pure returns (G2Point memory) {	//inject NONSTANDARD NAMING
        return G2Point(
            [11559732032986387107991004021392285783925812861821192530917403151452391805634,
             10857046999023057135944570762232829481370756359578518086990519993285655852781],
            [4082367875863433681332203403145435568316851327593401208105741076214120093531,
             8495653923123431417604973247489272438418190587263600148770280649306958101930]
        );
    }

                                                                         
    function NEGATE972(G1Point memory p) internal pure returns (G1Point memory) {	//inject NONSTANDARD NAMING
        // The prime q in the base field F_q for G1
        uint q = 21888242871839275222246405745257275088696311157297823662689037894645226208583;
        if (p.X == 0 && p.Y == 0)
            return G1Point(0, 0);
        return G1Point(p.X, q - (p.Y % q));
    }

                                           
    function POINTADD50(G1Point memory p1, G1Point memory p2)	//inject NONSTANDARD NAMING
        internal view returns (G1Point memory r)
    {
        uint[4] memory input;
        input[0] = p1.X;
        input[1] = p1.Y;
        input[2] = p2.X;
        input[3] = p2.Y;
        bool success;
        assembly {
            success := staticcall(sub(gas, 2000), 6, input, 0xc0, r, 0x60)
        }
        require(success);
    }

                                                               
                                                                
    function POINTMUL977(G1Point memory p, uint s)	//inject NONSTANDARD NAMING
        internal view returns (G1Point memory r)
    {
        uint[3] memory input;
        input[0] = p.X;
        input[1] = p.Y;
        input[2] = s;
        bool success;
        assembly {
            success := staticcall(sub(gas, 2000), 7, input, 0x80, r, 0x60)
        }
        require (success);
    }

                                                         
                                                      
                                                                       
                    
    function PAIRING149(G1Point[] memory p1, G2Point[] memory p2)	//inject NONSTANDARD NAMING
        internal view returns (bool)
    {
        require(p1.length == p2.length);
        uint elements = p1.length;
        uint inputSize = elements * 6;
        uint[] memory input = new uint[](inputSize);
        for (uint i = 0; i < elements; i++)
        {
            input[i * 6 + 0] = p1[i].X;
            input[i * 6 + 1] = p1[i].Y;
            input[i * 6 + 2] = p2[i].X[0];
            input[i * 6 + 3] = p2[i].X[1];
            input[i * 6 + 4] = p2[i].Y[0];
            input[i * 6 + 5] = p2[i].Y[1];
        }
        uint[1] memory out;
        bool success;
        assembly {
            success := staticcall(sub(gas, 2000), 8, add(input, 0x20), mul(inputSize, 0x20), out, 0x20)
        }
        require(success);
        return out[0] != 0;
    }

                                                             
    function PAIRINGPROD2668(G1Point memory a1, G2Point memory a2, G1Point memory b1, G2Point memory b2)	//inject NONSTANDARD NAMING
        internal view returns (bool)
    {
        G1Point[] memory p1 = new G1Point[](2);
        G2Point[] memory p2 = new G2Point[](2);
        p1[0] = a1;
        p1[1] = b1;
        p2[0] = a2;
        p2[1] = b2;
        return PAIRING149(p1, p2);
    }
                                                               
    function PAIRINGPROD3149(	//inject NONSTANDARD NAMING
            G1Point memory a1, G2Point memory a2,
            G1Point memory b1, G2Point memory b2,
            G1Point memory c1, G2Point memory c2
    )
        internal view returns (bool)
    {
        G1Point[] memory p1 = new G1Point[](3);
        G2Point[] memory p2 = new G2Point[](3);
        p1[0] = a1;
        p1[1] = b1;
        p1[2] = c1;
        p2[0] = a2;
        p2[1] = b2;
        p2[2] = c2;
        return PAIRING149(p1, p2);
    }

                                                              
    function PAIRINGPROD4916(	//inject NONSTANDARD NAMING
            G1Point memory a1, G2Point memory a2,
            G1Point memory b1, G2Point memory b2,
            G1Point memory c1, G2Point memory c2,
            G1Point memory d1, G2Point memory d2
    )
        internal view returns (bool)
    {
        G1Point[] memory p1 = new G1Point[](4);
        G2Point[] memory p2 = new G2Point[](4);
        p1[0] = a1;
        p1[1] = b1;
        p1[2] = c1;
        p1[3] = d1;
        p2[0] = a2;
        p2[1] = b2;
        p2[2] = c2;
        p2[3] = d2;
        return PAIRING149(p1, p2);
    }
}


library Verifier
{
    using Pairing for Pairing.G1Point;
    using Pairing for Pairing.G2Point;

    function SCALARFIELD696 ()	//inject NONSTANDARD NAMING
        internal pure returns (uint256)
    {
        return 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    }

    struct VerifyingKey
    {
        Pairing.G1Point alpha;
        Pairing.G2Point beta;
        Pairing.G2Point gamma;
        Pairing.G2Point delta;
        Pairing.G1Point[] gammaABC;
    }

    struct Proof
    {
        Pairing.G1Point A;
        Pairing.G2Point B;
        Pairing.G1Point C;
    }

    struct ProofWithInput
    {
        Proof proof;
        uint256[] input;
    }


    function NEGATEY738( uint256 Y )	//inject NONSTANDARD NAMING
        internal 
        pure 
        returns (uint256)
    {
        uint q = 21888242871839275222246405745257275088696311157297823662689037894645226208583;
        return q - (Y % q);
    }


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function VERIFY862 (uint256[14] memory in_vk, uint256[] memory vk_gammaABC, uint256[8] memory in_proof, uint256[] memory proof_inputs)	//inject NONSTANDARD NAMING
        internal 
        view 
        returns (bool)
    {
        require( ((vk_gammaABC.length / 2) - 1) == proof_inputs.length );
        
        // Compute the linear combination vk_x
        uint256[3] memory mul_input;
        uint256[4] memory add_input;
        bool success;
        uint m = 2;

        // First two fields are used as the sum
        add_input[0] = vk_gammaABC[0];
        add_input[1] = vk_gammaABC[1];

        // Performs a sum of gammaABC[0] + sum[ gammaABC[i+1]^proof_inputs[i] ]
        for (uint i = 0; i < proof_inputs.length; i++) {
            mul_input[0] = vk_gammaABC[m++];
            mul_input[1] = vk_gammaABC[m++];
            mul_input[2] = proof_inputs[i];

            assembly {
                // ECMUL, output to last 2 elements of `add_input`
                success := staticcall(sub(gas, 2000), 7, mul_input, 0x80, add(add_input, 0x40), 0x60)
            }
            require(success);
            
            assembly {
                // ECADD
                success := staticcall(sub(gas, 2000), 6, add_input, 0xc0, add_input, 0x60)
            }
            require(success);
        }
        
        uint[24] memory input = [
            // (proof.A, proof.B)
            in_proof[0], in_proof[1],                           // proof.A   (G1)
            in_proof[2], in_proof[3], in_proof[4], in_proof[5], // proof.B   (G2)

            // (-vk.alpha, vk.beta)
            in_vk[0], NEGATEY738(in_vk[1]),                        // -vk.alpha (G1)
            in_vk[2], in_vk[3], in_vk[4], in_vk[5],             // vk.beta   (G2)

            // (-vk_x, vk.gamma)
            add_input[0], NEGATEY738(add_input[1]),                // -vk_x     (G1)
            in_vk[6], in_vk[7], in_vk[8], in_vk[9],             // vk.gamma  (G2)

            // (-proof.C, vk.delta)
            in_proof[6], NEGATEY738(in_proof[7]),                  // -proof.C  (G1)
            in_vk[10], in_vk[11], in_vk[12], in_vk[13]          // vk.delta  (G2)
        ];

        uint[1] memory out;
        assembly {
            success := staticcall(sub(gas, 2000), 8, input, 768, out, 0x20)
        }
        require(success);
        return out[0] != 0;
    }


    function VERIFY862(VerifyingKey memory vk, ProofWithInput memory pwi)	//inject NONSTANDARD NAMING
        internal 
        view 
        returns (bool)
    {
        return VERIFY862(vk, pwi.proof, pwi.input);
    }


    function VERIFY862(VerifyingKey memory vk, Proof memory proof, uint256[] memory input)	//inject NONSTANDARD NAMING
        internal 
        view 
        returns (bool)
    {
        require(input.length + 1 == vk.gammaABC.length);

        // Compute the linear combination vk_x
        Pairing.G1Point memory vk_x = vk.gammaABC[0];
        for (uint i = 0; i < input.length; i++)
            vk_x = Pairing.POINTADD50(vk_x, Pairing.POINTMUL977(vk.gammaABC[i + 1], input[i]));

        // Verify proof
        return Pairing.PAIRINGPROD4916(
            proof.A, proof.B,
            vk_x.NEGATE972(), vk.gamma,
            proof.C.NEGATE972(), vk.delta,
            vk.alpha.NEGATE972(), vk.beta);
    }
}

library MiMC
{
    function GETSCALARFIELD59 ()	//inject NONSTANDARD NAMING
        internal pure returns (uint256)
    {
        return 0x30644e72e131a029b85045b68181585d2833e84879b9709143e1f593f0000001;
    }

                                                                                                                              
    function MIMCPE7650( uint256 in_x, uint256 in_k, uint256 in_seed, uint256 round_count )	//inject NONSTANDARD NAMING
        internal pure returns(uint256 out_x)
    {
        assembly {
            if lt(round_count, 1) { revert(0, 0) }

            // Initialise round constants, k will be hashed
            let c := mload(0x40)
            mstore(0x40, add(c, 32))
            mstore(c, in_seed)

            let localQ := 0x30644e72e131a029b85045b68181585d2833e84879b9709143e1f593f0000001
            let t
            let a

            // Further n-2 subsequent rounds include a round constant
            for { let i := round_count } gt(i, 0) { i := sub(i, 1) } {
                // c = H(c)
                mstore(c, keccak256(c, 32))

                // x = pow(x + c_i, 7, p) + k
                t := addmod(addmod(in_x, mload(c), localQ), in_k, localQ)              // t = x + c_i + k
                a := mulmod(t, t, localQ)                                              // t^2
                in_x := mulmod(mulmod(a, mulmod(a, a, localQ), localQ), t, localQ)     // t^7
            }

            // Result adds key again as blinding factor
            out_x := addmod(in_x, in_k, localQ)
        }
    }
       
    function MIMCPE7_MP795( uint256[] memory in_x, uint256 in_k, uint256 in_seed, uint256 round_count )	//inject NONSTANDARD NAMING
        internal pure returns (uint256)
    {
        uint256 r = in_k;
        uint256 localQ = 0x30644e72e131a029b85045b68181585d2833e84879b9709143e1f593f0000001;

        for( uint256 i = 0; i < in_x.length; i++ )
        {
            r = (r + in_x[i] + MIMCPE7650(in_x[i], r, in_seed, round_count)) % localQ;
        }

        // uint256 x0 = in_x[0];
        // uint256 x1 = in_x[1];
        // uint256 m0 = MiMCpe7(x0, r, in_seed, round_count);
        // assembly {
        //     r := addmod(addmod(r, x0, localQ), m0, localQ)
        // }
        // uint256 m1 = MiMCpe7(x1, r, in_seed, round_count);
        // assembly {
        //     r := addmod(addmod(r, x1, localQ), m1, localQ)
        // }
        
        return r;
    }

    function HASH549( uint256[] memory in_msgs, uint256 in_key )	//inject NONSTANDARD NAMING
        internal pure returns (uint256)
    {
        return MIMCPE7_MP795(in_msgs, in_key, uint256(keccak256("mimc")), 91);
    }

    function HASH549( uint256[] memory in_msgs )	//inject NONSTANDARD NAMING
        internal pure returns (uint256)
    {
        return HASH549(in_msgs, 0);
    }
}

library MerkleTree
{
    // ceil(log2(1<<15))
    uint constant internal tree_depth763 = 15;	//inject NONSTANDARD NAMING


    // 1<<15 leaves
    uint constant internal max_leaf_count385 = 32768;	//inject NONSTANDARD NAMING


    struct Data
    {
        uint cur;
        uint256[32768][16] nodes; // first column = leaves, second column = leaves' parents, etc
    }

    function TREEDEPTH381() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return tree_depth763;
    }


    function FILLLEVELIVS916 (uint256[15] memory IVs)	//inject NONSTANDARD NAMING
        internal
        pure
    {
        IVs[0] = 149674538925118052205057075966660054952481571156186698930522557832224430770;
        IVs[1] = 9670701465464311903249220692483401938888498641874948577387207195814981706974;
        IVs[2] = 18318710344500308168304415114839554107298291987930233567781901093928276468271;
        IVs[3] = 6597209388525824933845812104623007130464197923269180086306970975123437805179;
        IVs[4] = 21720956803147356712695575768577036859892220417043839172295094119877855004262;
        IVs[5] = 10330261616520855230513677034606076056972336573153777401182178891807369896722;
        IVs[6] = 17466547730316258748333298168566143799241073466140136663575045164199607937939;
        IVs[7] = 18881017304615283094648494495339883533502299318365959655029893746755475886610;
        IVs[8] = 21580915712563378725413940003372103925756594604076607277692074507345076595494;
        IVs[9] = 12316305934357579015754723412431647910012873427291630993042374701002287130550;
        IVs[10] = 18905410889238873726515380969411495891004493295170115920825550288019118582494;
        IVs[11] = 12819107342879320352602391015489840916114959026915005817918724958237245903353;
        IVs[12] = 8245796392944118634696709403074300923517437202166861682117022548371601758802;
        IVs[13] = 16953062784314687781686527153155644849196472783922227794465158787843281909585;
        IVs[14] = 19346880451250915556764413197424554385509847473349107460608536657852472800734;
    }


    function HASHIMPL681 (uint256 left, uint256 right, uint256 IV)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        uint256[] memory x = new uint256[](2);
        x[0] = left;
        x[1] = right;

        return MiMC.HASH549(x, IV);
    }


    function INSERT662(Data storage self, uint256 leaf)	//inject NONSTANDARD NAMING
        internal
        returns (uint256 new_root, uint256 offset)
    {
        require(leaf != 0);


        uint256[15] memory IVs;
        FILLLEVELIVS916(IVs);

        offset = self.cur;

        require(offset != max_leaf_count385 - 1);

        self.nodes[0][offset] = leaf;

        new_root = UPDATETREE655(self, IVs);

        self.cur = offset + 1;
    }


                                                   
    function VERIFYPATH412(uint256 leaf, uint256[15] memory in_path, bool[15] memory address_bits)	//inject NONSTANDARD NAMING
        internal 
        pure 
        returns (uint256 merkleRoot)
    {
        uint256[15] memory IVs;
        FILLLEVELIVS916(IVs);

        merkleRoot = leaf;

        for (uint depth = 0; depth < tree_depth763; depth++) {
            if (address_bits[depth]) {
                merkleRoot = HASHIMPL681(in_path[depth], merkleRoot, IVs[depth]);
            } else {
                merkleRoot = HASHIMPL681(merkleRoot, in_path[depth], IVs[depth]);
            }
        }
    }


    function VERIFYPATH412(Data storage self, uint256 leaf, uint256[15] memory in_path, bool[15] memory address_bits)	//inject NONSTANDARD NAMING
        internal 
        view 
        returns (bool)
    {
        return VERIFYPATH412(leaf, in_path, address_bits) == GETROOT428(self);
    }


    function GETLEAF643(Data storage self, uint depth, uint offset)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        return GETUNIQUELEAF131(depth, offset, self.nodes[depth][offset]);
    }


    function GETMERKLEPROOF931(Data storage self, uint index)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256[15] memory proof_path)
    {
        for (uint depth = 0; depth < tree_depth763; depth++)
        {
            if (index % 2 == 0) {
                proof_path[depth] = GETLEAF643(self, depth, index + 1);
            } else {
                proof_path[depth] = GETLEAF643(self, depth, index - 1);
            }
            index = uint(index / 2);
        }
    }


    function GETUNIQUELEAF131(uint256 depth, uint256 offset, uint256 leaf)	//inject NONSTANDARD NAMING
        internal pure returns (uint256)
    {
        if (leaf == 0x0)
        {
            leaf = uint256(
                sha256(
                    abi.encodePacked(
                        uint16(depth),
                        uint240(offset)))) % MiMC.GETSCALARFIELD59();
        }

        return leaf;
    }


    function UPDATETREE655(Data storage self, uint256[15] memory IVs)	//inject NONSTANDARD NAMING
        internal returns(uint256 root)
    {
        uint currentIndex = self.cur;
        uint256 leaf1;
        uint256 leaf2;

        for (uint depth = 0; depth < tree_depth763; depth++)
        {

            if (currentIndex%2 == 0)
            {
                leaf1 = self.nodes[depth][currentIndex];

                leaf2 = GETUNIQUELEAF131(depth, currentIndex + 1, self.nodes[depth][currentIndex + 1]);
            } else
            {
                leaf1 = GETUNIQUELEAF131(depth, currentIndex - 1, self.nodes[depth][currentIndex - 1]);

                leaf2 = self.nodes[depth][currentIndex];
            }

            uint nextIndex = uint(currentIndex/2);

            self.nodes[depth+1][nextIndex] = HASHIMPL681(leaf1, leaf2, IVs[depth]);

            currentIndex = nextIndex;
        }

        return self.nodes[tree_depth763][0];
    }


    function GETROOT428 (Data storage self)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        return self.nodes[tree_depth763][0];
    }

    function GETNEXTLEAFINDEX72 (Data storage self)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        return self.cur;
    }
}


contract Mixer
{
    using MerkleTree for MerkleTree.Data;

    uint constant public amount841 = 0.01 ether;	//inject NONSTANDARD NAMING

    uint256[14] vk;
    uint256[] gammaABC;

    mapping (uint256 => bool) public nullifiers;
    mapping (address => uint256[]) public pendingDeposits;

    MerkleTree.Data internal tree;

    event COMMITMENTADDED713(address indexed _fundingWallet, uint256 _leaf);	//inject NONSTANDARD NAMING
    event LEAFADDED514(uint256 _leaf, uint256 _leafIndex);	//inject NONSTANDARD NAMING
    event DEPOSITWITHDRAWN325(uint256 _nullifier);	//inject NONSTANDARD NAMING

    constructor(uint256[14] memory in_vk, uint256[] memory in_gammaABC)
        public
    {
        vk = in_vk;
        gammaABC = in_gammaABC;
    }

    function GETROOT428()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256)
    {
        return tree.GETROOT428();
    }

                                                                              
    function COMMIT976(uint256 leaf, address fundingWallet)	//inject NONSTANDARD NAMING
        public
        payable
    {
        require(leaf > 0, "null leaf");
        pendingDeposits[fundingWallet].push(leaf);
        emit COMMITMENTADDED713(fundingWallet, leaf);
        if (msg.value > 0) FUNDCOMMITMENT238();
    }

    function FUNDCOMMITMENT238() private {	//inject NONSTANDARD NAMING
        require(msg.value == amount841, "wrong value");
        uint256[] storage leaves = pendingDeposits[msg.sender];
        require(leaves.length > 0, "commitment must be sent first");
        uint256 leaf = leaves[leaves.length - 1];
        leaves.length--;
        (, uint256 leafIndex) = tree.INSERT662(leaf);
        emit LEAFADDED514(leaf, leafIndex);
    }

                                                                                    
    function () external payable {
        FUNDCOMMITMENT238();
    }

    // should not be used in production otherwise nullifier_secret would be shared with node!
    function MAKELEAFHASH528(uint256 nullifier_secret, address wallet_address)	//inject NONSTANDARD NAMING
        external
        pure
        returns (uint256)
    {
        // return MiMC.Hash([nullifier_secret, uint256(wallet_address)], 0);
        bytes32 digest = sha256(abi.encodePacked(nullifier_secret, uint256(wallet_address)));
        uint256 mask = uint256(-1) >> 4; // clear the first 4 bits to make sure we stay within the prime field
        return uint256(digest) & mask;
    }

    // should not be used in production otherwise nullifier_secret would be shared with node!
    function MAKENULLIFIERHASH794(uint256 nullifier_secret)	//inject NONSTANDARD NAMING
        external
        pure
        returns (uint256)
    {
        uint256[] memory vals = new uint256[](2);
        vals[0] = nullifier_secret;
        vals[1] = nullifier_secret;
        return MiMC.HASH549(vals, 0);
    }

    function GETMERKLEPATH452(uint256 leafIndex)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256[15] memory out_path)
    {
        out_path = tree.GETMERKLEPROOF931(leafIndex);
    }

    function ISSPENT391(uint256 nullifier)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool)
    {
        return nullifiers[nullifier];
    }

    function VERIFYPROOF476(uint256 in_root, address in_wallet_address, uint256 in_nullifier, uint256[8] memory proof)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool)
    {
        uint256[] memory snark_input = new uint256[](3);
        snark_input[0] = in_root;
        snark_input[1] = uint256(in_wallet_address);
        snark_input[2] = in_nullifier;

        return Verifier.VERIFY862(vk, gammaABC, proof, snark_input);
    }

    function WITHDRAW464(	//inject NONSTANDARD NAMING
        address payable in_withdraw_address,
        uint256 in_nullifier,
        uint256[8] memory proof
    )
        public
    {
        uint startGas = gasleft();
        require(!nullifiers[in_nullifier], "Nullifier used");
        require(VERIFYPROOF476(GETROOT428(), in_withdraw_address, in_nullifier, proof), "Proof verification failed");

        nullifiers[in_nullifier] = true;
        emit DEPOSITWITHDRAWN325(in_nullifier);

        uint gasUsed = startGas - gasleft() + 57700;
        uint relayerRefund = gasUsed * tx.gasprice;
        if(relayerRefund > amount841/20) relayerRefund = amount841/20;
        in_withdraw_address.transfer(amount841 - relayerRefund); // leaf withdrawal
        msg.sender.transfer(relayerRefund); // relayer refund
    }

    function TREEDEPTH381() external pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MerkleTree.TREEDEPTH381();
    }

    function GETNEXTLEAFINDEX72() external view returns (uint256) {	//inject NONSTANDARD NAMING
        return tree.GETNEXTLEAFINDEX72();
    }
}