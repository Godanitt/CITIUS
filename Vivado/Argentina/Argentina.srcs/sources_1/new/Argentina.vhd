----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2025 09:33:51 AM
-- Design Name: 
-- Module Name: Argentina - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Argentina is
    Port ( clk : in STD_LOGIC;
           sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           led0 : out STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC);
end Argentina;

architecture Behavioral of Argentina is

signal timer: std_logic_vector(27 downto 0);

begin

process (CLK) is 
begin
    if (rising_edge (clk)) then 
       
    timer <= timer+1;
    
    end if; 
end process;

led0 <= sw0 AND sw1;
led1 <= sw0 XOR sw1;
led2 <= timer(25);
led3 <= timer(26); 

end Behavioral;
