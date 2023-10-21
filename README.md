# circom_testing

Playing around with circom

HashwithSalt is a circuit using sha256 on a preimage that is composed of an input message and input salt.

bool_gates is a circuit writing out what the boolean gates (in the form 1=true, 0=false) look like in circom. This is something included in standard lib.

testing_constraints is a circuit that does simple arithmetic but makes sure that constaints are defined correctly. This is because while you can use all operations in circom computation for witness generation, you can only use quadratic expressions (where divison is not valid) in constraint generation