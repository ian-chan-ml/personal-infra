module "sendgrid" {
  source  = "GoogleCloudPlatform/cloud-functions/google"
  version = ">= 0.5"

  project_id        = data.google_client_config.this.project
  function_location = data.google_client_config.this.region

  function_name = "sendgrid"
  description   = "SMTP server that forwards all outbound mails from quanianitis.com"

  runtime    = "go122"
  entrypoint = "sendgridHTTP"

  service_config = {
    available_memory = "128Mi"
    available_cpu    = "0.2"
    runtime_env_variables = {
      "SENDGRID_API_KEY" = data.onepassword_item.sendgrid_api_key.password
    }
  }

  storage_source = {
    bucket     = google_storage_bucket.sendgrid_function.name
    object     = google_storage_bucket_object.sendgrid_function.name
    generation = null
  }

  depends_on = [google_storage_bucket_object.sendgrid_function]
}
