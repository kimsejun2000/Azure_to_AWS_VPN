# Module 설명

## INPUT

- azure_location: 생성 할 Virtual Network 지역. 기본 값 - koreacentral
- tmpname: 생성되는 리소스의 이름 앞에 올 값. 필수
- azure_resource_group_name: 생성 할 Virtual Network의 Resource group 이름. 필수
- azure_vnet_cidr: 생성 될 Virtual Network의 CIDR. 기본 값 - 10.0.0.0/16
- azure_subnet_cidr: 생성 될 Subnet의 CIDR. 기본 값 - 10.0.0.0/24
- azure_gateway_subnet_cidr: 생성 될 GatewaySubnet의 CIDR. 기본 값 - 10.0.254.0/24

## MAIN

- Virtual Network: 설정 된 CIDR을 이용하여 Virtual Network 생성
- Subnet: 생성 된 vNet에 Subnet 생성
- GatewaySubnet: 생성 된 vNet에 GatewaySubnet 생성

## OUTPUT

- azure_vnet_id: 생성 된 virtual network ID
- azure_vnet_name: 생성 된 virtual network Name
- azure_vnet_cidr: 생성 된 virtual network CIDR
- azure_vnet_subnet_id: 생성 된 Subnet ID
- azure_vnet_subnet_cidr: 생성 된 Subnet CIDR
- azure_vnet_gateway_subnet_id: 생성 된 GatewaySubnet ID
- azure_vnet_gateway_subnet_cidr: 생성 된 GatewaySubnet CIDR
