----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:17:13 10/21/2015 
-- Design Name: 
-- Module Name:    Disp7Seg - Behavioral 
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

entity Disp7Seg is
    Port ( Hex : in  STD_LOGIC_VECTOR (3 downto 0);
           Select_Disp : in  STD_LOGIC_VECTOR (1 downto 0);
           Seg : out  STD_LOGIC_VECTOR (6 downto 0);
           Anode : out  STD_LOGIC_VECTOR (3 downto 0));
end Disp7Seg;

architecture Behavioral of Disp7Seg is

begin
   with Select_Disp select Anode <= 
		"0111" when "00",
		"1011" when "01",
		"1101" when "10",
		"1110" when "11",
      "0000" when others;

	with Hex select Seg <=
		"0000001" when "0000",
		"1001111" when "0001",
		"0010010" when "0010",
		"0000110" when "0011",
		"1001100" when "0100",
		"0100100" when "0101",
		"0100000" when "0110",
		"0001111" when "0111",
		"0000000" when "1000",
		"0001100" when "1001",
		"0001000" when "1010",
		"0000000" when "1011",
		"1110001" when "1100",
		"0000001" when "1101",
		"0110000" when "1110",
		"0111000" when "1111",
		"0000001" when others;
				

end Behavioral;

