locals {
  name_set = replace(var.name, ".", "-")
}

resource "google_storage_bucket" "bucket" {
  name                     = var.name
  project                  = var.project_id
  location                 = var.location
  storage_class            = var.storage_class
  labels                   = merge(var.labels, { name = local.name_set })
  public_access_prevention = var.public_access_prevention

  force_destroy               = var.force_destroy
  uniform_bucket_level_access = coalesce(var.bucket_policy_only, true)

  versioning {
    enabled = var.versioning
  }

  default_event_based_hold = coalesce(var.default_event_based_hold, false)

  dynamic "cors" {
    for_each = var.cors
    content {
      origin          = lookup(cors.value, "origin", null)
      method          = lookup(cors.value, "method", null)
      response_header = lookup(cors.value, "response_header", null)
      max_age_seconds = lookup(cors.value, "max_age_seconds", null)
    }
  }

  dynamic "website" {
    for_each = length(keys(var.website)) == 0 ? [] : [var.website]
    content {
      main_page_suffix = lookup(website.value, "main_page_suffix", null)
      not_found_page   = lookup(website.value, "not_found_page", null)
    }
  }

  dynamic "custom_placement_config" {
    for_each = var.custom_placement_config != {} ? [var.custom_placement_config] : []
    content {
      data_locations = lookup(custom_placement_config.value, "data_locations", null)
    }
  }

  dynamic "soft_delete_policy" {
    for_each = [lookup(var.soft_delete_policy, local.name_set, { retention_duration_seconds = null })]
    content {
      retention_duration_seconds = lookup(soft_delete_policy.value, "retention_duration_seconds", null)
    }
  }
}

resource "google_storage_bucket_iam_binding" "admins" {
  for_each = var.set_admin_roles ? toset([var.name]) : []
  bucket   = google_storage_bucket.bucket.name
  role     = "roles/storage.objectAdmin"
  members  = compact(concat(var.admins, split(",", lookup(var.bucket_admins, local.name_set, ""))))
}

resource "google_storage_bucket_iam_binding" "viewers" {
  for_each = var.set_viewer_roles ? toset([var.name]) : []
  bucket   = google_storage_bucket.bucket.name
  role     = "roles/storage.objectViewer"
  members = compact(
    concat(
      var.viewers,
    ),
  )
}
