----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2025 11:04:40 AM
-- Design Name: 
-- Module Name: Sumador - Behavioral
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

-- Este sumador será un sumador de dos numeros binarios de rango 2.
entity Restador is
    Port (
            J : in STD_LOGIC;
            K : in STD_LOGIC;
            L : in STD_LOGIC;
            M : in STD_LOGIC;
            Diferencia : out STD_LOGIC_VECTOR(3 downto 0);
            Signo: out STD_LOGIC);
end Restador;

architecture Behavioral of Restador is

signal Valor1: STD_LOGIC_VECTOR(1 downto 0);
signal Valor2: STD_LOGIC_VECTOR(1 downto 0);
signal aux: STD_LOGIC_VECTOR(1 downto 0);

begin 
    Valor2(0)<=J;
    Valor2(1)<=K;
    Valor1(0)<=L;
    Valor1(1)<=M;

    ------------------------------------------------------
    -- Forma 1: exclusivamente puertas lógicas
    
    Diferencia(0) <= (Valor1(0) XOR Valor2(0));
    aux(0) <=(Valor1(0) XOR Valor2(0)); 
    
    Diferencia(1) <= (Valor1(1) XOR Valor2(1));
    aux(1)  <= (Valor1(1) XOR Valor2(1));
    
    Signo <= (aux(1) AND Valor2(1)) OR (aux(0) AND Valor2(0) AND NOT(Valor1(1)))  ;
    
    Diferencia(2) <= '0';
    Diferencia(3) <= '0'; 
    -------------------------------------------------------
    -- Forma 2: usando operadores de VHDL
    
   --Diferencia <= std_logic_vector(unsigned(Valor1) - unsigned(Valor2));

end Behavioral;
