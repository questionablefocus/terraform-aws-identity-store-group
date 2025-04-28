# terraform-aws-identity-store-group

A basic cosmetic Terraform module wrapping `aws_identitystore_group` and `aws_ssoadmin_account_assignment`.

## Features

- Cleaner interface to assign permission sets to AWS accounts under a group

## Examples

### Basic configuration

```hcl
locals {
  identity_store_id = tolist(data.aws_ssoadmin_instances.all.identity_store_ids)[0]
  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.all.arns)[0]
}

module "example_group" {
  source  = "questionablefocus/identity-store-group/aws"
  version = "1.0.0"

  display_name      = "Example"
  identity_store_id = local.identity_store_id
  sso_instance_arn  = local.sso_instance_arn
}
```

### Assign permission sets to AWS accounts

```hcl
locals {
  identity_store_id = tolist(data.aws_ssoadmin_instances.all.identity_store_ids)[0]
  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.all.arns)[0]
}

module "example_group" {
  source  = "questionablefocus/identity-store-group/aws"
  version = "1.0.0"

  display_name      = "Example"
  identity_store_id = local.identity_store_id
  sso_instance_arn  = local.sso_instance_arn

  account_assignments = [
    {
      permission_set_arn = aws_ssoadmin_permission_set.example.arn
      account_id         = aws_organizations_account.example.id
    }
  ]
}
```
