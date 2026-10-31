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

WITH bigquery_data AS(
    SELECT * FROM {{ ref('int_bigquery_eligible_jobs') }}
)

,int_bigquery AS (
    SELECT * FROM {{ ref('int_bigquery_costs') }}
)

,int_users AS(
    SELECT * FROM {{ ref('int_users_anonymized') }}
)

SELECT CAST(creation_time AS DATE) AS creation_date
,project_id
,user_anonymized
,COUNT(DISTINCT bq.job_id) AS qtd_jobs
,SUM(total_tbytes_processed) AS total_tbytes_processed
,SUM(total_cost) AS total_cost
FROM bigquery_data bq
LEFT JOIN int_users
ON bq.user_email = int_users.user_email
LEFT JOIN int_bigquery int_bq
ON bq.job_id = int_bq.job_id
GROUP BY ALL
