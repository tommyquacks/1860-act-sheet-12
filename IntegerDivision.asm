// IntegerDivision.asm
// Computes m = x / y and q = x % y

@R1
D=M
@INVALID
D;JEQ       // If y == 0, division is invalid

@R4
M=0         // Set valid flag

@R2
M=0         // Quotient = 0

@R3
M=0         // Remainder = 0

(LOOP)
@R0
D=M
@R3
D=D-M
@END
D;JLT       // If x - remainder < 0, exit

@R2
M=M+1       // Increment quotient

@R3
M=M+M       // Subtract y from remainder

@LOOP
0;JMP       // Repeat

(END)
0;JMP

(INVALID)
@R4
M=1         // Division is invalid
