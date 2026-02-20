variable "quick_connects" {
  type        = any
  default     = {}
  description = <<-EOF
A map of Amazon Connect Quick Connect.

The key of the map is the Quick Connect `name`. The value is the configuration for that Quick Connect, supporting all arguments [documented here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/connect_quick_connect) (except `name` which is the key, and `instance_id` which is created or passed in).

Example/available options:
```
{
  <quick_connect_name> = {
    description          = optional(string)
    quick_connect_config = {
      quick_connect_type = string
      phone_config = optional({
        phone_number = string
      })
      queue_config = optional({
        contact_flow_id = string
        queue_id        = string
      })
      user_config  = optional({
        contact_flow_id = string
        queue_id        = string
      })
    })
  }
}
```
  EOF
}

variable "quick_connect_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to all Quick Connect resources."
}

variable "instance_id" {
  type        = string
  description = "The ID of the Amazon Connect instance."
}