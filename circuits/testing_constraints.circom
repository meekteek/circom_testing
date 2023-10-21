pragma circom 2.1.6;

template Main() {
    signal input x;
    signal input y;
    signal output out;

    out <-- x / y;
    y === out * x;

}
component main = Main();