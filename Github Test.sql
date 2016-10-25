
SELECT Number * 20, Test + 'ing', Other
FROM (
	 SELECT 5 * 4 AS [Number], 'Test' AS [Test], NULL AS [Other]
	 ) t1
