SELECT DISTINCT CITY
FROM STATION
WHERE substr(city,-1,1) IN ('a','e','i','o','u');