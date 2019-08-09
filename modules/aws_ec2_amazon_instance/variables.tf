variable "aws_location" {
  type          = "string"
  description   = "AWS location"
  default       = "ap-northeast-2"
}

variable "tmpname" {
  type          = "string"
  description   = "Name prifix"
}

variable "aws_vpc_id" {
  type          = "string"
  description   = "AWS VPC ID"
}

variable "aws_subnet_id" {
  type          = "string"
  description   = "AWS Subnet ID"
}

variable "aws_key_name" {
  type          = "string"
  description   = "AWS Key pair name"
}

variable "aws_ec2_type" {
  type          = "string"
  description   = "AWS Key pair name"
  default       = "t3.nano"
}

locals {
  location        = "${var.aws_location}"
  tmpname         = "${var.tmpname}"
  vpc_id          = "${var.aws_vpc_id}"
  subnet_id       = "${var.aws_subnet_id}"
  key_name        = "${var.aws_key_name}"
  ec2_type        = "${var.aws_ec2_type}"
}