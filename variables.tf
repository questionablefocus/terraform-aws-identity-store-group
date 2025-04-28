variable "identity_store_id" {
  description = "The ID of the Identity Store where the group will be created"
  type        = string
}

variable "display_name" {
  description = "The display name of the group"
  type        = string
}

variable "sso_instance_arn" {
  description = "The ARN of the SSO instance"
  type        = string
}

variable "account_assignments" {
  description = "List of account assignments for the group. Each assignment requires a permission set ARN and target account ID"
  type = list(object({
    permission_set_arn = string
    account_id         = string
  }))
  default = []
}
