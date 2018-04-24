----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:55 10/28/2015 
-- Design Name: 
-- Module Name:    ALU_4bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_4bits is
    Port ( OPE_A 		: in   std_logic_vector (3 downto 0);							-- Primer operando
           OPE_B 		: in   std_logic_vector (3 downto 0);							-- Segundo operando
           SEL_ALU 	: in   std_logic_vector (2 downto 0);							-- Selector
           SalALU 	: out  std_logic_vector	(3 downto 0);							-- Salida/Resultado
           SalZF 		: out  STD_LOGIC);													-- FLAG de resultado = 0
end ALU_4bits;

architecture Behavioral of ALU_4bits is
-- Señal para que SalZF pueda saber si la salida es 0 o no. No se puede hacer con SalALU porque al estar marcada
-- como OUT no puede ser leída por lo que daría error, así que le asignamos el valor del resultado a salida para
-- que SalZF pueda leerlo.
signal resAlu : std_logic_vector(3 downto 0);

begin
	-- Según el valor de SEL_ALU mostraremos en SalALU el resultado de una operación u otra
	with SEL_ALU select resAlu <=
		OPE_A when "000",
		OPE_A when "001",
		std_logic_vector(unsigned(OPE_A) + unsigned(OPE_B)) 	when "010",
		std_logic_vector(unsigned(OPE_A) - unsigned(OPE_B)) 	when "011",
		std_logic_vector(unsigned(OPE_B) + unsigned(OPE_A))	when "100",		-- Correcto?!?!inc y dec son de unidades, pero en la
		std_logic_vector(unsigned(OPE_B) - unsigned(OPE_A))	when "101",		-- descripción habla de un valor de 4bits
		"0000" when others;
	-- Asignamos el resultado a la salida
	SalALU <= resAlu;
	
	
	-- Como ya tenemos el valor del resultado en una señal, ya lo podemos usar en la estructura with select
	-- Si resultado = 0000 el LED correspondiente a SalZF se encenderá.
	with resAlu select SalZF <=
		'1' when "0000",
		'0' when others;
	


end Behavioral;

