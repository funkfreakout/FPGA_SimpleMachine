----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:43 01/22/2016 
-- Design Name: 
-- Module Name:    MpxAddress - Behavioral 
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

entity MpxAddress is
    Port ( A : in  STD_LOGIC_VECTOR(2 downto 0);
           B : in  STD_LOGIC_VECTOR(2 downto 0);
           C : in  STD_LOGIC_VECTOR(2 downto 0);
           D : in  STD_LOGIC_VECTOR(2 downto 0);
           Sel : in  STD_LOGIC_VECTOR(1 downto 0);
           Z : out  STD_LOGIC_VECTOR(2 downto 0));
end MpxAddress;

architecture Behavioral of MpxAddress is

begin
	process(A,B,C,D,Sel) is
		begin
			case Sel is --Segun el valor de Sel, seleccionamos una entrada del Mux
				when "00" => Z <= A;
				when "01" => Z <= B;
				when "10" => Z <= C;
				when others => Z <= D;
			end case;
	end process;
end Behavioral;