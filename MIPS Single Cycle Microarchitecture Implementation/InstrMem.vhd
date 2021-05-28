----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2021 03:16:58
-- Design Name: 
-- Module Name: InstrMem - Behavioral
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstrMem is
    Port ( A : in STD_LOGIC_VECTOR(31 downto 0);
           RD : out STD_LOGIC_VECTOR (31 downto 0));
end InstrMem;

architecture Behavioral of InstrMem is

    type twoD is array (0 to 59) of STD_LOGIC_VECTOR(31 downto 0);
    signal InstrM : twoD := 
    (x"FF000001", x"FF000001", x"FF000001", x"FF000001",  -- Invalid Instruction 
     x"014B4820", x"FF000001", x"FF000001", x"FF000001",  -- add $t1, $t2, $t3 
     x"8E930002", x"FF000001", x"FF000001", x"FF000001",  -- lw $s3, 0x02($s4) 
     x"AE30000E", x"FF000001", x"FF000001", x"FF000001",  -- sw $s0, 0x0E($s1) 
     x"11290002", x"FF000001", x"FF000001", x"FF000001",  -- beq $t1, $t1, 0x0002 
     x"FF000001", x"FF000001", x"FF000001", x"FF000001",  -- Invalid Instruction 
     x"21890005", x"FF000001", x"FF000001", x"FF000001",  -- addi $t1, $t4, 0x0005 
     x"0800000A", x"FF000001", x"FF000001", x"FF000001",  -- j 0x000000A 
     x"FF000001", x"FF000001", x"FF000001", x"FF000001",  -- Invalid Instruction 
     x"FF000001", x"FF000001", x"FF000001", x"FF000001",  -- Invalid Instruction 
     x"0209402A", x"FF000001", x"FF000001", x"FF000001",  -- slt $t0, $s0, $t1 
     x"02909824", x"FF000001", x"FF000001", x"FF000001",  -- and $s3, $s4, $s0 
     x"8E8A0005", x"FF000001", x"FF000001", x"FF000001",  -- lw $t2, 0x05($s4) 
     x"AD320008", x"FF000001", x"FF000001", x"FF000001",  -- sw $s2, 0x08($t1) 
     x"1231FFF3", x"FF000001", x"FF000001", x"FF000001"); -- beq $s1, $s1, 0xFFF3 

begin
        RD <= InstrM(to_integer(unsigned(A)));
end Behavioral;
