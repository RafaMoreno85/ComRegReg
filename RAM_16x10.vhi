
-- VHDL Instantiation Created from source file RAM_16x10.vhd -- 14:12:03 01/16/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RAM_16x10
	PORT(
		Reset : IN std_logic;
		DataIn : IN std_logic_vector(3 downto 0);
		Address : IN std_logic_vector(3 downto 0);
		WE : IN std_logic;
		Clk : IN std_logic;          
		DataOut : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;

	Inst_RAM_16x10: RAM_16x10 PORT MAP(
		Reset => ,
		DataIn => ,
		DataOut => ,
		Address => ,
		WE => ,
		Clk => 
	);


