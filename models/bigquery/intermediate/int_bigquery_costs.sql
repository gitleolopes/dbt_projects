WITH bigquery AS(
    SELECT job_id
    ,total_bytes_processed
    FROM {{ ref('stg_bigquery') }}
)

SELECT job_id
,total_bytes_processed
,CAST((total_bytes_processed*50)/POWER(1024,4) AS NUMERIC) AS total_tbytes_processed
,CAST(((total_bytes_processed*50)/POWER(1024,4))*6.25 AS NUMERIC) AS total_cost
FROM bigquery
