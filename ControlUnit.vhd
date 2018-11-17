----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:46:39 01/23/2016 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
    Port ( COP : in  STD_LOGIC_VECTOR(1 downto 0);
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Push : in  STD_LOGIC;
           FZ : in  STD_LOGIC;
           ControlWord : out  STD_LOGIC_VECTOR(9 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

	--Guardamos los diferentes estados de la unidad de control
	type States_FSM is (Idle,LoadInst,Deco,LoadA,LoadB,AaddB,MovB,AsubB,Beq); 
	signal Next_State: States_FSM; --Encapsuladmos en una señal los estados para poder usarlos
	--Mediante una tabla de verdad codificamos los diferentes estados
	constant Outputs_Idle: std_logic_Vector(9 downto 0):="0000000000";
	constant Outputs_LoadInst: std_logic_Vector(9 downto 0):="0010010000";
	constant Outputs_Deco: std_logic_Vector(9 downto 0):="0000000000";
	constant Outputs_LoadA: std_logic_Vector(9 downto 0):="0001000010";
	constant Outputs_LoadB: std_logic_Vector(9 downto 0):="0001100100";
	constant Outputs_AaddB: std_logic_Vector(9 downto 0):="0001101001";
	constant Outputs_MovB: std_logic_Vector(9 downto 0):="0101101001";
	constant Outputs_AsubB: std_logic_Vector(9 downto 0):="1001101001";
	constant Outputs_Beq: std_logic_Vector(9 downto 0):="1110000000";

begin
	process (CLK,Reset)
		begin
			if Reset = '1' then
				Next_State <= Idle; 			  -- Inicio de estado
				ControlWord <= Outputs_Idle; -- Salida a Idle
			elsif rising_edge(CLK)then
				case Next_State is
					----------------
					-- State "Idle" -
					----------------
					when Idle=>
						if (Push = '1') then
							Next_State <= LoadInst;				--Si push es 1 lee la ins.
							ControlWord <= Outputs_LoadInst;	--luego coge la salida de la ins. en cuestion
						else
							Next_State <= Idle;
							ControlWord <= Outputs_Idle;
						end if;
					------------------
					-- State "LoadInst"
					------------------
					when LoadInst=>
						if (Push = '1') then
							Next_State <= Deco;				--Si push pasamos a decodificar la ins.
							ControlWord <= Outputs_Deco;	--luego salida al estado de Deco
						else
							Next_State <= LoadInst;			--si no, vuelve a cargar otra ins.
							ControlWord <= Outputs_LoadInst;
						end if;
					------------------
					-- State "Deco"
					------------------
					when Deco=>
						if(Push = '1') then
							case COP is
								when "11"=>							--Comrpobamos si podemos pasar a BEQ
									if(FZ = '0') then
										Next_State <= LoadInst; --si FZ 0 vuelve a cargar ins.
										ControlWord <= Outputs_LoadInst;
									else
										Next_State <= Beq;		--si no, pasa a BEQ
										ControlWord <= Outputs_Beq;
									end if;
								when others=>
									Next_State <= LoadA;			--si COP no es 11, podra pasar a LoadA
									ControlWord <= Outputs_LoadA;
							end case;
						else
							Next_State <= Deco;					--si no esta push a 1 vuelve a Deco
							ControlWord <= Outputs_Deco;
						end if;
					------------------
					-- State "LoadA"
					------------------
					when LoadA=>
						if (Push = '1') then						--si push 1, pasa a sig ins.
							Next_State <= LoadB;
							ControlWord <= Outputs_LoadB;
						else											--si no, recarga LoadA
							Next_State <= LoadA;
							ControlWord <= Outputs_LoadA;
						end if;
					------------------
					-- State "LoadB"
					------------------
					when LoadB =>
						if (Push = '1') then
							if(COP = "00") then					--comprobacion de ins. segun COP
								Next_State <= AaddB;
								ControlWord <= Outputs_AaddB;
							elsif (COP = "01") then
								Next_State <= MovB;
								ControlWord <= Outputs_MovB;
							elsif (COP = "10") then
								Next_State <= AsubB;
								ControlWord <= Outputs_AsubB;
							end if;
						else
							Next_State <= LoadB;
							ControlWord <= Outputs_LoadB;
						end if;
					----------------
					-- State "AaddB"
					----------------
					when AaddB =>
						if (Push = '1') then						--segun sea push, hace su ins. si no, vuelve a LoadInst
							Next_State <= LoadInst;
							ControlWord <= Outputs_LoadInst;
						else
							Next_State <= AaddB;
							ControlWord <= Outputs_AaddB;
						end if;
					----------------
					-- State "MovB"
					----------------
					when MovB =>
						if (Push = '1') then						--segun sea push, hace su ins. si no, vuelve a LoadInst
							Next_State <= LoadInst;
							ControlWord <= Outputs_LoadInst;
						else
							Next_State <= MovB;
							ControlWord <= Outputs_MovB;
						end if;
					----------------
					-- State "AsubB"
					----------------
					when AsubB =>
						if (Push = '1') then						--segun sea push, hace su ins. si no, vuelve a LoadInst
							Next_State <= LoadInst;
							ControlWord <= Outputs_LoadInst;
						else
							Next_State <= AsubB;
							ControlWord <= Outputs_AsubB;
						end if;
					----------------
					-- State "Beq"
					----------------
					when Beq =>
						if (Push = '1') then						--segun sea push, hace su ins. si no, vuelve a LoadInst
							Next_State <= LoadInst;
							ControlWord <= Outputs_LoadInst;
						else
							Next_State <= Beq;
							ControlWord <= Outputs_Beq;
						end if;
				end case;
			end if;
	end process;
end Behavioral;