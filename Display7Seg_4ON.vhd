----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:25:07 11/18/2015 
-- Design Name: 
-- Module Name:    Display7Seg_4ON - Structural 
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

entity Display7Seg_4ON is
    Port ( Dato1 : in  STD_LOGIC_VECTOR (3 downto 0);
           Dato2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Dato3 : in  STD_LOGIC_VECTOR (3 downto 0);
           Dato4 : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Anodo : out  STD_LOGIC_VECTOR (3 downto 0);
           Catodo : out  STD_LOGIC_VECTOR (6 downto 0));
end Display7Seg_4ON;

architecture Structural of Display7Seg_4ON is
	--Señales de interconexion entre componentes
	signal signal_sel : std_logic_vector(1 downto 0); --señal del selector de mux. con el Display7Seg
	signal signal_mux : std_logic_vector(3 downto 0); --señal de salida de mux. con Display7Seg
	signal signal_clk : std_logic;						  --señal de CLK con Display7Seg

	--Componentes de Display7Seg
   COMPONENT Mux4_4bits
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		C : IN std_logic_vector(3 downto 0);
		D : IN std_logic_vector(3 downto 0);
		Sel : IN  std_logic_vector (1 downto 0);          
		Z : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Disp7Seg
	PORT(
		Hex : IN std_logic_vector(3 downto 0);
		Select_Disp : IN std_logic_vector(1 downto 0);          
		Seg : OUT std_logic_vector(6 downto 0);
		Anode : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Counter_2bits
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;
		Enable : IN std_logic;          
		Q : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT CLK_1KHz
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;          
		Out_1KHz : OUT std_logic
		);
	END COMPONENT;

begin
	--Instanciacion de los componentes
	Inst_Mux4_4bits: Mux4_4bits PORT MAP(
		A => Dato1,
		B => Dato2,
		C => Dato3,
		D => Dato4,
		Sel => signal_sel,
		Z => signal_mux
	);
	
	Inst_Disp7Seg: Disp7Seg PORT MAP(
		Hex => signal_mux,
		Select_Disp => signal_sel,
		Seg => Catodo,
		Anode => Anodo
	);
	
	Inst_Counter_2bits: Counter_2bits PORT MAP(
		CLK => CLK,
		Reset => RESET,
		Enable => signal_clk,
		Q => signal_sel
	);
	
	Inst_CLK_1KHz: CLK_1KHz PORT MAP(
		CLK => CLK,
		Reset => RESET,
		Out_1KHz => signal_clk
	);
	
end Structural;