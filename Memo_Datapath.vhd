----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:31:12 01/18/2016 
-- Design Name: 
-- Module Name:    Memo_Datapath - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memo_Datapath is
    Port ( Address : in  STD_LOGIC_VECTOR(2 downto 0);
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           CW9_CW8 : in  STD_LOGIC_VECTOR(1 downto 0);
			  DataBus : out  STD_LOGIC_VECTOR(7 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR(7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR(7 downto 0);
           SalFZ : out  STD_LOGIC;
           SalALU : out  STD_LOGIC_VECTOR(7 downto 0));
end Memo_Datapath;

architecture Structural of Memo_Datapath is
	--Señales de interconexion entre bloques
	signal signal_SalALU : std_logic_vector (7 downto 0); --Salida Memo_8x8 hacia DataBus
	signal signal_DataBus : std_logic_vector (7 downto 0);--Salida SalALU hacia Memo_8x8
	
	--Componentes de Memo_Datapath
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

begin

	Inst_Datapath: Datapath PORT MAP(
		DataBus => signal_DataBus,
		Reset => Reset,
		CLK => CLK,
		CW0 => CW0,
		CW1 => CW1,
		CW2 => CW2,
		CW9_CW8 => CW9_CW8,
		SalALU => signal_SalALU,
		SalFZ => SalFZ,
		SalRegA => SalRegA,
		SalRegB => SalRegB
	);

	Inst_Memo_8x8: Memo_8x8 PORT MAP(
		Address => Address,
		CW3 => CW3,
		CLK => CLK,
		Reset => Reset,
		DataIn => signal_SalALU,
		DataOut => signal_DataBus
	);
	
	SalALU <= signal_SalALU;
	DataBus <= signal_DataBus;

end Structural;