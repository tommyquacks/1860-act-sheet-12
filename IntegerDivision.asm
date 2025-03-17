// IntegerDivision.asm
// Computes integer division: x = y * m + q

@R0
D=M          // D = x
@R1
D=D-M        // D = x - y (Check if y > x)
@INVALID
D;JLT        // If x < y, set invalid flag

@R4
M=0          // Set valid flag to 0

@R2
M=0          // Quotient (m) = 0

@R3
M=R0         // Remainder (q) = x

(LOOP)
@R3
D=M
@R1
D=D-M        // D = remainder - y
@END
D;JLT        // If remainder < y, exit

@R2
M=M+1        // Increment quotient (m)

@R3
M=D          // Update remainder (q)

@LOOP
0;JMP        // Repeat

(END)
0;JMP

(INVALID)
@R4
M=1          // Set invalid flag

