
-- VHDL Instantiation Created from source file PC_RI_Memo_Datapath.vhd -- 19:21:12 01/23/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PC_RI_Memo_Datapath
	PORT(
		Reset : IN std_logic;
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW4 : IN std_logic;
		CW6_CW5 : IN std_logic_vector(1 downto 0);
		CW7 : IN std_logic;
		CW9_CW8 : IN std_logic_vector(1 downto 0);          
		DataBus : OUT std_logic_vector(7 downto 0);
		AddressBus : OUT std_logic_vector(2 downto 0);
		SalRegA : OUT std_logic_vector(7 downto 0);
		SalRegB : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic;
		SalRI : OUT std_logic_vector(7 downto 0);
		SalALU : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_PC_RI_Memo_Datapath: PC_RI_Memo_Datapath PORT MAP(
		Reset => ,
		CLK => ,
		CW0 => ,
		CW1 => ,
		CW2 => ,
		CW3 => ,
		CW4 => ,
		CW6_CW5 => ,
		CW7 => ,
		CW9_CW8 => ,
		DataBus => ,
		AddressBus => ,
		SalRegA => ,
		SalRegB => ,
		SalFZ => ,
		SalRI => ,
		SalALU => 
	);


