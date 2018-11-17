----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:22:22 01/22/2016 
-- Design Name: 
-- Module Name:    RI_Memo_Datapath - Structural 
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

entity RI_Memo_Datapath is
    Port ( Address : in  STD_LOGIC_VECTOR(2 downto 0);
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           CW4 : in  STD_LOGIC;
           CW9_CW8 : in  STD_LOGIC_VECTOR(1 downto 0);
           DataBus : out  STD_LOGIC_VECTOR(7 downto 0);
           SalALU : out  STD_LOGIC_VECTOR(7 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR(7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR(7 downto 0);
           SalFZ : out  STD_LOGIC;
           SalRI : out  STD_LOGIC_VECTOR(7 downto 0));
end RI_Memo_Datapath;

architecture Structural of RI_Memo_Datapath is
	--Señal de interconexion entre Memo_Datapath y RegInst
	signal signal_DataBus : std_logic_vector(7 downto 0);
	
	--Componentes de RI_Memo_Datapath
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

		COMPONENT RegInst
	PORT(
		DataIn : IN std_logic_vector(7 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		Enable : IN std_logic;          
		DataOut : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

begin
	--Instanciacion de cada componente
	Inst_Memo_Datapath: Memo_Datapath PORT MAP(
		Address => Address,
		Reset => Reset,
		CLK => CLK,
		CW0 => CW0,
		CW1 => CW1,
		CW2 => CW2,
		CW3 => CW3,
		CW9_CW8 => CW9_CW8,
		DataBus => signal_DataBus,
		SalRegA => SalRegA,
		SalRegB => SalRegB,
		SalFZ => SalFZ,
		SalALU => SalALU
	);

	Inst_RegInst: RegInst PORT MAP(
		DataIn => signal_DataBus,
		Reset => Reset,
		CLK => CLK,
		Enable => CW4,
		DataOut => SalRI
	);
	
	DataBus <= signal_DataBus;

end Structural;