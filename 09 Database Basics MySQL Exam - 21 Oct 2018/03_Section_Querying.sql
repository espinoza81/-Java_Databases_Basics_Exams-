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
