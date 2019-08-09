# Module 설명

## INPUT

- azure_location: 생성 할 Virtual Network Gateway 지역. 기본 값 - koreacentral
- tmpname: 생성되는 리소스의 이름 앞에 올 값. 필수
- azure_resource_group_name: 생성 할 Virtual Network Gateway의 Resource group 이름. 필수
- azure_vpn_sku: 생성 될 Virtual Network Gateway의 sku. 기본 값 - VpnGw1
- azure_gateway_subnet_id: Virtual Network Gateway가 생성 될 Subnet ID. 필수
- azure_ptos_vpn_cidr: Virtual Network Gateway에 P2S 설정을 위한 CIDR. 기본 값 - 10.0.254.0/24
- azure_ptos_root_cert: Virtual Network Gateway에 P2S 설정을 위한 Key. 기본 값 - [링크 참고](https://docs.microsoft.com/ko-kr/azure/vpn-gateway/vpn-gateway-certificates-point-to-site)

## MAIN

- Gateway Public IP: Gateway에 연결 될 Public IP 생성
- Gateway: Gateway 생성. P2S 설정

## OUTPUT

- azure_vpngw_id: 생성 된 virtual network ID
- azure_vpngw_name: 생성 된 virtual network Name
- azure_vpngw_ip: 생성 된 virtual network CIDR
