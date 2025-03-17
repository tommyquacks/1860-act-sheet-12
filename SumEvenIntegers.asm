// SumEvenIntegers.asm
// Computes sum of first n even numbers

@R0
D=M         // D = n

@NEGATIVE
D;JLT       // If n < 0, jump to NEGATIVE case

@R1
M=0         // Initialize sum = 0

@R2
M=0         // Initialize i = 0

(LOOP)
@R0
D=M
@R2
D=D-M
@END
D;JLE       // If i > n, exit loop

@R2
D=M
D=D+M       // 2 * i

@R1
M=M+D       // sum += 2 * i

@R2
M=M+1       // i++

@LOOP
0;JMP       // Repeat

(NEGATIVE)
@R1
M=-1        // Store -1 for invalid input
@END
0;JMP

(END)
