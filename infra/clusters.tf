terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.12.0"
    }
  }
}

resource "google_gke_hub_feature" "feature" {
  project = "mikebz-ex1" 
  name = "configmanagement"
  location = "global"
  provider = google
  fleet_default_member_config {
    configmanagement {
      config_sync {
        source_format = "unstructured"
      }
    }
  }
}

resource "google_container_cluster" "hello-central" {
  provider = google
  name               = "hello-central"
  location           = "us-central1"
  project            = "mikebz-ex1" 
  deletion_protection = "false"
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
  name     = "hello-west"
  location = "us-west1"
  project  = "mikebz-ex1"
  initial_node_count = 2
  deletion_protection = "false"
  fleet {
    project = "mikebz-ex1"
  }

  workload_identity_config {
    workload_pool = "mikebz-ex1.svc.id.goog"
  }
}

resource "google_container_cluster" "hello-east" {
  provider = google
  name     = "hello-east"
  location = "us-east1"
  project  = "mikebz-ex1"
  initial_node_count = 2
  deletion_protection = "false"
  fleet {
    project = "mikebz-ex1"
  }

  workload_identity_config {
    workload_pool = "mikebz-ex1.svc.id.goog"
  }
}
