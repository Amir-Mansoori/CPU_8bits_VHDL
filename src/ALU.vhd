----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:15:14 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
port(Temp1,Temp2:in std_logic_vector(7 downto 0);
	  Temp3:out std_logic_vector(7 downto 0);
	  LE1,LE2,LE3,OC3:in std_logic;
	  c:in std_logic_vector(1 downto 0);
	  SF,CF,ZF: out std_logic);
end ALU;

architecture Behavioral of ALU is

begin
process(LE1,LE2,LE3,OC3,Temp1,Temp2)
variable t1,t2,t3: std_logic_vector(8 downto 0);
variable y2,y3,pTemp1,pTemp2,pTemp3: std_logic_vector(7 downto 0);
begin

if(LE1='1') then
pTemp1:=Temp1;
end if;

if(LE2='1') then
pTemp2:=Temp2;
end if;

y3(7):='0';
y3(6 downto 0):=pTemp1(7 downto 1);

t1(8):='0';
t2(8):='0';
t1(7 downto 0):=pTemp1;
t2(7 downto 0):=pTemp2;
t3:=t1 + t2;

if( c="00" ) then
y2:= pTemp1 and pTemp2;
elsif(c="01") then	 
y2:=pTemp1 + pTemp2; 
elsif( c="10" ) then
y2:=not(pTemp1); 
elsif( c="11") then 
y2:=y3;
end if;
			
if(LE3='1') then
pTemp3:=y2;
end if;

if(OC3='1') then
Temp3<=pTemp3;
elsif(OC3='0') then
Temp3<="ZZZZZZZZ";
end if;

if(pTemp3="00000000")then
ZF<='1'; 
elsif(pTemp3/="00000000") then
ZF<='0';
end if;    
if(pTemp3(7)='1')then
SF<='1';
elsif(pTemp3(7)='0') then
SF<='0';
end if;
if((t3(8)='1') and c="01" ) then
CF<='1';
elsif((t3(8)='0') and c="01") then
CF<='0';
end if;
end process;
end Behavioral;
