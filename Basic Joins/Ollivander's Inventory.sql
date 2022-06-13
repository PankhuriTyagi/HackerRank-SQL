# Ollivander's Inventory
SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands AS w
JOIN wands_property AS wp on w.code = wp.code
WHERE wp.is_evil = 0 
AND w.coins_needed IN 
    (SELECT MIN(coins_needed) 
     FROM wands as w2 
     WHERE w2.code = w.code AND w.power = w2.power)
ORDER BY w.power desc, wp.age desc;
