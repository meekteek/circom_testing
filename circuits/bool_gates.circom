pragma circom 2.1.6;

// boolean gates where inputs should be 0 or 1.
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a * b;
}


template XOR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - 2 * a * b;

}

template NAND() {
    signal input a;
    signal input b;
    signal output out;

    out <== 1 - a * b;
}

// normally you'd not use component main and simply refer to this as a lib.
component main = AND();

