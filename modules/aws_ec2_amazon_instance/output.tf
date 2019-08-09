output "aws_ec2_instance_id" {
  value = "${aws_instance.elasticCloudCompute.id}"
}

output "aws_ec2_instance_name" {
  value = "${local.tmpname}-client2"
}

output "aws_private_ip" {
  value = "${aws_instance.elasticCloudCompute.private_ip}"
}

output "aws_security_group_id" {
  value = "${aws_security_group.securityGroup-SSH.id}"
}