library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

Entity RxSerial Is
Port(
	RstB		: in	std_logic;
	Clk			: in	std_logic;
	
	SerDataIn	: in	std_logic;
	
	RxFfFull	: in	std_logic;
	RxFfWrData	: out	std_logic_vector( 7 downto 0 );
	RxFfWrEn	: out	std_logic
);
End Entity RxSerial;

Architecture rtl Of RxSerial Is

----------------------------------------------------------------------------------
-- Constant declaration
----------------------------------------------------------------------------------
	constant 	cbuadCnt	: integer :=868;

----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	
	signal 	rBuadCnt	: std_logic_vector(9 downto 0);
	signal 	rBuadEnd	: std_logic;
	signal 	rBuadMid	: std_logic;
	signal	rSerDataIn	: std_logic;
	signal 	rRxFfWrEn 	: std_logic;
	signal 	rDataCnt : std_logic_vector(3 downto 0);
	signal 	rRxFfWrData : std_logic_vector(9 downto 0);
	type SerStateType Is
		( stIdle, stStart, stRdData);
	signal rState : SerStateType;

Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------
	RxFfWrEn <= rRxFfWrEn;
	RxFfWrData(7 downto 0) <= rRxFfWrData(8 downto 1);
----------------------------------------------------------------------------------
-- DFF 
----------------------------------------------------------------------------------

	u_rSerDataIn : Process (Clk) Is
	Begin
		if ( rising_edge(Clk) ) then
			rSerDataIn		<= SerDataIn;
		end if;
	End Process u_rSerDataIn;

	u_rBuadCnt : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rBuadCnt(9 downto 0)	<= 	conv_std_logic_vector(cbuadCnt, 10);
			else
				if (rBuadCnt(9 downto 0)=1 or rState=stRdData) then
					rBuadCnt(9 downto 0)	<= conv_std_logic_vector(cbuadCnt, 10);
				else
					if (rState=stStart) then
						rBuadCnt(9 downto 0) <= rBuadCnt(9 downto 0) - 1;
					else
						rBuadCnt(9 downto 0)	<= rBuadCnt(9 downto 0);
					end if;
				end if;
			end if;
		end if;
	End Process u_rBuadCnt;

	u_rDataCnt : Process (Clk) Is
	Begin	
		if (rising_edge(Clk) ) then
			if (RstB='0') then
				rDataCnt(3 downto 0)	<= 	conv_std_logic_vector(0, 4);
			else
				if (rDataCnt=9) then
					if (rBuadCnt=1 or rState=stRdData) then
						rDataCnt(3 downto 0)	<= conv_std_logic_vector(0, 4);
					else
						rDataCnt(3 downto 0)	<= rDataCnt(3 downto 0);
					end if;
				else
					if (rBuadCnt=1) then
						rDataCnt(3 downto 0)	<= rDataCnt(3 downto 0)+1;
					else
						rDataCnt(3 downto 0)	<= rDataCnt(3 downto 0);
					end if;
				end if;
			end if;
		end if;
	End Process u_rDataCnt;
	
	u_rBuadEnd : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rBuadEnd	<= 	'0';
			else
				if (rBuadCnt=2) then
					rBuadEnd	<= '1';
				else
					rBuadEnd	<= '0';
				end if;
			end if;
		end if;
	End Process u_rBuadEnd;
	
	u_rBuadMid : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rBuadMid	<= 	'0';
			else
				if (rBuadCnt=434) then
					rBuadMid	<= '1';
				else
					rBuadMid	<= '0';
				end if;
			end if;
		end if;
	End Process u_rBuadMid;
	
	u_rState : Process(Clk) Is
	Begin
		if( rising_edge(Clk) ) then
			if (RstB = '0') then
				rState <= stIdle;
			else
				case (rState) Is
					when stIdle =>
						if(SerDataIn = '0') then
							rState <= stStart;
						else
							rState <= stIdle;
						end if;
					when stStart =>
						if (rDataCnt=9) then
							if (rBuadMid='1') then
								rState <= stRdData;
							else
								rState <= stStart;
							end if;
						else
							rState <= stStart;
						end if;
					when stRdData =>
						if (SerDataIn = '0') then
							rState <= stStart;
						else
							rState <= stIdle;
						end if;
				end case;
			end if;
		end if;
	End Process u_rState;
	
	u_rRxFfWrEn : Process (Clk) is
	Begin
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rRxFfWrEn <= '0';
			else
				if (rBuadMid='1' and rDataCnt=9 and SerDataIn='1' and RxFfFull='0' ) then
					rRxFfWrEn <= '1';
				else
					rRxFfWrEn <= '0';
				end if;
			end if;
		end if;
	End Process u_rRxFfWrEn;
	
	u_rRxFfWrData : Process (Clk) Is
	Begin	
		if (rising_edge(Clk)) then
			if (RstB='0') then
				rRxFfWrData (9 downto 0)	<= 	(others => '1');
			else
				if (rBuadMid='1') then
					rRxFfWrData(9) <= rSerDataIn;
					rRxFfWrData(8 downto 0) <= rRxFfWrData(9 downto 1);
				else
					rRxFfWrData (9 downto 0) <= rRxFfWrData(9 downto 0);
				end if;
			end if;
		end if;
	End Process u_rRxFfWrData;
	
End Architecture rtl;