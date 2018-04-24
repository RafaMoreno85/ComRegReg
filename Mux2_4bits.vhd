----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:24 10/21/2015 
-- Design Name: 
-- Module Name:    Mux2_4bits - Behavioral 
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

entity Mux2_4bits is
    Port ( A 		: in  STD_LOGIC_VECTOR(3 downto 0);
           B 		: in  STD_LOGIC_VECTOR(3 downto 0);
           Sel 	: in  STD_LOGIC;
           Z 		: out  STD_LOGIC_VECTOR(3 downto 0));
end Mux2_4bits;

architecture Behavioral of Mux2_4bits is

begin

Mux2_4bits: process(A,B,Sel)
begin
	if(Sel = '0') then
		Z <= A;
		--Z(0) <= A(0);
		--Z(1) <= A(1);
		--Z(2) <= A(2);
		--Z(3) <= A(3);
	else 
		Z <= B;
		--Z(0) <= B(0);
		--Z(1) <= B(1);
		--Z(2) <= B(2);
		--Z(3) <= B(3);
	end if;
end process Mux2_4bits;

end Behavioral;

