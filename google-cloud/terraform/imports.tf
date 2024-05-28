import {
  id = "114204026619/quanianitis-terraform-state-backend"
  to = google_storage_bucket.quanianitis_terraform_state_backend
}

import {
  id = "asia-southeast2/infrastructure/quanianitis-terraform-backend-state roles/owner"
  to = module.infrastructure.google_kms_crypto_key_iam_binding.owners[0]
}

import {
  id = "asia-southeast2/infrastructure/quanianitis-terraform-backend-state"
  to = module.infrastructure.google_kms_crypto_key.key[0]
}

import {
  id = "asia-southeast2/infrastructure"
  to = module.infrastructure.google_kms_key_ring.key_ring
}
