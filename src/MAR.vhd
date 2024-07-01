----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:12:55 PM
-- Design Name: 
-- Module Name: MAR - Behavioral
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

entity MAR is
port(D: in std_logic_vector(7 downto 0);
	  Q: out std_logic_vector(4 downto 0):="00000";
	  LE_MAR: in std_logic);
end MAR;

architecture Behavioral of MAR is
begin
process(LE_MAR,D)
begin
if(LE_MAR='1') then
Q(4 downto 0)<= D(4 downto 0);
end if;
end process;
end Behavioral;
