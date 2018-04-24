
-- VHDL Instantiation Created from source file Data_Path.vhd -- 18:18:12 01/16/2016
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
		Reset : IN std_logic;
		Clk : IN std_logic;          
		salFZ : OUT std_logic;
		salAlu : OUT std_logic_vector(3 downto 0);
		opeA : OUT std_logic_vector(3 downto 0);
		opeB : OUT std_logic_vector(3 downto 0)
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
		Reset => ,
		Clk => ,
		salFZ => ,
		salAlu => ,
		opeA => ,
		opeB => 
	);


