region = "us-central1"
gcp_project = "cloudglobaldelivery-1000135575"
vpc1_name = "dev"
vpc2_name = "prod"
credentials= "credentials.json"
subnet1_cidr= "10.10.0.0/24"
subnet2_cidr= "10.10.1.0/24"
subnet1_region = "us-east1"
subnet1_source_ranges =  ["0.0.0.0/0"]
subnet2_source_ranges =  ["0.0.0.0/0"]
firewall_protocol1 = "icmp"
firewall_protocol2 = "smtp"
firewall_ports = ["22","80", "8080", "9200", "5601", "5044", "3300-3310", "9000-9010"]
#firewall_ports = ["22","80", "8080", "3306", "9200", "5601", "5044"]
vpn_gateway1 = "vpn-gateway-1"
vpn_gateway2 = "vpn-gateway-2"
ip_address_name1 = "ip-address1"
ip_address_name2 = "ip-address2"
fr_esp = "fr-esp"
fr_esp_ip_protocol = "ESP"
fr_udp500 = "fr-udp500"
fr_udp500_ip_protocol = "UDP"
fr_udp500_port_range = "500"
fr_udp4500 = "fr-udp4500"
fr_udp4500_ip_protocol = "UDP"
fr_udp4500_port_range = "4500"
vpn_tunnel1 = "vpn-tunnel-1"
vpn_tunnel2 = "vpn-tunnel-2"
local_traffic_selector = ["0.0.0.0/0"]
iam_role = "roles/viewer"
iam_member =  "user:shubhendu.upadhyay@cognizant.com"
service_account_id = "project-service-account"
service_account_display_name = "Project Service Account"
storage_bucket_name = "terraform-gcp-bucket-1a"
storage_bucket_location = "EU"
storage_bucket_class = "MULTI_REGIONAL"
storage_bucket_lcr_action_type = "Delete"
storage_bucket_lcr_condition_age = "10"
storage_bucket_versioning = "true"
storage_bucket_acl_role =  [
    "OWNER:user-mohammed.daaniyaal@cognizant.com", 
	"READER:user-shriyut.jha@cognizant.com" ]

dialogflow_api = "dialogflow.googleapis.com"

compute_instance_name_in_vpc_1 = "dev-instance"
compute_instance_name_in_vpc_2 = "prod-instance"


// Analytics starts here

name= "data-1"
max_workers = "2"
on_delete = "drain"
zone = "us-east1-b"
machine_type = "n1-standard-1"
bq_dataset_id = "fooeeee"
bq_dataset_friendly_name = "test"
bq_dataset_location = "EU"
bq_dataset_default_table_expiration_ms = 3600000
bq_table_id = "bar"
pubsub_topic_name = "example-topic"
cloud_scheduler_job_name = "test-job11"
cloud_scheduler_job_schedule = "* * * * *"
cloud_scheduler_job_region = "asia-south1"
analytics_storage_bucket_name = "shubhendu123"
analytics_storage_bucket_location = "US"
dfj_template_gcs_path = "gs://dataflow-templates/latest/PubSub_to_BigQuery"
dfj_temp_gcs_location = "gs://shubhendu/tmp/"
dfj_parameters_outputTableSpec = "cloudglobaldelivery-1000135575:fooeeee.bar"


// Analytics ends here

// Wordpress & CloudSQL starts here

wordpress_instance_name = "wordpress"
sql_database_instance_name = "wp-sql-chandu"
sql_database_instance_region = "us-east1"
sql_database_name = "wp-database"

// Wordpress & CloudSQL ends here

// Devops starts here

elk_instance_name = "elk"
harbor_instance_name = "harbor"
