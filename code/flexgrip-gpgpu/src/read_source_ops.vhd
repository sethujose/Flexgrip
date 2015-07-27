----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      read_source_ops - arch 
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

library calculate_address_lib;

use work.gpgpu_package.all;

    entity read_source_ops is
        generic (
            SRC_NUM                             : integer range 1 to 3 := 1
        );
        port (
            reset                               : in  std_logic;
            clk_in                              : in  std_logic;
            
            en                                  : in  std_logic;
            
            instr_opcode_type_in                : in  instr_opcode_type;
            alu_opcode_in               		: in  alu_opcode_type;
            instr_marker_type_in                : in  instr_marker_type;
            
            addr_in                             : in  std_logic_vector(31 downto 0);
            mask_in                             : in  std_logic_vector(CORES-1 downto 0);
            addr_reg_in                         : in  std_logic_vector(2 downto 0);
            addr_imm_in                         : in  std_logic;
            pred_reg_in                         : in  std_logic_vector(1 downto 0);
            mov_size_in                         : in  std_logic_vector(2 downto 0);
            sm_type_in                          : in  std_logic_vector(1 downto 0);
            mem_type_in                         : in  std_logic_vector(2 downto 0);
            const_segment_in                    : in  std_logic_vector(6 downto 0);
            imm_hi_in                           : in  std_logic_vector(25 downto 0);
            
            src_mem_type_in                     : in  mem_type;
            src_data_type_in                    : in  data_type;
            src_mem_opcode_type_in              : in  mem_opcode_type;
            dest_mem_type_in            		: in  mem_type;
            
            gprs_req_out                        : out std_logic;
            gprs_ack_out                        : out std_logic;
            gprs_grant_in                       : in  std_logic;
            
            addr_regs_req_out                   : out std_logic;
            addr_regs_ack_out                   : out std_logic;
            addr_regs_grant_in                  : in  std_logic;
            
            pred_regs_req_out                   : out std_logic;
            pred_regs_ack_out                   : out std_logic;
            pred_regs_grant_in                  : in  std_logic;
            
            shmem_req_out                       : out std_logic;
            shmem_ack_out                       : out std_logic;
            shmem_grant_in                      : in  std_logic;
            
            cmem_req_out                        : out std_logic;
            cmem_ack_out                        : out std_logic;
            cmem_grant_in                       : in  std_logic;
            
            gmem_req_out                        : out std_logic;
            gmem_ack_out                        : out std_logic;
            gmem_grant_in                       : in  std_logic;
            
            lmem_req_out                        : out std_logic;
            lmem_ack_out                        : out std_logic;
            lmem_grant_in                       : in  std_logic;
            
            effaddr_gprs_req_out                : out std_logic;
            effaddr_gprs_ack_out                : out std_logic;
            effaddr_gprs_grant_in               : in  std_logic;
            
            effaddr_addr_regs_req_out           : out std_logic;
            effaddr_addr_regs_ack_out           : out std_logic;
            effaddr_addr_regs_grant_in          : in  std_logic;
            
            gprs_en_out                         : out std_logic;
            gprs_reg_num_out                    : out std_logic_vector(8 downto 0);
            gprs_rd_wr_en_out                   : out std_logic;
            gprs_wr_data_out                    : out vector_word_register_array;
            gprs_data_type_out                  : out data_type;
            gprs_mask_out                       : out std_logic_vector(CORES-1 downto 0);
            gprs_rd_data_in                     : in  vector_word_register_array;
            gprs_rdy_in                         : in  std_logic;
            
            addr_regs_en_out                    : out std_logic;
            addr_regs_reg_num_out               : out std_logic_vector(1 downto 0);
            addr_regs_rd_wr_en_out              : out std_logic;
            addr_regs_wr_data_out               : out vector_register;
            addr_regs_rd_data_in                : in  vector_register;
            addr_regs_rdy_in                    : in  std_logic;
            
            pred_regs_en_out                    : out std_logic;
            pred_regs_reg_num_out               : out std_logic_vector(1 downto 0);
            pred_regs_rd_wr_en_out              : out std_logic;
            pred_regs_wr_data_out               : out vector_flag_register;
            pred_regs_rd_data_in                : in  vector_flag_register;
            pred_regs_rdy_in                    : in  std_logic;
            
            shmem_en_out                        : out std_logic;
            shmem_addr_out                      : out std_logic_vector(31 downto 0);
            shmem_rd_wr_type_out                : out mem_opcode_type;
            shmem_sm_type_out                   : out sm_type;
            shmem_mask_out                      : out std_logic_vector(CORES-1 downto 0);
            shmem_rd_data_in			       	: in  vector_word_register_array;
            shmem_rdy_in                        : in  std_logic;
            
            cmem_en_out                         : out std_logic;
            cmem_addr_out                       : out std_logic_vector(31 downto 0);
            cmem_rd_wr_type_out                 : out mem_opcode_type;
            cmem_sm_type_out                    : out sm_type;
            cmem_segment_out                    : out std_logic_vector(6 downto 0);
            cmem_mask_out                       : out std_logic_vector(CORES-1 downto 0);
            cmem_rd_data_in			            : in  vector_word_register_array;
            cmem_rdy_in                         : in  std_logic;
            
            gmem_en_out                         : out std_logic;
            gmem_addr_out                       : out std_logic_vector(31 downto 0);
            gmem_rd_wr_type_out                 : out mem_opcode_type;
            gmem_data_type_out                  : out data_type;
            gmem_mask_out                       : out std_logic_vector(CORES-1 downto 0);
            gmem_rd_data_in			            : in  vector_word_register_array;
            gmem_rdy_in                         : in  std_logic;
            
            lmem_en_out                         : out std_logic;
            lmem_addr_out                       : out std_logic_vector(31 downto 0);
            lmem_rd_wr_type_out                 : out mem_opcode_type;
            lmem_data_type_out                  : out data_type;
            lmem_mask_out                       : out std_logic_vector(CORES-1 downto 0);
            lmem_rd_data_in			            : in  vector_word_register_array;
            lmem_rdy_in                         : in  std_logic;
            
            effaddr_gprs_en_out                 : out std_logic;
            effaddr_gprs_reg_num_out            : out std_logic_vector(8 downto 0);
            effaddr_gprs_data_type_out          : out data_type;
            effaddr_gprs_mask_out               : out std_logic_vector(CORES-1 downto 0);
            effaddr_gprs_rd_wr_en_out           : out std_logic;
            effaddr_gprs_rd_data_in             : in  vector_word_register_array;
            effaddr_gprs_rdy_in                 : in  std_logic;
            
            effaddr_addr_regs_en_out            : out std_logic;
            effaddr_addr_regs_reg_out           : out std_logic_vector(1 downto 0);
            effaddr_addr_regs_mask_out          : out std_logic_vector(CORES-1 downto 0);
            effaddr_addr_regs_rd_wr_en_out      : out std_logic;
            effaddr_addr_regs_rd_data_in        : in  vector_register;
            effaddr_addr_regs_rdy_in            : in  std_logic;
            
            data_out                            : out vector_word_register_array;
            rdy_out                             : out std_logic
        );
    end read_source_ops;

architecture arch of read_source_ops is
    
    component convert_data_types
        port (
            mov_size_in                 : in  std_logic_vector(2 downto 0);
            conv_type_in                : in  conv_type;
            reg_type_in                 : in  reg_type;
            data_type_in                : in  data_type;
            sm_type_in                  : in  std_logic_vector(1 downto 0);
            mem_type_in                 : in  std_logic_vector(2 downto 0);
            
            mv_size_to_sm_type_out      : out sm_type;
            data_type_to_sm_type_out    : out sm_type;
            sm_type_to_sm_type_out      : out sm_type;
            mem_type_to_sm_type_out     : out sm_type;
            conv_type_to_reg_type_out   : out reg_type;
            reg_type_to_data_type_out   : out data_type;
            mv_size_to_data_type_out    : out data_type;
            conv_type_to_data_type_out  : out data_type;
            sm_type_to_data_type_out    : out data_type;
            mem_type_to_data_type_out   : out data_type;
            sm_type_to_cvt_type_out     : out conv_type;
            mem_type_to_cvt_type_out    : out conv_type
        );
    end component;
    
    component effective_address
        generic (
         --   ARB_GRPS_EN                 : std_logic := '0';
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
    
    component calculate_address  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic; 
            address_in                  : in std_logic_vector(31 downto 0); 
            data_type_in                : in std_logic_vector(3 downto 0); 
            address_out                 : out std_logic_vector(31 downto 0)
        );
    end component;
    
    type read_source_ops_state_type is (IDLE, GPRS_REQUEST, READ_GPRS, SHMEM_REQUEST, READ_SHMEM, CMEM_REQUEST, READ_CMEM, GMEM_REQUEST, READ_GMEM, LMEM_REQUEST, READ_LMEM, READ_EFFADDR, ADDR_REGS_REQUEST, READ_ADDR_REGS, PRED_REGS_REQUEST, READ_PRED_REGS, DONE);
    signal read_source_ops_state_machine        : read_source_ops_state_type;
    signal read_source_ops_state_machine_cs     : std_logic_vector(3 downto 0);
    
    signal en_reg                               : std_logic;
    signal data_o                               : vector_word_register_array;
    signal addr_i                               : std_logic_vector(31 downto 0);
    signal addr_int                             : std_logic_vector(31 downto 0);
    signal imm_hi_shift                         : std_logic_vector(31 downto 0);
    signal imm_addr_int                         : std_logic_vector(31 downto 0);
    signal mask_i                               : std_logic_vector(CORES-1 downto 0);
    signal addr_reg_i                           : std_logic_vector(2 downto 0);
    signal addr_reg_num_i                       : std_logic_vector(2 downto 0);
    signal shift_i                              : std_logic_vector(4 downto 0);
    signal addr_imm_i                           : std_logic;
    signal pred_reg_i                           : std_logic_vector(1 downto 0);
    signal sm_type_i                            : std_logic_vector(1 downto 0);
    signal mem_type_i                           : std_logic_vector(2 downto 0);
    signal const_segment_i                      : std_logic_vector(6 downto 0);
    signal segment_int                          : std_logic_vector(6 downto 0);
    signal sm_type_int                          : sm_type;
    signal data_type_int                        : data_type;
    signal mov_size_i                           : std_logic_vector(2 downto 0);
    signal data_type_to_sm_type_o               : sm_type;
    signal sm_type_to_sm_type_o                 : sm_type;
    signal mem_type_to_sm_type_o                : sm_type;
    signal mv_size_to_data_type_o               : data_type;
    signal src_data_type_i                      : data_type;
    signal src_mem_opcode_type_i                : mem_opcode_type;
    signal dest_mem_type_i                      : mem_type;
    
    signal effaddr_en_i                         : std_logic;
    signal effaddr_rdy_o                        : std_logic;
    signal effaddr_addr_o                       : vector_register;
    signal calc_data_type_i                     : std_logic_vector(3 downto 0);
    signal calc_addr_o                          : std_logic_vector(31 downto 0);
    
begin
    
    imm_hi_shift        <= (to_stdlogicvector(to_bitvector(imm_hi_in) & "000000"));
    imm_addr_int        <= imm_hi_shift or addr_in;
    
    pReadSourceOps : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (reset = '1') then
                gprs_en_out                                         <= '0';
                gprs_req_out                                        <= '0';
                gprs_ack_out                                        <= '0';
                shmem_en_out                                        <= '0';
                shmem_req_out                                       <= '0';
                shmem_ack_out                                       <= '0';
                cmem_en_out                                         <= '0';
                cmem_req_out                                        <= '0';
                cmem_ack_out                                        <= '0';
                gmem_en_out                                         <= '0';
                gmem_req_out                                        <= '0';
                gmem_ack_out                                        <= '0';
                lmem_en_out                                         <= '0';
                lmem_req_out                                        <= '0';
                lmem_ack_out                                        <= '0';
                addr_regs_req_out                                   <= '0';
                addr_regs_ack_out                                   <= '0';
                pred_regs_req_out                                   <= '0';
                pred_regs_ack_out                                   <= '0';
                en_reg                                              <= '0';
                rdy_out                                             <= '0';
                read_source_ops_state_machine                       <= IDLE;
            else
                case read_source_ops_state_machine is 
                    when IDLE =>
                        gprs_en_out                                 <= '0';
                        gprs_req_out                                <= '0';
                        gprs_ack_out                                <= '0';
                        shmem_en_out                                <= '0';
                        shmem_req_out                               <= '0';
                        shmem_ack_out                               <= '0';
                        cmem_en_out                                 <= '0';
                        cmem_req_out                                <= '0';
                        cmem_ack_out                                <= '0';
                        gmem_en_out                                 <= '0';
                        gmem_req_out                                <= '0';
                        gmem_ack_out                                <= '0';
                        lmem_en_out                                 <= '0';
                        lmem_req_out                                <= '0';
                        lmem_ack_out                                <= '0';
                        addr_regs_req_out                           <= '0';
                        addr_regs_ack_out                           <= '0';
                        pred_regs_req_out                           <= '0';
                        pred_regs_ack_out                           <= '0';
                        addr_i                                      <= addr_in;
                        mask_i                                      <= mask_in;
                        addr_reg_i                                  <= addr_reg_in;
                        addr_reg_num_i                              <= addr_reg_in - "01"; -- addr_reg_in is from 1-4, we address 0-3
                        addr_imm_i                                  <= addr_imm_in;
                        pred_reg_i                                  <= pred_reg_in;
                        sm_type_i                                   <= sm_type_in;
                        mem_type_i                                  <= mem_type_in;
                        mov_size_i                                  <= mov_size_in;
                        const_segment_i                             <= const_segment_in;
                        src_data_type_i                             <= src_data_type_in;
                        src_mem_opcode_type_i                       <= src_mem_opcode_type_in;
                        dest_mem_type_i                        		<= dest_mem_type_in;
                        rdy_out                                     <= '0';
                        addr_regs_en_out							<= '0';
                        pred_regs_en_out							<= '0';
                        en_reg                                      <= en;
                              
                        if ((en_reg = '0') and (en = '1')) then
                            if (((src_mem_type_in = UNKNOWN) or (src_data_type_in = DT_NONE)) and ((SRC_NUM/=2) or (addr_imm_i='0' and (dest_mem_type_i /= ADDRESS)))) then   --MM:ADDED src_type_condition to go 
                                read_source_ops_state_machine       <= DONE;														 																	  --to the else state when src2=imm
                            else
                                if (src_mem_type_in = REG) then
                                    --if ((SRC_NUM = 2) and (instr_marker_type_in = IMM)) then
                                    if ((SRC_NUM = 2) and ((addr_imm_i = '1' and alu_opcode_in /= SET and addr_reg_in= "000") or (dest_mem_type_i = ADDRESS) or (instr_marker_type_in = IMM))) then    --MM: MODIFIED TO DETECT IMMEDIATE INSTRUCTION   
                                        for i in 0 to CORES-1 loop
                                            data_o(i)(0)            <= addr_in;
                                        end loop;
                                        read_source_ops_state_machine <= DONE;  -- MODIFIED TO - DONE
                                    elsif (SRC_NUM = 2 and (instr_marker_type_in = IMM)) then
                                        for i in 0 to CORES-1 loop
                                            data_o(i)(0)            <= imm_addr_int;
                                        end loop;
                                        read_source_ops_state_machine <= DONE;  -- MODIFIED TO - DONE
                                    else
                                        gprs_req_out                <= '1';
                                        read_source_ops_state_machine <= GPRS_REQUEST;
                                    end if;
                                elsif (src_mem_type_in = MEM_SHARED) then
                                    shmem_req_out                   <= '1';
                                    read_source_ops_state_machine   <= SHMEM_REQUEST;
                                elsif (src_mem_type_in = MEM_CONST) then
                                    cmem_req_out                    <= '1';
                                    read_source_ops_state_machine   <= CMEM_REQUEST;
                                elsif (src_mem_type_in = MEM_GLOBAL) then
                                    gmem_req_out                    <= '1';
                                    read_source_ops_state_machine   <= GMEM_REQUEST;
                                elsif (src_mem_type_in = MEM_LOCAL) then
                                    lmem_req_out                    <= '1';
                                    read_source_ops_state_machine   <= LMEM_REQUEST;
                                elsif (src_mem_type_in = ADDRESS_ADDRESS) then
                                    effaddr_en_i                    <= '1';
                                    shift_i                         <= "00000";
                                    read_source_ops_state_machine   <= READ_EFFADDR;
                                elsif (src_mem_type_in = ADDRESS) then
                                    addr_regs_req_out               <= '1';
                                    read_source_ops_state_machine   <= ADDR_REGS_REQUEST;
                                elsif (src_mem_type_in = FLAGS) then
                                    pred_regs_req_out               <= '1';
                                    read_source_ops_state_machine   <= PRED_REGS_REQUEST;
                                else
                                    read_source_ops_state_machine   <= DONE;
                                end if;
                            end if;
                        end if;
                    when GPRS_REQUEST =>
                        if (gprs_grant_in = '1') then
                            gprs_req_out                            <= '0';
                            gprs_en_out                             <= '1';
                            gprs_reg_num_out                        <= addr_int(8 downto 0);
                            gprs_rd_wr_en_out                       <= '0';
                            gprs_wr_data_out                        <= (others => (others => (others => '0')));
                            gprs_data_type_out                      <= src_data_type_i;
                            gprs_mask_out                           <= mask_i;
                            read_source_ops_state_machine           <= READ_GPRS;
                        end if;
                    when READ_GPRS =>
                        gprs_en_out                                 <= '0';
                        if (gprs_rdy_in = '1') then
                            gprs_ack_out                            <= '1';
                            data_o                                  <= gprs_rd_data_in;
                            read_source_ops_state_machine           <= DONE;
                        end if;
                    when SHMEM_REQUEST =>
                        if (shmem_grant_in = '1') then
                            shmem_req_out                           <= '0';
                            shmem_en_out                            <= '1';
                            shmem_addr_out                          <= addr_int;
                            shmem_rd_wr_type_out                    <= src_mem_opcode_type_i;
                            shmem_sm_type_out                       <= sm_type_int;
                            shmem_mask_out                          <= mask_i;
                            read_source_ops_state_machine           <= READ_SHMEM;
                        end if;
                    when READ_SHMEM =>
                        shmem_en_out                                <= '0';
                        if (shmem_rdy_in = '1') then
                            shmem_ack_out                           <= '1';
                            data_o                                  <= shmem_rd_data_in;
                            read_source_ops_state_machine           <= DONE;
                        end if;
                    when CMEM_REQUEST =>
                        if (cmem_grant_in = '1') then
                            cmem_req_out                            <= '0';
                            cmem_en_out                             <= '1';
                            cmem_addr_out                           <= addr_int;
                            cmem_rd_wr_type_out                     <= src_mem_opcode_type_i;
                            cmem_sm_type_out                        <= sm_type_int;
                            cmem_mask_out                           <= mask_i;
                            cmem_segment_out                        <= segment_int;
                            read_source_ops_state_machine           <= READ_CMEM;
                        end if;
                    when READ_CMEM =>
                        cmem_en_out                                 <= '0';
                        if (cmem_rdy_in = '1') then
                            cmem_ack_out                            <= '1';
                            data_o                                  <= cmem_rd_data_in;
                            read_source_ops_state_machine           <= DONE;
                        end if;
                    when GMEM_REQUEST =>
                        if (gmem_grant_in = '1') then
                            gmem_req_out                            <= '0';
                            gmem_en_out                             <= '1';
                            gmem_addr_out                           <= addr_int;
                            gmem_rd_wr_type_out                     <= src_mem_opcode_type_i;
                            gmem_data_type_out                      <= data_type_int;
                            gmem_mask_out                           <= mask_i;
                            read_source_ops_state_machine           <= READ_GMEM;
                        end if;
                    when READ_GMEM =>
                        gmem_en_out                                 <= '0';
                        if (gmem_rdy_in = '1') then
                            gmem_ack_out                            <= '1';
                            data_o                                  <= gmem_rd_data_in;
                            read_source_ops_state_machine           <= DONE;
                        end if;
                    when LMEM_REQUEST =>
                        if (lmem_grant_in = '1') then
                            lmem_req_out                            <= '0';
                            lmem_en_out                             <= '1';
                            lmem_addr_out                           <= addr_int;
                            lmem_rd_wr_type_out                     <= src_mem_opcode_type_i;
                            lmem_data_type_out                      <= data_type_int;
                            lmem_mask_out                           <= mask_i;
                            read_source_ops_state_machine           <= READ_LMEM;
                        end if;
                    when READ_LMEM =>
                        lmem_en_out                                 <= '0';
                        if (lmem_rdy_in = '1') then
                            lmem_ack_out                            <= '1';
                            data_o                                  <= lmem_rd_data_in;
                            read_source_ops_state_machine           <= DONE;
                        end if;
                    when READ_EFFADDR =>
                        effaddr_en_i                                <= '0';
                        if (effaddr_rdy_o = '1') then
                            for i in 0 to CORES-1 loop
                                data_o(i)(0)                        <= effaddr_addr_o(i);
                            end loop;
                            read_source_ops_state_machine           <= DONE;
                        end if;
                    when ADDR_REGS_REQUEST =>
                        if (addr_regs_grant_in = '1') then
                            addr_regs_req_out                       <= '0';
                            addr_regs_en_out                        <= '1';
                            addr_regs_reg_num_out                   <= addr_reg_num_i(1 downto 0);
                            addr_regs_rd_wr_en_out                  <= '0';
                            addr_regs_wr_data_out                   <= (others => (others => '0'));
                            read_source_ops_state_machine           <= READ_ADDR_REGS;
                        end if;
                    when READ_ADDR_REGS =>
                        addr_regs_en_out                            <= '0';
                        if (addr_regs_rdy_in = '1') then
                            addr_regs_ack_out                       <= '1';
                            for i in 0 to CORES-1 loop
                                data_o(i)(0)                        <= addr_regs_rd_data_in(i);
                            end loop;
                            read_source_ops_state_machine           <= DONE;
                        end if;
                    when PRED_REGS_REQUEST =>
                        if (pred_regs_grant_in = '1') then
                            pred_regs_req_out                       <= '0';
                            pred_regs_en_out                        <= '1';
                            pred_regs_reg_num_out                   <= pred_reg_i;
                            pred_regs_rd_wr_en_out                  <= '0';
                            pred_regs_wr_data_out                   <= (others => (others => '0'));
                            read_source_ops_state_machine           <= READ_PRED_REGS;
                        end if;
                    when READ_PRED_REGS =>
                        pred_regs_en_out                            <= '0';
                        if (pred_regs_rdy_in = '1') then
                            pred_regs_ack_out                       <= '1';
                            for i in 0 to CORES-1 loop
                                data_o(i)(0)                        <= x"0000000" & pred_regs_rd_data_in(i);
                            end loop;
                            read_source_ops_state_machine           <= DONE;
                        end if;
                    when DONE =>
                        gprs_ack_out                                <= '0';
                        shmem_ack_out                               <= '0';
                        cmem_ack_out                                <= '0';
                        gmem_ack_out                                <= '0';
                        lmem_ack_out                                <= '0';
                        addr_regs_ack_out                           <= '0';
                        pred_regs_ack_out                           <= '0';
                        rdy_out                                     <= '1';
                        data_out                                    <= data_o;
                        read_source_ops_state_machine               <= IDLE;
                    when others =>
                        read_source_ops_state_machine               <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
    uConvertDataTypes : convert_data_types
        port map (
            mov_size_in                         => mov_size_i,
            conv_type_in                        => CT_NONE,
            reg_type_in                         => RT_NONE,
            data_type_in                        => src_data_type_in,
            sm_type_in                          => sm_type_i,
            mem_type_in                         => mem_type_i,
            
            mv_size_to_sm_type_out              => open,
            data_type_to_sm_type_out            => data_type_to_sm_type_o,
            sm_type_to_sm_type_out              => sm_type_to_sm_type_o,
            mem_type_to_sm_type_out             => mem_type_to_sm_type_o,
            conv_type_to_reg_type_out           => open,
            reg_type_to_data_type_out           => open,
            mv_size_to_data_type_out            => mv_size_to_data_type_o,
            conv_type_to_data_type_out          => open,
            sm_type_to_data_type_out            => open,
            mem_type_to_data_type_out           => open,
            sm_type_to_cvt_type_out             => open,
            mem_type_to_cvt_type_out            => open
        );
   
    sm_type_int       <= 
        sm_type_to_sm_type_o    when ((instr_opcode_type_in = ALU) and (src_mem_type_in = MEM_SHARED)) else
        sm_type_to_sm_type_o    when ((instr_opcode_type_in = MOV) and (src_mem_type_in = MEM_SHARED)) else
        data_type_to_sm_type_o  when ((instr_opcode_type_in = ALU) and (src_mem_type_in = MEM_CONST)) else
        mem_type_to_sm_type_o;
    
    data_type_int     <=        src_data_type_i when (instr_opcode_type_in = ALU) else mv_size_to_data_type_o;
    
    addr_int  <=
        calc_addr_o             when ((instr_opcode_type_in = ALU) and (src_mem_type_in = MEM_CONST) and (src_mem_opcode_type_in = READ)) else
        addr_i;
    
    segment_int <=
        "00000" & const_segment_in(1 downto 0)  when ((instr_opcode_type_in = ALU) and (SRC_NUM = 2)) else
        "000" & const_segment_in(3 downto 0)    when ((instr_opcode_type_in = ALU) and (SRC_NUM = 3)) else
        const_segment_in;
        
    uEffectiveAddress : effective_address
        generic map (
         --   ARB_GRPS_EN                 => '1',
            ARB_ADDR_REGS_EN            => '1'
        )
        port map (
			reset                       => reset,
			clk_in                      => clk_in,
			en						    => effaddr_en_i,
            
            reg_in                      => addr_i,
            addr_reg_in                 => addr_reg_i,
            addr_imm_in                 => addr_imm_i,
            shift_in                    => shift_i,
            
            gprs_req_out                => effaddr_gprs_req_out,
            gprs_ack_out                => effaddr_gprs_ack_out,
            gprs_grant_in               => effaddr_gprs_grant_in,
            
            gprs_en_out                 => effaddr_gprs_en_out,
            gprs_reg_num_out            => effaddr_gprs_reg_num_out,
            gprs_data_type_out          => effaddr_gprs_data_type_out,
            gprs_mask_out               => effaddr_gprs_mask_out,
            gprs_rd_wr_en_out           => effaddr_gprs_rd_wr_en_out,
            gprs_rd_data_in             => effaddr_gprs_rd_data_in,
            gprs_rdy_in                 => effaddr_gprs_rdy_in,
            
            addr_regs_req_out           => effaddr_addr_regs_req_out,
            addr_regs_ack_out           => effaddr_addr_regs_ack_out,
            addr_regs_grant_in          => effaddr_addr_regs_grant_in,
            
            addr_regs_en_out            => effaddr_addr_regs_en_out,
            addr_regs_reg_out           => effaddr_addr_regs_reg_out,
            addr_regs_mask_out          => effaddr_addr_regs_mask_out,
            addr_regs_rd_wr_en_out      => effaddr_addr_regs_rd_wr_en_out,
            addr_regs_rd_data_in        => effaddr_addr_regs_rd_data_in,
            addr_regs_rdy_in            => effaddr_addr_regs_rdy_in,
            
            addr_out                    => effaddr_addr_o,
            rdy_out		                => effaddr_rdy_o
        );
    
    calc_data_type_i    <= encode_data_type(data_type_int);
    
    uCalculateSourceAddress : calculate_address
        port map (
            ce_1                        => '1',
            clk_1                       => clk_in,
            address_in                  => addr_i,
            data_type_in                => calc_data_type_i,
            address_out                 => calc_addr_o
        );
        
end arch;

