terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.54"
    }
  }
  required_version = ">= 1.0.4"
}
provider "aws" {
  region = "us-west-2"
  profile = "admin1"
}

