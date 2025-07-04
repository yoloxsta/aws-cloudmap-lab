terraform {
  backend "s3" {
    bucket         = "sta-infra"
    key            = "alb.tfstate"
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


data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "sta-infra"
    key    = "vpc.tfstate"
    region = "eu-west-1"
  }
}


resource "aws_lb" "sta_alb" {
  load_balancer_type = "application"
  subnets            = data.terraform_remote_state.vpc.outputs.sta_public_subnets_ids
  security_groups    = ["${aws_security_group.sta_alb_sg.id}"]
}

resource "aws_security_group" "sta_alb_sg" {
  description = "controls access to the ALB"
  vpc_id      = data.terraform_remote_state.vpc.outputs.sta_vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
