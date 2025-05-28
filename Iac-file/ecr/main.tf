terraform {
  backend "s3" {
    bucket         = "sta-infra"
    key            = "ecr.tfstate"
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
  #profile = "<YOUR AWS PROFILE NAME>"
}



resource "aws_ecr_repository" "sta-uno" {
  name = "sta-uno"
}

resource "aws_ecr_repository" "sta-due" {
  name = "sta-due"
}

resource "aws_ecr_repository" "sta-tre" {
  name = "sta-tre"
}
