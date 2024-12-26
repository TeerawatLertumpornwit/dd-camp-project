----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     UserWrDdr.vhd
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

Entity UserWrDdr Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk				: in	std_logic;							-- clock input 100 MHz

		-- WrCtrl I/F
		MemInitDone		: in	std_logic;
		MtDdrWrReq		: out	std_logic;
		MtDdrWrBusy		: in	std_logic;
		MtDdrWrAddr		: out	std_logic_vector( 28 downto 7 );
		
		-- T2UWrFf I/F
		T2UWrFfRdEn		: out	std_logic;
		T2UWrFfRdData	: in	std_logic_vector( 63 downto 0 );
		T2UWrFfRdCnt	: in	std_logic_vector( 15 downto 0 );
		
		-- UWr2DFf I/F
		UWr2DFfRdEn		: in	std_logic;
		UWr2DFfRdData	: out	std_logic_vector( 63 downto 0 );
		UWr2DFfRdCnt	: out	std_logic_vector( 15 downto 0 )
	);
End Entity UserWrDdr;

Architecture rtl Of UserWrDdr Is

----------------------------------------------------------------------------------
-- Component declaration
----------------------------------------------------------------------------------
	
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	
	signal	rMemInitDone	: std_logic_vector( 1 downto 0 );
	signal	rMtWrReq 		: std_logic;
	signal	rMtWrAddr		: std_logic_vector( 28 downto 7 ) := "11" & conv_std_logic_vector(24575,20);

	
Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------
	MtDdrWrReq 	<= rMtWrReq;
	MtDdrWrAddr <= rMtWrAddr;
	T2UWrFfRdEn	<= UWr2DFfRdEn;
	UWr2DFfRdData <= T2UWrFfRdData;
	UWr2DFfRdCnt <= T2UWrFfRdCnt;
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
	
	u_rMtWrReq : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rMtWrReq	<= 	'0';
			else
				if ( MtDdrWrBusy='0' ) then
					rMtWrReq	<= '1';
				else
					rMtWrReq	<= '0';
				end if;
			end if;
		end if;
	End Process u_rMtWrReq;
	
	
	u_rMtWrAddr : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rMtWrAddr	<=  (others => '0');
			else
				--1024*768*4/128 = 24576 
				if (rMtWrAddr(26 downto 7) = conv_std_logic_vector(24575, 20) and MtDdrWrBusy ='1' and rMtWrReq='1') then
						if (rMtWrAddr(28 downto  27)="00") then
							rMtWrAddr(28 downto  27) <= "01";
							rMtWrAddr(26 downto  7) <= (others => '0');
						elsif (rMtWrAddr(28 downto  27)="01") then
							rMtWrAddr(28 downto  27) <= "10";
							rMtWrAddr(26 downto  7) <= (others => '0');
						elsif (rMtWrAddr(28 downto  27)="10") then
							rMtWrAddr(28 downto  27) <= "11";
							rMtWrAddr(26 downto  7) <= (others => '0');
						elsif (rMtWrAddr(28 downto  27)="11") then
							rMtWrAddr(28 downto  27) <= "00";
							rMtWrAddr(26 downto  7) <= (others => '0');
						else
							rMtWrAddr(28 downto  27) <= rMtWrAddr(28 downto  27);
							rMtWrAddr(26 downto  7) <= (others => '0');
						end if;
				else
					if (MtDdrWrBusy	='1'and rMtWrReq='1') then
						rMtWrAddr(28 downto  27) <= rMtWrAddr(28 downto  27);
						rMtWrAddr(26 downto 7)	<= rMtWrAddr(26 downto 7) + 1;
					else
						rMtWrAddr(28 downto  27) <= rMtWrAddr(28 downto  27);
						rMtWrAddr(26 downto 7)	<= rMtWrAddr(26 downto 7);
					end if;
				end if;
			end if;
		end if;
	End Process u_rMtWrAddr;
	
	
End Architecture rtl;

