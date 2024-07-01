----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:22:12 PM
-- Design Name: 
-- Module Name: CPU_SIM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY CPU_SIM IS
END CPU_SIM;
 
ARCHITECTURE behavior OF CPU_SIM IS 
 
    COMPONENT CPU_Memory_1
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         D_IO_input0 : IN  std_logic_vector(7 downto 0);
         D_IO_output1 : OUT  std_logic_vector(7 downto 0);
         D_IO_inout2_in : IN  std_logic_vector(7 downto 0);
         D_IO_inout2_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
 
   signal CLK : std_logic := '0';
   signal RST : std_logic := '1';
   signal D_IO_input0 : std_logic_vector(7 downto 0) := "00001010"; 
   signal D_IO_inout2_in : std_logic_vector(7 downto 0) := "00010100";
 
   signal D_IO_output1 : std_logic_vector(7 downto 0);
   signal D_IO_inout2_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 250 ns;
 
BEGIN
 
  uut: CPU_Memory_1 PORT MAP (
          CLK => CLK,
          RST => RST,
          D_IO_input0 => D_IO_input0,
          D_IO_output1 => D_IO_output1,
          D_IO_inout2_in => D_IO_inout2_in,
          D_IO_inout2_out => D_IO_inout2_out
        );

   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
       stim_proc: process
   begin		
            wait for 250 ns;	
	rst<='0';
      wait;
   end process;
END;
