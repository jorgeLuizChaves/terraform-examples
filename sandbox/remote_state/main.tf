provider "google" {
  project = "certificate-gcp"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

module "remote_state" {
  source = "github.com/jorgeLuizChaves/tf_remote_state.git"
  bucket_name = "state"
  prefix = "cert"
  environment = "sandbox"
}