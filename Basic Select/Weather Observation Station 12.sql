SELECT DISTINCT CITY
FROM STATION
WHERE not substr(city,1,1) IN ('a','e','i','o','u') AND not substr(city,-1,1) IN ('a','e','i','o','u');