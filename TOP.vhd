----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:02 01/22/2016 
-- Design Name: 
-- Module Name:    TOP - Structural 
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

entity TOP is
	Port(
		Clk				: in std_logic;
		Push				: in std_logic;
		Reset				: in std_logic;
		Anodo 			: out STD_LOGIC_VECTOR (3 downto 0);
      Catodo 			: out STD_LOGIC_VECTOR (6 downto 0);
		LedsInternos	: out STD_LOGIC_VECTOR (6 downto 0);
		LedsExternos	: out STD_LOGIC_VECTOR (2 downto 0);
		LedFZ				: out std_logic
	);

end TOP; 

architecture Structural of TOP is
 
	COMPONENT Control_unit
	PORT(
		CLK : IN std_logic;
		Push : IN std_logic;
		RESET : IN std_logic;
		OpCode : IN std_logic_vector(2 downto 0);          
		ControlWord : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Debounce
	PORT(
		Push : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		FilteredPush : OUT std_logic
		);
	END COMPONENT;

COMPONENT Data_Path
	PORT(
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW4 : IN std_logic;
		CW5 : IN std_logic;
		CW6 : IN std_logic;
		CW7 : IN std_logic;
		CW8 : IN std_logic;
		Selec_ALU : IN std_logic_vector(2 downto 0);
		Reset : IN std_logic;
		Clk : IN std_logic;          
		salFZ : OUT std_logic;
		salAlu : OUT std_logic_vector(3 downto 0);
		sal_opeA : OUT std_logic_vector(3 downto 0);
		sal_opeB : OUT std_logic_vector(3 downto 0);
		BusRam : OUT std_logic_vector(3 downto 0);
		instruccion:	out std_logic_vector(9 downto 0)
		);
	END COMPONENT;


	COMPONENT Display7Seg_4ON
	PORT(
		Dato1 : IN std_logic_vector(3 downto 0);
		Dato2 : IN std_logic_vector(3 downto 0);
		Dato3 : IN std_logic_vector(3 downto 0);
		Dato4 : IN std_logic_vector(3 downto 0);
		CLK : IN std_logic;
		RESET : IN std_logic;          
		Anodo : OUT std_logic_vector(3 downto 0);
		Catodo : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

signal signal_filteredPush											: std_logic;
signal signal_controlWords											: std_logic_vector(11 downto 0);
signal signal_busRam		 											: std_logic_vector(3 downto 0);
signal signal_sal_opeA, signal_sal_opeB, signal_salALu	: std_logic_vector(3 downto 0);
signal signal_instruccion											: std_logic_vector(9 downto 0);
signal signalCW2,signalCW3,signalCW4,signalCW7,signalCW8 : std_logic;
begin
	
	Inst_Control_unit: Control_unit PORT MAP(
		CLK => Clk,
		Push => signal_filteredPush,
		RESET => Reset,
		OpCode => signal_instruccion(9 downto 7)	,
		ControlWord =>  signal_controlWords
	);

	Inst_Debounce: Debounce PORT MAP(
		Push => Push ,
		CLK => Clk,
		RESET => Reset,
		FilteredPush =>  signal_filteredPush
	);
	 
	
	signalCW2 <= signal_controlWords(2) and signal_filteredPush;
	signalCW3 <= signal_controlWords(3) and signal_filteredPush;
	signalCW4 <= signal_controlWords(4) and signal_filteredPush;
	signalCW7 <= signal_controlWords(7) and signal_filteredPush;
	signalCW8 <= signal_controlWords(8) and signal_filteredPush;
	
	Inst_Data_Path: Data_Path PORT MAP(
		CW0 => signal_controlWords(0) ,
		CW1 => signal_controlWords(1),
		CW2 => signalCW2,
		CW3 => signalCW3,
		CW4 => signalCW4,
		CW5 => signal_controlWords(5),
		CW6 => signal_controlWords(6),
		CW7 => signalCW7,
		CW8 => signalCW8,
		Selec_ALU => signal_controlWords(11 downto 9),
		Reset => Reset,
		Clk => Clk,
		salFZ => LedFZ,
		salAlu => signal_salALU,
		sal_opeA => signal_sal_opeA,
		sal_opeB => signal_sal_opeB,
		BusRam => signal_busRam,
		instruccion => signal_instruccion
	);

		Inst_Display7Seg_4ON: Display7Seg_4ON PORT MAP(
		Dato1 => signal_salALU,
		Dato2 => signal_sal_opeA,
		Dato3 => signal_sal_opeB,
		Dato4 => signal_busRam,
		CLK => Clk,
		RESET => Reset,
		Anodo => anodo,
		Catodo => catodo 
	);

	LedsInternos <= signal_instruccion(6 downto 0);						-- Descartamos el 4 bit del segundo campo.
	LedsExternos <= signal_instruccion(9 downto 7);		


end Structural;

