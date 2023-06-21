library ieee;
use ieee.std_logic_1164.all;

entity tb_chocolate is
end entity;

architecture chocolate of tb_chocolate is
	constant cicloClock : time := 20 ns;

component ME_chocolate is
    port(
        reset, clock : in std_logic;
        m_25         : in std_logic;
        m_50         : in std_logic;
        out_dev      : out std_logic;
        out_cof      : out std_logic;
        out_disp     : out std_logic
    );
end component;

signal srst : std_logic := '1';
signal sclk : std_logic := '0';

signal s_m_25, s_m_50, s_out_dev, s_out_cof, s_out_disp  : std_logic;

begin

    sclk <= not(sclk) after cicloClock / 2;

    u_maquina : ME_chocolate port map(srst, sclk, s_m_25, s_m_50, s_out_dev, s_out_cof, s_out_disp);

	tb_reset : process
	begin
        srst <= '0';
        wait for cicloClock;
        srst <= '1';
        wait;
	end process;
    
    tb_maquina : process
	begin
	    s_m_25 <= '1';
	    s_m_50 <= '1';	
	    wait for cicloClock;

	    s_m_25 <= '1';
	    s_m_50 <= '0';
	    wait for cicloClock;

	    s_m_25 <= '0';
	    s_m_50 <= '1';
	    wait for cicloClock;

	    s_m_25 <= '0';
	    s_m_50 <= '0';
	    wait for cicloClock;
	    wait;
	end process;

end architecture;
