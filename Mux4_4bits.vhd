----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:12 11/18/2015 
-- Design Name: 
-- Module Name:    Mux4_4bits - Behavioral 
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

entity Mux4_4bits is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  C : in  STD_LOGIC_VECTOR (3 downto 0);
			  D : in  STD_LOGIC_VECTOR (3 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end Mux4_4bits;

architecture Behavioral of Mux4_4bits is

begin
	process(A, B, C, D, Sel)
		begin
			if(Sel = "00") then
				Z <= A;
			elsif (Sel="01") then
				Z <= B;
			elsif (Sel="10") then
				Z <= C;
			else
				Z <= D;
			end if;
	end process;
end Behavioral;

