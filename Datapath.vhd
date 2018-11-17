----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:08:27 01/18/2016 
-- Design Name: 
-- Module Name:    Datapath - Structural 
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

entity Datapath is
    Port ( DataBus : in  STD_LOGIC_VECTOR(7 downto 0);
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW9_CW8 : in  STD_LOGIC_VECTOR(1 downto 0);
           SalALU : out  STD_LOGIC_VECTOR(7 downto 0);
           SalFZ : out  STD_LOGIC;
           SalRegA : out  STD_LOGIC_VECTOR(7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR(7 downto 0));
end Datapath;

architecture Structural of Datapath is
		
	--Señales de Datos	
	signal signal_RegA : std_logic_vector(7 downto 0); --Señal que llevará el valor de OPE_A
	signal signal_RegB : std_logic_vector(7 downto 0); --Señal que llevará el valor de OPE_B
	signal signal_RegFZ : std_logic;							--Señal que contiene el valor de FZ
	
	--Componentes del DataPath
	COMPONENT ALU_8bits
	PORT(
		OPE_A : IN std_logic_vector(7 downto 0);
		OPE_B : IN std_logic_vector(7 downto 0);
		SEL_ALU : IN std_logic_vector(1 downto 0);          
		SalALU : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Reg_8bits
	PORT(
		DataIn : IN std_logic_vector(7 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		Enable : IN std_logic;          
		DataOut : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegFZ
	PORT(
		DataIn : IN std_logic;
		Reset : IN std_logic;
		CLK : IN std_logic;
		Enable : IN std_logic;          
		DataOut : OUT std_logic
		);
	END COMPONENT;
	
begin
	--Instanciacion de las componentes
	Inst_ALU_8bits: ALU_8bits PORT MAP(
		OPE_A => signal_RegA, --Uso de señales ya que son modulos diferentes
		OPE_B => signal_RegB,
		SEL_ALU => CW9_CW8,
		SalALU => SalALU,
		SalFZ => signal_RegFZ
	);

	Inst_RegA: Reg_8bits PORT MAP(
		DataIn => DataBus,
		Reset => Reset,
		CLK => CLK,
		Enable => CW1,
		DataOut => signal_RegA
	);

	Inst_RegB: Reg_8bits PORT MAP(
		DataIn => DataBus,
		Reset => Reset,
		CLK => CLK,
		Enable => CW2,
		DataOut => signal_RegB
	);

	Inst_RegFZ: RegFZ PORT MAP(
		DataIn => signal_RegFZ,
		Reset => Reset,
		CLK => CLK,
		Enable => CW0,
		DataOut => SalFZ
	);
	
	SalRegA <= signal_RegA;
	SalRegB <= signal_RegB;
	
end Structural;