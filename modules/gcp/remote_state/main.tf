terraform {
  backend "gcs" {
    bucket  = "${var.prefix}-${var.bucket_name}-${var.environment}"
    prefix  = "${var.prefix}"
  }
}

resource "google_storage_bucket" "remote_state" {
  name          = "${var.prefix}-${var.bucket_name}-${var.environment}"
  location      = "US"
  force_destroy = false
  bucket_policy_only = true
}

output "name" {
  value = google_storage_bucket.remote_state.name
}