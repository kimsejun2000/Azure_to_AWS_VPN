# Module 설명

## INPUT

- azure_location: 생성 할 Azure VM 지역. 기본 값 - koreacentral
- tmpname: 생성되는 리소스의 이름 앞에 올 값. 필수
- azure_resource_group_name: 생성 할 VM의 Resource group 이름. 필수
- azure_subnet_id: Azure VM이 생성 될 Subnet ID. 필수
- azure_virtual_machine_size: 생성 될 Azure VM의 Size. 기본 값 - Standard_B1ls
- azure_vmadmin_account: 생성 될 Azure VM의 로그인 계정. 기본 값 - vmadmin
- azure_vmadmin_password: 생성 될 Azure VM의 로그인 비밀번호. 기본 값 - Pa55w.rd1234
- azure_managed_disk_redundancy: 생성 될 Azure VM에 연결 할 Managed Disk 복제 정책. 기본 값 - Standard_LRS

## MAIN

- Azure Public IP: VM에 연결 될 Public IP 를 Dynamic IP로 생성
- Azure Network Interface: VM에 연결 될 NIC 생성
- Azure Virtual Machine: VM 생성. ubuntu 18.04로 생성. managed disk 사용

## OUTPUT

- azure_vm_id: 생성 된 VM ID
- azure_vm_name: 생성 된 VM Name
- azure_vm_public_ip_id: 생성 된 VM Public IP ID
- azure_vm_public_ip_name: 생성 된 VM Public IP Name
- azure_vm_public_ip_address: 생성 된 VM Public IP 주소
- azure_vm_private_ip_address: 생성 된 VM Private IP 주소
