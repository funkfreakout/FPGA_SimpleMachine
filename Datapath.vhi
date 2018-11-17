
-- VHDL Instantiation Created from source file Datapath.vhd -- 17:47:33 01/22/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Datapath
	PORT(
		DataBus : IN std_logic_vector(7 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW9_CW8 : IN std_logic_vector(1 downto 0);          
		SalALU : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic;
		SalRegA : OUT std_logic_vector(7 downto 0);
		SalRegB : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Datapath: Datapath PORT MAP(
		DataBus => ,
		Reset => ,
		CLK => ,
		CW0 => ,
		CW1 => ,
		CW2 => ,
		CW9_CW8 => ,
		SalALU => ,
		SalFZ => ,
		SalRegA => ,
		SalRegB => 
	);


