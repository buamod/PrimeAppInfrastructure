## Summary

Terraform module to create RDS resources.

## Usage

```
module "rds" {
  source = "../../modules/rds"

  database_name   = var.database_name
  master_username = var.master_username
  engine          = var.engine
  engine_version  = var.engine_version
  rds_name        = var.rds_name
  rds_count       = var.rds_count
  instance_class  = var.instance_class
  environment     = var.environment
  rds_sg_id       = module.security_groups.rds_sg_id
  DB_subnetA      = module.vpc.data_subnet_a_id
  DB_subnetB      = module.vpc.data_subnet_b_id
  region          = var.region

  depends_on = [module.vpc]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | The name of the environment. | `string` | `""` | yes |
| rds\_sg\_id | The ID of the RDS Security Group. | `string` | `""` | yes |
| region | The region for the DB to be deployed in. | `string` | `""` | yes |
| DB\_subnetA | DB subnet A. | `string` | `""` | yes |
| DB\_subnetB | DB subnet B. | `string` | `""` | yes |
| rds\_count | Number of RDS instances to deploy. | `number` | `""` | yes |
| rds\_name | Name of the RDS cluster. | `string` | `""` | yes |
| database\_name | Database Name. | `string` | `""` | yes |
| master\_username | Master Username for the Database. | `string` | `""` | yes |
| engine | Database Engine to use. | `string` | `""` | yes |
| engine\_version | Database Engine version to use. | `string` | `""` | yes |
| instance\_class | Database Instance class to use. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| rds\_cluster\_id | The RDS Cluster Identifier. |
