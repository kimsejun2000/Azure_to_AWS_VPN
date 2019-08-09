variable "aws_location" {
  type          = "string"
  description   = "aws location"
  default       = "ap-northeast-2"
}

variable "tmpname" {
  type          = "string"
  description   = "Name prifix"
}

variable "aws_vpc_cidr" {
  type          = "string"
  description   = "VPC cidr"
  default       = "10.10.0.0/16"
}

variable "aws_subnet1_cidr" {
  type          = "string"
  description   = "subnet1 cidr"
  default       = "10.10.0.0/24"
}

variable "aws_subnet2_cidr" {
  type          = "string"
  description   = "subnet1 cidr"
  default       = "10.10.1.0/24"
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  location        = "${var.aws_location}"
  tmpname         = "${var.tmpname}"
  vpc_cidr        = "${var.aws_vpc_cidr}"
  subnet1_cidr    = "${var.aws_subnet1_cidr}"
  subnet2_cidr    = "${var.aws_subnet2_cidr}"
  subnet1_zone_id = "${data.aws_availability_zones.available.zone_ids[0]}"
  subnet2_zone_id = "${data.aws_availability_zones.available.zone_ids[1]}"
}