----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      increment_address - arch 
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


library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity compute_pred_flags is
        port (
            reset                               : in  std_logic;
			clk_in                              : in  std_logic;
			en						            : in  std_logic;
            
			data_in                             : in  vector_register;
            flags_in                            : in  vector_flag_register;
            data_type_in                        : in  data_type;
            
            flags_out                           : out vector_flag_register;
            
            rdy_out                             : out std_logic
        );
    end compute_pred_flags;

architecture arch of compute_pred_flags is

    type compute_pred_flags_state_type is (IDLE, COMPUTE);
    signal compute_pred_flags_state_machine          : compute_pred_flags_state_type;
    signal compute_pred_flags_state_machine_cs       : std_logic_vector(1 downto 0);
    
    subtype int_32_t is integer range -2147483647 to +2147483647;
    subtype int_16_t is integer range -32767 to +32767;
    type signed_32_vector_register is array (CORES-1 downto 0) of int_32_t;
    type signed_16_vector_register is array (CORES-1 downto 0) of int_16_t;
    
    signal signed_32_i          : signed_32_vector_register;
    signal signed_16_i          : signed_16_vector_register;
    signal flags_u32_i          : vector_flag_register;
    signal flags_u16_i          : vector_flag_register;
    
    signal data_i               : vector_register;
    signal flags_i              : vector_flag_register;
    signal data_type_i          : data_type;
    signal flags_o              : vector_flag_register; 
    
    signal en_reg               : std_logic;
    
begin

    pComputePredFlags : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (reset = '1') then
                data_i                                              <= (others => (others => '0'));
                flags_i                                             <= (others => (others => '0'));
                data_type_i                                         <= DT_NONE;
                en_reg                                              <= '0';
                rdy_out                                             <= '0';
                compute_pred_flags_state_machine                    <= IDLE;
            else
                case compute_pred_flags_state_machine is 
                    when IDLE =>
                        rdy_out                                     <= '0';
                        en_reg                                      <= en;
                        if ((en_reg = '0') and (en = '1')) then
                            data_i                                  <= data_in;
                            flags_i                                 <= flags_in;
                            data_type_i                             <= data_type_in;
                            compute_pred_flags_state_machine        <= COMPUTE;
                        else
                            data_i                                  <= (others => (others => '0'));
                            flags_i                                 <= (others => (others => '0'));
                            data_type_i                             <= DT_NONE;
                        end if;
                    when COMPUTE =>
                        flags_out                                   <= flags_o;
                        rdy_out                                     <= '1';
                        compute_pred_flags_state_machine            <= IDLE;
                    when others =>
                        compute_pred_flags_state_machine            <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
    gSignedInt32 : for i in 0 to CORES-1 generate
        signed_32_i(i)                                      <= conv_integer(signed(data_i(i)));
    end generate;
    
    gSignedInt16 : for i in 0 to CORES-1 generate
        signed_16_i(i)                                      <= conv_integer(signed(data_i(i)));
    end generate;
    
    gComputePredFlags32 : for i in 0 to CORES-1 generate
        flags_u32_i(i)(encode_flag_type(FLAG_ZERO))         <= '1' when (data_i(i) = x"00000000") else '0';   ---Can also take in flags_in(0) directly?
        flags_u32_i(i)(encode_flag_type(FLAG_SIGN))         <= '1' when (signed_32_i(i) < 0) else '0';		  ---Can also take in flags_in(1) directly?
        flags_u32_i(i)(encode_flag_type(FLAG_CARRY))        <= flags_in(i)(encode_flag_type(FLAG_CARRY));
        flags_u32_i(i)(encode_flag_type(FLAG_OVERFLOW))     <= flags_in(i)(encode_flag_type(FLAG_OVERFLOW));
    end generate;
    
    gComputePredFlags16 : for i in 0 to CORES-1 generate
        flags_u16_i(i)(encode_flag_type(FLAG_ZERO))         <= '1' when ((data_i(i) and x"0000FFFF") = x"00000000") else '0';
        flags_u16_i(i)(encode_flag_type(FLAG_SIGN))         <= '1' when (signed_16_i(i) < 0) else '0';
        flags_u16_i(i)(encode_flag_type(FLAG_CARRY))        <= flags_in(i)(encode_flag_type(FLAG_CARRY));
        flags_u16_i(i)(encode_flag_type(FLAG_OVERFLOW))     <= flags_in(i)(encode_flag_type(FLAG_OVERFLOW));
    end generate;
    
    flags_o <=
        flags_u32_i     when (data_type_i = DT_U32) else
        flags_u16_i     when (data_type_i = DT_U16) else
        flags_in;
        
end arch;

