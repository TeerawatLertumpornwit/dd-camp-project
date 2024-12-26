----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     BitMapPattern.vhd
-- Title        Top
--
-- Company      Design Gateway Co., Ltd.
-- Project      DDCamp
-- PJ No.       
-- Syntax       VHDL
-- Note         

-- Version      1.00
-- Author       B.Attapon
-- Date         2017/12/20
-- Remark       New Creation
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

Entity BitMapPattern Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk				: in	std_logic;							-- clock input 100 MHz

		RxFfWrData		: in	std_logic_vector( 7 downto 0 );
		RxFfWrEn		: in	std_logic;
		
		BitMapWrData	: out	std_logic_vector( 31 downto 0 );
		BitMapWrEn		: out	std_logic
		
	);
End Entity BitMapPattern;

Architecture rtl Of BitMapPattern Is

----------------------------------------------------------------------------------
-- Component declaration
----------------------------------------------------------------------------------
	
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	
	signal	rBitMapWrData	: std_logic_vector(23 downto 0);
	signal	rBitMapWrEn		: std_logic;
	signal	rRxFfCnt		: std_logic_vector( 21 downto 0 ) := conv_std_logic_vector(0, 22);
	signal  rRxFfEn			: std_logic;
	Signal	rBitMapWrCnt	: std_logic_vector( 1 downto 0 ) := conv_std_logic_vector(0, 2);
	
Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------
	BitMapWrData(31 downto 0)	<= "00000000" & rBitMapWrData(23 downto 0);
	BitMapWrEn					<=	rBitMapWrEn;
----------------------------------------------------------------------------------
-- DFF 
----------------------------------------------------------------------------------
	
	
	u_rRxFfCnt : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rRxFfCnt(21 downto 0)	<= 	(others => '0');
			else
				if (RxFfWrEn='1' and rRxFfCnt=2359349) then
					rRxFfCnt(21 downto 0)	<= (others => '0');
				elsif (RxFfWrEn='1') then
					rRxFfCnt(21 downto 0)	<= rRxFfCnt(21 downto 0)+1;
				else
					rRxFfCnt(21 downto 0)	<= rRxFfCnt(21 downto 0);
				end if;
			end if;
		end if;
	End Process u_rRxFfCnt ;
	
	u_rRxFfEn : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rRxFfEn	<= 	'0';
			else
				if (RxFfWrEn='1' and rRxFfCnt=53) then
					rRxFfEn	<= 	'1';
				elsif (RxFfWrEn='1' and rRxFfCnt=2359349) then
					rRxFfEn	<= 	'0';
				else
					rRxFfEn	<= rRxFfEn;
				end if;
			end if;
		end if;
	End Process u_rRxFfEn ;	
	
	u_rBitMapWrEn : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rBitMapWrEn	<= 	'0';
			else
				if (rRxFfEn='1' and rBitMapWrCnt = 2 and RxFfWrEn='1' ) then
					rBitMapWrEn	<= 	'1';
				else
					rBitMapWrEn	<= 	'0';
				end if;
			end if;
		end if;
	End Process u_rBitMapWrEn ;	
	
	u_rBitMapWrData : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rBitMapWrData(23 downto 0)	<= 	(others => '0');
			else
				if (rRxFfEn='1') then
					if (RxFfWrEn='1') then
						rBitMapWrData(23 downto 16)	<= 	RxFfWrData(7 downto 0);
						rBitMapWrData(15 downto 0)	<=  rBitMapWrData(23 downto 8);
					else
						rBitMapWrData(23 downto 0)	<=	rBitMapWrData(23 downto 0);
					end if;
				else
					rBitMapWrData(23 downto 0)	<= 	rBitMapWrData(23 downto 0);
				end if;
			end if;
		end if;
	End Process u_rBitMapWrData ;	
	
	u_rBitMapWrCnt : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rBitMapWrCnt	<= 	conv_std_logic_vector(0, 2);
			else
				if (RxFfWrEn='1') then
					if (rBitMapWrCnt=2) then
						rBitMapWrCnt <= conv_std_logic_vector(0, 2);
					else
						rBitMapWrCnt <= rBitMapWrCnt+1;
					end if;
				else
					rBitMapWrCnt <= rBitMapWrCnt;
				end if;
			end if;
		end if;
	End Process u_rBitMapWrCnt ;	
	
End Architecture rtl;

