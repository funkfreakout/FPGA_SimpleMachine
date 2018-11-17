
-- VHDL Instantiation Created from source file SimpleMachine.vhd -- 18:48:28 01/24/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT SimpleMachine
	PORT(
		Push : IN std_logic;
		Reset : IN std_logic;
		CLK : IN std_logic;          
		DataBus : OUT std_logic_vector(7 downto 0);
		AddressBus : OUT std_logic_vector(2 downto 0);
		SalRegA : OUT std_logic_vector(7 downto 0);
		SalRegB : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic;
		SalRI : OUT std_logic_vector(7 downto 0);
		SalALU : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_SimpleMachine: SimpleMachine PORT MAP(
		Push => ,
		Reset => ,
		CLK => ,
		DataBus => ,
		AddressBus => ,
		SalRegA => ,
		SalRegB => ,
		SalFZ => ,
		SalRI => ,
		SalALU => 
	);


