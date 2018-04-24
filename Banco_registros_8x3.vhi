
-- VHDL Instantiation Created from source file Banco_registros_8x3.vhd -- 16:58:09 01/17/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Banco_registros_8x3
	PORT(
		Address_reg1 : IN std_logic_vector(2 downto 0);
		Address_reg2 : IN std_logic_vector(2 downto 0);
		DataIn_reg2 : IN std_logic_vector(3 downto 0);
		WE : IN std_logic;
		Clk : IN std_logic;
		Reset : IN std_logic;          
		DataOut_reg1 : OUT std_logic_vector(3 downto 0);
		DataOut_reg2 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_Banco_registros_8x3: Banco_registros_8x3 PORT MAP(
		DataOut_reg1 => ,
		DataOut_reg2 => ,
		Address_reg1 => ,
		Address_reg2 => ,
		DataIn_reg2 => ,
		WE => ,
		Clk => ,
		Reset => 
	);


