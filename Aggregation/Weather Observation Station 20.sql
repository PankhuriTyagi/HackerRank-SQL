# Weather Observation Station 20

SET @r = 0;
SELECT COUNT(*) FROM STATION INTO @total;

SELECT ROUND(LAT_N,4)
FROM
(SELECT (@r := @r + 1) AS r, LAT_N 
FROM Station 
ORDER BY LAT_N) AS r1
WHERE CASE WHEN MOD(@total,2) = 0
           THEN r IN (@total/2, @total/2+1)
           ELSE r IN (CEIL(@total/2))
	  END;