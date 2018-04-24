----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:03:50 12/02/2015 
-- Design Name: 
-- Module Name:    RAM_16x4 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

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
	signal RAM : ram_type:= ("0000000000",
							"0000000000","0000000000","0000000000","0000000000","0000000000","0000000000","0000000000","0000000000","0000000000","0000000000",
							"0000000000","0000000000","0000000000","0000000000", "0000000000"); --Position 15 ....... Position 0
				
begin
	process (Clk)
	Begin
		if (Reset = '1') then
			RAM(0)  <= "0001011111"; -- RAM(11) -> REG(7); (REG(7)=11)
			RAM(1)  <= "0100111011"; -- REG(7) + REG(3) -> REG(3); (REG(3)=14)
			RAM(2)  <= "1000001011"; -- 1 + REG(3) -> REG(3); (REG(3)=15)
			RAM(3)  <= "0011011011"; -- REG(3) -> RAM(11); (RAM(11)=15)
			RAM(4)  <= "1010001110"; -- REG(6) - 1 -> REG(6); (REG(6)=5) 
			RAM(5)  <= "0110100101"; -- REG(5) - REG(4) -> REG(5); (REG(5)=1)
			RAM(6)  <= "1100000000"; -- Si FZ=1, DirSalto -> PC; (No salta)
			RAM(7)  <= "1010010010"; -- REG(2) - 2 -> REG(2); (REG(2)=0)
			RAM(8)  <= "1100000000"; -- Si FZ=1, DirSalto -> PC; (Salta)
			RAM(9)  <= "1111111111"; -- Sin utilidad
			RAM(10) <= "1111111111"; -- Sin utilidad
			RAM(11) <= "0000000001"; -- RAM con dato=1
			RAM(12) <= "0000000010"; -- RAM con dato=2
			RAM(13) <= "0000000011"; -- RAM con dato=3
			RAM(14) <= "0000000100"; -- RAM con dato=4
			RAM(15) <= "0000000101"; -- RAM con dato=5
		
		else if rising_edge(Clk) then
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
		end if;
	end process;

end Behavioral;

