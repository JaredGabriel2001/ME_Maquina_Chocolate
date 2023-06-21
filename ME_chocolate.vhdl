library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ME_chocolate is
    port(
        reset, clock : in std_logic;
        m_25         : in std_logic;
        m_50         : in std_logic;
        out_dev      : out std_logic;
        out_cof      : out std_logic;
        out_disp     : out std_logic
    );
end entity;

architecture ME_choc of ME_chocolate is
    component fEA is
        port(
            m25 : in std_logic;
            m50 : in std_logic;
            ea  : in std_logic_vector(2 downto 0);
            pe  : out std_logic_vector(2 downto 0)
        );
    end component;
    
    component regis is
        port(
            din     : in std_logic_vector(2 downto 0);
            cl, clk : in std_logic;
            dout    : out std_logic_vector(2 downto 0)
        );
    end component;
    
    component sEA is
        port(
            pe     : in std_logic_vector(2 downto 0);
            m_dev  : out std_logic;
            m_cof  : out std_logic;
            d_disp : out std_logic
        );
    end component;

    signal spe_reg, sea_reg  : std_logic_vector(2 downto 0);
    signal sm25, sm50        : std_logic;
    signal sdev, scof, sdisp : std_logic;

    begin
    u_fcea : fEA port map (sm25, sm50, sea_reg, spe_reg);
    u_reg  : regis port map(spe_reg, reset, clock, sea_reg);
    u_fsea : sEA port map(spe_reg, sdev, scof, sdisp);

    out_dev <= sdev;
    out_cof <= scof;
    out_disp <= sdisp;

end architecture;
