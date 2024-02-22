{{ config(materialized='view') }}
 
  select *
  from {{ source('staging','fhv_tripdata') }}
  where EXTRACT(YEAR FROM pickup_datetime) = 2019 

{% if var('is_test_run', default=false) %}

  limit 100

{% endif %}