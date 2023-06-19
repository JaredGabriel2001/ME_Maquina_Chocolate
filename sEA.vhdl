library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity s_ea is
    port(
        ea : in bit_vector(2 downto 0);
        m_dev : out std_logic;
        m_cof : out std_logic;
        d_disp : out std_logic;
    );
end entity;

architecture fsaida_ea of s_ea is
    begin
        m_dev <= e(2) and e(1);
        m_cof <= e(2) and not e(1);
        d_disp <= e(2) and not e(1);
end architecture;