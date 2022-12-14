-- 01. Insert
INSERT INTO travel_cards (card_number, job_during_journey, colonist_id, journey_id)
SELECT IF(birth_date >= '1980-01-01', concat(year(birth_date), day(birth_date), left(ucn, 4)), concat(year(birth_date), month(birth_date), right(ucn, 4))) AS card_number,
	CASE
		WHEN id % 2 = 0 THEN 'Pilot'
		WHEN id % 3 = 0 THEN 'Cook'
        ELSE 'Engineer'        
    END AS job_during_journey,
    id,
    left(ucn, 1) AS journey_id
FROM colonists
WHERE id BETWEEN 96 AND 100;

-- 02. Update
UPDATE journeys
SET purpose = 
	CASE
		WHEN id % 2 = 0 THEN 'Medical'
		WHEN id % 3 = 0 THEN 'Technical'
		WHEN id % 5 = 0 THEN 'Educational'
		WHEN id % 7 = 0 THEN 'Military'
    END
WHERE id % 2 = 0 OR id % 3 = 0 OR id % 5 = 0 OR id % 7 = 0;

-- 03. Delete
DELETE c
FROM colonists AS c
LEFT JOIN travel_cards AS tc
ON tc.colonist_id = c.id
WHERE tc.colonist_id IS NULL;
