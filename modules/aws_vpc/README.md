# Module 설명

## INPUT

- aws_location: VPC를 생성할 지역. 기본 값 - ap-northeast-2
- tmpname: 생성되는 리소스의 이름 앞에 올 값. 필수
- aws_vpc_cidr: 생성 될 VPC CIDR. 기본 값 - 10.10.0.0/16
- aws_subnet1_cidr: 생성 될 Subnet1 CIDR. 기본 값 - 10.10.0.0/24
- aws_subnet2_cidr: 생성 될 Subnet2 CIDR. 기본 값 - 10.10.1.0/24

## MAIN

- VPC: 설정한 CIDR로 VPC 생성
- Subnet: 설정한 CIDR로 Subnet1, Subnet2 생성

## OUTPUT

- aws_vpc_id: 생성된 VPC ID
- aws_vpc_cidr: 생성된 VPC CIDR
- aws_vpc_default_network_acl_id: 생성된 Default ACL ID
- aws_vpc_default_security_group_id: 생성된 Default SG ID
- aws_vpc_default_route_table_id: 생성된 Default Route Table ID
- aws_subnet1_id: 생성된 Subnet1 ID
- aws_subnet1_cidr: 생성된 Subnet1 CIDR
- aws_subnet1_az: 생성된 Subnet1 AZ
- aws_subnet2_id: 생성된 Subnet2 ID
- aws_subnet2_cidr: 생성된 Subnet2 CIDR
- aws_subnet2_az: 생성된 Subnet2 AZ
