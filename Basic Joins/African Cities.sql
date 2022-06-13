SELECT ci.Name
FROM CITY as ci
JOIN country as co ON ci.countrycode = co.code
WHERE Co.continent = 'Africa';