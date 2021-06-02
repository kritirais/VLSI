----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2021 04:51:32
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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

entity RegisterFile is
    Port ( A1 : in STD_LOGIC_VECTOR (4 downto 0);
           A2 : in STD_LOGIC_VECTOR (4 downto 0);
           A3 : in STD_LOGIC_VECTOR (4 downto 0);
           WD3 : in STD_LOGIC_VECTOR (31 downto 0);
           WE3 : in STD_LOGIC;
           RD1 : out STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out STD_LOGIC_VECTOR (31 downto 0);
           CLK : in STD_LOGIC);
end RegisterFile;

architecture Behavioral of RegisterFile is

    type twoD is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    
    signal RegFile : twoD;
    signal RST: std_logic := '1';

begin
    process(CLK, RST) begin
        if(RST = '1') then 
            for i in 0 to 31 loop
                RegFile(i) <= std_logic_vector(to_unsigned(i, 32));
            end loop;
            RST <= '0';
        elsif(rising_edge(CLK)) then
            if(WE3 = '1') then RegFile(to_integer(unsigned(A3))) <= WD3; end if;
        end if;
    end process;
    RD1 <= RegFile(to_integer(unsigned(A1)));
    RD2 <= RegFile(to_integer(unsigned(A2)));

end Behavioral;
