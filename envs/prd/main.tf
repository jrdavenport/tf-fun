provider "google" {
  project = "tf-system-prd"
  region = "europe-west2"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

terraform {
  backend "gcs"{
    bucket = "tf-system-prd-backend_h4ha3n"
  }
}

module "main" {
  source = "../../modules/"

  env = "prd"
}