resource "google_storage_bucket" "quanianitis_terraform_state_backend" {
  name    = "quanianitis-terraform-state-backend"
  project = data.google_client_config.current.project

  location      = "ASIA-SOUTHEAST1"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = module.infrastructure.keys.terraform-backend
  }
}
