terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.12.0"
    }
  }
}

resource "google_container_cluster" "hello-central" {
  provider = google
  name               = "hello-c1"
  location           = "us-central1"
  project            = "mikebz-ex1" 
  initial_node_count = 2
  fleet {
    project = "mikebz-ex1"
  }

  workload_identity_config {
    workload_pool = "mikebz-ex1.svc.id.goog"
  }
}

resource "google_container_cluster" "hello-west" {
  provider = google
  name     = "hello-c1"
  location = "us-west1"
  project  = "mikebz-ex1"
  initial_node_count = 2
  fleet {
    project = "mikebz-ex1"
  }

  workload_identity_config {
    workload_pool = "mikebz-ex1.svc.id.goog"
  }
}
