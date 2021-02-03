// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.gcp_project}"
  region      = "${var.region}"
}



// Enabling API's 

resource "google_project_service" "dialogflow-api" {
  project = "${var.gcp_project}"
  service = "${var.dialogflow_api}"

  disable_dependent_services = true
}



/*
resource "google_project_services" "project" {
  project = "${var.gcp_project}"
  services   = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com", "compute.googleapis.com", "iamcredentials.googleapis.com", "logging.googleapis.com", "admin.googleapis.com", "appengine.googleapis.com", "appengineflex.googleapis.com", "bigquery-json.googleapis.com", "bigqueryconnection.googleapis.com", "bigquerydatatransfer.googleapis.com", "bigqueryreservation.googleapis.com", "bigquerystorage.googleapis.com", "bigtable.googleapis.com", "bigtabletableadmin.googleapis.com", "cloudapis.googleapis.com", "cloudasset.googleapis.com", "cloudbilling.googleapis.com", "cloudbuild.googleapis.com", "clouddebugger.googleapis.com", "clouderrorreporting.googleapis.com", "cloudfunctions.googleapis.com", "cloudidentity.googleapis.com", "cloudkms.googleapis.com", "cloudlatencytest.googleapis.com", "cloudmonitoring.googleapis.com", "cloudprofiler.googleapis.com", "cloudscheduler.googleapis.com", "cloudsearch.googleapis.com", "cloudshell.googleapis.com", "cloudtasks.googleapis.com", "cloudtrace.googleapis.com", "container.googleapis.com", "containeranalysis.googleapis.com", "containerregistry.googleapis.com", "containerscanning.googleapis.com", "customsearch.googleapis.com", "dataflow.googleapis.com", "dataproc.googleapis.com", "datastore.googleapis.com", "deploymentmanager.googleapis.com", "dns.googleapis.com", "endpoints.googleapis.com", "firestore.googleapis.com", "firewallinsights.googleapis.com", "googlecloudmessaging.googleapis.com", "iap.googleapis.com", "pubsub.googleapis.com", "replicapool.googleapis.com", "replicapoolupdater.googleapis.com", "resourceviews.googleapis.com", "run.googleapis.com", "runtimeconfig.googleapis.com", "serviceusage.googleapis.com", "servicebroker.googleapis.com", "serviceconsumermanagement.googleapis.com", "servicecontrol.googleapis.com", "servicemanagement.googleapis.com", "servicenetworking.googleapis.com", "sourcerepo.googleapis.com", "spanner.googleapis.com", "sql-component.googleapis.com", "sqladmin.googleapis.com", "stackdriver.googleapis.com", "storage-api.googleapis.com", "storage-component.googleapis.com", "storagetransfer.googleapis.com", "vmmigration.googleapis.com"]
}
*/

// Create VPC 1
resource "google_compute_network" "vpc1" {
  name                    = "${var.vpc1_name}-vpc"
  auto_create_subnetworks = "false"
}

// Create VPC1 Subnet
resource "google_compute_subnetwork" "subnet1" {
  name          = "${var.vpc1_name}-subnet"
  ip_cidr_range = "${var.subnet1_cidr}"
  network       = "${var.vpc1_name}-vpc"
  depends_on    = ["google_compute_network.vpc1"]
  region        = "${var.subnet1_region}"
}

// VPC 1 INGRESS firewall configuration
resource "google_compute_firewall" "firewall1" {
  name      = "${var.vpc1_name}-ingress-firewall"
  network   = "${google_compute_network.vpc1.name}"
  direction = "INGRESS"

  allow {
    protocol = "${var.firewall_protocol1}"
  }



  allow {
    protocol = "tcp"
    ports    = "${var.firewall_ports}"
  }

  //Giving source ranges as this is a INGRESS Firewall Rule
  source_ranges = "${var.subnet1_source_ranges}"
}

// VPC 1  EGRESS firewall configuration
resource "google_compute_firewall" "firewall2" {
  name               = "${var.vpc1_name}-egress-firewall"
  network            = "${google_compute_network.vpc1.name}"
  direction          = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "${var.firewall_protocol1}"
  }



  allow {
    protocol = "tcp"
    ports    = "${var.firewall_ports}"
  }

  //Not giving source ranges as this is a EGRESS Firewall Rule
  //source_ranges = "${var.subnet1_source_ranges}"
}

// Create VPC 2
resource "google_compute_network" "vpc2" {
  name                    = "${var.vpc2_name}-vpc"
  auto_create_subnetworks = "false"
}

// Create VPC 2 Subnet
resource "google_compute_subnetwork" "subnet2" {
  name          = "${var.vpc2_name}-subnet"
  ip_cidr_range = "${var.subnet2_cidr}"
  network       = "${var.vpc2_name}-vpc"
  depends_on    = ["google_compute_network.vpc2"]
  region        = "${var.region}"
}

// VPC 2 INGRESS firewall configuration
resource "google_compute_firewall" "firewall3" {
  name      = "${var.vpc2_name}-ingress-firewall"
  network   = "${google_compute_network.vpc2.name}"
  direction = "INGRESS"

  allow {
    protocol = "${var.firewall_protocol1}"
  }



  allow {
    protocol = "tcp"
    ports    = "${var.firewall_ports}"
  }

  //Giving source ranges as this is a INGRESS Firewall Rule
  source_ranges = "${var.subnet2_source_ranges}"
}


// VPC 2 EGRESS firewall configuration
resource "google_compute_firewall" "firewall4" {
  name               = "${var.vpc2_name}-egress-firewall"
  network            = "${google_compute_network.vpc2.name}"
  direction          = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "${var.firewall_protocol1}"
  }



  allow {
    protocol = "tcp"
    ports    = "${var.firewall_ports}"
  }

  //Not giving source ranges as this is a EGRESS Firewall Rule
  //source_ranges = "${var.subnet2_source_ranges}"
}




//Reserving static IP 1
resource "google_compute_address" "ip_address1" {
  name = "${var.ip_address_name1}"
}


//Reserving static IP 2
resource "google_compute_address" "ip_address2" {
  name = "${var.ip_address_name2}"
}


//VPN Gateway 1
resource "google_compute_vpn_gateway" "gateway1" {
  name    = "${var.vpn_gateway1}"
  network = "${google_compute_network.vpc1.self_link}"
}

//VPN Gateway 2
resource "google_compute_vpn_gateway" "gateway2" {
  name    = "${var.vpn_gateway2}"
  network = "${google_compute_network.vpc2.self_link}"
}



//Forwarding Rule VPN Gateway 1 - A
resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "${var.fr_esp}"
  ip_protocol = "${var.fr_esp_ip_protocol}"
  ip_address  = "${google_compute_address.ip_address1.address}"
  target      = "${google_compute_vpn_gateway.gateway1.self_link}"
}

//Forwarding Rule VPN Gateway 1 - B
resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = "${var.fr_udp500}"
  ip_protocol = "${var.fr_udp500_ip_protocol}"
  port_range  = "${var.fr_udp500_port_range}"
  ip_address  = "${google_compute_address.ip_address1.address}"
  target      = "${google_compute_vpn_gateway.gateway1.self_link}"
}

//Forwarding Rule VPN Gateway 1 - C
resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = "${var.fr_udp4500}"
  ip_protocol = "${var.fr_udp4500_ip_protocol}"
  port_range  = "${var.fr_udp4500_port_range}"
  ip_address  = "${google_compute_address.ip_address1.address}"
  target      = "${google_compute_vpn_gateway.gateway1.self_link}"
}

//Forwarding Rule VPN Gateway 2 -A
resource "google_compute_forwarding_rule" "fr_esp-1" {
  name        = "${var.fr_esp}-1"
  ip_protocol = "${var.fr_esp_ip_protocol}"
  ip_address  = "${google_compute_address.ip_address2.address}"
  target      = "${google_compute_vpn_gateway.gateway2.self_link}"
}

//Forwarding Rule VPN Gateway 2 - B
resource "google_compute_forwarding_rule" "fr_udp500-1" {
  name        = "${var.fr_udp500}-1"
  ip_protocol = "${var.fr_udp500_ip_protocol}"
  port_range  = "${var.fr_udp500_port_range}"
  ip_address  = "${google_compute_address.ip_address2.address}"
  target      = "${google_compute_vpn_gateway.gateway2.self_link}"
}

//Forwarding Rule VPN Gateway 2 - C
resource "google_compute_forwarding_rule" "fr_udp4500-1" {
  name        = "${var.fr_udp4500}-1"
  ip_protocol = "${var.fr_udp4500_ip_protocol}"
  port_range  = "${var.fr_udp4500_port_range}"
  ip_address  = "${google_compute_address.ip_address2.address}"
  target      = "${google_compute_vpn_gateway.gateway2.self_link}"
}


//VPN Tunnel 1
resource "google_compute_vpn_tunnel" "tunnel1" {
  name          = "${var.vpn_tunnel1}"
  peer_ip       = "${google_compute_address.ip_address2.address}"
  shared_secret = "a secret message"

  target_vpn_gateway = "${google_compute_vpn_gateway.gateway1.self_link}"

  local_traffic_selector = "${var.local_traffic_selector}"

  remote_traffic_selector = ["10.10.1.0/24"]

  depends_on = [
    "google_compute_address.ip_address2",
    "google_compute_forwarding_rule.fr_esp",
    "google_compute_forwarding_rule.fr_udp500",
    "google_compute_forwarding_rule.fr_udp4500",

  ]
}



//VPN Tunnel 2
resource "google_compute_vpn_tunnel" "tunnel2" {
  name          = "${var.vpn_tunnel2}"
  peer_ip       = "${google_compute_address.ip_address1.address}"
  shared_secret = "a secret message"

  target_vpn_gateway = "${google_compute_vpn_gateway.gateway2.self_link}"

  local_traffic_selector = "${var.local_traffic_selector}"

  remote_traffic_selector = ["10.10.0.0/24"]

  depends_on = [
    "google_compute_address.ip_address2",
    "google_compute_forwarding_rule.fr_esp-1",
    "google_compute_forwarding_rule.fr_udp500-1",
    "google_compute_forwarding_rule.fr_udp4500-1",

  ]
}



/*
//VPN Tunnel 2
resource "google_compute_vpn_tunnel" "tunnel2" {
  name          = "${var.vpn_tunnel2}"
  peer_ip       = "${google_compute_address.ip_address1.address}"
  shared_secret = "a secret message"

  target_vpn_gateway = "${google_compute_vpn_gateway.gateway2.self_link}"

  local_traffic_selector = "${var.local_traffic_selector}"

  depends_on = [
    "google_compute_address.ip_address2",
     "google_compute_forwarding_rule.fr_esp",
    "google_compute_forwarding_rule.fr_udp500",
    "google_compute_forwarding_rule.fr_udp4500",
    
  ]
}
*/




// IAM Project Owner
resource "google_project_iam_member" "project-owner" {
  project = "${var.gcp_project}"
  role    = "${var.iam_role}"

  member = "${var.iam_member}"
}

//Service Account
resource "google_service_account" "service-acc" {
  account_id   = "${var.service_account_id}"
  display_name = "${var.service_account_display_name}"
}

//Service Account Key
resource "google_service_account_key" "mykey" {
  service_account_id = "${google_service_account.service-acc.name}"
}

//Storage Bucket
resource "google_storage_bucket" "storage_bucket" {
  name          = "${var.storage_bucket_name}"
  location      = "${var.storage_bucket_location}"
  storage_class = "${var.storage_bucket_class}"

  lifecycle_rule {

    action {
      type = "${var.storage_bucket_lcr_action_type}"
    }


    condition {
      age = "${var.storage_bucket_lcr_condition_age}"
    }
  }


  versioning {
    enabled = "${var.storage_bucket_versioning}"
  }


}


//Storage Bucket ACL
resource "google_storage_bucket_acl" "storage_bucket" {
  bucket      = "${google_storage_bucket.storage_bucket.name}"
  role_entity = "${var.storage_bucket_acl_role}"


}

//Compute instance in VPC 1
resource "google_compute_instance" "compute-1" {
  name         = "${var.compute_instance_name_in_vpc_1}"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"

    access_config {
      // Ephemeral IP
    }
  }


}



//Compute instance in VPC 2
resource "google_compute_instance" "compute-2" {
  name         = "${var.compute_instance_name_in_vpc_2}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network    = "${google_compute_network.vpc2.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet2.self_link}"

    access_config {
      // Ephemeral IP
    }
  }

}




// Analytics stack starts here

resource "google_bigquery_dataset" "default" {
  dataset_id                  = "${var.bq_dataset_id}"
  friendly_name               = "${var.bq_dataset_friendly_name}"
  description                 = "This is a test description"
  location                    = "${var.bq_dataset_location}"
  default_table_expiration_ms = "${var.bq_dataset_default_table_expiration_ms}"

  labels = {
    env = "default"
  }
}
resource "google_bigquery_table" "default" {
  dataset_id = "${google_bigquery_dataset.default.dataset_id}"
  table_id   = "${var.bq_table_id}"

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "data",
    "type": "STRING",
    "mode": "NULLABLE"
   }
]
EOF
}
resource "google_pubsub_topic" "topic" {
  name = "${var.pubsub_topic_name}"

  labels = {
    fooeeee = "bar"
  }
}
resource "google_cloud_scheduler_job" "job1" {
  name        = "${var.cloud_scheduler_job_name}"
  description = "test job"
  schedule    = "${var.cloud_scheduler_job_schedule}"
  region      = "${var.cloud_scheduler_job_region}"
  pubsub_target {
    topic_name = "${google_pubsub_topic.topic.id}"
    data       = "${base64encode("test")}"
  }
}
resource "google_storage_bucket" "image-3234" {
  name     = "${var.analytics_storage_bucket_name}"
  location = "${var.analytics_storage_bucket_location}"
}
resource "google_dataflow_job" "big_data_job" {
  name              = "${var.name}"
  zone              = "${var.zone}"
  max_workers       = "${var.max_workers}"
  on_delete         = "${var.on_delete}"
  template_gcs_path = "${var.dfj_template_gcs_path}"
  temp_gcs_location = "${var.dfj_temp_gcs_location}"
  parameters = {
    inputTopic : "${google_pubsub_topic.topic.id}",
    outputTableSpec : "${var.dfj_parameters_outputTableSpec}"
  }
  machine_type = "${var.machine_type}"
  # network      = "${replace(var.network_self_link, "/(.*)/networks/(.*)/", "$2")}"
  # subnetwork   = "${replace(var.subnetwork_self_link, "/(.*)/regions/(.*)/", "regions/$2")}"
  network    = "${google_compute_network.vpc1.self_link}"
  subnetwork = "${google_compute_subnetwork.subnet1.self_link}"
}


//Analytics ends here


// Wordpress & CloudSQL starts here
resource "google_compute_address" "wordpressip" {
  name   = "wordpress-ip"
  region = "us-east1"
}



resource "google_compute_instance" "wordpress" {
  name         = "${var.wordpress_instance_name}"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  # scratch_disk {
  # }

  network_interface {
    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"

    access_config {
      // Ephemeral IP

      nat_ip = "${google_compute_address.wordpressip.address}"
    }
  }

  provisioner "file" {
    content     = "${data.template_file.phpconfig.rendered}"
    destination = "/wp-config.php"

    connection {
      type     = "ssh"
      user     = "root"
      password = "root123"
      # host     = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
      host = "${google_compute_address.wordpressip.address}"
    }
  }



  provisioner "file" {
    content     = "${data.template_file.filebeat.rendered}"
    destination = "/filebeat.yml"

    connection {
      type     = "ssh"
      user     = "root"
      password = "root123"
      # host     = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
      host = "${google_compute_address.wordpressip.address}"
    }
  }



  metadata_startup_script = "sudo  echo \"root:root123\" | chpasswd; sudo  mv /etc/ssh/sshd_config  /opt; sudo touch /etc/ssh/sshd_config; sudo echo -e \"Port 22\nHostKey /etc/ssh/ssh_host_rsa_key\nPermitRootLogin yes\nPubkeyAuthentication yes\nPasswordAuthentication yes\nUsePAM yes\" >  /etc/ssh/sshd_config; sudo systemctl restart sshd; sudo apt install git  -y; git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 wordpress.sh; ./wordpress.sh"


}


//wp-config.php data template
data "template_file" "phpconfig" {
  # template = "${file("conf.wp-config.php")}"

  template = templatefile("${path.module}/scripts/conf.wp-conf.php", { db_host = "${google_sql_database_instance.sql.public_ip_address}", db_name = "${google_sql_database.database.name}", db_user = "${google_sql_user.users.name}", db_pass = "${google_sql_user.users.password}" })

}


//filebeat.yml data template
data "template_file" "filebeat" {
  # template = "${file("conf.wp-config.php")}"

  template = templatefile("${path.module}/scripts/filebeat.yml", { ip = "${google_compute_instance.elk.network_interface.0.network_ip}" })

}

resource "google_compute_global_address" "private_ip_alloc" {
  name          = "private-ip-alloc"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = "${google_compute_network.vpc1.self_link}"
}

resource "google_service_networking_connection" "foobar" {
  network                 = "${google_compute_network.vpc1.self_link}"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["${google_compute_global_address.private_ip_alloc.name}"]
}







resource "google_sql_database_instance" "sql" {
  name             = "${var.sql_database_instance_name}"
  database_version = "MYSQL_5_7"
  region           = "${var.sql_database_instance_region}"




  depends_on = [
    "google_service_networking_connection.foobar"
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
        value = "${google_compute_address.wordpressip.address}/32"
        name  = "allowedip"
      }
    }


    # depends_on = [
    #   "google_compute_instance.default",
    # ]
  }



}



resource "google_sql_database" "database" {
  name     = "${var.sql_database_name}"
  instance = "${google_sql_database_instance.sql.name}"


  # depends_on = [
  #   "google_sql_database_instance.sql",
  # ]
}



resource "google_sql_user" "users" {
  name     = "user123"
  instance = "${google_sql_database_instance.sql.name}"
  password = "12345"
  # host     = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
  host = "${google_compute_address.wordpressip.address}"
}

// Wordpress & CloudSQL ends here

// Devops starts here

//ELK

resource "google_compute_instance" "elk" {
  name         = "${var.elk_instance_name}"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-xenial-v20190816"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    # network = "default"
    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"


    access_config {
      // Ephemeral IP
    }
  }

  #metadata = {
  # foo = "bar"
  #}

  metadata_startup_script = "sudo apt-get update; sudo apt-get install git -y; sudo echo 'export ip='$(hostname -i)'' >> ~/.profile; source ~/.profile; echo \"export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64\" >>/etc/profile; echo \"export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin\" >>/etc/profile; source /etc/profile; mkdir chandu; cd chandu; sudo apt-get install wget -y; git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 elk.sh; sh elk.sh"





}



//Harbor Instance (Ashoks Harbor)
resource "google_compute_address" "harborip" {
  name   = "harborip"
  region = "us-east1"
}



resource "google_compute_instance" "harbor" {
  name         = "harbor-ashok"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"


  tags = ["name", "harbor", "http-server"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20180129"
    }
  }
  // Local SSD disk
  #scratch_disk {
  #}

 network_interface {
    # network = "default"

    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"
    access_config {
      // Ephemeral IP
      nat_ip       = "${google_compute_address.harborip.address}"
      network_tier = "PREMIUM"
    }
  }



  metadata = {
    name = "harbor"
  }
  description             = "${google_compute_address.harborip.address}"
  metadata_startup_script = "sudo yum update -y; sudo yum install git -y; sudo yum install wget -y; git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 hb.sh; sh hb.sh"


  service_account {
    scopes = ["cloud-platform"]
  }
  # metadata_startup_script = "sudo yum update; sudo yum install wget -y; sudo  echo \"root123\" | passwd --stdin root; sudo  mv /etc/ssh/sshd_config  /opt; sudo touch /etc/ssh/sshd_config; sudo echo -e \"Port 22\nHostKey /etc/ssh/ssh_host_rsa_key\nPermitRootLogin yes\nPubkeyAuthentication yes\nPasswordAuthentication yes\nUsePAM yes\" >  /etc/ssh/sshd_config; sudo systemctl restart  sshd;sudo useradd test; sudo echo  -e \"test    ALL=(ALL)  NOPASSWD:  ALL\" >> /etc/sudoers;"
}



//Shriyuts Harbor Instance
resource "google_compute_address" "harborip" {
#   name   = "harborip"
#   region = "us-east1"
# }
# resource "google_compute_instance" "default" {
#   name         = "${var.harbor_instance_name}"
#   machine_type = "n1-standard-1"
#   zone         = "us-east1-b"
#   tags         = ["foo", "bar"]
#   boot_disk {
#     initialize_params {
#       image = "centos-7-v20190905"
#     }
#   }
#   // Local SSD disk
#   scratch_disk {
#   }
#   network_interface {
#     # network = "default"

#     network    = "${google_compute_network.vpc1.self_link}"
#     subnetwork = "${google_compute_subnetwork.subnet1.self_link}"
#     access_config {
#       // Ephemeral IP
#       nat_ip       = "${google_compute_address.harborip.address}"
#       network_tier = "PREMIUM"
#     }
#   }

#   metadata = {
#     foo = "bar"
#   }
#   metadata_startup_script = " sudo yum install git -y; sudo yum install wget -y; cd /; cd ~; mkdir projectdir; cd projectdir; sudo systemctl stop firewalld; sudo systemctl disable firewalld; sudo git clone https://github.com/iamdaaniyaal/gcpterraform.git ; cd gcpterraform/scripts; sudo chmod 777 harbor.sh; sudo  ./harbor.sh; "
# }



//Jenkins Instance

resource "google_compute_address" "jenkinsip" {
  name   = "jenkinsip"
  region = "us-east1"
}

data "template_file" "mydeamon" {
  # template = "${file("conf.wp-config.php")}"

  template = templatefile("${path.module}/mydeamon.json", { jenkinsip = "${google_compute_address.jenkinsip.address}" })

}

resource "google_compute_instance" "jenkins" {
  name         = "jenkins-ashok-abc"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  tags        = ["name", "jenkins", "http-server"]
  description = "${google_compute_address.sonarqubeip.address}"

  boot_disk {
    initialize_params {
      image = "centos-7-v20180129"
    }
  }

  // Local SSD disk
  #scratch_disk {
  #}


 network_interface {
    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"

    access_config {
      // Ephemeral IP

      nat_ip       = "${google_compute_address.jenkinsip.address}"
      network_tier = "PREMIUM"
    }
  }




  # provisioner "file" {
  #   content     = "${data.template_file.jenkins.rendered}"
  #   destination = "/tmp/jenkins.sh"

  #   connection {
  #     type     = "ssh"
  #     user     = "root"
  #     password = "root123"
  #     # host     = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
  #     host = "${google_compute_address.jenkinsip.address}"
  #   }
  # }


  provisioner "file" {
    content     = "${data.template_file.mydeamon.rendered}"
    destination = "/tmp/mydeamon.json"

    connection {
      type     = "ssh"
      user     = "root"
      password = "root123"
      # host     = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
      host = "${google_compute_address.jenkinsip.address}"
    }
  }


  # provisioner "file" {
  #   content     = "${data.template_file.mvn_sonar_settings.rendered}"
  #   destination = "/tmp/mvn_sonar_settings.xml"

  #   connection {
  #     type     = "ssh"
  #     user     = "root"
  #     password = "root123"
  #     # host     = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
  #     host = "${google_compute_address.jenkinsip.address}"
  #   }
  # }


  # provisioner "remote-exec" {
  #   inline = [
  #     # "sudo su - test",
  #     # "sudo -s",
  #     "sudo chmod 777 /tmp/jenkins.sh",
  #     "sudo sh /tmp/jenkins.sh",
  #   ]


  #   connection {
  #     type     = "ssh"
  #     user     = "root"
  #     password = "root123"
  #     # host     = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
  #     host = "${google_compute_address.jenkinsip.address}"
  #   }
  # }
  metadata = {
    name = "jenkins"
  }


  # metadata_startup_script = "sudo yum update -y; sudo yum install wget -y; sudo  echo \"root123\" | passwd --stdin root; sudo  mv /etc/ssh/sshd_config  /opt; sudo touch /etc/ssh/sshd_config; sudo echo -e \"Port 22\nHostKey /etc/ssh/ssh_host_rsa_key\nPermitRootLogin yes\nPubkeyAuthentication yes\nPasswordAuthentication yes\nUsePAM yes\" >  /etc/ssh/sshd_config; sudo systemctl restart  sshd;sudo useradd test; sudo echo  -e \"test    ALL=(ALL)  NOPASSWD:  ALL\" >> /etc/sudoers; sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo; sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key; sudo yum install jenkins maven google-cloud-sdk kubectl -y; sudo  wget -O  /opt/docker.sh  https://get.docker.com && sudo chmod 755 /opt/docker.sh; sudo wget -P /opt/  https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip; sudo unzip /opt/sonar-scanner-cli-3.3.0.1492-linux.zip -d /opt  &&  sudo mv /opt/sonar-scanner-3.3.0.1492-linux  /opt/sonar-scanner"
  metadata_startup_script = "sudo yum update -y; sudo yum install wget -y; sudo  echo \"root123\" | passwd --stdin root; sudo  mv /etc/ssh/sshd_config  /opt; sudo touch /etc/ssh/sshd_config; sudo echo -e \"Port 22\nHostKey /etc/ssh/ssh_host_rsa_key\nPermitRootLogin yes\nPubkeyAuthentication yes\nPasswordAuthentication yes\nUsePAM yes\" >  /etc/ssh/sshd_config; sudo systemctl restart  sshd;sudo useradd test; sudo echo  -e \"test    ALL=(ALL)  NOPASSWD:  ALL\" >> /etc/sudoers; sudo yum install git -y; sudo git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 *.*; sudo sh jenkins.sh;"
  # metadata_startup_script = "sudo yum update -y; sudo yum install git -y; sudo git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 *.*; sudo sh jenkins.sh;"
}


//SonarQube Instance
resource "google_compute_address" "sonarqubeip" {
  name   = "sonarqubeip"
  region = "us-east1"
}


resource "google_compute_instance" "sonarqube" {
  name         = "sonarqube-ashok-abc"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  tags = ["name", "sonarqube", "http-server"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20180129"
    }
  }

  // Local SSD disk
  #scratch_disk {
  #}

  network_interface {
    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"


    access_config {
      // Ephemeral IP
      nat_ip = "${google_compute_address.sonarqubeip.address}"
    }
  }
  metadata = {
    name = "sonarqube"
  }

  metadata_startup_script = "sudo yum update -y;sudo yum install git -y; sudo git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 /gcpterraform/scripts/*; sudo sh sonarqube.sh;"
}



//LAMP Stack


resource "google_compute_address" "lampip" {
  name   = "lampip"
  region = "us-east1"
}

resource "google_compute_instance" "lamp-stack" {
  name         = "lamp-stack"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"

    access_config {
      // Ephemeral IP

      nat_ip       = "${google_compute_address.lampip.address}"
      network_tier = "PREMIUM"
    }
  }
  metadata_startup_script = "sudo apt-get update; sudo apt-get install git  -y; git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 lamp.sh; sh lamp.sh"

  tags = ["http-server"]
}

//MEAN Stack
resource "google_compute_address" "meanip" {
  name   = "meanip"
  region = "us-east1"
}

resource "google_compute_instance" "mean-stack" {
  name         = "mean-stack"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"

    access_config {
      // Ephemeral IP

      nat_ip       = "${google_compute_address.meanip.address}"
      network_tier = "PREMIUM"
    }
  }
  metadata_startup_script = "sudo apt-get update; sudo apt-get install git  -y; git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 mean.sh; sh mean.sh"

  tags = ["http-server"]
}

//MERN Stack
resource "google_compute_address" "mernip" {
  name   = "mernip"
  region = "us-east1"
}

resource "google_compute_instance" "mern-stack" {
  name         = "mern-stack"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network    = "${google_compute_network.vpc1.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet1.self_link}"

    access_config {
      // Ephemeral IP

      nat_ip       = "${google_compute_address.mernip.address}"
      network_tier = "PREMIUM"
    }
  }
  metadata_startup_script = "sudo apt-get update; sudo apt-get install git  -y; git clone https://github.com/iamdaaniyaal/gcpterraform.git; cd gcpterraform/scripts; sudo chmod 777 mern.sh; sh mern.sh"

  tags = ["http-server"]
}

