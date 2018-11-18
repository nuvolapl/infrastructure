variable "region" {
    default = "eu-west-1"
}

terraform {
    required_version = "~> 0.11"
}

provider "aws" {
    region = "${var.region}"
}

resource "aws_service_discovery_private_dns_namespace" "this" {
    name = "nuvola"
    vpc  = "${module.vpc.vpc_id}"
}

resource "aws_s3_bucket" "this" {
    bucket_prefix = "nuvola-"
    force_destroy = true
}

data "aws_caller_identity" "current" {}
