----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:24 10/21/2015 
-- Design Name: 
-- Module Name:    Disp7Seg - Behavioral 
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

entity Disp7Seg is
    Port ( Hex : in  STD_LOGIC_VECTOR (3 downto 0);
           Select_Disp : in  STD_LOGIC_VECTOR (1 downto 0);
           Seg : out  STD_LOGIC_VECTOR (6 downto 0);
           Anode : out  STD_LOGIC_VECTOR (3 downto 0));
end Disp7Seg;

architecture Behavioral of Disp7Seg is

begin
	process(Select_Disp)
		begin
			case Select_Disp is
				when "00" => Anode <= "1110";
				when "01" => Anode <= "1101";
				when "10" => Anode <= "1011";
				when "11" => Anode <= "0111";
				when others => Anode <= "1111";
			end case;
		end process;
	
	process(Hex,Select_Disp)
		begin
			case Hex is
				when "0000" => Seg <= "0000001"; --0
				when "0001" => Seg <= "1001111"; --1
				when "0010" => Seg <= "0010010"; --2
				when "0011" => Seg <= "0000110"; --3
				when "0100" => Seg <= "1001100"; --4
				when "0101" => Seg <= "0100100"; --5
				when "0110" => Seg <= "0100000"; --6
				when "0111" => Seg <= "0001111"; --7
				when "1000" => Seg <= "0000000"; --8
				when "1001" => Seg <= "0000100"; --9
				when "1010" => Seg <= "0001000"; --A
				when "1011" => Seg <= "1100000"; --B
				when "1100" => Seg <= "0110001"; --C
				when "1101" => Seg <= "1000010"; --D
				when "1110" => Seg <= "0110000"; --E
				when "1111" => Seg <= "0111000"; --F
				when others => Seg <= "0000001"; --0
			end case;
	end process;
end Behavioral;

