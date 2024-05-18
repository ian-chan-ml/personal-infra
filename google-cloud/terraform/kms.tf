module "infrastructure" {
  source  = "terraform-google-modules/kms/google"
  version = "~> 2.0"

  project_id = "personal-quanianitis"
  location   = "asia-southeast2"

  keyring = "infrastructure"
  keys    = ["quanianitis-terraform-backend-state"]

  set_owners_for = ["quanianitis-terraform-backend-state"]
  owners         = ["allAuthenticatedUsers"]
}

