// Square.asm
// Computes y = x^2 and stores in R1

@R0
D=M         // D = x

@R1
M=0         // Initialize R1 = 0 (y = 0)

@LOOP
D;JEQ       // If x == 0, exit loop

@R1
M=D+M       // y = y + x

D=D-1       // Decrease counter

@LOOP
D;JGT       // Repeat while x > 0

