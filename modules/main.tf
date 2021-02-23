variable "env" {
  type = string
}

resource "random_string" "bucket_id" {
  length  = 8
  lower   = true
  upper   = false
  number  = true  
  special = false
}

# resource "google_sql_database_instance" "postgresql" {
#   name             = "tf-db-instance-${random_string.db_id.result}-${var.env}"
#   database_version = "POSTGRES_13"

#   deletion_protection = false

#   settings {
#     tier = "db-f1-micro"
#   }
# }

# resource "google_sql_database" "postgresdb" {
#   name     = "tf-db-db-${random_string.db_id.result}-${var.env}"
#   instance = google_sql_database_instance.postgresql.name
# }

# resource "google_sql_user" "postgresql_user" {
#   name = "james"
#   instance = google_sql_database_instance.postgresql.name
#   password = "password"
# }

resource "google_storage_bucket" "test-bucket" {
  name          = "autossdfd-expifgvfring-buckdet-${var.env}"
  location      = "EU"
}