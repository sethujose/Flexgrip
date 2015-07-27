----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      vector_register_controller - arch 
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

    entity vector_register_controller is
        port (
            reset                   : in  std_logic;
            clk_in                  : in  std_logic;
            en                      : in  std_logic;
            
            lane_id_in              : in  std_logic_vector(1 downto 0); 
            base_addr_in            : in  std_logic_vector(8 downto 0);
            reg_num_in              : in  std_logic_vector(8 downto 0);
            data_in                 : in  vector_word_register_array;
            data_type_in            : in  data_type;
            mask_in                 : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_en_in             : in  std_logic;
            
            gprs_base_addr_out      : out gprs_addr_array; 
            gprs_reg_num_out        : out gprs_reg_array;
            gprs_lane_id_out        : out warp_lane_id_array; 
            gprs_wr_en_out          : out wr_en_array;
            gprs_wr_data_out        : out vector_register;
            gprs_rd_data_in         : in  vector_register;
            
            data_out                : out vector_word_register_array;
            
            rdy_out                 : out std_logic
        );
    end vector_register_controller;

architecture arch of vector_register_controller is

    component bshift
        port ( 
            datain      : in std_logic_vector(31 downto 0);
            direction   : in std_logic;
            count       : in std_logic_vector(4 downto 0);
            dataout     : out std_logic_vector(31 downto 0)
        );
    end component;
    
    constant REG_MAX_SIZE                               : integer := 4;
    
    type regs_controller_state_type is (IDLE, WRITE_REGS, READ_REGS, READ_WAIT, READ_DONE);
    signal regs_controller_state_machine                : regs_controller_state_type;
    signal regs_controller_state_machine_cs             : std_logic_vector(2 downto 0);
    
    signal en_reg                                       : std_logic:='0';
    signal lane_id_i                                    : std_logic_vector(1 downto 0); 
    signal base_addr_i                                  : std_logic_vector(8 downto 0);
    signal reg_num_i                                    : std_logic_vector(8 downto 0);
    signal reg_num_i_reg                                : std_logic_vector(8 downto 0);
    signal mask_i                                       : std_logic_vector(CORES-1 downto 0);
    signal reg_num_pre_shift                            : std_logic_vector(31 downto 0);
    signal reg_num_shifted                              : std_logic_vector(31 downto 0);
    signal data_i                                       : vector_word_register_array;
    signal data_wr_shifted                              : vector_word_register_array;
    signal data_o                                       : vector_word_register_array;
    signal data_rd_shifted                              : vector_register;
    signal reg_hi_en                                    : std_logic;
    signal reg_size                                     : integer range 0 to REG_MAX_SIZE;
    signal reg_rd_wr_cnt                                : integer range 0 to REG_MAX_SIZE;
	 signal prev_reg_rd_wr_cnt									  : integer range 0 to REG_MAX_SIZE;
    signal read_word_done   									  : std_logic:= '0';	 
    signal write_word										 	  : std_logic:= '0';	 

    
begin

    with regs_controller_state_machine select
        regs_controller_state_machine_cs <=                               
            conv_std_logic_vector(0, 3) when IDLE,
            conv_std_logic_vector(1, 3) when READ_REGS,
            conv_std_logic_vector(2, 3) when READ_WAIT,
            conv_std_logic_vector(3, 3) when READ_DONE,
            conv_std_logic_vector(4, 3) when others;
    
    reg_num_pre_shift   <= ("00000000000000000000000" & reg_num_in );
        
    reg_hi_en       <= (reg_num_in(0) and '1');
    
    pVectorRegisterController :  process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (reset = '1') then
--                lane_id_i                                           <= (others => '0');
--                base_addr_i                                         <= (others => '0');
--                reg_num_i                                           <= (others => '0');
--                gprs_base_addr_out                                  <= (others => (others => '0'));
--                gprs_reg_num_out                                    <= (others => (others => '0'));
--                gprs_lane_id_out                                    <= (others => (others => '0'));
--                gprs_wr_en_out                                      <= (others => '0');
--                gprs_wr_data_out                                    <= (others => (others => '0'));
--                data_out                                            <= (others => (others => (others => '0')));
--                reg_rd_wr_cnt                                       <= 0;
                en_reg                                              <= '0';
--                read_word_done							    		<= '0';
--                write_word									    	<= '0';
                regs_controller_state_machine                       <= IDLE;
            else
            case regs_controller_state_machine is 
				when IDLE =>
                    lane_id_i                                   <= lane_id_in;
                    base_addr_i                                 <= base_addr_in;
                    data_i                                      <= data_in;
						  read_word_done						 				 <= '0';
						  write_word	  					    				 <= '0';
						  reg_num_i                                   <= (others => '0');
                    if ((data_type_in = DT_S16) or (data_type_in = DT_U16)) then
                        reg_num_i                               <= reg_num_shifted(8 downto 0);
                        reg_num_i_reg                           <= reg_num_shifted(8 downto 0);
                    else
                        reg_num_i                               <= reg_num_in;
                    end if;
                    mask_i                                      <= mask_in;
                    gprs_base_addr_out                          <= (others => (others => '0'));
                    gprs_reg_num_out                            <= (others => (others => '0'));
                    gprs_lane_id_out                            <= (others => (others => '0'));
                    gprs_wr_en_out                              <= (others => '0');
                    gprs_wr_data_out                            <= (others => (others => '0'));
                    data_out                                    <= (others => (others => (others => '0')));
                    reg_rd_wr_cnt                               <= 0;
                    rdy_out                                     <= '0';
						  prev_reg_rd_wr_cnt									 <= 0;
                    en_reg                                      <= en;
                    if (en = '1' and en_reg='0') then
                        if (rd_wr_en_in = '1') then
									 if(reg_num_in = "001111111") then              -- R127 - Do not write register
											gprs_wr_en_out                          	<= (others => '0');
											reg_rd_wr_cnt                           	<= 0;
											rdy_out                                 	<= '1';
											regs_controller_state_machine             <= IDLE;
									 else
											regs_controller_state_machine             <= WRITE_REGS;
									 end if;
                        else
									 if(reg_num_in = "001111100") then              -- R124 - Read as 0 
										 data_o 													<= (others => (others => (others => '0')));
										 regs_controller_state_machine           		<= READ_DONE;
								    else				
										 gprs_base_addr_out                          <= (others => base_addr_i);
										 gprs_reg_num_out                            <= (others => reg_num_i);
										 gprs_lane_id_out                            <= (others => lane_id_i);
										 gprs_wr_en_out                              <= (others => '0');
										 regs_controller_state_machine      		   <= READ_REGS;
									 end if;
								end if;
						 end if;
                when WRITE_REGS =>
                    if (reg_rd_wr_cnt < reg_size) then
                        gprs_base_addr_out                      <= (others => base_addr_i);
                        gprs_reg_num_out                        <= (others => reg_num_i);
                        gprs_lane_id_out                        <= (others => lane_id_i);
                        if ((data_type_in = DT_S16) or (data_type_in = DT_U16)) then
									 if(read_word_done = '0' and write_word = '0') then
										 gprs_wr_en_out                              <= (others => '0');
										 read_word_done 										<= '1';
										 regs_controller_state_machine      		   <= READ_REGS;
									 else
										 gprs_reg_num_out                    <= (others => reg_num_i_reg);
										 if (reg_hi_en = '1') then
											  for i in 0 to CORES-1 loop
													gprs_wr_en_out(i)           <= mask_i(i);
													gprs_wr_data_out(i)         <= ((data_o(i)(reg_rd_wr_cnt) and x"0000FFFF") or (data_wr_shifted(i)(reg_rd_wr_cnt)));
											  end loop;
										 else
											  for i in 0 to CORES-1 loop
													gprs_wr_en_out(i)           <= mask_i(i);
													gprs_wr_data_out(i)         <= ((data_o(i)(reg_rd_wr_cnt) and x"FFFF0000") or (data_i(i)(reg_rd_wr_cnt) and x"0000FFFF"));
											  end loop;
										 end if;
									 end if;
                        else
                            for i in 0 to CORES-1 loop
                                gprs_wr_en_out(i)               <= mask_i(i);
                                gprs_wr_data_out(i)             <= data_i(i)(reg_rd_wr_cnt);
                            end loop;
                        end if;
                        reg_num_i                               <= reg_num_i + "01";
                        reg_rd_wr_cnt                           <= reg_rd_wr_cnt + 1;
								write_word									    <= '0';
                    else
                        gprs_wr_en_out                          <= (others => '0');
                        reg_rd_wr_cnt                           <= 0;
                        rdy_out                                 <= '1';
                        regs_controller_state_machine           <= IDLE;
                     end if;
                when READ_REGS =>
						  prev_reg_rd_wr_cnt									 <= prev_reg_rd_wr_cnt + 1;
						  reg_num_i                              		 <= reg_num_i + "01";
                    regs_controller_state_machine               <= READ_WAIT;
                when READ_WAIT =>
                        if ((data_type_in = DT_S16) or (data_type_in = DT_U16)) then
                            if (reg_hi_en = '1') then
                                for i in 0 to CORES-1 loop
											 if(read_word_done = '1') then
                                    data_o(i)(0)    				 <= (gprs_rd_data_in(i) and x"0000FFFF");
											 else
                                    data_o(i)(reg_rd_wr_cnt)    <= data_rd_shifted(i);
											 end if;
                                end loop;
                            else
                                for i in 0 to CORES-1 loop
											 if(read_word_done = '1') then
                                    data_o(i)(0)    				 <=  gprs_rd_data_in(i) ;
											 else
                                    data_o(i)(reg_rd_wr_cnt)    <= (gprs_rd_data_in(i) and x"0000FFFF");
											 end if;
                                end loop;
                            end if;
                        else
                            for i in 0 to CORES-1 loop
                                data_o(i)(reg_rd_wr_cnt)        <= gprs_rd_data_in(i);
                            end loop;
                        end if;
							
						  if (prev_reg_rd_wr_cnt < reg_size) then
						      gprs_base_addr_out                      <= (others => base_addr_i);
                        gprs_reg_num_out                        <= (others =>(reg_num_i + "01"));
                        gprs_lane_id_out                        <= (others => lane_id_i);
								reg_rd_wr_cnt                           <= reg_rd_wr_cnt + 1;
                        regs_controller_state_machine           <= READ_REGS;
                    else
								if (read_word_done = '1') then
									reg_rd_wr_cnt                           <= 0;
									read_word_done									 <= '0';
									write_word									    <= '1';
									read_word_done              				 <= '0';
									regs_controller_state_machine           <= WRITE_REGS;
								else
									reg_rd_wr_cnt                           <= 0;
									regs_controller_state_machine           <= READ_DONE;
								end if;
                    end if;
                when READ_DONE =>
                    data_out                                    <= data_o;
                    rdy_out                                     <= '1';
                    regs_controller_state_machine               <= IDLE;
                when others =>
					regs_controller_state_machine		        <= IDLE;
			end case;
            end if;
        end if;
    end process;
    
    pRegisterSize : process(data_type_in)
    begin
        case data_type_in is
            when DT_U8 =>
                reg_size           <= 1;
            when DT_S8 =>
                reg_size           <= 1;
            when DT_U16 =>
                reg_size           <= 1;
            when DT_S16 =>
                reg_size           <= 1;
            when DT_U32 =>
                reg_size           <= 1;
            when DT_S32 =>
                reg_size           <= 1;
            when DT_U64 =>
                reg_size           <= 2;
            when DT_U128 =>
                reg_size           <= 4;
            when others =>
                reg_size           <= 1;
        end case;
    end process;
    
    uShiftReg : bshift
        port map (
            datain      => reg_num_pre_shift,
            direction   => '1', -- right
            count       => "00001",
            dataout     => reg_num_shifted
        );
   
    gShiftWriteData: for i in 0 to CORES-1 generate
        uShiftWriteData : bshift
            port map (
                datain      => data_i(i)(0),
                direction   => '0', -- left
                count       => "10000",
                dataout     => data_wr_shifted(i)(0)
            );
    end generate;
    
    gShiftReadData: for i in 0 to CORES-1 generate
        uShiftReadData : bshift
            port map (
                datain      => gprs_rd_data_in(i),
                direction   => '1', -- right
                count       => "10000",
                dataout     => data_rd_shifted(i)
            );
    end generate;
	     
end arch;

