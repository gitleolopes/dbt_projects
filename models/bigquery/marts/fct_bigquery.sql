{{
    config(
        partition_by = {
            'field' : 'creation_date',
            'data_type' : 'date',
            'granularity' : 'day'
        }
        ,cluster_by = [
            'project_id'
        ]
    )
}}


WITH bq AS(
    SELECT * FROM {{ref("stg_bigquery")}}
)

SELECT
    job_id
    ,user_email
    ,project_id
    ,CAST(creation_time AS DATE) AS creation_date
    ,query
    ,total_bytes_processed
    ,CAST(total_bytes_processed*50/POWER(1024, 4) AS NUMERIC) AS total_tbytes_processed
    ,CAST((total_bytes_processed*50/POWER(1024, 4))*6.25 AS NUMERIC) AS total_cost
    ,statement_type
FROM bq
WHERE statement_type IS NULL OR statement_type != 'SCRIPT' 