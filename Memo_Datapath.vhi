
-- VHDL Instantiation Created from source file Memo_Datapath.vhd -- 18:53:05 01/22/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Memo_Datapath
	PORT(
		Address : IN std_logic_vector(2 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW9_CW8 : IN std_logic_vector(1 downto 0);          
		DataBus : OUT std_logic_vector(7 downto 0);
		SalRegA : OUT std_logic_vector(7 downto 0);
		SalRegB : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic;
		SalALU : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Memo_Datapath: Memo_Datapath PORT MAP(
		Address => ,
		Reset => ,
		CLK => ,
		CW0 => ,
		CW1 => ,
		CW2 => ,
		CW3 => ,
		CW9_CW8 => ,
		DataBus => ,
		SalRegA => ,
		SalRegB => ,
		SalFZ => ,
		SalALU => 
	);


