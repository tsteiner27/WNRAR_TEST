/**************************************************************************\
STANDARD LOADING AND PROCESSING
\**************************************************************************/
USE [D100SIM - WNRAR - 201607]

/**************************************************************************\
Description:	Load Outsum submission for BCBSTN
Author:			Erol 05/19/2016
Checker:		*** MATT TO CHECK ***
\**************************************************************************/
GO
	DECLARE  @LastYearRun VARCHAR (50),@Year VARCHAR(10), @PremiumLoad VARCHAR(6), @NumGRP2 VARCHAR(6), @OutSumRows VARCHAR(50), @99_PremRcvdDATE VARCHAR(6), @PremRows VARCHAR(50), @NOTE VARCHAR(200), @DemoFileName VARCHAR(50), @APTC VARCHAR(50), @Claim_Filter VARCHAR(50), @IssuerName VARCHAR(50), @PremVersion VARCHAR(50), @RcvdDate VARCHAR(50), @Version VARCHAR(50), @FileName VARCHAR(50), @CheckingVersion VARCHAR(50), @PRVersion VARCHAR(50), @CurrentRun VARCHAR(50), @PriorRun VARCHAR(50), @RunScenario VARCHAR(50), @cmd VARCHAR(8000), @Checkingfile_Version VARCHAR(50), @RunVersion VARCHAR(8), @XMLScenario VARCHAR(8), @RATEEVersion VARCHAR(8), @XML_ELIG_VRSN VARCHAR(8), @XML_DX_VRSN VARCHAR(8), @RATEE_SUMMARY VARCHAR(8)
	SET @RunVersion		= '607'		-- Declares the run. || 512R || 604 || Both
	SET @RunScenario	= '1'		-- Which Queries do you want to run? || 1 Everything || 2 Out_Sum & Checks || 3 Premium & Checks || 4 Check Submission and Select Checking ||
	SET @PremiumLoad	= '1'		-- Are premiums hand filled? || 1 OutSum || 2 Hand-filled ||
	--------------------------------------------------------------------------------------------------
	SET @XMLScenario	= '0'		-- || RATEE (0 or 1) ||
	SET @RATEEVersion	= '01'		-- Version of RATEE file [R_IssuerName_VERSION]
	--------------------------------------------------------------------------------------------------
	SET @IssuerName		= 'BlueCross BlueShield of Tennessee'     SET @APTC = 'Y'
	SET @FileName		= 'OUT_SUM_607_XSG_01.txt'
	SET @Version		= 'SG_01'
	SET @DemoFileName	= '.txt'
	SET @PremVersion	= '01'						-- Should be updated EVERY time, even when premium is in OUT_SUM
		IF CHARINDEX('_', @Version) = 0 SET @Checkingfile_Version=''
		ELSE SET @Checkingfile_Version = '_' + @PRVersion  -- Can manually modify this as desired. ie '01_AA'
	SET @PRVersion		= '99'
	SET @PriorRun		= '201604'
	SET @LastYearRun    = '201512R'
		:r "I:\Z028 - Wakely National Simulation\2016\Work Files\Run_201607\SQL\99z_00y_Query Tree.sql"
GO