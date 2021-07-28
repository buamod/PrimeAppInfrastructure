variable "name" {
  type        = string
  description = "(Required) The name of the codebuild project and artifact bucket"
}

variable "deploy_type" {
  type        = string
  description = "(Required) Must be one of the following ( ecr, ecs, lambda )"
}

variable "ecr_name" {
  type        = string
  description = "(Optional) The name of the ECR repo. Required if var.deploy_type is ecr or ecs"
  default     = null
}

variable "codebuild_image" {
  type        = string
  description = "(Optional) The codebuild image to use"
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:1.0"
}

variable "build_compute_type" {
  type        = string
  description = "(Optional) build environment compute type"
  default     = "BUILD_GENERAL1_SMALL"
}

variable "buildspec" {
  type        = string
  description = "build spec file other than buildspec.yml"
  default     = "buildspec.yml"
}

variable "logs_retention_in_days" {
  type        = number
  description = "(Optional) Days to keep the cloudwatch logs for this codebuild project"
  default     = 14
}

variable "use_docker_credentials" {
  type        = bool
  description = "(Optional) Use dockerhub credentals stored in parameter store"
  default     = false
}
variable "env_repo_name" {
  type = object({
    variables = map(string)
  })
  default = null
}

variable "privileged_mode" {
  description = "set privileged_mode flag for docker container use"
  default     = false

}
variable "tags" {
  type        = map
  description = "(Optional) A mapping of tags to assign to the resource"
  default     = {}
}
