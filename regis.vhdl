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
signal pr_aux: std_logic := '1';
begin
    u_ffd1 : ffd port map(din(0),clk,pr_aux,cl,dout(0));
    u_ffd2 : ffd port map(din(1),clk,pr_aux,cl,dout(1));
    u_ffd3 : ffd port map(din(2),clk,pr_aux,cl,dout(2));

end architecture;
