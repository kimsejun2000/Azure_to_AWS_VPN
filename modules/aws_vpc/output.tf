output "aws_vpc_id" {
  value = "${aws_vpc.virtualPrivateCloud.id}"
}

output "aws_vpc_cidr" {
  value = "${aws_vpc.virtualPrivateCloud.cidr_block}"
}

output "aws_vpc_default_network_acl_id" {
  value = "${aws_vpc.virtualPrivateCloud.default_network_acl_id}"
}

output "aws_vpc_default_security_group_id" {
  value = "${aws_vpc.virtualPrivateCloud.default_security_group_id}"
}

output "aws_vpc_default_route_table_id" {
  value = "${aws_vpc.virtualPrivateCloud.default_route_table_id}"
}

output "aws_subnet1_id" {
  value = "${aws_subnet.private-subnet-1.id}"
}

output "aws_subnet1_cidr" {
  value = "${aws_subnet.private-subnet-1.cidr_block}"
}

output "aws_subnet1_az" {
  value = "${aws_subnet.private-subnet-1.availability_zone}"
}

output "aws_subnet2_id" {
  value = "${aws_subnet.private-subnet-2.id}"
}

output "aws_subnet2_cidr" {
  value = "${aws_subnet.private-subnet-2.cidr_block}"
}

output "aws_subnet2_az" {
  value = "${aws_subnet.private-subnet-2.availability_zone}"
}