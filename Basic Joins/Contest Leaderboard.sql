# Contest Leaderboard
SELECT hacker_id, name, SUM(max_scores) AS total_scores
FROM
(SELECT h.hacker_id, h.name, s.challenge_id, MAX(s.score) AS max_scores
FROM hackers as h
JOIN submissions as s USING (hacker_id)
GROUP BY h.hacker_id, h.name, s.challenge_id) as f
GROUP BY hacker_id, name
HAVING total_scores <> 0
ORDER BY total_scores desc, hacker_id;