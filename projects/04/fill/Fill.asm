// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Check eerst het toetsenbord
(check_keyboard)
@KBD
D=M //D is nu de waarde van het toetsenbord

@PaintItBlack
D;JNE // als D niet 0 is, spring naar PiB

@DreamingOfAWhiteChristmas
0;JMP // anders spring naar PiW

(PaintItBlack)
@SCREEN // A is 16384
D=A // D is de index genaamd screen

@current // variabele current
M=D // bewaar de positie op deze plek

(zwart)
@current
A=M // zet A op de juiste plek, hierdoor verandert M
M=-1 // maak deze reeks zwart

@current
M=M+1 // verhoog de waarde van current met 1

@KBD
D=A // bewaar 'einde van scherm' in D
@current
D=M-D; // neem het verschil tussen de huidige positie en het einde van het scherm
@check_keyboard
D;JEQ  // als dat verschil nul is, spring naar keyboardcheck
@zwart
0;JMP  // anders ga door met de loooooop



(DreamingOfAWhiteChristmas)
@SCREEN // A is 16384
D=A // D is de index genaamd screen

@current // variabele current
M=D // bewaar de positie op deze plek

(wit)
@current
A=M // zet A op de juiste plek, hierdoor verandert M
M=0 // maak deze reeks zwart

@current
M=M+1 // verhoog de waarde van current met 1

@KBD
D=A // bewaar 'einde van scherm' in D
@current
D=M-D; // neem het verschil tussen de huidige positie en het einde van het scherm
@check_keyboard
D;JEQ  // als dat verschil nul is, spring naar keyboardcheck
@wit
0;JMP  // anders ga door met de loooooop




@END
0;JMP







