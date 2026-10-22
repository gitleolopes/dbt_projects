{{
    config(
        partition_by = {
            'field' : 'creation_date',
            'data_type' : 'date',
            'granularity' : 'day'
        }
        ,cluster_by = [
            'project_id'
            ,'user_email'
            ,'manager_email'
        ]
    )
}}


WITH bq AS(
    SELECT * FROM {{ref("stg_bigquery")}}
)

,int_bigquery AS (
    SELECT * FROM {{ ref('int_bigquery_costs') }}
)

,manager AS(
    SELECT * FROM {{ ref('employees') }}
)

SELECT
    bq.job_id
    ,bq.user_email
    ,manager_email
    ,project_id
    ,CAST(creation_time AS DATE) AS creation_date
    ,total_tbytes_processed
    ,total_cost
    ,query
    ,statement_type
FROM bq
LEFT JOIN int_bigquery int_bq
ON bq.job_id = int_bq.job_id
LEFT JOIN manager
ON bq.user_email = manager.user_email
WHERE statement_type IS NULL OR statement_type != 'SCRIPT' 