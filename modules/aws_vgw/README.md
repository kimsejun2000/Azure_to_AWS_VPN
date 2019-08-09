# Module 설명

## INPUT

- aws_location: VGW를 생성할 지역. 기본 값 - ap-northeast-2
- tmpname: 생성되는 리소스의 이름 앞에 올 값. 필수
- aws_vpc_id: 생성 할 EC2의 VPC ID. 필수
- aws_route_table_id: 생성 할 EC2의 Route Table ID. 필수

## MAIN

- Virtual Gateway: VGW 생성 후 VPC와 Route Table에 연결

## OUTPUT

- aws_vgw_id: 생성된 VGW ID
