--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:26:00 01/22/2016
-- Design Name:   
-- Module Name:   H:/Examen TDC/CompRegReg/Control_unit_tb.vhd
-- Project Name:  CompRegReg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control_unit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Control_unit_tb IS
END Control_unit_tb;
 
ARCHITECTURE behavior OF Control_unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_unit
    PORT(
         CLK 				: IN  std_logic;
         Push 				: IN  std_logic;
         RESET 			: IN  std_logic;
       --  FZ 				: IN  std_logic;								
         OpCode 			: IN  std_logic_vector(2 downto 0);
         ControlWord 	: OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK 				: std_logic := '0';
   signal Push 			: std_logic := '0';
   signal RESET 			: std_logic := '0';
  -- signal FZ 			: std_logic := '0';
   signal OpCode 			: std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ControlWord 	: std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_unit PORT MAP (
          CLK => CLK,
          Push => Push,
          RESET => RESET,
         -- FZ => FZ,
          OpCode => OpCode,
          ControlWord => ControlWord
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Reset <= '1';
		wait for 20 ns;
		Reset <= '0';
		wait for 20 ns;

		-- IDLE - LOADINST
		push <= '1';						-- salimos de idle
		wait for 20 ns;
		
		-- LOADINST - DECO
		OpCode <= "000";					-- Estamos en LoadInst
		push <= '1';						-- y pasamos a Deco
		wait for 20 ns;
		
		-- DECO
		push <= '0';						-- Seguimos en Deco
		wait for 20 ns;					

		-- DECO - LOAD
		push <= '1';						-- Pasamos de Deco a Load
		wait for 20 ns;
		
		-- LOAD
		push <= '0';						-- Seguimos en Load
		wait for 20 ns;
		
		-- LOAD - LOADINST
		push <= '1';						-- Pasamos de Load a LoadInst
		wait for 20 ns;
		
		-- LOADINST
		push <= '0';						-- Seguimos en LoadInst
		wait for 20 ns;					
		
		-- LOADINST - DECO
		OpCode <= "001";					-- Estamos en LoadInst
		push <= '1';						-- y pasamos a Deco
		wait for 20 ns;
		
		-- DECO - STORE
		push <= '1';						-- Estamos en Deco 
		wait for 20 ns;					-- y pasamos a Store
		
		-- STORE	
		push <= '0';						-- Seguimos en Store
		wait for 20 ns;					
		
		-- STORE - LOADINST
		push <= '1';						-- Pasamos de Store a LoadInst
		wait for 20 ns;
		
		-- LOADINST
		push <= '0';						-- Seguimos en LoadInst
		wait for 20 ns;					
		
		-- LOADINST - DECO
		OpCode <= "010";					-- Estamos en LoadInst
		push <= '1';						-- y pasamos a Deco
		wait for 20 ns;
		
		-- DECO - AaddB
		push <= '1';						-- Estamos en Deco 
		wait for 20 ns;					-- y pasamos a AaddB
		
		-- AaddB	
		push <= '0';						-- Seguimos en AaddB
		wait for 20 ns;					
		
		-- AaddB - LOADINST
		push <= '1';						-- Pasamos de AaddB a LoadInst
		wait for 20 ns;
		
		-- LOADINST
		push <= '0';						-- Seguimos en LoadInst
		wait for 20 ns;					
		
		-- LOADINST - DECO
		OpCode <= "011";					-- Estamos en LoadInst
		push <= '1';						-- y pasamos a Deco
		wait for 20 ns;
		
		-- DECO - AsubB
		push <= '1';						-- Estamos en Deco 
		wait for 20 ns;					-- y pasamos a AsubB
		
		-- AsubB	
		push <= '0';						-- Seguimos en AsubB
		wait for 20 ns;					
		
		-- AsubB - LOADINST
		push <= '1';						-- Pasamos de AsubB a LoadInst
		wait for 20 ns;
		
		-- LOADINST
		push <= '0';						-- Seguimos en LoadInst
		wait for 20 ns;					
		
		-- LOADINST - DECO
		OpCode <= "100";					-- Estamos en LoadInst
		push <= '1';						-- y pasamos a Deco
		wait for 20 ns;
		
		-- DECO - BincA
		push <= '1';						-- Estamos en Deco 
		wait for 20 ns;					-- y pasamos a BincA
		
		-- BincA	
		push <= '0';						-- Seguimos en BincA
		wait for 20 ns;					
		
		-- BincA - LOADINST
		push <= '1';						-- Pasamos de BincA a LoadInst
		wait for 20 ns;
		
		-- LOADINST
		push <= '0';						-- Seguimos en LoadInst
		wait for 20 ns;					
		
		-- LOADINST - DECO
		OpCode <= "101";					-- Estamos en LoadInst
		push <= '1';						-- y pasamos a Deco
		wait for 20 ns;
		
		-- DECO - BdecA
		push <= '1';						-- Estamos en Deco 
		wait for 20 ns;					-- y pasamos a BdecA
		
		-- BdecA	
		push <= '0';						-- Seguimos en BdecA
		wait for 20 ns;					
		
		-- BdecA - LOADINST
		push <= '1';						-- Pasamos de BdecA a LoadInst
		wait for 20 ns;
		
		-- LOADINST
		push <= '0';						-- Seguimos en LoadInst
		wait for 20 ns;					
		
		-- LOADINST - DECO
		OpCode <= "110";					-- Estamos en LoadInst
		push <= '1';						-- y pasamos a Deco
		wait for 20 ns;
		
		-- DECO - BeQ
		push <= '1';						-- Estamos en Deco 
		wait for 20 ns;					-- y pasamos a BeQ
		
		-- BeQ	
		push <= '0';						-- Seguimos en BeQ
		wait for 20 ns;					
		
		-- BeQ - LOADINST
		push <= '1';						-- Pasamos de BeQ a LoadInst
		wait for 20 ns;
		wait;
   end process;
END;
