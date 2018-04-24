
-- VHDL Instantiation Created from source file Control_unit.vhd -- 13:46:49 01/22/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Control_unit
	PORT(
		CLK : IN std_logic;
		Push : IN std_logic;
		RESET : IN std_logic;
		OpCode : IN std_logic_vector(2 downto 0);          
		ControlWord : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;

	Inst_Control_unit: Control_unit PORT MAP(
		CLK => ,
		Push => ,
		RESET => ,
		OpCode => ,
		ControlWord => 
	);


