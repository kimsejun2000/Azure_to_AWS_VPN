provider "aws" {
  version    = "~> 2.0"
  region     = "${local.location}"
}

resource "aws_security_group" "securityGroup-SSH" {
  name        = "Linux_SSH_Allow"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${local.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "elasticCloudCompute" {
  ami                     = "${data.aws_ami.ubuntu.id}"
  instance_type           = "${local.ec2_type}"
  key_name                = "${local.key_name}"
  vpc_security_group_ids  = ["${aws_security_group.securityGroup-SSH.id}"]
  subnet_id               = "${local.subnet_id}"

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = {
    Name = "${local.tmpname}-client2"
  }
}