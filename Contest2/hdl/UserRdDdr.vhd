----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     UserRdDdr.vhd
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

Entity UserRdDdr Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk				: in	std_logic;							-- clock input 100 MHz

		DipSwitch		: in 	std_logic_vector( 1 downto 0 );
		
		-- HDMICtrl I/F
		HDMIReq			: out	std_logic;
		HDMIBusy		: in	std_logic;
		
		-- RdCtrl I/F
		MemInitDone		: in	std_logic;
		MtDdrRdReq		: out	std_logic;
		MtDdrRdBusy		: in	std_logic;
		MtDdrRdAddr		: out	std_logic_vector( 28 downto 7 );
		
		-- D2URdFf I/F
		D2URdFfWrEn		: in	std_logic;
		D2URdFfWrData	: in	std_logic_vector( 63 downto 0 );
		D2URdFfWrCnt	: out	std_logic_vector( 15 downto 0 );
		
		-- URd2HFf I/F
		URd2HFfWrEn		: out	std_logic;
		URd2HFfWrData	: out	std_logic_vector( 63 downto 0 );
		URd2HFfWrCnt	: in	std_logic_vector( 15 downto 0 )
	);
End Entity UserRdDdr;

Architecture rtl Of UserRdDdr Is

----------------------------------------------------------------------------------
-- Component declaration
----------------------------------------------------------------------------------
	
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	
	signal	rMemInitDone	: std_logic_vector( 1 downto 0 );
	signal	rHDMIReq		: std_logic;
	signal	rMtRdReq 		: std_logic;
	signal	rMtRdAddr		: std_logic_vector( 28 downto 7 ) := "11" & conv_std_logic_vector(24575, 20);
	
Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

	HDMIReq			<= rHDMIReq;
	MtDdrRdReq		<= rMtRdReq;
	MtDdrRdAddr		<= rMtRdAddr;
	D2URdFfWrCnt	<= URd2HFfWrCnt;
	URd2HFfWrEn		<= D2URdFfWrEn;
	URd2HFfWrData	<= D2URdFfWrData;
----------------------------------------------------------------------------------
-- DFF 
----------------------------------------------------------------------------------
	
	u_rMemInitDone : Process (Clk) Is
	Begin
		if ( rising_edge(Clk) ) then
			if ( RstB='0' ) then
				rMemInitDone	<= "00";
			else
				-- Use rMemInitDone(1) in your design
				rMemInitDone	<= rMemInitDone(0) & MemInitDone;
			end if;
		end if;
	End Process u_rMemInitDone;

	u_rHDMIReq : Process (Clk) Is
	Begin
		if ( rising_edge(Clk) ) then
			if ( RstB='0' ) then
				rHDMIReq	<= '0';
			else
				if ( HDMIBusy='0' and rMemInitDone(1)='1' ) then
					rHDMIReq	<= '1';
				elsif ( HDMIBusy='1' )  then
					rHDMIReq	<= '0';
				else
					rHDMIReq	<= rHDMIReq;
				end if;
			end if;
		end if;
	End Process u_rHDMIReq;
	
	u_rMtRdReq : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rMtRdReq	<= 	'0';
			else
				if ( MtDdrRdBusy='0') then
					rMtRdReq	<= '1';
				else
					rMtRdReq	<= '0';
				end if;
			end if;
		end if;
	End Process u_rMtRdReq;
	
	u_rMtRdAddr : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rMtRdAddr	<=  (others => '0');
			else
				--1024*768*4/128 = 24576
				if (rMtRdAddr(26 downto  7) = conv_std_logic_vector(24575, 20) and MtDdrRdBusy ='1'and rMtRdReq='1') then
						if (DipSwitch="00") then
							rMtRdAddr(28 downto  27) <= "00";
							rMtRdAddr(26 downto  7) <= (others => '0');
						elsif (DipSwitch="01") then
							rMtRdAddr(28 downto  27) <= "01";
							rMtRdAddr(26 downto  7) <= (others => '0');
						elsif (DipSwitch="10") then
							rMtRdAddr(28 downto  27) <= "10";
							rMtRdAddr(26 downto  7) <= (others => '0');
						elsif (DipSwitch="11") then
							rMtRdAddr(28 downto  27) <= "11";
							rMtRdAddr(26 downto  7) <= (others => '0');
						else
							rMtRdAddr(28 downto  27) <= rMtRdAddr(28 downto  27);
							rMtRdAddr(26 downto  7) <= (others => '0');
						end if;
				else
					if (MtDdrRdBusy	='1'and rMtRdReq='1') then
						rMtRdAddr(28 downto  27) <= rMtRdAddr(28 downto  27);
						rMtRdAddr(26 downto 7)	<= rMtRdAddr(26 downto 7) + 1;
					else
						rMtRdAddr(28 downto  27) <= rMtRdAddr(28 downto  27);
						rMtRdAddr(26 downto 7)	<= rMtRdAddr(26 downto 7);
					end if;
				end if;	
			end if;
		end if;
	End Process u_rMtRdAddr;
	
End Architecture rtl;