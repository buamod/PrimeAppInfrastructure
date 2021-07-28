## Summary

Terraform code to create VPC, SGs, ALB, ECS fargate resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_account\_id | (Required) AWS Account ID. | string | n/a | yes |
| region | (Required) Region where resources will be created. | string | `ap-southeast-2` | yes |
| environment | (Optional) The name of the environment, e.g. Production, Development, etc. | string | `Development` | yes |

## Inputs for VPC

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpc\_name | (Required) VPC Name. | string | n/a | yes |
| vpc\_cidr | (Required) VPC CIDR block. | string | n/a | yes |
| map\_public\_ip\_on\_launch | (Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false. | string | `false` | yes |
| public\_cidr\_a | (Required) Public CIDR block A. | string | n/a | yes |
| public\_cidr\_b | (Required) Public CIDR block B. | string | n/a | yes |
| private\_cidr\_a | (Required) Private CIDR block A. | string | n/a | yes |
| private\_cidr\_b | (Required) Private CIDR block B. | string | n/a | yes |

## Inputs for Security Groups

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc\_id | VPC id where the load balancer and other resources will be deployed. | `string` | `null` | yes |
| source\_address | (Optional) The address to allow to communicate with ALB. | `string` | `0.0.0.0/0` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Inputs for ALB

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_logs | Map containing access logging configuration for load balancer. | `map(string)` | `{}` | no |
| create\_lb | Controls if the Load Balancer should be created | `bool` | `true` | no |
| drop\_invalid\_header\_fields | Indicates whether invalid header fields are dropped in application load balancers. Defaults to false. | `bool` | `false` | no |
| enable\_cross\_zone\_load\_balancing | Indicates whether cross zone load balancing should be enabled in application load balancers. | `bool` | `false` | no |
| enable\_deletion\_protection | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false. | `bool` | `false` | no |
| enable\_http2 | Indicates whether HTTP/2 is enabled in application load balancers. | `bool` | `true` | no |
| extra\_ssl\_certs | A list of maps describing any extra SSL certificates to apply to the HTTPS listeners. Required key/values: certificate\_arn, https\_listener\_index (the index of the listener within https\_listeners which the cert applies toward). | `list(map(string))` | `[]` | no |
| http\_tcp\_listeners | A list of maps describing the HTTP listeners or TCP ports for this ALB. Required key/values: port, protocol. Optional key/values: target\_group\_index (defaults to http\_tcp\_listeners[count.index]) | `any` | `[]` | no |
| https\_listener\_rules | A list of maps describing the Listener Rules for this ALB. Required key/values: actions, conditions. Optional key/values: priority, https\_listener\_index (default to https\_listeners[count.index]) | `any` | `[]` | no |
| https\_listeners | A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate\_arn. Optional key/values: ssl\_policy (defaults to ELBSecurityPolicy-2016-08), target\_group\_index (defaults to https\_listeners[count.index]) | `any` | `[]` | no |
| idle\_timeout | The time in seconds that the connection is allowed to be idle. | `number` | `60` | no |
| internal | Boolean determining if the load balancer is internal or externally facing. | `bool` | `false` | no |
| ip\_address\_type | The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack. | `string` | `"ipv4"` | no |
| lb\_tags | A map of tags to add to load balancer | `map(string)` | `{}` | no |
| listener\_ssl\_policy\_default | The security policy if using HTTPS externally on the load balancer. [See](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html). | `string` | `"ELBSecurityPolicy-2016-08"` | no |
| load\_balancer\_create\_timeout | Timeout value when creating the ALB. | `string` | `"10m"` | no |
| load\_balancer\_delete\_timeout | Timeout value when deleting the ALB. | `string` | `"10m"` | no |
| load\_balancer\_type | The type of load balancer to create. Possible values are application or network. | `string` | `"application"` | no |
| load\_balancer\_update\_timeout | Timeout value when updating the ALB. | `string` | `"10m"` | no |
| name | The resource name and Name tag of the load balancer. | `string` | `null` | no |
| name\_prefix | The resource name prefix and Name tag of the load balancer. Cannot be longer than 6 characters | `string` | `null` | no |
| security\_groups | The security groups to attach to the load balancer. e.g. ["sg-edcd9784","sg-edcd9785"] | `list(string)` | `[]` | no |
| subnet\_mapping | A list of subnet mapping blocks describing subnets to attach to network load balancer | `list(map(string))` | `[]` | no |
| subnets | A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f'] | `list(string)` | `null` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| target\_group\_tags | A map of tags to add to all target groups | `map(string)` | `{}` | no |
| target\_groups | A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend\_protocol, backend\_port | `any` | `[]` | no |
| vpc\_id | VPC id where the load balancer and other resources will be deployed. | `string` | `null` | no |

## Inputs for ECS

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the app. | `string` | n/a | yes |
| private\_subnets | The IDs of the Private Subnets. | `list(any)` | n/a | yes |
| ecs\_sg\_id | The Security Group ID for ECS. | `string` | n/a | yes |
| target\_group\_arn | The ARN of the Target Group. | `string` | n/a | yes |
| tags | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| container\_name | The name of the container. | `string` | n/a | yes |
| container\_port | The Port number for the container to use. | `number` | n/a | yes |
| desired\_count | Desired number of tasks to run. | `number` | `1` | no |
| memory | The amount (in MiB) of memory used by the task. | `string` | `1024` | no |
| cpu | The number of cpu units used by the task. | `string` | `512` | no |
| task\_role\_arn | The ARN for the ECS task role. | `string` | n/a | yes |
| execution\_role\_arn | The ARN for the ECS task execution role. | `string` | n/a | yes |
| container\_definitions | A list of valid container definitions provided as a single valid JSON document. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC. |
| private\_subnets | List of IDs of private subnets. |
| public\_subnets | List of IDs of public subnets. |
| data\_subnets | List of IDs of data subnets. |
| alb\_sg\_id | The ID of the ALB Security Group. |
| ecs\_sg\_id | The ID of the ECS Security Group. |
| rds\_sg\_id | The ID of the RDS Security Group. |
| http\_tcp\_listener\_arns | The ARN of the TCP and HTTP load balancer listeners created. |
| http\_tcp\_listener\_ids | The IDs of the TCP and HTTP load balancer listeners created. |
| https\_listener\_arns | The ARNs of the HTTPS load balancer listeners created. |
| https\_listener\_ids | The IDs of the load balancer listeners created. |
| target\_group\_arn\_suffixes | ARN suffixes of our target groups - can be used with CloudWatch. |
| target\_group\_arns | ARNs of the target groups. Useful for passing to your Auto Scaling group. |
| target\_group\_attachments | ARNs of the target group attachment IDs. |
| target\_group\_names | Name of the target group. Useful for passing to your CodeDeploy Deployment Group. |
| this\_lb\_arn | The ID and ARN of the load balancer we created. |
| this\_lb\_arn\_suffix | ARN suffix of our load balancer - can be used with CloudWatch. |
| this\_lb\_dns\_name | The DNS name of the load balancer. |
| this\_lb\_id | The ID and ARN of the load balancer we created. |
| this\_lb\_zone\_id | The zone\_id of the load balancer to assist with creating DNS records. |
| ecs\_task\_execution\_role\_arn | The ARN for the ECS task execution role. |
| ecs\_task\_role\_arn | The ARN for the ECS task role. |
| ecs\_cluster\_arn | The Amazon Resource Name (ARN) that identifies the cluster. |
| ecs\_service\_cluster | Amazon Resource Name (ARN) of cluster which the service runs on. |
| ecs\_service\_id | ARN that identifies the service. |
| ecs\_service\_name | Name of the service. |
| ecs\_td\_arn | Full ARN of the Task Definition (including both family and revision) |
| ecs\_td\_family | The family of the Task Definition. |
| ecs\_td\_revision | The revision of the Task Definition. |
