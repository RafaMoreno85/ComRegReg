----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:00:06 11/18/2015 
-- Design Name: 
-- Module Name:    Display7Seg_4ON - Behavioral 
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

entity Display7Seg_4ON is
    Port ( Dato1 : in  STD_LOGIC_VECTOR (3 downto 0);
           Dato2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Dato3 : in  STD_LOGIC_VECTOR (3 downto 0);
           Dato4 : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Anodo : out  STD_LOGIC_VECTOR (3 downto 0);
           Catodo : out  STD_LOGIC_VECTOR (6 downto 0));
end Display7Seg_4ON;

architecture Structural of Display7Seg_4ON is
signal selector : std_logic_vector(1 downto 0);
signal output : std_logic_vector(3 downto 0);
signal frecuencia : std_logic;

	COMPONENT Mux4_4bits
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		C : IN std_logic_vector(3 downto 0);
		D : IN std_logic_vector(3 downto 0);
		Sel : IN std_logic_vector(1 downto 0);          
		Salida : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Disp7Seg
	PORT(
		Hex : IN std_logic_vector(3 downto 0);
		Select_Disp : IN std_logic_vector(1 downto 0);          
		Seg : OUT std_logic_vector(6 downto 0);
		Anode : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT YourTurn
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;
		Push_Inc : IN std_logic;          
		Count : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	COMPONENT CLK_1KHz
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;          
		Out_1KHz : OUT std_logic
		);
	END COMPONENT;


begin

	Inst_Mux4_4bits: Mux4_4bits PORT MAP(
		A => Dato1,
		B => Dato2,
		C => Dato3,
		D => Dato4,
		Sel => selector,
		Salida => output
	);

	Inst_Disp7Seg: Disp7Seg PORT MAP(
		Hex => output,
		Select_Disp => selector,
		Seg => Catodo,
		Anode => Anodo
	);
	
	Inst_YourTurn: YourTurn PORT MAP(
		CLK => 	CLK,
		Reset => RESET,
		Push_Inc => frecuencia,
		Count => selector
	);

	Inst_CLK_1KHz: CLK_1KHz PORT MAP(
		CLK => CLK,
		Reset => RESET,
		Out_1KHz => frecuencia
	);

end structural;

