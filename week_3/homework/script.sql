CREATE OR REPLACE EXTERNAL TABLE `ny_taxi.external-green-tripdata` 
(VendorID INT64,
lpep_pickup_datetime DATETIME,
lpep_dropoff_datetime DATETIME,
store_and_fwd_flag STRING,
RatecodeID FLOAT64,
PULocationID INT64,
DOLocationID INT64,
passenger_count FLOAT64,
trip_distance FLOAT64,
fare_amount FLOAT64,
extra FLOAT64,
mta_tax FLOAT64,
tip_amount FLOAT64,
tolls_amount FLOAT64,
ehail_fee INT64,
improvement_surcharge FLOAT64,
total_amount FLOAT64,
payment_type FLOAT64,
trip_type FLOAT64,
congestion_surcharge FLOAT64
)
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://mage-zoomcamp-jp-295/green/*.parquet']
);

CREATE OR REPLACE TABLE `ny_taxi.green-tripdata_2022` AS
SELECT * FROM `ny_taxi.external-green-tripdata`;