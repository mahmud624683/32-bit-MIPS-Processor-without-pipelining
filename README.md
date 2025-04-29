# 32-bit MIPS Processor (Without Pipelining)

This project implements a 32-bit **MIPS processor** in Verilog, adhering to a simplified instruction set and register usage. The processor is developed using only **synthesizable Verilog code** and supports basic R-type, I-type, and jump operations.

---

## ✅ Features

- **32-bit instruction set**
- Supports **R-format**, **load**, **store**, **branch**, **jump**, and **addi** operations
- Designed using **synthesizable Verilog only**
- Utilizes **$t0–$t8** registers with 5-bit addressing (e.g., `5'b00000` for `$t0`, `5'b01000` for `$t8`)
- **128KB memory** with 32 initialized words for demonstration

---

## 🧠 Supported Instructions

| Operation       | Opcode  | Function | ALU Op | ALU Control |
|----------------|---------|----------|--------|-------------|
| R-format (ADD) | 000000  | 100000   | 10     | 0010        |
| R-format (SUB) | 000000  | 100010   | 10     | 0110        |
| R-format (AND) | 000000  | 100100   | 10     | 0000        |
| R-format (OR)  | 000000  | 100101   | 10     | 0001        |
| R-format (SLT) | 000000  | 101010   | 10     | 0111        |
| R-format (NOR) | 000000  | 101111   | 10     | 0011        |
| BEQ            | 000100  | xxxxxx   | 01     | 0110        |
| BNE            | 000110  | xxxxxx   | 01     | 0110        |
| LW             | 100011  | xxxxxx   | 00     | 0010        |
| SW             | 101011  | xxxxxx   | 00     | 0010        |
| JUMP           | 100110  | xxxxxx   | 00     | 0010        |
| ADDI           | 101000  | xxxxxx   | 00     | 0010        |

---

## 🔁 C Code Implementation

```c
int a = 0;
int b = 1;
int c;

for (int i = 0; i < 20; i = i + 2) {
    c = a + b;
    a = b;
    b = c;
}
// store value of `c` in data memory
```

---

## 🧾 Corresponding Assembly Code

```assembly
addi $t1, $t1, 0     # a = 0           | PC = 04
addi $t2, $t2, 1     # b = 1           | PC = 08
addi $t3, $t3, 0     # i = 0           | PC = 12
addi $t4, $t4, 20    # t4 = 20         | PC = 16

loop:
add  $s1, $t1, $t2   # c = a + b       | PC = 20
addi $t1, $t2, 0     # a = b           | PC = 24
addi $t2, $s1, 0     # b = c           | PC = 28
addi $t3, $t3, 2     # i = i + 2       | PC = 32
beq  $t4, $t3, 1     # if i == 20 -> skip next jump | PC = 36
j    loop            # else continue   | PC = 40

sw   $s1, 5($t4)     # store c in memory[5 + t4]    | PC = 44
slt  $s2, $t4, $s1   # check if c > 20              | PC = 48
```

---

## 🧰 Tools Used

- **Language**: Verilog
- **Simulation**: ModelSim / Cadence (recommended)
- **Synthesis**: Any FPGA synthesis tool supporting Verilog

---

## 📂 Memory and Register Mapping

- **Registers used**: `$t0–$t8`, `$s1`, `$s2`
- **5-bit addressing**: `5'b00000` to `5'b01000`
- **Data Memory**: 128KB total, first 32 words initialized to 0

---

## 📌 Notes

- This is a **non-pipelined** implementation.
- Control signals and ALU control logic are designed manually.
- Future work could involve adding pipelining stages and hazard handling.
