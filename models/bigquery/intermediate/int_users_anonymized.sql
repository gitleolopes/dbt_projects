WITH bigquery AS (
    SELECT user_email FROM {{ ref('stg_bigquery') }}
)

SELECT 
    user_email
    ,{{anonymize("user_email")}} AS user_anonymized
FROM bigquery
GROUP BY ALL