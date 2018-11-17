----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:24 11/04/2015 
-- Design Name: 
-- Module Name:    FFD - Behavioral 
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

entity FFD is
    Port ( RESET : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           D : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
           Q : out  STD_LOGIC);
end FFD;

architecture Behavioral of FFD is

begin
	process(CLK,RESET)
	begin
		if RESET='1' then --Si pulsamos reset, devuelve a 0 el LED
			Q <= '0'; --Sentencia asincrona
		elsif rising_edge (CLK) then --Si no pulsamos reset, miramos Enable y asignamos al LED el valor del pulasdor
			if ENABLE='1' then		  --El LED solo se activará si pulsamos Enable (se pone a 1) y activamos D, con D a 0, al pulsar Enable, se apagará el LED
				Q<=D; --Sentencia sincrona
			end if;
		end if;
	end process;
end Behavioral;

