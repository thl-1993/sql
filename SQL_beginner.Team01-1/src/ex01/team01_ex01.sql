insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');
WITH user_table AS (
    SELECT COALESCE("user".name, 'not defined') AS name,
        COALESCE("user".lastname, 'not defined') AS lastname,
        balance.currency_id,
        balance.money,
        COALESCE(
            (
                SELECT rate_to_usd
                FROM currency AS c
                WHERE c.id = balance.currency_id
                    AND c.updated < balance.updated
                ORDER BY c.updated DESC
                LIMIT 1
            ), (
                SELECT rate_to_usd
                FROM currency AS c
                WHERE c.id = balance.currency_id
                    AND c.updated >= balance.updated
                ORDER BY c.updated ASC
                LIMIT 1
            )
        ) AS rate
    FROM "user"
        FULL JOIN balance ON "user".id = balance.user_id
),
currency_table AS (
    SELECT DISTINCT id,
        name
    FROM currency
)
SELECT user_table.name,
    user_table.lastname,
    currency_table.name AS currency_name,
    money * rate AS currency_in_currency_table
FROM user_table
    JOIN currency_table ON currency_id = currency_table.id
ORDER BY user_table.name DESC,
    user_table.lastname ASC,
    currency_table.name ASC;