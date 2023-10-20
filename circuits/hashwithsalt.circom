pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/sha256/sha256.circom";

template HashWithSalt() {
    signal input salt[32];
    signal input preimage[256];
    var combined[288];
    signal output hash[256];

    for (var i = 0; i < 32; i++) {
      combined[i] = salt[i];
    }

    for (var i = 32; i < 288; i++)
    {
      combined[i] = preimage[i-32];
    }
    
    component hasher = Sha256(288);
    
    hasher.in <== combined;
    hash <== hasher.out;
}

component main = HashWithSalt();