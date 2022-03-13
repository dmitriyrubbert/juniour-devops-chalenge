provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "juniour-ex-terraform-state" // Bucket where to SAVE Terraform State
    key    = "dev/terraform.tfstate"      // Object name in the bucket to SAVE Terraform State
    region = "eu-central-1"               // Region where bucket is created
  }
}

variable "env" {
  default = "dev"
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  default = {
    Owner   = "Dmitriy Lazarev"
    Project = "Juniour Dev-Ops Tasks Examples"
  }
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_private_subnet_cidrs" {
  type = list(any)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}
