----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2025 09:40:52 AM
-- Design Name: 
-- Module Name: mux4_1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4_1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Seleccion : in STD_LOGIC_VECTOR (1 downto 0);
           Salida : out STD_LOGIC);
end mux4_1;

architecture Behavioral of mux4_1 is

begin
process (A,B,C,D,Seleccion) is
begin
  if (Seleccion ="00") then
      Salida <= A;
  elsif (Seleccion ="01") then
      Salida <= B;
  elsif (Seleccion ="10") then
      Salida <= C;
  else
      Salida <= D;
  end if;
 
end process;


end Behavioral;
