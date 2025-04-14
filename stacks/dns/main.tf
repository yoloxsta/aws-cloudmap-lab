terraform {
  backend "s3" {
    bucket         = "sta-infra"
    key            = "dns.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform_lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.79.0"
    }
  }
}


provider "aws" {
  region  = "eu-west-1"
  profile = "<YOUR AWS PROFILE NAME>"
}



data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "sta-infra"
    key    = "vpc.tfstate"
    region = "eu-west-1"
  }
}


resource "aws_service_discovery_private_dns_namespace" "sta_dns_discovery" {
  name        = var.sta_private_dns_namespace
  description = "sta dns discovery"
  vpc         = data.terraform_remote_state.vpc.outputs.sta_vpc_id
}
