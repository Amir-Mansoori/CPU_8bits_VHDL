----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2024 06:19:58 PM
-- Design Name: 
-- Module Name: CPU_Memory_1 - Behavioral
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

entity CPU_Memory_1 is
port(CLK,RST:in std_logic;
	  D_IO_input0:in std_logic_vector(7 downto 0);
	  D_IO_output1:out std_logic_vector(7 downto 0);
	  D_IO_inout2_in:in std_logic_vector(7 downto 0);
	  D_IO_inout2_out:out std_logic_vector(7 downto 0));
end CPU_Memory_1;

architecture structural of CPU_Memory_1 is
component CPU
port(CLK,RST:in std_logic;
	  WR,RD:out std_logic;
	  Addr:out std_logic_vector(4 downto 0);
	  Data_in:in std_logic_vector(7 downto 0);
	  Data_out:out std_logic_vector(7 downto 0));
end component;

component Address_Decoder
port(addr_decoder:in std_logic_vector(4 downto 0);
CS_ROM_dec,CS_RAM_dec,CS_IO0,CS_IO1,CS_IO2:out std_logic);
end component;

component ROM_16byte
port(cs_ROM,rd_ROM:in std_logic;
	  Addr:in std_logic_vector(3 downto 0);
	  Data_ROM:out std_logic_vector(7 downto 0));
end component;

component RAM_8byte
port(cs_RAM,rd_RAM,wr_RAM:in std_logic;
	  Addr_RAM:in std_logic_vector(2 downto 0);
	  Data_in_RAM:in std_logic_vector(7 downto 0);
	  Data_out_RAM:out std_logic_vector(7 downto 0));
end component;
component IO_input
port(DI_in:in std_logic_vector(7 downto 0);
	  Din_cpu: out std_logic_vector(7 downto 0);
	  CS_I,OC_I:in std_logic);
end component;
component IO_output
port(Dout_cpu:in std_logic_vector(7 downto 0);
	  DI_out: out std_logic_vector(7 downto 0);
	  CS_O,LE:in std_logic);
end component;
signal Address: std_logic_vector(4 downto 0); 
signal Ext_Data_Bus_in,Ext_Data_Bus_out:  std_logic_vector(7 downto 0);
signal WR_B,RD_B,CS_ROM_B,CS_RAM_B,CS_IO0_B,CS_IO1_B,CS_IO2_B: std_logic;
begin
CPUu:CPU port map(CLK,RST,WR_B,RD_B,Address,Ext_Data_Bus_in, Ext_Data_Bus_out);
Addr_Dec:Address_Decoder  port  map(Address,CS_ROM_B,CS_RAM_B,CS_IO0_B,CS_IO1_B, CS_IO2_B);
ROM:ROM_16byte port map(CS_ROM_B,RD_B, Address(3 downto 0),Ext_Data_Bus_in);
RAM:RAM_8byte  port map(CS_RAM_B,RD_B,WR_B,  Address(2 downto 0), Ext_Data_Bus_out,Ext_Data_Bus_in);
Input0:IO_input   port map(D_IO_input0,EXt_Data_Bus_in,CS_IO0_B,RD_B);
Output1:IO_output  port map(EXt_Data_Bus_out,D_IO_output1,CS_IO1_B,WR_B);
In_Out2_in:IO_input  port map(D_IO_inout2_in,EXt_Data_Bus_in,CS_IO2_B,RD_B);
In_Out2_out:IO_output   port map(EXt_Data_Bus_out,D_IO_inout2_out,CS_IO2_B,WR_B);
end structural;
