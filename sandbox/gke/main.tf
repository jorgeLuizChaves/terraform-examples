
provider "google" {
  project = "certificate-gcp"
  region = "us-east1"
  zone = "us-east1-a"
}

provider "google-beta" {
  project = "certificate-gcp"
  region = "us-east1"
}

terraform {
  backend "gcs" {
     bucket  = "cert-state-sandbox"
    prefix  = "k8s"
  }
}


module "k8s" {
  source = "../../modules/gcp/gke"
  k8s_username = "Marvelcomics"
  k8s_password = "QoJM2j5nKzaCP9A31wf2"
  region = "us-east1"
  zone = "us-east1-a"
  vpc_name = "dev"
  subnet_cidr = "10.10.0.0/16"
  vpc_routing_mode = "REGIONAL"
  project_name = "certificate-gcp"
  cluster_name = "brasil-data"
  master_authorized_networks_config = [{
    cidr_blocks = []
  }]
  disable_istio = true
  disable_hpa         = false
  machine_preemptible = true
  machine_type        = "g1-small"  
}

resource "google_compute_firewall" "istio-firewall" {
  name = "istio-firewall"
  network = ""

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "15070"]
  }

  source_ranges = ["0.0.0.0/0"]
}
