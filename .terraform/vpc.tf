variable "vpc-cidr" {
    default = "10.0.0.0/16"
}

variable "vpc-public-subnets" {
    type    = "list"
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc-private-subnets" {
    type    = "list"
    default = ["10.0.11.0/24", "10.0.12.0/24"]
}

data "aws_availability_zones" "this" {}

module "vpc" {
    source               = "terraform-aws-modules/vpc/aws"

    name                 = "nuvola"

    cidr                 = "${var.vpc-cidr}"
    azs                  = "${slice(data.aws_availability_zones.this.names, 0, length(var.vpc-public-subnets))}"
    public_subnets       = "${var.vpc-public-subnets}"
    private_subnets      = "${var.vpc-private-subnets}"

    enable_nat_gateway   = true
    enable_dns_hostnames = true
}
