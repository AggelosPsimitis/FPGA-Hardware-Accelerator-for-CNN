library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity DSP_BLOCK is
Generic ( PIXEL_SIZE : positive := 16;
          POWER : positive := 5);
Port (
    CLK       :  in  std_logic;
    RESET     :  in  std_logic;
    DIN0      :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    DIN1      :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    DIN2      :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    DIN3      :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    DIN4      :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE00_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE01_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE02_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE03_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE04_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE10_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE11_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE12_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE13_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE14_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE20_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE21_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE22_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE23_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE24_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE30_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE31_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE32_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE33_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE34_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE40_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE41_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE42_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE43_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    PE44_COEF :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    BIAS      :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
    DOUT      :  out std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0)
);
end DSP_BLOCK;

architecture Structural of DSP_BLOCK is

component PE is 
Generic ( PIXEL_SIZE : positive := 16);
Port (
	CLK     :  in  std_logic;
	RESET   :  in  std_logic;
	DIN     :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
	COEFF   :  in  std_logic_vector(PIXEL_SIZE-1 downto 0);
	PREV    :  in  std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0);
	DOUT    :  out std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0)
);
end component;

component ADDER is
Generic ( WIDTH : positive := 32);
Port (
    A    :  in  std_logic_vector(WIDTH-1 downto 0);
    B    :  in  std_logic_vector(WIDTH-1 downto 0);
    S    :  out std_logic_vector(WIDTH-1 downto 0);
    COUT :  out std_logic;
    OV   :  out std_logic
);
end component;

component N_REG is
Generic( N : positive := 32);
Port (
    CLK   :  in  std_logic;
    RESET :  in  std_logic;
    DIN   :  in  std_logic_vector(N-1 downto 0);
    DOUT  :  out std_logic_vector(N-1 downto 0)
);
end component;

component N_REG_3D is
Generic( N : positive := 32);
Port (
    CLK   :  in  std_logic;
    RESET :  in  std_logic;
    DIN   :  in  std_logic_vector(N-1 downto 0);
    DOUT  :  out std_logic_vector(N-1 downto 0)
);
end component;

component RELU_MUX is
Generic( WIDTH : positive := 32);
Port (
    DIN  :  in  std_logic_vector(WIDTH-1 downto 0);
    DOUT :  out std_logic_vector(WIDTH-1 downto 0)
);
end component;

signal DIN0_SIG, DIN1_SIG, DIN2_SIG, DIN3_SIG, DIN4_SIG : std_logic_vector(PIXEL_SIZE-1 downto 0) := (others => '0');
signal PE00_OUT_SIG, PE01_OUT_SIG, PE02_OUT_SIG, PE03_OUT_SIG, PE04_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0):= (others => '0');
signal PE10_OUT_SIG, PE11_OUT_SIG, PE12_OUT_SIG, PE13_OUT_SIG, PE14_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0):= (others => '0');
signal PE20_OUT_SIG, PE21_OUT_SIG, PE22_OUT_SIG, PE23_OUT_SIG, PE24_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0):= (others => '0');
signal PE30_OUT_SIG, PE31_OUT_SIG, PE32_OUT_SIG, PE33_OUT_SIG, PE34_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0):= (others => '0');
signal PE40_OUT_SIG, PE41_OUT_SIG, PE42_OUT_SIG, PE43_OUT_SIG, PE44_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0):= (others => '0');
signal ADDER00_OUT_SIG, ADDER01_OUT_SIG, ADDER10_OUT_SIG, ADDER20_OUT_SIG, ADDER30_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0');
signal NREG00_OUT_SIG, NREG01_OUT_SIG, NREG02_OUT_SIG, NREG10_OUT_SIG, NREG20_OUT_SIG, NREG30_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0');
signal BIAS_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0');
signal DSP_OUT_SIG : std_logic_vector(PIXEL_SIZE+PIXEL_SIZE-1 downto 0) := (others => '0');

begin

DIN0_SIG <= DIN0;
DIN1_SIG <= DIN1;
DIN2_SIG <= DIN2;
DIN3_SIG <= DIN3;
DIN4_SIG <= DIN4;
BIAS_SIG <= std_logic_vector(resize(unsigned(BIAS),PIXEL_SIZE+PIXEL_SIZE));

PE00_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN0_SIG,
COEFF => PE00_COEF,
PREV  => (others => '0'),
DOUT  => PE00_OUT_SIG
);

PE01_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN0_SIG,
COEFF => PE01_COEF,
PREV  => PE00_OUT_SIG,
DOUT  => PE01_OUT_SIG
);

PE02_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN0_SIG,
COEFF => PE02_COEF,
PREV  => PE01_OUT_SIG,
DOUT  => PE02_OUT_SIG
);

PE03_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN0_SIG,
COEFF => PE03_COEF,
PREV  => PE02_OUT_SIG,
DOUT  => PE03_OUT_SIG
);

PE04_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN0_SIG,
COEFF => PE04_COEF,
PREV  => PE03_OUT_SIG,
DOUT  => PE04_OUT_SIG
);

PE10_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN1_SIG,
COEFF => PE10_COEF,
PREV  => (others => '0'),
DOUT  => PE10_OUT_SIG
);

PE11_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN1_SIG,
COEFF => PE11_COEF,
PREV  => PE10_OUT_SIG,
DOUT  => PE11_OUT_SIG
);

PE12_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN1_SIG,
COEFF => PE12_COEF,
PREV  => PE11_OUT_SIG,
DOUT  => PE12_OUT_SIG
);

PE13_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN1_SIG,
COEFF => PE13_COEF,
PREV  => PE12_OUT_SIG,
DOUT  => PE13_OUT_SIG
);

PE14_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN1_SIG,
COEFF => PE14_COEF,
PREV  => PE13_OUT_SIG,
DOUT  => PE14_OUT_SIG
);

PE20_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN2_SIG,
COEFF => PE20_COEF,
PREV  => (others => '0'),
DOUT  => PE20_OUT_SIG
);

PE21_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN2_SIG,
COEFF => PE21_COEF,
PREV  => PE20_OUT_SIG,
DOUT  => PE21_OUT_SIG
);

PE22_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN2_SIG,
COEFF => PE22_COEF,
PREV  => PE21_OUT_SIG,
DOUT  => PE22_OUT_SIG
);

PE23_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN2_SIG,
COEFF => PE23_COEF,
PREV  => PE22_OUT_SIG,
DOUT  => PE23_OUT_SIG
);

PE24_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN2_SIG,
COEFF => PE24_COEF,
PREV  => PE23_OUT_SIG,
DOUT  => PE24_OUT_SIG
);

PE30_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN3_SIG,
COEFF => PE30_COEF,
PREV  => (others => '0'),
DOUT  => PE30_OUT_SIG
);

PE31_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN3_SIG,
COEFF => PE31_COEF,
PREV  => PE30_OUT_SIG,
DOUT  => PE31_OUT_SIG
);

PE32_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN3_SIG,
COEFF => PE32_COEF,
PREV  => PE31_OUT_SIG,
DOUT  => PE32_OUT_SIG
);

PE33_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN3_SIG,
COEFF => PE33_COEF,
PREV  => PE32_OUT_SIG,
DOUT  => PE33_OUT_SIG
);

PE34_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN3_SIG,
COEFF => PE34_COEF,
PREV  => PE33_OUT_SIG,
DOUT  => PE34_OUT_SIG
);

PE40_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN4_SIG,
COEFF => PE40_COEF,
PREV  => (others => '0'),
DOUT  => PE40_OUT_SIG
);

PE41_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN4_SIG,
COEFF => PE41_COEF,
PREV  => PE40_OUT_SIG,
DOUT  => PE41_OUT_SIG
);

PE42_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN4_SIG,
COEFF => PE42_COEF,
PREV  => PE41_OUT_SIG,
DOUT  => PE42_OUT_SIG
);

PE43_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN4_SIG,
COEFF => PE43_COEF,
PREV  => PE42_OUT_SIG,
DOUT  => PE43_OUT_SIG
);

PE44_INST : PE
generic map( PIXEL_SIZE => 16)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => DIN4_SIG,
COEFF => PE44_COEF,
PREV  => PE43_OUT_SIG,
DOUT  => PE44_OUT_SIG
);

ADDER00_INST : ADDER
generic map ( WIDTH => 32)
port map (
A  => PE04_OUT_SIG,
B  => PE14_OUT_SIG,
S  => ADDER00_OUT_SIG,
COUT => open,
OV   => open
);

ADDER01_INST : ADDER
generic map ( WIDTH => 32)
port map (
A    => PE24_OUT_SIG,
B    => PE34_OUT_SIG,
S    => ADDER01_OUT_SIG,
COUT => open,
OV   => open
);

NREG00_INST : N_REG
generic map ( N => 32)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => ADDER00_OUT_SIG,
DOUT  => NREG00_OUT_SIG
);

NREG01_INST : N_REG
generic map ( N => 32)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => ADDER01_OUT_SIG,
DOUT  => NREG01_OUT_SIG
);

NREG02_INST : N_REG_3D
generic map ( N => 32)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => PE44_OUT_SIG,
DOUT  => NREG02_OUT_SIG
);

ADDER10_INST : ADDER
generic map ( WIDTH => 32)
port map (
A    => NREG00_OUT_SIG,
B    => NREG01_OUT_SIG,
S    => ADDER10_OUT_SIG,
COUT => open,
OV   => open
);

NREG10_INST : N_REG
generic map ( N => 32)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => ADDER10_OUT_SIG,
DOUT  => NREG10_OUT_SIG
);

ADDER20_INST : ADDER
generic map ( WIDTH => 32)
port map (
A    => NREG10_OUT_SIG,
B    => NREG02_OUT_SIG,
S    => ADDER20_OUT_SIG,
COUT => open,
OV   => open
);

NREG20_INST : N_REG
generic map ( N => 32)
port map (
CLK   => CLK,
RESET => RESET,
DIN   => ADDER20_OUT_SIG,
DOUT  => NREG20_OUT_SIG
);

ADDER30_INST : ADDER
generic map ( WIDTH => 32)
port map (
A    => NREG20_OUT_SIG,
B    => BIAS_SIG,
S    => ADDER30_OUT_SIG,
COUT => open,
OV   => open
);

NREG30_INST : N_REG
generic map ( N => 32)
port map (
CLK     => CLK,
RESET   => RESET,
DIN     => ADDER30_OUT_SIG,
DOUT    => NREG30_OUT_SIG
);

RELU_MUX_INST: RELU_MUX
generic map ( WIDTH => 32)
port map (
DIN  =>  NREG30_OUT_SIG,
DOUT =>  DSP_OUT_SIG
);

DOUT <= DSP_OUT_SIG;

end Structural;
