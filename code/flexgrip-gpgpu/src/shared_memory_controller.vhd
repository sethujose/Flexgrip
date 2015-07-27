----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      shared_memory_controller - arch 
-- Project Name:     GPGPU
-- Target Devices: 
-- Tool versions:    ISE 10.1
-- Description: 
--
----------------------------------------------------------------------------
-- Revisions:       
--  REV:        Date:           Description:
--  0.1.a       9/13/2010       Created Top level file 
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all ;  
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

	entity shared_memory_controller is
		generic (
            ADDRESS_SIZE                : integer := 32;
            ARB_GPRS_EN                 : std_logic := '0';
            ARB_ADDR_REGS_EN            : std_logic := '0'
        );
		port (
			reset                       : in  std_logic;
			clk_in                      : in  std_logic;
			en						    : in  std_logic;
            
            data_in                     : in  vector_word_register_array;
            base_addr_in                : in  std_logic_vector(ADDRESS_SIZE-1 downto 0);
			addr_in					    : in  std_logic_vector(31 downto 0);
			mask_in                     : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_type_in               : in  mem_opcode_type;
            sm_type_in					: in  sm_type;
            
			addr_lo_in					: in  std_logic_vector(1 downto 0);
			addr_hi_in					: in  std_logic;
			addr_imm_in					: in  std_logic;
			
            gprs_req_out                : out std_logic;
            gprs_ack_out                : out std_logic;
            gprs_grant_in               : in  std_logic;
            
            gprs_en_out                 : out std_logic;
            gprs_reg_num_out            : out std_logic_vector(8 downto 0);
            gprs_data_type_out          : out data_type;
            gprs_mask_out               : out std_logic_vector(CORES-1 downto 0);
            gprs_rd_wr_en_out           : out std_logic;
            gprs_rd_data_in             : in  vector_word_register_array;
            gprs_rdy_in                 : in  std_logic;
            
            addr_regs_req_out           : out std_logic;
            addr_regs_ack_out           : out std_logic;
            addr_regs_grant_in          : in  std_logic;
            
            addr_regs_en_out            : out std_logic;
            addr_regs_reg_out           : out std_logic_vector(1 downto 0);
            addr_regs_mask_out          : out std_logic_vector(CORES-1 downto 0);
            addr_regs_rd_wr_en_out      : out std_logic;
            addr_regs_rd_data_in        : in  vector_register;
            addr_regs_rdy_in            : in  std_logic;
            
            shmem_addr_out              : out std_logic_vector(ADDRESS_SIZE-1 downto 0);
            shmem_wr_en_out             : out std_logic_vector(0 downto 0);
            shmem_wr_data_out           : out std_logic_vector(7 downto 0);
            shmem_rd_data_in            : in  std_logic_vector(7 downto 0);
            
			data_out			       	: out vector_word_register_array;
			rdy_out		                : out std_logic
		);
	end shared_memory_controller;

architecture arch of shared_memory_controller is

    component effective_address
        generic (
            ARB_GPRS_EN                 : std_logic := '0';
            ARB_ADDR_REGS_EN            : std_logic := '0'
        );
        port (
            reset                       : in  std_logic;
			clk_in                      : in  std_logic;
			en						    : in  std_logic;
            
            reg_in                      : in  std_logic_vector(31 downto 0);
            addr_reg_in                 : in  std_logic_vector(2 downto 0);
            addr_imm_in                 : in  std_logic;
            shift_in                    : in  std_logic_vector(4 downto 0);
            
            gprs_req_out                : out std_logic;
            gprs_ack_out                : out std_logic;
            gprs_grant_in               : in  std_logic;
            
            gprs_en_out                 : out std_logic;
            gprs_reg_num_out            : out std_logic_vector(8 downto 0);
            gprs_data_type_out          : out data_type;
            gprs_mask_out               : out std_logic_vector(CORES-1 downto 0);
            gprs_rd_wr_en_out           : out std_logic;
            gprs_rd_data_in             : in  vector_word_register_array;
            gprs_rdy_in                 : in  std_logic;
            
            addr_regs_req_out           : out std_logic;
            addr_regs_ack_out           : out std_logic;
            addr_regs_grant_in          : in  std_logic;
            
            addr_regs_en_out            : out std_logic;
            addr_regs_reg_out           : out std_logic_vector(1 downto 0);
            addr_regs_mask_out          : out std_logic_vector(CORES-1 downto 0);
            addr_regs_rd_wr_en_out      : out std_logic;
            addr_regs_rd_data_in        : in  vector_register;
            addr_regs_rdy_in            : in  std_logic;
            
            addr_out                    : out vector_register;
            rdy_out		                : out std_logic
        );
    end component;

    component memory_controller
        generic (
            ADDRESS_SIZE            : integer := 32
        );
        port (
            reset                   : in  std_logic;
            clk_in                  : in  std_logic;
            en                      : in  std_logic;
            
            mem_addr_in             : in  std_logic_vector(ADDRESS_SIZE-1 downto 0);
            mem_size_in             : in  std_logic_vector(2 downto 0);
            mem_wr_data_in          : in  std_logic_vector(31 downto 0);
            mem_wr_en_in            : in  std_logic;
            
            mem_addr_out            : out std_logic_vector(ADDRESS_SIZE-1 downto 0);
            mem_wr_en_out           : out std_logic_vector(0 downto 0);
            mem_wr_data_out         : out std_logic_vector(7 downto 0);
            mem_rd_data_in          : in  std_logic_vector(7 downto 0);
            
            mem_rd_data_out         : out std_logic_vector(31 downto 0);
            mem_rd_wr_done          : out std_logic
        );
    end component;
    
	type shared_memory_cntrl_state_type is (IDLE, READ_SHARED_MEM, GATHER_SHARED_MEM, GATHER_SHARED_WAIT, SCATTER_SHARED_MEM, SCATTER_SHARED_WAIT, CALC_EFFECTIVE_ADDR);
    signal shared_memory_cntrl_state_machine              : shared_memory_cntrl_state_type;
    signal shared_memory_cntrl_state_machine_cs           : std_logic_vector(3 downto 0);
	
    signal en_reg                   : std_logic;
    signal data_i                   : vector_word_register_array;
    signal addr_hi_i_3              : std_logic_vector(2 downto 0);
    signal addr_reg_i               : std_logic_vector(2 downto 0);
    signal base_addr_i              : std_logic_vector(ADDRESS_SIZE-1 downto 0);
    signal shmem_addr_i             : std_logic_vector(ADDRESS_SIZE-1 downto 0);
    signal shmem_calc_addr_i        : std_logic_vector(ADDRESS_SIZE-1 downto 0);
    signal shmem_size_i             : std_logic_vector(2 downto 0);
    signal shmem_wr_en_i            : std_logic;
    signal shmem_en                 : std_logic;
    signal offset                   : vector_register;
    signal effective_addr_en        : std_logic;
    signal offset_o                 : vector_register;
    signal effective_addr_rdy_o     : std_logic;
    signal shmem_rd_data            : vector_register;
    signal shift_i                  : std_logic_vector(4 downto 0);
    signal shmem_size               : std_logic_vector(2 downto 0);
    signal shmem_rd_data_o          : std_logic_vector(31 downto 0);
    signal shmem_wr_data_i          : std_logic_vector(31 downto 0);
    signal shmem_rd_wr_done_o       : std_logic;
    signal shared_mem_rd_wr_cntr    : integer range 0 to CORES;
    signal next_read_write_state    : shared_memory_cntrl_state_type;
    
begin
	
    addr_hi_i_3     <= "00" & addr_hi_in;
    addr_reg_i      <= (to_stdlogicvector(to_bitvector(addr_hi_i_3) sll 2)) or ("0" & addr_lo_in);
    
    pSharedMemoryController :  process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (reset = '1') then
--                data_i                                                      <= (others => (others => (others => '0')));
--                base_addr_i                                                 <= (others => '0');
--                shmem_addr_i                                                <= (others => '0');
--                shmem_size_i                                                <= (others => '0');
--                shmem_wr_data_i                                             <= (others => '0');
--                shmem_wr_en_i                                               <= '0';
--                shmem_en                                                    <= '0';
--                data_out			                                        <= (others => (others => (others => '0')));
--                rdy_out		                                                <= '0';
--                offset                                                      <= (others => (others => '0'));
--                shmem_rd_data                                               <= (others => (others => '0'));
--                shared_mem_rd_wr_cntr                                       <= 0;
                en_reg                                                      <= '0';
                next_read_write_state                                       <= IDLE;
                shared_memory_cntrl_state_machine                           <= IDLE;
            else
                case shared_memory_cntrl_state_machine is
                    when IDLE =>
                        data_i                                              <= data_in;
                        shared_mem_rd_wr_cntr                               <= 0;
                        rdy_out                                             <= '0';
                        en_reg                                              <= en;
                        effective_addr_en                           		<= '0';
                        shmem_en                                            <= '0';
                        if (en_reg = '0' and en = '1') then
                            base_addr_i                                     <= base_addr_in;
                            if (rd_wr_type_in = READ) then
                                if (shmem_size="001") then
                                    shmem_addr_i                            <= addr_in(ADDRESS_SIZE-1 downto 0);
                                elsif (shmem_size="010") then
                                    shmem_addr_i                            <= addr_in(ADDRESS_SIZE-2 downto 0) & '0';
                                elsif (shmem_size="100") then
                                    shmem_addr_i                            <= addr_in(ADDRESS_SIZE-3 downto 0) & "00";
                                else
                                    shmem_addr_i                            <= addr_in(ADDRESS_SIZE-1 downto 0);
                                end if;                            
                                shmem_size_i                                <= shmem_size;
                                shmem_wr_en_i                               <= '0';
                                shmem_en                                    <= '1';
                                shared_memory_cntrl_state_machine           <= READ_SHARED_MEM;
                            elsif (rd_wr_type_in = READ_GATHER) then
                                if ((addr_reg_i = "000") and (addr_imm_in = '1')) then
                                    shmem_addr_i                            <= addr_in(ADDRESS_SIZE-1 downto 0);
                                    shmem_size_i                            <= shmem_size;
                                    shmem_wr_en_i                           <= '0';
                                    shmem_en                                <= '1';
                                    shared_memory_cntrl_state_machine       <= READ_SHARED_MEM;
                                else
                                    effective_addr_en                       <= '1';
                                    next_read_write_state                   <= GATHER_SHARED_MEM;
                                    shared_memory_cntrl_state_machine       <= CALC_EFFECTIVE_ADDR;
                                end if;
                            elsif (rd_wr_type_in = WRITE_SCATTER) then
                                effective_addr_en                           <= '1';
                                next_read_write_state                       <= SCATTER_SHARED_MEM;
                                shared_memory_cntrl_state_machine           <= CALC_EFFECTIVE_ADDR;
                            end if;
                        end if;
                    when READ_SHARED_MEM =>
                        shmem_en                                            <= '0';
                        if (shmem_rd_wr_done_o = '1') then
                            for i in 0 to CORES-1 loop
                                data_out(i)(0)                              <= shmem_rd_data_o;
                            end loop;
                            rdy_out                                         <= '1';
                            shared_memory_cntrl_state_machine               <= IDLE;
                        end if;
                    when GATHER_SHARED_MEM =>
                        if (shared_mem_rd_wr_cntr < CORES) then
                            if (mask_in(shared_mem_rd_wr_cntr) = '1') then
                                shmem_addr_i                                <= offset(shared_mem_rd_wr_cntr)(ADDRESS_SIZE-1 downto 0);
                                shmem_size_i                                <= shmem_size;
                                shmem_wr_en_i                               <= '0';
                                shmem_en                                    <= '1';
                                shared_memory_cntrl_state_machine           <= GATHER_SHARED_WAIT;
                            else
                                shmem_en                                    <= '0';
                                shmem_rd_data(shared_mem_rd_wr_cntr)        <= (others => '0');
                                shared_mem_rd_wr_cntr                       <= shared_mem_rd_wr_cntr + 1;
                            end if;
                        else
                            shmem_en                                        <= '0';
                            for i in 0 to CORES-1 loop
                                data_out(i)(0)                              <= shmem_rd_data(i);
                            end loop;
                            shared_mem_rd_wr_cntr                           <= 0;
                            rdy_out                                         <= '1';
                            shared_memory_cntrl_state_machine               <= IDLE;
                        end if;
                    when GATHER_SHARED_WAIT =>
                        shmem_en                                            <= '0';
                        if (shmem_rd_wr_done_o = '1') then
                            shmem_rd_data(shared_mem_rd_wr_cntr)            <= shmem_rd_data_o;
                            shared_mem_rd_wr_cntr                           <= shared_mem_rd_wr_cntr + 1;
                            shared_memory_cntrl_state_machine               <= GATHER_SHARED_MEM;
                        end if;
                    when SCATTER_SHARED_MEM =>
                        if (shared_mem_rd_wr_cntr < CORES) then
                            if (mask_in(shared_mem_rd_wr_cntr) = '1') then
                                shmem_wr_data_i                             <= data_i(shared_mem_rd_wr_cntr)(0);
                                shmem_addr_i                                <= offset(shared_mem_rd_wr_cntr)(ADDRESS_SIZE-1 downto 0);
                                shmem_size_i                                <= shmem_size;
                                shmem_wr_en_i                               <= '1';
                                shmem_en                                    <= '1';
                                shared_memory_cntrl_state_machine           <= SCATTER_SHARED_WAIT;
                            else
                                shmem_en                                    <= '0';
                                shmem_wr_en_i                               <= '0';
                                shared_mem_rd_wr_cntr                       <= shared_mem_rd_wr_cntr + 1;
                            end if;
                        else
                            shmem_en                                        <= '0';
                            shmem_wr_en_i                                   <= '0';
                            shared_mem_rd_wr_cntr                           <= 0;
                            rdy_out                                         <= '1';
                            shared_memory_cntrl_state_machine               <= IDLE;
                        end if;
                    when SCATTER_SHARED_WAIT =>
                        shmem_en                                            <= '0';
                        shmem_wr_en_i                                       <= '0';
                        if (shmem_rd_wr_done_o = '1') then
                            shared_mem_rd_wr_cntr                           <= shared_mem_rd_wr_cntr + 1;
                            shared_memory_cntrl_state_machine               <= SCATTER_SHARED_MEM;
                        end if;
                    when CALC_EFFECTIVE_ADDR =>
                        effective_addr_en                                   <= '0';
                        if (effective_addr_rdy_o = '1') then
                            offset                                          <= offset_o;
                            shared_memory_cntrl_state_machine               <= next_read_write_state;
                        end if;
                    when others =>
                        shared_memory_cntrl_state_machine                   <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
    pShiftAmount : process(sm_type_in)
    begin
        case sm_type_in is
            when SM_U16 =>
                shift_i             <= "00001";
            when SM_S16 =>
                shift_i             <= "00001";
            when SM_U32 =>
                shift_i             <= "00010";
            when others =>
                shift_i             <= "00000";
        end case;
    end process;
    
    pSharedMemorySize : process(sm_type_in)
    begin
        case sm_type_in is
            when SM_U8 =>
                shmem_size          <= "001";
            when SM_U16 =>
                shmem_size          <= "010";
            when SM_S16 =>
                shmem_size          <= "010";
            when SM_U32 =>
                shmem_size          <= "100";
            when others =>
                shmem_size          <= "000";
        end case;
    end process;
    
    uEffectiveAddress : effective_address
        generic map (
            ARB_GPRS_EN                 => ARB_GPRS_EN,
            ARB_ADDR_REGS_EN            => ARB_ADDR_REGS_EN
        )
        port map (
			reset                       => reset,
			clk_in                      => clk_in,
			en						    => effective_addr_en,
            
            reg_in                      => addr_in,
            addr_reg_in                 => addr_reg_i, --addr_hi_lo,
            addr_imm_in                 => addr_imm_in,
            shift_in                    => shift_i,
            
            gprs_req_out                => gprs_req_out,
            gprs_ack_out                => gprs_ack_out,
            gprs_grant_in               => gprs_grant_in,
            
            gprs_en_out                 => gprs_en_out,
            gprs_reg_num_out            => gprs_reg_num_out,
            gprs_data_type_out          => gprs_data_type_out,
            gprs_mask_out               => gprs_mask_out,
            gprs_rd_wr_en_out           => gprs_rd_wr_en_out,
            gprs_rd_data_in             => gprs_rd_data_in,
            gprs_rdy_in                 => gprs_rdy_in,
            
            addr_regs_req_out           => addr_regs_req_out,
            addr_regs_ack_out           => addr_regs_ack_out,
            addr_regs_grant_in          => addr_regs_grant_in,
            
            addr_regs_en_out            => addr_regs_en_out,
            addr_regs_reg_out           => addr_regs_reg_out,
            addr_regs_mask_out          => addr_regs_mask_out,
            addr_regs_rd_wr_en_out      => addr_regs_rd_wr_en_out,
            addr_regs_rd_data_in        => addr_regs_rd_data_in,
            addr_regs_rdy_in            => addr_regs_rdy_in,
            
            addr_out                    => offset_o,
            rdy_out		                => effective_addr_rdy_o
        );
    
    shmem_calc_addr_i   <= shmem_addr_i + base_addr_i;
    
    uMemoryController : memory_controller
        generic map (
            ADDRESS_SIZE            =>  ADDRESS_SIZE
        )
        port map (
            reset                   =>  reset,
            clk_in                  =>  clk_in,
            en                      =>  shmem_en,
            
            mem_addr_in             =>  shmem_calc_addr_i,
            mem_size_in             =>  shmem_size_i,
            mem_wr_data_in          =>  shmem_wr_data_i,
            mem_wr_en_in            =>  shmem_wr_en_i,
            
            mem_addr_out            =>  shmem_addr_out,
            mem_wr_en_out           =>  shmem_wr_en_out,
            mem_wr_data_out         =>  shmem_wr_data_out,
            mem_rd_data_in          =>  shmem_rd_data_in,
            
            mem_rd_data_out         =>  shmem_rd_data_o,
            mem_rd_wr_done          =>  shmem_rd_wr_done_o
        );
        
end arch;

