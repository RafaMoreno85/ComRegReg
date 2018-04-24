----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:55 12/16/2015 
-- Design Name: 
-- Module Name:    Timer300ms - Behavioral 
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

entity TimerEnd300ms is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Enable : in STD_LOGIC;
           End300ms : out  STD_LOGIC);
end TimerEnd300ms;

architecture Behavioral of TimerEnd300ms is

constant EndCount: integer :=15000000; -- Número de ciclos de CLK a contar.
signal Counter: integer range 0 to EndCount;

begin
	process(CLK,Reset,Enable)
	begin
		if Reset= '1' then 
			Counter <= 0; 
			End300ms <='0';
		elsif rising_edge (CLK) then
		if Enable = '1' then
				if Counter = EndCount -1 then
					Counter <= 0;
					End300ms <= '1';
				else
					Counter <= Counter +1;
					End300ms <= '0';
				end if;
		end if;
	end if;
	end process;
end Behavioral;