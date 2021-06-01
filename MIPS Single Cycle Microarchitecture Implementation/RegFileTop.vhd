----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2021 19:17:14
-- Design Name: 
-- Module Name: RegFileTop - Behavioral
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

entity RegFileTop is
  Port ( Instr : in STD_LOGIC_VECTOR (31 downto 0); 
         WD3 : in STD_LOGIC_VECTOR (31 downto 0);
         WE3 : in STD_LOGIC;
         RegDst : in STD_LOGIC;
         CLK : in STD_LOGIC;
         RD1 : out STD_LOGIC_VECTOR (31 downto 0);
         RD2 : out STD_LOGIC_VECTOR (31 downto 0));
end RegFileTop;

architecture Behavioral of RegFileTop is

    component RegisterFile
    port ( A1, A2, A3 : in STD_LOGIC_VECTOR (4 downto 0);
           WD3 : in STD_LOGIC_VECTOR (31 downto 0);
           WE3, CLK : in STD_LOGIC;
           RD1, RD2 : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal A1, A2, A3 : std_logic_vector(4 downto 0);

begin

    A1 <= Instr(25 downto 21);
    A2 <= Instr(20 downto 16);
    A3 <= Instr(15 downto 11) when RegDst = '1' else Instr(20 downto 16);
    
     R : RegisterFile port map (A1 => A1, A2 => A2, A3 => A3, WD3 => WD3,
                               WE3 => WE3, CLK => CLK, RD1 => RD1, RD2 => RD2);
end Behavioral;
