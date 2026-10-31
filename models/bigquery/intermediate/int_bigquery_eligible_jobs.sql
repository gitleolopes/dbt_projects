WITH bigquery_eligible_jobs AS (
    SELECT * FROM {{ ref('stg_bigquery') }}
)

SELECT
  job_id
  ,user_email
  ,project_id
  ,creation_time
  ,start_time
  ,end_time
  ,job_type
  ,statement_type
  ,query
  ,total_bytes_processed
  ,total_bytes_billed
  ,slot_ms
  ,cache_hit
  ,state
FROM bigquery_eligible_jobs
WHERE statement_type IS NULL OR statement_type != 'SCRIPT' 