variable "aws_location" {
  type          = "string"
  description   = "aws location"
  default       = "ap-northeast-2"
}

variable "tmpname" {
  type          = "string"
  description   = "Name prifix"
}

variable "aws_vpc_id" {
  type          = "string"
  description   = "VPC ID"
}

variable "aws_route_table_id" {
  type          = "string"
  description   = "Route Table ID"
}

locals {
  location        = "${var.aws_location}"
  tmpname         = "${var.tmpname}"
  vpc_id          = "${var.aws_vpc_id}"
  rt_id           = "${var.aws_route_table_id}"
}