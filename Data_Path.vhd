----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:18:52 01/16/2016 
-- Design Name: 
-- Module Name:    Data_Path - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
 
entity Data_Path is
	Port (
				CW0: 				in  std_logic;
				CW1: 				in  std_logic;
				CW2: 				in  std_logic;
				CW3: 				in  std_logic;
				CW4: 				in  std_logic;
				CW5: 				in  std_logic;
				CW6: 				in  std_logic;
				CW7: 				in  std_logic;
				CW8: 				in  std_logic;
				Selec_ALU: 		in  std_logic_vector(2 downto 0);
				Reset:			in	 std_logic;
				Clk:				in  std_logic;
				salFZ:			out std_logic;
				salAlu:			out std_logic_vector(3 downto 0);
				sal_opeA:		out std_logic_vector(3 downto 0);
				sal_opeB:		out std_logic_vector(3 downto 0);
				BusRam:			out std_logic_vector(3 downto 0);
				instruccion:	out std_logic_vector(9 downto 0)
				);
end Data_Path;

architecture Structural of Data_Path is
signal opA, opB, resAlu,mux3_alu,mux4_bReg: 					std_logic_vector(3 downto 0);
signal mem_regInst, sal_regInst, bReg_mem:					std_logic_vector(9 downto 0);
signal signal_salFZ, FFD_salFZ, control_PC:					std_logic;	
signal pc_inc_mux2, inc_mux1, mux1_pc,mux2_mem:				std_logic_vector(3 downto 0);

COMPONENT Mux2_4bits
	PORT(
		A 						: IN std_logic_vector(3 downto 0);
		B 						: IN std_logic_vector(3 downto 0);
		Sel 					: IN std_logic;          
		Z 						: OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT RAM_16x10
	PORT(
		Reset 				: IN std_logic;
		DataIn 				: IN std_logic_vector(9 downto 0);
		Address 				: IN std_logic_vector(3 downto 0);
		WE 					: IN std_logic;
		Clk 					: IN std_logic;          
		DataOut				: OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;

COMPONENT Reg_10bits
	PORT(
		RESET : IN std_logic;
		DataIn : IN std_logic_vector(9 downto 0);
		CLK : IN std_logic;
		ENABLE : IN std_logic;          
		DataOut : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;
	
COMPONENT Inc1_4bits
	PORT(
		Value : IN std_logic_vector(3 downto 0);          
		Value_Inc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	
COMPONENT Reg_4bits
	PORT(
		RESET : IN std_logic;
		DataIn : IN std_logic_vector(3 downto 0);
		CLK : IN std_logic;
		ENABLE : IN std_logic;          
		DataOut : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

COMPONENT ALU_4bits
	PORT(
		OPE_A : IN std_logic_vector(3 downto 0);
		OPE_B : IN std_logic_vector(3 downto 0);
		SEL_ALU : IN std_logic_vector(2 downto 0);          
		SalALU : OUT std_logic_vector(3 downto 0);
		SalZF : OUT std_logic
		);
	END COMPONENT;

COMPONENT FFD_Basic
	PORT(
		D : IN std_logic;
		CLK : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;          
		Q : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT Banco_registros_8x4
	PORT(
		Address_reg1 : IN std_logic_vector(2 downto 0);
		Address_reg2 : IN std_logic_vector(2 downto 0);
		DataIn_reg2 : IN std_logic_vector(3 downto 0);
		WE : IN std_logic;
		Clk : IN std_logic;
		Reset : IN std_logic;          
		DataOut_reg1 : OUT std_logic_vector(3 downto 0);
		DataOut_reg2 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
begin
			
	control_PC <= CW0 and FFD_salFZ;							-- 	Puerta and que determina lo que se elegirá a la hora de trabajar con el PC

	MUX1: Mux2_4bits PORT MAP(									-- 	0 PC+1 // 1 Salto
		A => inc_mux1,
		B => sal_regInst(6 downto 3),							--		1 0 1 0 0 1 0 1 0 1
		Sel => control_PC,								
		Z => mux1_pc
	);

	MUX2: Mux2_4bits PORT MAP(									--		
		A => 	pc_inc_mux2 ,
		B => resAlu,
		Sel => CW1 ,
		Z => mux2_mem
	);
	
	BusRam <= mux2_mem;
	
	MUX3: Mux2_4bits PORT MAP(
		A => sal_regInst(6 downto 3),
		B => opA,
		Sel => CW5,
		Z => mux3_alu
	);
	

	MUX4: Mux2_4bits PORT MAP(
		A => resAlu ,
		B => mem_regInst(3 downto 0),										-- Se ponen al revés.
		Sel => CW6 ,
		Z => mux4_bReg
	);

	Inst_RAM_16x10: RAM_16x10 PORT MAP(
		Reset => Reset,
		DataIn => bReg_mem,
		DataOut => mem_regInst,
		Address => mux2_mem,
		WE => CW2,
		Clk => Clk
	);
	
	Inst_Reg_10bits: Reg_10bits PORT MAP(						-- Pendiente de preguntar si es mejor omitir este paso
		RESET => Reset ,
		DataIn => mem_regInst,
		CLK => Clk,
		ENABLE => CW3,
		DataOut => sal_regInst
	);

	Inst_Inc1_4bits: Inc1_4bits PORT MAP(
		Value => pc_inc_mux2,
		Value_Inc => inc_mux1
	);
	
	Inst_Reg_4bits: Reg_4bits PORT MAP(
		RESET => Reset ,
		DataIn => mux1_pc,
		CLK => Clk,
		ENABLE => CW7,
		DataOut => pc_inc_mux2
	);
	
	Inst_ALU_4bits: ALU_4bits PORT MAP(
		OPE_A => mux3_alu,
		OPE_B => opB,
		SEL_ALU => Selec_ALU ,
		SalALU => resAlu,
		SalZF => signal_salFZ
	);
	
	instruccion <= sal_regInst;
		
	Inst_FFD_Basic: FFD_Basic PORT MAP(
		D => signal_salFZ,
		CLK => Clk,
		ENABLE => CW8,
		RESET => Reset,
		Q => FFD_salFZ 
	);
	
-------------------------------------------- BANCO DE REGISTROS -------------------------------------------------	

	Inst_Banco_registros_8x4: Banco_registros_8x4 PORT MAP(
		DataOut_reg1 => opA ,
		DataOut_reg2 => opB,
		Address_reg1 => sal_regInst(5 downto 3),							--Despreciamos el bit 6
		Address_reg2 => sal_regInst(2 downto 0),
		DataIn_reg2 => mux4_breg,
		WE => CW4,
		Clk => Clk,
		Reset => Reset 
	);

------------------------------------------- FIN BANCO DE REGISTROS ----------------------------------------------

----------------------------------------------
-- Reajustamos el tamaño para el caso de store.
	bReg_mem(9 downto 4) <= "000000";
	bReg_mem(3 downto 0) <= opB;		
----------------------------------------------
-- Para paso transparente a memoria
	--transp_mem(9 downto 4) <= "000000";
	--transp_mem(3 downto 0) <= resAlu;
----------------------------------------------
	
	

	salFZ 		<= FFD_salFZ;
	sal_opeA		<=	mux3_alu;
	sal_opeB		<= opB;
	salAlu 		<= resAlu;

end Structural;

