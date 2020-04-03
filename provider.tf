provider "aws" {
  region  = "${var.region}"
}

resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cider}"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "mumbai_vpc"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.sub_cider}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Mumbai_subnet1"
  }
}
