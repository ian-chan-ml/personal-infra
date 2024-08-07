module "staging_quanianitis_com" {
  source = "../../../modules/gcp/gcs_website"

  name       = "staging.quanianitis.com"
  project_id = data.google_client_config.current.project

  location = "ASIA-SOUTHEAST1"

  versioning = true

  set_admin_roles     = true
  set_viewer_roles    = true
  allow_public_access = true

  website = {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  cors = [{
    origin          = ["https://staging.quanianitis.com"]
    method          = ["GET", "HEAD", "OPTIONS"]
    response_header = ["Content-Type"]
    max_age_seconds = 3600
  }]
}

module "quanianitis_com" {
  source = "../../../modules/gcp/gcs_website"

  name       = "quanianitis.com"
  project_id = data.google_client_config.current.project

  location = "ASIA"
  custom_placement_config = {
    data_locations : ["ASIA-SOUTHEAST1", "ASIA-EAST1"]
  }

  versioning = true

  set_admin_roles     = true
  set_viewer_roles    = true
  allow_public_access = true

  website = {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  cors = [{
    origin          = ["https://quanianitis.com", "https://www.quanianitis.com"]
    method          = ["GET", "HEAD", "OPTIONS"]
    response_header = ["Content-Type"]
    max_age_seconds = 3600
  }]
}

