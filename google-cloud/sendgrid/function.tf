module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  version = ">= 0.1"

  project_id = data.google_client_config.this.project
  location   = data.google_client_config.this.region

  service_name = "sendgrid"
  image        = "us-docker.pkg.dev/cloudrun/container/hello"

  env_vars = data.onepassword_item.sendgrid_api_key.password

  service_account_email = module.service_account.email

  limits = {
    memory = "256Mi"
  }
  requests = {
    memory = "256Mi"
    cpu    = "0.2"
  }
}

// TODO: Add custom domain name
