import io
import os
import requests
import pandas as pd
from google.cloud import storage

init_url = 'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/'


# https://github.com/DataTalksClub/nyc-tlc-data/releases/download/fhv/fhv_tripdata_2019-01.csv.gz

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/airy-digit-410117-ca54f0839171.json"

bucket_name = 'mage-zoomcamp-jp-295'
project_id = 'airy-digit-410117'


def upload_to_gcs(bucket, object_name, local_file):
    client = storage.Client()
    bucket = client.bucket(bucket)
    blob = bucket.blob(object_name)
    blob.upload_from_filename(local_file)


def web_to_gcs(year, service):
    for i in range(12):
        
        # sets the month part of the file_name string
        month = '0'+str(i+1)
        month = month[-2:]

        # csv file_name
        file_name = f"{service}_tripdata_{year}-{month}.csv.gz"

        # download it using requests via a pandas df
        request_url = f"{init_url}{service}/{file_name}"
        print(f"URL: {request_url}")
        r = requests.get(request_url)
        open(file_name, 'wb').write(r.content)
        print(f"Local: {file_name}")

        # read it back into a parquet file
        df = pd.read_csv(file_name, compression='gzip')
        file_name = file_name.replace('.csv.gz', '.csv')
        df.to_csv(file_name)
        print(f"CSV: {file_name}")

        # upload it to gcs 
        upload_to_gcs(bucket_name, f"{service}/{file_name}", file_name)
        print(f"GCS: {service}/{file_name}")


web_to_gcs('2019', 'fhv')