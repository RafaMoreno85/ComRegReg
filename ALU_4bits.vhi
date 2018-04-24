
-- VHDL Instantiation Created from source file ALU_4bits.vhd -- 18:44:29 01/16/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ALU_4bits
	PORT(
		OPE_A : IN std_logic_vector(3 downto 0);
		OPE_B : IN std_logic_vector(3 downto 0);
		SEL_ALU : IN std_logic_vector(2 downto 0);          
		SalALU : OUT std_logic_vector(3 downto 0);
		SalZF : OUT std_logic
		);
	END COMPONENT;

	Inst_ALU_4bits: ALU_4bits PORT MAP(
		OPE_A => ,
		OPE_B => ,
		SEL_ALU => ,
		SalALU => ,
		SalZF => 
	);


