// IntegerDivision.asm
// Computes integer division: x = y * m + q, where x is in R0, y is in R1
// Outputs: R2 = m (quotient), R3 = q (remainder), R4 = flag (1 if invalid, 0 otherwise)
// Does not modify R0 or R1

// Initialize variables
@R0
D=M
@R5
M=D        // R5 = x (temp copy of R0)

@R1
D=M
@R6
M=D        // R6 = y (temp copy of R1)

@R2
M=0        // R2 = m (quotient, initialize to 0)
@R3
M=0        // R3 = q (remainder, initialize to 0)
@R4
M=0        // R4 = flag (initialize to 0)

// Check if y == 0 (invalid division)
@R6
D=M
@INVALID
D;JEQ      // If y == 0, jump to INVALID

// Store sign of x (R7 = 1 if x < 0, 0 if x >= 0)
@R5
D=M
@X_POS
D;JGE      // If x >= 0, skip negation
@R7
M=1        // R7 = 1 (x is negative)
@R5
M=-M       // R5 = |x|
@CHECK_Y
0;JMP
(X_POS)
@R7
M=0        // R7 = 0 (x is positive)
(CHECK_Y)

// Store sign of y (R8 = 1 if y < 0, 0 if y >= 0)
@R6
D=M
@Y_POS
D;JGE      // If y >= 0, skip negation
@R8
M=1        // R8 = 1 (y is negative)
@R6
M=-M       // R6 = |y|
@DIV_START
0;JMP
(Y_POS)
@R8
M=0        // R8 = 0 (y is positive)

// Start division using absolute values
(DIV_START)
@R5
D=M
@R3
M=D        // R3 = remainder (initially |x|)
@R2
M=0        // R2 = quotient (reset to 0)

// Division loop: subtract |y| from remainder until remainder < |y|
(DIV_LOOP)
@R3
D=M
@R6
D=D-M      // remainder - |y|
@DIV_END
D;JLT      // If remainder < |y|, division is done
@R3
M=D        // Update remainder
@R2
M=M+1      // Increment quotient
@DIV_LOOP
0;JMP

// Adjust quotient and remainder based on signs
(DIV_END)
@R7
D=M
@R8
D=D-M
@SAME_SIGN
D;JEQ      // If signs are the same, skip negation of quotient
@R2
M=-M       // Negate quotient if signs differ

(SAME_SIGN)
// Remainder takes the sign of x
@R7
D=M
@R_POS
D;JEQ      // If x >= 0, remainder is already positive
@R3
M=-M       // If x < 0, negate remainder
(R_POS)

// Set flag to 0 (valid division) and end
@END
0;JMP

(INVALID)
@R4
M=1        // Set flag to 1 (invalid division)
@R2
M=0        // Quotient = 0
@R3
M=0        // Remainder = 0

(END)
@END
0;JMP      // Infinite loop to terminate
