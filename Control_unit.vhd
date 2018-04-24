----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:32:14 01/17/2016 
-- Design Name: 
-- Module Name:    Control_unit - Behavioral 
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

entity Control_unit is
	Port(		
			CLK : in  STD_LOGIC;
         Push : in  STD_LOGIC;
         RESET : in  STD_LOGIC;
         FZ : in  STD_LOGIC;
         ControlWord : out  STD_LOGIC_VECTOR (7 downto 0));
	end Control_unit;

architecture Behavioral of Control_unit is
------------------------------------------------------
-- DEFINITION of STATES
-------------------------------------------------------
type States_FSM is (Idle,LoadInst,LoadA,LoadB, AaddB);
signal Next_State: States_FSM;
------------------------------------------------------
-- DEFINITION of the OUTPUTS for each STATE
-------------------------------------------------------
constant Outputs_Idle: std_logic_Vector(9 downto 0):="0000000000";
constant Outputs_LoadInst: std_logic_Vector(9 downto 0):="0010010000";
constant Outputs_LoadA: std_logic_Vector(9 downto 0):="0000000001";
constant Outputs_LoadB: std_logic_Vector(9 downto 0):="0000100010";
constant Outputs_AaddB: std_logic_Vector(9 downto 0):="1000101100";-----------------------------------------------------------------
Begin
process (CLK,RESET)

begin
	if RESET = '1' then
	Next_State <= Idle; -- INICIO si RESET
	ControlWord<= Outputs_Idle; -- Salida estado Idle
	elsif rising_edge(CLK)then
		case Next_State is
		----------------
		-- State "Idle" -
		----------------
			when Idle=>
			if (Push = '1') then
				Next_State<= LoadInst;
				ControlWord<= Outputs_LoadInst;
			else
				Next_State <= Idle;
				ControlWord<= Outputs_Idle;
			end if;			------------------
			-- State "LoadInst"
			-------------------
			when LoadInst=>
			if (Push = '1') then
				Next_State <= LoadA;
				ControlWord <= Outputs_LoadA;
			else
				Next_State <= LoadInst;
				ControlWord <= Outputs_LoadInst;
			end if;
			----------------
			-- State "LoadA"
			----------------
			when LoadA=>
			if (Push = '1') then
				Next_State <= LoadB;
				ControlWord<= Outputs_LoadB;
			else
				Next_State <= LoadA;
				ControlWord<= Outputs_LoadA;
			end if;			
			-- State "LoadB"
			when LoadB =>
				if (Push = '1') then
				Next_State <= AaddB;
				ControlWord<= Outputs_AaddB;
			else
				Next_State <= LoadB;
				ControlWord<= Outputs_LoadB;
			end if;
			
			----------------
			-- State "AaddB"
			----------------
			when AaddB =>
			if (Push = '1') then
				Next_State <= LoadInst;
				ControlWord<= Output_LoadInst;
			Else
				Next_State <= AaddB;
				ControlWord<= Outputs_AaddB;
			end if;
		end case;
	end if;
	end process;
end Behavioral;



