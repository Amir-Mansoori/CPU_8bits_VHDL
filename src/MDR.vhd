----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:14:30 PM
-- Design Name: 
-- Module Name: MDR - Behavioral
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

entity MDR is
Port(DinI : in  STD_LOGIC_VECTOR(7 downto 0);
			DinO : out  STD_LOGIC_VECTOR(7 downto 0);
          DoutI : in  STD_LOGIC_VECTOR(7 downto 0);
			 DoutO : out  STD_LOGIC_VECTOR(7 downto 0);
          LE_in : in  STD_LOGIC;
          LE_out : in  STD_LOGIC;
          OC_in : in  STD_LOGIC;
          OC_out : in  STD_LOGIC);
end MDR;

architecture Behavioral of MDR is
begin
process(LE_in,LE_out,OC_in,OC_out,DinI,DoutI)
variable DD1: std_logic_vector(7 downto 0);
variable DD2: std_logic_vector(7 downto 0);
begin
if(LE_in='1') then
DD1:=DoutI;
end if;
if(OC_in='1') then 
DinO<=DD1;
else
DinO<="ZZZZZZZZ";
end if;

if(LE_out='1') then
DD2:=DinI;
end if;
if(OC_out='1') then
DoutO<=DD2;
else
DoutO<="ZZZZZZZZ";
end if;
end process;
end Behavioral;
