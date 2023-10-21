pragma circom 2.1.6;

template num2_fourbits() {
    signal input value;
    signal output bits[4];

    // \ is integer floor divison instead of true division
    bits[0] <-- value % 2;
    bits[1] <-- value \ 2 % 2;
    bits[2] <-- value \ 4 % 2;
    bits[3] <-- value \ 8 % 2;

    bits[0] * (bits[0] - 1) === 0;
    bits[1] * (bits[1] - 1) === 0;    
    bits[2] * (bits[2] - 1) === 0;
    bits[3] * (bits[3] - 1) === 0;

    bits[0] + 2*bits[1] + 4*bits[2] + 8*bits[3] === value;
}

component main = num2_fourbits();
/* INPUT = {
    "value": "11"
} */