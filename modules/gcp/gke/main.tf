resource "google_container_cluster" "gke_development" {
  provider                 = "google-beta"
  name                     = "${var.cluster_name}"
  remove_default_node_pool = true
  initial_node_count       = 1
  location                 = "${var.region}"
  network                  = "${var.vpc_name}"
  subnetwork               = "zone-a"

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "10.15.0.0/28"
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/22"
  }

  addons_config {
    istio_config {
      disabled = "${var.disable_istio}"
    }

    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = "${var.disable_hpa}"
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "05:00"
    }
  }

  master_auth {
    username = "${var.k8s_username}"
    password = "${var.k8s_password}"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "development-node-pool"
  location   = "${var.region}"
  cluster    = "${google_container_cluster.gke_development.name}"
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }

  node_config {
    preemptible  = "${var.machine_preemptible}"
    machine_type = "${var.machine_type}"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}