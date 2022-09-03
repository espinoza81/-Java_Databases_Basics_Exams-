-- 04. Extract all travel cards
SELECT card_number, job_during_journey
FROM travel_cards
ORDER BY card_number;

-- 05. Extract all colonists
SELECT id, concat_ws(' ', first_name, last_name) AS full_name, ucn
FROM colonists
ORDER BY first_name, last_name, id;

-- 06. Extract all military journeys
SELECT id, journey_start, journey_end
FROM journeys
WHERE purpose = 'Military'
ORDER BY journey_start;

-- 07. Extract all pilots
SELECT c.id, concat_ws(' ', c.first_name, c.last_name) AS full_name
FROM colonists AS c
JOIN travel_cards AS tc
ON c.id = tc.colonist_id
WHERE tc.job_during_journey = 'Pilot'
ORDER BY c.id;

-- 08. Count all colonists
SELECT count(c.id)
FROM colonists AS c
JOIN travel_cards AS tc
ON c.id = tc.colonist_id
JOIN journeys AS j
ON tc.journey_id = j.id
WHERE j.purpose = 'Technical';

-- 09.Extract the fastest spaceship
SELECT s.`name`, sp.`name`
FROM spaceships AS s
JOIN journeys AS j
ON s.id = j.spaceship_id
JOIN spaceports AS sp
ON j.destination_spaceport_id = sp.id
ORDER BY s.light_speed_rate DESC
LIMIT 1;

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
