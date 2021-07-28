## Summary

Terraform code to create a pipeline that builds a container via codebuild and pushes it to an ECR repo

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_account\_id | (Required) AWS Account ID. | string | n/a | yes |
| region | (Required) Region where resources will be created. | string | `ap-southeast-2` | yes |
| environment | (Optional) The name of the environment, e.g. Production, Development, etc. | string | `Development` | yes |

## Inputs for GitHub-ECR Pipeline

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name associated with the pipeline and assoicated resources. ie: app-name | string | n/a | yes |
| ecr\_name | The name of the ECR repo | string | n/a | yes |
| github\_repo\_owner | The owner of the GitHub repo | string | n/a | yes |
| github\_repo\_name | The name of the GitHub repository | string | n/a | yes |
| github\_oauth\_token | GitHub oauth token | string | n/a | yes |
| github\_branch\_name | The git branch name to use for the codebuild project | string | `"master"` | no |
| buildspec | The name of the buildspec file to use | string | buildspec.yml | no |
| codebuild\_image | The codebuild image to use | string | `"null"` | no |
| tags | A mapping of tags to assign to the resource | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| artifact\_bucket\_arn | The ARN of the Artifact bucket. |
| artifact\_bucket\_id | The name of the Artifact bucket. |
| codebuild\_project\_arn | ARN of the CodeBuild project. |
| codebuild\_project\_id | ARN of the CodeBuild project. |
| codepipeline\_arn | The codepipeline ARN. |
| codepipeline\_id | The codepipeline ID. |
