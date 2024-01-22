## Week 1 Homework
You can find the solution for the DE Zoomcamp week 1 homework just below.
#### Question 1
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/0f732c83-8260-4dbd-8c0b-aaf03f7d8859)
#### Question 2
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/ffdf9887-8c7f-44ab-b49d-45dbbdaf0a33)
#### Question 3
```sql
SELECT COUNT(1) 
FROM public.green_taxi_trips
WHERE lpep_pickup_datetime::date = '2019-09-18'
AND lpep_dropoff_datetime::date = '2019-09-18';
```
#### Question 4
```sql
SELECT lpep_pickup_datetime::date,MAX(trip_distance)
FROM public.green_taxi_trips
group by lpep_pickup_datetime::date
order by 2 desc
limit 1;
```
#### Question 5
```sql
SELECT z."Borough", SUM(total_amount)
FROM public.green_taxi_trips gtt
JOIN public.zones z on gtt."PULocationID" = z."LocationID"
WHERE lpep_pickup_datetime::date = '2019-09-18'
AND z."Borough" != 'Unknown'
GROUP BY z."Borough"
HAVING SUM(total_amount)> 50000
ORDER BY 2 DESC
LIMIT 3;
```
#### Question 6
```sql
SELECT tip_amount, d."Zone"
FROM public.green_taxi_trips gtt
JOIN public.zones z on gtt."PULocationID" = z."LocationID"
JOIN public.zones d on gtt."DOLocationID" = d."LocationID"
WHERE lpep_pickup_datetime::date >= '2019-09-01' and lpep_pickup_datetime::date <= '2019-09-30'
AND z."Zone" = 'Astoria'
ORDER BY 1 DESC
LIMIT 1;
```
#### Question 7
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/1a53b062-bb4b-4bb9-b183-629d4b97ad41)
