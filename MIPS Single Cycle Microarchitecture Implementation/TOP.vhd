----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2021 05:01:15
-- Design Name: 
-- Module Name: TOP - Behavioral
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

entity TOP is
    Port ( CLK : in STD_LOGIC;
           RST: in STD_LOGIC);
end TOP;

architecture Behavioral of TOP is

    component InstrMem is
    port ( A : in STD_LOGIC_VECTOR(31 downto 0);
           RD: out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component RegFileTop
    port ( Instr, WD3 : in STD_LOGIC_VECTOR (31 downto 0); 
           WE3, RegDst, CLK : in STD_LOGIC;
           RD1, RD2 : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component ControlUnit
    port (Instr : in std_logic_vector(31 downto 0);
          MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Jump : out std_logic;
          ALUControl : out std_logic_vector(2 downto 0));
    end component;
    
    component SignExtender is
    Port ( Instr : in STD_LOGIC_VECTOR (31 downto 0);
           SignImm : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MUX_2inp 
    port( A, B: in std_logic_vector(31 downto 0);
          S: in std_logic;
          Y : out std_logic_vector(31 downto 0));
    end component;

    component ALU
    port (A, B : in std_logic_vector(31 downto 0);
          ALUControl : in std_logic_vector(2 downto 0);
          Result : out std_logic_vector(31 downto 0);
          Zero : out std_logic);
    end component;
    
    component DataMem is
    port ( A, WD: in STD_LOGIC_VECTOR (31 downto 0);
           WE, CLK: in STD_LOGIC;
           RD : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    signal RegWrite, RegDst, MemtoReg, MemWrite, Branch, ALUSrc, Jump, Z0, Z1, PCSrc  : std_logic;
    signal ALUControl : std_logic_vector(2 downto 0);
    signal RD1, RD2, SignImm, SignImm4, SrcB, ALUResult, ReadData, Instr, WD3: std_logic_vector(31 downto 0);
    signal PCDash, PCJump, PCBranch, PC  : std_logic_vector(31 downto 0);


begin

    process(CLK) begin
        if(RST = '1') then PCDash <= x"00000000";
        elsif(rising_edge(CLK)) then 
            PCDash <= PCDash + 4;
            if(PCSrc = '1') then PCDash <= PCBranch;
            elsif(Jump = '1') then PCDash <= PCJump; end if;
        end if;
    end process;

    PC <= PCDash;
    PCJump <= PC(31 downto 28) & Instr(25 downto 0) & "00";
    
    IM : InstrMem port map (A => PC, RD => Instr);
    
    CU: ControlUnit port map(Instr => Instr, MemtoReg => MemtoReg, MemWrite => MemWrite,
                             Branch => Branch, ALUSrc => ALUSrc, RegDst => RegDst,
                             RegWrite => RegWrite, Jump => Jump, ALUControl => ALUControl);
    
    RF: RegFileTop port map(Instr => Instr, WD3 => WD3, WE3 => RegWrite, CLK => CLK, 
                            RD1 => RD1, RD2 => RD2, RegDst => RegDst);
                                 
    SI: SignExtender port map(Instr => Instr, SignImm => SignImm);
    
    MUX1: MUX_2inp port map(A => RD2, B => SignImm, S => ALUSrc, Y => SrcB);
    
    ArithLogicU1: ALU port map (A => RD1, B => SrcB, ALUControl => ALUControl, 
                                Result => ALUResult, Zero => Z0);
    PCSrc <= Branch and Z0;
                                
    DM : DataMem port map (A => ALUResult, WD => RD2, WE => MemWrite, CLK => CLK, 
                           RD => ReadData);

    MUX2: MUX_2inp port map(A => ALUResult, B => ReadData, S => MemtoReg, Y => WD3);
    
    SignImm4 <= SignImm(29 downto 0) & "00";

    ArithLogicU2: ALU port map (A => SignImm4, B => PC, ALUControl => "010", Result => PCBranch, Zero => Z1);

end Behavioral;
