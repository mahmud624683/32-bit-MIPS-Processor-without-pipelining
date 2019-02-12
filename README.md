# 32-bit-MIPS-Processor-without-pipelining

This 32-bit MIPS processor is designed keeping the following specifications in mind.

 The instruction set will be 32-bit and compatible with R-format, load operation, store
operation, branch and unconditional jump.

 The six students will form 3 sub-group. Initially, One sub-group will work on ALU and
Register, another group on Instruction memory and Data memory and the third group on
the control circuit design. After finishing their respective job all the sub-group will work
as one group and integrate the whole design.

 The MIPS module (Processor module) must be designed only using synthesizeable
Verilog code. Proper commenting throughout the code will be given positive marks.

 Although traditional MIPS architecture has 32 registers reserved for proper functionality,
for the design purpose only $t0 - $t8 registers are required with 5-bit addressing i.e
5’b00000 corresponding to $s0 and 5’b01000 corresponding to $t8. With 32-bit addressing, the data memory has a size of 4Gb. For project demonstration,
only the first 32 word memories could be initialized to zero.


Operation         Opcode    Function    alu_op  alu_control

R-format (ADD)    000000    100000      10      0010

R-format (SUB)    000000    100010      10      0110

R-format (AND)    000000    100100      10      0000

R-format (OR)     000000    100101      10      0001

R-format (SLT)    000000    101010      10      0111

R-format (NOR)    000000    101111      10      0011

Beq               000100    xxxxxx      01      0110

Bne               000110    xxxxxx      01      0110

Lw                100011    xxxxxx      00      0010

Sw                101011    xxxxxx      00      0010

Jump              100110    xxxxxx      00      0010

Addi              101000    xxxxxx      00      0010


 Finally We have implement the following c-code whose equivalent assembly
language is also given below.
// c code - 01
int a=0; // temporary variable 1
int b=1; // temporary variable 2
int c; // variable three
for (int i=0; i<20; i=i+2)
{
c=a+b; // variable 3 = variable 1 + variable 2
a=b; // variable 1 gets the value of variable 2
b=c; // variable 2 gets the new value of variable 3
}
// store value of “c” in data memory// Assembly code
//initialize the first two variables in temp register
addi $t1, $t1, 0 // PC=04
addi $t2, $t2, 1 // PC=08
addi $t3, $t3, 0 // $t3 holds the value of int i. PC=12
addi $t4, $t4, 20 // $t4 = 20. PC=16
add $s1, $t1, $t2 // c=a+b. PC=20
addi $t1, $t2, 0 // a=b. PC=24
addi $t2, $s1, 0 // b=c. PC=28
addi $t3, $t3, 2 // i=i+2. PC=32
beq $t4, $t3, 1 // if branch taken then jump to PC+4+4
// PC=36
j 5 // else jump to PC=20. Loop continues PC=40
sw $s1, 5($t4) // memory[5+$t4] = $s1 PC=44
slt $s2, $t4, $s1 // if $s2=1 then c>20 PC=48
// Program ends here
