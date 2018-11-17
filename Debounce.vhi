
-- VHDL Instantiation Created from source file Debounce.vhd -- 15:31:59 01/24/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Debounce
	PORT(
		Push : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		FilteredPush : OUT std_logic
		);
	END COMPONENT;

	Inst_Debounce: Debounce PORT MAP(
		Push => ,
		CLK => ,
		RESET => ,
		FilteredPush => 
	);


