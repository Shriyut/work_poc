variable "region" {}
variable "gcp_project" {}
variable "credentials" {}
variable "vpc1_name" {}
variable "vpc2_name" {}
variable "subnet1_cidr" {}
variable "subnet2_cidr" {}
variable "subnet1_region" {}
variable "subnet1_source_ranges" {}
variable "subnet2_source_ranges" {}
variable "firewall_protocol1" {}
variable "firewall_protocol2" {}
variable "firewall_ports" {
  type = list(string)
}

variable "vpn_gateway1" {}
variable "vpn_gateway2" {}

variable "ip_address_name1" {}
variable "ip_address_name2" {}



variable "fr_esp" {}
variable "fr_esp_ip_protocol" {}


variable "fr_udp500" {}
variable "fr_udp500_ip_protocol" {}
variable "fr_udp500_port_range" {}


variable "fr_udp4500" {}
variable "fr_udp4500_ip_protocol" {}
variable "fr_udp4500_port_range" {}



variable "vpn_tunnel1" {}
variable "vpn_tunnel2" {}

variable "local_traffic_selector" {}


variable "iam_role" {}
variable "iam_member" {}

variable "service_account_id" {}
variable "service_account_display_name" {}


variable "storage_bucket_name" {}
variable "storage_bucket_location" {}
variable "storage_bucket_class" {}
variable "storage_bucket_lcr_action_type" {}
variable "storage_bucket_lcr_condition_age" {}
variable "storage_bucket_versioning" {}
variable "storage_bucket_acl_role" {
  type = list(string)
}



variable "dialogflow_api" {}

variable "compute_instance_name_in_vpc_1" {}
variable "compute_instance_name_in_vpc_2" {}


// Analytics starts here
variable "name" {
  description = "The name of the dataflow job"
}
variable "max_workers" {
  description = " The number of workers permitted to work on the job. More workers may improve processing speed at additional cost"
}
variable "on_delete" {
  description = "One of drain or cancel. Specifies behavior of deletion during terraform destroy. The default is cancel."
}
variable "zone" {
  description = "The zone in which the created job should run."
}
variable "machine_type" {
  description = "The machine type to use for the job."
}

variable "bq_dataset_id" {}
variable "bq_dataset_friendly_name" {}
variable "bq_dataset_location" {}
variable "bq_dataset_default_table_expiration_ms" {}
variable "bq_table_id" {}
variable "pubsub_topic_name" {}
variable "cloud_scheduler_job_name" {}
variable "cloud_scheduler_job_schedule" {}
variable "cloud_scheduler_job_region" {}
variable "analytics_storage_bucket_name" {}
variable "analytics_storage_bucket_location" {}
variable "dfj_template_gcs_path" {}
variable "dfj_temp_gcs_location" {}
variable "dfj_parameters_outputTableSpec" {}

// Analytics ends here

// Wordpress & CloudSQL starts here

variable "wordpress_instance_name" {}
variable "sql_database_instance_name" {}
variable "sql_database_instance_region" {}
variable "sql_database_name" {}

// Wordpress & CloudSQL ends here

// Devops starts here
variable "elk_instance_name" {}
variable "harbor_instance_name" {}
