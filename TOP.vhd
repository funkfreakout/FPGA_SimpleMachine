----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:37 01/24/2016 
-- Design Name: 
-- Module Name:    TOP - Structural 
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

entity TOP is
    Port ( Push : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataBus : out  STD_LOGIC_VECTOR(7 downto 0);
           AddressBus : out  STD_LOGIC_VECTOR(2 downto 0);
           SalALU : out  STD_LOGIC_VECTOR(7 downto 0);
           SalFZ : out  STD_LOGIC;
           SalRI : out  STD_LOGIC_VECTOR(7 downto 0);
           Anodo : out  STD_LOGIC_VECTOR(3 downto 0);
           Catodo : out  STD_LOGIC_VECTOR(6 downto 0));
end TOP;

architecture Structural of TOP is
	--Señales de interconexion 
	signal signal_SalRegA : std_logic_vector(7 downto 0); --Para mostrar RegA por el displays 1 y 2
	signal signal_SalRegB : std_logic_vector(7 downto 0); --Para mostrar RegB por el display 3 y 4

	--Componentes de TOP
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

begin

	Inst_SimpleMachine: SimpleMachine PORT MAP(
		Push => Push,
		Reset => Reset,
		CLK => CLK,
		DataBus => DataBus,
		AddressBus => AddressBus,
		SalRegA => signal_SalRegA,
		SalRegB => signal_SalRegB,
		SalFZ => SalFZ,
		SalRI => SalRI,
		SalALU => SalALU
	);

	Inst_Display7Seg_4ON: Display7Seg_4ON PORT MAP(
		Dato1 => signal_SalRegA(7 downto 4),
		Dato2 => signal_SalRegA(3 downto 0),
		Dato3 => signal_SalRegB(7 downto 4),
		Dato4 => signal_SalRegB(3 downto 0),
		CLK => CLK,
		RESET => Reset,
		Anodo => Anodo,
		Catodo => Catodo
	);

end Structural;