----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:09:56 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
port(D1:in std_logic_vector(7 downto 0);
	  D2:out std_logic_vector(7 downto 0);
	  LE_PC,OC_PC,inc,clr,clk:in std_logic);
end PC;

architecture Behavioral of PC is
begin
process(clr,clk,D1)
variable DD: std_logic_vector(7 downto 0):="00000000";
begin
if(clk'event and clk='1') then
if(clr='1') then
DD:="00000000";
D2<="ZZZZZZZZ";
elsif(inc='1') then
DD := DD + "00000001";
D2<="ZZZZZZZZ";
elsif(LE_PC='1') then
DD:=D1;
D2<="ZZZZZZZZ";
elsif(OC_PC='1') then
D2<=DD; 
else
D2<="ZZZZZZZZ";
end if;
end if;
end process;
end Behavioral;

