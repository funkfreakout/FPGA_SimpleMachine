
-- VHDL Instantiation Created from source file Display7Seg_4ON.vhd -- 18:49:01 01/24/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Display7Seg_4ON
	PORT(
		Dato1 : IN std_logic_vector(3 downto 0);
		Dato2 : IN std_logic_vector(3 downto 0);
		Dato3 : IN std_logic_vector(3 downto 0);
		Dato4 : IN std_logic_vector(3 downto 0);
		CLK : IN std_logic;
		RESET : IN std_logic;          
		Anodo : OUT std_logic_vector(3 downto 0);
		Catodo : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

	Inst_Display7Seg_4ON: Display7Seg_4ON PORT MAP(
		Dato1 => ,
		Dato2 => ,
		Dato3 => ,
		Dato4 => ,
		CLK => ,
		RESET => ,
		Anodo => ,
		Catodo => 
	);


