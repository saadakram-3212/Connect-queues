variable "instance_id" {
  type        = string
  default     = null
  description = "If create_instance is set to false, you may still create other resources and pass in an instance ID that was created outside this module. Ignored if create_instance is true."
}

variable "security_profiles" {
  type        = any
  default     = {}
  description = <<-EOF
A map of Amazon Connect Security Profile.

The key of the map is the Security Profile `name`. The value is the configuration for that Security Profile, supporting all arguments [documented here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/connect_security_profile) (except `name` which is the key, and `instance_id` which is created or passed in).

Example/available options:
```
{
  <security_profile_name> = {
    description = optional(string)
    permissions = optional(list(string))
    tags        = optional(map(string))
  }
}
```
  EOF
}

variable "security_profile_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to all Security Profile resources."
}