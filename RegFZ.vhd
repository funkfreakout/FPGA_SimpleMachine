----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:59:41 01/18/2016 
-- Design Name: 
-- Module Name:    RegFZ - Behavioral 
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

entity RegFZ is
    Port ( DataIn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           DataOut : out  STD_LOGIC);
end RegFZ;

architecture Behavioral of RegFZ is

begin
	process(CLK,Reset)
		begin
			if Reset='1' then
				DataOut <= '0'; 
			elsif rising_edge(CLK) then
				if Enable='1' then
					DataOut <= DataIn;
				end if;
			end if;
	end process;
end Behavioral;