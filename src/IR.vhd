----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:13:37 PM
-- Design Name: 
-- Module Name: IR - Behavioral
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

entity IR is
port(Din: in std_logic_vector(7 downto 0);
	  Dout: out std_logic_vector(7 downto 0);
	  Q: out std_logic_vector(2 downto 0);
	  LE_IR,OC_IR: in std_logic);
end IR;

architecture Behavioral of IR is
signal DD: std_logic_vector(7 downto 0);
begin
process(LE_IR,OC_IR,Din)
begin
if(OC_IR='1') then
Q<=DD(7 downto 5);
Dout<=DD;
elsif(LE_IR='1') then
DD<=Din;
Q<="ZZZ";
Dout<="ZZZZZZZZ";
else
Q<="ZZZ";
Dout<="ZZZZZZZZ";
end if;
end process;
end Behavioral;

