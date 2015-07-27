----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      warp_checker - arch 
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
use IEEE.std_logic_unsigned.all;  
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity branch_exec_unit is
        port (
            clk_in                      : in  std_logic;
			host_reset                  : in  std_logic;
            
            branch_exec_en              : in std_logic;
            
            flow_opcode_type_in         : in  flow_opcode_type;
            
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            initial_mask_in             : in  std_logic_vector(31 downto 0);
            current_mask_in             : in  std_logic_vector(31 downto 0);
            instr_mask_in               : in  std_logic_vector(31 downto 0);
            next_pc_in                  : in  std_logic_vector(31 downto 0);
            target_address_in           : in  std_logic_vector(18 downto 0);
            
            warp_div_req_out            : out std_logic;
            warp_div_ack_out            : out std_logic;
            warp_div_grant_in           : in  std_logic;
            
            warp_div_stack_en_out       : out warp_div_std_logic_array;
            warp_div_wr_data_out        : out warp_div_data_array;
            warp_div_rd_data_in         : in  warp_div_data_array;
            warp_div_push_en_out        : out warp_div_std_logic_array;
            warp_div_stack_full_in      : in  warp_div_std_logic_array;
            warp_div_stack_empty_in     : in  warp_div_std_logic_array;
            
            initial_mask_out            : out std_logic_vector(31 downto 0);
            current_mask_out            : out std_logic_vector(31 downto 0);
            instr_mask_out              : out std_logic_vector(31 downto 0);
            next_pc_out                 : out std_logic_vector(31 downto 0);
            warp_state_out              : out warp_state_type;
            
            branch_exec_done            : out std_logic
        );
    end branch_exec_unit;

architecture arch of branch_exec_unit is
    
    type branch_state_type is (IDLE, CHECK_BRANCH, CHECK_CALL, CHECK_RETURN, CHECK_PREBREAK, CHECK_BREAK, CHECK_BAR, CHECK_JOIN, STACK_REQUEST, STACK_POP);
    signal branch_state_machine                     : branch_state_type;
    
    signal warp_id_addr                             : integer range 0 to MAX_WARPS;
    signal warp_div_push_en_i                       : std_logic;
    signal warp_div_wr_data_i                       : std_logic_vector(STACK_DATA_WIDTH-1 downto 0);
    signal branch_exec_en_reg                       : std_logic;
	 
	 type thread_mem is array(MAX_WARPS-1 downto 0) of std_logic_vector(31 downto 0);
	 signal finished_threads_mask 						 : thread_mem := (others => (others => '0'));
	 
	 signal return_thread_mask							    : std_logic_vector(31 downto 0);
    
begin
    
    pBranchStateMachine: process(clk_in)
	begin
		if (rising_edge(clk_in)) then
            if (host_reset = '1') then
                warp_id_addr                                        <= 0;
                warp_div_stack_en_out                               <= (others => '0');
                warp_div_wr_data_out                                <= (others => (others => '0'));
                warp_div_push_en_out                                <= (others => '0');
                warp_div_push_en_i                                  <= '0';
                warp_div_wr_data_i                                  <= (others => '0');
                warp_div_ack_out                                    <= '0';
                initial_mask_out                                    <= (others => '0');
                current_mask_out                                    <= (others => '0');
                instr_mask_out                                      <= (others => '0');
                next_pc_out                                         <= (others => '0');
                warp_state_out                                      <= ACTIVE;
                branch_exec_en_reg                                  <= '0';
                branch_exec_done                                    <= '0';
                warp_div_req_out 				                    <= '0';
                return_thread_mask 									<= (others => '0');
                branch_state_machine			                    <= IDLE;
            else
                case branch_state_machine is 
                    when IDLE =>
    --                    initial_mask_out                            <= initial_mask_in;
    --                    current_mask_out                            <= current_mask_in;
    --                    instr_mask_out                              <= instr_mask_in;
    --                    next_pc_out                                 <= next_pc_in;
    --                    warp_state_out                              <= ACTIVE;
                        warp_div_stack_en_out                       <= (others => '0');
                        warp_div_push_en_out                        <= (others => '0');
                        warp_div_push_en_i                          <= '0';
                        warp_div_wr_data_i                          <= (others => '0');
                        warp_id_addr                                <= conv_integer(warp_id_in);
                        warp_div_ack_out                            <= '0';
                        branch_exec_done                            <= '0';
                        warp_div_req_out                        	<= '0';
                        return_thread_mask 							<= (others => '0');
                        branch_exec_en_reg                          <= branch_exec_en;
                        if (branch_exec_en_reg = '0' and branch_exec_en = '1') then
                            if (flow_opcode_type_in = BRANCH) then
                                branch_state_machine                <= CHECK_BRANCH;
                            elsif (flow_opcode_type_in = CALL) then
                                branch_state_machine                <= CHECK_CALL;
                            elsif (flow_opcode_type_in = RET) then
                                return_thread_mask 					<= finished_threads_mask(warp_id_addr) or instr_mask_in;
                                branch_state_machine                <= CHECK_RETURN;
                            elsif (flow_opcode_type_in = PREBREAK) then
                                branch_state_machine                <= CHECK_PREBREAK;
                            elsif (flow_opcode_type_in = BREAK) then
                                branch_state_machine                <= CHECK_BREAK;
                            elsif (flow_opcode_type_in = BAR) then
                                branch_state_machine                <= CHECK_BAR;
                            elsif (flow_opcode_type_in = JOIN) then
                                branch_state_machine                <= CHECK_JOIN;
                            else
                                branch_state_machine                <=IDLE;
                            end if;
                        end if;
                    when CHECK_BRANCH =>
                        if (instr_mask_in = x"00000000") then
                            initial_mask_out                        <= initial_mask_in;
                            current_mask_out                        <= current_mask_in;
                            instr_mask_out                          <= instr_mask_in;
                            next_pc_out                             <= next_pc_in;
                            branch_exec_done                        <= '1';
                            branch_state_machine                    <= IDLE;
                        elsif (instr_mask_in = current_mask_in) then
                            initial_mask_out                        <= initial_mask_in;
                            current_mask_out                        <= current_mask_in;
                            instr_mask_out                          <= instr_mask_in;
                            next_pc_out                             <= x"000" & "0" & target_address_in;
                            branch_exec_done                        <= '1';
                            branch_state_machine                    <= IDLE;
                        else
                            initial_mask_out                        <= initial_mask_in;
                            current_mask_out                        <= instr_mask_in;
                            instr_mask_out                          <= instr_mask_in;
                            next_pc_out                             <= x"000" & "0" & target_address_in;
                            if (warp_lane_id_in = "00") then
                                warp_div_req_out                    <= '1';
                                warp_div_push_en_i                  <= '1';
    --                            warp_div_wr_data_i                  <= (current_mask_in and (not instr_mask_in)) & encode_warp_stack_token(ID_DIVERGE) & (x"000" & "0" & target_address_in);
                                warp_div_wr_data_i                  <= (current_mask_in and (not instr_mask_in)) & encode_warp_stack_token(ID_DIVERGE) & (x"000" & "0" & next_pc_in(18 downto 0));
                                branch_state_machine                <= STACK_REQUEST; 
                            else
                                branch_exec_done                    <= '1';
                                branch_state_machine                <= IDLE;
                            end if;
                        end if;
                        warp_state_out                              <= ACTIVE;
                    when CHECK_CALL =>
                        initial_mask_out                            <= initial_mask_in;
                        current_mask_out                            <= current_mask_in;
                        instr_mask_out                              <= instr_mask_in;
                        next_pc_out                                 <= x"000" & "0" & target_address_in;
                        if (warp_lane_id_in = "00") then  
                            warp_div_req_out                        <= '1';
                            warp_div_push_en_i                      <= '1';
                            warp_div_wr_data_i                      <= current_mask_in & encode_warp_stack_token(ID_CALL) & (x"000" & "0" & target_address_in);
                            branch_state_machine                    <= STACK_REQUEST;
                        else
                            branch_exec_done                        <= '1';
                            branch_state_machine                    <= IDLE;
                        end if;
                        warp_state_out                              <= ACTIVE;
                    when CHECK_RETURN =>
                        if (warp_div_stack_empty_in(warp_id_addr) = '1') then
                            initial_mask_out                        <= current_mask_in;
                            current_mask_out                        <= (current_mask_in and (not instr_mask_in));
                            instr_mask_out                          <= instr_mask_in;
                            next_pc_out                             <= next_pc_in;
    --                        if (current_mask_in = x"00000000") then
                            if (return_thread_mask = x"FFFFFFFF") then
                                -- Kill warp
                                warp_state_out                      <= FINISHED;
                            else
                                warp_state_out                      <= ACTIVE;
                                finished_threads_mask(warp_id_addr) <= return_thread_mask;
                            end if;
                            branch_exec_done                        <= '1';
                            branch_state_machine                    <= IDLE;
                        else
                            -- pop
                            warp_div_req_out                        <= '1';
                            warp_div_push_en_i                      <= '0';
                            warp_state_out                          <= ACTIVE;
                            branch_state_machine                    <= STACK_REQUEST;
                        end if;
                    when CHECK_PREBREAK =>
                        initial_mask_out                            <= initial_mask_in;
                        current_mask_out                            <= current_mask_in;
                        instr_mask_out                              <= instr_mask_in;
                        next_pc_out                                 <= next_pc_in;
                        if (warp_lane_id_in = "00") then      
                            warp_div_req_out                        <= '1';
                            warp_div_push_en_i                      <= '1';
                            warp_div_wr_data_i                      <= current_mask_in & encode_warp_stack_token(ID_BREAK) & (x"000" & "0" & target_address_in);
                            branch_state_machine                    <= STACK_REQUEST;
                        else
                            branch_exec_done                        <= '1';
                            branch_state_machine                    <= IDLE;
                        end if;
                        warp_state_out                              <= ACTIVE;
                    when CHECK_BREAK =>
                        if (warp_div_stack_empty_in(warp_id_addr) = '1') then
                            initial_mask_out                        <= current_mask_in;
                            current_mask_out                        <= (current_mask_in and (not instr_mask_in));
                            instr_mask_out                          <= instr_mask_in;
                            next_pc_out                             <= next_pc_in;
                            warp_state_out                          <= ACTIVE;
                            branch_exec_done                        <= '1';
                            branch_state_machine                    <= IDLE;
                        elsif (instr_mask_in = current_mask_in) then
                            -- pop
                            warp_div_req_out                        <= '1';
                            warp_div_push_en_i                      <= '0';
                            warp_state_out                          <= ACTIVE;
                            branch_state_machine                    <= STACK_REQUEST;
                        else
                            initial_mask_out                        <= initial_mask_in;
                            current_mask_out                        <= (current_mask_in and (not instr_mask_in));
                            instr_mask_out                          <= instr_mask_in;
                            next_pc_out                             <= next_pc_in;
                            warp_state_out                          <= ACTIVE;
                            branch_exec_done                        <= '1';
                            branch_state_machine                    <= IDLE;
                        end if;
                    when CHECK_BAR =>
                        initial_mask_out                            <= initial_mask_in;
                        current_mask_out                            <= current_mask_in;
                        instr_mask_out                              <= instr_mask_in;
                        next_pc_out                                 <= next_pc_in;
                        warp_state_out                              <= WAITING_FENCE;
                        branch_exec_done                            <= '1';
                        branch_state_machine                        <= IDLE;
                    when CHECK_JOIN =>
                        initial_mask_out                            <= initial_mask_in;
                        current_mask_out                            <= current_mask_in;
                        instr_mask_out                              <= instr_mask_in;
                        next_pc_out                                 <= next_pc_in;
                        if (warp_lane_id_in = "00") then      
                            warp_div_req_out                        <= '1';
                            warp_div_push_en_i                      <= '1';
                            warp_div_wr_data_i                      <= current_mask_in & encode_warp_stack_token(ID_SYNC) & (x"000" & "0" & target_address_in);
                            branch_state_machine                    <= STACK_REQUEST;
                        else
                            branch_exec_done                        <= '1';
                            branch_state_machine                    <= IDLE;
                        end if;
                        warp_state_out                              <= ACTIVE;
                    when STACK_REQUEST =>
                        if (warp_div_grant_in = '1') then
                            warp_div_req_out                        <= '0';
                            warp_div_stack_en_out(warp_id_addr)     <= '1';
                            warp_div_wr_data_out(warp_id_addr)      <= warp_div_wr_data_i;
                            if (warp_div_push_en_i = '0') then
                                warp_div_push_en_out(warp_id_addr)  <= '0';
                                branch_state_machine                <= STACK_POP;
                            else
                                warp_div_ack_out                    <= '1';
                                warp_div_push_en_out(warp_id_addr)  <= '1';
                                branch_exec_done                    <= '1';
                                branch_state_machine                <= IDLE;
                            end if;
                        end if;
                    when STACK_POP =>
                        warp_div_ack_out                            <= '1';
                        initial_mask_out                            <= initial_mask_in;
                        current_mask_out                            <= warp_div_rd_data_in(warp_id_addr)(65 downto 34);
                        instr_mask_out                              <= instr_mask_in;
                        next_pc_out                                 <= warp_div_rd_data_in(warp_id_addr)(31 downto 0);
                        warp_div_stack_en_out(warp_id_addr)         <= '0';
                        warp_div_push_en_out(warp_id_addr)          <= '0';
                        branch_exec_done                            <= '1';
                        branch_state_machine                        <= IDLE;
                    when others =>
                        branch_state_machine                        <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
end arch;

