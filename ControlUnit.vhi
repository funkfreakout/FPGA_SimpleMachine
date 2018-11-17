
-- VHDL Instantiation Created from source file ControlUnit.vhd -- 19:22:03 01/23/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ControlUnit
	PORT(
		COP : IN std_logic;
		Reset : IN std_logic;
		CLK : IN std_logic;
		Push : IN std_logic;
		FZ : IN std_logic;          
		ControlWord : OUT std_logic
		);
	END COMPONENT;

	Inst_ControlUnit: ControlUnit PORT MAP(
		COP => ,
		Reset => ,
		CLK => ,
		Push => ,
		FZ => ,
		ControlWord => 
	);


