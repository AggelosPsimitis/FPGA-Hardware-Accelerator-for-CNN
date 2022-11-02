library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity POOLING_LAYER is
Generic ( WIDTH : positive := 32 );
Port (
    CLK          :   in  std_logic; 
    RESET        :   in  std_logic;
    SET_COUNTER1 :   in  std_logic;
    SET_COUNTER2 :   in  std_logic;
    DIN0         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN1         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN2         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN3         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN4         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN5         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN6         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN7         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN8         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN9         :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN10        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN11        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN12        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN13        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN14        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN15        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN16        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN17        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN18        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN19        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN20        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN21        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN22        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN23        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN24        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN25        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN26        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN27        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN28        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN29        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN30        :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN31        :   in  std_logic_vector(WIDTH-1 downto 0);
    DOUT0        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT1        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT2        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT3        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT4        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT5        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT6        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT7        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT8        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT9        :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT10       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT11       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT12       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT13       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT14       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT15       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT16       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT17       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT18       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT19       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT20       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT21       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT22       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT23       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT24       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT25       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT26       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT27       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT28       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT29       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT30       :   out  std_logic_vector(WIDTH-1 downto 0);
    DOUT31       :   out  std_logic_vector(WIDTH-1 downto 0);
    START_FC_CNT :   out  std_logic
);
end POOLING_LAYER;

architecture Structural of POOLING_LAYER is

component POOLING_BLOCK 
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
end component;

component COUNTER_FOR_FIFO
Port (
    CLK     :   in  std_logic;
    RESET   :   in  std_logic;
    SET     :   in  std_logic;
    COUT    :   out std_logic    -- cout is seting fifo's for write operation
);
end component;

signal SET_COUNTER1_SIG, SET_COUNTER2_SIG : std_logic := '0';
signal SET_FIFO1_SIG, SET_FIFO2_SIG : std_logic := '0';
begin

SET_COUNTER1_SIG <= SET_COUNTER1;
SET_COUNTER2_SIG <= SET_COUNTER2;

COUNTER1_INST: COUNTER_FOR_FIFO
    Port map (
        CLK    => CLK,
        RESET  => RESET,
        SET    => SET_COUNTER1_SIG,
        COUT   => SET_FIFO1_SIG
);

COUNTER2_INST: COUNTER_FOR_FIFO
    Port map (
        CLK    => CLK,
        RESET  => RESET,
        SET    => SET_COUNTER2_SIG,
        COUT   => SET_FIFO2_SIG
);

POOLING_BLOCK0_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN0,
        DOUT         => DOUT0,
        START_FC_CNT => START_FC_CNT
);

POOLING_BLOCK1_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN1,
        DOUT         => DOUT1,
        START_FC_CNT => open
);

POOLING_BLOCK2_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN2,
        DOUT         => DOUT2,
        START_FC_CNT => open
);

POOLING_BLOCK3_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN3,
        DOUT         => DOUT3,
        START_FC_CNT => open
);

POOLING_BLOCK4_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN4,
        DOUT         => DOUT4,
        START_FC_CNT => open
);

POOLING_BLOCK5_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN5,
        DOUT         => DOUT5,
        START_FC_CNT => open
);

POOLING_BLOCK6_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN6,
        DOUT         => DOUT6,
        START_FC_CNT => open
);

POOLING_BLOCK7_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN7,
        DOUT         => DOUT7,
        START_FC_CNT => open
);

POOLING_BLOCK8_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN8,
        DOUT         => DOUT8,
        START_FC_CNT => open
);

POOLING_BLOCK91_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN9,
        DOUT         => DOUT9,
        START_FC_CNT => open
);

POOLING_BLOCK10_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN10,
        DOUT         => DOUT10,
        START_FC_CNT => open
);

POOLING_BLOCK11_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN11,
        DOUT         => DOUT11,
        START_FC_CNT => open
);

POOLING_BLOCK12_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN12,
        DOUT         => DOUT12,
        START_FC_CNT => open
);

POOLING_BLOCK13_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN13,
        DOUT         => DOUT13,
        START_FC_CNT => open
);

POOLING_BLOCK14_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN14,
        DOUT         => DOUT14,
        START_FC_CNT => open
);

POOLING_BLOCK15_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN15,
        DOUT         => DOUT15,
        START_FC_CNT => open
);

POOLING_BLOCK16_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN16,
        DOUT         => DOUT16,
        START_FC_CNT => open
);

POOLING_BLOCK17_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN17,
        DOUT         => DOUT17,
        START_FC_CNT => open
);

POOLING_BLOCK18_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN18,
        DOUT         => DOUT18,
        START_FC_CNT => open
);

POOLING_BLOCK19_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN19,
        DOUT         => DOUT19,
        START_FC_CNT => open
);

POOLING_BLOCK20_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN20,
        DOUT         => DOUT20,
        START_FC_CNT => open
);

POOLING_BLOCK21_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN21,
        DOUT         => DOUT21,
        START_FC_CNT => open
);

POOLING_BLOCK22_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN22,
        DOUT         => DOUT22,
        START_FC_CNT => open
);

POOLING_BLOCK23_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN23,
        DOUT         => DOUT23,
        START_FC_CNT => open
);

POOLING_BLOCK24_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN24,
        DOUT         => DOUT24,
        START_FC_CNT => open
);

POOLING_BLOCK25_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN25,
        DOUT         => DOUT25,
        START_FC_CNT => open
);

POOLING_BLOCK26_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN26,
        DOUT         => DOUT26,
        START_FC_CNT => open
);

POOLING_BLOCK27_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN27,
        DOUT         => DOUT27,
        START_FC_CNT => open
);

POOLING_BLOCK28_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN28,
        DOUT         => DOUT28,
        START_FC_CNT => open
);

POOLING_BLOCK29_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN29,
        DOUT         => DOUT29,
        START_FC_CNT => open
);

POOLING_BLOCK30_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN30,
        DOUT         => DOUT30,
        START_FC_CNT => open
);

POOLING_BLOCK31_INST: POOLING_BLOCK
Generic map ( WIDTH => 32)
Port map (
        CLK          => CLK,
        RESET        => RESET,
        SET_FIFO1    => SET_FIFO1_SIG,
        SET_FIFO2    => SET_FIFO2_SIG,
        DIN          => DIN31,
        DOUT         => DOUT31,
        START_FC_CNT => open
);

end Structural;
