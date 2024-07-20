terraform {
  required_version = ">= 1.5"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 5.22"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 2.1"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-cloud-storage/v6.0.1"
  }
}
