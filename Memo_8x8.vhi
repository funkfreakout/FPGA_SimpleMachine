
-- VHDL Instantiation Created from source file Memo_8x8.vhd -- 17:48:22 01/22/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Memo_8x8
	PORT(
		Address : IN std_logic_vector(2 downto 0);
		CW3 : IN std_logic;
		CLK : IN std_logic;
		Reset : IN std_logic;
		DataIn : IN std_logic_vector(7 downto 0);          
		DataOut : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Memo_8x8: Memo_8x8 PORT MAP(
		Address => ,
		CW3 => ,
		CLK => ,
		Reset => ,
		DataIn => ,
		DataOut => 
	);


