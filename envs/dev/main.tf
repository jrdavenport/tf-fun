provider "aws" {
  project = "tf-system-dev"
  region = "eu-west-2"
}

terraform {
  backend "gcs"{
    bucket = "tf-system-dev-backend_jhdfh3"
  }
}

module "main" {
  source = "../../modules/"

  env = "dev"
}