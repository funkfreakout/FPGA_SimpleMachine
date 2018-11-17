----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:42:52 01/18/2016 
-- Design Name: 
-- Module Name:    Memo_8x8 - Behavioral 
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

entity Memo_8x8 is
    Port ( Address : in  STD_LOGIC_VECTOR(2 downto 0);
           CW3 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR(7 downto 0);
           DataOut : out  STD_LOGIC_VECTOR(7 downto 0));
end Memo_8x8;

architecture Behavioral of Memo_8x8 is

	type memo_type is array(7 downto 0) of std_logic_vector(7 downto 0);
	signal MEMO : memo_type;
	
begin
	process(CLK,Reset)
		begin
			if(Reset='1') then
				MEMO(0)<="00110111";--ADD [6],[7] => [7], suma el contenido de la posicion 6 y la posicion 7 y lo almacena en la posicion 7
				MEMO(1)<="01101100";--MOV [5],[4], almacena el contenido del Registro B(posicion 5) en el Registro A(posicion 4)
				MEMO(2)<="10100101";--SUB [4],[5] => [5] resta el contenido de la posicion de memoria 4 y 5 y lo almacena en la posicion 5
				MEMO(3)<="11000000";--BEQ [0], salta a la direccion de memoria 0 si SalFZ es 1
				MEMO(4)<="00000011";--Dato 1(A),se usa en MOV y SUB
				MEMO(5)<="00000000";--Dato 2(B),se usa en MOV y SUB
				MEMO(6)<="00000101";--Dato 3,usado en ADD
				MEMO(7)<="00000010";--Dato 4,usado en ADD
			elsif rising_edge(CLK) then 
				-- LECTURA/ESCRITURA síncrona 
				if CW3 = '1' then 
					MEMO(to_integer(unsigned(Address))) <= DataIn ; -- Conversión en dos pasos de std_logic_vector a integer(numeric_std) 
					DataOut <= DataIn; --El dato que se lee, es el mismo que se escribe
				else 
				-- SOLO LECTURA 
					DataOut <= MEMO(to_integer(unsigned(Address))); -- Valor leído en Address 
				end if; 
			end if; 
	end process;
end Behavioral;