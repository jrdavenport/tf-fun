// Run `gcloud auth application-default login` once to provide credentails
provider "google" {
 project     = "terraform-system-v2"
#  credentials = file("tf-v2-svc-acc.json")
 region      = "us-west1"
#  zone    = "us-central1-c" 
}

# resource "random_id" "instance_id" {
#  byte_length = 8
# }

# resource "random_string" "db_id" {
#   length  = 8
#   lower   = true
#   upper   = false
#   number  = true  
#   special = false
# }

# resource "google_sql_database_instance" "postgresql" {
#   name             = "tf-db-${random_string.db_id.result}"
#   database_version = "POSTGRES_13"
#   region           = "europe-west2"

#   settings {
#     tier = "db-f1-micro"
#   }
# }

# resource "google_sql_database" "postgresql_db" {
#   name = "tf-db-db"
#   instance = google_sql_database_instance.postgresql.name
#   charset = ""
#   collation = ""
#   project     = "terraform-system"
# }

# resource "google_sql_user" "postgresql_user" {
#   name = "james"
#   instance = google_sql_database_instance.postgresql.name
#   password = "password"
# }

# Create a GCS Bucket
# resource "google_storage_bucket" "tf-bucket" {
#   project       = "terraform-system"
#   name          = "tf-fun-backegrteg333ffnd"
#   # location      = var.gcp_region
#   force_destroy = true
#   # storage_class = var.storage-class
#   versioning {
#     enabled = true
#   }
# }


# // A single Compute Engine instance
# resource "google_compute_instance" "default" {
#  name         = "flask-vm-${random_id.instance_id.hex}"
#  machine_type = "f1-micro"
# #  zone         = "europe-west2"

#  boot_disk {
#    initialize_params {
#      image = "debian-cloud/debian-9"
#    }
#  }

# // Make sure flask is installed on all new instances for later steps
#  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

#  network_interface {
#    network = "default"

#    access_config {
#      // Include this section to give the VM an external ip address
#    }
#  }
# }

terraform {
  backend "gcs"{
    bucket      = "tf-backend-hdyh37"
    # prefix      = "dev"
    # credentials = "credentials.json"
  }
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
 name         = "flask-vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

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

resource "google_compute_instance" "default2" {
 name         = "flask-vm-${random_id.instance_id.hex}v2"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

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

resource "google_compute_instance" "default3" {
 name         = "flask-vm-${random_id.instance_id.hex}v3"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

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

resource "google_compute_instance" "default4" {
 name         = "flask-vm-${random_id.instance_id.hex}v4"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

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
