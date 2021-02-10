// Run `gcloud auth application-default login` once to provide credentails
provider "google" {
 project     = "distributed-system-non-prod"
 region      = "europe-west2"   
}

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

resource "google_sql_database_instance" "postgresql" {
  name             = "tf-db-${random_string.db_id.result}"
  database_version = "POSTGRES_13"
  region           = "europe-west2"

  settings {
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
  password = "password"
}
