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
           btn1 : in STD_LOGIC; 
           clk   : in STD_LOGIC;
           
           led0 : out STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC;
           
           led0b : out STD_LOGIC;
           led1b : out STD_LOGIC;
           led2b : out STD_LOGIC;
           led3b : out STD_LOGIC;
           
           led0r : out STD_LOGIC;
           led1r : out STD_LOGIC;
           led2r : out STD_LOGIC;
           led3r : out STD_LOGIC;
           
           led0g : out STD_LOGIC;
           led1g : out STD_LOGIC;
           led2g : out STD_LOGIC;
           led3g : out STD_LOGIC
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
    
component Restador 
    PORT (  
            J : in STD_LOGIC;
            K : in STD_LOGIC;
            L : in STD_LOGIC;
            M : in STD_LOGIC;
            Diferencia : out STD_LOGIC_VECTOR(3 downto 0);
            Signo: out STD_LOGIC);
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
    signal J : STD_LOGIC := '0';    
    signal K : STD_LOGIC := '0';
    signal L : STD_LOGIC := '0';
    signal M : STD_LOGIC := '0';
 
    --Salidas
    signal Suma : STD_LOGIC_VECTOR(3 downto 0);
    signal Diferencia : STD_LOGIC_VECTOR(3 downto 0);
    signal Producto : STD_LOGIC_VECTOR(3 downto 0);
    signal Signo: STD_LOGIC;
    
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
    res_inst: Restador PORT MAP (
                J=> J,
                K => K,
                L => L,
                M => M,
                Diferencia => Diferencia,
                Signo => Signo
    );
            
            
            

    process (sw0,sw1,sw2,sw3,btn0,clk) 
    begin 
        if btn0='1' then 
                
            E <= sw0;
            F <= sw1;
            G <= sw2;
            H <= sw3;
           
            led0r<= Producto(0);
            led1r<= Producto(1);
            led2r<= Producto(2); 
            led3r<= Producto(3);
            led0b<= Producto(0);
            led1b<= Producto(1);
            led2b<= Producto(2); 
            led3b<= Producto(3);
                led0g<= '0';
                led1g<= '0';
                led2g<= '0';
                led3g<= '0';
       
        elsif btn1='1' then 
       
       
            J <= sw0;
            K <= sw1;
            L <= sw2;
            M <= sw3;
            
            if Signo='1' then
                led0r<= '0';
                led1r<= '0';
                led2r<= '0';
                led3r<= '0';
                led0b<= '0';
                led1b<= '0';
                led2b<= '0'; 
                led3b<= '0';
                led0g<= Diferencia(0);
                led1g<= Diferencia(1);
                led2g<= Diferencia(2); 
                led3g<= Diferencia(3);
            else 
                led0r<= Diferencia(0);
                led1r<= Diferencia(1);
                led2r<= Diferencia(2); 
                led3r<= Diferencia(3);
                led0b<= Diferencia(0);
                led1b<= Diferencia(1);
                led2b<= Diferencia(2); 
                led3b<= Diferencia(3);
                led0g<= '0';
                led1g<= '0';
                led2g<= '0';
                led3g<= '0';
             end if;
            
        else 
                
            A <= sw0;
            B <= sw1;
            C <= sw2;
            D <= sw3;
           
            led0r<= Suma(0);
            led1r<= Suma(1);
            led2r<= Suma(2); 
            led3r<= Suma(3);
            led0b<= Suma(0);
            led1b<= Suma(1);
            led2b<= Suma(2); 
            led3b<= Suma(3);
                led0g<= '0';
                led1g<= '0';
                led2g<= '0';
                led3g<= '0';
       
       
        end if;
    end process;
end Behavioral;
