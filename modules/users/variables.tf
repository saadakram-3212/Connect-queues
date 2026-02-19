variable "users" {
  type        = any
  default     = {}
  description = <<-EOF
A map of Amazon Connect Users.

The key of the map is the User `name`. The value is the configuration for that User, supporting all arguments [documented here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/connect_user) (except `name` which is the key, and `instance_id` which is created or passed in).

Example/available options:
```
{
  <user_name> = {
    directory_user_id  = optional(string)
    hierarchy_group_id = optional(string)
    identity_info = optional({
      email      = optional(string)
      first_name = optional(string)
      last_name  = optional(string)
    })
    password = optional(string)
    phone_config = {
      phone_type                    = string
      after_contact_work_time_limit = optional(number)
      auto_accept                   = optional(bool)
      desk_phone_number             = optional(string)
    }
    routing_profile_id   = string
    security_profile_ids = list(string)
    tags                 = optional(map(string))
  }
}
```
  EOF
}

variable "instance_id" {
  type        = string
  default     = null
  description = "If create_instance is set to false, you may still create other resources and pass in an instance ID that was created outside this module. Ignored if create_instance is true."
}

variable "user_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to all User resources."
}