module "service_account" {
  source  = "terraform-google-modules/service-accounts/google"
  version = ">= 4.0"

  project_id = data.google_client_config.this.project

  names  = ["sendgrid"]
  prefix = "sa-cloud-run"
}
