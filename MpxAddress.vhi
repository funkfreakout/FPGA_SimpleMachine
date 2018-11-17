
-- VHDL Instantiation Created from source file MpxAddress.vhd -- 20:23:44 01/22/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MpxAddress
	PORT(
		A : IN std_logic_vector(2 downto 0);
		B : IN std_logic_vector(2 downto 0);
		C : IN std_logic_vector(2 downto 0);
		D : IN std_logic_vector(2 downto 0);
		Sel : IN std_logic_vector(1 downto 0);          
		Z : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_MpxAddress: MpxAddress PORT MAP(
		A => ,
		B => ,
		C => ,
		D => ,
		Sel => ,
		Z => 
	);


