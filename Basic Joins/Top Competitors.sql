SELECT hacker_id, name
FROM
(SELECT hacker_id, name, SUM(full_score) AS total_wins
FROM
(select h.hacker_id, h.name, IF(d.score = s.score, 1, 0) AS full_score
FROM hackers as h
JOIN submissions AS s USING (hacker_id)
JOIN challenges as c USING (challenge_id)
JOIN difficulty AS d USING (difficulty_level)) AS ab
GROUP BY hacker_id, name
HAVING total_wins > 1
ORDER BY total_wins desc, hacker_id) AS abc;