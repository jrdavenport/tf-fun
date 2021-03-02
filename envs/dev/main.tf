provider "google" {
  project = "tf-system-dev"
  region = "europe-west2"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
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