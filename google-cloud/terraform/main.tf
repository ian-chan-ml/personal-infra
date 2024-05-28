terraform {
  backend "gcs" {
    bucket             = "quanianitis-terraform-state-backend"
    prefix             = "google-cloud/terraform"
    kms_encryption_key = "projects/personal-quanianitis/locations/asia-southeast2/keyRings/infrastructure/cryptoKeys/quanianitis-terraform-backend-state"
  }
}

provider "onepassword" {
  account = "my.1password.com"
}

provider "google" {
  # credentials = data.onepassword_item.gcp_root.password
  project = "personal-quanianitis"
  region  = "asia-southeast1"
}
