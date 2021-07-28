## Summary

Terraform code to create ECR resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_account\_id | (Required) AWS Account ID. | string | n/a | yes |
| region | (Required) Region where resources will be created. | string | `ap-southeast-2` | yes |
| environment | (Optional) The name of the environment, e.g. Production, Development, etc. | string | `Development` | yes |

## Inputs for ECR module

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| encryption\_type | The encryption type to use for the repository. Valid values are `AES256` or `KMS` | `string` | `"AES256"` | no |
| image\_scanning\_configuration | Configuration block that defines image scanning configuration for the repository. By default, image scanning must be manually triggered. See the ECR User Guide for more information about image scanning. | `map` | `{}` | no |
| image\_tag\_mutability | The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`. | `string` | `"MUTABLE"` | no |
| kms\_key | The ARN of the KMS key to use when encryption\_type is `KMS`. If not specified when encryption\_type is `KMS`, uses a new KMS key. Otherwise, uses the default AWS managed key for ECR. | `string` | n/a | no |
| lifecycle\_policy | Manages the ECR repository lifecycle policy | `string` | n/a | yes |
| name | Name of the repository. | `string` | n/a | yes |
| policy | Manages the ECR repository policy | `string` | n/a | yes |
| scan\_on\_push | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). | `bool` | `true` | no |
| tags | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| timeouts | Timeouts map. | `map` | `{}` | no |
| timeouts\_delete | How long to wait for a repository to be deleted. | `string` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| ecr\_arn | Full ARN of the repository |
| ecr\_name | The name of the repository. |
| ecr\_registry\_id | The registry ID where the repository was created. |
| ecr\_repository\_url | The URL of the repository (in the form `aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName`) |
