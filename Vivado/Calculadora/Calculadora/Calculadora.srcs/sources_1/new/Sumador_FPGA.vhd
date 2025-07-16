----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2025 01:21:26 PM
-- Design Name: 
-- Module Name: Sumador_FPGA - Behavioral
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

entity Sumador_FPGA is
    Port ( sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           btn0 : in STD_LOGIC; 
           clk   : in STD_LOGIC;
           led0 : out STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC
           );
end Sumador_FPGA;

architecture Behavioral of Sumador_FPGA is

component Sumador 
    PORT (  
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            C : in STD_LOGIC;
            D : in STD_LOGIC;
            Suma : out STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT;
    
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
    signal E : STD_LOGIC := '0';
    signal F : STD_LOGIC := '0';
    signal G : STD_LOGIC := '0';
    signal H : STD_LOGIC := '0';
 
    --Salidas
    signal Suma : STD_LOGIC_VECTOR(3 downto 0);
    signal Producto : STD_LOGIC_VECTOR(3 downto 0);
    
----------------------------------------------------------   
-- FPGA IMPLEMENTACION
begin 
    mult_inst: Multiplicador  PORT MAP (
                E => E,
                F => F,
                G => G,
                H => H,
                Producto => Producto
    );
    sum_inst: Sumador PORT MAP (
                A => A,
                B => B,
                C => C,
                D => D,
                Suma => Suma
    );
            
            

    process (sw0,sw1,sw2,sw3,btn0,clk) 
    begin 
        if btn0='1' then 
                
            E <= sw0;
            F <= sw1;
            G <= sw2;
            H <= sw3;
           
            led0<= Producto(0);
            led1<= Producto(1);
            led2<= Producto(2); 
            led3<= Producto(3);
       
            
        else 
                
            A <= sw0;
            B <= sw1;
            C <= sw2;
            D <= sw3;
           
            led0<= Suma(0);
            led1<= Suma(1);
            led2<= Suma(2); 
            led3<= Suma(3);
       
        end if;
    end process;
end Behavioral;
