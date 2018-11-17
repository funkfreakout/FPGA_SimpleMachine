
-- VHDL Instantiation Created from source file RegPC.vhd -- 20:24:41 01/22/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RegPC
	PORT(
		DataIn : IN std_logic_vector(2 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		Enable : IN std_logic;          
		DataOut : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_RegPC: RegPC PORT MAP(
		DataIn => ,
		Reset => ,
		CLK => ,
		Enable => ,
		DataOut => 
	);


