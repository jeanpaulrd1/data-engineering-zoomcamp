if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    data = data[(data['passenger_count'] > 0) & (data['trip_distance'] > 0)]
    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date
    data = data.rename(columns={"VendorID": "vendor_id", "RatecodeID": "rate_code_id", "PULocationID":"pu_location_id", "DOLocationID":"do_location_id"})
    vendor_id_distinct = data['vendor_id'].unique().tolist()
    print(f'Different vendor_id values: {vendor_id_distinct}')
    return data

@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output['vendor_id'].isin([1,2]).all(), 'vendor_id should be 1 or 2.'
    assert (output['passenger_count'] > 0).all(), 'passenger_count should be greater than 0.'
    assert (output['trip_distance'] > 0).all(), 'trip_distance should be greater than 0.'
