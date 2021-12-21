----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2021 04:53:04
-- Design Name: 
-- Module Name: tb_TOP - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_TOP is
--  Port ( );
end tb_TOP;

architecture Behavioral of tb_TOP is

    component TOP is
    port ( CLK : in STD_LOGIC;
           RST: in STD_LOGIC);
    end component;
    
    signal tb_CLK, tb_RST: std_logic := '0';

begin

    tb_CLK <= not tb_CLK after 10 ns;
    
    DUT : TOP port map (CLK => tb_CLK, RST => tb_RST);
    
    process begin
        tb_RST <= '1'; wait for 11ns;
        tb_RST <= '0'; wait;
    end process;

end Behavioral;
