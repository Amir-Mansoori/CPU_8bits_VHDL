----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:07:21 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
port(cs_dec:in std_logic;
	  Ain:in std_logic_vector(1 downto 0);
	  Bout:out std_logic_vector(3 downto 0));
end decoder;

architecture Behavioral of decoder is
signal B:std_logic_vector(3 downto 0);
begin
with Ain select
B<="0001" when "00",
	"0010" when "01",
	"0100" when "10",
	"1000" when "11",
	"0000" when others;
Bout<=B when cs_dec='1' else
	   "0000";
end Behavioral;
