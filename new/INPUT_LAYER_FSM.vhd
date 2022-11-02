library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity INPUT_LAYER_FSM is
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
	SEL1      :  out std_logic;
	SEL2      :  out std_logic;
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
end INPUT_LAYER_FSM;

architecture Behavioral of INPUT_LAYER_FSM is

	type FSM_STATES is (IDLE, REG0_WRITE, REG1_WRITE, REG2_WRITE, REG3_WRITE, REG4_WRITE, 
	   REG0_2_WRITE, REG1_2_WRITE, REG2_2_WRITE, REG3_2_WRITE, REG4_2_WRITE,
	   REG0_RAM_READ, REG1_RAM_READ, REG2_RAM_READ, REG3_RAM_READ, REG4_RAM_READ,
	   REG0_2_RAM_READ, REG1_2_RAM_READ, REG2_2_RAM_READ, REG3_2_RAM_READ, REG4_2_RAM_READ);
	signal CURRENT_STATE, NEXT_STATE : FSM_STATES;
	signal REG0_FIN_SIG, REG1_FIN_SIG, REG2_FIN_SIG, REG3_FIN_SIG, REG4_FIN_SIG  : std_logic := '0';
	signal REG0_2_FIN_SIG, REG1_2_FIN_SIG, REG2_2_FIN_SIG, REG3_2_FIN_SIG, REG4_2_FIN_SIG  : std_logic := '0';
	signal REG0_CNT : unsigned(POWER-1 downto 0) := "00000";
	signal REG1_CNT : unsigned(POWER-1 downto 0) := "00001";
	signal REG2_CNT : unsigned(POWER-1 downto 0) := "00010";
	signal REG3_CNT : unsigned(POWER-1 downto 0) := "00011";
	signal REG4_CNT : unsigned(POWER-1 downto 0) := "00100";
	signal REG0_2_CNT : unsigned(POWER-1 downto 0) := "00001";
	signal REG1_2_CNT : unsigned(POWER-1 downto 0) := "00010";
	signal REG2_2_CNT : unsigned(POWER-1 downto 0) := "00011";
	signal REG3_2_CNT : unsigned(POWER-1 downto 0) := "00100";
	signal REG4_2_CNT : unsigned(POWER-1 downto 0) := "00101";
	
begin
	
	REG0_FIN_SIG <= REG0_FIN;
	REG1_FIN_SIG <= REG1_FIN;
	REG2_FIN_SIG <= REG2_FIN;
	REG3_FIN_SIG <= REG3_FIN;
	REG4_FIN_SIG <= REG4_FIN;
	
	REG0_2_FIN_SIG <= REG0_2_FIN;
	REG1_2_FIN_SIG <= REG1_2_FIN;
	REG2_2_FIN_SIG <= REG2_2_FIN;
	REG3_2_FIN_SIG <= REG3_2_FIN;
	REG4_2_FIN_SIG <= REG4_2_FIN;
	
	SYNC_PROC: process(CLK)
	begin
		if(rising_edge(CLK))then
			if(RESET = '1')then
				CURRENT_STATE <= IDLE;
			else
				CURRENT_STATE <= NEXT_STATE;
			end if;
			if(CURRENT_STATE = REG0_WRITE)then
			    if(REG0_CNT < "10111")then
			         REG0_CNT <= REG0_CNT + 2;
			    else
			         REG0_CNT <= "00000";
			    end if;
			elsif(CURRENT_STATE = REG1_WRITE)then
			    if(REG1_CNT < "11000")then
			         REG1_CNT <= REG1_CNT + 2;
			    else
			         REG1_CNT <= "00001";
			    end if;
			elsif(CURRENT_STATE = REG2_WRITE)then
			    if(REG2_CNT < "11001")then
			         REG2_CNT <= REG2_CNT + 2;
			    else
			         REG2_CNT <= "00010";
			    end if;
			elsif(CURRENT_STATE = REG3_WRITE)then
			    if(REG3_CNT < "11010")then
			         REG3_CNT <= REG3_CNT + 2;
			    else
			         REG3_CNT <= "00011";
			    end if;
			end if; 
			if(CURRENT_STATE = REG0_2_WRITE)then
			    if(REG0_CNT < "10111")then
			         REG0_2_CNT <= REG0_2_CNT + 2;
			    else
			         REG0_2_CNT <= "00001";
			    end if;
			elsif(CURRENT_STATE = REG1_2_WRITE)then
			    if(REG1_2_CNT < "11000")then
			         REG1_2_CNT <= REG1_2_CNT + 2;
			    else
			         REG1_2_CNT <= "00010";
			    end if;
			elsif(CURRENT_STATE = REG2_2_WRITE)then
			    if(REG2_2_CNT < "11001")then
			         REG2_2_CNT <= REG2_2_CNT + 2;
			    else
			         REG2_2_CNT <= "00011";
			    end if;
			elsif(CURRENT_STATE = REG3_2_WRITE)then
			    if(REG3_2_CNT < "11010")then
			         REG3_2_CNT <= REG3_2_CNT + 2;
			    else
			         REG3_2_CNT <= "00100";
			    end if;
			end if; 
		end if;
	end process;

	ASYNC_PROC: process(CURRENT_STATE, REG0_FIN_SIG, REG0_2_FIN_SIG)

	begin
	    NEXT_STATE <= IDLE;
		case CURRENT_STATE is
			when IDLE =>
				RAM_EN   <= '0';
				RAM_ADDR <= (others => '0');
				SEL1 <= '0';
				SEL2 <= '0';
				REG0_EN   <= '0';
				REG1_EN   <= '0';
				REG2_EN   <= '0';
				REG3_EN   <= '0';
				REG4_EN   <= '0';
				REG0_DATA <= (others => '0');
				REG1_DATA <= (others => '0');
				REG2_DATA <= (others => '0');
				REG3_DATA <= (others => '0');
				REG4_DATA <= (others => '0');
				START_CNT1 <= '0';
				START_CNT2 <= '0';
				NEXT_STATE <= REG0_RAM_READ;
			
			when REG0_RAM_READ =>
				RAM_EN <= '1';
				REG0_EN <= '0';
				RAM_ADDR <= std_logic_vector(REG0_CNT);
				NEXT_STATE <= REG0_WRITE;
			     
			when REG0_WRITE =>
			     RAM_EN <= '0';
			     RAM_ADDR <= (others => '0');
			     REG0_DATA <= RAM_DATA;
			     NEXT_STATE <= REG1_RAM_READ;
			     
			when REG1_RAM_READ =>
				RAM_EN <= '1';
				REG1_EN <= '0';
				RAM_ADDR <= std_logic_vector(REG1_CNT);
				NEXT_STATE <= REG1_WRITE;
			
			when REG1_WRITE =>
			     RAM_EN <= '0';
			     RAM_ADDR <= (others => '0');
			     REG1_DATA <= RAM_DATA;
			     NEXT_STATE <= REG2_RAM_READ; 
			     
			when REG2_RAM_READ =>
				RAM_EN <= '1';
				REG2_EN <= '0';
				RAM_ADDR <= std_logic_vector(REG2_CNT);
				START_CNT1 <= '0';
				NEXT_STATE <= REG2_WRITE;
			
			when REG2_WRITE =>
			     RAM_EN <= '0';
			     RAM_ADDR <= (others => '0');
			     REG2_DATA <= RAM_DATA;
			     NEXT_STATE <= REG3_RAM_READ; 
			     
			when REG3_RAM_READ =>
				RAM_EN <= '1';
				REG3_EN <= '0';
				RAM_ADDR <= std_logic_vector(REG3_CNT);
				NEXT_STATE <= REG3_WRITE;
			
			when REG3_WRITE =>
			     RAM_EN <= '0';
			     RAM_ADDR <= (others => '0');
			     REG3_DATA <= RAM_DATA;
			     NEXT_STATE <= REG4_RAM_READ;   
			     
			when REG4_RAM_READ =>
				RAM_EN <= '1';
				REG4_EN <= '0';
				RAM_ADDR <= std_logic_vector(REG4_CNT);
				NEXT_STATE <= REG4_WRITE;
			
			when REG4_WRITE =>
			     RAM_EN <= '0';
			     RAM_ADDR <= (others => '0');
			     REG4_DATA <= RAM_DATA;
			     if(REG0_2_FIN_SIG = '1')then
			         REG4_CNT <= REG4_CNT + 2;
			         REG0_EN <= '1';
			         REG1_EN <= '1';
			         REG2_EN <= '1';
			         REG3_EN <= '1';
			         REG4_EN <= '1';
			         SEL1 <= '1';
			         SEL2 <= '0';
			         START_CNT1 <= '1';
			         NEXT_STATE <= REG0_2_RAM_READ;
			     else
			         START_CNT1 <= '0';
			         NEXT_STATE <= REG4_WRITE;
			     end if;

			when REG0_2_RAM_READ =>
			     RAM_EN <= '1';
			     REG0_2_EN <= '0';
			     RAM_ADDR <= std_logic_vector(REG0_2_CNT);
				 NEXT_STATE <= REG0_2_WRITE; 
		    
		    when REG0_2_WRITE =>
		         RAM_EN <= '0';
		         RAM_ADDR <= (others => '0');
		         REG0_2_DATA <= RAM_DATA;
		         NEXT_STATE <= REG1_2_RAM_READ;
			
			when REG1_2_RAM_READ =>
			     RAM_EN <= '1';
			     REG1_2_EN <= '0';
			     RAM_ADDR <= std_logic_vector(REG1_2_CNT);
			     NEXT_STATE <= REG1_2_WRITE;
			
			when REG1_2_WRITE => 
			     RAM_EN <= '0';
		         RAM_ADDR <= (others => '0');
		         REG1_2_DATA <= RAM_DATA;
			     NEXT_STATE <= REG2_2_RAM_READ;
			
			when REG2_2_RAM_READ =>
			     RAM_EN <= '1';
			     REG2_2_EN <= '0';
			     RAM_ADDR <= std_logic_vector(REG2_2_CNT);
			     START_CNT2 <= '0';
			     NEXT_STATE <= REG2_2_WRITE;
			     
			when REG2_2_WRITE =>
			     RAM_EN <= '0';
		         RAM_ADDR <= (others => '0');
		         REG2_2_DATA <= RAM_DATA;
			     NEXT_STATE <= REG3_2_RAM_READ;
			     
			when REG3_2_RAM_READ =>
			     RAM_EN <= '1';
			     REG3_2_EN <= '0';
			     RAM_ADDR <= std_logic_vector(REG3_2_CNT);
			     NEXT_STATE <= REG3_2_WRITE;
			     
			when REG3_2_WRITE =>
			     RAM_EN <= '0';
		         RAM_ADDR <= (others => '0');
		         REG3_2_DATA <= RAM_DATA;
			     NEXT_STATE <= REG4_2_RAM_READ;
			
			when REG4_2_RAM_READ =>
			     RAM_EN <= '1';
			     REG4_2_EN <= '0';
			     RAM_ADDR <= std_logic_vector(REG4_2_CNT);
			     NEXT_STATE <= REG4_2_WRITE;
			     
			when REG4_2_WRITE =>
			     RAM_EN <= '0';
		         RAM_ADDR <= (others => '0');
		         REG4_2_DATA <= RAM_DATA;
			     if(REG0_FIN_SIG = '1')then
			         REG4_2_CNT <= REG4_2_CNT + 2;
			         REG0_2_EN <= '1';
			         REG1_2_EN <= '1';
			         REG2_2_EN <= '1';
			         REG3_2_EN <= '1';
			         REG4_2_EN <= '1';
			         SEL1 <='0';
			         SEL2 <='1';
			         START_CNT2 <= '1';
			         NEXT_STATE <= REG0_RAM_READ;
			     else
			         START_CNT2 <= '0';
			         NEXT_STATE <= REG4_2_WRITE;
			     end if;
			when others =>
				NEXT_STATE <= IDLE;
			
			end case;
			
		end process;
end Behavioral;