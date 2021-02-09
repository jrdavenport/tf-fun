// Configure the Google Cloud provider
provider "google" {
 credentials = file("gcp-svc-acc-creds-non-prod.json")
 project     = "distributed-system-non-prod"
 region      = "europe-west2"   
}


// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

resource "random_string" "db_id" {
  length  = 8
  lower   = true
  upper   = false
  number  = true
  special = false
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
 name         = "tf-vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "europe-west2-a"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

 // Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}



resource "google_sql_database_instance" "postgresql" {
  name             = "tf-db-${random_string.db_id.result}"
  database_version = "POSTGRES_13"
  region           = "europe-west2"
  deletion_protection = false
  

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "postgresql_db" {
  name = "tf-db-db"
  instance = google_sql_database_instance.postgresql.name
  charset = ""
  collation = ""
}

resource "google_sql_user" "postgresql_user" {
  name = "james"
  instance = google_sql_database_instance.postgresql.name
  host = "%"
  password = "password"
}