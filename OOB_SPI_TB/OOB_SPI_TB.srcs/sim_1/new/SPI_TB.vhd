----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2021 04:48:43 PM
-- Design Name: 
-- Module Name: SPI_TB - Behavioral
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPI_TB is
end SPI_TB;

architecture Behavioral of SPI_TB is
component SPI_If 
Port(
SYSCLK     : in STD_LOGIC; -- System Clock
 RESET      : in STD_LOGIC;
 Din        : in STD_LOGIC_VECTOR (7 downto 0); -- Data to be transmitted
 Dout       : out STD_LOGIC_VECTOR (7 downto 0); -- Data received;
 State      : out STD_LOGIC_VECTOR (7 downto 0); --current state of system
 Start      : in STD_LOGIC; -- used to start the transmission
 Done       : out STD_LOGIC; -- Signaling that transmission ended
 HOLD_SS   : in STD_LOGIC; -- Signal that forces SS low in the case of multiple byte 
                           -- transmit/receive mode
 --SPI Interface Signals
 SCLK       : out STD_LOGIC;
 MOSI       : out STD_LOGIC;
 MISO       : in STD_LOGIC;
 SS         : out STD_LOGIC
);
end component;

--Constants
constant T : time := 20ns;

signal SYSCLK, RESET, Start, Done, Hold_SS,SCLK,MOSI,MISO,SS : std_logic;
signal Din, Dout, State : STD_LOGIC_VECTOR(7 downto 0);


begin

DUT : SPI_If port map( 
SYSCLK => SYSCLK,
RESET => RESET,
Din => Din,
Dout => Dout,
State => State,
Start => Start,
Done => Done,
Hold_SS => Hold_SS,
SCLK => SCLK,
MOSI => MOSI,
MISO => MISO,
SS => SS
);

process
begin
--initialize
SYSCLK <= '1';
wait for T/2;
SYSCLK <= '0';
wait for T/2;
end process;

process
begin
--initialize
wait for 100ns;
Din <= "00001010";
MISO <= '1';
Hold_SS <= '1';
--start 
RESET <= '0';
Start <= '1';
wait for 400us;
Start <= '0';
RESET <= '1';
wait;
end process;



end Behavioral;
