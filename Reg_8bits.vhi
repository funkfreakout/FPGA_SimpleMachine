
-- VHDL Instantiation Created from source file Reg_8bits.vhd -- 19:04:11 01/18/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Reg_8bits
	PORT(
		DataIn : IN std_logic_vector(7 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		Enable : IN std_logic;          
		DataOut : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Reg_8bits: Reg_8bits PORT MAP(
		DataIn => ,
		Reset => ,
		CLK => ,
		Enable => ,
		DataOut => 
	);


