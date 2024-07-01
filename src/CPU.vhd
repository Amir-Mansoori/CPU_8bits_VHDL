----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:18:06 PM
-- Design Name: 
-- Module Name: CPU - Behavioral
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

entity CPU is
port(CLK,RST:in std_logic;
	  WR,RD:out std_logic;
	  Addr:out std_logic_vector(4 downto 0);
	  Data_in:in std_logic_vector(7 downto 0);
	  Data_out:out std_logic_vector(7 downto 0));
end CPU;

architecture structural of CPU is
component ACC
port(D: in std_logic_vector(7 downto 0);
	  Q: out std_logic_vector(7 downto 0);
	  LE_ACC: in std_logic;
	  OC_ACC: in std_logic);
end component;

component ALU
port(Temp1,Temp2:in std_logic_vector(7 downto 0);
	  Temp3:out std_logic_vector(7 downto 0);
	  LE1,LE2,LE3,OC3:in std_logic;
	  c:in std_logic_vector(1 downto 0);
	  SF,CF,ZF: out std_logic);
end component;

component Control_Unit
port(clk,rst,CF:in std_logic;
	  IR_cu:in std_logic_vector(2 downto 0);
	  LE_ACC,OC_ACC,LE_in,LE_out,OC_in,OC_out,LE_IR,OC_IR,LE_MAR,  LE_PC, OC_PC,inc,clr,LE1,LE2,LE3,OC3,RD,WR:out std_logic;
	  c:out std_logic_vector(1 downto 0));
end component;

component IR
port(Din: in std_logic_vector(7 downto 0);
	  Dout: out std_logic_vector(7 downto 0);
	  Q: out std_logic_vector(2 downto 0);
	  LE_IR,OC_IR: in std_logic);
end component;

component MAR
port(D: in std_logic_vector(7 downto 0);
	  Q: out std_logic_vector(4 downto 0);
	  LE_MAR: in std_logic);
end component;

component MDR
Port(DinI : in  STD_LOGIC_VECTOR(7 downto 0);
			DinO : out  STD_LOGIC_VECTOR(7 downto 0);
          DoutI : in  STD_LOGIC_VECTOR(7 downto 0);
			 DoutO : out  STD_LOGIC_VECTOR(7 downto 0);
          LE_in : in  STD_LOGIC;
          LE_out : in  STD_LOGIC;
          OC_in : in  STD_LOGIC;
          OC_out : in  STD_LOGIC);
end component;

component PC
port(D1:in std_logic_vector(7 downto 0);
	  D2:out std_logic_vector(7 downto 0);
	  LE_PC,OC_PC,inc,clr,clk:in std_logic);
end component;
signal CFL,LE_ACC_B,OC_ACC_B,LE_in_B,LE_out_B,OC_in_B,OC_out_B, LE_IR_B,OC_IR_B,LE_MAR_B,LE_PC_B, OC_PC_B , inc_B, clr_B, LE1_B, LE2_B,LE3_B,OC3_B: std_logic;
signal c_B:std_logic_vector(1 downto 0);
signal Internal_Bus: std_logic_vector(7 downto 0);
signal IR_B:std_logic_vector(2 downto 0);

begin
cu:control_unit port map(CLK,RST,CFL,IR_B(2 downto 0),
								 LE_ACC_B,OC_ACC_B,LE_in_B,LE_out_B,OC_in_B,OC_out_B,LE_IR_B, OC_IR_B,LE_MAR_B,LE_PC_B, OC_PC_B, inc_B, clr_B, LE1_B, LE2_B, LE3_B,OC3_B,RD,WR,c_B);
mdrr:MDR port map(Internal_Bus,Internal_Bus,Data_in,Data_out,LE_in_B,LE_out_B, OC_in_B,OC_out_B);

marr:MAR port map(Internal_Bus,Addr,LE_MAR_B);

irr:IR port map(Internal_Bus,Internal_Bus,                                            IR_B(2 downto  0),LE_IR_B,OC_IR_B);
pcc: PC    port map(Internal_Bus,Internal_Bus,LE_PC_B,OC_PC_B, inc_B,clr_B,CLK);
ACCc:ACC port map(Internal_Bus,Internal_Bus,LE_ACC_B,OC_ACC_B);
ALUu:ALU port map(Internal_Bus,Internal_Bus,Internal_Bus, LE1_B,LE2_B,LE3_B,OC3_B,c_B,CF=>CFL);
end structural;
