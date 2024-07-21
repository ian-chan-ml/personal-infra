module "quanianitis_backup" {
  source     = "../../modules/gcp/gcs"
  project_id = data.google_client_config.current.project

  prefix = "quanianitis-backup"
  names  = ["image", "video", "files", "audio"]

  location      = "ASIA-SOUTHEAST1"
  storage_class = "ARCHIVE"

  set_admin_roles  = true
  set_viewer_roles = true
}
