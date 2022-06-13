select distinct city
from station
where not substr(city,-1,1) IN ('a','e','i','o','u');