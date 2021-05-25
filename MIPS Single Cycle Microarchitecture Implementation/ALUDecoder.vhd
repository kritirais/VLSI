----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 05:06:24
-- Design Name: 
-- Module Name: ALUDecoder - Behavioral
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

entity ALUDecoder is
  Port ( Funct : in STD_LOGIC_VECTOR (5 downto 0);
         ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
         ALUControl : out STD_LOGIC_VECTOR (2 downto 0));
end ALUDecoder;

architecture Behavioral of ALUDecoder is begin
    
process(Funct, ALUOp)
    variable FunctALUOp : std_logic_vector(7 downto 0);  
    begin
    FunctALUOp := Funct & ALUOp;
    case FunctALUOp is
        when "10000010" => ALUControl <= "010"; --add
        when "10001010" => ALUControl <= "110"; --subtract
        when "10010010" => ALUControl <= "000"; --and
        when "10010110" => ALUControl <= "001"; --or
        when "10101010" => ALUControl <= "111"; --slt
        when "------00" => ALUControl <= "010";  --add
        when "-------1" => ALUControl <= "110";  --subtract
        when others     => ALUControl <= "XXX";  --other cases
    end case;
    end process;
end Behavioral;
