# Module 설명

## INPUT

- azure_location: 생성 된 Azure virtual network gateway 지역. 기본 값 - koreacentral
- aws_location: 생성 된 AWS virtual gateway 지역. 기본 값 - ap-northeast-2
- tmpname: 생성되는 리소스의 이름 앞에 올 값. 필수
- azure_resource_group_name: 생성 된 Azure virtual network gateway의 Resource group 이름. 필수
- azure_vnet_cidr: Azure virtual network의 CIDR. 필수
- azure_vpngw_id: 생성 된 Azure virtual network gateway ID. 필수
- azure_vpngw_ip: 생성 된 Azure virtual network gateway Public IP. 필수
- aws_vpc_cidr: 생성 된 AWS VPC CIDR. 필수
- aws_vgw_id: 생성 된 AWS Virtual Gateway ID. 필수

## MAIN

- AWS Customer Gateway: Azure virtual network gateway장비 기준 CGW 생성
- AWS Site-to-Site VPN Connection: Azure와 연결 할 VPN 장비 생성
- Azure Local Network Gateway: AWS VPN Connection으로 생성 된 장비 기준 LGW 생성
- Azure Connection: AWS VPN Connection 장비와 VPN 연결

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
