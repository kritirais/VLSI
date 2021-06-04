----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2021 19:57:58
-- Design Name: 
-- Module Name: SignExtender - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SignExtender is
    Port ( Instr : in STD_LOGIC_VECTOR (31 downto 0);
           SignImm : out STD_LOGIC_VECTOR (31 downto 0));
end SignExtender;

architecture Behavioral of SignExtender is

begin
    SignImm <= x"0000" & Instr(15 downto 0) when Instr(15) <= '0' else x"FFFF" & Instr(15 downto 0);

end Behavioral;
