// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.gcp_project}"
  region      = "${var.region}"
}


//LAMP Stack

//Reserving LAMP Stack IP
resource "google_compute_address" "lampip" {
  name   = "lampip"
  region = "us-east1"
}

  
// LAMP Stack Instance
resource "google_compute_instance" "lamp-stack" {
  name         = "${var.lamp_stack_instance_name}"
  machine_type = "${var.lamp_stack_machine_type}"
  zone         = "${var.lamp_stack_zone}"
  
   tags = ["http-server"]
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network    = "${var.lamp_stack_vpc_name}"
    subnetwork = "${var.lamp_stack_subnet_name}"

    access_config {
      // Ephemeral IP

      nat_ip       = "${google_compute_address.lampip.address}"
      network_tier = "PREMIUM"
    }
  }
  metadata_startup_script = "sudo apt-get update; sudo apt-get install git  -y; git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/lamp; sudo chmod 777 lamp.sh; sh lamp.sh"

 
}
