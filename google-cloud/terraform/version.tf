terraform {
  required_providers {
    onepassword = {
      source  = "1Password/onepassword"
      version = "~> 2.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}
