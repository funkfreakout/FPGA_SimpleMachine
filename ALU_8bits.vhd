----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:28:02 01/18/2016 
-- Design Name: 
-- Module Name:    ALU_8bits - Behavioral 
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

entity ALU_8bits is
    Port ( OPE_A : in  STD_LOGIC_VECTOR (7 downto 0);
           OPE_B : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
           SalALU : out  STD_LOGIC_VECTOR (7 downto 0);
           SalFZ : out  STD_LOGIC);
end ALU_8bits;

architecture Behavioral of ALU_8bits is

signal signal_res: std_logic_vector (7 downto 0); --señal que almacena la salida de la ALU

begin

	process (SEL_ALU, OPE_A, OPE_B, signal_res) is
		begin
			case SEL_ALU is --SEL_ALU decide que operacion se llevará a cabo
				when "00" => signal_res <= std_logic_vector((unsigned(OPE_A) + unsigned(OPE_B)));--ADD
				when "01" => signal_res <= OPE_B;																--MOV B
				when "10" => signal_res <= std_logic_vector((unsigned(OPE_A) - unsigned(OPE_B)));--SUB	
				when "11" => signal_res <= "00000000";													 		--BEQ
				when others => signal_res <= "--------";
			end case;
 
			if(signal_res = "00000000") then --Actualizamos SalFZ
				SalFZ <= '1';
			else
				SalFZ <= '0';
			end if;	

			SalALU <= signal_res; --Mandamos a SalALU lo optenido por el programa.

	end process;
end Behavioral;