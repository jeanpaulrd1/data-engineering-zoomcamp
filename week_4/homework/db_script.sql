CREATE OR REPLACE EXTERNAL TABLE `ny_taxi.external-fhv-2019-tripdata` 
(row_number_id INT64,
dispatching_base_num STRING,
pickup_datetime DATETIME,
dropOff_datetime DATETIME,
PUlocationID FLOAT64,
DOlocationID FLOAT64,
SR_Flag FLOAT64,
Affiliated_base_number STRING
)
OPTIONS (
  format = 'CSV',
  uris = ['gs://mage-zoomcamp-jp-295/fhv/*.csv'],
  skip_leading_rows=1
);

CREATE OR REPLACE TABLE `trips_data_all.fhv_tripdata` AS
SELECT dispatching_base_num,pickup_datetime,dropOff_datetime,CAST(PUlocationID AS INT64) as PUlocationID,
CAST(DOlocationID AS INT64) as DOlocationID,SR_Flag,Affiliated_base_number
FROM `airy-digit-410117.ny_taxi.external-fhv-2019-tripdata`;
