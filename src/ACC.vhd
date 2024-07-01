----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:12:08 PM
-- Design Name: 
-- Module Name: ACC - Behavioral
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

entity ACC is
port(D: in std_logic_vector(7 downto 0);
	  Q: out std_logic_vector(7 downto 0);
	  LE_ACC: in std_logic;
	  OC_ACC: in std_logic);
end ACC;

architecture Behavioral of ACC is
signal DD: std_logic_vector(7 downto 0):="00000000";
begin
process(LE_ACC,OC_ACC,D)
begin
if(OC_ACC='1') then
Q<=DD;
elsif(LE_ACC='1') then
DD<=D;
Q<="ZZZZZZZZ";
else Q<="ZZZZZZZZ";
end if;
end process;
end Behavioral;
