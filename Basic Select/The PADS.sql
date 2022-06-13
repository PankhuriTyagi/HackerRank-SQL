select CONCAT(Name,'(',SUBSTR(Occupation,1,1),')')
from occupations
order by Name;


SELECT CONCAT('There are a total of ', cnt, ' ', lower(Occupation),'s.')
FROM
(SELECT COUNT(Name) AS cnt, Occupation
FROM occupations
GROUP BY Occupation) AS a
ORDER BY cnt, Occupation;