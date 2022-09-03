-- 10. Extract - pilots younger than 30 years
SELECT s.`name`, s.manufacturer
FROM spaceships AS s
JOIN journeys AS j
ON s.id = j.spaceship_id
JOIN travel_cards AS tc
ON j.id = tc.journey_id
JOIN colonists AS c
ON c.id = tc.colonist_id
WHERE 2019 - year(c.birth_date) < 30 AND tc.job_during_journey = 'Pilot'
GROUP BY s.id
ORDER BY s.`name`;

-- 11. Extract all educational mission
SELECT p.`name`, s.`name`
FROM spaceports AS s
JOIN journeys AS j
ON s.id = j.destination_spaceport_id
JOIN planets AS p
ON p.id = s.planet_id
WHERE j.purpose = 'Educational'
ORDER BY s.`name` DESC;

-- 12. Extract all planets and their journey count
SELECT p.`name`, count(j.id) AS journeys_count
FROM planets AS p
JOIN spaceports AS s
ON p.id = s.planet_id
JOIN journeys AS j
ON s.id = j.destination_spaceport_id
GROUP BY p.`name`
ORDER BY journeys_count DESC, p.`name`;

-- 13. Extract the shortest journey
SELECT j.id, p.`name`, s.`name`, j.purpose
FROM planets AS p
JOIN spaceports AS s
ON p.id = s.planet_id
JOIN journeys AS j
ON s.id = j.destination_spaceport_id
ORDER BY j.journey_end - j.journey_start
LIMIT 1;

-- 14. Extract the less popular job
SELECT tc.job_during_journey
FROM travel_cards AS tc
JOIN journeys AS j
ON tc.journey_id = j.id
GROUP BY j.id, tc.job_during_journey
ORDER BY j.journey_end - j.journey_start DESC, count(tc.id)
LIMIT 1;
