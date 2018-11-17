----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:59:56 01/22/2016 
-- Design Name: 
-- Module Name:    RegPC - Behavioral 
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

entity RegPC is
    Port ( DataIn : in  STD_LOGIC_VECTOR(2 downto 0);
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR(2 downto 0));
end RegPC;

architecture Behavioral of RegPC is

begin
	process(CLK,Reset,DataIn)
		begin
			if Reset = '1' then
				DataOut <= "000"; --Si Reset esta activo, la salida DataOut será nula
			elsif rising_edge(CLK) then
				if Enable = '1' then
					if DataIn = "100" then --Si llega 100 no podrá entrar en dicha posicion, luego vuelve a la primera instruccion "000"
						DataOut <= "000";
					else
						DataOut <= DataIn;
					end if;
				end if;
			end if;
	end process;
end Behavioral;