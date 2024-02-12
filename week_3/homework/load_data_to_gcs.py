
import os
import requests
import pandas as pd
from google.cloud import storage
import pyarrow.parquet as pq
from io import BytesIO


url = 'https://d37ci6vzurychx.cloudfront.net/trip-data/'

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "./keys/my-creds.json" 

bucket_name = 'mage-zoomcamp-jp-295'
project_id = 'airy-digit-410117'

def load_parquet_to_gcs(bucket_name, blob_name, parquet_file):
  gs_client = storage.Client()
  bucket = gs_client.get_bucket(bucket_name)
  blob = bucket.blob(blob_name)
  with BytesIO() as buffer:
      pq.write_table(parquet_file, buffer)
      buffer.seek(0)
      blob.upload_from_file(buffer, content_type='application/octet-stream')

def url_to_gcs(year, service):
    for i in range(12):
        month = '0'+str(i+1)
        month = month[-2:]

        file_name = f"{service}_tripdata_{year}-{month}.parquet"
        parquet_url =  f"{url}{file_name}"

        response = requests.get(parquet_url)
        parquet_data = BytesIO(response.content)
        parquet_file = pq.read_table(parquet_data)

        load_parquet_to_gcs(bucket_name, f"{service}/{file_name}", parquet_file)

url_to_gcs('2022', 'green')