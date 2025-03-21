// SumArrayEntries.asm
// Computes the sum of an array of n elements

@R1
D=M
@INVALID
D;JLE       // If n <= 0, return 0

@R2
M=0         // Initialize sum = 0
@R3
M=0         // Initialize index = 0

(LOOP)
@R3
D=M
@R1
D=D-M
@END
D;JGE       // If index >= n, exit loop

@R0
D=M        // Load base address of the array
@R3
A=D+M      // Compute address of A[i]
D=M        // Load value from A[i]

@R2
D=D+M      // ✅ FIXED: First, do D = D + M
M=D        // ✅ Then, store D back in M (sum += A[i])

@R3
M=M+1      // index++

@LOOP
0;JMP      // Repeat

(END)
@END
0;JMP      // Halt execution

(INVALID)
@R2
M=0        // Return 0 if n <= 0
@END
0;JMP
