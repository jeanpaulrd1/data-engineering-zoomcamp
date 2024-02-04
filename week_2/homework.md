You can find the solution for the DE Zoomcamp week 2 homework just below.
#### Question 1
266 855 rows x 20 columns
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/85fd73de-ee88-4c32-b073-3a5d0c4badf1)
#### Question 2
139 370 rows
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/3e94c80e-e489-4a69-a89f-0ea824635bd9)
#### Question 3
```python
data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date
```
#### Question 4
1 or 2 possible vendor_id values
![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/1d79d2ff-135e-4a00-b905-b42337175ffe)

#### Question 5
4 Transformations
```python
data = data.rename(columns={"VendorID": "vendor_id", "RatecodeID": "rate_code_id", "PULocationID":"pu_location_id", "DOLocationID":"do_location_id"})
```
#### Question 6
Total partitions: 95 folders

![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/52d67851-d473-4585-bdcc-71ddeea36951)

![image](https://github.com/jeanpaulrd1/data-engineering-zoomcamp/assets/19482586/f42fc1b4-6f8a-4348-869a-75550be12bc2)
