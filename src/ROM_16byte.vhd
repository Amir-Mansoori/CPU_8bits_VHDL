----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:03:06 PM
-- Design Name: 
-- Module Name: ROM_16byte - Behavioral
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

entity ROM_16byte is
port(cs_ROM,rd_ROM:in std_logic;
	  Addr:in std_logic_vector(3 downto 0);
	  Data_ROM:out std_logic_vector(7 downto 0));
end ROM_16byte;

architecture Behavioral of ROM_16byte is
type memory is array(0 to 15) of std_logic_vector(7 downto 0);
signal rom:memory:=(x"1D",x"BF",x"3E",x"E3",x"C4",x"B5",x"D5",x"AA",x"08",x"D5",x"BA",x"CB",x"5C",x"9D",x"8E",x"AF");
begin
process(rd_ROM,cs_ROM)
begin
if(rd_ROM='1') then
if(cs_ROM='1') then
Data_ROM<=rom(conv_integer(Addr));
else Data_ROM<="ZZZZZZZZ";
end if;
end if;
end process;
end Behavioral;
