provider "aws" {
  version    = "~> 2.0"
  region     = "${local.location}"
}

resource "aws_vpc" "virtualPrivateCloud" {
  cidr_block            = "${local.vpc_cidr}"
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = {
    Name = "${local.tmpname}-VPC"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id                = "${aws_vpc.virtualPrivateCloud.id}"
  cidr_block            = "${local.subnet1_cidr}"
  availability_zone_id  = "${local.subnet1_zone_id}"

  tags = {
    Name = "${local.tmpname}-Private-01"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id                = "${aws_vpc.virtualPrivateCloud.id}"
  cidr_block            = "${local.subnet2_cidr}"
  availability_zone_id  = "${local.subnet2_zone_id}"

  tags = {
    Name = "${local.tmpname}-Private-02"
  }
}