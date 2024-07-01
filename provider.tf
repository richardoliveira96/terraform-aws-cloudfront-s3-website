terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }

  backend "s3" {
    bucket = "terraform-richard"
    key    = "static-web-site"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}