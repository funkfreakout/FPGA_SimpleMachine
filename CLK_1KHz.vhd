----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:40 11/18/2015 
-- Design Name: 
-- Module Name:    CLK_1KHz - Behavioral 
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

entity CLK_1KHz is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Out_1KHz : out  STD_LOGIC);
end CLK_1KHz;

architecture Behavioral of CLK_1KHz is

constant EndCount: integer := 50000;
signal Count: integer range 0 to EndCount;

begin
	process (CLK, RESET)
		 begin
			 if RESET='1' then
				Count <= 0;
				Out_1KHz <='0';
			 elsif rising_edge(CLK) then
				if Count = EndCount -1 then 
					Count <= 0; 				
					Out_1KHz <='1'; 			 
				else
					Count <=Count +1; 						
					Out_1KHz <='0'; 	
				end if;
		 end if;
	end process;
end Behavioral;

