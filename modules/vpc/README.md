## Summary

Module to Create VPC resources

## Usage

```
module "vpc" {
  source = "../modules/vpc"

  region                  = var.region
  environment             = var.environment
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch
  public_cidr_a           = var.public_cidr_a
  public_cidr_b           = var.public_cidr_b
  private_cidr_a          = var.private_cidr_a
  private_cidr_b          = var.private_cidr_b
  data_cidr_a             = var.data_cidr_a
  data_cidr_b             = var.data_cidr_b
  tags                    = local.tags

}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | The AWS region the state should reside in. | `string` | n/a | yes |
| environment | The name of the environment, e.g. Production, Development, etc. | `string` | `Development` | no |
| vpc\_name | VPC Name. | `string` | n/a | yes |
| vpc\_cidr | VPC CIDR block. | `string` | n/a | yes |
| map\_public\_ip\_on\_launch | Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false. | `bool` | `false` | no |
| public\_cidr\_a | Public CIDR block A. | `string` | n/a | yes |
| public\_cidr\_b | Public CIDR block B. | `string` | n/a | yes |
| private\_cidr\_a | Private CIDR block A. | `string` | n/a | yes |
| private\_cidr\_b | Private CIDR block B. | `string` | n/a | yes |
| data\_cidr\_a | Data CIDR block A. | `string` | n/a | yes |
| data\_cidr\_b | Data CIDR block B. | `string` | n/a | yes |
| tags | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the Production VPC. |
| public\_subnet\_a\_id | The ID of the Public Subnet A. |
| public\_subnet\_b\_id | The ID of the Public Subnet B. |
| private\_subnet\_a\_id | The ID of the Private Subnet A. |
| private\_subnet\_b\_id | The ID of the Private Subnet B. |
| data\_subnet\_a\_id | The ID of the Data Subnet A. |
| data\_subnet\_b\_id | The ID of the Data Subnet B. |
| public\_subnets | List of IDs of public subnets. |
| private\_subnets | List of IDs of private subnets. |
| data\_subnets | List of IDs of data subnets. |
