// Run `gcloud auth application-default login` once to provide credentails
provider "google" {
 project     = "terraform-system-v2"
 region      = "us-west1"
#  zone    = "us-central1-c" 
}

variable "env" {
  type = string
  default = "dev"
}

terraform {
  backend "gcs"{
    bucket      = "tf-backend-hdyh37"
    prefix      = "dev"
  }
}

resource "random_string" "db_id" {
  length  = 8
  lower   = true
  upper   = false
  number  = true  
  special = false
}

resource "google_sql_database_instance" "postgresql" {
  name             = "tf-db-instance-${random_string.db_id.result}-${var.env}"
  database_version = "POSTGRES_13"

  deletion_protection = false

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "postgresdb" {
  name     = "tf-db-db-${random_string.db_id.result}-${var.env}"
  instance = google_sql_database_instance.postgresql.name
}

resource "google_sql_user" "postgresql_user" {
  name = "james"
  instance = google_sql_database_instance.postgresql.name
  password = "password"
}