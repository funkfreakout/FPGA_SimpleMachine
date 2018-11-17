----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:22 12/16/2015 
-- Design Name: 
-- Module Name:    Debounce - Structural 
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

entity Debounce is
    Port ( Push : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           FilteredPush : out  STD_LOGIC);
end Debounce;

architecture Structural of Debounce is
	--Señales de interconxion entre modulos de Debounce
	signal signal_EnableTimer : std_logic;
	signal signal_End300ms : std_logic;
	signal signal_PushSync : std_logic;

	COMPONENT DebounceFSM
	PORT(
		CLK : IN std_logic;
		Flag_Timer : IN std_logic;
		Push : IN std_logic;
		RESET : IN std_logic;          
		EnableTimer : OUT std_logic;
		FilteredPush : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT FFD
	PORT(
		RESET : IN std_logic;
		ENABLE : IN std_logic;
		D : IN std_logic;
		CLK : IN std_logic;          
		Q : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Timer300ms
	PORT(
		Enable : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		End300ms : OUT std_logic
		);
	END COMPONENT;

begin

	Inst_DebounceFSM: DebounceFSM PORT MAP(
		CLK => CLK,
		Flag_Timer => signal_End300ms,
		Push => signal_PushSync,
		RESET => RESET,
		EnableTimer => signal_EnableTimer,
		FilteredPush => FilteredPush
	);

	Inst_FFD: FFD PORT MAP(
		RESET => RESET,
		ENABLE => '1',
		D => Push,
		CLK => CLK,
		Q => signal_PushSync
	);
	
	Inst_Timer300ms: Timer300ms PORT MAP(
		Enable => signal_EnableTimer,
		CLK => CLK,
		RESET => RESET,
		End300ms => signal_End300ms
	);

end Structural;