----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:43 11/11/2015 
-- Design Name: 
-- Module Name:    YourTurn - Behavioral 
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

entity YourTurn is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Push_Inc : in  STD_LOGIC;
           Count : out  STD_LOGIC_VECTOR (1 downto 0));
end YourTurn;

architecture Structural of YourTurn is

	COMPONENT RisingEdge
	PORT(
		RESET : IN std_logic;
		Push : IN std_logic;
		CLK : IN std_logic;          
		Pulse : OUT std_logic
		);
	END COMPONENT;
signal turno : std_logic;
signal contador : unsigned(1 downto 0);
begin

	Inst_RisingEdge: RisingEdge PORT MAP(
		RESET => Reset,
		Push => Push_Inc,
		CLK => CLK,
		Pulse => turno
	);
	
	process(CLK,RESET)
	begin
		if RESET = '1' then
			contador <= "00";
		elsif rising_edge(CLK) then
			if turno = '1' then
				contador <= contador + 1;
			end if;
		end if;
	end process;

Count <= std_logic_vector(contador);

end Structural;

