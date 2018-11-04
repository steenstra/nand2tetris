// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R2 // zorg dat R2, de output, standaard op 0 is geinitialiseerd
M=0

@R1  // haal eerst bij R1 de waarde op, 
D=M  // bewaar deze waarde in D
@end // zet je address waarde op end
D;JEQ // als D gelijk is aan 0, spring naar end

(mult)
@R0 // RAM[0] is selected
D=M

@R2 // select RAM[2], M = R2
M=D+M // verhoog D met M

@R1 
MD=M-1 // verminder R1 met 1
@mult
D;JGT  // kijk of D groter is dan 0, spring naar mult


(end)
@end
0;JMP

