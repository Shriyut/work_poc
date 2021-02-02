provider "google" {
 credentials = "${file("credentials.json")}"
 project     = "practice-project-248415"
 region      = "us-central1"
}
resource "google_compute_address" "static" {
        name = "sonar"
}
resource "google_compute_instance" "default" {
  name         = "testdevops"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
 // tags = ["${google_sql_database_instance.sql.public_ip_address}"]
  tags = ["foo"]
  boot_disk {
    initialize_params {
      image = "centos-7-v20190905"
    }
  }
  // Local SSD disk
  scratch_disk {
  }
  network_interface {
    network = "${google_compute_network.vpc1.self_link}"
     subnetwork  = "${google_compute_subnetwork.subnet1.self_link}"
    access_config {
      // Ephemeral IP
        nat_ip = "${google_compute_address.static.address}"
        network_tier = "PREMIUM"
    }
  }
  
  metadata = {
    ip = "${google_sql_database_instance.sql11.public_ip_address}"
  } 
 description = "${google_sql_database_instance.sql11.public_ip_address}"


  metadata_startup_script = " sudo yum install git -y; sudo yum install wget -y; cd ~; sudo https://github.com/Shriyut/SonarQube-automation.git ; cd SonarQube-automation; sudo chmod 777 sonarscript.sh; sudo ./sonarscript.sh; "
}




//data "google_compute_address" "terraform-ip" {
  //name = "terraform-ip"
//}


resource "google_compute_network" "vpc1" {
  name                    = "vpc1"
  auto_create_subnetworks = "false"
}

// Create VPC1 Subnet
resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  ip_cidr_range = "10.10.2.0/24"
  network       = "vpc1"
  depends_on    = ["google_compute_network.vpc1"]
  region        = "us-central1"
}




resource "google_compute_global_address" "private_ip_alloc11" {
  name          = "private-ip-alloc11"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = "${google_compute_network.vpc1.self_link}"
}

resource "google_service_networking_connection" "shriyut" {
  network                 =  "${google_compute_network.vpc1.self_link}"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["${google_compute_global_address.private_ip_alloc11.name}"]
}


resource "google_sql_database_instance" "sql11" {
  name             = "sql-instance-abcdef455"
  database_version = "MYSQL_5_7"
  region           = "us-central1"




  depends_on = [
    "google_service_networking_connection.shriyut"
  ]


  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled    = true
      private_network = "${google_compute_network.vpc1.self_link}"
      authorized_networks {
        # value = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}/32"
        value = "${google_compute_address.static.address}/32"
        name  = "allowedip"
      }
    }
#configure a firewall rule manually and create a root user with all privileges for connection establishment with db

    # depends_on = [
    #   "google_compute_instance.default",
    # ]
  }



}



resource "google_sql_database" "sonardatabase" {
  name     = "sonar-database"
  instance = "${google_sql_database_instance.sql11.name}"


  # depends_on = [
  #   "google_sql_database_instance.sql",
  # ]
}



resource "google_sql_user" "users" {
  name     = "sonarqube"
  instance = "${google_sql_database_instance.sql11.name}"
  password = "password"
  
  host = "${google_compute_address.static.address}"
}
