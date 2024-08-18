WITH balance_table AS (
    SELECT user_id,
        SUM(money) AS volume,
        currency_id,
        type
    FROM balance
    GROUP BY user_id,
        currency_id,
        type
    ORDER BY user_id
),
currency_table AS (
    SELECT id,
        name,
        MAX(rate_to_usd) AS rate_to_usd
    FROM currency
    GROUP BY id,
        name
),
name_by_balance_table AS (
    SELECT COALESCE("user".name, 'not defined') AS name,
        COALESCE("user".lastname, 'not defined') AS lastname,
        balance_table.type AS type,
        balance_table.volume AS volume,
        COALESCE(currency_table.name, 'not defined') AS currency_name,
        COALESCE(currency_table.rate_to_usd, 1) AS last_rate_to_usd,
        volume * COALESCE(currency_table.rate_to_usd, 1) AS total_volume_in_usd
    FROM balance_table
        FULL JOIN "user" ON "user".id = balance_table.user_id
        FULL JOIN currency_table ON currency_table.id = balance_table.currency_id
)
SELECT *
FROM name_by_balance_table
ORDER BY 1 DESC,
    2,
    3;