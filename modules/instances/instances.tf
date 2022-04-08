resource "google_compute_instance" "task-instance" {
  count = var.auto_create_subnetworks == true?1:0
  name         = "task-instance${count.index}"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
 network = "default"
  }
}
