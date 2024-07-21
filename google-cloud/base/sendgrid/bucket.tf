resource "google_storage_bucket" "sendgrid_function" {
  name    = "sendgrid-function"
  project = data.google_client_config.current.project

  location      = "ASIA-SOUTHEAST2"
  storage_class = "STANDARD"

  force_destroy = false
  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

data "archive_file" "sendgrid_function" {
  type        = "zip"
  output_path = "${path.module}/src/sendgrid.zip"
  source_dir  = "${path.module}/src/"
}

resource "google_storage_bucket_object" "sendgrid_function" {
  name   = "sendgrid.zip"
  bucket = google_storage_bucket.sendgrid_function.name
  source = data.archive_file.sendgrid_function.output_path
}
