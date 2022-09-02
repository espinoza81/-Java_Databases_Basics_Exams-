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
