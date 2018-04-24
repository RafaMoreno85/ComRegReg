----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:33:11 01/16/2016 
-- Design Name: 
-- Module Name:    RAM_16x10 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM_16x10 is
    Port ( 
				Reset 	: in std_logic;
				DataIn 	: in  STD_LOGIC_VECTOR (9 downto 0);
				DataOut 	: out  STD_LOGIC_VECTOR (9 downto 0);
				Address 	: in  STD_LOGIC_VECTOR (3 downto 0);
				WE 		: in  STD_LOGIC;
				Clk 		: in  STD_LOGIC);
end RAM_16x10;

architecture Behavioral of RAM_16x10 is
	type ram_type is array(15 downto 0) of std_logic_vector(9 downto 0);
	signal RAM : ram_type:= ("0001111000",
							"0100000101","0110000111","1000001011","1010001110","0011011000","0001101001","0110000001","1100000000","1111111111","1111111111",
							"0000000001","0000000010","0000000011","0000000100", "0000000101"); --Position 15 ....... Position 0
				
begin
process (Clk, Reset)
	Begin				-- Pendiente mirar el decremento.
		--if (Reset = '1') then
		--	RAM(0)  <= "0001111000"; -- Reg(0) = Mem(15)	; Ahora Reg(0) valdrá 5
		--	RAM(1)  <= "0100000101"; -- Reg(5) += Reg(0)	; Ahora Reg(0) valdrá 10 (5+5)
		--	RAM(2)  <= "0110101111"; -- Reg(5) -= Reg(7)	; Ahora Reg(0) valdrá 3	(10-7)	
		--	RAM(3)  <= "1000001101"; -- Reg(5)++			; Ahora Reg(0) valdrá 4
		--	RAM(4)  <= "1010001101"; -- REG(5)--			; Ahora Reg(0) valdrá 3 
		--	RAM(5)  <= "0011011101"; -- Carga en Mem(11) el valor contenido en Reg(0) (En este caso 3). 
		--	RAM(6)  <= "0001011001"; -- Carga en Reg(1) el valor contenido en Mem(11) (En este caso 3).
		--	RAM(7)  <= "0110101001"; -- Reg(1) -= Reg(5)	; Ahora Reg(1) valdrá 0 y FZ = 1
		--	RAM(8)  <= "1100000000"; -- Si FZ = 1, el valor del PC pasará a ser el 0
		--	RAM(9)  <= "1111111111"; -- Sin utilidad
		--	RAM(10) <= "1111111111"; -- Sin utilidad
		--	RAM(11) <= "0000000001"; -- RAM con dato=1
		--	RAM(12) <= "0000000010"; -- RAM con dato=2
		--	RAM(13) <= "0000000011"; -- RAM con dato=3
		--	RAM(14) <= "0000000100"; -- RAM con dato=4
		--	RAM(15) <= "0000000101"; -- RAM con dato=5
		
		--else
		if rising_edge(Clk) then
					-- Operación de LECTURA/ESCRITURA síncrona
					if WE = '1' then
						RAM(to_integer(unsigned(Address))) <= DataIn ; -- Conversión en dos pasos de
						-- std_logic_vector a
						-- integer(numeric_std)
						DataOut <= DataIn; --El dato que se lee, es el mismo que se escribe
					else
						-- Operación de SOLO LECTURA
						DataOut <= RAM(to_integer(unsigned(Address))); -- Valor leído en Address
				end if;
			end if;
		--end if;
		--end if;
	end process;

end Behavioral;

