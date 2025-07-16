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
entity Sumador is
    Port (  
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            C : in STD_LOGIC;
            D : in STD_LOGIC;
            Suma : out STD_LOGIC_VECTOR(3 downto 0));
end Sumador;

architecture Behavioral of Sumador is

signal Acarreo: STD_LOGIC_VECTOR(2 downto 0);
signal Valor1: STD_LOGIC_VECTOR(2 downto 0);
signal Valor2: STD_LOGIC_VECTOR(2 downto 0);


begin 
    Valor1(0)<=A;
    Valor1(1)<=B;
    Valor2(0)<=C;
    Valor2(1)<=D;

    ------------------------------------------------------
    -- Forma 1: exclusivamente puertas lógicas
    
    Suma(0) <= Valor1(0) XOR Valor2(0);
    Acarreo(0) <= Valor1(0) AND Valor2(0);
    
    Suma(1) <= Valor1(1) XOR Valor2(1) XOR Acarreo(0);
    Acarreo(1) <= (Valor1(1) AND Valor2(1)) OR ((Valor1(1) XOR Valor2(1)) AND Acarreo(0));
    
    Suma(2) <= Acarreo(1);
    
    Suma(3) <= '0';
    
    -------------------------------------------------------
    -- Forma 2: usando operadores de VHDL
    
   --Suma <= std_logic_vector(unsigned(Valor1) + unsigned(Valor2));

end Behavioral;
