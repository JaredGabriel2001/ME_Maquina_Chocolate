library ieee;
use ieee.std_logic_1164.all; 

entity regis is
    port(
        din     : in std_logic_vector(2 downto 0);
        cl, clk : in std_logic;
        dout    : out std_logic_vector(2 downto 0)
    );
end entity;

architecture storage of regis is
    component ffd is
        port(
            d      : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;

begin

    reg : for i in 2 downto 0 generate
        r : ffd port map(din(i), clk, '1', cl, dout(i));
    end generate reg;

end architecture;
