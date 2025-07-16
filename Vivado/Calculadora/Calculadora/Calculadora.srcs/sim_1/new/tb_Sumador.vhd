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

entity tb_Sumador is
--  Port ( );
end tb_Sumador;

architecture Behavioral of tb_Sumador is

component Sumador 
    PORT (  
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            C : in STD_LOGIC;
            D : in STD_LOGIC;
            Suma : out STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT;
    
   --Entradas
   signal A : STD_LOGIC := '0';
   signal B : STD_LOGIC := '0';
   signal C : STD_LOGIC := '0';
   signal D : STD_LOGIC := '0';
 
    --Salidas
   signal Suma : STD_LOGIC_VECTOR(3 downto 0);

begin
    
      -- Instacia del componente
   uut: Sumador PORT MAP (
        A => A,
        B => B,
        C => C,
        D => D,
        Suma => Suma
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
    
    A <= '1';
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
