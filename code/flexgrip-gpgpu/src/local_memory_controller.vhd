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
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;


library local_address_lib;

use work.gpgpu_package.all;

	entity local_memory_controller is
		generic (
            ADDRESS_SIZE                : integer := 32;
            ARB_GPRS_EN                 : std_logic := '0';
            ARB_ADDR_REGS_EN            : std_logic := '0'
        );
		port (
			reset                       : in  std_logic;
			clk_in                      : in  std_logic;
			en						    : in  std_logic;
			
            core_id_in                  : in  std_logic_vector(7 downto 0); 
            num_warps_in                : in  std_logic_vector(4 downto 0); 
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            
            data_in                     : in  vector_word_register_array;
            addr_in						: in  std_logic_vector(31 downto 0);
			mask_in                     : in  std_logic_vector(7 downto 0);
            rd_wr_type_in               : in  mem_opcode_type;
            data_type_in			    : in  data_type;
            
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
            
            lmem_addr_out               : out std_logic_vector(ADDRESS_SIZE-1 downto 0);
            lmem_wr_en_out              : out std_logic_vector(0 downto 0);
            lmem_wr_data_out            : out std_logic_vector(7 downto 0);
            lmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
			data_out			        : out vector_word_register_array;
			rdy_out		                : out std_logic
		);
	end local_memory_controller;

architecture arch of local_memory_controller is

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

    component local_address  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic; 
            addr_0i                     : in std_logic_vector(31 downto 0); 
            addr_1i                     : in std_logic_vector(31 downto 0); 
            addr_2i                     : in std_logic_vector(31 downto 0); 
            addr_3i                     : in std_logic_vector(31 downto 0); 
            addr_4i                     : in std_logic_vector(31 downto 0); 
            addr_5i                     : in std_logic_vector(31 downto 0); 
            addr_6i                     : in std_logic_vector(31 downto 0); 
            addr_7i                     : in std_logic_vector(31 downto 0); 
            core_count                  : in std_logic_vector(7 downto 0); 
            core_id                     : in std_logic_vector(7 downto 0); 
            num_warps                   : in std_logic_vector(4 downto 0); 
            warp_id                     : in std_logic_vector(4 downto 0); 
            warp_lane_id                : in std_logic_vector(1 downto 0); 
            warp_size                   : in std_logic_vector(5 downto 0); 
            local_addr_0i               : out std_logic_vector(31 downto 0); 
            local_addr_1i               : out std_logic_vector(31 downto 0); 
            local_addr_2i               : out std_logic_vector(31 downto 0); 
            local_addr_3i               : out std_logic_vector(31 downto 0); 
            local_addr_4i               : out std_logic_vector(31 downto 0); 
            local_addr_5i               : out std_logic_vector(31 downto 0); 
            local_addr_6i               : out std_logic_vector(31 downto 0); 
            local_addr_7i               : out std_logic_vector(31 downto 0)
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
    
	type local_memory_cntrl_state_type is (IDLE, READ_LOCAL_MEM, READ_LOCAL_WAIT, GATHER_LOCAL_MEM, GATHER_LOCAL_WAIT, WRITE_LOCAL_MEM, WRITE_LOCAL_WAIT, SCATTER_LOCAL_MEM, SCATTER_LOCAL_WAIT, CALC_EFFECTIVE_ADDR, CALC_LOCAL_ADDR);
    signal local_memory_cntrl_state_machine              : local_memory_cntrl_state_type;
    signal local_memory_cntrl_state_machine_cs           : std_logic_vector(3 downto 0);
	
    constant local_addr_latency     : integer := 15;
    
    signal en_reg                   : std_logic;
    signal data_i                   : vector_word_register_array;
    signal addr_i				    : std_logic_vector(31 downto 0);
    signal addr_imm_i               : std_logic;
    signal addr_hi_i_3              : std_logic_vector(2 downto 0);
    signal addr_reg_i               : std_logic_vector(2 downto 0);
    signal lmem_addr_i              : std_logic_vector(ADDRESS_SIZE-1 downto 0);
    signal lmem_size_i              : std_logic_vector(2 downto 0);
    signal lmem_wr_en_i             : std_logic;
    signal lmem_en                  : std_logic;
    signal addr                     : vector_register;
    signal local_addr               : vector_register;
    signal local_addr_o             : vector_register;
    signal effective_addr_en        : std_logic;
    signal addr_o                   : vector_register;
    signal addr_inc                 : std_logic_vector(3 downto 0);
    signal effective_addr_rdy_o     : std_logic;
    signal lmem_rd_data             : vector_word_register_array;
    signal shift_i                  : std_logic_vector(4 downto 0);
    signal lmem_size                : std_logic_vector(2 downto 0);
    signal lmem_rd_data_o           : std_logic_vector(31 downto 0);
    signal lmem_wr_data_i           : std_logic_vector(31 downto 0);
    signal lmem_rd_wr_done_o        : std_logic;
    signal lmem_regs                : integer range 0 to 4;
    signal local_mem_rd_wr_cntr     : integer range 0 to CORES;
    signal local_mem_regs_cntr      : integer range 0 to 4;
    signal local_addr_cntr          : integer range 0 to local_addr_latency;
    signal const_addr_inc           : std_logic_vector(31 downto 0);
    signal next_read_write_state    : local_memory_cntrl_state_type;
    
begin
    
    addr_hi_i_3     <= "00" & addr_hi_in;
    addr_reg_i      <= (to_stdlogicvector(to_bitvector(addr_hi_i_3) sll 2)) or ("0" & addr_lo_in);
    
    pLocalMemoryController :  process(reset, clk_in)
    begin
        if (reset = '1') then
            data_i                                                      <= (others => (others => (others => '0')));
            addr_i                                                      <= (others => '0');
            addr_imm_i                                                  <= '0';
            lmem_addr_i                                                 <= (others => '0');
            lmem_size_i                                                 <= (others => '0');
            lmem_wr_data_i                                              <= (others => '0');
            lmem_wr_en_i                                                <= '0';
            lmem_en                                                     <= '0';
            data_out			                                        <= (others => (others => (others => '0')));
			rdy_out		                                                <= '0';
            addr                                                        <= (others => (others => '0'));
            local_addr                                                  <= (others => (others => '0'));
            lmem_rd_data                                                <= (others => (others => (others => '0')));
            addr_inc                                                    <= (others => '0');
            local_mem_rd_wr_cntr                                        <= 0;
            local_mem_regs_cntr                                         <= 0;
            local_addr_cntr                                             <= 0;
            en_reg                                                      <= '0';
            next_read_write_state                                       <= IDLE;
            local_memory_cntrl_state_machine                            <= IDLE;
        elsif (rising_edge(clk_in)) then
            case local_memory_cntrl_state_machine is
                when IDLE =>
                    data_i                                              <= data_in;
                    addr_i                                              <= addr_in;
                    addr_imm_i                                          <= addr_imm_in;
                    lmem_addr_i                                         <= (others => '0');
                    lmem_size_i                                         <= (others => '0');
                    lmem_wr_data_i                                      <= (others => '0');
                    lmem_wr_en_i                                        <= '0';
                    lmem_en                                             <= '0';
                    data_out			                                		<= (others => (others => (others => '0')));
                    addr                                                <= (others => (others => '0'));
                    local_addr                                          <= (others => (others => '0'));
                    lmem_rd_data                                        <= (others => (others => (others => '0')));
                    local_mem_rd_wr_cntr                                <= 0;
                    local_mem_regs_cntr                                 <= 0;
                    local_addr_cntr                                     <= 0;
                    addr_inc                                            <= (others => '0');
                    rdy_out                                             <= '0';
                    en_reg                                              <= en;
                    if (en_reg = '0' and en = '1') then
                        if (rd_wr_type_in = READ_GATHER) then
                            if ((addr_reg_i = "000") and (addr_imm_i = '1') and (data_type_in = DT_U32)) then
                                for i in 0 to CORES-1 loop
                                    addr(i)                             <= addr_i;
                                end loop;
                                next_read_write_state                   <= READ_LOCAL_MEM;
                                local_memory_cntrl_state_machine        <= CALC_LOCAL_ADDR;
                            else
                                effective_addr_en                       <= '1';
                                next_read_write_state                   <= GATHER_LOCAL_MEM;
                                local_memory_cntrl_state_machine        <= CALC_EFFECTIVE_ADDR;
                             end if;
                        elsif (rd_wr_type_in = WRITE_SCATTER) then
                            if ((addr_reg_i = "000") and (addr_imm_i = '1') and (data_type_in = DT_U32)) then
                                for i in 0 to CORES-1 loop
                                    addr(i)                             <= addr_i;
                                end loop;
                                next_read_write_state                   <= WRITE_LOCAL_MEM;
                                local_memory_cntrl_state_machine        <= CALC_LOCAL_ADDR;
                            else
                                next_read_write_state                   <= SCATTER_LOCAL_MEM;
                                local_memory_cntrl_state_machine        <= CALC_EFFECTIVE_ADDR;
                            end if;
                        end if;
                    end if;
                when READ_LOCAL_MEM =>
                    if (local_mem_rd_wr_cntr < CORES) then
                        lmem_addr_i                      				   <= std_logic_vector (resize(unsigned(local_addr(0) + addr_inc + const_addr_inc), 16));
                        lmem_wr_en_i                                    <= '0';
                        lmem_en                                         <= '1';
                        local_memory_cntrl_state_machine                <= READ_LOCAL_WAIT;
                    else
                        lmem_en                                         <= '0';
                        data_out                                        <= lmem_rd_data;
                        local_mem_rd_wr_cntr                            <= 0;
                        rdy_out                                         <= '1';
                        local_memory_cntrl_state_machine                <= IDLE;
                    end if;
                when READ_LOCAL_WAIT =>
                    lmem_en                                             <= '0';
                    if (lmem_rd_wr_done_o = '1') then
                        lmem_rd_data(local_mem_rd_wr_cntr)(0)           <= lmem_rd_data_o;
                        local_mem_rd_wr_cntr                            <= local_mem_rd_wr_cntr + 1;
                        local_memory_cntrl_state_machine                <= READ_LOCAL_MEM;
                    end if;
                when GATHER_LOCAL_MEM =>
                    if (local_mem_rd_wr_cntr < CORES) then
                        if (mask_in(local_mem_rd_wr_cntr) = '1') then
                            lmem_addr_i                                 <= std_logic_vector ( resize ( unsigned(local_addr(local_mem_rd_wr_cntr) + addr_inc), 16) );
                            lmem_size_i                                 <= lmem_size;
                            lmem_wr_en_i                                <= '0';
                            lmem_en                                     <= '1';
                            local_memory_cntrl_state_machine            <= GATHER_LOCAL_WAIT;
                        else
                            lmem_en                                     <= '0';
                            for i in 0 to 3 loop
                                lmem_rd_data(local_mem_rd_wr_cntr)(i)   <= (others => '0');
                            end loop;
                            local_mem_rd_wr_cntr                        <= local_mem_rd_wr_cntr + 1;
                        end if;
                    else
                        lmem_en                                         <= '0';
                        data_out                                        <= lmem_rd_data;
                        local_mem_rd_wr_cntr                            <= 0;
                        rdy_out                                         <= '1';
                        local_memory_cntrl_state_machine                <= IDLE;
                    end if;
                when GATHER_LOCAL_WAIT =>
                    lmem_en                                             <= '0';
                    if (lmem_rd_wr_done_o = '1') then
                        lmem_rd_data(local_mem_rd_wr_cntr)(local_mem_regs_cntr) <= lmem_rd_data_o;
                        if (local_mem_regs_cntr < lmem_regs) then
                            addr_inc                                    <= addr_inc + x"4";
                            local_mem_regs_cntr                         <= local_mem_regs_cntr + 1;
                        else
                            addr_inc                                    <= (others => '0');
                            local_mem_regs_cntr                         <= 0;
                            local_mem_rd_wr_cntr                        <= local_mem_rd_wr_cntr + 1;
                        end if;
                        local_memory_cntrl_state_machine                <= GATHER_LOCAL_MEM;
                    end if;
                when WRITE_LOCAL_MEM =>
                    if (local_mem_rd_wr_cntr < CORES) then
                        lmem_wr_data_i                                  <= data_i(local_mem_rd_wr_cntr)(0);
                        lmem_addr_i                                     <= std_logic_vector (resize(unsigned(local_addr(0) + addr_inc + const_addr_inc), 16));
                        lmem_wr_en_i                                    <= '1';
                        lmem_en                                         <= '1';
                        local_memory_cntrl_state_machine                <= WRITE_LOCAL_WAIT;
                    else
                        lmem_en                                         <= '0';
                        lmem_wr_data_i                                  <= (others => '0');
                        lmem_wr_en_i                                    <= '0';
                        local_mem_rd_wr_cntr                            <= 0;
                        rdy_out                                         <= '1';
                        local_memory_cntrl_state_machine                <= IDLE;
                    end if;
                when WRITE_LOCAL_WAIT =>
                    lmem_en                                             <= '0';
                    lmem_wr_en_i                                        <= '0';
                    if (lmem_rd_wr_done_o = '1') then
                        local_mem_rd_wr_cntr                            <= local_mem_rd_wr_cntr + 1;
                        local_memory_cntrl_state_machine                <= WRITE_LOCAL_MEM;
                    end if;
                when SCATTER_LOCAL_MEM =>
                    if (local_mem_rd_wr_cntr < CORES) then
                        if (mask_in(local_mem_rd_wr_cntr) = '1') then
                            lmem_wr_data_i                              <= data_i(local_mem_rd_wr_cntr)(local_mem_regs_cntr);
                            lmem_addr_i                                 <= std_logic_vector ( resize ( unsigned(local_addr(local_mem_rd_wr_cntr) + addr_inc), 16) );
                            lmem_size_i                                 <= lmem_size;
                            lmem_wr_en_i                                <= '1';
                            lmem_en                                     <= '1';
                            local_memory_cntrl_state_machine            <= SCATTER_LOCAL_WAIT;
                        else
                            lmem_en                                     <= '0';
                            lmem_wr_data_i                              <= (others => '0');
                            lmem_wr_en_i                                <= '0';
                            local_mem_rd_wr_cntr                        <= local_mem_rd_wr_cntr + 1;
                        end if;
                    else
                        lmem_en                                         <= '0';
                        lmem_wr_data_i                                  <= (others => '0');
                        lmem_wr_en_i                                    <= '0';
                        local_mem_rd_wr_cntr                            <= 0;
                        rdy_out                                         <= '1';
                        local_memory_cntrl_state_machine                <= IDLE;
                    end if;
                when SCATTER_LOCAL_WAIT =>
                    lmem_en                                             <= '0';
                    if (lmem_rd_wr_done_o = '1') then
                        if (local_mem_regs_cntr < lmem_regs) then
                            addr_inc                                    <= addr_inc + x"4";
                            local_mem_regs_cntr                         <= local_mem_regs_cntr + 1;
                        else
                            addr_inc                                    <= (others => '0');
                            local_mem_regs_cntr                         <= 0;
                            local_mem_rd_wr_cntr                        <= local_mem_rd_wr_cntr + 1;
                        end if;
                        local_memory_cntrl_state_machine                <= SCATTER_LOCAL_MEM;
                    end if;
                when CALC_EFFECTIVE_ADDR =>
                    effective_addr_en                                   <= '0';
                    if (effective_addr_rdy_o = '1') then
                        addr                                            <= addr_o;
                        local_memory_cntrl_state_machine                <= CALC_LOCAL_ADDR;
                    end if;
                when CALC_LOCAL_ADDR =>
                    if (local_addr_cntr < local_addr_latency) then
                        local_addr_cntr                                 <= local_addr_cntr + 1;
                    else
                        local_addr_cntr                                 <= 0;
                        local_addr                                      <= local_addr_o;
                        local_memory_cntrl_state_machine                <= next_read_write_state;
                    end if;
                when others =>
                    local_memory_cntrl_state_machine                    <= IDLE;
            end case;
        end if;
    end process;
    
    const_addr_inc  <= (31 downto 14=> '0') & (warp_lane_id_in * (std_logic_vector(to_unsigned(CORES, 4)) * x"04"));
    
    pShiftAmount : process(data_type_in)
    begin
        case data_type_in is
            when DT_U16 =>
                shift_i             <= "00001";
            when DT_S16 =>
                shift_i             <= "00001";
            when DT_U32 =>
                shift_i             <= "00010";
            when DT_S32 =>
                shift_i             <= "00010";
            when DT_U64 =>
                shift_i             <= "00011";
            when DT_U128 =>
                shift_i             <= "00100";
            when others =>
                shift_i             <= "00000";
        end case;
    end process;
    
    pMemorySize : process(data_type_in)
    begin
        case data_type_in is
            when DT_U8 =>
                lmem_size           <= "001";
            when DT_S8 =>
                lmem_size           <= "010";
            when DT_U16 =>
                lmem_size           <= "010";
            when DT_S16 =>
                lmem_size           <= "010";
            when DT_U32 =>
                lmem_size           <= "100";
            when DT_S32 =>
                lmem_size           <= "100";
            when DT_U64 =>
                lmem_size           <= "100";
            when DT_U128 =>
                lmem_size           <= "100";
            when others =>
                lmem_size           <= "001";
        end case;
    end process;
    
    pMemoryRegisters : process(data_type_in)
    begin
        case data_type_in is
            when DT_U8 =>
                lmem_regs           <= 1;
            when DT_S8 =>
                lmem_regs           <= 1;
            when DT_U16 =>
                lmem_regs           <= 1;
            when DT_S16 =>
                lmem_regs           <= 1;
            when DT_U32 =>
                lmem_regs           <= 1;
            when DT_S32 =>
                lmem_regs           <= 1;
            when DT_U64 =>
                lmem_regs           <= 2;
            when DT_U128 =>
                lmem_regs           <= 4;
            when others =>
                lmem_regs           <= 1;
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
            
            addr_out                    => addr_o,
            rdy_out		                => effective_addr_rdy_o
        );

    uLocalAddress : local_address
        port map (
            ce_1                        => '1',
            clk_1                       => clk_in,
            addr_0i                     => addr(0),
            addr_1i                     => addr(1),
            addr_2i                     => addr(2),
            addr_3i                     => addr(3),
            addr_4i                     => addr(4),
            addr_5i                     => addr(5),
            addr_6i                     => addr(6),
            addr_7i                     => addr(7),
            core_count                  => CORE_COUNT,
            core_id                     => core_id_in,
            num_warps                   => num_warps_in,
            warp_id                     => warp_id_in,
            warp_lane_id                => warp_lane_id_in,
            warp_size                   => WARP_SIZE,
            local_addr_0i               => local_addr_o(0),
            local_addr_1i               => local_addr_o(1),
            local_addr_2i               => local_addr_o(2),
            local_addr_3i               => local_addr_o(3),
            local_addr_4i               => local_addr_o(4),
            local_addr_5i               => local_addr_o(5),
            local_addr_6i               => local_addr_o(6),
            local_addr_7i               => local_addr_o(7)
        );
    
    uMemoryController : memory_controller
        generic map (
            ADDRESS_SIZE            =>  ADDRESS_SIZE
        )
        port map (
            reset                   =>  reset,
            clk_in                  =>  clk_in,
            en                      =>  lmem_en,
            
            mem_addr_in             =>  lmem_addr_i,
            mem_size_in             =>  lmem_size_i,
            mem_wr_data_in          =>  lmem_wr_data_i,
            mem_wr_en_in            =>  lmem_wr_en_i,
            
            mem_addr_out            =>  lmem_addr_out,
            mem_wr_en_out           =>  lmem_wr_en_out,
            mem_wr_data_out         =>  lmem_wr_data_out,
            mem_rd_data_in          =>  lmem_rd_data_in,
            
            mem_rd_data_out         =>  lmem_rd_data_o,
            mem_rd_wr_done          =>  lmem_rd_wr_done_o
        );
        
end arch;

