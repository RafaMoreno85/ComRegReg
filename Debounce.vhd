----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:47:44 12/16/2015 
-- Design Name: 
-- Module Name:    Debounce - Behavioral 
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

entity Debounce is
PORT(
		Push : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		FilteredPush : OUT std_logic
);
end Debounce;

architecture Structural of Debounce is

	COMPONENT DebouceFSM
	PORT(
		Push : IN std_logic;
		CLK : IN std_logic;
		Flag_Timer : IN std_logic;
		RESET : IN std_logic;          
		FilteredPush : OUT std_logic;
		EnableTimer : OUT std_logic
		);
	END COMPONENT;



	COMPONENT CLK_1KHz
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;          
		End300ms : OUT std_logic
		);
	END COMPONENT;
	
	
	
	COMPONENT TimerEnd300ms
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;
		Enable : IN std_logic;          
		End300ms : OUT std_logic
		);
	END COMPONENT;
	
	

signal Signal_Enable_Timer, Signal_End300ms : std_logic;


begin

 
Inst_DebouceFSM: DebouceFSM PORT MAP(
		Push => Push,
		CLK => CLK,
		Flag_Timer => Signal_End300ms,
		RESET => RESET,
		FilteredPush => FilteredPush,
		EnableTimer => Signal_Enable_Timer
);


	Inst_TimerEnd300ms: TimerEnd300ms PORT MAP(
		CLK => CLK,
		Reset => RESET,
		Enable => Signal_Enable_Timer,
		End300ms => Signal_End300ms
	);
	
	
end Structural;