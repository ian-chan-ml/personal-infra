module "quanianitis_backup" {
  source = "../../modules/gcp/gcs"

  prefix  "quanianitis-backup"
  names = ["image", "video", "files", "audio"]

  location = "ASIA-SOUTHEAST1"
  storage_class = "NEARLINE"

  autoclass = {
    "image" = true,
    "video" = true,
    "files" = true,
    "audio" = true,
  }

  set_admin_roles = true
  set_viewer_roles = true
}