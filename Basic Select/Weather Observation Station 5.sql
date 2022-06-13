select city, LENGTH(city) AS city_len
FROM station
ORDER BY city_len, city 
limit 1;

select city, LENGTH(city) AS city_len
FROM station
ORDER BY city_len desc, city 
limit 1;