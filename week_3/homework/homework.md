## Week 1 Homework
You can find the solution for the DE Zoomcamp week 3 homework just below.
#### Question 1

```sql
SELECT COUNT(*)
FROM `ny_taxi.green-tripdata_2022`;
```
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/57f79196-2142-4eb9-8a14-3306f2d0644a)

#### Question 2
```sql
SELECT COUNT(DISTINCT(PULocationID)) FROM `ny_taxi.external-green-tripdata`;
```
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/4d980a8d-e651-4a0f-a96e-ea263ee17789)

```sql
SELECT COUNT(DISTINCT(PULocationID)) FROM `ny_taxi.green-tripdata_2022`;
```
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/a3be94c6-e9f2-4049-80b7-2f91cf6d832d)


#### Question 3
```sql
SELECT COUNT(1) FROM `ny_taxi.green-tripdata_2022`
WHERE fare_amount = 0;
```
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/de7c92ca-482e-4c51-b2d5-af5f0a5cc72d)

#### Question 4
```sql
CREATE OR REPLACE TABLE `ny_taxi.green-tripdata_2022_partitoned_clustered` 
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PULocationID AS
SELECT * FROM `ny_taxi.green-tripdata_2022`;
```
#### Question 5 
```sql
SELECT DISTINCT(PULocationID)
FROM `ny_taxi.green-tripdata_2022_partitoned_clustered`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';
```
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/34dcaed9-84da-41bb-877e-c8e15070d395)

```sql
SELECT DISTINCT(PULocationID)
FROM `ny_taxi.green-tripdata_2022`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';
```
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/51793d00-1d1d-49da-97ab-7d00a0a05f27)


