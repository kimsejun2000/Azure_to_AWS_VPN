# Azure와 AWS간 VPN 연결 (Terraform)

안녕하세요.

Azure와 AWS를 VPN으로 연결하는 것에 대한 Terraform 자료를 공유합니다.
많은 분들께서 삽질하지 않고 사용할 수 있으면 좋겠습니다.

## 왜 만들었는가

최근 Azure 강의를 하다보니 Azure로만 구성하기 애매한 서비스를 이야기 할 때 AWS 리소스를 가지고 설명하곤 합니다. 그 중 대표적인 리소스가 바로 VPN Gateway인데요. Azure VPN을 설명할 때 실제로 연결을 구현해야 하다 보니 AWS VPN Connection을 이용하곤 합니다. 그러던 와중에 매번 강의할 때 마다 1시간씩 투자하여 리소스를 만들고 기다리고 설정하기 너무 귀찮은데다 자주 사용할 것 같아 스크립트로 짜보았습니다. 각 서비스의 CLI를 사용해볼까 했다가 Terraform이라는 멋진 솔루션이 있어 Terraforming을 해보았습니다.

## 사용 방법

기본적으로 Terraform을 사용할 줄 안다는 전제로 이야기를 풀어가겠습니다. 우선 Terraform을 실행하기 전에 Azure CLI와 AWS CLI가 설치되어 있어야 합니다.

1. Azure CLI를 통해 인증권한을 얻습니다.

    ```AzureCLI
    az login
    ```

2. AWS CLI를 통해 인증권한을 얻습니다.

    ```AWSCLI
    aws configure
    ```

3. git 명령어를 통해 만들어둔 Terraform 자료를 다운로드 받는다.

    ```GitCLI
    got clone
    ```

4. 다음 terraform 명령어를 이용하여 유효성 검사를 실행한다.

    ```terraform
    terraform init
    terraform plan -var 'name_prifix=<NAME PRIFIX>' -var 'azure_location=<AZURE LOCATION>' -var 'aws_location=<AWS LOCATION>' -var 'azure_rg_name=<RESOURCE GROUP NAME>' -var 'aws_key_name=<AWS KEY NAME>'
    ```

5. 유효성검사가 정상적으로 끝나면 다음 명령어를 실행하여 리소스를 배포한다.

    ```terraform
    terraform apply -auto-approve -var 'name_prifix=<NAME PRIFIX>' -var 'azure_location=<AZURE LOCATION>' -var 'aws_location=<AWS LOCATION>' -var 'azure_rg_name=<RESOURCE GROUP NAME>' -var 'aws_key_name=<AWS KEY NAME>'
    ```

6. (옵션) 리소스를 지울 시 다음 명령어를 사용하여 생성된 리소스를 삭제한다.

    ```terraform
    terraform destroy -auto-approve -var 'name_prifix=<NAME PRIFIX>' -var 'azure_location=<AZURE LOCATION>' -var 'aws_location=<AWS LOCATION>' -var 'azure_rg_name=<RESOURCE GROUP NAME>' -var 'aws_key_name=<AWS KEY NAME>'
    ```

## 마무리

실제 repo를 보신 분들은 아시겠지만 가볍게 Azure에 VM 1개, AWS에 VM 1개를 띄워놓고 서로 통신을 해볼 수 있는 간단한 샘플입니다. 이를 수정하여 조작할 수 있게 약간의 모듈화도 진행되어 있으며, 각 모듈에 대한 설명을 끝으로 마무리 합니다.

- aws_ec2_amazon_instance: AWS에 Amazon Linux를 생성한다.
- aws_vgw: AWS VPC에 Virtual Gateway를 생성하고 VPC와 Route Table에 연결한다.
- aws_vpc: AWS VPC에서 VPC와 Subnet을 생성한다.
- azure_to_aws_vpn: Azure Virtual Netowrk Gateway와 AWS Site-to-Site VPN Connections를 연결한다.
- azure_ubuntu_vm: Azure에 Ubuntu VM을 생성한다.
- azure_virtual_network: Azure Virtual Network를 생성한다.
- azure_vpn_gateway: Azure Virtual Network Gateway를 생성한다.

아쉬운 점은 현재 다음 이슈로 인해 Azure Virtual Network Gateway생성 도중 [이슈가 발생](https://github.com/hashicorp/go-azure-helpers/issues/22?fbclid=IwAR1_XIZC0TtrcpP5a2GUVUiGkDwDl3pqGOy4VQK3GvB9qAb1zf4athazOkA)합니다. 이 때 Virtual Network Gateway가 생성이 완료된 후 다시 한번 terraform apply를 실행하면 작업이 완료됩니다.

모두 Azure로운 하루 되세요!
