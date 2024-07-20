terraform {
  backend "gcs" {
    bucket             = "quanianitis-terraform-state-backend"
    prefix             = "google-cloud/quanianitis.com"
    kms_encryption_key = "projects/personal-quanianitis/locations/asia-southeast2/keyRings/infrastructure/cryptoKeys/quanianitis-terraform-backend-state"
  }
}

provider "onepassword" {
  account = "my.1password.com"
}

provider "google" {
  project = "personal-quanianitis"
  region  = "asia-southeast1"
}

