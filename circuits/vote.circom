pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/poseidon.circom";
include "../node_modules/circomlib/circuits/comparators.circom";

template VoteVerifier() {
    // Public inputs
    signal input proposalId;
    signal input nullifierHash;
    
    // Private inputs
    signal input identityNullifier;
    signal input identityTrapdoor;
    signal input vote; // 0 for against, 1 for support
    
    // Verify identity commitment
    component identityHasher = Poseidon(3);
    identityHasher.inputs[0] <== identityNullifier;
    identityHasher.inputs[1] <== identityTrapdoor;
    identityHasher.inputs[2] <== proposalId;
    
    // Verify nullifier
    component nullifierHasher = Poseidon(2);
    nullifierHasher.inputs[0] <== identityNullifier;
    nullifierHasher.inputs[1] <== proposalId;
    nullifierHasher.out === nullifierHash;
    
    // Verify vote is binary (0 or 1)
    component isValidVote = LessThan(2);
    isValidVote.in[0] <== vote;
    isValidVote.in[1] <== 2;
    isValidVote.out === 1;
}

component main = VoteVerifier();