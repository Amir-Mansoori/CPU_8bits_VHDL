----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:08:11 PM
-- Design Name: 
-- Module Name: Address_Decoder - Behavioral
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

entity Address_Decoder is
port(addr_decoder:  in  std_logic_vector(4 downto 0);
CS_ROM_dec,CS_RAM_dec,CS_IO0,CS_IO1,CS_IO2: out  std_logic);
end Address_Decoder;

architecture structural of Address_Decoder is
component decoder
port(cs_dec:in std_logic;
	  Ain:in std_logic_vector(1 downto 0);
	  Bout:out std_logic_vector(3 downto 0));
end component;
signal q1,q2,q3,q4,p,p1,p2,p3,p4:std_logic;
begin
mem:decoder port map(cs_dec=>'1',Ain=>addr_decoder(4 downto 3), Bout(0)=>q1 , Bout(1)=>q2 , Bout(2)=>q3,Bout(3)=>q4);
CS_ROM_dec<=q1 or q2;
CS_RAM_dec<=q3;
p<=addr_decoder(4) and addr_decoder(3) and addr_decoder(2);
IO:decoder port map(cs_dec=>p,Ain=>addr_decoder(1 downto 0),Bout(0)=>p1,Bout(1)=>p2,Bout(2)=>p3,Bout(3)=>p4);
CS_IO0<=p2;
CS_IO1<=p3;
CS_IO2<=p4;
end structural;
