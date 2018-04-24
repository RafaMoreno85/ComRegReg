----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:05:31 12/16/2015 
-- Design Name: 
-- Module Name:    DeBounceFSM - Behavioral 
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

entity DebouceFSM is
    Port ( Push : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  Flag_Timer : in STD_LOGIC;
           RESET : in  STD_LOGIC;
           FilteredPush : out  STD_LOGIC;
           EnableTimer : out  STD_LOGIC);
end DebouceFSM;

architecture Behavioral of DebouceFSM is

type FSM_STATES is (inic,S0,S01,espera);
signal Next_State: FSM_STATES;
signal Push_Sync: std_logic;

begin

Sincro_FFD: process(CLK,RESET,Push)
begin
	if RESET= '1' then -- reset asíncrono
		Push_Sync <= '0';
	elsif rising_edge(CLK) then
			Push_Sync <= Push;
	end if;
	
	
end process;


DebounceFSM: process (RESET,CLK,Flag_Timer)
begin
	if RESET = '1' then
		Next_State <= inic;
		
	elsif rising_edge(CLK) then
		case Next_State is
		-- EStado inicial
		when inic =>
			if Push_Sync = '0' then
				Next_State <= S0; --goes to "0-"
				FilteredPush <= '0';
				EnableTimer <= '0';				
			else
				Next_State <= inic; --Keeps waiting for a "0-"
				FilteredPush <= '0'; --out
				EnableTimer <= '0'; --out
			end if;	
		when S0 =>
			if Push_Sync = '1' then
				Next_State <= S01; --goes to "01"
				FilteredPush <= '0'; --out
				EnableTimer <= '0'; --out
			else
				Next_State <= S0; --Keeps waiting for an "1"
				FilteredPush <= '0'; --out
				EnableTimer <= '0'; --out
			end if;
		when espera =>
			if Flag_Timer = '1' then
				Next_State <= inic;
				FilteredPush <= '0'; -- Salida
				EnableTimer <= '0'; -- Salida
			else Next_State <= espera;
				FilteredPush <= '0'; -- Salida
				EnableTimer <= '1'; -- Salida
				
			end if;
		when others => Next_State <= espera;
				FilteredPush <= '1'; --out
				EnableTimer <= '0'; --out
	end case;
end if;
end process;

end Behavioral;