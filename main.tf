resource "aws_identitystore_group" "main" {
  identity_store_id = var.identity_store_id
  display_name      = var.display_name
}

resource "aws_ssoadmin_account_assignment" "main" {
  for_each = { for idx, assignment in var.account_assignments : idx => assignment }

  instance_arn       = var.sso_instance_arn
  permission_set_arn = each.value.permission_set_arn
  principal_id       = aws_identitystore_group.main.group_id
  principal_type     = "GROUP"
  target_id          = each.value.account_id
  target_type        = "AWS_ACCOUNT"
}
