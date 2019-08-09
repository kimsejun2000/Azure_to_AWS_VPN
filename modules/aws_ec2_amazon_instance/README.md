# Module 설명

## INPUT

- aws_location: EC2를 생성할 지역. 기본 값 - ap-northeast-2
- tmpname: 생성되는 리소스의 이름 앞에 올 값. 필수
- aws_vpc_id: 생성 할 EC2의 VPC ID. 필수
- aws_subnet_id: 생성 할 EC2의 Subnet ID. 필수
- aws_key_name: 생성 할 EC2의 Key name 값. 생성되어 있는 값을 입력해야 함. 필수
- aws_ec2_type: 생성 할 EC2의 Type 값. 기본 값 - t3.nano

## MAIN

- EC2: Ubuntu 18.04로 생성
- Security Group: Port 22 Any Open

## OUTPUT

- aws_ec2_instance_id: 생성된 EC2 Instance ID
- aws_ec2_instance_name: 생성된 EC2 Instance Name
- aws_private_ip: 생성된 EC2 Private IP
- aws_security_group_id: 생성된 EC2 Security Group ID
