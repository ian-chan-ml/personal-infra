resource "google_cloudbuild_trigger" "sendgrid_function_build" {
  name = "sendgrid-function-build"

  trigger_template {
    project_id = data.google_client_config.this.project
    bucket     = google_storage_bucket.sendgrid_function.name
    object     = google_storage_bucket_object.sendgrid_function.name
  }

  build {
    steps {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "build",
        "-t", "asia-southeast1-docker.pkg.dev/${data.google_client_config.this.project}/sendgrid/sendgrid:latest",
        "."
      ]
    }

    steps {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "push", "asia-southeast1-docker.pkg.dev/${data.google_client_config.this.project}/sendgrid/sendgrid:latest"
      ]
    }

    images = [
      "asia-southeast1-docker.pkg.dev/${data.google_client_config.this.project}/sendgrid/sendgrid:latest"
    ]
  }
}
