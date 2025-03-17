// IntegerDivision.asm
// Computes integer division: x = y * m + q

@R1
D=M
@INVALID
D;JEQ       // If y == 0, division is invalid

@R4
M=0         // Set valid flag to 0

@R2
M=0         // Quotient (m) = 0

@R0
D=M        // Load x into D
@R3
M=D        // Store x in R3 (remainder)

(LOOP)
@R3
D=M
@R1
D=D-M      // D = remainder - y
@END
D;JLT      // If remainder < y, exit

@R2
M=M+1      // Increment quotient (m)

@R3
M=D        // Update remainder (q)

@LOOP
0;JMP      // Repeat

(END)
0;JMP

(INVALID)
@R4
M=1        // Set invalid flag if division is not possible

