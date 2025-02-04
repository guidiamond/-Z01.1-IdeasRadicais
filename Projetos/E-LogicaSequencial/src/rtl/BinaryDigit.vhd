-- Elementos de Sistemas
-- by Luciano Soares
-- BinaryDigit.vhd

Library ieee;
use ieee.std_logic_1164.all;


entity BinaryDigit is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;

architecture rtl of BinaryDigit is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.	
  component Mux2Way is
    port(
      a,b,sel:      in STD_LOGIC;   -- entradas
      q: out STD_LOGIC   --saida
    );
  end component;

  component  FlipFlopD is
    port(
      clock,d,clear,preset:   in STD_LOGIC;   -- entradas
      q: out STD_LOGIC   --saida
    );
  end component;
SIGNAL muxsaida, saida : STD_LOGIC;

begin
	f1: Mux2Way port map (saida ,input ,load ,muxsaida );
	f2: FlipFlopD port map (clock ,muxsaida ,'0' ,'0' ,saida );
	output <= saida;


end architecture;
