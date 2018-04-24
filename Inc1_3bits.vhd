----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:59 10/28/2015 
-- Design Name: 
-- Module Name:    Inc1_3bits - Behavioral 
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

entity Inc1_4bits is
    Port ( Value : in  std_logic_vector (3 downto 0);
           Value_Inc : out  std_logic_vector (3 downto 0));
end Inc1_4bits;

architecture Behavioral of Inc1_4bits is

begin
	-- Hacemos cast con Value de std_logic_vector a unsigned para poder utilizar el operador + y asi incrementarlo 1.
	-- Al resultado le hacemos un casting a std_logic_vector para poder asignar el resultado a Value_Inc que es de tipo std_logic_vector
	Value_Inc <= std_logic_vector(unsigned(Value) + 1);

end Behavioral;

