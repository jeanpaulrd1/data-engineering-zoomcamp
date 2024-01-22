-- Question 3
SELECT COUNT(1) 
FROM public.green_taxi_trips
WHERE lpep_pickup_datetime::date = '2019-09-18'
AND lpep_dropoff_datetime::date = '2019-09-18';

-- Question 4
SELECT lpep_pickup_datetime::date,MAX(trip_distance)
FROM public.green_taxi_trips
group by lpep_pickup_datetime::date
order by 2 desc
limit 1;

-- Question 5
SELECT z."Borough", SUM(total_amount)
FROM public.green_taxi_trips gtt
JOIN public.zones z on gtt."PULocationID" = z."LocationID"
WHERE lpep_pickup_datetime::date = '2019-09-18'
AND z."Borough" != 'Unknown'
GROUP BY z."Borough"
HAVING SUM(total_amount)> 50000
ORDER BY 2 DESC
LIMIT 3;

-- Question 6
SELECT tip_amount, d."Zone"
FROM public.green_taxi_trips gtt
JOIN public.zones z on gtt."PULocationID" = z."LocationID"
JOIN public.zones d on gtt."DOLocationID" = d."LocationID"
WHERE lpep_pickup_datetime::date >= '2019-09-01' and lpep_pickup_datetime::date <= '2019-09-30'
AND z."Zone" = 'Astoria'
ORDER BY 1 DESC
LIMIT 1;