library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

entity INPUT_LAYER is   
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
end INPUT_LAYER;

architecture Structural of INPUT_LAYER is

component BLOCK_RAM 
Generic ( WIDTH : positive := 448;
          POWER : positive := 5);
Port (
	CLK     :  in	std_logic;
	WE      :  in	std_logic;
	RE      :  in   std_logic;
	WR_ADDR :  in   std_logic_vector(POWER-1 downto 0);
	RE_ADDR :  in   std_logic_vector(POWER-1 downto 0);
	DIN     :  in 	std_logic_vector(WIDTH-1 downto 0);
	DOUT    :  out  std_logic_vector(WIDTH-1 downto 0)
 );
end component;

component SHIFT_REGISTER is
Generic ( WIDTH : positive := 448;
          PIXEL_SIZE : positive := 16);
Port ( 
	CLK    :   in  std_logic;
--	RESET  :   in  std_logic;
	ENABLE :   in  std_logic;
	DIN    :   in  std_logic_vector(WIDTH-1 downto 0);
	DOUT   :   out std_logic_vector(PIXEL_SIZE-1 downto 0);
	FINISH :   out std_logic
);
end component;

component INPUT_LAYER_FSM is
Generic ( WIDTH : positive := 448;
		  POWER : positive := 5);
Port (
	CLK	      :  in  std_logic;
	RESET     :  in  std_logic;
	RAM_DATA  :  in  std_logic_vector(WIDTH-1 downto 0);
	REG0_FIN  :  in  std_logic;
	REG1_FIN  :  in  std_logic;
	REG2_FIN  :  in  std_logic;
	REG3_FIN  :  in  std_logic;
	REG4_FIN  :  in  std_logic;
	REG0_2_FIN  :  in  std_logic;
	REG1_2_FIN  :  in  std_logic;
	REG2_2_FIN  :  in  std_logic;
	REG3_2_FIN  :  in  std_logic;
	REG4_2_FIN  :  in  std_logic;
	SEL1        :  out  std_logic;
	SEL2        :  out  std_logic;
	RAM_EN    :  out std_logic;
	RAM_ADDR  :  out std_logic_vector(POWER-1 downto 0);
	REG0_EN   :  out std_logic;
	REG1_EN   :  out std_logic;
	REG2_EN   :  out std_logic;
	REG3_EN   :  out std_logic;
	REG4_EN   :  out std_logic;
	REG0_2_EN   :  out std_logic;
	REG1_2_EN   :  out std_logic;
	REG2_2_EN   :  out std_logic;
	REG3_2_EN   :  out std_logic;
	REG4_2_EN   :  out std_logic;
	REG0_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG1_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG2_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG3_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG4_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG0_2_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG1_2_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG2_2_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG3_2_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	REG4_2_DATA :  out std_logic_vector(WIDTH-1 downto 0);
	START_CNT1  :  out std_logic;
	START_CNT2  :  out std_logic
);
end component;

component DECODER is
Generic ( WIDTH : positive := 16);
Port (
    R10  :  in  std_logic_vector(WIDTH-1 downto 0);
    R11  :  in  std_logic_vector(WIDTH-1 downto 0);
    R12  :  in  std_logic_vector(WIDTH-1 downto 0);
    R13  :  in  std_logic_vector(WIDTH-1 downto 0);
    R14  :  in  std_logic_vector(WIDTH-1 downto 0);
    R20  :  in  std_logic_vector(WIDTH-1 downto 0);
    R21  :  in  std_logic_vector(WIDTH-1 downto 0);
    R22  :  in  std_logic_vector(WIDTH-1 downto 0);
    R23  :  in  std_logic_vector(WIDTH-1 downto 0);
    R24  :  in  std_logic_vector(WIDTH-1 downto 0); 
    S1   :  in  std_logic;
    S2   :  in  std_logic;
    R0   :  out std_logic_vector(WIDTH-1 downto 0);
    R1   :  out std_logic_vector(WIDTH-1 downto 0);
    R2   :  out std_logic_vector(WIDTH-1 downto 0);
    R3   :  out std_logic_vector(WIDTH-1 downto 0);
    R4   :  out std_logic_vector(WIDTH-1 downto 0)
);
end component;

signal WR_RAM_DATA_SIG, RE_RAM_DATA_SIG: std_logic_vector(WIDTH-1 downto 0) := (others => '0');
signal RAM_WE_SIG, RAM_RE_SIG : std_logic := '0';
signal RAM_WRITE_ADDRESS_SIG, RAM_READ_ADDRESS_SIG : std_logic_vector(POWER-1 downto 0) := (others => '0');
signal REG0_IN_SIG, REG1_IN_SIG, REG2_IN_SIG, REG3_IN_SIG, REG4_IN_SIG: std_logic_vector(WIDTH-1 downto 0) := (others => '0');
signal REG0_2_IN_SIG, REG1_2_IN_SIG, REG2_2_IN_SIG, REG3_2_IN_SIG, REG4_2_IN_SIG: std_logic_vector(WIDTH-1 downto 0) := (others => '0');
signal REG0_FIN_SIG, REG1_FIN_SIG, REG2_FIN_SIG, REG3_FIN_SIG, REG4_FIN_SIG : std_logic := '0';
signal REG0_2_FIN_SIG, REG1_2_FIN_SIG, REG2_2_FIN_SIG, REG3_2_FIN_SIG, REG4_2_FIN_SIG : std_logic := '0';
signal REG0_EN_SIG, REG1_EN_SIG, REG2_EN_SIG, REG3_EN_SIG, REG4_EN_SIG : std_logic := '0';
signal REG0_2_EN_SIG, REG1_2_EN_SIG, REG2_2_EN_SIG, REG3_2_EN_SIG, REG4_2_EN_SIG : std_logic := '0';
signal REG0_OUT_SIG, REG1_OUT_SIG, REG2_OUT_SIG, REG3_OUT_SIG, REG4_OUT_SIG :std_logic_vector(PIXEL_SIZE-1 downto 0) := (others => '0');
signal REG0_2_OUT_SIG, REG1_2_OUT_SIG, REG2_2_OUT_SIG, REG3_2_OUT_SIG, REG4_2_OUT_SIG :std_logic_vector(PIXEL_SIZE-1 downto 0) := (others => '0');
signal SEL1_SIG, SEL2_SIG : std_logic := '0';
begin

	-- Input Signal Assertion 
	WR_RAM_DATA_SIG <= DATA;
	RAM_WRITE_ADDRESS_SIG <= ADDRESS;
	RAM_WE_SIG <= WE;
	
	BLOCK_RAM_INST: BLOCK_RAM
	generic map ( WIDTH => 448,
	              POWER => 5)
	port map (
	CLK     =>  CLK,
	WE      =>  RAM_WE_SIG,
	RE      =>  RAM_RE_SIG,
	WR_ADDR =>  RAM_WRITE_ADDRESS_SIG,
	RE_ADDR =>  RAM_READ_ADDRESS_SIG,
	DIN     =>  WR_RAM_DATA_SIG,
	DOUT    =>  RE_RAM_DATA_SIG
	);
	
	INPUT_LAYER_FSM_INST: INPUT_LAYER_FSM
	generic map ( WIDTH => 448,
	              POWER => 5)
	port map (
	CLK       => CLK,
	RESET     => RESET,
	RAM_DATA  => RE_RAM_DATA_SIG,
	REG0_FIN  => REG0_FIN_SIG,
	REG1_FIN  => REG1_FIN_SIG,
	REG2_FIN  => REG2_FIN_SIG,
	REG3_FIN  => REG3_FIN_SIG,
	REG4_FIN  => REG4_FIN_SIG,
	REG0_2_FIN  => REG0_2_FIN_SIG,
	REG1_2_FIN  => REG1_2_FIN_SIG,
	REG2_2_FIN  => REG2_2_FIN_SIG,
	REG3_2_FIN  => REG3_2_FIN_SIG,
	REG4_2_FIN => REG4_2_FIN_SIG,
	SEL1      => SEL1_SIG,
	SEL2      => SEL2_SIG,
	RAM_EN    => RAM_RE_SIG,
	RAM_ADDR  => RAM_READ_ADDRESS_SIG,
	REG0_EN   => REG0_EN_SIG,
	REG1_EN   => REG1_EN_SIG,
	REG2_EN   => REG2_EN_SIG,
	REG3_EN   => REG3_EN_SIG,
	REG4_EN   => REG4_EN_SIG,
	REG0_2_EN  => REG0_2_EN_SIG,
	REG1_2_EN  => REG1_2_EN_SIG,
	REG2_2_EN  => REG2_2_EN_SIG,
	REG3_2_EN  => REG3_2_EN_SIG,
	REG4_2_EN  => REG4_2_EN_SIG,
	REG0_DATA => REG0_IN_SIG,
	REG1_DATA => REG1_IN_SIG,
	REG2_DATA => REG2_IN_SIG,
	REG3_DATA => REG3_IN_SIG,
	REG4_DATA => REG4_IN_SIG,
	REG0_2_DATA => REG0_2_IN_SIG,
	REG1_2_DATA => REG1_2_IN_SIG,
	REG2_2_DATA => REG2_2_IN_SIG,
	REG3_2_DATA => REG3_2_IN_SIG,
	REG4_2_DATA => REG4_2_IN_SIG,
	START_CNT1  => SET_CNT1,
	START_CNT2  => SET_CNT2
	);
	
	SREG10_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG0_EN_SIG,
	DIN    =>  REG0_IN_SIG,
	DOUT   =>  REG0_OUT_SIG,
	FINISH =>  REG0_FIN_SIG
	);
	
	SREG11_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG1_EN_SIG,
	DIN    =>  REG1_IN_SIG,
	DOUT   =>  REG1_OUT_SIG,
	FINISH =>  REG1_FIN_SIG
	);
	
	SREG12_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG2_EN_SIG,
	DIN    =>  REG2_IN_SIG,
	DOUT   =>  REG2_OUT_SIG,
	FINISH =>  REG2_FIN_SIG
	);
	
	SREG13_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG3_EN_SIG,
	DIN    =>  REG3_IN_SIG,
	DOUT   =>  REG3_OUT_SIG,
	FINISH =>  REG3_FIN_SIG
	);
	
	SREG14_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG4_EN_SIG,
	DIN    =>  REG4_IN_SIG,
	DOUT   =>  REG4_OUT_SIG,
	FINISH =>  REG4_FIN_SIG
	);
	
	SREG20_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG0_2_EN_SIG,
	DIN    =>  REG0_2_IN_SIG,
	DOUT   =>  REG0_2_OUT_SIG,
	FINISH =>  REG0_2_FIN_SIG
	);
	
	SREG21_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG1_2_EN_SIG,
	DIN    =>  REG1_2_IN_SIG,
	DOUT   =>  REG1_2_OUT_SIG,
	FINISH =>  REG1_2_FIN_SIG
	);
	
	SREG22_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG2_2_EN_SIG,
	DIN    =>  REG2_2_IN_SIG,
	DOUT   =>  REG2_2_OUT_SIG,
	FINISH =>  REG2_2_FIN_SIG
	);
	
	SREG23_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG3_2_EN_SIG,
	DIN    =>  REG3_2_IN_SIG,
	DOUT   =>  REG3_2_OUT_SIG,
	FINISH =>  REG3_2_FIN_SIG
	);
	
	SREG24_INST: SHIFT_REGISTER
	generic map ( WIDTH => 448,
	              PIXEL_SIZE => 16)
	port map (
	CLK    =>  CLK,
--	RESET  =>  RESET,
	ENABLE =>  REG4_2_EN_SIG,
	DIN    =>  REG4_2_IN_SIG,
	DOUT   =>  REG4_2_OUT_SIG,
	FINISH =>  REG4_2_FIN_SIG
	);
	
	DECODER_INST: DECODER
	generic map ( WIDTH => 16)
	port map (
	R10  => REG0_OUT_SIG,
	R11  => REG1_OUT_SIG,
	R12  => REG2_OUT_SIG,
	R13  => REG3_OUT_SIG,
	R14  => REG4_OUT_SIG,
	R20  => REG0_2_OUT_SIG,
	R21  => REG1_2_OUT_SIG,
	R22  => REG2_2_OUT_SIG,
	R23  => REG3_2_OUT_SIG,
	R24  => REG4_2_OUT_SIG,
    S1   => SEL1_SIG,
    S2   => SEL2_SIG,
    R0   => REG0_OUT,
    R1   => REG1_OUT,
    R2   => REG2_OUT,
    R3   => REG3_OUT,
    R4   => REG4_OUT
);

end Structural;