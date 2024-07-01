----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:17:06 PM
-- Design Name: 
-- Module Name: Control_Unit - Behavioral
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

entity Control_Unit is
port(clk,rst,CF:in std_logic;
	  IR_cu:in std_logic_vector(2 downto 0);
	  LE_ACC,OC_ACC,LE_in,LE_out,OC_in,OC_out,LE_IR,OC_IR,LE_MAR,LE_PC,
	  OC_PC,inc,clr,LE1,LE2,LE3,OC3,RD,WR:out std_logic;
	  c:out std_logic_vector(1 downto 0));
end Control_Unit;

architecture Behavioral of Control_Unit is
type state is (reset,opcode_f1,opcode_f2,decode,Load1,Load2,st1,st2,
					jp,jpc,iand1,iand2,iand3,iand4,add1,add2,add3,add4,inot1,inot2,shr1,shr2,delay1,delay2);
signal current,nxt:state;
begin
p1:process(current)
begin
case current is
when reset=>
--pc=>clear
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='1';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=opcode_f1;
when opcode_f1=>
--pc=>MAR , mem(MAR)=>MDR
LE_ACC<='0';
OC_ACC<='0';
LE_in<='1';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='1';
LE_PC<='0';
OC_PC<='1';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='1';
WR<='0';
nxt<=delay1;
when delay1=>
nxt<=opcode_f2;
when opcode_f2=>
--MDR=>IR , PC++
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='1';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='1';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=decode;
when decode=>
--IR=>CU
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='1';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=delay2;
when delay2=>
case IR_cu is
when "000"=>
nxt<=Load1;
when "001"=>
nxt<=st1;
when "010"=>
nxt<=jp;
when "011"=>
nxt<=jpc;
when "100"=>
nxt<=iand1;
when "101"=>
nxt<=add1;
when "110"=>
nxt<=inot1;
when "111"=>
nxt<=shr1;
when others=>
nxt<=reset;
end case;

when Load1=>
--MDR=>MAR (actually IR=>MAR,mem(MAR)=>MDR)
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='1';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=Load2;
when Load2=>
--mem(MAR)=>MDR , MDR=>Acc (actually MDR=>Acc)
LE_ACC<='1';
OC_ACC<='0';
LE_in<='1';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='1';
WR<='0';
nxt<=opcode_f1;
when st1=>
--MDR=>MAR
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='1';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=st2;
when st2=>
--Acc=>MDR , MDR=>mem(MAR)
LE_ACC<='0';
OC_ACC<='1';
LE_in<='0';
LE_out<='1';
OC_in<='0';
OC_out<='1';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='1';
nxt<=opcode_f1;
when jp=>
--MDR=>PC
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='1';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=opcode_f1;
when jpc=>
-- if CF=1 then MDR=>PC
if(CF='1') then
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='1';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=opcode_f1;
end if;
when iand1=>
--MDR=>MAR
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='1';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=iand2;
when iand2=>
--mem(MAR)=>MDR , MDR=>TEMP1
LE_ACC<='0';
OC_ACC<='0';
LE_in<='1';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='1';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='1';
WR<='0';
nxt<=iand3;
when iand3=>
--ACC=>TEMP2 , c="00" , ALU_output=>TEMP3
LE_ACC<='0';
OC_ACC<='1';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='1';
LE3<='1';
OC3<='0';
RD<='0';
WR<='0';
c<="00";
nxt<=iand4;
when iand4=>
--TEMP3=>Acc
LE_ACC<='1';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='1';
RD<='0';
WR<='0';
nxt<=opcode_f1;
when add1=>
--MDR=>MAR
LE_ACC<='0';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='1';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='0';
WR<='0';
nxt<=add2;
when add2=>
--mem(MAR)=>MDR , MDR=>TEMP1
LE_ACC<='0';
OC_ACC<='0';
LE_in<='1';
LE_out<='0';
OC_in<='1';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='1';
LE2<='0';
LE3<='0';
OC3<='0';
RD<='1';
WR<='0';
nxt<=add3;
when add3=>
--Acc=>TEMP2 , c="01" , ALU_output=>TEMP3
LE_ACC<='0';
OC_ACC<='1';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='1';
LE3<='1';
OC3<='0';
RD<='0';
WR<='0';
c<="01";
nxt<=add4;
when add4=>
--TEMP3=>Acc
LE_ACC<='1';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='1';
RD<='0';
WR<='0';
nxt<=opcode_f1;
when inot1=>
--Acc=>TEMP1 , c="10" , ALU_output=>TEMP3
LE_ACC<='0';
OC_ACC<='1';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='1';
LE2<='0';
LE3<='1';
OC3<='0';
RD<='0';
WR<='0';
c<="10";
nxt<=inot2;
when inot2=>
--TEMP3=>Acc
LE_ACC<='1';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='1';
RD<='0';
WR<='0';
nxt<=opcode_f1;
when shr1=>
--Acc=>TEMP1 , c="11" , ALU_output=>TEMP3
LE_ACC<='0';
OC_ACC<='1';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='1';
LE2<='0';
LE3<='1';
OC3<='0';
RD<='0';
WR<='0';
c<="11";
nxt<=shr2;
when shr2=>
--TEMP3=>Acc
LE_ACC<='1';
OC_ACC<='0';
LE_in<='0';
LE_out<='0';
OC_in<='0';
OC_out<='0';
LE_IR<='0';
OC_IR<='0';
LE_MAR<='0';
LE_PC<='0';
OC_PC<='0';
inc<='0';
clr<='0';
LE1<='0';
LE2<='0';
LE3<='0';
OC3<='1';
RD<='0';
WR<='0';
nxt<=opcode_f1;
when others=>
null;
end case;
end process;
p2:process(clk,rst)
begin
if rst='1' then
current<=reset;
elsif(clk'event and clk='1') then
current<=nxt;
end if;
end process;
end Behavioral;
