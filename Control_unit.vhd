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
			CLK 					: in  STD_LOGIC;
         Push 					: in  STD_LOGIC;
         RESET 				: in  STD_LOGIC;
        -- FZ 					: in  STD_LOGIC;													-- Como controlo el BEQ con una puerta and, en principio esto no necesita esa entrada.
			OpCode				: in 	STD_LOGIC_VECTOR(2 downto 0);
         ControlWord 		: out  STD_LOGIC_VECTOR (11 downto 0));
	end Control_unit;

architecture Behavioral of Control_unit is
------------------------------------------------------
-- DEFINITION of STATES
-------------------------------------------------------
type States_FSM is (Idle,LoadInst,Deco,Load,Store,AaddB,AsubB,BincA,BdecA,BeQ);
signal Next_State: States_FSM;
------------------------------------------------------
-- DEFINITION of the OUTPUTS for each STATE
-------------------------------------------------------
constant Outputs_Idle		: std_logic_Vector(11 downto 0):="000000000000";
constant Outputs_LoadInst	: std_logic_Vector(11 downto 0):="000010001000";
constant Outputs_Deco		: std_logic_Vector(11 downto 0):="000000000000";
constant Outputs_Load		: std_logic_Vector(11 downto 0):="000001010010";
constant Outputs_Store		: std_logic_Vector(11 downto 0):="001000000110";
constant Outputs_AaddB		: std_logic_Vector(11 downto 0):="010100110000";
constant Outputs_AsubB		: std_logic_Vector(11 downto 0):="011100110000";
constant Outputs_BincA		: std_logic_Vector(11 downto 0):="100100010000";
constant Outputs_BdecA		: std_logic_Vector(11 downto 0):="101100010000";
constant Outputs_BeQ			: std_logic_Vector(11 downto 0):="110010000001";-----------------------------------------------------------------
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
				Next_State <= Deco;
				ControlWord <= Outputs_Deco;
			else
				Next_State <= LoadInst;
				ControlWord <= Outputs_LoadInst;
			end if;
		----------------
		-- State "Deco"
		----------------
			when Deco=>
			if(Push = '1') then
				case (OpCode) is 
					when "000" =>
						Next_State <= Load;
						ControlWord <= Outputs_Load;
					when "001" =>
						Next_State <= Store;
						ControlWord <= Outputs_Store;
					when "010" =>
						Next_State <= AaddB;
						ControlWord <= Outputs_AaddB;
					when "011" =>
						Next_State <= AsubB;
						ControlWord <= Outputs_AsubB;
					when "100" =>
						Next_State <= BincA;
						ControlWord <= Outputs_BincA;
					when "101" =>
						Next_State <= BdecA;
						ControlWord <= Outputs_BdecA;
					when "110" =>
						Next_State <= BeQ;											-- No es necesario controlar FZ ya que lo hago por hardware.
						ControlWord <= Outputs_BeQ;
					when others =>
						Next_State <= LoadInst;										-- En el caso de que el opcode esté mal, cargamos la siguiente instrucción.
						ControlWord <= Outputs_LoadInst;
				end case;	
			else
				Next_State <= Deco;
				ControlWord <= Outputs_Deco;
			end if;
		----------------
		-- State "Load"
		----------------
			when Load =>
			if (Push = '1') then
				Next_State <= LoadInst;
				ControlWord<= Outputs_LoadInst;
			else
				Next_State <= Load;
				ControlWord<= Outputs_Load;
			end if;		----------------
		-- State "Store"
		---------------
			when Store =>
				if (Push = '1') then
				Next_State <= LoadInst;
				ControlWord<= Outputs_LoadInst;
			else
				Next_State <= Store;
				ControlWord<= Outputs_Store;
			end if;
		----------------
		-- State "AaddB"
		----------------
			when AaddB =>
			if (Push = '1') then
				Next_State <= LoadInst;
				ControlWord<= Outputs_LoadInst;
			Else
				Next_State <= AaddB;
				ControlWord<= Outputs_AaddB;
			end if;
		----------------
		-- State "AsubB"
		----------------
			when AsubB =>
			if (Push = '1') then
				Next_State <= LoadInst;
				ControlWord<= Outputs_LoadInst;
			Else
				Next_State <= AsubB;
				ControlWord<= Outputs_AsubB;
			end if;
		----------------
		-- State "BincA"
		----------------
			when BincA =>
			if (Push = '1') then
				Next_State <= LoadInst;
				ControlWord<= Outputs_LoadInst;
			Else
				Next_State <= BincA;
				ControlWord<= Outputs_BincA;
			end if;
		---------------- 
		-- State "BdecA"
		----------------
			when BdecA =>
			if (Push = '1') then
				Next_State <= LoadInst;
				ControlWord<= Outputs_LoadInst;
			Else
				Next_State <= BdecA;
				ControlWord<= Outputs_BdecA;
			end if;
		----------------
		-- State "BeQ"
		----------------
			when BeQ =>
			if (Push = '1') then
				Next_State <= LoadInst;
				ControlWord<= Outputs_LoadInst;
			Else
				Next_State <= BeQ;
				ControlWord<= Outputs_BeQ;
			end if;
		end case;
	end if;
	end process;
end Behavioral;



