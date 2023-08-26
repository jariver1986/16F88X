--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:29:23 05/29/2008
-- Design Name:   
-- Module Name:   C:/Documents and Settings/fenrir/Xilinx/i2c_test/i2c_test.vhd
-- Project Name:  i2c_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by isE for module: i2c
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
 
entity i2c_test is
end i2c_test;
 
architecture behavior of i2c_test is 
 
  -- Component Declaration for the Unit Under Test (UUT)
 
  component i2c
  port(
      scl : inout std_logic;
      sda : inout std_logic;
      clk : in std_logic;
      reset : in std_logic;
      address : out std_logic_vector(6 downto 0);
      valid_address : in std_logic;
      data_in : in std_logic_vector(7 downto 0);
      data_out : out std_logic_vector(7 downto 0);
      transaction : out std_logic;  -- keep '1' in the same transaction
      dir : out std_logic;          -- OUT => '0', IN => '1'
      request : out std_logic;      -- request to client
      ready : in std_logic);        -- client ready
  end component;
  
  component pullup
  port(
      net_out : out std_logic);
  end component;
  
  --Inputs
  signal clk : std_logic;
  signal reset : std_logic := '1';

  --BiDirs
  signal scl : std_logic;
  signal sda : std_logic;

  -- Clock period definitions
  constant clk_period : time := 20ns;
  constant scl_period : time := 200ns;

  signal i2c_address_flag : std_logic_vector(7 downto 0);
  signal i2c_data_TX : std_logic_vector(7 downto 0);
  signal i2c_data_RX : std_logic_vector(7 downto 0);
  
  signal i2c_data_in : std_logic_vector(7 downto 0);
  signal i2c_data_out : std_logic_vector(7 downto 0);
  --signal i2c_dir : std_logic := 'Z';
  --signal i2c_request : std_logic := 'Z';
  
  signal ready : std_logic;
begin
 
  -- Instantiate the Unit Under Test (UUT)
  uut: i2c port map (
      scl => scl,
      sda => sda,
      clk => clk,
      reset => reset,
      valid_address => '1',
      data_in => i2c_data_in,
      data_out => i2c_data_out,
      --dir => i2c_dir,
      --request => i2c_request,
      ready => ready);
  
  net_scl: pullup port map(scl);
  net_sda: pullup port map(sda);

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
 

  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 1000 clk cycles.
    sda <= 'Z';
    scl <= 'Z';
    wait for clk_period*10;

    -- insert stimulus here
    reset <= '0';

    -- Host TX
    wait for 1us;
    ready <= '0';
      
    i2c_address_flag <= "11111110"; --"01010100";
      
    -- START
    sda <= '0';
    wait for scl_period/2;
    scl <= '0';
    wait for scl_period/2;
      
    -- Slave Address + W Flag
    for i in 0 to 7 loop
      if i2c_address_flag(7) = '0' then
        sda <= '0';
      else
        sda <= 'Z';
      end if;
      i2c_address_flag <= i2c_address_flag(6 downto 0) & '0';
      wait for scl_period/4;
      scl <= 'Z';
      wait for scl_period/2;
      scl <= '0';
      wait for scl_period/4;
    end loop;
      
    sda <= 'Z'; 
    wait for scl_period/2;
    wait for scl_period/2;
     
    -- wait ACK
    wait for scl_period/4;
    scl <= 'Z';
    wait for scl_period/2;
    scl <= '0';
    wait for scl_period/4;
    
    i2c_data_TX <= conv_std_logic_vector(16#AA#, 8); 
    wait for scl_period * 2;
      
    -- Data1
    for i in 0 to 7 loop
      if i2c_data_TX(7) = '0' then
        sda <= '0';
      else
        sda <= 'Z';
      end if;
      i2c_data_TX <= i2c_data_TX(6 downto 0) & '0';
      wait for scl_period/4;
      scl <= 'Z';
      wait for scl_period/2;
      scl <= '0';
      wait for scl_period/4;
      ready <= '0';
    end loop;
      
    sda <= 'Z';
    wait for scl_period/2;
    ready <= '1';
    wait for scl_period/2;
      
    -- wait ACK
    wait for scl_period/4;
    scl <= 'Z';
    wait for scl_period/2;
    scl <= '0';
    wait for scl_period/4;
      
    i2c_data_TX <= conv_std_logic_vector(16#55#, 8);
    wait for scl_period * 2;
      
    -- Data2
    for i in 0 to 7 loop
      if i2c_data_TX(7) = '0' then
        sda <= '0';
      else
        sda <= 'Z';
      end if;
      i2c_data_TX <= i2c_data_TX(6 downto 0) & '0';
      wait for scl_period/4;
      scl <= 'Z';
      wait for scl_period/2;
      scl <= '0';
      wait for scl_period/4;
      ready <= '0';
    end loop;
      
    -- wait NACK
    sda <= 'Z';
    wait for scl_period/4;
    scl <= 'Z';
    wait for scl_period/4;
    ready <= '1';
    wait for scl_period/4;
    scl <= '0';
    wait for scl_period/4;
    wait for scl_period * 2;
      
    -- send STOP
    sda <= '0';
    wait for scl_period/4;
    scl <= 'Z';
    wait for scl_period/2;
    wait for scl_period/4;
    sda <= 'Z';
      
    -- Host_RX
    wait for 1us;
    ready <= '0';
      
    i2c_address_flag <= "00000001"; --"01010101";
      
    -- START
    sda <= '0';
    wait for scl_period/2;
    scl <= '0';
    wait for scl_period/2;
     
    -- Slave Address + R Flag
    for i in 0 to 7 loop
      if i2c_address_flag(7) = '0' then
        sda <= '0';
      else
        sda <= 'Z';
      end if;
      i2c_address_flag <= i2c_address_flag(6 downto 0) & '0';
      wait for scl_period/4;
      scl <= 'Z';
      wait for scl_period/2;
      scl <= '0';
      wait for scl_period/4;
    end loop;
      
    sda <= 'Z';
    i2c_data_in <= conv_std_logic_vector(16#55#, 8);
    wait for scl_period/2;
    ready <= '1';
    wait for scl_period/2;
      
    -- wait ACK
    wait for scl_period/4;
    scl <= 'Z';
    wait for scl_period/2;
    scl <= '0';
    wait for scl_period/4;
    wait for scl_period * 2;
      
    -- Data1
    for i in 0 to 7 loop
      wait for scl_period/4;
      scl <= 'Z';
      wait for scl_period/4;
      i2c_data_RX <= i2c_data_RX(6 downto 0) & sda;
      wait for scl_period/4;
      scl <= '0';
      wait for scl_period/4;
      ready <= '0';
    end loop;
      
    i2c_data_in <= conv_std_logic_vector(16#AA#, 8);
    wait for scl_period/2;
    ready <= '1';
    wait for scl_period/2;
      
    -- send ACK
    sda <= '0';
    wait for scl_period/4;
    scl <= 'Z';
    wait for scl_period/2;
    scl <= '0';
    wait for scl_period/4;
    wait for scl_period * 2;
    sda <= 'Z';
      
    -- Data2
    for i in 0 to 7 loop
      wait for scl_period/4;
      scl <= 'Z';
      wait for scl_period/4;
      i2c_data_RX <= i2c_data_RX(6 downto 0) & sda;
      wait for scl_period/4;
      scl <= '0';
      wait for scl_period/4;
      ready <= '0';
    end loop;
      
    -- wait NACK
    wait for scl_period * 2;
    sda <= 'Z';
    wait for scl_period/4;
    scl <= 'Z';
    wait for scl_period/4;
    ready <= '1';
    wait for scl_period/4;
    scl <= '0';
    wait for scl_period/4;
    wait for scl_period * 2;
      
    -- send STOP
    sda <= '0';
    wait for scl_period/4;
    scl <= 'Z';
    wait for scl_period/2;
    wait for scl_period/4;
    sda <= 'Z';

    wait;
  end process;

end;