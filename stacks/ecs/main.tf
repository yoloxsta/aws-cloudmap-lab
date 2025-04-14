terraform {
  backend "s3" {
    bucket         = "sta-infra"
    key            = "ecs.tfstate"
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


resource "aws_ecs_cluster" "sta_ecs_cluster" {
  name = "sta_ecs_cluster"
}
