----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:15:59 01/22/2016 
-- Design Name: 
-- Module Name:    PC_RI_Memo_Datapath - Structural 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_RI_Memo_Datapath is
    Port ( Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           CW4 : in  STD_LOGIC;
           CW6_CW5 : in  STD_LOGIC_VECTOR(1 downto 0);
           CW7 : in  STD_LOGIC;
           CW9_CW8 : in  STD_LOGIC_VECTOR(1 downto 0);
           DataBus : out  STD_LOGIC_VECTOR(7 downto 0);
           AddressBus : out  STD_LOGIC_VECTOR(2 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR(7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR(7 downto 0);
           SalFZ : out  STD_LOGIC;
           SalRI : out  STD_LOGIC_VECTOR(7 downto 0);
			  SalALU : out STD_LOGIC_VECTOR(7 downto 0)
			  );
end PC_RI_Memo_Datapath;

architecture Structural of PC_RI_Memo_Datapath is
	--Señales de interconexion entre modulos de PC_RI_Memo_Datapath
	signal signal_SalRI : std_logic_vector (7 downto 0);	--Une RI_Memo_Datapath con el mux.
	signal signal_PC : std_logic_vector (2 downto 0);	 	--Une PC al mux. en su entrada A
	signal signal_Inc : std_logic_vector (2 downto 0);	 	--Une Inc a PC
	signal signal_Address : std_logic_vector (2 downto 0);--Une la salida de mux. a RI_Memo_Datapath
	
	--Componentes de PC_RI_MemoDatapath
	COMPONENT RI_Memo_Datapath
	PORT(
		Address : IN std_logic_vector(2 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW4 : IN std_logic;
		CW9_CW8 : IN std_logic_vector(1 downto 0);          
		DataBus : OUT std_logic_vector(7 downto 0);
		SalALU : OUT std_logic_vector(7 downto 0);
		SalRegA : OUT std_logic_vector(7 downto 0);
		SalRegB : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic;
		SalRI : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

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
	
	COMPONENT RegPC
	PORT(
		DataIn : IN std_logic_vector(2 downto 0);
		Reset : IN std_logic;
		CLK : IN std_logic;
		Enable : IN std_logic;          
		DataOut : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	COMPONENT IncPC
	PORT(
		DataIn : IN std_logic_vector(2 downto 0);          
		DataOut : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

begin
	--Instanciaciones de cada componente
	Inst_RI_Memo_Datapath: RI_Memo_Datapath PORT MAP(
		Address => signal_Address,
		Reset => Reset,
		CLK => CLK,
		CW0 => CW0,
		CW1 => CW1,
		CW2 => CW2,
		CW3 => CW3,
		CW4 => CW4,
		CW9_CW8 => CW9_CW8,
		DataBus => DataBus,
		SalALU => SalALU,
		SalRegA => SalRegA,
		SalRegB => SalRegB,
		SalFZ => SalFZ,
		SalRI => signal_SalRI
	);

	Inst_MpxAddress: MpxAddress PORT MAP(
		A => signal_PC,						--Cada salida del mux coincide con la de diagrama
		B => "000",								--mandamos tres 0's ya que N/C.
		C => signal_SalRI(5 downto 3),
		D => signal_SalRI(2 downto 0),
		Sel => CW6_CW5,
		Z => signal_Address
	);

	Inst_RegPC: RegPC PORT MAP(
		DataIn => signal_Inc,
		Reset => Reset,
		CLK => CLK,
		Enable => CW7,
		DataOut => signal_PC
	);

	Inst_IncPC: IncPC PORT MAP(
		DataIn => signal_Address,
		DataOut => signal_Inc
	);

	SalRI <= signal_SalRI;			--Asignacion de las señales a sus atributos base
	AddressBus <= signal_Address;

end Structural;