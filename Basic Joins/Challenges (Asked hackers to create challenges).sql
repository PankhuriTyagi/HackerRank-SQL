# Challenges (Asked hackers to create challenges) [with CTEs which don't work in Hackerrank]
WITH cte1 AS 
(SELECT h.hacker_id, COUNT(challenge_id) as challenges_created 
FROM hackers as h
JOIN challenges as c USING (hacker_id)),

cte2 AS
(SELECT COUNT(hacker_id) AS h_c, challenges_created
FROM cte1
GROUP BY challenges_created)

(SELECT h.hacker_id, challenges_created, h_c
FROM cte1
JOIN cte2 USING (challenges_created)
WHERE h_c = 1)
UNION
(SELECT h.hacker_id, challenges_created, h_c
FROM cte1
JOIN cte2 USING (challenges_created)
WHERE h_c > 1 and challenges_created IN (SELECT Max(challenges_created) FROM cte1)
);

#  Challenges (Asked hackers to create challenges)
SELECT f1.hacker_id, f1.name, f1.challenges_created
FROM
(SELECT f.hacker_id, f.name, f.challenges_created, hc.hacker_count,
        (SELECT MAX(mc1.challenges_created)
         FROM
            (SELECT h.hacker_id, COUNT(c.challenge_id) as challenges_created 
             FROM hackers as h
             JOIN challenges as c USING (hacker_id)
             GROUP BY h.hacker_id) as mc1) AS max_challenges
FROM
(SELECT      h.hacker_id, h.name, COUNT(c.challenge_id) as challenges_created
    FROM     hackers as h
    JOIN     challenges as c USING (hacker_id)
    GROUP BY h.hacker_id, h.name) AS f
JOIN 
(SELECT hc1.challenges_created, COUNT(hc1.hacker_id) AS hacker_count
             FROM
                (SELECT h.hacker_id, COUNT(c1.challenge_id) as challenges_created 
                 FROM hackers as h
                 JOIN challenges as c1 USING (hacker_id)
                 GROUP BY h.hacker_id) AS hc1
                 GROUP BY hc1.challenges_created ) as hc ON hc.challenges_created = f.challenges_created ) AS f1
WHERE (f1.hacker_count = 1) OR (f1.hacker_count > 1 AND f1.challenges_created = f1.max_challenges)
ORDER BY f1.challenges_created desc, f1.hacker_id;
