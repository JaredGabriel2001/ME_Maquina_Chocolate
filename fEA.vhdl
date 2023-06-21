library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fEA is
    port(
        m25 : in std_logic;
        m50 : in std_logic;
        ea  : in std_logic_vector(2 downto 0);
        pe  : out std_logic_vector(2 downto 0)
    );
end entity;

architecture fEntrada_ea of fEA is

    begin 
    pe(2) <= (m50 and m25) or (not ea(2) and ea(0) and m50) or (not(ea(2)) and ea(0) and ea(1) and m25);
    pe(1) <= (not(ea(2)) and ea(1) and not(m25)) or (ea(1) and m25) or (m50 and m25) or (ea(2) and m25);
    pe(0) <= (m25 and m50) or ((not ea(0)) and m50) or (not ea(1) and ea(0) and m50) or (ea(1) and ea(0) and m50) or (ea(1) and ea(0) and m25) or ((not ea(2)) and ea(1) and ea(0) and (not m50));
end architecture;
