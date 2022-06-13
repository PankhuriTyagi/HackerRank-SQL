select distinct CITY
from station
WHERE MOD(ID,2) = 0;