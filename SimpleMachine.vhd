----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:48 01/23/2016 
-- Design Name: 
-- Module Name:    SimpleMachine - Structural 
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

entity SimpleMachine is
    Port ( Push : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataBus : out  STD_LOGIC_VECTOR(7 downto 0);
           AddressBus : out  STD_LOGIC_VECTOR(2 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR(7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR(7 downto 0);
           SalFZ : out  STD_LOGIC;
           SalRI : out  STD_LOGIC_VECTOR(7 downto 0);
           SalALU : out  STD_LOGIC_VECTOR(7 downto 0));
end SimpleMachine;

architecture Structural of SimpleMachine is
	--Señales de interconexion
	signal signal_RI : std_logic_vector (7 downto 0); --Señal entre el RegRI y COP
	signal signal_FZ : std_logic; --Señal de FZ entre Datapath y ControlUnit
	signal signal_ControlWord : std_logic_vector (9 downto 0); --CW's
	signal signal_Push : std_logic; --Pulsador con antirebotes
	signal signal_CW7	: std_logic; --Señal para filtrar PC+1 de los fallos de rebote
	signal signal_CW4	: std_logic; --Señal para filtrar los registros de los fallos de rebote

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

	COMPONENT ControlUnit
	PORT(
		COP : IN std_logic_vector(1 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		Push : IN std_logic;
		FZ : IN std_logic;          
		ControlWord : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Debounce	--Necesitamos el modulo Debounce para sincronizar el push y que no de resultados erroneos
	PORT(						
		Push : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		FilteredPush : OUT std_logic
		);
	END COMPONENT;

begin
	--Instanciacion de las componentes
	Inst_PC_RI_Memo_Datapath: PC_RI_Memo_Datapath PORT MAP(
		Reset => Reset,
		CLK => CLK,
		CW0 => signal_ControlWord(0),
		CW1 => signal_ControlWord(1),
		CW2 => signal_ControlWord(2),
		CW3 => signal_ControlWord(3),
		CW4 => signal_CW4,
		CW6_CW5 => signal_ControlWord(6 downto 5),
		CW7 => signal_CW7,
		CW9_CW8 => signal_ControlWord(9 downto 8),
		DataBus => DataBus,
		AddressBus => AddressBus,
		SalRegA => SalRegA,
		SalRegB => SalRegB,
		SalFZ => signal_FZ,
		SalRI => signal_RI,
		SalALU => SalALU
	);
	
	Inst_ControlUnit: ControlUnit PORT MAP(
		COP => signal_RI(7 downto 6),
		Reset => Reset,
		CLK => CLK,
		Push => signal_Push,
		FZ => signal_FZ,
		ControlWord => signal_ControlWord
	);
	
	Inst_Debounce: Debounce PORT MAP(
		Push => Push,
		CLK => CLK,
		RESET => Reset,
		FilteredPush => signal_Push
	);

	SalFZ <= signal_FZ;	--Conexion entre las señales y las salidas del modulo SimpleMachine
	SalRI <= signal_RI;
	signal_CW7 <= signal_ControlWord(7) and signal_Push;
	signal_CW4 <= signal_ControlWord(4) and signal_Push;
	
end Structural;