----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:02 01/22/2016 
-- Design Name: 
-- Module Name:    IncPC - Behavioral 
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

entity IncPC is
    Port ( DataIn : in  STD_LOGIC_VECTOR(2 downto 0);
           DataOut : out  STD_LOGIC_VECTOR(2 downto 0));
end IncPC;

architecture Behavioral of IncPC is
	--Señal para realizar el casteo bit a bit de unsigned
	signal inc : unsigned (2 downto 0);

begin
	
	inc <= unsigned(DataIn) + 1; 		 --Se incrementa la entrada casteada
	DataOut <= std_logic_vector(inc); --Se devuelve el valor a la salida con otro casting a su tipo vector

end Behavioral;