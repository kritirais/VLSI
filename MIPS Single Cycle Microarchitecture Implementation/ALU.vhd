----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2021 05:28:25
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           ALUControl : in STD_LOGIC_VECTOR (2 downto 0);
           Result : out STD_LOGIC_VECTOR (31 downto 0);
           Zero : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
begin
    process(ALUControl, A, B) begin
        case ALUControl is
            when "001" => Result <= A or B; Zero <= 'X';
            when "010" => Result <= A + B; Zero <= 'X';
            when "110" => Result <= A - B; if(A = B) then Zero <= '1'; 
                                           else Zero <= '0'; end if;
            when "011" => Result <= not A; Zero <= 'X';
            when "100" => Result <= A xor B; Zero <= 'X';
            when "000" => Result <= A and B; Zero <= 'X';
            when "111" => if(A < B) then Result <= x"00000001";
                          else Result <= x"00000000"; end if; Zero <= 'X';
            when others => Result <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; Zero <= 'X';
        end case;
    end process;
end Behavioral;
