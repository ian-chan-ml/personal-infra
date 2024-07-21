terraform {
  backend "gcs" {
    bucket             = "quanianitis-terraform-state-backend"
    prefix             = "google-cloud/personal-website"
    kms_encryption_key = "projects/base-430103/locations/asia-southeast1/keyRings/infrastructure/cryptoKeys/terraform-backend"
  }
}

provider "onepassword" {
  account = "my.1password.com"
}

provider "google" {
  project = "personal-quanianitis"
  region  = "asia-southeast1"
}

