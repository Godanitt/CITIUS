----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/16/2025 09:19:51 AM
-- Design Name: 
-- Module Name: Multiplicador - Behavioral
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

entity Multiplicador is
    Port (  
            E : in STD_LOGIC;
            F : in STD_LOGIC;
            G : in STD_LOGIC;
            H : in STD_LOGIC;
            Producto : out STD_LOGIC_VECTOR(3 downto 0));
end Multiplicador;


architecture Behavioral of Multiplicador is

signal Valor1: STD_LOGIC_VECTOR(3 downto 0);
signal Valor2: STD_LOGIC_VECTOR(3 downto 0);
signal Acarreo: STD_LOGIC_VECTOR(1 downto 0);


begin
    Valor1(0)   <=  E;
    Valor1(1)   <=  F;
    Valor2(0)   <=  G;
    Valor2(1)   <=  H;
    
    -------------------------------------------------
    -- Forma 1: solo con puertas lógicas
    Producto(0) <=  Valor1(0) AND Valor2(0) ;
    Producto(1) <=  (Valor1(0) AND Valor2(1)) XOR (Valor1(1) AND Valor2(0));
    Acarreo(0)  <=  (Valor1(0) AND Valor2(1)) AND (Valor1(1) AND Valor2(0));
    Producto(2) <=  (Valor1(1) AND Valor2(1)) XOR Acarreo(0); 
    Acarreo(1)  <=  (Valor1(0) AND Valor2(1)) AND Acarreo(0); 
    Producto(3) <=  Acarreo(1);

    ------------------------------------------------
    -- Forma 2: usando VHDL
    -- Producto <= std_logic_vector(unsigned(Valor1) * unsigned(Valor2));

end Behavioral;
