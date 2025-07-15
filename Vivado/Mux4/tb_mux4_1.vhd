----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2025 09:41:23 AM
-- Design Name: 
-- Module Name: tb_mux4_1 - Behavioral
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

entity tb_mux4_1 is

end tb_mux4_1;

architecture Behavioral of tb_mux4_1 is

COMPONENT mux4_1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : IN  std_logic;
         Seleccion : IN  std_logic_vector(1 downto 0);
         Salida : OUT  std_logic
        );
    END COMPONENT;
    
   --Entradas
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal D : std_logic := '0';
   signal Seleccion : std_logic_vector(1 downto 0) := "00";
 
    --Salidas
   signal Salida : std_logic;

begin

  -- Instacia del componente
   uut: mux4_1 PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          Seleccion => Seleccion,
          Salida => Salida
        );
 
   -- Comienza el proceso
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns; 
 
    A <= '1';
    B <= '0';
    C <= '1';
    D <= '0';       
 
    Seleccion <= "00";

    wait for 100 ns; 
 
    Seleccion <= "10";
 
    wait for 100 ns; 
 
    Seleccion <= "11";
 
    wait for 100 ns;   
 
    Seleccion <= "01";
 
    wait for 100 ns;   
 
    end process;
 


end Behavioral;
