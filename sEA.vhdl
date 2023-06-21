library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sEA is
    port(
        pe : in std_logic_vector(2 downto 0);
        m_dev : out std_logic;
        m_cof : out std_logic;
        d_disp : out std_logic
    );
end entity;

architecture fsaida_ea of sEA is
    begin
        m_dev <= pe(2) and pe(1);
        m_cof <= pe(2) and not pe(1);
        d_disp <= pe(2) and not pe(1);
end architecture;
