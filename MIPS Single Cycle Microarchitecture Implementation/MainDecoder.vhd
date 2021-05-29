----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 04:58:22
-- Design Name: 
-- Module Name: MainDecoder - Behavioral
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

entity MainDecoder is
  Port ( Opcode : in STD_LOGIC_VECTOR (5 downto 0);
         MemtoReg : out STD_LOGIC;
         MemWrite : out STD_LOGIC;
         Branch : out STD_LOGIC;
         ALUSrc : out STD_LOGIC;
         RegDst : out STD_LOGIC;
         RegWrite : out STD_LOGIC;
         Jump : out STD_LOGIC;
         ALUOp : out STD_LOGIC_VECTOR (1 downto 0));
end MainDecoder;

architecture Behavioral of MainDecoder is begin
process (Opcode) begin
    case Opcode is
        when "000000" => MemtoReg <= '0'; MemWrite <= '0'; Branch <= '0'; ALUSrc <= '0'; --R
                         RegDst <= '1'; RegWrite <= '1'; ALUOp <= "10"; Jump <= '0';
        when "100011" => MemtoReg <= '1'; MemWrite <= '0'; Branch <= '0'; ALUSrc <= '1'; --lw
                         RegDst <= '0'; RegWrite <= '1'; ALUOp <= "00"; Jump <= '0';
        when "101011" => MemtoReg <= 'X'; MemWrite <= '1'; Branch <= '0'; ALUSrc <= '1'; --sw
                         RegDst <= 'X'; RegWrite <= '0'; ALUOp <= "00"; Jump <= '0';     
        when "000100" => MemtoReg <= 'X'; MemWrite <= '0'; Branch <= '1'; ALUSrc <= '0'; --beq
                         RegDst <= 'X'; RegWrite <= '0'; ALUOp <= "01"; Jump <= '0';    
        when "001000" => MemtoReg <= '0'; MemWrite <= '0'; Branch <= '0'; ALUSrc <= '1'; --addi
                         RegDst <= '0'; RegWrite <= '1'; ALUOp <= "00"; Jump <= '0';
        when "000010" => MemtoReg <= 'X'; MemWrite <= '0'; Branch <= 'X'; ALUSrc <= 'X'; --j
                         RegDst <= 'X'; RegWrite <= '0'; ALUOp <= "XX"; Jump <= '1';                 
        when others   => MemtoReg <= 'X'; MemWrite <= '0'; Branch <= '0'; ALUSrc <= 'X'; --other
                         RegDst <= 'X'; RegWrite <= '0'; ALUOp <= "XX"; Jump <= '0';
    end case;
    end process;
end Behavioral;
