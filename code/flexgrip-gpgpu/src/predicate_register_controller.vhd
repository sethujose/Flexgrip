----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      read_vector_register - arch 
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

    entity predicate_register_controller is
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
            en                          : in  std_logic;
            
            warp_id_in                  : in  std_logic_vector(4 downto 0); 
            lane_id_in                  : in  std_logic_vector(1 downto 0); 
            reg_num_in                  : in  std_logic_vector(1 downto 0);
            data_in                     : in  vector_flag_register;
            mask_in                     : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_en_in                 : in  std_logic;
            
            pred_regs_warp_id_out       : out warp_id_array; 
            pred_regs_warp_lane_id_out  : out warp_lane_id_array;
            pred_regs_reg_num_out       : out reg_num_array;
            pred_regs_wr_en_out         : out wr_en_array;
            pred_regs_wr_data_out       : out vector_flag_register;
            pred_regs_rd_data_in        : in  vector_flag_register;
            
            data_out                    : out vector_flag_register;
            
            rdy_out                     : out std_logic
        );
    end predicate_register_controller;

architecture arch of predicate_register_controller is

    type pred_regs_controller_state_type is (IDLE, WRITE_REGS, READ_REGS, READ_WAIT, READ_DONE);
    signal pred_regs_controller_state_machine       : pred_regs_controller_state_type;
    
    signal en_reg                                   : std_logic;
    signal warp_id_i                                : std_logic_vector(4 downto 0); 
    signal lane_id_i                                : std_logic_vector(1 downto 0); 
    signal reg_num_i                                : std_logic_vector(1 downto 0);
    signal data_i                                   : vector_flag_register;
    signal mask_i                                   : std_logic_vector(CORES-1 downto 0);
    
begin
            
    pPredicateRegisterController :  process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (reset = '1') then
--                warp_id_i                                           <= (others => '0');
--                lane_id_i                                           <= (others => '0');
--                reg_num_i                                           <= (others => '0');
--                mask_i                                              <= (others => '0');
--                data_i                                              <= (others => (others => '0'));
--                pred_regs_warp_id_out                               <= (others => (others => '0'));
--                pred_regs_warp_lane_id_out                          <= (others => (others => '0'));
--                pred_regs_reg_num_out                               <= (others => (others => '0'));
--                pred_regs_wr_en_out                                 <= (others => '0');
--                pred_regs_wr_data_out                               <= (others => (others => '0'));
--                data_out                                            <= (others => (others => '0'));
--                rdy_out                                             <= '0';
                en_reg                                              <= en;
                pred_regs_controller_state_machine                  <= IDLE;
            else
            case pred_regs_controller_state_machine is 
				when IDLE =>
                    warp_id_i                                   <= warp_id_in;
                    lane_id_i                                   <= lane_id_in;
                    reg_num_i                                   <= reg_num_in;
                    data_i                                      <= data_in;
                    mask_i                                      <= mask_in;
                    pred_regs_warp_id_out                       <= (others => (others => '0'));
                    pred_regs_warp_lane_id_out                  <= (others => (others => '0'));
                    pred_regs_reg_num_out                       <= (others => (others => '0'));
                    pred_regs_wr_en_out                         <= (others => '0');
                    pred_regs_wr_data_out                       <= (others => (others => '0'));
                    data_out                                    <= (others => (others => '0'));
                    rdy_out                                     <= '0';
                    en_reg                                      <= en;
                    if (en_reg = '0' and en = '1') then
                        if (rd_wr_en_in = '1') then
                            pred_regs_controller_state_machine  <= WRITE_REGS;
                        else
                            pred_regs_controller_state_machine  <= READ_REGS;
                        end if;
                    end if;
                when WRITE_REGS =>
                    pred_regs_warp_id_out                       <= (others => warp_id_in);
                    pred_regs_warp_lane_id_out                  <= (others => lane_id_i);
                    pred_regs_reg_num_out                       <= (others => reg_num_i);
                    for i in 0 to CORES-1 loop
                        pred_regs_wr_en_out(i)                  <= mask_i(i);
                    end loop;
                    pred_regs_wr_data_out                       <= data_i;
                    rdy_out                                     <= '1';
                    pred_regs_controller_state_machine          <= IDLE;
                when READ_REGS =>
                    pred_regs_warp_id_out                       <= (others => warp_id_in);
                    pred_regs_warp_lane_id_out                  <= (others => lane_id_i);
                    pred_regs_reg_num_out                       <= (others => reg_num_i);
                    pred_regs_wr_en_out                         <= (others => '0');
                    pred_regs_controller_state_machine          <= READ_WAIT;
					 when READ_WAIT=>
                    pred_regs_controller_state_machine          <= READ_DONE;
                when READ_DONE =>
                    data_out                                    <= pred_regs_rd_data_in;
                    rdy_out                                     <= '1';
                    pred_regs_controller_state_machine          <= IDLE;
                when others =>
					pred_regs_controller_state_machine	        <= IDLE;
			end case;
            end if;
        end if;
    end process;
    
end arch;

