library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity DEMUX_FSM is
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
end DEMUX_FSM;

architecture Behavioral of DEMUX_FSM is
type FSM_STATES is (IDLE, WRITE_FIFO1, WRITE_FIFO2, READ_BOTH_FIFOS);
signal CURRENT_STATE, NEXT_STATE : FSM_STATES;	
begin
    
    SYNC_PROC: process(CLK)
	begin
		if(rising_edge(CLK))then
			if(RESET = '1')then
				CURRENT_STATE <= IDLE;
			else
				CURRENT_STATE <= NEXT_STATE;
			end if;
	    end if;
    end process;
    
    ASYNC_PROC: process(CURRENT_STATE, SET_FIFO, FIFO1_FULL, FIFO1_EMPTY, FIFO2_FULL, FIFO2_EMPTY, DIN)
    begin
		case CURRENT_STATE is
			when IDLE =>
			     DOUT <= (others => '0');
			     FIFO1_WR_EN <= '0';
			     FIFO1_RD_EN <= '0';
			     FIFO2_WR_EN <= '0';
			     FIFO2_RD_EN <= '0';
			     if(SET_FIFO = '1')then
			         NEXT_STATE <= WRITE_FIFO1;
			     else
			         NEXT_STATE <= IDLE;
			     end if;
			when WRITE_FIFO1 =>
			     DOUT <= DIN;
			     FIFO1_WR_EN <= '1';
			     FIFO1_RD_EN <= '0';
			     FIFO2_WR_EN <= '0';
			     FIFO2_RD_EN <= '0';
			     START_FC_CNT <= '0';
			     if(SET_FIFO = '1' and FIFO2_FULL = '0')then
			         NEXT_STATE <= WRITE_FIFO2;
			     else
			         NEXT_STATE <= READ_BOTH_FIFOS;
			     end if;
			when WRITE_FIFO2 =>
			     DOUT <= DIN;
			     FIFO1_WR_EN <= '0';
			     FIFO1_RD_EN <= '0';
			     FIFO2_WR_EN <= '1';
			     FIFO2_RD_EN <= '0';
                 if(SET_FIFO = '1' and FIFO1_FULL = '0')then
			         NEXT_STATE <= WRITE_FIFO1;
			     else
			         NEXT_STATE <= READ_BOTH_FIFOS;
			     end if;
			when READ_BOTH_FIFOS =>
			     DOUT <= DIN;
			     FIFO1_WR_EN <= '0';
			     FIFO1_RD_EN <= '1';
			     FIFO2_WR_EN <= '0';
			     FIFO2_RD_EN <= '1';
			     START_FC_CNT <= '1';
			     if(FIFO1_EMPTY = '1' or FIFO2_EMPTY = '1')then
			         NEXT_STATE <= IDLE;
			     else
			         NEXT_STATE <= READ_BOTH_FIFOS;
			     end if; 
		    when others =>
		         NEXT_STATE <= IDLE;
		     end case;
	end process;	            
end Behavioral;
