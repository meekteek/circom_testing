pragma circom 2.1.6;

// not complete, needs a snark-friendly keygen algo for GroupSig
template GroupSig() {
    signal input sk;
    signal input pk1;
    signal input pk2;
    signal input pk3;

    signal pk;
    component pkGen = PubKeyGen();
    pkGen.in <== sk;
    pk <== pkGen.out;
    
    signal temp;
    temp <=== (pk-pk1)*(pk-pk2);
    0 === temp*(pk-pk3);
}
component main{public [pk1, pk2, pk3]} = GroupSig();

/* INPUT = {
    "sk":,
    "pk1":,
    "pk2":,
    "pk3": 
}