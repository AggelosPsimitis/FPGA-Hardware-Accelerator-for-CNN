library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity ACCELERATOR_TOP is
Generic ( WIDTH : positive := 448;
          POWER : positive := 5;
          PIXEL_SIZE : positive := 16);
Port (
    CLK        : in  std_logic;
    RESET      : in  std_logic;
    ADDRESS    : in  std_logic_vector(POWER-1 downto 0);
    DATA       : in  std_logic_vector(WIDTH-1 downto 0);
    WE         : in  std_logic;
    DOUT0  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT1  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT2  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT3  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT4  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT5  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT6  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT7  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT8  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
    DOUT9  :  out  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0)
);
end ACCELERATOR_TOP;

architecture Structural of ACCELERATOR_TOP is

component INPUT_LAYER
Generic ( WIDTH : positive := 448;
          POWER : positive := 5;
          PIXEL_SIZE : positive := 16);
Port (
    CLK        : in  std_logic;
    RESET      : in  std_logic;
    ADDRESS    : in  std_logic_vector(POWER-1 downto 0);
    DATA       : in  std_logic_vector(WIDTH-1 downto 0);
    WE         : in  std_logic;
    REG0_OUT   : out std_logic_vector(PIXEL_SIZE-1 downto 0);
    REG1_OUT   : out std_logic_vector(PIXEL_SIZE-1 downto 0);
    REG2_OUT   : out std_logic_vector(PIXEL_SIZE-1 downto 0);
    REG3_OUT   : out std_logic_vector(PIXEL_SIZE-1 downto 0);
    REG4_OUT   : out std_logic_vector(PIXEL_SIZE-1 downto 0);
    SET_CNT1   : out std_logic;
    SET_CNT2   : out std_logic
);
end component;

component CONVOLUTION_LAYER
Generic ( WIDTH : positive := 16);
Port (
    CLK    :  in   std_logic;
    RESET  :  in   std_logic;
    DIN0   :  in   std_logic_vector(WIDTH-1 downto 0);
    DIN1   :  in   std_logic_vector(WIDTH-1 downto 0);
    DIN2   :  in   std_logic_vector(WIDTH-1 downto 0);
    DIN3   :  in   std_logic_vector(WIDTH-1 downto 0);
    DIN4   :  in   std_logic_vector(WIDTH-1 downto 0);
    DOUT0  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT1  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT2  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT3  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT4  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT5  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT6  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT7  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT8  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT9  :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT10 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT11 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT12 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT13 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT14 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT15 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT16 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT17 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT18 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT19 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT20 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT21 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT22 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT23 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT24 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT25 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT26 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT27 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT28 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT29 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT30 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT31 :  out  std_logic_vector(WIDTH+WIDTH-1 downto 0)
);
end component;

component POOLING_LAYER
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
end component;

component FULLY_CONNECTED_LAYER
Generic (WIDTH : positive := 32;
         POWER : positive := 13);
Port (
    CLK     :  in  std_logic;
    RESET   :  in  std_logic;
    SET_CNT :  in  std_logic;
    DIN0    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN1    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN2    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN3    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN4    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN5    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN6    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN7    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN8    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN9    :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN10   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN11   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN12   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN13   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN14   :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN15   :   in  std_logic_vector(WIDTH-1 downto 0);
    DIN16   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN17   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN18   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN19   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN20   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN21   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN22   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN23   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN24   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN25   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN26   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN27   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN28   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN29   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN30   :  in  std_logic_vector(WIDTH-1 downto 0);
    DIN31   :  in  std_logic_vector(WIDTH-1 downto 0);
    DOUT0   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT1   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT2   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT3   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT4   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT5   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT6   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT7   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT8   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT9   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT10  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT11  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT12  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT13  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT14  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT15  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT16  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT17  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT18  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT19  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT20  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT21  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT22  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT23  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT24  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT25  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT26  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT27  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT28  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    DOUT29  :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
    SET_CNT_OL : out std_logic
);
end component;

component OUTPUT_LAYER 
Generic (WIDTH : positive := 32);
Port (
     CLK     :  in std_logic;
     RESET   :  in std_logic;
     SET_CNT :  in std_logic;
     DIN0    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN1    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN2    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN3    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN4    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN5    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN6    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN7    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN8    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN9    :  in std_logic_vector(WIDTH-1 downto 0);
     DIN10   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN11   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN12   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN13   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN14   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN15   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN16   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN17   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN18   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN19   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN20   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN21   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN22   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN23   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN24   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN25   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN26   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN27   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN28   :  in std_logic_vector(WIDTH-1 downto 0);
     DIN29   :  in std_logic_vector(WIDTH-1 downto 0);
     DOUT0   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT1   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT2   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT3   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT4   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT5   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT6   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT7   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT8   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0);
     DOUT9   :  out std_logic_vector(WIDTH+WIDTH-1 downto 0)
);
end component;

signal REG0_OUT_SIG, REG1_OUT_SIG, REG2_OUT_SIG, REG3_OUT_SIG, REG4_OUT_SIG : std_logic_vector(PIXEL_SIZE-1 downto 0) := (others => '0');
signal SET_C1_SIG, SET_C2_SIG, START_FC_CNT_SIG, SET_CNT_OL_SIG : std_logic := '0';
signal DSP0_OUT_SIG, DSP1_OUT_SIG, DSP2_OUT_SIG, DSP3_OUT_SIG, DSP4_OUT_SIG, DSP5_OUT_SIG, DSP6_OUT_SIG, DSP7_OUT_SIG,
       DSP8_OUT_SIG, DSP9_OUT_SIG, DSP10_OUT_SIG, DSP11_OUT_SIG, DSP12_OUT_SIG, DSP13_OUT_SIG, DSP14_OUT_SIG, DSP15_OUT_SIG,
       DSP16_OUT_SIG, DSP17_OUT_SIG, DSP18_OUT_SIG, DSP19_OUT_SIG, DSP20_OUT_SIG, DSP21_OUT_SIG, DSP22_OUT_SIG, DSP23_OUT_SIG,
       DSP24_OUT_SIG, DSP25_OUT_SIG, DSP26_OUT_SIG, DSP27_OUT_SIG, DSP28_OUT_SIG, DSP29_OUT_SIG, DSP30_OUT_SIG, DSP31_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0');
signal POOL0_OUT_SIG, POOL1_OUT_SIG, POOL2_OUT_SIG, POOL3_OUT_SIG, POOL4_OUT_SIG, POOL5_OUT_SIG, POOL6_OUT_SIG, POOL7_OUT_SIG,
       POOL8_OUT_SIG, POOL9_OUT_SIG, POOL10_OUT_SIG, POOL11_OUT_SIG, POOL12_OUT_SIG, POOL13_OUT_SIG, POOL14_OUT_SIG, POOL15_OUT_SIG, 
       POOL16_OUT_SIG, POOL17_OUT_SIG, POOL18_OUT_SIG, POOL19_OUT_SIG, POOL20_OUT_SIG, POOL21_OUT_SIG, POOL22_OUT_SIG, POOL23_OUT_SIG,
       POOL24_OUT_SIG, POOL25_OUT_SIG, POOL26_OUT_SIG, POOL27_OUT_SIG, POOL28_OUT_SIG, POOL29_OUT_SIG, POOL30_OUT_SIG, POOL31_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0'); 
signal FC0_OUT_SIG, FC1_OUT_SIG, FC2_OUT_SIG, FC3_OUT_SIG, FC4_OUT_SIG, FC5_OUT_SIG, FC6_OUT_SIG, FC7_OUT_SIG, FC8_OUT_SIG, FC9_OUT_SIG, 
       FC10_OUT_SIG, FC11_OUT_SIG, FC12_OUT_SIG, FC13_OUT_SIG, FC14_OUT_SIG, FC15_OUT_SIG, FC16_OUT_SIG, FC17_OUT_SIG, FC18_OUT_SIG, FC19_OUT_SIG,
       FC20_OUT_SIG, FC21_OUT_SIG, FC22_OUT_SIG, FC23_OUT_SIG, FC24_OUT_SIG, FC25_OUT_SIG, FC26_OUT_SIG, FC27_OUT_SIG, FC28_OUT_SIG, FC29_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0');
signal OL_IN0_SIG, OL_IN1_SIG, OL_IN2_SIG, OL_IN3_SIG, OL_IN4_SIG, OL_IN5_SIG, OL_IN6_SIG, OL_IN7_SIG, OL_IN8_SIG, OL_IN9_SIG,
       OL_IN10_SIG, OL_IN11_SIG, OL_IN12_SIG, OL_IN13_SIG, OL_IN14_SIG, OL_IN15_SIG, OL_IN16_SIG, OL_IN17_SIG, OL_IN18_SIG, OL_IN19_SIG,
       OL_IN20_SIG, OL_IN21_SIG, OL_IN22_SIG, OL_IN23_SIG, OL_IN24_SIG, OL_IN25_SIG, OL_IN26_SIG, OL_IN27_SIG, OL_IN28_SIG, OL_IN29_SIG : std_Logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0');
signal DOUT0_SIG, DOUT1_SIG, DOUT2_SIG, DOUT3_SIG, DOUT4_SIG, DOUT5_SIG, DOUT6_SIG, DOUT7_SIG,
       DOUT8_SIG, DOUT9_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0');
begin

INPUT_LAYER_INST: INPUT_LAYER
Generic map ( WIDTH => 448, POWER => 5, PIXEL_SIZE => 16)
Port map (
    CLK        => CLK,
    RESET      => RESET,
    ADDRESS    => ADDRESS,
    DATA       => DATA,
    WE         => WE,
    REG0_OUT   => REG0_OUT_SIG,
    REG1_OUT   => REG1_OUT_SIG,
    REG2_OUT   => REG2_OUT_SIG,
    REG3_OUT   => REG3_OUT_SIG,
    REG4_OUT   => REG4_OUT_SIG,
    SET_CNT1   => SET_C1_SIG,
    SET_CNT2   => SET_C2_SIG
);

CONV_LAYER_INST: CONVOLUTION_LAYER
Generic map ( WIDTH => 16)
Port map (
    CLK    => CLK,
    RESET  => RESET,
    DIN0   => REG0_OUT_SIG,
    DIN1   => REG1_OUT_SIG,
    DIN2   => REG2_OUT_SIG,
    DIN3   => REG3_OUT_SIG,
    DIN4   => REG4_OUT_SIG,
    DOUT0  => DSP0_OUT_SIG,
    DOUT1  => DSP1_OUT_SIG,
    DOUT2  => DSP2_OUT_SIG,
    DOUT3  => DSP3_OUT_SIG,
    DOUT4  => DSP4_OUT_SIG,
    DOUT5  => DSP5_OUT_SIG,
    DOUT6  => DSP6_OUT_SIG,
    DOUT7  => DSP7_OUT_SIG,
    DOUT8  => DSP8_OUT_SIG,
    DOUT9  => DSP9_OUT_SIG,
    DOUT10 => DSP10_OUT_SIG,
    DOUT11 => DSP11_OUT_SIG,
    DOUT12 => DSP12_OUT_SIG,
    DOUT13 => DSP13_OUT_SIG,
    DOUT14 => DSP14_OUT_SIG,
    DOUT15 => DSP15_OUT_SIG,
    DOUT16 => DSP16_OUT_SIG,
    DOUT17 => DSP17_OUT_SIG,
    DOUT18 => DSP18_OUT_SIG,
    DOUT19 => DSP19_OUT_SIG,
    DOUT20 => DSP20_OUT_SIG,
    DOUT21 => DSP21_OUT_SIG,
    DOUT22 => DSP22_OUT_SIG,
    DOUT23 => DSP23_OUT_SIG,
    DOUT24 => DSP24_OUT_SIG,
    DOUT25 => DSP25_OUT_SIG,
    DOUT26 => DSP26_OUT_SIG,
    DOUT27 => DSP27_OUT_SIG,
    DOUT28 => DSP28_OUT_SIG,
    DOUT29 => DSP29_OUT_SIG,
    DOUT30 => DSP30_OUT_SIG,
    DOUT31 => DSP31_OUT_SIG
);

POOLING_LAYER_INST: POOLING_LAYER
Generic map ( WIDTH => 32 )
Port map (
    CLK          => CLK,
    RESET        => RESET,
    SET_COUNTER1 => SET_C1_SIG,
    SET_COUNTER2 => SET_C2_SIG,
    DIN0         => DSP0_OUT_SIG,
    DIN1         => DSP1_OUT_SIG,
    DIN2         => DSP2_OUT_SIG,
    DIN3         => DSP3_OUT_SIG,
    DIN4         => DSP4_OUT_SIG,
    DIN5         => DSP5_OUT_SIG,
    DIN6         => DSP6_OUT_SIG,
    DIN7         => DSP7_OUT_SIG,
    DIN8         => DSP8_OUT_SIG,
    DIN9         => DSP9_OUT_SIG,
    DIN10        => DSP10_OUT_SIG,
    DIN11        => DSP11_OUT_SIG,
    DIN12        => DSP12_OUT_SIG,
    DIN13        => DSP13_OUT_SIG,
    DIN14        => DSP14_OUT_SIG,
    DIN15        => DSP15_OUT_SIG,
    DIN16        => DSP16_OUT_SIG,
    DIN17        => DSP17_OUT_SIG,
    DIN18        => DSP18_OUT_SIG,
    DIN19        => DSP19_OUT_SIG,
    DIN20        => DSP20_OUT_SIG,
    DIN21        => DSP21_OUT_SIG,
    DIN22        => DSP22_OUT_SIG,
    DIN23        => DSP23_OUT_SIG,
    DIN24        => DSP24_OUT_SIG,
    DIN25        => DSP25_OUT_SIG,
    DIN26        => DSP26_OUT_SIG,
    DIN27        => DSP27_OUT_SIG,
    DIN28        => DSP28_OUT_SIG,
    DIN29        => DSP29_OUT_SIG,
    DIN30        => DSP30_OUT_SIG,
    DIN31        => DSP31_OUT_SIG,
    DOUT0        => POOL0_OUT_SIG,
    DOUT1        => POOL1_OUT_SIG,
    DOUT2        => POOL2_OUT_SIG,
    DOUT3        => POOL3_OUT_SIG,
    DOUT4        => POOL4_OUT_SIG,
    DOUT5        => POOL5_OUT_SIG,
    DOUT6        => POOL6_OUT_SIG,
    DOUT7        => POOL7_OUT_SIG,
    DOUT8        => POOL8_OUT_SIG,
    DOUT9        => POOL9_OUT_SIG,
    DOUT10       => POOL10_OUT_SIG,
    DOUT11       => POOL11_OUT_SIG,
    DOUT12       => POOL12_OUT_SIG,
    DOUT13       => POOL13_OUT_SIG,
    DOUT14       => POOL14_OUT_SIG,
    DOUT15       => POOL15_OUT_SIG,
    DOUT16       => POOL16_OUT_SIG,
    DOUT17       => POOL17_OUT_SIG,
    DOUT18       => POOL18_OUT_SIG,
    DOUT19       => POOL19_OUT_SIG,
    DOUT20       => POOL20_OUT_SIG,
    DOUT21       => POOL21_OUT_SIG,
    DOUT22       => POOL22_OUT_SIG,
    DOUT23       => POOL23_OUT_SIG,
    DOUT24       => POOL24_OUT_SIG,
    DOUT25       => POOL25_OUT_SIG,
    DOUT26       => POOL26_OUT_SIG,
    DOUT27       => POOL27_OUT_SIG,
    DOUT28       => POOL28_OUT_SIG,
    DOUT29       => POOL29_OUT_SIG,
    DOUT30       => POOL30_OUT_SIG,
    DOUT31       => POOL31_OUT_SIG,
    START_FC_CNT => START_FC_CNT_SIG
);

FC_LAYER_INST: FULLY_CONNECTED_LAYER
Generic map ( WIDTH => 32, POWER => 13)
Port map (
    CLK     => CLK,
    RESET   => RESET,
    SET_CNT => START_FC_CNT_SIG,
    DIN0    => POOL0_OUT_SIG,
    DIN1    => POOL1_OUT_SIG,
    DIN2    => POOL2_OUT_SIG,
    DIN3    => POOL3_OUT_SIG,
    DIN4    => POOL4_OUT_SIG,
    DIN5    => POOL5_OUT_SIG,
    DIN6    => POOL6_OUT_SIG,
    DIN7    => POOL7_OUT_SIG,
    DIN8    => POOL8_OUT_SIG,
    DIN9    => POOL9_OUT_SIG,
    DIN10   => POOL10_OUT_SIG,
    DIN11   => POOL11_OUT_SIG,
    DIN12   => POOL12_OUT_SIG,
    DIN13   => POOL13_OUT_SIG,
    DIN14   => POOL14_OUT_SIG,
    DIN15   => POOL15_OUT_SIG,
    DIN16   => POOL16_OUT_SIG,
    DIN17   => POOL17_OUT_SIG,
    DIN18   => POOL18_OUT_SIG,
    DIN19   => POOL19_OUT_SIG,
    DIN20   => POOL20_OUT_SIG,
    DIN21   => POOL21_OUT_SIG,
    DIN22   => POOL22_OUT_SIG,
    DIN23   => POOL23_OUT_SIG,
    DIN24   => POOL24_OUT_SIG,
    DIN25   => POOL25_OUT_SIG,
    DIN26   => POOL26_OUT_SIG,
    DIN27   => POOL27_OUT_SIG,
    DIN28   => POOL28_OUT_SIG,
    DIN29   => POOL29_OUT_SIG,
    DIN30   => POOL30_OUT_SIG,
    DIN31   => POOL31_OUT_SIG,
    DOUT0   => FC0_OUT_SIG,
    DOUT1   => FC1_OUT_SIG,
    DOUT2   => FC2_OUT_SIG,
    DOUT3   => FC3_OUT_SIG,
    DOUT4   => FC4_OUT_SIG,
    DOUT5   => FC5_OUT_SIG,
    DOUT6   => FC6_OUT_SIG,
    DOUT7   => FC7_OUT_SIG,
    DOUT8   => FC8_OUT_SIG,
    DOUT9   => FC9_OUT_SIG,
    DOUT10  => FC10_OUT_SIG,
    DOUT11  => FC11_OUT_SIG,
    DOUT12  => FC12_OUT_SIG,
    DOUT13  => FC13_OUT_SIG,
    DOUT14  => FC14_OUT_SIG,
    DOUT15  => FC15_OUT_SIG,
    DOUT16  => FC16_OUT_SIG,
    DOUT17  => FC17_OUT_SIG,
    DOUT18  => FC18_OUT_SIG,
    DOUT19  => FC19_OUT_SIG,
    DOUT20  => FC20_OUT_SIG,
    DOUT21  => FC21_OUT_SIG,
    DOUT22  => FC22_OUT_SIG,
    DOUT23  => FC23_OUT_SIG,
    DOUT24  => FC24_OUT_SIG,
    DOUT25  => FC25_OUT_SIG,
    DOUT26  => FC26_OUT_SIG,
    DOUT27  => FC27_OUT_SIG,
    DOUT28  => FC28_OUT_SIG,
    DOUT29  => FC29_OUT_SIG,
    SET_CNT_OL => SET_CNT_OL_SIG
);

OL_IN0_SIG  <= std_logic_vector(unsigned(FC0_OUT_SIG(31 downto 0)));
OL_IN1_SIG  <= std_logic_vector(unsigned(FC1_OUT_SIG(31 downto 0)));
OL_IN2_SIG  <= std_logic_vector(unsigned(FC2_OUT_SIG(31 downto 0)));
OL_IN3_SIG  <= std_logic_vector(unsigned(FC3_OUT_SIG(31 downto 0)));
OL_IN4_SIG  <= std_logic_vector(unsigned(FC4_OUT_SIG(31 downto 0)));
OL_IN5_SIG  <= std_logic_vector(unsigned(FC5_OUT_SIG(31 downto 0)));
OL_IN6_SIG  <= std_logic_vector(unsigned(FC6_OUT_SIG(31 downto 0)));
OL_IN7_SIG  <= std_logic_vector(unsigned(FC7_OUT_SIG(31 downto 0)));
OL_IN8_SIG  <= std_logic_vector(unsigned(FC8_OUT_SIG(31 downto 0)));
OL_IN9_SIG  <= std_logic_vector(unsigned(FC9_OUT_SIG(31 downto 0)));
OL_IN10_SIG <= std_logic_vector(unsigned(FC10_OUT_SIG(31 downto 0)));
OL_IN11_SIG <= std_logic_vector(unsigned(FC11_OUT_SIG(31 downto 0)));
OL_IN12_SIG <= std_logic_vector(unsigned(FC12_OUT_SIG(31 downto 0)));
OL_IN13_SIG <= std_logic_vector(unsigned(FC13_OUT_SIG(31 downto 0)));
OL_IN14_SIG <= std_logic_vector(unsigned(FC14_OUT_SIG(31 downto 0)));
OL_IN15_SIG <= std_logic_vector(unsigned(FC15_OUT_SIG(31 downto 0)));
OL_IN16_SIG <= std_logic_vector(unsigned(FC16_OUT_SIG(31 downto 0)));
OL_IN17_SIG <= std_logic_vector(unsigned(FC17_OUT_SIG(31 downto 0)));
OL_IN18_SIG <= std_logic_vector(unsigned(FC18_OUT_SIG(31 downto 0)));
OL_IN19_SIG <= std_logic_vector(unsigned(FC19_OUT_SIG(31 downto 0)));
OL_IN20_SIG <= std_logic_vector(unsigned(FC20_OUT_SIG(31 downto 0)));
OL_IN21_SIG <= std_logic_vector(unsigned(FC21_OUT_SIG(31 downto 0)));
OL_IN22_SIG <= std_logic_vector(unsigned(FC22_OUT_SIG(31 downto 0)));
OL_IN23_SIG <= std_logic_vector(unsigned(FC23_OUT_SIG(31 downto 0)));
OL_IN24_SIG <= std_logic_vector(unsigned(FC24_OUT_SIG(31 downto 0)));
OL_IN25_SIG <= std_logic_vector(unsigned(FC25_OUT_SIG(31 downto 0)));
OL_IN26_SIG <= std_logic_vector(unsigned(FC26_OUT_SIG(31 downto 0)));
OL_IN27_SIG <= std_logic_vector(unsigned(FC27_OUT_SIG(31 downto 0)));
OL_IN28_SIG <= std_logic_vector(unsigned(FC28_OUT_SIG(31 downto 0)));
OL_IN29_SIG <= std_logic_vector(unsigned(FC29_OUT_SIG(31 downto 0)));

OUTPUT_LAYER_INST: OUTPUT_LAYER 
Generic map (WIDTH => 32)
Port map(
     CLK     => CLK,
     RESET   => RESET,
     SET_CNT => SET_CNT_OL_SIG,
     DIN0    => OL_IN0_SIG,
     DIN1    => OL_IN1_SIG,
     DIN2    => OL_IN2_SIG,
     DIN3    => OL_IN3_SIG,
     DIN4    => OL_IN4_SIG,
     DIN5    => OL_IN5_SIG,
     DIN6    => OL_IN6_SIG,
     DIN7    => OL_IN7_SIG,
     DIN8    => OL_IN8_SIG,
     DIN9    => OL_IN9_SIG,
     DIN10   => OL_IN10_SIG,
     DIN11   => OL_IN11_SIG,
     DIN12   => OL_IN12_SIG,
     DIN13   => OL_IN13_SIG,
     DIN14   => OL_IN14_SIG,
     DIN15   => OL_IN15_SIG,
     DIN16   => OL_IN16_SIG,
     DIN17   => OL_IN17_SIG,
     DIN18   => OL_IN18_SIG,
     DIN19   => OL_IN19_SIG,
     DIN20   => OL_IN20_SIG,
     DIN21   => OL_IN21_SIG,
     DIN22   => OL_IN22_SIG,
     DIN23   => OL_IN23_SIG,
     DIN24   => OL_IN24_SIG,
     DIN25   => OL_IN25_SIG,
     DIN26   => OL_IN26_SIG,
     DIN27   => OL_IN27_SIG,
     DIN28   => OL_IN28_SIG,
     DIN29   => OL_IN29_SIG,
     DOUT0   => DOUT0_SIG,
     DOUT1   => DOUT1_SIG,
     DOUT2   => DOUT2_SIG,
     DOUT3   => DOUT3_SIG,
     DOUT4   => DOUT4_SIG,
     DOUT5   => DOUT5_SIG,
     DOUT6   => DOUT6_SIG,
     DOUT7   => DOUT7_SIG,
     DOUT8   => DOUT8_SIG,
     DOUT9   => DOUT9_SIG
);

DOUT0  <= DOUT0_SIG;
DOUT1  <= DOUT1_SIG;
DOUT2  <= DOUT2_SIG;
DOUT3  <= DOUT3_SIG;
DOUT4  <= DOUT4_SIG;
DOUT5  <= DOUT5_SIG;
DOUT6  <= DOUT6_SIG;
DOUT7  <= DOUT7_SIG;
DOUT8  <= DOUT8_SIG;
DOUT9  <= DOUT9_SIG;

end Structural;
