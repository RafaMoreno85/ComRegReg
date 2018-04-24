----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:40 01/17/2016 
-- Design Name: 
-- Module Name:    Banco_Registros_8x4 - Behavioral 
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

entity Banco_registros_8x4 is
		Port ( 
           DataOut_reg1				: out  STD_LOGIC_VECTOR (3 downto 0);
			  DataOut_reg2				: out  STD_LOGIC_VECTOR (3 downto 0);
			  Address_reg1	 			: in  STD_LOGIC_VECTOR 	(2 downto 0);
			  Address_reg2 			: in  STD_LOGIC_VECTOR 	(2 downto 0);
			  DataIn_reg2				: in STD_LOGIC_VECTOR (3 downto 0);
			  WE 							: in  STD_LOGIC;
           Clk 						: in  STD_LOGIC;
			  Reset						: in	STD_LOGIC);
end Banco_registros_8x4;

architecture Behavioral of Banco_registros_8x4 is
type bReg_type is array(7 downto 0) of std_logic_vector(3 downto 0);
	signal bReg : bReg_type:=("0111",
							"0110","0101","0100","0011","0010","0001","0000"); --Position 7....... Position 0
begin
	process (Clk,Reset)
	Begin
		if Reset = '1' then
			bReg(0)  <= "0000"; 
			bReg(1)  <= "0001"; 
			bReg(2)  <= "0010"; 
			bReg(3)  <= "0011"; 
			bReg(4)  <= "0100";  
			bReg(5)  <= "0101"; 
			bReg(6)  <= "0110";
			bReg(7)  <= "0111"; 
		else if rising_edge(Clk) then
				-- Operación de LECTURA/ESCRITURA síncrona
				if WE = '1' then
					bReg(to_integer(unsigned(Address_reg2))) <= DataIn_reg2 ; -- Conversión en dos pasos
					
					DataOut_reg1 <= bReg(to_integer(unsigned(Address_reg1)));
					DataOut_reg2 <= DataIn_reg2;										 --El dato que se lee, es el mismo que se escribe
				else
					-- Operación de SOLO LECTURA
					DataOut_reg1 <= bReg(to_integer(unsigned(Address_reg1))); 
					DataOut_reg2 <= bReg(to_integer(unsigned(Address_reg2))); 
				end if;
			end if;
		end if;
	end process;

end Behavioral;