----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:05:46 PM
-- Design Name: 
-- Module Name: IO_input - Behavioral
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

entity IO_input is
port(DI_in:in std_logic_vector(7 downto 0);
	  Din_cpu: out std_logic_vector(7 downto 0);
	  CS_I,OC_I:in std_logic);
end IO_input;

architecture Behavioral of IO_input is
begin
process(DI_in,CS_I,OC_I)
begin
if((CS_I and OC_I)='1') then
Din_cpu<= DI_in;
else   
Din_cpu<="ZZZZZZZZ";
end if;
end process;
end Behavioral;
