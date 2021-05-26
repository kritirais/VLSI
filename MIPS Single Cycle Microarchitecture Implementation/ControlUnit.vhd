----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 05:16:42
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
  Port ( Instr : in STD_LOGIC_VECTOR (31 downto 0);
         MemtoReg : out STD_LOGIC;
         MemWrite : out STD_LOGIC;
         Branch : out STD_LOGIC;
         ALUSrc : out STD_LOGIC;
         RegDst : out STD_LOGIC;
         RegWrite : out STD_LOGIC;
         Jump : out STD_LOGIC;
         ALUControl : out STD_LOGIC_VECTOR (2 downto 0) );
end ControlUnit;

architecture Behavioral of ControlUnit is

    component MainDecoder
    port (Opcode : in std_logic_vector(5 downto 0);
          MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump : out std_logic;
          ALUOp : out std_logic_vector(1 downto 0));
    end component;
    
    component ALUDecoder
    port (Funct : in std_logic_vector(5 downto 0);
          ALUOp : in std_logic_vector(1 downto 0);
          ALUControl : out std_logic_vector(2 downto 0));
    end component;
    
    signal Opcode, Funct : std_logic_vector(5 downto 0) := "000000";
    signal ALUOp : std_logic_vector(1 downto 0) := "00";

begin
    Opcode <= Instr(31 downto 26);
    Funct <= Instr(5 downto 0);

    M1: MainDecoder port map (Opcode => Opcode, MemtoReg => MemtoReg, MemWrite => MemWrite,
                                Branch => Branch, ALUSrc => ALUSrc, RegDst => RegDst,
                                RegWrite => RegWrite, Jump => Jump, ALUOp => ALUOp);
                                
    A1: ALUDecoder port map (Funct => Funct, ALUOp => ALUOp, ALUControl => ALUControl);


end Behavioral;
