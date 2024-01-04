terraform {
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "5.6.0"
      }
    }
}

provider "google" {
    project = "airy-digit-410117"
    region = "us-central1"
}

resource "google_storage_bucket" "data-lake-bucket" {
  name          = "data-lake-bucket-410117"
  location      = "US"

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30  // days
    }
  }

  force_destroy = true
}


/*resource "google_bigquery_dataset" "dataset" {
  dataset_id = "data-lake-bucket-410117"
  project    = "airy-digit-410117"
  location   = "US"
}*/