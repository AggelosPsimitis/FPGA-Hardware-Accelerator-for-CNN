library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity POOLING_BLOCK is
Generic ( WIDTH : positive := 32);
Port (
    CLK          :   in  std_logic; 
    RESET        :   in  std_logic;
    SET_FIFO1    :   in  std_logic;
    SET_FIFO2    :   in  std_logic;
    DIN          :   in  std_logic_vector(WIDTH-1 downto 0);
    START_FC_CNT :   out std_logic;
    DOUT         :   out std_logic_vector(WIDTH-1 downto 0)
);
end POOLING_BLOCK;

architecture Structural of POOLING_BLOCK is

component fifo_generator_0
    Port (
        clk  :  in  std_logic;
        srst :  in  std_logic;
        din  :  in  std_logic_vector(31 downto 0);
        wr_en : in  std_logic;
        full  : out std_logic;
        dout  : out std_logic_vector(31 downto 0);
        rd_en : in  std_logic;
        empty : out std_logic
        );
end component;

component DEMUX_FSM 
    Generic ( WIDTH : positive := 32);
    Port (
        CLK          : in  std_logic;
        RESET        : in  std_logic;
        DIN          : in  std_logic_vector(WIDTH-1 downto 0);
        SET_FIFO     : in  std_logic;
        FIFO1_FULL   : in  std_logic;
        FIFO1_EMPTY  : in  std_logic;
        FIFO2_FULL   : in  std_logic;
        FIFO2_EMPTY  : in  std_logic;
        DOUT         : out std_logic_vector(WIDTH-1 downto 0);
        FIFO1_WR_EN  : out std_logic;
        FIFO1_RD_EN  : out std_logic;
        FIFO2_WR_EN  : out std_logic;
        FIFO2_RD_EN  : out std_logic;
        START_FC_CNT : out std_logic
);
end component;

component N_REG is
Generic( N : positive := 32);
Port (
    CLK   :  in  std_logic;
    RESET :  in  std_logic;
    DIN   :  in  std_logic_vector(WIDTH-1 downto 0);
    DOUT  :  out std_logic_vector(WIDTH-1 downto 0)
);
end component;

component N_REG_29D is
Generic( N : positive := 32);
Port (
    CLK   :  in  std_logic;
    RESET :  in  std_logic;
    DIN   :  in  std_logic_vector(WIDTH-1 downto 0);
    DOUT  :  out std_logic_vector(WIDTH-1 downto 0)
);
end component;

component MAX_POOLING is
Generic ( WIDTH : positive := 32);
Port (
    CLK    :  in  std_logic;
    RESET  :  in  std_logic;
    DIN1   :  in  std_logic_vector(WIDTH-1 downto 0); 
    DIN2   :  in  std_logic_vector(WIDTH-1 downto 0);
    DOUT   :  out std_logic_vector(WIDTH-1 downto 0)
);
end component;

signal DIN_SIG : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
signal SET_FIFO1_SIG, SET_FIFO2_SIG : std_logic := '0';
signal FIFO11_WR_EN_SIG, FIFO11_RD_EN_SIG, FIFO12_WR_EN_SIG, FIFO12_RD_EN_SIG : std_logic := '0';
signal FIFO11_FULL_SIG, FIFO11_EMPTY_SIG, FIFO12_FULL_SIG, FIFO12_EMPTY_SIG : std_logic := '0';
signal FIFO21_WR_EN_SIG, FIFO21_RD_EN_SIG, FIFO22_WR_EN_SIG, FIFO22_RD_EN_SIG : std_logic := '0';
signal FIFO21_FULL_SIG, FIFO21_EMPTY_SIG, FIFO22_FULL_SIG, FIFO22_EMPTY_SIG : std_logic := '0';
signal DMUX1_OUT_SIG, DMUX2_OUT_SIG : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
signal FIFO11_OUT_SIG, FIFO12_OUT_SIG, FIFO21_OUT_SIG, FIFO22_OUT_SIG : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
signal REG11_OUT_SIG, REG12_OUT_SIG, REG21_OUT_SIG, REG22_OUT_SIG : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
signal REG_29D_SIG : std_logic_vector(WIDTH-1 downto 0);
signal MAXPOOL_INTRA1_SIG, MAXPOOL_INTRA2_SIG, MAXPOOL_INTER_SIG : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
begin

DIN_SIG <= DIN;
SET_FIFO1_SIG <= SET_FIFO1;
SET_FIFO2_SIG <= SET_FIFO2;

DEMUX1_FSM_INST: DEMUX_FSM
    Generic map ( WIDTH => 32)
    Port map (
        CLK         => CLK,
        RESET       => RESET,
        DIN         => DIN_SIG,
        SET_FIFO    => SET_FIFO1_SIG,
        FIFO1_FULL  => FIFO11_FULL_SIG,
        FIFO1_EMPTY => FIFO11_EMPTY_SIG,
        FIFO2_FULL  => FIFO12_FULL_SIG,
        FIFO2_EMPTY => FIFO12_EMPTY_SIG,
        DOUT        => DMUX1_OUT_SIG,
        FIFO1_WR_EN => FIFO11_WR_EN_SIG,
        FIFO1_RD_EN => FIFO11_RD_EN_SIG,
        FIFO2_WR_EN => FIFO12_WR_EN_SIG,
        FIFO2_RD_EN => FIFO12_RD_EN_SIG,
        START_FC_CNT => open
     );
     
DEMUX2_FSM_INST: DEMUX_FSM
    Generic map ( WIDTH => 32)
    Port map (
        CLK         => CLK,
        RESET       => RESET,
        DIN         => DIN_SIG,
        SET_FIFO    => SET_FIFO2_SIG,
        FIFO1_FULL  => FIFO21_FULL_SIG,
        FIFO1_EMPTY => FIFO21_EMPTY_SIG,
        FIFO2_FULL  => FIFO22_FULL_SIG,
        FIFO2_EMPTY => FIFO22_EMPTY_SIG,
        DOUT        => DMUX2_OUT_SIG,
        FIFO1_WR_EN => FIFO21_WR_EN_SIG,
        FIFO1_RD_EN => FIFO21_RD_EN_SIG,
        FIFO2_WR_EN => FIFO22_WR_EN_SIG,
        FIFO2_RD_EN => FIFO22_RD_EN_SIG,
        START_FC_CNT => START_FC_CNT
     );

FIFO11_INST : fifo_generator_0
    Port map (
        clk   => CLK,
        srst  => RESET,
        din   => DMUX1_OUT_SIG,
        wr_en => FIFO11_WR_EN_SIG,
        full  => FIFO11_FULL_SIG,
        dout  => FIFO11_OUT_SIG,
        rd_en => FIFO11_RD_EN_SIG,
        empty => FIFO11_EMPTY_SIG
    );
    
FIFO12_INST : fifo_generator_0
    Port map (
        clk   => CLK,
        srst  => RESET,
        din   => DMUX1_OUT_SIG,
        wr_en => FIFO12_WR_EN_SIG,
        full  => FIFO12_FULL_SIG,
        dout  => FIFO12_OUT_SIG,
        rd_en => FIFO12_RD_EN_SIG,
        empty => FIFO12_EMPTY_SIG
    );
    
FIFO21_INST : fifo_generator_0
    Port map (
        clk   => CLK,
        srst  => RESET,
        din   => DMUX2_OUT_SIG,
        wr_en => FIFO21_WR_EN_SIG,
        full  => FIFO21_FULL_SIG,
        dout  => FIFO21_OUT_SIG,
        rd_en => FIFO21_RD_EN_SIG,
        empty => FIFO21_EMPTY_SIG
    );
    
FIFO22_INST : fifo_generator_0
    Port map (
        clk   => CLK,
        srst  => RESET,
        din   => DMUX2_OUT_SIG,
        wr_en => FIFO22_WR_EN_SIG,
        full  => FIFO22_FULL_SIG,
        dout  => FIFO22_OUT_SIG,
        rd_en => FIFO22_RD_EN_SIG,
        empty => FIFO22_EMPTY_SIG
    );
 
REG11_INST : N_REG
    Generic map ( N => 32 )
    Port map (
        CLK   =>  CLK,
        RESET =>  RESET,
        DIN   =>  FIFO11_OUT_SIG,
        DOUT  =>  REG11_OUT_SIG
   );
   
REG12_INST : N_REG
    Generic map ( N => 32 )
    Port map (
        CLK   =>  CLK,
        RESET =>  RESET,
        DIN   =>  FIFO12_OUT_SIG,
        DOUT  =>  REG12_OUT_SIG
   );  
   
REG21_INST : N_REG
    Generic map ( N => 32 )
    Port map (
        CLK   =>  CLK,
        RESET =>  RESET,
        DIN   =>  FIFO21_OUT_SIG,
        DOUT  =>  REG21_OUT_SIG
   );   
   
REG22_INST : N_REG
    Generic map ( N => 32 )
    Port map (
        CLK   =>  CLK,
        RESET =>  RESET,
        DIN   =>  FIFO22_OUT_SIG,
        DOUT  =>  REG22_OUT_SIG
   );   
   
MAXPOOL_INTRA1_INST: MAX_POOLING
    Port map (
        CLK    => CLK,
        RESET  => RESET,
        DIN1   => REG11_OUT_SIG,
        DIN2   => REG12_OUT_SIG,
        DOUT   => MAXPOOL_INTRA1_SIG
    );
    
MAXPOOL_INTRA2_INST: MAX_POOLING
    Port map (
        CLK    => CLK,
        RESET  => RESET,
        DIN1   => REG21_OUT_SIG,
        DIN2   => REG22_OUT_SIG,
        DOUT   => MAXPOOL_INTRA2_SIG
    );
    
REG_29D_INST : N_REG_29D
    Generic map ( N => 32 )
    Port map (
        CLK   => CLK,
        RESET => RESET,
        DIN   => MAXPOOL_INTRA1_SIG,
        DOUT  => REG_29D_SIG
    );
    
MAXPOOL_INTER_INST : MAX_POOLING 
    Port map (
        CLK    => CLK,
        RESET  => RESET,
        DIN1   => REG_29D_SIG,
        DIN2   => MAXPOOL_INTRA2_SIG,
        DOUT   => MAXPOOL_INTER_SIG
    );
    
DOUT <= MAXPOOL_INTER_SIG;
end Structural;
