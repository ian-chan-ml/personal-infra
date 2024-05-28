module "sendgrid" {
  source  = "GoogleCloudPlatform/artifact-registry/google"
  version = ">= 0.1"

  project_id = data.google_client_config.this.project
  location   = data.google_client_config.this.region

  format        = "DOCKER"
  repository_id = "sendgrid"
}
