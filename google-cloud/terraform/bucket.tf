resource "google_storage_bucket" "quanianitis_terraform_state_backend" {
  name = "quanianitis-terraform-state-backend"

  location      = "ASIA-SOUTHEAST2"
  storage_class = "STANDARD"

  force_destroy = false
  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = module.infrastructure.keys.quanianitis-terraform-backend-state
  }
}
