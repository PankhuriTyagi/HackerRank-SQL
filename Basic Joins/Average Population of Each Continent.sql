SELECT co.continent, FLOOR(AVG(ci.population))
FROM CITY as ci
JOIN country as co ON ci.countrycode = co.code
GROUP BY co.continent;