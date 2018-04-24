
-- VHDL Instantiation Created from source file Data_Path.vhd -- 13:48:53 01/22/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Data_Path
	PORT(
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW4 : IN std_logic;
		CW5 : IN std_logic;
		CW6 : IN std_logic;
		CW7 : IN std_logic;
		CW8 : IN std_logic;
		Selec_ALU : IN std_logic_vector(2 downto 0);
		Reset : IN std_logic;
		Clk : IN std_logic;          
		salFZ : OUT std_logic;
		salAlu : OUT std_logic_vector(3 downto 0);
		sal_opeA : OUT std_logic_vector(3 downto 0);
		sal_opeB : OUT std_logic_vector(3 downto 0);
		BusRam : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_Data_Path: Data_Path PORT MAP(
		CW0 => ,
		CW1 => ,
		CW2 => ,
		CW3 => ,
		CW4 => ,
		CW5 => ,
		CW6 => ,
		CW7 => ,
		CW8 => ,
		Selec_ALU => ,
		Reset => ,
		Clk => ,
		salFZ => ,
		salAlu => ,
		sal_opeA => ,
		sal_opeB => ,
		BusRam => 
	);


