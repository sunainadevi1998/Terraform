terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.55.0"
    }
  }
}
resource "google_compute_network" "task1-vpc" {
  project = var.project_id

  name                            = "task1-vpc"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false
}
# Resource block to deploy SubNetworks
resource "google_compute_subnetwork" "sunu_vpc_subnet" {
  for_each                 = var.subnet_data
  name                     = each.key
  ip_cidr_range            = each.value
  region                   = var.region
  private_ip_google_access = true
  network                  = google_compute_network.task1-vpc.id
}

module "instances" {

  source     = "./modules/instances"

}
module "storage" {

  source     = "./modules/storage"

}


