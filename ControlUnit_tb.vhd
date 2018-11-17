--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:24 01/24/2016
-- Design Name:   
-- Module Name:   C:/Users/Jabikun/Desktop/TDC/Py_SimpleMachine/ControlUnit_tb.vhd
-- Project Name:  Py_SimpleMachine
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ControlUnit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ControlUnit_tb IS
END ControlUnit_tb;
 
ARCHITECTURE behavior OF ControlUnit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         COP : IN  std_logic_vector(1 downto 0);
         Reset : IN  std_logic;
         CLK : IN  std_logic;
         Push : IN  std_logic;
         FZ : IN  std_logic;
         ControlWord : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal COP : std_logic_vector(1 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Push : std_logic := '0';
   signal FZ : std_logic := '0';

 	--Outputs
   signal ControlWord : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          COP => COP,
          Reset => Reset,
          CLK => CLK,
          Push => Push,
          FZ => FZ,
          ControlWord => ControlWord
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      RESET<='0'; wait for 40 ns;--Idle
		PUSH<='1'; wait for 20 ns;	--Idle-->LoadInst
		PUSH<='0'; wait for 20 ns;
		COP<="11";
		PUSH<='1'; wait for 20 ns;	--LoadInst-->Deco
		PUSH<='0'; wait for 20 ns;
		FZ<='1'; wait for 20 ns;	--Deco-->LoadInst
		PUSH<='1';
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadInst-->Deco
		PUSH<='0'; wait for 20 ns;
		FZ<='0'; wait for 20 ns;	--Deco-->BEQ
		PUSH<='1';
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--BEQ-->LoadInst
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadInst-->Deco
		COP<="01";
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--Deco-->LoadA
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadA-->LoadB
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadB-->MovB
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--MovB-->LoadInst
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadInst-->Deco
		COP<="10";
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--Deco-->LoadA
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadA-->LoadB
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadB-->AsubB
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--AsubB-->LoadInst
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadInst-->Deco
		COP<="00";
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--Deco-->LoadA
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadA-->LoadB
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns; --LoadB-->AaddB
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--AaddB-->LoadInst
		PUSH<='0'; wait for 20 ns;
		PUSH<='1'; wait for 20 ns;	--LoadInst-->Deco
		PUSH<='0'; wait for 20 ns;
		wait;
   end process;
END;