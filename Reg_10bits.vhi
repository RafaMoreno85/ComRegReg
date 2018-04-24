
-- VHDL Instantiation Created from source file Reg_10bits.vhd -- 14:12:30 01/16/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Reg_10bits
	PORT(
		RESET : IN std_logic;
		DataIn : IN std_logic_vector(9 downto 0);
		CLK : IN std_logic;
		ENABLE : IN std_logic;          
		DataOut : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;

	Inst_Reg_10bits: Reg_10bits PORT MAP(
		RESET => ,
		DataIn => ,
		CLK => ,
		ENABLE => ,
		DataOut => 
	);


