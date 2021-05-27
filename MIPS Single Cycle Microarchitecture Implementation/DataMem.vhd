----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2021 10:59:36
-- Design Name: 
-- Module Name: DataMem - Behavioral
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

entity DataMem is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           WD : in STD_LOGIC_VECTOR (31 downto 0);
           CLK : in STD_LOGIC;
           WE : in STD_LOGIC;
           RD : out STD_LOGIC_VECTOR (31 downto 0));
end DataMem;

architecture Behavioral of DataMem is

    type twoD is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
    signal DataM : twoD := (x"67C89B2F", x"D0FA6D02", x"A2C9BB4D", x"8745800F", 
                             x"24EF8C6C", x"18AB0170", x"935B4AD5", x"6B0E1685", 
                             x"49B3666B", x"FC11E6F4", x"5DC74636", x"55CAA12E",
                             x"BB3AFB41", x"A7458D0A", x"9EA75B5C", x"3A7FD1E8",
                             x"3A7FD1E8", x"CA64CF15", x"CA64CF15", x"64F3F420",
                             x"985D6138", x"AA2897E6", x"FE751A52", x"5F466194",
                             x"5AF80570", x"6285DEC8", x"20C86C0C", x"F757ADBF",
                             x"C34FBE04", x"2DCC6B27", x"EFC73CD7", x"1B15F8AB");

begin

    process(CLK) begin
        if(rising_edge(CLK)) then
            if(WE = '1') then DataM(to_integer(unsigned(A))) <= WD; end if;
        end if;
        RD <= DataM(to_integer(unsigned(A)));
    end process;

end Behavioral;
