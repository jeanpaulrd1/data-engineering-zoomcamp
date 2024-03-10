-- Question 1
CREATE MATERIALIZED VIEW vw_taxi_trips_avg_min_max AS
SELECT
  tz1.zone AS pickup_zone
  ,tz2.zone AS dropoff_zone
  ,AVG(td.tpep_dropoff_datetime - td.tpep_pickup_datetime) AS trip_time_avg
  ,MIN(td.tpep_dropoff_datetime - td.tpep_pickup_datetime) AS trip_time_min
  ,MAX(td.tpep_dropoff_datetime - td.tpep_pickup_datetime) AS trip_time_max
FROM trip_data td 
JOIN taxi_zone tz1 ON td.pulocationid = tz1.location_id
JOIN taxi_zone tz2 ON td.dolocationid = tz2.location_id
GROUP by tz1.zone, tz2.zone;

SELECT
  pickup_zone
  ,dropoff_zone
  ,trip_time_avg
FROM vw_taxi_trips_avg_min_max
ORDER BY trip_time_avg DESC
LIMIT 1;

-- Question 2
CREATE MATERIALIZED VIEW vw_taxi_trips_count AS
SELECT
  tz1.zone AS pickup_zone
  ,tz2.zone AS dropoff_zone
  ,AVG(td.tpep_dropoff_datetime - td.tpep_pickup_datetime) AS trip_time_avg
  ,COUNT(1) as trip_count
FROM trip_data td 
JOIN taxi_zone tz1 ON td.pulocationid = tz1.location_id
JOIN taxi_zone tz2 ON td.dolocationid = tz2.location_id
GROUP BY tz1.zone, tz2.zone;
  
 
 SELECT
  pickup_zone
  ,dropoff_zone
  ,trip_count
FROM vw_taxi_trips_count
ORDER BY trip_time_avg DESC
LIMIT 1;

WITH max_pickup_date AS (
  SELECT MAX(tpep_pickup_datetime) max_date 
  FROM trip_data
)

-- Question 3
SELECT 
  tz.zone as pickup_zone
  ,count(*) as trip_count
FROM trip_data td
JOIN taxi_zone tz ON td.pulocationid = tz.location_id
WHERE td.tpep_pickup_datetime <= (SELECT max_date FROM max_pickup_date)
  AND td.tpep_pickup_datetime >= (SELECT max_date-interval '17 hours' FROM max_pickup_date)
GROUP BY pickup_zone
ORDER BY trip_count DESC
LIMIT 3;