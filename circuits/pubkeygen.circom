pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/mimcsponge.circom";


// groupsig will verify that you are one of the multisig keyowners who signed a specific message
template GroupSig() {
    signal input sk;
    signal input pk1;
    signal input pk2;
    signal input pk3;

    signal input msgHash;

    component pkGen = MiMCSponge(1, 220, 1);
    pkGen.ins[0] <== sk;
    pkGen.k <== 0;

    signal pk;
    pk <== pkGen.outs[0];
    
    signal temp;
    temp <== (pk-pk1)*(pk-pk2);
    0 === temp*(pk-pk3);

    // prevents replay attack for different messages
    signal dummy_mhash;
    dummy_mhash <== msgHash * msgHash;

}
component main{ public [pk1, pk2, pk3, msgHash] } = GroupSig();

/* INPUT = {
    "sk": "42",
    "pk1": "100",
    "pk2": "10644022205700269842939357604110603061463166818082702766765548366499887869490",
    "pk3": "101",
    "msgHash": "10"
} */