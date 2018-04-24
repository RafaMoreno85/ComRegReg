# Comp-Reg-Reg

Creation of a computer with the following caracteristics:

• Architecture or execution mode: Register-Register

• Same memory for data and program code. (Von Neumann). 

• Includes a registers bank

• Instruction Set Architecture (ISA) 7 Instructions:

– LD dir,R2 – Load memory data into a register.
– ST dir,R2 – Stores register data into memory.
– ADD R1,R2 – Makes add operation between R1 and R2.
– SUB R1,R2 – Makes substraction operation between R1 and R2.
– INC inm,R2 – Makes add operation between inmediate and R2
– DEC inm,R2 – Makes substraction operation between inmediate and R2 – BeQdir,XX–JumpstodirifFZ=’1’

• Operation codes:
– LD 000
– ST 001
– ADD 010 – SUB 011 – INC 100 – DEC 101 – BeQ 110

• Instruction lenght: 10 bits. 

• Instruction format:

– 1o Field: Operation code (3bits).

– 2o Field: Memory address (4bits) / Inmediate (4bits) / Register1 address (3bits).

– 3o Field: Register2 address.
