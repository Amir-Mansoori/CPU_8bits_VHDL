----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:04:42 PM
-- Design Name: 
-- Module Name: RAM_8byte - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM_8byte is
port(cs_RAM,rd_RAM,wr_RAM:in std_logic;
	  Addr_RAM:in std_logic_vector(2 downto 0);
	  Data_in_RAM:in std_logic_vector(7 downto 0);
	  Data_out_RAM:out std_logic_vector(7 downto 0));
end RAM_8byte;

architecture Behavioral of RAM_8byte is
type memory is array(0 to 7) of std_logic_vector(7 downto 0);
signal ram:memory;
begin
process(cs_RAM,rd_RAM,wr_RAM)
begin
if(cs_RAM='1') then
if(rd_RAM='1') then
Data_out_RAM<=ram(conv_integer(Addr_RAM));
elsif(wr_RAM='1') then
ram(conv_integer(Addr_RAM))<=Data_in_RAM;
end if;
else Data_out_RAM<="ZZZZZZZZ";
end if;
end process;
end Behavioral;
