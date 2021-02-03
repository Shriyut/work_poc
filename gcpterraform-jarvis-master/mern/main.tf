// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.gcp_project}"
  region      = "${var.region}"
}


//MERN Stack

//Reserving MERN Stack IP
resource "google_compute_address" "mernip" {
  name   = "mernip"
  region = "${var.mern_stack_instance_ip_region}"
}

  
// MERN Stack Instance
resource "google_compute_instance" "mern-stack" {
  name         = "${var.mern_stack_instance_name}"
  machine_type = "${var.mern_stack_machine_type}"
  zone         = "${var.mern_stack_zone}"
  
   tags = ["http-server"]
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network    = "${var.mern_stack_vpc_name}"
    subnetwork = "${var.mern_stack_subnet_name}"

    access_config {
      // Ephemeral IP

      nat_ip       = "${google_compute_address.mernip.address}"
      network_tier = "PREMIUM"
    }
  }
  metadata_startup_script = "sudo apt-get update; sudo apt-get install git  -y; git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/mern; sudo chmod 777 mern.sh; sh mern.sh"

 
}
