provider "google" {
  project = "tf-system-dev"
  region = "europe-west2"
}

terraform {
  backend "gcs"{
    bucket = "tf-system-dev-backend_jhdfh4"
  }
}

module "main" {
  source = "../../modules/"

  env = "dev"
}