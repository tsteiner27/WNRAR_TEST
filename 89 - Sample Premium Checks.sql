/**************************************************************************\
PREMIUM CHECKS
\**************************************************************************/
-- State, Market
--Test from darren
SELECT A.*, B.MMBs, B.PMPBM
FROM
(
	SELECT [STATE], [MARKET]
		, MMBs = SUM([TOTAL BILLABLE MEMBER MONTHS])
		, PMPBM = SUM( [TOTAL PREMIUM] ) / SUM([TOTAL BILLABLE MEMBER MONTHS])
	FROM [D100SIM - WNRAR - 201604].[dbo].[MASTER_X_TBL02]
	WHERE METAL <> 'CATASTROPHIC' AND ISSUER <> 'Meritus AZ'
	GROUP BY [STATE], [MARKET]

) A
FULL JOIN
(
	SELECT [STATE], [MARKET]
		, MMBs = SUM([TOTAL BILLABLE MEMBER MONTHS])
		, PMPBM = SUM( [TOTAL PREMIUM] ) / SUM([TOTAL BILLABLE MEMBER MONTHS])
	FROM [D100SIM - WNRAR - 201607].[dbo].[MASTER_X_TBL02]
	WHERE METAL <> 'CATASTROPHIC'
	GROUP BY [STATE], [MARKET]
) B
ON A.[STATE] = B.[STATE] AND A.[MARKET] = B.[MARKET]
ORDER BY [State], [Market]