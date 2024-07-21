terraform {
  backend "gcs" {
    bucket             = "quanianitis-terraform-state-backend"
    prefix             = "google-cloudp/personal-vault"
    kms_encryption_key = "projects/base-430103/locations/asia-southeast1/keyRings/infrastructure/cryptoKeys/terraform-backend"
  }
}

provider "onepassword" {
  account = "my.1password.com"
}

provider "google" {
  project = "personal-vault"
  region  = "asia-southeast1"
}

