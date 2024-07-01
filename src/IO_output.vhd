----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:06:34 PM
-- Design Name: 
-- Module Name: IO_output - Behavioral
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

entity IO_output is
port(Dout_cpu:in std_logic_vector(7 downto 0);
	  DI_out: out std_logic_vector(7 downto 0);
	  CS_O,LE:in std_logic);
end IO_output;

architecture Behavioral of IO_output is
begin
process(CS_O,LE,Dout_cpu)
begin
if((CS_O and LE)='1') then
DI_out<=Dout_cpu;
end if;
end process;
end Behavioral;
