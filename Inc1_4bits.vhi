
-- VHDL Instantiation Created from source file Inc1_4bits.vhd -- 14:16:46 01/16/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Inc1_4bits
	PORT(
		Value : IN std_logic_vector(3 downto 0);          
		Value_Inc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_Inc1_4bits: Inc1_4bits PORT MAP(
		Value => ,
		Value_Inc => 
	);


