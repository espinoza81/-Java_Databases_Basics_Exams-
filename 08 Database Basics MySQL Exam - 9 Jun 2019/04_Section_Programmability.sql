-- 10. Extract card's count
CREATE FUNCTION udf_client_cards_count(`name` VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE cards INT;
	SET cards := (
		SELECT count(ca.id)
		FROM clients AS c
		LEFT JOIN bank_accounts AS ba
		ON c.id = ba.client_id
		LEFT JOIN cards AS ca
		ON ba.id = ca.bank_account_id
        WHERE c.full_name = `name`);
  	RETURN cards;
END;

-- 11. Client Info
