SELECT * FROM {{ ref('int_bigquery_costs') }}
WHERE total_bytes_processed <= 0