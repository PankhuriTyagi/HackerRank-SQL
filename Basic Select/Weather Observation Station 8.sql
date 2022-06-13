SELECT DISTINCT CITY
FROM STATION
where substr(city,1,1) IN ('a','e','i','o','u') AND substr(city,-1,1) IN ('a','e','i','o','u');