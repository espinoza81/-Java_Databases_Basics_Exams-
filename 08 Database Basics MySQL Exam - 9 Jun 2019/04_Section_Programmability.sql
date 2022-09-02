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
CREATE PROCEDURE udp_clientinfo (full_name VARCHAR(50))
BEGIN
	SELECT c.full_name, c.age, ba.account_number, concat('$', ba.balance) AS balance
    FROM clients AS c
	JOIN bank_accounts AS ba
	ON c.id = ba.client_id
	WHERE c.full_name = full_name;
END
