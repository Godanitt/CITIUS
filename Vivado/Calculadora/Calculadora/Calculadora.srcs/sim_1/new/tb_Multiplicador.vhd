----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2025 12:49:31 PM
-- Design Name: 
-- Module Name: tb_Sumador - Behavioral
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

entity tb_Multiplicador is
--  Port ( );
end tb_Multiplicador;

architecture Behavioral of tb_Multiplicador is

component Multiplicador 
    PORT (  
            E : in STD_LOGIC;
            F : in STD_LOGIC;
            G : in STD_LOGIC;
            H : in STD_LOGIC;
            Producto : out STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT;
    
   --Entradas
   signal A : STD_LOGIC := '0';
   signal B : STD_LOGIC := '0';
   signal C : STD_LOGIC := '0';
   signal D : STD_LOGIC := '0';
 
    --Salidas
   signal Producto : STD_LOGIC_VECTOR(3 downto 0);

begin
    
      -- Instacia del componente
   uut: Multiplicador PORT MAP (
        E => A,
        F => B,
        G => C,
        H => D,
        Producto => Producto
    );
 
   -- Comienza el proceso
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
     wait for 100 ns; 
 
    A <= '1';
    B <= '0';
    C <= '0';
    D <= '0';       
 

    wait for 100 ns; 
 
    A <= '0';
    B <= '1';
    C <= '1';
    D <= '0';   
 
    wait for 100 ns; 
    
    A <= '0';
    B <= '1';
    C <= '0';
    D <= '1';   
 
 
    wait for 100 ns;   
    A <= '0';
    B <= '1';
    C <= '1';
    D <= '1';   
 
    wait for 100 ns;   
 
    A <= '1';
    B <= '1';
    C <= '1';
    D <= '1';   
 
    wait for 100 ns;   
    
    end process;


end Behavioral;
