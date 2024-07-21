locals {
  key_name            = "terraform-backend"
  gcs_service_account = "serviceAccount:service-36199757077@gs-project-accounts.iam.gserviceaccount.com"
}

module "infrastructure" {
  source  = "terraform-google-modules/kms/google"
  version = "~> 2.0"

  project_id = data.google_client_config.current.project
  location   = "asia-southeast1"

  keyring = "infrastructure"
  keys    = ["terraform-backend"]

  set_owners_for     = [local.key_name]
  set_decrypters_for = [local.key_name]
  set_encrypters_for = [local.key_name]

  owners     = [local.gcs_service_account]
  decrypters = [local.gcs_service_account]
  encrypters = [local.gcs_service_account]


  prevent_destroy = false
}

